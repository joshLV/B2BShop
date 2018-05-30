package net.deepdragon.weipu.resolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.deepdragon.weipu.controller.BaseController;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

/**
 * 全局异常处理类
 */
public class GlobalExceptionResolver extends SimpleMappingExceptionResolver {
	
	@Override
	protected ModelAndView doResolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {

		logger.error("GlobalExceptionResolver request" + request);
		logger.error("GlobalExceptionResolver response" + response);
		logger.error("GlobalExceptionResolver handler" + handler);
		logger.error("GlobalExceptionResolver", ex);

		String logInfo = null;
		if (handler instanceof BaseController) {
			BaseController controller = (BaseController) handler;
			logInfo = controller.getLogInfo();
			logger.error("GlobalExceptionResolver logInfo:" + logInfo);
		}

		ModelAndView modelAndView = super.doResolveException(request, response,
				handler, ex);
		modelAndView.addObject("errorMessage", logInfo + "时，发生异常！");
		modelAndView.addObject("exceptionMessage", ex.getMessage());
		return modelAndView;
	}

}
