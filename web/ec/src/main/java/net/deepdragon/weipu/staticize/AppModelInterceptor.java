package net.deepdragon.weipu.staticize;

import com.alibaba.fastjson.JSON;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.support.RequestContext;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;
import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by yanchao on 2016/1/22.
 * 该拦截器拦截指定方法，如果__getModel__参数为true，返回方法的视图模型
 */
public class AppModelInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //满足该条件的请求将被拦截，允许跨域
        if ("true".equalsIgnoreCase(request.getParameter("__allowOrigin"))) {
            response.setHeader("Access-Control-Allow-Origin", "*");
        }
        //满足该条件的将被拦截
        if ("true".equalsIgnoreCase(request.getParameter("__getModel__"))) {
            WebApplicationContext webApplicationContext = (WebApplicationContext) request.getSession().getServletContext().getAttribute("org.springframework.web.servlet.FrameworkServlet.CONTEXT.springmvc");
            RequestMappingHandlerAdapter ha = BeanFactoryUtils.beanOfTypeIncludingAncestors(webApplicationContext, RequestMappingHandlerAdapter.class, true, false);
            //下面直接执行该方法，拿到ModelAndView获取其Model并以JSON方式返回给前台。
            ModelAndView mv = ha.handle(request, response, handler);
            response.setStatus(200);
            //允许跨域
            response.setHeader("Access-Control-Allow-Origin", "*");
            response.setCharacterEncoding("UTF-8");
            Map<String, Object> model = mv.getModel();
            buildTemplateModel(request, model);
            response.setContentType("application/json; charset=utf-8");
            PrintWriter writer = response.getWriter();
            writer .write(JSON.toJSONString(model));
            writer.flush();
            writer.close();
            return false;
        }
        return true;
    }

    private void buildTemplateModel(HttpServletRequest request, Map<String, Object> model) {
       // model.put("base",)
//        boolean exposeRequestAttributes = true, exposeSessionAttributes = true, exposeSpringMacroHelpers = true;
//        if (exposeRequestAttributes) {
//            for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
//                String attribute = (String) en.nextElement();
//                Object attributeValue = request.getAttribute(attribute);
//                model.put(attribute, attributeValue);
//            }
//        }
//
//        if (exposeSessionAttributes) {
//            HttpSession session = request.getSession(false);
//            if (session != null) {
//                for (Enumeration en = session.getAttributeNames(); en.hasMoreElements(); ) {
//                    String attribute = (String) en.nextElement();
//                    Object attributeValue = session.getAttribute(attribute);
//                    model.put(attribute, attributeValue);
//                }
//            }
//        }
    }
}
