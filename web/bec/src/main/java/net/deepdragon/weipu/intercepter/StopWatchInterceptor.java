package net.deepdragon.weipu.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.deepdragon.weipu.Global;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * Spring自带StopWatch工具类来实现时间跟踪，关键一点interceptor不是线程安全的。我们需要借助threadlocal来实现线程安全。
 */
@Component(Global.APP_SIGN + "StopWatchInterceptor")
public class StopWatchInterceptor extends HandlerInterceptorAdapter {

	private Logger logger = LoggerFactory.getLogger(StopWatchInterceptor.class);

	public static final ThreadLocal<StopWatch> stopWatchLocal = new ThreadLocal<StopWatch>();

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		if (Global.PERFORMANCE_MONITORING) {
			try {
				StopWatch stopWatch = new StopWatch(handler.toString());
				stopWatchLocal.set(stopWatch);
				stopWatch.start(handler.toString());
			} catch (Exception e) {
				logger.error("StopWatchInterceptor preHandle Exception:" + e);
				e.printStackTrace();
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		if (modelAndView != null && Global.PERFORMANCE_MONITORING) {
			StopWatch stopWatch = stopWatchLocal.get();
			stopWatch.stop();
			String currentPath = request.getRequestURI();
			String queryString = request.getQueryString();
			queryString = queryString == null ? "" : "?" + queryString;
			logger.warn("Performance monitoring --> access url path:"
					+ currentPath + queryString + " | time:"
					+ stopWatch.getTotalTimeMillis());
			stopWatchLocal.remove();
		}

		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if (ex != null) {
			logger.error("StopWatchInterceptor afterCompletion Exception:", ex);
		}
	}

}
