package net.deepdragon.router.datasource.advice;

import java.lang.reflect.Method;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.stereotype.Component;

@Component
public class RoutingDataSourceThrowsAdvice implements ThrowsAdvice {
    protected static final Logger logger = LoggerFactory.getLogger(RoutingDataSourceThrowsAdvice.class);

    public RoutingDataSourceThrowsAdvice() {
    }

    public void afterThrowing(Method method, Object[] args, Object target, Exception ex) {
        logger.info("*************************************");
        logger.info("Error happened in class: " + target.getClass().getName());
        logger.info("Error happened in method: " + method.getName());
        logger.info("Error happened in args.length: " + args.length);

        for(int i = 0; i < args.length; ++i) {
            logger.info("arg[" + i + "]: " + args[i]);
        }

        logger.info("Exception class: " + ex.getClass().getName());
        logger.info("*************************************");
    }
}
