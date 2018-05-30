package com.weixin.common;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XmlFriendlyNameCoder;
import com.thoughtworks.xstream.io.xml.XppDriver;
import com.weixin.protocol.AsynNotifyReqData;
import com.weixin.protocol.AsynNotifyResData;
import com.weixin.protocol.UnifiedorderReqData;
import com.weixin.protocol.UnifiedorderResData;

import java.io.Writer;
import java.lang.reflect.Field;

/**
 * Created by chris on 2016/3/14.
 */
public class XStreamUtil {
    protected static String PREFIX_CDATA = "<![CDATA[";
    protected static String SUFFIX_CDATA = "]]>";

    private static XStream xStreamCDATA;

    public static String objectToXml(Object xmlObj, Class[] classes) {

        XStream xStream = XStreamUtil.getXStreamCDATA();
//      XStream xStream = new XStream(new DomDriver("UTF-8", new XmlFriendlyNameCoder("-_", "_")));
        xStream.setMode(XStream.NO_REFERENCES);
        if (classes != null && classes.length > 0) {
            xStream.processAnnotations(classes);
        }

        //将要提交给API的数据对象转换成XML格式数据Post给API
        String postDataXML = xStream.toXML(xmlObj);

        return postDataXML;
    }

    public static Object getObjectFromXML(String xml, Class tClass) {
        //将从API返回的XML数据映射到Java对象
        XStream xStreamForResponseData = new XStream();

        xStreamForResponseData.alias("xml", tClass);
        xStreamForResponseData.ignoreUnknownElements();//暂时忽略掉一些新增的字段
        return xStreamForResponseData.fromXML(xml);
    }



    public static XStream getXStreamCDATA() {
        if( xStreamCDATA == null){
            xStreamCDATA = new XStream(new XppDriver() {
                @Override
                public HierarchicalStreamWriter createWriter(Writer out) {
                    //XmlFriendlyNameCoder("-_", "_")解决XStream对出现双下划线的bug
                    return new PrettyPrintWriter(out, new XmlFriendlyNameCoder("-_", "_")) {
                        boolean cdata = false;
                        Class<?> targetClass = null;

                        @Override
                        public void startNode(String name, Class clazz) {
                            super.startNode(name, clazz);
                            //业务处理，对于用XStreamCDATA标记的Field，需要加上XStreamCDATA标签
                            if (!name.equals("xml")) {
                                cdata = needCDATA(targetClass, name);
                            } else {
                                targetClass = clazz;
                            }
                        }

                        @Override
                        protected void writeText(QuickWriter writer, String text) {
                            if (cdata) {
                                writer.write(cDATA(text));
                            } else {
                                writer.write(text);
                            }
                        }
                    };
                }
            });
        }
        return xStreamCDATA;
    }

    private static boolean needCDATA(Class<?> targetClass, String fieldAlias) {
        boolean cdata = false;
        //first, scan self
        cdata = existsCDATA(targetClass, fieldAlias);
        if (cdata) return cdata;
        //if cdata is false, scan supperClass until java.lang.Object
        Class<?> superClass = targetClass.getSuperclass();
        while (!superClass.equals(Object.class)) {
            cdata = existsCDATA(superClass, fieldAlias);
            if (cdata) return cdata;
            superClass = superClass.getClass().getSuperclass();
        }
        return false;
    }

    private static String cDATA(String text) {
        return PREFIX_CDATA + (text == null ? "" : text) + SUFFIX_CDATA;
    }

