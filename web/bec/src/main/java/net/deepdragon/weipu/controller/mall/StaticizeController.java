package net.deepdragon.weipu.controller.mall;

import net.deepdragon.entity.SystemSet;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.tools.PropertiesUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

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
        PATH = PropertiesUtil.getValue(Constant.PROJECTCONF, "project.PATH");
        STATICIZE = "__staticize__";
    }

    private String baseUri = "WEB-INF/statichtml/";

    @RequestMapping(value="rsga")
    @ResponseBody
    public String refreshStaticizePageAll(HttpServletRequest request, HttpServletResponse response){
        try {
            String staticizeHtml = getSystemSetByKey("staticizeHtml");
            //如果数据库不存在此参数，插入数据
            if(  staticizeHtml == null){
                SystemSet systemSet = new SystemSet();
                systemSet.setTenantId( getTenantId() );
                systemSet.setSetkey("staticizeHtml");
                systemSet.setSetvalue("false");
                systemSetService.save(getParamMap(), systemSet);

                getSystemSetByKey("staticizeHtml", true);
            }else{
                //如果存在，且为true，即开启静态化，删除所有的静态化页面，更新首页
                if("true".equals( getSystemSetByKey("staticizeHtml") )){
                    String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();
                    if (path.indexOf(":") != 1) {
                        path = File.separator + path;
                    }

                    //删除PC端
                    File mallFile = new File(path+ File.separator + baseUri + File.separator + "mall" + File.separator + PATH);
                    deleteAllFilesOfDir( mallFile );

                    //删除APP端
                    File appFile = new File(path+ File.separator + baseUri + File.separator + "app" +File.separator + PATH);
                    deleteAllFilesOfDir( appFile );
                }
            }
            return "true";
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

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
