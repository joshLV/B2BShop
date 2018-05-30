package net.deepdragon.weipu.controller;

import net.deepdragon.entity.SystemSet;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.weipu.listeners.ApplicationContextListener;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

public abstract class BaseController {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());

	@Resource
	protected MessageSource messageSource;
	
	private String logInfo;// 日志记录信息
	private String redirectionUrl;// 操作提示后的跳转URL,为null则返回前一页

	private Integer whichPlat = 1;//设置系统平台   HKS 2015-11-10 ADD    所属平台(1、B2C，2、B2B&B2C，3、B2B)

	@InitBinder
	protected void initBinder(HttpServletRequest request,  
	                              ServletRequestDataBinder binder) throws Exception {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd"); 
	    CustomDateEditor dateEditor = new CustomDateEditor(fmt, true); 
	    binder.registerCustomEditor(Date.class, dateEditor);//对于需要转换为Date类型的属性，使用DateEditor进行处理  
	}
	
	public String getLogInfo() {
		return logInfo;
	}

	public void setLogInfo(String logInfo) {
		this.logInfo = logInfo;
	}

	public String getRedirectionUrl() {
		return redirectionUrl;
	}

	public void setRedirectionUrl(String redirectionUrl) {
		this.redirectionUrl = redirectionUrl;
	}

	/**
	 * i18n操作
	 * 
	 * @param key
	 * @param args
	 * @param request
	 * @return
	 */
	public String getMessage(String key, Object[] args,
			HttpServletRequest request) {
		String message = null;
		try {
			String lang = request.getParameter("locale");
			if (StringUtils.isNotEmpty(lang) && lang.indexOf("_") > 0) {
				java.util.StringTokenizer token = new java.util.StringTokenizer(
						lang, "_");
				String _lang = token.nextToken();
				String _country = token.nextToken();
				Locale local = new Locale(_lang, _country);
				message = messageSource.getMessage(key, args, local);
			} else {
				message = messageSource.getMessage(key, args, Locale.CHINA);
			}
		} catch (Exception ex) {
			message = messageSource.getMessage(key, args, Locale.CHINA);
		}
		return message;
	}

	// 获取Parameter
	public String getParameter(HttpServletRequest request, String name) {
		return request.getParameter(name);
	}

//	// 获取Parameter数组
//	public String[] getParameterValues(String name) {
//		return getRequest().getParameterValues(name);
//	}
	
	public String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	public ServletContext getServletContext() {
		return ApplicationContextListener.getServletContext();
	}
	
	public String urlDecoder(String encodeStr){
		String targetStr = encodeStr;
		try {
			if (StringUtils.isNotEmpty(targetStr)) {
				targetStr = URLDecoder.decode(encodeStr, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return targetStr;
	}
	
	// 是否使用ERP-API
	public boolean isUseErpApi(Map<String, Object> paramMap) {
		boolean userErpApi = false;
		SystemSetService systemSetService = ApplicationContextListener.getSpringApplicationContext().getBean(SystemSetService.class);
		try {
			SystemSet systemSet = systemSetService.find(paramMap, "setkey", "isEnableERP");
			if (systemSet != null) {
				userErpApi = StringUtils.equalsIgnoreCase("true", systemSet.getSetvalue());
			}
		} catch (Exception e) {
			logger.error("BaseController中获取isUseErpApi时，发生异常", e);
			e.printStackTrace();
		}
		return userErpApi;
	}

	public Integer getWhichPlat() {
		return whichPlat;
	}

}
