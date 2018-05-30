package net.deepdragon.weipu.intercepter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.Member;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.bean.UserCookie;

import net.deepdragon.weipu.controller.mall.BaseMallController;
import net.deepdragon.weipu.tools.BrowserUtils;
import net.deepdragon.weipu.tools.IpUtil;
import net.deepdragon.weipu.tools.mail.UrlLogThread;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import java.util.List;

//@Component(Global.APP_SIGN + "UriInterceptor")
public class UriInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private static String currencySign = "￥";// 货币符号
	private static String currencyUnit = "元";// 货币单位

	private List<String> notNeedUrls;
	private List<String> urlMatchingArray;

	public List<String> getNotNeedUrls() {
		return notNeedUrls;
	}

	public void setNotNeedUrls(List<String> notNeedUrls) {
		this.notNeedUrls = notNeedUrls;
	}

	public List<String> getUrlMatchingArray() {
		return urlMatchingArray;
	}

	public void setUrlMatchingArray(List<String> urlMatchingArray) {
		this.urlMatchingArray = urlMatchingArray;
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		logger.debug("====== UriInterceptor preHandle ====== IP:"
				+ request.getRemoteAddr());
		logger.debug("====== UriInterceptor preHandle ====== handler:"
				+ handler);
		
		String requestURI = request.getRequestURI();

		/** 添加访问记录  TianYu 2016-04-11 14:48:51 Start */
		Buyer member = (Buyer) request.getSession().getAttribute(Global.CURRENT_MERMBER);

		boolean flag = true;
		for (String matchStr : notNeedUrls) {
			flag = StringUtils.contains(requestURI, matchStr);
			if(flag){
				break;
			}
		}
		if(!flag){
			try {
				String getParam = request.getQueryString();

				String url = StringUtil.isNotEmpty(getParam) ? requestURI + "?" + getParam : requestURI;

				UrlLogThread urlLogThread = new UrlLogThread(url, request.getParameterMap(), BrowserUtils.checkBrowse(request), member != null ? member.getId() : "游客",
						member != null ? member.getOpenId() : "", IpUtil.getIpAddr(request), "");
				Thread thread = new Thread(urlLogThread);
				thread.start();
			}catch (Exception e){
				logger.error("save urllog error:"+e);
			}
		}
		/** 添加访问记录  TianYu 2016-04-11 14:48:51 End */

//		String[] urlMatchingArray = new String[] { "/static/", "/admin/", "/merchant/", "/member/", "/order/", "/payment/", "/enquiry/", "/quotation/","/buyerMerchant/", "/zcorder/" };
		boolean isMatching = true;
		for (String matchStr : urlMatchingArray) {
			isMatching = StringUtils.contains(requestURI, matchStr);
			if(isMatching){
				break;
			}
		}
		
		if (!isMatching) {
			logger.debug("====== UriInterceptor preHandle ====== 会员不登陆就能够访问的非静态资源文件页面   requestURI:" + requestURI);
			
			//如果会员未登录,清除一些Cookie信息
			Buyer currentMember = (Buyer) request.getSession().getAttribute(Global.CURRENT_MERMBER);
			if (currentMember == null) {
				Cookie rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, null);
				rememberMeCookie.setPath(request.getContextPath() + "/");
				rememberMeCookie.setMaxAge(-1);
				response.addCookie(rememberMeCookie);
			}
			
		}
		
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.debug("====== UriInterceptor postHandle ====== URI:"
				+ request.getRequestURI());
		super.postHandle(request, response, handler, modelAndView);
		
		if (modelAndView != null) {
			if (request.getSession().getAttribute("priceCurrencyFormat") == null) {
				request.getSession().setAttribute("priceFormat", "#0.00");// 获取商品价格格式
				request.getSession().setAttribute("priceCurrencyFormat", currencySign + "#0.00");// 获取商品价格货币格式
				request.getSession().setAttribute("priceUnitCurrencyFormat", currencySign + "#0.00" + currencyUnit);// 获取商品价格货币格式（包含货币单位）
				request.getSession().setAttribute("orderCurrencyFormat", currencySign + "#0.00");// 获取订单货币格式
				request.getSession().setAttribute("orderUnitCurrencyFormat", currencySign + "#0.00" + currencyUnit);// 获取订单货币格式（包含货币单位）
			}
		}
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		logger.debug("====== UriInterceptor afterCompletion ====== ");

	}

}
