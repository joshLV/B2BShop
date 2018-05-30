package net.deepdragon.router.datasource.advice;

import java.lang.reflect.Method;
import java.util.Map;

import net.deepdragon.exceptions.RoutingException;
import net.deepdragon.router.holder.RoutingHolder;
import net.deepdragon.router.holder.RoutingIdentity;
import net.deepdragon.util.Constant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.stereotype.Component;

@Component
public class RoutingDataSourceBeforeAdvice implements MethodBeforeAdvice {
    protected static final Logger logger = LoggerFactory.getLogger(RoutingDataSourceBeforeAdvice.class);

    public RoutingDataSourceBeforeAdvice() {
    }

    public void before(Method method, Object[] args, Object target) throws Throwable {
        if(args.length < 1) {
            throw new RoutingException("method args no define,please check:" + method.getName());
        } else {
            String tenantId = ((Map<String,Object>)args[0]).get(Constant.TENANTID_KEY).toString();
            RoutingIdentity routingIdentity = new RoutingIdentity();
            routingIdentity.setTenantId(tenantId);
            routingIdentity.setMethodName(method.getName());
            RoutingHolder.setRoutingIdentity(routingIdentity);
        }
    }
}
