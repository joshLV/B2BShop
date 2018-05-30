package net.deepdragon.weipu.tools;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import net.deepdragon.util.StringUtil;

import java.io.IOException;

/**
 * 快递查询工具
 * Created by gzj on 2015/9/14 0014.
 */
public class ExpressUtil {
    private static final OkHttpClient client = new OkHttpClient();
    /***
     * 查询快递（物流）流转信息
     * @param companyName 快递公司名称
     * @param expressId   快递（物流）单号
     * @return            返回快递（物流）流转信息
     */
    public static String getExpreessInfo(String companyName,String expressId){
        if(StringUtil.isEmpty(companyName) || StringUtil.isEmpty(expressId)) {
            return "{\"message\":\"参数有误\",\"err_code\":\"-20\"}";
        }else{
            Request request = new Request.Builder()
                    .url("http://a.apix.cn/apixlife/express/delivery?id=" + expressId + "&logistics=" + companyName)
                    .get()
                    .addHeader("accept", "application/json")
                    .addHeader("content-type", "application/json")
                    .addHeader("apix-key", "dee89b3626db42335dc397f48cefca9c")
                    .build();
            try {
                Response response = client.newCall(request).execute();
                String result = response.body().string();
                return result;
            } catch (IOException e) {
                return "{\"message\":\"接口调用失败\",\"err_code\":\"-10\"}";
            }
        }
    }
    /**
     *unicode转中文
     * @param utfString 需要转换的数据
     * @return        转换后的数据
     * */
    public static String convert(String utfString){
        StringBuilder sb = new StringBuilder();
        int i = -1;
        int pos = 0;
        while((i=utfString.indexOf("\\u", pos)) != -1){
            sb.append(utfString.substring(pos, i));
            if(i+5 < utfString.length()){
                pos = i+6;
                sb.append((char)Integer.parseInt(utfString.substring(i+2, i+6), 16));
            }
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(getExpreessInfo("YT","761710603912"));
    }
}


