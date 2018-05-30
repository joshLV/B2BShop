package net.deepdragon.weipu.tools;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;


/**
 * Created by yanchao on 2015/12/31.
 * 静态化html调用工具。该工具通过访问EC/BEC指定地址来完成静态化工作。
 */
public class StaticizeUtil {

    public static final String STATICIZE = "__staticize__";

    protected static Logger logger = LoggerFactory
            .getLogger(StaticizeUtil.class);

    //模拟请求，访问指定页面来完成静态
    private static void simulationsRequest(final OkHttpClient client, final String url) {
        new Thread() {

            @Override
            public void run() {
                Request request = new Request.Builder().url(url).get().build();
                try {
                    Response res = client.newCall(request).execute();
                } catch (IOException e) {
                    logger.error("生成静态HTML失败，地址：" + url);
                }
            }
        }.start();
    }

    //静态化商品页面
    public static void updateItem(String id,String shopUrl) {
        OkHttpClient client = new OkHttpClient();
        //BEC
        simulationsRequest(client, shopUrl + "item/" + id + ".html?" + STATICIZE + "=true");
        simulationsRequest(client, shopUrl + "item/whichapp/" + id + ".html?" + STATICIZE + "=true");
    }

    //更新主页
    public static void updateIndex(String shopUrl) {
        OkHttpClient client = new OkHttpClient();
        //BEC
        simulationsRequest(client, shopUrl  + "index?" +STATICIZE  +"=true");
        simulationsRequest(client, shopUrl  + "app_index?" +STATICIZE  +"=true");
    }

}

