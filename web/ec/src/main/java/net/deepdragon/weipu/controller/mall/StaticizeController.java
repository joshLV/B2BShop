package net.deepdragon.weipu.controller.mall;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.tools.PropertiesUtil;
import net.deepdragon.weipu.tools.StaticizeHtmlUtil;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * Explain: 静态化处理控制器
 * FileName:
 * Author: TianYu
 * Time: 2016-11-08 8:59
 * Desc:
 * Version: V1.0
 */
@Controller(Global.APP_SIGN + Global.MALL + "StaticizeController")
@RequestMapping(Global.MALL_PATH + "/staticize")
public class StaticizeController extends BaseMallController {
    //项目路径名字
    public static final String PATH;
    public static final String STATICIZE;
    @Resource
    private SystemSetService systemSetService;

    static  {
        PATH = PropertiesUtil.getValue(Constant.PROJECTCONF, "project.name");
        STATICIZE = "__staticize__";
    }

    private String baseUri = "WEB-INF/statichtml/";

    @RequestMapping(value="rsga")
    @ResponseBody
    public String refreshStaticizePageAll(HttpServletRequest request, HttpServletResponse response){
        try {
            StaticizeHtmlUtil.refrushAll();
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    @RequestMapping(value="rsi")
    @ResponseBody
    public String refreshStaticizeIndex(HttpServletRequest request, HttpServletResponse response){
        try {
            StaticizeHtmlUtil.refrushIndex();
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }
}
