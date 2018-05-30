package net.deepdragon.mybatis.plugins;

import net.deepdragon.mybatis.plugins.IDKeyGenerator;
import net.deepdragon.mybatis.plugins.PluginAdapter;
import net.deepdragon.util.IdWorker;
import net.deepdragon.util.ReflectUtils;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;

@Intercepts({    @Signature(
        type = Executor.class,
        method = "update",
        args = {MappedStatement.class, Object.class}
)})
public class IDInterceptor extends PluginAdapter {
    private IdWorker idWorker;

    public IDInterceptor(IdWorker idWorker) {
        this.idWorker = idWorker;
    }

    public Object intercept(Invocation invocation) throws Throwable {
        MappedStatement mappedStatement = (MappedStatement)invocation.getArgs()[0];
        if(mappedStatement.getSqlCommandType() == SqlCommandType.INSERT) {
            ReflectUtils.setValueByFieldName(mappedStatement, "keyGenerator", new IDKeyGenerator(this.idWorker));
        }

        return invocation.proceed();
    }
}
