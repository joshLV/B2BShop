package com.icbc;

import cn.com.infosec.icbc.ReturnValue;
import com.alibaba.dubbo.common.utils.StringUtils;
import com.icbc.rtrep.Bank;
import com.icbc.rtrep.Custom;
import com.icbc.rtrep.Extend;
import com.icbc.rtrep.NotifyData;
import com.icbc.rtreq.ICBC;
import com.icbc.rtreq.OrderInfo;
import com.icbc.rtreq.SubOrderInfo;
import com.icbc.rtreq.TranData;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.CompactWriter;
import com.thoughtworks.xstream.io.xml.DomDriver;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
import net.deepdragon.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.List;
import java.util.Map;

public class CBCPayOnline {
    private  static final Logger logger = LoggerFactory.getLogger(CBCPayOnline.class);
    private static String getBasePath() {
        String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))+"../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();
        if(path.indexOf(":") != 1){
            path = File.separator + path;
        }
        return path;
    }
    //校验返回数据
    public static boolean verifyNotify(String notifyData, String signMsg) {
        byte[] notifyDataB = ReturnValue.base64dec(notifyData.getBytes());
        byte[] signature = ReturnValue.base64dec(signMsg.getBytes());
        String bankCert = getBasePath() + ICBCConst.b2c_crtPath;
        try {
            FileInputStream f = new FileInputStream(bankCert);
            byte[] bs = new byte[f.available()];
            f.read(bs);
            f.close();
            int result = ReturnValue.verifySign(notifyDataB, notifyDataB.length, bs, signature);
            if (result == 0) {
                return true;
            }
        } catch (Exception e) {
//            e.printStackTrace();
            logger.error("工行B2C支付校验返回数据时报错："+e);
        }
        return false;
    }

    public static ICBC getBase64ICBC(TranData tranData) {
        XStream xStream = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));
        xStream.autodetectAnnotations(true);
        StringBuilder strXml = new StringBuilder();
        strXml.append("<?xml version=\"1.0\" encoding=\"GBK\" standalone=\"no\"?>");
        Writer writer = new StringWriter();
        xStream.marshal(tranData, new CompactWriter(writer));
        strXml.append(writer.toString());
        //strXml.append(xStream.toXML(tranData).replaceAll("\\s+",""));
        String xml = strXml.toString();
        logger.error("ICBC B2C支付XML：" + xml);
        logger.error("ICBC B2C支付明文：" + tranData);
        String password = ICBCConst.b2c_crtPasswd;
        String returnTransData = "";
        String returnSignMsg = "";
        String returnCert = "";
        try {
            byte[] byteSrc = xml.getBytes();
            char[] keyPass = password.toCharArray();

            FileInputStream in1 = new FileInputStream(ICBCConst.b2c_crtPath);
            byte[] bcert = new byte[in1.available()];
            in1.read(bcert);
            in1.close();
            FileInputStream in2 = new FileInputStream(ICBCConst.b2c_userKeyPath);
            byte[] bkey = new byte[in2.available()];
            in2.read(bkey);
            in2.close();

            byte[] sign = ReturnValue.sign(byteSrc, byteSrc.length, bkey, keyPass);
            if (sign == null) {
//                System.out.println("签名失败,签名返回为空。请检查证书私钥和私钥保护口令是否正确。");
                logger.error("ICBC B2C支付签名失败,签名返回为空。请检查证书私钥和私钥保护口令是否正确。");
            } else {
                logger.error("ICBC B2C支付签名成功。");

                byte[] transDataByte = ReturnValue.base64enc(xml.getBytes());
                String transDataBase64 = new String(transDataByte).toString();
//                System.out.println("XML明文BASE64编码：" + transDataBase64);

                byte[] EncSign = ReturnValue.base64enc(sign);
                String SignMsgBase64 = new String(EncSign).toString();
//                System.out.println("签名信息BASE64编码：" + SignMsgBase64);

                byte[] EncCert = ReturnValue.base64enc(bcert);
                String CertBase64 = new String(EncCert).toString();
//                System.out.println("证书公钥BASE64编码：" + CertBase64);

                byte[] DecSign = ReturnValue.base64dec(EncSign);
                if (DecSign != null) {
//                    System.out.println("签名信息BASE64解码成功");
                    logger.error("ICBC B2C支付签名信息BASE64解码成功");
                    byte[] DecCert = ReturnValue.base64dec(EncCert);
                    if (DecCert != null) {
//                        System.out.println("证书公钥BASE64解码成功");
                        logger.error("ICBC B2C支付证书公钥BASE64解码成功");
                        int a = ReturnValue.verifySign(byteSrc, byteSrc.length, DecCert, DecSign);
                        if (a == 0)
                            logger.error("ICBC B2C支付验签成功");
                        else
                            logger.error("ICBC B2C支付验签失败<br>验证返回码：" + a);
                    } else
                        logger.error("ICBC B2C支付证书BASE64解码失败");
                } else
                    logger.error("ICBC B2C支付签名信息BASE64解码失败");
                returnTransData = transDataBase64;
                returnSignMsg = SignMsgBase64;
                returnCert = CertBase64;
            }

        } catch (Exception e) {
            logger.error("工行B2C支付数据加密时报错："+e);
        }
        ICBC icbcModel = new ICBC();
        icbcModel.setTranData(returnTransData);
        icbcModel.setMerSignMsg(returnSignMsg);
        icbcModel.setMerCert(returnCert);
        return icbcModel;
    }

    public static NotifyData getNotifyData(String xml) {
        xml = new String(ReturnValue.base64dec(xml.getBytes()));
        XStream xs = new XStream();
        xs.autodetectAnnotations(true);
        xs.alias("B2CRes", NotifyData.class);
        xs.alias("orderInfo", OrderInfo.class);
       // xs.addImplicitArray(OrderInfo.class, "subOrderInfoList");
        xs.alias("subOrderInfo", SubOrderInfo.class);
        xs.alias("custom", Custom.class);
        xs.alias("bank", Bank.class);
        xs.alias("extend", Extend.class);
        return (NotifyData) xs.fromXML(xml);
    }

    public static void mer_Icbc20_signstr(Model model) {
        String[] fields = new String[]{"APIName", "APIVersion", "Shop_code", "MerchantURL", "ContractNo", "ContractAmt", "Account_cur", "JoinFlag", "SendType", "TranTime", "Shop_acc_num", "PayeeAcct"};

        Map map = model.asMap();
        StringBuilder sb = new StringBuilder();

        for(String key : fields) {
            sb.append("&").append(key).append("=").append(map.get(key));
        }
        sb.deleteCharAt(0);

        String password = ICBCConst.b2b_crtPasswd;
        String returnTransData = "";
        String returnSignMsg = "";
        String returnCert = "";
        String path = getBasePath();

        try {
            byte[] byteSrc = sb.toString().getBytes();
            char[] keyPass = password.toCharArray();

            FileInputStream in1 = new FileInputStream(ICBCConst.b2b_crtPath);
            byte[] bcert = new byte[in1.available()];
            in1.read(bcert);
            in1.close();
            FileInputStream in2 = new FileInputStream(ICBCConst.b2b_userKeyPath);
            byte[] bkey = new byte[in2.available()];
            in2.read(bkey);
            in2.close();

            byte[] sign = ReturnValue.sign(byteSrc, byteSrc.length, bkey, keyPass);
            if (sign == null) {
                logger.error("ICBC B2B支付签名失败,签名返回为空。请检查证书私钥和私钥保护口令是否正确。");
            } else {
                logger.error("ICBC B2B支付签名成功");

                byte[] transDataByte = ReturnValue.base64enc(sb.toString().getBytes());
                String transDataBase64 = new String(transDataByte).toString();
//                System.out.println("XML明文BASE64编码：" + transDataBase64);

                byte[] EncSign = ReturnValue.base64enc(sign);
                String SignMsgBase64 = new String(EncSign).toString();
//                System.out.println("签名信息BASE64编码：" + SignMsgBase64);

                byte[] EncCert = ReturnValue.base64enc(bcert);
                String CertBase64 = new String(EncCert).toString();
//                System.out.println("证书公钥BASE64编码：" + CertBase64);

                byte[] DecSign = ReturnValue.base64dec(EncSign);
                if (DecSign != null) {
//                    System.out.println("签名信息BASE64解码成功");
                    logger.error("ICBC B2B支付签名信息BASE64解码成功");
                    byte[] DecCert = ReturnValue.base64dec(EncCert);
                    if (DecCert != null) {
//                        System.out.println("证书公钥BASE64解码成功");
                        logger.error("ICBC B2B支付证书公钥BASE64解码成功");
                        int a = ReturnValue.verifySign(byteSrc, byteSrc.length, DecCert, DecSign);
                        if (a == 0)
                            logger.error("ICBC B2B支付验签成功");
                        else
                            logger.error("ICBC B2B支付验签失败<br>验证返回码：" + a);
                    } else
                        logger.error("ICBC B2B支付证书BASE64解码失败");
                } else
                    logger.error("ICBC B2B支付签名信息BASE64解码失败");
                returnTransData = transDataBase64;
                returnSignMsg = SignMsgBase64;
                returnCert = CertBase64;
            }

        } catch (Exception e) {
            logger.error("工行B2B支付数据加密时报错："+e);
        }
        model.addAttribute("Mer_Icbc20_signstr", returnSignMsg);
        model.addAttribute("Cert", returnCert);

    }

    //校验B2B返回数据
    public static boolean verifyB2BNotify(HttpServletRequest request) {
        String[] fields = new String[]{"APIName", "APIVersion", "Shop_code", "MerchantURL", "Serial_no","PayStatusZHCN","TranErrorCode","TranErrorMsg", "ContractNo", "ContractAmt", "Account_cur", "JoinFlag","ShopJoinFlag","CustJoinFlag","CustJoinNumber", "SendType", "TranTime", "NotifyTime","Shop_acc_num", "PayeeAcct","PayeeAcct","PayeeName"};
        StringBuilder sb = new StringBuilder();

        for(String key : fields) {
            sb.append("&").append(key).append("=").append(StringUtil.nullToEmpty(request.getParameter(key)));
        }
        sb.deleteCharAt(0);
        byte[] signByte = ReturnValue.base64dec(request.getParameter("NotifySign").getBytes());
        byte[] srcByte = ReturnValue.base64dec(sb.toString().getBytes());
        int a = 0;
        String bankCert = getBasePath() + ICBCConst.b2c_crtPath;
        try {
            FileInputStream f = new FileInputStream(bankCert);
            byte[] bs = new byte[f.available()];
            f.read(bs);
            f.close();
            int result = ReturnValue.verifySign(srcByte, srcByte.length, bs, signByte);
            if (result == 0) {
                return true;
            }
        } catch (Exception e) {
            logger.error("工行B2B支付校验返回数据时报错："+e);
        }
        return false;
    }
}
