package com.weixin.common;

import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

/**
 * Created by chris on 2016/3/10.
 */
public class Signature {

    /**
     * 签名算法
     *
     * @param o 要参与签名的数据对象
     * @return 签名
     * @throws IllegalAccessException
     */
    public static String getSign(Object o) throws IllegalAccessException {
        ArrayList<String> list = new ArrayList<String>();
        Class cls = o.getClass();
        Field[] fields = cls.getDeclaredFields();

        Configure.WX_TRADE_TYPE tradeType = null;
        for (Field f : fields) {
            f.setAccessible(true);
            if (f.get(o) != null && f.get(o) != "") {
                list.add(f.getName() + "=" + f.get(o) + "&");
                if (Configure.TRADE_TYPE.equals(f.getName())) {
                    if( Configure.WX_TRADE_TYPE.JSAPI.toString().equals(f.get(o)) ){
                        tradeType = Configure.WX_TRADE_TYPE.JSAPI;
                    }else if(Configure.WX_TRADE_TYPE.APP.toString().equals(f.get(o))){
                        tradeType = Configure.WX_TRADE_TYPE.APP;
                    }else if(Configure.WX_TRADE_TYPE.NATIVE.toString().equals(f.get(o))){
                        tradeType = Configure.WX_TRADE_TYPE.NATIVE;
                    }else{
                        throw new RuntimeException( "unknown trade_type : " + f.get(o));
                    }
                }
            }

        }
        if( tradeType == null ){
            throw new RuntimeException("trade_type can't be empty.");
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        switch (tradeType){
            case APP:
                result += "key=" + Configure.getKey_app();
                break;
            case JSAPI:
                result += "key=" + Configure.getKey();
                break;
            case NATIVE:
                result += "key=" + Configure.getKey();
                break;
            default:
                result += "key=" + Configure.getKey();
                break;
        }

        WXUtil.log("Sign Before MD5:" + result);
        result = MD5.MD5Encode(result).toUpperCase();
        WXUtil.log("Sign Result:" + result);
        return result;
    }


    /**
     * @param map   公众号支付时，要参与签名的Map
     * @return 签名
     */
    public static String getSignForJSAPI(Map<String, Object> map){
        return getSign(map,  Configure.WX_TRADE_TYPE.JSAPI);
    }

    /**
     * @param map   公众号支付时，要参与签名的Map
     * @return 签名
     */
    public static String getSignForAPP(Map<String, Object> map){
        return getSign(map, Configure.WX_TRADE_TYPE.APP);
    }

    /**
     * @param map   公众号支付时，要参与签名的Map
     * @return 签名
     */
    public static String getSignForNATIVE(Map<String, Object> map){
        return getSign(map, Configure.WX_TRADE_TYPE.NATIVE);
    }
    /**
     *
     * @param map 要参与签名的Map
     * @param tradeType TRADE_TYPE_JSAPI：公众号支付, TRADE_TYPE_APP：App支付
     * @return 签名
     */
    public static String getSign(Map<String, Object> map, Configure.WX_TRADE_TYPE tradeType ) {
        ArrayList<String> list = new ArrayList<String>();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (entry.getValue() != "") {
                list.add(entry.getKey() + "=" + entry.getValue() + "&");
                if (tradeType == null && Configure.TRADE_TYPE.equals(entry.getKey())) {
                    if (Configure.WX_TRADE_TYPE.APP.toString().equals(entry.getValue())) {
                        tradeType = Configure.WX_TRADE_TYPE.APP;
                    } else if (Configure.WX_TRADE_TYPE.JSAPI.toString().equals(entry.getValue())) {
                        tradeType = Configure.WX_TRADE_TYPE.JSAPI;
                    } else if (Configure.WX_TRADE_TYPE.NATIVE.toString().equals(entry.getValue())) {
                        tradeType = Configure.WX_TRADE_TYPE.JSAPI;
                    } else {
                        throw new RuntimeException( "unknown trade_type : " + entry.getValue());
                    }
                }
            }
        }
        if( tradeType == null ){
            throw new RuntimeException("trade_type can't be empty.");
        }
        int size = list.size();
        String[] arrayToSort = list.toArray(new String[size]);
        Arrays.sort(arrayToSort, String.CASE_INSENSITIVE_ORDER);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append(arrayToSort[i]);
        }
        String result = sb.toString();
        switch (tradeType){
            case APP:
                result += "key=" + Configure.getKey_app();
                break;
            case JSAPI:
                result += "key=" + Configure.getKey();
                break;
            case NATIVE:
                result += "key=" + Configure.getKey();
                break;
            default:
                result += "key=" + Configure.getKey();
                break;
        }
        WXUtil.log("Sign Before MD5:" + result);
        result = MD5.MD5Encode(result).toUpperCase();
        WXUtil.log("Sign Result:" + result);
        return result;
    }

    /**
     * 从API返回的XML数据里面重新计算一次签名
     *
     * @param responseString API返回的XML数据
     * @return 新鲜出炉的签名
     * @throws ParserConfigurationException
     * @throws IOException
     * @throws SAXException
     */
    public static String getSignFromResponseString(String responseString) throws IOException, SAXException, ParserConfigurationException {
        Map<String, Object> map = XMLParser.getMapFromXML(responseString);
        //清掉返回数据对象里面的Sign数据（不能把这个数据也加进去进行签名），然后用签名算法进行签名
        map.put("sign", "");
        //将API返回的数据根据用签名算法进行计算新的签名，用来跟API返回的签名进行比较
        return Signature.getSign(map, null);
    }

    /**
     * 检验API返回的数据里面的签名是否合法，避免数据在传输的过程中被第三方篡改
     *
     * @param responseString API返回的XML数据字符串
     * @return API签名是否合法
     * @throws ParserConfigurationException
     * @throws IOException
     * @throws SAXException
     */
    public static boolean checkIsSignValidFromResponseString(String responseString) throws ParserConfigurationException, IOException, SAXException {

        Map<String, Object> map = XMLParser.getMapFromXML(responseString);
        WXUtil.log(map.toString());

        String signFromAPIResponse = map.get("sign").toString();
        if (signFromAPIResponse == "" || signFromAPIResponse == null) {
            WXUtil.log("API返回的数据签名数据不存在，有可能被第三方篡改!!!");
            return false;
        }
        WXUtil.log("服务器回包里面的签名是:" + signFromAPIResponse);
        //清掉返回数据对象里面的Sign数据（不能把这个数据也加进去进行签名），然后用签名算法进行签名
        map.put("sign", "");
        //将API返回的数据根据用签名算法进行计算新的签名，用来跟API返回的签名进行比较
        String signForAPIResponse = Signature.getSign(map, null);

        if (!signForAPIResponse.equals(signFromAPIResponse)) {
            //签名验不过，表示这个API返回的数据有可能已经被篡改了
            WXUtil.log("API返回的数据签名验证不通过，有可能被第三方篡改!!!");
            return false;
        }
        WXUtil.log("恭喜，API返回的数据签名验证通过!!!");
        return true;
    }



}
