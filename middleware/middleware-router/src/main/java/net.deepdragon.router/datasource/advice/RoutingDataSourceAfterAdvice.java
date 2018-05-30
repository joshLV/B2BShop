package net.deepdragon.router.datasource.advice;

import java.lang.reflect.Method;
import net.deepdragon.router.holder.RoutingHolder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.stereotype.Component;

@Component
public class RoutingDataSourceAfterAdvice implements AfterReturningAdvice {
    protected static final Logger logger = LoggerFactory.getLogger(RoutingDataSourceAfterAdvice.class);

    public RoutingDataSourceAfterAdvice() {
    }

    public void afterReturning(Object returnValue, Method method, Object[] args, Object target) throws Throwable {
        RoutingHolder.clean();
    }
}
