package net.deepdragon.weipu.staticize;

import freemarker.template.Configuration;
import freemarker.template.Template;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.util.Constant;
import net.deepdragon.util.SpringUtils;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.listeners.ApplicationContextListener;
import net.deepdragon.weipu.tools.PropertiesUtil;
import net.deepdragon.weipu.tools.StaticizeHtmlUtil;
import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.i18n.FixedLocaleResolver;
import org.springframework.web.servlet.support.RequestContext;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;
import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/**
 * 静态化页面
 * Created by yanchao on 2015/12/31.
 */
public class StaticizeInterceptor extends HandlerInterceptorAdapter {

    public static final String STATICIZE = "__staticize__";
    //项目路径名字
    public static final String PATH;
    //是否启用静态化
//    public static final boolean USE_STATICIZE;

    static  {
        PATH = PropertiesUtil.getValue(Constant.PROJECTCONF, "project.PATH");
//        USE_STATICIZE = initStaticize();
    }

    private String baseUri = "WEB-INF/statichtml/";

    //当前访问页面是否需要静态化
    private String getStaticizeName(HttpServletRequest request, Object handler, boolean post) {
        if ( StaticizeHtmlUtil.getStaticizeHtml() && handler instanceof HandlerMethod && !"true".equalsIgnoreCase(request.getParameter("__getModel__"))) {
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            Method method = handlerMethod.getMethod();
            Staticize s = method.getAnnotation(Staticize.class);
            if (s != null && (post || !"true".equalsIgnoreCase(request.getParameter(STATICIZE)))) {
                String name = s.name();
                if (StringUtil.isEmpty(name)) {
                    name = method.getName();
                }

                //分类方式
                String list = s.list();
                boolean isApp = s.isApp();
                StringBuffer url = new StringBuffer(baseUri);
                if (StringUtil.isEmpty(list)) {//单一页面不用做任何操作。
                } else {
                    //对应GoodsDetailController.getGoodsDetail.
                    // 如果以后要为其他页面静态化，修改下注解的list标识然后在这里自定义输出规则即可
                    if ("item".equals(list)) {
                        list = request.getRequestURI();
                        isApp = list.endsWith(Global.WHICH_APP);
                        list = list.substring(list.lastIndexOf("/") + 1, list.length() - (isApp ? Global.WHICH_APP.length() + 1 : 1));
                        name = name + "/" + list;
                    }
                }
                url.append(isApp ?  Global.TEMPLATE_APP : Global.TEMPLATE_MALL);
                url.append(PATH).append("/");
                url.append(name).append(".html");
                return url.toString();
            }
        }
        return null;
    }

    //抄AbstractTemplateView.renderMergedOutputModel方法
    private void buildTemplateModel(HttpServletRequest request, HttpServletResponse response, Map<String, Object> model) {

        boolean exposeRequestAttributes = true, exposeSessionAttributes = true, exposeSpringMacroHelpers = true;
        if (exposeRequestAttributes) {
            for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
                String attribute = (String) en.nextElement();
                Object attributeValue = request.getAttribute(attribute);
                model.put(attribute, attributeValue);
            }
        }

        if (exposeSessionAttributes) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                for (Enumeration en = session.getAttributeNames(); en.hasMoreElements(); ) {
                    String attribute = (String) en.nextElement();
                    Object attributeValue = session.getAttribute(attribute);
                    model.put(attribute, attributeValue);
                }
            }
        }

        if (exposeSpringMacroHelpers) {
            model.put(FreeMarkerView.SPRING_MACRO_REQUEST_CONTEXT_ATTRIBUTE,
                    new RequestContext(request, response, request.getServletContext(), model));
        }
    }


    /*
     *拦截访问地址，如果该地址启用静态化，直接返回静态化页面
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //设置语言
        request.setAttribute(DispatcherServlet.LOCALE_RESOLVER_ATTRIBUTE, new FixedLocaleResolver(Locale.CHINA));
        String name = null;
        if ((name = getStaticizeName(request, handler, false)) != null) {
            InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream("/../../" + name);
            //如果找不到该资源就不拦截
            BufferedOutputStream out = null;
            if (in != null) {
                //写入html内容
                response.setContentType("text/html;charset=utf-8");
                out = new BufferedOutputStream(response.getOutputStream());
                byte[] buff = new byte[2048];
                int bytesRead;
                while (-1 != (bytesRead = in.read(buff, 0, buff.length))) {
                    out.write(buff, 0, bytesRead);
                }
                in.close();
                out.close();
                return false;
            }

        }

        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
            throws Exception {
        String name = null;
        if ((name = getStaticizeName(request, handler, true)) != null) {
            //在相应地址生成静态化html页面
            Writer out = null;
            try {
                //获取freemarker配置
                WebApplicationContext webApplicationContext = (WebApplicationContext) request.getSession().getServletContext().getAttribute("org.springframework.web.servlet.FrameworkServlet.CONTEXT.springmvc");
                Configuration cfg = BeanFactoryUtils.beanOfTypeIncludingAncestors(webApplicationContext, FreeMarkerConfig.class, true, false).getConfiguration();

           /*     FreeMarkerViewResolver resolver = BeanFactoryUtils.beanOfTypeIncludingAncestors(webApplicationContext, FreeMarkerViewResolver.class, true, false);
                FreeMarkerView view = (FreeMarkerView) resolver.resolveViewName(modelAndView.getViewName(),request.getLocale());*/
                Map<String, Object> model = new HashMap<>(modelAndView.getModel());
                //添加获取freemarker配置编译的必须参数
                buildTemplateModel(request, response, model);
                //加载模板
                Template template = cfg.getTemplate(modelAndView.getViewName() + ".ftl", Locale.CHINA);
                String path = (String.valueOf(Thread.currentThread().getContextClassLoader().getResource("")) + "../../").replaceAll("file:/", "").replaceAll("%20", " ").trim();
                if (path.indexOf(":") != 1) {
                    path = File.separator + path;
                }

                //创建相应静态化文件
                File file = new File(path + name);
                if (!file.getParentFile().exists()) {
                    file.getParentFile().mkdirs();
                }
                out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "utf-8"));
                //输出编译后内容到指定页面
                template.process(model, out);
                out.flush();
                out.close();
            } catch (Exception e) {

            }
        }
        super.postHandle(request, response, handler, modelAndView);
    }
}
