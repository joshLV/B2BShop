package net.deepdragon.mybatis.plugins;

import java.sql.Statement;
import net.deepdragon.mybatis.executor.FastResultSetHandlerEx;
import net.deepdragon.mybatis.executor.NestedResultSetHandlerEx;
import net.deepdragon.mybatis.plugins.PluginAdapter;
import org.apache.commons.lang3.reflect.FieldUtils;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.resultset.NestedResultSetHandler;
import org.apache.ibatis.executor.resultset.ResultSetHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

@Intercepts({    @Signature(
        type = ResultSetHandler.class,
        method = "handleResultSets",
        args = {Statement.class}
)})
public class LazyLoadExtendResultSetHandlerPlugin extends PluginAdapter {
    public LazyLoadExtendResultSetHandlerPlugin() {
    }

    public Object intercept(Invocation invocation) throws Throwable {
        Object target = invocation.getTarget();
        return target instanceof NestedResultSetHandler?(new NestedResultSetHandlerEx((Executor)FieldUtils.readDeclaredField(target, "executor", true), (MappedStatement)FieldUtils.readDeclaredField(target, "mappedStatement", true), (ParameterHandler)FieldUtils.readDeclaredField(target, "parameterHandler", true), (ResultHandler)FieldUtils.readDeclaredField(target, "resultHandler", true), (BoundSql)FieldUtils.readDeclaredField(target, "boundSql", true), (RowBounds)FieldUtils.readDeclaredField(target, "rowBounds", true))).handleResultSets((Statement)invocation.getArgs()[0]):(new FastResultSetHandlerEx((Executor)FieldUtils.readDeclaredField(target, "executor", true), (MappedStatement)FieldUtils.readDeclaredField(target, "mappedStatement", true), (ParameterHandler)FieldUtils.readDeclaredField(target, "parameterHandler", true), (ResultHandler)FieldUtils.readDeclaredField(target, "resultHandler", true), (BoundSql)FieldUtils.readDeclaredField(target, "boundSql", true), (RowBounds)FieldUtils.readDeclaredField(target, "rowBounds", true))).handleResultSets((Statement)invocation.getArgs()[0]);
    }
}
