package net.deepdragon.mybatis.plugins;

import java.util.Properties;
import net.deepdragon.mybatis.plugins.PluginAdapter;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Intercepts({    @Signature(
        type = Executor.class,
        method = "update",
        args = {MappedStatement.class, Object.class}
),     @Signature(
        type = Executor.class,
        method = "query",
        args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class}
)})
public class MyBatisLogInterceptor extends PluginAdapter {
    private long slowExecuteTime = 100L;
    public static final long DEFAULT_SQL_SLOW_EXECUTE_TIME = 100L;
    private final Logger logger = LoggerFactory.getLogger(MyBatisLogInterceptor.class);

    public MyBatisLogInterceptor() {
    }

    public Object intercept(Invocation invocation) throws Throwable {
        long startTime = System.currentTimeMillis();
        Object result = invocation.proceed();
        long executeTime = System.currentTimeMillis() - startTime;
        if(executeTime < this.slowExecuteTime) {
            this.logger.debug("<== Sql executed time: [" + executeTime + "] ms");
        } else {
            this.logger.warn("<== Sql executed time is too slow: [" + executeTime + "] ms");
        }

        return result;
    }

    public void setProperties(Properties props) {
        String slowTime = props.getProperty("slowExecuteTime");
        if(slowTime != null && !slowTime.isEmpty()) {
            this.slowExecuteTime = Long.parseLong(slowTime);
        }

    }

    public long getSlowExecuteTime() {
        return this.slowExecuteTime;
    }

    public void setSlowExecuteTime(long slowExecuteTime) {
        this.slowExecuteTime = slowExecuteTime;
    }
}
