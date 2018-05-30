package net.deepdragon.util;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * Explain: 根据IP地址获取IP所属的归属地
 * FileName:
 * Author: TianYu
 * Time: 2016-04-11 11:22
 * Desc:
 * Version: V1.0
 */
public class AddressUtils {

    public enum ReturnKey{
        /*国家，  区域， 省，  城市，县（区）， 运营商*/
        country,area,region,city,county,isp
    }

    /** 服务器端请求编码。如GBK,UTF-8等 */
    private static String encodingString = "utf-8";
    /**
     * 根据IP获取所属地址
     * @return
     * result.put("country", country); 国家
     * result.put("area", area); 区域
     * result.put("region", region); 省
     * result.put("city", city); 城市
     * result.put("county", county); 县（区）
     * result.put("isp", isp); 运营商
     * @throws UnsupportedEncodingException
     */
    public static Map<ReturnKey,String> getAddressesByTaoBao(String ip)
            throws UnsupportedEncodingException {

        String content = "ip="+ip;//请求的参数 格式为：name=xxx&pwd=xxx


        Map<ReturnKey,String> result = new HashMap<ReturnKey,String>();

        // 这里调用pconline的接口
        String urlStr = "http://ip.taobao.com/service/getIpInfo.php";
        // 从http://whois.pconline.com.cn取得IP所在的省市区信息
        String returnStr = getResult(urlStr, content, encodingString);
        if (returnStr != null) {
            // 处理返回的省市区信息
//            System.out.println(returnStr);
            String[] temp = returnStr.split(",");
            if(temp.length<3){
                return null;//无效IP，局域网测试
            }
            String region = (temp[5].split(":"))[1].replaceAll("\"", "");
            region = decodeUnicode(region);// 省份

            String country = "";
            String area = "";
            // String region = "";
            String city = "";
            String county = "";
            String isp = "";
            for (int i = 0; i < temp.length; i++) {
                switch (i) {
                    case 1:
                        country = (temp[i].split(":"))[2].replaceAll("\"", "");
                        country = decodeUnicode(country);// 国家
                        break;
                    case 3:
                        area = (temp[i].split(":"))[1].replaceAll("\"", "");
                        area = decodeUnicode(area);// 地区
                        break;
                    case 5:
                        region = (temp[i].split(":"))[1].replaceAll("\"", "");
                        region = decodeUnicode(region);// 省份
                        break;
                    case 7:
                        city = (temp[i].split(":"))[1].replaceAll("\"", "");
                        city = decodeUnicode(city);// 市区
                        break;
                    case 9:
                        county = (temp[i].split(":"))[1].replaceAll("\"", "");
                        county = decodeUnicode(county);// 地区
                        break;
                    case 11:
                        isp = (temp[i].split(":"))[1].replaceAll("\"", "");
                        isp = decodeUnicode(isp); // ISP公司
                        break;
                }
            }

//            System.out.println(country+"="+area+"="+region+"="+city+"="+county+"="+isp);
            result.put(ReturnKey.country, country);
            result.put(ReturnKey.area, area);
            result.put(ReturnKey.region, region);
            result.put(ReturnKey.city, city);
            result.put(ReturnKey.county, county);
            result.put(ReturnKey.isp, isp);
            return result;
        }
        return null;
    }
    /**
     * @param urlStr
     *            请求的地址
     * @param content
     *            请求的参数 格式为：name=xxx&pwd=xxx
     * @param encoding
     *            服务器端请求编码。如GBK,UTF-8等
     * @return
     */
    private static String getResult(String urlStr, String content, String encoding) {
        URL url = null;
        HttpURLConnection connection = null;
        try {
            url = new URL(urlStr);
            connection = (HttpURLConnection) url.openConnection();// 新建连接实例
            connection.setConnectTimeout(6000);// 设置连接超时时间，单位毫秒
            connection.setReadTimeout(6000);// 设置读取数据超时时间，单位毫秒
            connection.setDoOutput(true);// 是否打开输出流 true|false
            connection.setDoInput(true);// 是否打开输入流true|false
            connection.setRequestMethod("POST");// 提交方法POST|GET
            connection.setUseCaches(false);// 是否缓存true|false
            connection.connect();// 打开连接端口
            DataOutputStream out = new DataOutputStream(connection
                    .getOutputStream());// 打开输出流往对端服务器写数据
            out.writeBytes(content);// 写数据,也就是提交你的表单 name=xxx&pwd=xxx
            out.flush();// 刷新
            out.close();// 关闭输出流
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(), encoding));// 往对端写完数据对端服务器返回数据
            // ,以BufferedReader流来读取
            StringBuffer buffer = new StringBuffer();
            String line = "";
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            reader.close();
            return buffer.toString();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (connection != null) {
                connection.disconnect();// 关闭连接
            }
        }
        return null;
    }
    /**
     * unicode 转换成 中文
     *
     * @author fanhui 2007-3-15
     * @param theString
     * @return
     */
    public static String decodeUnicode(String theString) {
        char aChar;
        int len = theString.length();
        StringBuffer outBuffer = new StringBuffer(len);
        for (int x = 0; x < len;) {
            aChar = theString.charAt(x++);
            if (aChar == '\\') {
                aChar = theString.charAt(x++);
                if (aChar == 'u') {
                    int value = 0;
                    for (int i = 0; i < 4; i++) {
                        aChar = theString.charAt(x++);
                        switch (aChar) {
                            case '0':
                            case '1':
                            case '2':
                            case '3':
                            case '4':
                            case '5':
                            case '6':
                            case '7':
                            case '8':
                            case '9':
                                value = (value << 4) + aChar - '0';
                                break;
                            case 'a':
                            case 'b':
                            case 'c':
                            case 'd':
                            case 'e':
                            case 'f':
                                value = (value << 4) + 10 + aChar - 'a';
                                break;
                            case 'A':
                            case 'B':
                            case 'C':
                            case 'D':
                            case 'E':
                            case 'F':
                                value = (value << 4) + 10 + aChar - 'A';
                                break;
                            default:
                                throw new IllegalArgumentException(
                                        "Malformed      encoding.");
                        }
                    }
                    outBuffer.append((char) value);
                } else {
                    if (aChar == 't') {
                        aChar = '\t';
                    } else if (aChar == 'r') {
                        aChar = '\r';
                    } else if (aChar == 'n') {
                        aChar = '\n';
                    } else if (aChar == 'f') {
                        aChar = '\f';
                    }
                    outBuffer.append(aChar);
                }
            } else {
                outBuffer.append(aChar);
            }
        }
        return outBuffer.toString();
    }

    public static final String HTTPURL="http://apis.baidu.com/apistore/iplookupservice/iplookup";
    public static final String APPKEY="1307ee261de8bbcf83830de89caae73f";
    public static final String APIKEY="84330a66e1fd6074a334de09e5aceb47";
    /**
     * 根据百度接口查询IP的归属地
     * @param ip
     *            :要查询的IP地址
     * @return 返回结果
     */
    public static Map<ReturnKey,String> getAddresses(String ip) {
        Map<ReturnKey,String> resultMap = new HashMap<ReturnKey,String>();
        String httpUrl=HTTPURL;
        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        httpUrl = httpUrl + "?ip=" + ip+"&appkey="+APPKEY;
        JSONObject returnobj=new JSONObject();
        try {
            URL url = new URL(httpUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            // 填入apikey到HTTP header
            connection.setRequestProperty("apikey",  APIKEY);
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            String strRead = null;
            while ((strRead = reader.readLine()) != null) {
                sbf.append(strRead);
                sbf.append("\r\n");
            }
            reader.close();
            result = sbf.toString();
            returnobj= JSON.parseObject(result);

            if( "success".equals(returnobj.get("errMsg")) ){
                if(returnobj.get("retData") instanceof  JSONArray){
                    return null;
                }else if(returnobj.get("retData") instanceof  Map){
                    Map<String,String> map = (Map<String,String>)returnobj.get("retData");

                    resultMap.put(ReturnKey.country, map.get("country"));
                    resultMap.put(ReturnKey.region, map.get("province"));
                    resultMap.put(ReturnKey.city, map.get("city"));
                    resultMap.put(ReturnKey.county, map.get("district"));
                    resultMap.put(ReturnKey.isp, map.get("carrier"));
                }


                return resultMap;
            }
        } catch (Exception e) {
//            e.printStackTrace();
        }

        return null;
    }


    // 测试
    public static void main(String[] args) {
        // 测试ip 219.136.134.157 中国=华南=广东省=广州市=越秀区=电信
//        String ip = "125.70.11.136";
        String ip = "180.97.33.107";
        try {
//            Map<ReturnKey,String> result = AddressUtils.getAddresses(ip);
//            System.out.println( result );
            System.out.println( getAddresses(ip)  );
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // 输出结果为：广东省,广州市,越秀区

    }
}
