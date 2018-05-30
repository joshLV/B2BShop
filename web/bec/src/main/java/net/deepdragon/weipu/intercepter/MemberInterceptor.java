package net.deepdragon.weipu.intercepter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.Member;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.bean.UserCookie;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 拦截器 - 判断会员是否登录
 */
@Component(Global.APP_SIGN + "MemberInterceptor")
public class MemberInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		logger.info("====== MemberInterceptor preHandle ====== RequestURI:" + request.getRequestURI());
		logger.info("====== MemberInterceptor preHandle ====== RequestURL:" + request.getRequestURL());
		
		Buyer currentMember = (Buyer) request.getSession().getAttribute(Global.CURRENT_MERMBER);
		
		logger.debug("====== MemberInterceptor preHandle ====== currentMember:" + currentMember);
		
		if (currentMember == null) {
			logger.debug("====== MemberInterceptor preHandle ====== 未登录，跳转到登录页面。");
			
			Cookie rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, null);
			rememberMeCookie.setPath(request.getContextPath() + "/");
			rememberMeCookie.setMaxAge(-1);
			response.addCookie(rememberMeCookie);

			String whichclient = request.getParameter(Global.WHICHCLIENT)+"";
			if(Global.WHICH_APP.equals(whichclient)){
				StringBuffer sb = new StringBuffer();
				String urlStr = request.getContextPath() + "/member/login?whichclient=whichapp";
				sb.append(urlStr);
				sb.append(whichclient);
				response.sendRedirect(urlStr.toString());
			}else {
				response.sendRedirect(request.getContextPath() + "/member/login");
			}
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

}
