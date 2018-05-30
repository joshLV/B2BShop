package com.weixin.service;

import com.weixin.common.Signature;
import com.weixin.common.WXUtil;
import com.weixin.common.XStreamUtil;
import com.weixin.http.HttpConnect;
import com.weixin.http.HttpResponse;
import com.weixin.protocol.AccessTokenReqData;
import com.weixin.protocol.AccessTokenResData;
import com.weixin.protocol.UnifiedorderReqData;
import com.weixin.protocol.UnifiedorderResData;
import net.sf.json.JSONObject;
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
public class AccessTokenService implements IService<AccessTokenReqData, AccessTokenResData> {
    protected Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * sendRequestN 新的
     * @param accessTokenReqData
     * @return
     * @throws Exception
     */
    public AccessTokenResData sendRequestN(AccessTokenReqData accessTokenReqData) throws Exception {

        String requestUrl=accessTokenReqData.getUrl();//请求地址
        String requestMethod="POST";//请求方式
        String inputStr=accessTokenReqData.getUrl();//请求参数
        WXUtil.log("----------------------------responseXml--------------------------------");
        String responseXml = httpsRequest(requestUrl, requestMethod, inputStr);//
        if(responseXml==null){

            logger.error("获取的openId是null-----------------首次--------------");

            Thread.sleep(200);

            int i=2;
            do{
                responseXml =  httpsRequest(requestUrl, requestMethod, inputStr);//
                if(responseXml!=null){
                    break;
                }
                logger.error("获取的openId是null-----------------第"+i+"次--------------");
                i--;
            }while (i>0);
        }

        WXUtil.log("----------------------------responseXml--------------------------------");
        WXUtil.log(responseXml);
        if(responseXml!=null){

            JSONObject jsonObj = JSONObject.fromObject(responseXml);
            AccessTokenResData accessTokens = new AccessTokenResData();
            accessTokens.buildErrcode("");
            if (!jsonObj.containsKey("errcode")) {
                AccessTokenResData accessToken = new AccessTokenResData();
                accessToken.buildAccess_token(jsonObj.getString("access_token"))
                        .buildExpires_in(jsonObj.getString("expires_in"))
                        .buildRefresh_token(jsonObj.getString("refresh_token"))
                        .buildOpenid(jsonObj.getString("openid"))
                        .buildScope(jsonObj.getString("scope"));
                return accessToken;
            } else {
                AccessTokenResData accessToken = new AccessTokenResData();
                accessToken.buildErrcode(jsonObj.getString("errcode"))
                        .buildErrmsg(jsonObj.getString("errmsg"));
                return accessToken;
            }
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



    @Override
    public AccessTokenResData sendRequest(AccessTokenReqData accessTokenReqData) throws Exception {
        String URL = accessTokenReqData.getUrl();
        HttpResponse temp = HttpConnect.getInstance().doGetStr(URL);
        if (temp != null) {
            String tempValue = temp.getStringResult();
            JSONObject jsonObj = JSONObject.fromObject(tempValue);
            AccessTokenResData accessTokens = new AccessTokenResData();
            accessTokens.buildErrcode("");
            if (!jsonObj.containsKey("errcode")) {
                AccessTokenResData accessToken = new AccessTokenResData();
                accessToken.buildAccess_token(jsonObj.getString("access_token"))
                        .buildExpires_in(jsonObj.getString("expires_in"))
                        .buildRefresh_token(jsonObj.getString("refresh_token"))
                        .buildOpenid(jsonObj.getString("openid"))
                        .buildScope(jsonObj.getString("scope"));
                return accessToken;
            } else {
                AccessTokenResData accessToken = new AccessTokenResData();
                accessToken.buildErrcode(jsonObj.getString("errcode"))
                        .buildErrmsg(jsonObj.getString("errmsg"));
                return accessToken;
            }
        }else{
            return null;
        }
    }
}
