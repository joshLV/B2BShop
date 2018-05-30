package com.icbc.rtreq;

import com.icbc.CBCPayOnline;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2016/6/16.
 */
public class ICBC {

    private String interfaceName = "ICBC_PERBANK_B2C";
    // 1交易日期时间
    private String interfaceVersion = "1.0.0.11";

    // 1交易数据
    // 整合所有交易数据形成的xml明文串，并做BASE64编码；
    // 具体格式定义见下文；
    // 注意：
    // 需有xml头属性；整个字段使用BASE64编码；
    // xml明文中没有回车换行和多余空格；
    private String tranData;

    //  1订单签名数据
    //  必输，
    //  商户使用工行提供的签名API和商户证书将tranData的xml明文串进行签名，得到二进制签名数据，然后进行BASE64编码后得到可视的merSignMsg；
    //  注意：签名时是针对tranData的xml明文，不是将tranData进行BASE64编码后的串；
    private String merSignMsg;

    //  1商城证书公钥
    //  商户用二进制方式读取证书公钥文件后，进行BASE64编码后产生的字符串；
    private String merCert;

    public String getInterfaceName() {
        return interfaceName;
    }

    public void setInterfaceName(String interfaceName) {
        this.interfaceName = interfaceName;
    }

    public String getInterfaceVersion() {
        return interfaceVersion;
    }

    public void setInterfaceVersion(String interfaceVersion) {
        this.interfaceVersion = interfaceVersion;
    }

    public String getMerCert() {
        return merCert;
    }

    public void setMerCert(String merCert) {
        this.merCert = merCert;
    }

    public String getMerSignMsg() {
        return merSignMsg;
    }

    public void setMerSignMsg(String merSignMsg) {
        this.merSignMsg = merSignMsg;
    }

    public String getTranData() {
        return tranData;
    }

    public void setTranData(String tranData) {
        this.tranData = tranData;
    }

    public static void main(String[] args) {
        TranData tranData = new TranData();
        OrderInfo orderInfo = tranData.getOrderInfo();
        //商户ID
        orderInfo.setMerID("0200EC20001119");
        orderInfo.setOrderDate(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()));

        SubOrderInfo subInfo = new SubOrderInfo();
        subInfo.setOrderid("201003081416290");
        subInfo.setAmount("100");
        subInfo.setGoodsName("50jin订单");
        subInfo.setGoodsID("");
        subInfo.setGoodsName("测试订单");
        subInfo.setMerAcct("10011********017989");

        Message message = tranData.getMessage();
        message.setMerReference("localhost");
        message.setMerCustomIp("127.0.0.1");
        message.setMerCustomID("1001******4821");

        ICBC icbc = CBCPayOnline.getBase64ICBC(tranData);

    }
}
