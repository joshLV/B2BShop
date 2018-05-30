package net.deepdragon.weipu.tools;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.listeners.ApplicationContextListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Explain: 静态化文件操作工具类
 * FileName:
 * Author: TianYu
 * Time: 2016-11-10 13:50
 * Desc:
 * Version: V1.0
 */
public class StaticizeHtmlUtil {
    //项目路径名字
    private static final String PATH;
    private static final String MALL_CLASS_PATH;
    private static final String APP_CLASS_PATH;
    private static String baseUri = "WEB-INF"+File.separator+"statichtml" + File.separator;
    public static final String STATICIZE = "__staticize__";
    private static Logger logger = LoggerFactory.getLogger(StaticizeHtmlUtil.class);

    static  {
        PATH = PropertiesUtil.getValue(Constant.PROJECTCONF, "project.name");
        MALL_CLASS_PATH = initStaticizeMallPath();
        APP_CLASS_PATH = initStaticizeAppPath();
    }

    public static String initStaticizeMallPath(){
        String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();
        if (path.indexOf(":") != 1) {
            path = File.separator + path;
        }
        return path+ File.separator + baseUri + File.separator + Global.TEMPLATE_MALL + File.separator + PATH;
    }

    public static String initStaticizeAppPath(){
        String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();
        if (path.indexOf(":") != 1) {
            path = File.separator + path;
        }
        return path+ File.separator + baseUri + File.separator + Global.TEMPLATE_APP + File.separator + PATH;
    }

    public static boolean getStaticizeHtml(){
        try {
            SystemSetService systemSetService = ApplicationContextListener.getSpringApplicationContext().getBean(SystemSetService.class);

            Map<String,Object> param = new HashMap<String, Object>();
            param.put(Constant.TENANTID_KEY, "37100");
            param.put(Constant.PLATFORM_KEY,  Constant.PLATFORM_B2B );

            SystemSet systemSet = systemSetService.find(param, "setkey", "staticizeHtml");
            return systemSet != null ? Boolean.valueOf( systemSet.getSetvalue() ) : false;
        }catch (Exception e){
            return false;
        }
    }


    /**
     * 删除首页
     */
    public static void refrushIndex(){
        if( getStaticizeHtml() ){
            //删除PC端
            File mallFile = new File(MALL_CLASS_PATH + File.separator + "index.html");
            if( mallFile.exists() ){
                mallFile.delete();
            }

            //删除APP端
            File appFile = new File(APP_CLASS_PATH + File.separator + "index.html");
            if( appFile.exists() ) {
                appFile.delete();
            }

            generateIndex();
        }
    }

    /**
     * 删除全部静态文件
     */
    public static void refrushAll(){
        if( getStaticizeHtml() ){
            //删除PC端
            File mallFile = new File(MALL_CLASS_PATH);
            deleteAllFilesOfDir( mallFile );

            //删除APP端
            File appFile = new File(APP_CLASS_PATH);
            deleteAllFilesOfDir( appFile );
        }
    }

    /**
     * 生成首页
     */
    public static void generateIndex(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        OkHttpClient client = new OkHttpClient();
        String url = "http://"  + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
        simulationsRequest(client, url + "/index?" +STATICIZE  +"=true");
        simulationsRequest(client, url  + "/app_index?" +STATICIZE  +"=true");
    }

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

    /**
     * 删除文件夹
     * @param path
     */
    private static void deleteAllFilesOfDir(File path) {
        if (!path.exists())
            return;
        if (path.isFile()) {
            path.delete();
            return;
        }
        File[] files = path.listFiles();
        for (int i = 0; i < files.length; i++) {
            deleteAllFilesOfDir(files[i]);
        }
        path.delete();
    }
}
