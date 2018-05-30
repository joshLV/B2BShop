package com.weixin.service;

import com.weixin.GetWxOrderno;
import com.weixin.common.Signature;
import com.weixin.common.WXUtil;
import com.weixin.common.XStreamUtil;
import com.weixin.protocol.UnifiedorderReqData;
import com.weixin.protocol.UnifiedorderResData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.net.ssl.*;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Date;

/**
 * Created by chris on 2016/3/9.
 */
public class UnifiedorderService implements IService<UnifiedorderReqData, UnifiedorderResData>{
    protected Logger logger = LoggerFactory.getLogger(getClass());


    /**
     * 旧的
     * @param unifiedorderReqData
     * @return
     * @throws Exception
     */
    @Override
    public UnifiedorderResData sendRequest(UnifiedorderReqData unifiedorderReqData) throws Exception {
        WXUtil.log("----------------------------UnifiedorderReqData--------------------------------");
        WXUtil.log(XStreamUtil.objectToXml(unifiedorderReqData, new Class[]{UnifiedorderReqData.class}));
        String sign = Signature.getSign(unifiedorderReqData);
        unifiedorderReqData.buildSign(sign);
        String requestXml = XStreamUtil.objectToXml(unifiedorderReqData, new Class[]{UnifiedorderReqData.class});
        WXUtil.log("----------------------------requestXml--------------------------------");
        WXUtil.log(requestXml);
        String responseXml = GetWxOrderno.sendPost(unifiedorderReqData.getUrl(), requestXml);
        if(responseXml==null){
            int i=2;
            do{
                responseXml = GetWxOrderno.sendPost(unifiedorderReqData.getUrl(), requestXml);
                if(responseXml!=null){
                    break;
                }
                i--;
            }while (i>0);
        }

        WXUtil.log("----------------------------responseXml--------------------------------");
        WXUtil.log(responseXml);
        if(responseXml!=null){
            UnifiedorderResData resData =(UnifiedorderResData) XStreamUtil.getObjectFromXML(responseXml, UnifiedorderResData.class);
            return resData;
        }
        return null;
    }

    /**
     * sendRequestN 新的
     * @param unifiedorderReqData
     * @return
     * @throws Exception
     */
    public UnifiedorderResData sendRequestN(UnifiedorderReqData unifiedorderReqData) throws Exception {
        WXUtil.log("----------------------------UnifiedorderReqData--------------------------------");
        WXUtil.log(XStreamUtil.objectToXml(unifiedorderReqData, new Class[]{UnifiedorderReqData.class}));
        String sign = Signature.getSign(unifiedorderReqData);
        unifiedorderReqData.buildSign(sign);
        String requestXml = XStreamUtil.objectToXml(unifiedorderReqData, new Class[]{UnifiedorderReqData.class});
        WXUtil.log("----------------------------requestXml--------------------------------");
        WXUtil.log(requestXml);

        String requestUrl=unifiedorderReqData.getUrl();//请求地址
        String requestMethod="POST";//请求方式
        String inputStr=requestXml;//请求参数


        String responseXml = httpsRequest(requestUrl, requestMethod, inputStr);//GetWxOrderno.sendPost(unifiedorderReqData.getUrl(), requestXml);
        if(responseXml==null){

            logger.error("下单失败，获取到的信息为null-----------------首次--------------");

            Thread.sleep(200);

            int i=2;
            do{
                responseXml =  httpsRequest(requestUrl, requestMethod, inputStr);//GetWxOrderno.sendPost(unifiedorderReqData.getUrl(), requestXml);
                if(responseXml!=null){
                    break;
                }
                logger.error("下单失败，获取到的信息为null-----------------第"+i+"次--------------");
                i--;
            }while (i>0);
        }

        WXUtil.log("----------------------------responseXml--------------------------------");
        WXUtil.log(responseXml);
        if(responseXml!=null){
            UnifiedorderResData resData =(UnifiedorderResData) XStreamUtil.getObjectFromXML(responseXml, UnifiedorderResData.class);
            return resData;
        }
        return null;
    }



    /**
     * 发起https请求并获取结果
     *
     * @param requestUrl 请求地址
     * @param requestMethod 请求方式（GET、POST）
     * @param inputStr  提交的数据
     * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
     */
    public  String httpsRequest(String requestUrl, String requestMethod, String inputStr) {

        String sign=new Date().getTime()+"";

        logger.info("HttpsRequest 请求参数"+sign+"：  url："+requestUrl+"; requestmethod:"+requestMethod+"; inputStr:"+inputStr);


        StringBuffer buffer = new StringBuffer();
        try {
            X509TrustManager x509m = new X509TrustManager() {


                @Override
                public void checkClientTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {

                }

                @Override
                public void checkServerTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {

                }

                @Override
                public X509Certificate[] getAcceptedIssuers() {
                    return new X509Certificate[0];
                }
            };

            // 创建SSLContext对象，并使用我们指定的信任管理器初始化

            SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
            sslContext.init(null, new TrustManager[] { x509m }, new java.security.SecureRandom());
            // 从上述SSLContext对象中得到SSLSocketFactory对象
            SSLSocketFactory ssf = sslContext.getSocketFactory();

            URL url = new URL(requestUrl);
            HttpsURLConnection httpUrlConn = (HttpsURLConnection) url.openConnection();
            httpUrlConn.setSSLSocketFactory(ssf);

            httpUrlConn.setDoOutput(true);
            httpUrlConn.setDoInput(true);
            httpUrlConn.setUseCaches(false);
            // 设置请求方式（GET/POST）
            httpUrlConn.setRequestMethod(requestMethod);

            if ("GET".equalsIgnoreCase(requestMethod))
                httpUrlConn.connect();

            // 当有数据需要提交时
            if (null != inputStr) {
                OutputStream outputStream = httpUrlConn.getOutputStream();
                // 注意编码格式，防止中文乱码
                outputStream.write(inputStr.getBytes("UTF-8"));
                outputStream.close();
            }

            // 将返回的输入流转换成字符串
            InputStream inputStream = httpUrlConn.getInputStream();
            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);

            String str = null;
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            bufferedReader.close();
            inputStreamReader.close();
            // 释放资源
            inputStream.close();
            inputStream = null;
            httpUrlConn.disconnect();
            logger.info("httpsrequest 返回值"+sign+"："+buffer.toString());
            return buffer.toString();
        } catch (ConnectException ce) {
            logger.error("Weixin server connection timed out."+ce.toString());
            ce.printStackTrace();
        } catch (Exception e) {
            logger.error("https request error:{}"+e);
            e.printStackTrace();
        }
        return null;
    }





}
