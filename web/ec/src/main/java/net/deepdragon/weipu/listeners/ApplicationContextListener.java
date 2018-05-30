package net.deepdragon.weipu.listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class ApplicationContextListener implements ServletContextListener {

	protected static Logger logger = LoggerFactory
			.getLogger(ApplicationContextListener.class);

	private static WebApplicationContext springApplicationContext;
	
	private static ServletContext servletContext;

	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		logger.debug("ApplicationContextListener		destroy ...");
	}

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		logger.debug("ApplicationContextListener		init ...");
		
		servletContext = servletContextEvent.getServletContext();
		
		springApplicationContext = WebApplicationContextUtils
				.getWebApplicationContext(servletContext);
	}

	public static ApplicationContext getSpringApplicationContext() {
		return springApplicationContext;
	}

	public static ServletContext getServletContext() {
		return servletContext;
	}

}