    private static boolean existsCDATA(Class<?> clazz, String fieldAlias) {
        //scan fields
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            //1. exists XStreamCDATA
            if (field.getAnnotation(XStreamCDATA.class) != null) {
                XStreamAlias xStreamAlias = field.getAnnotation(XStreamAlias.class);
                //2. exists XStreamAlias
                if (null != xStreamAlias) {
                    if (fieldAlias.equals(xStreamAlias.value()))//matched
                        return true;
                } else {// not exists XStreamAlias
                    if (fieldAlias.equals(field.getName()))
                        return true;
                }
            }
        }
        return false;
    }

    public static void main(String[] args) throws Exception {
        UnifiedorderReqData reqData = new UnifiedorderReqData()
                .buildAppid("wx2734202974309s8475390")
                .buildNonce_str("shdfhajskldueruweon4646465132")
                .buildBody("手机费");
        System.out.println(objectToXml(reqData, new Class[]{UnifiedorderReqData.class}));

        String xml = "<xml>\n" +
                "   <return_code><![CDATA[SUCCESS]]></return_code>\n" +
                "   <return_msg><![CDATA[OK]]></return_msg>\n" +
                "   <appid><![CDATA[wx2421b1c4370ec43b]]></appid>\n" +
                "   <mch_id><![CDATA[10000100]]></mch_id>\n" +
                "   <nonce_str><![CDATA[IITRi8Iabbblz1Jc]]></nonce_str>\n" +
                "   <sign><![CDATA[7921E432F65EB8ED0CE9755F0E86D72F]]></sign>\n" +
                "   <result_code><![CDATA[SUCCESS]]></result_code>\n" +
                "   <prepay_id><![CDATA[wx201411101639507cbf6ffd8b0779950874]]></prepay_id>\n" +
                "   <trade_type><![CDATA[JSAPI]]></trade_type>\n" +
                "   <code_url><![CDATA[weixin://wxpay/s/An4baqw]]></code_url>\n" +
                "</xml>";
        Object obj = getObjectFromXML(xml, UnifiedorderResData.class);

        System.out.println(obj);

        String xml2 = "<xml>\n" +
                "  <appid><![CDATA[wx2421b1c4370ec43b]]></appid>\n" +
                "  <attach><![CDATA[支付测试]]></attach>\n" +
                "  <bank_type><![CDATA[CFT]]></bank_type>\n" +
                "  <fee_type><![CDATA[CNY]]></fee_type>\n" +
                "  <is_subscribe><![CDATA[Y]]></is_subscribe>\n" +
                "  <mch_id><![CDATA[10000100]]></mch_id>\n" +
                "  <nonce_str><![CDATA[5d2b6c2a8db53831f7eda20af46e531c]]></nonce_str>\n" +
                "  <openid><![CDATA[oUpF8uMEb4qRXf22hE3X68TekukE]]></openid>\n" +
                "  <out_trade_no><![CDATA[1409811653]]></out_trade_no>\n" +
                "  <result_code><![CDATA[SUCCESS]]></result_code>\n" +
                "  <return_code><![CDATA[SUCCESS]]></return_code>\n" +
                "  <sign><![CDATA[B552ED6B279343CB493C5DD0D78AB241]]></sign>\n" +
                "  <sub_mch_id><![CDATA[10000100]]></sub_mch_id>\n" +
                "  <time_end><![CDATA[20140903131540]]></time_end>\n" +
                "  <total_fee>1</total_fee>\n" +
                "  <trade_type><![CDATA[JSAPI]]></trade_type>\n" +
                "  <transaction_id><![CDATA[1004400740201409030005092168]]></transaction_id>\n" +
                "</xml>";
        Object obj2 = getObjectFromXML(xml2, AsynNotifyReqData.class);
        System.out.println(obj2);


        AsynNotifyResData resData = new AsynNotifyResData();
        resData.buildReturn_code("FAIL").buildReturn_msg("签名验证失败");
        System.out.println(objectToXml(resData, new Class[]{AsynNotifyResData.class}));

        String sign = Signature.getSign(reqData);
        System.out.println(sign);

        String responseXml = "<xml><return_code><![CDATA[SUCCESS]]></return_code>\n" +
                "<return_msg><![CDATA[OK]]></return_msg>\n" +
                "<appid><![CDATA[wxe0f369840f8c83f9]]></appid>\n" +
                "<mch_id><![CDATA[1289359201]]></mch_id>\n" +
                "<nonce_str><![CDATA[kg7hirFdj45W9mhZ]]></nonce_str>\n" +
                "<sign><![CDATA[AD74B27B697743BC21853C7D95F301D7]]></sign>\n" +
                "<result_code><![CDATA[SUCCESS]]></result_code>\n" +
                "<prepay_id><![CDATA[wx20160317121556608342e6480048373818]]></prepay_id>\n" +
                "<trade_type><![CDATA[JSAPI]]></trade_type>\n" +
                "</xml>";
        Object obj3 = getObjectFromXML(responseXml, UnifiedorderResData.class);
        System.out.println(obj3);

        System.out.println(System.currentTimeMillis()/1000);
        System.out.println(new java.util.Date().getTime()/1000);
    }
}
