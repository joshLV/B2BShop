package net.deepdragon.mybatis.plugins;

import java.sql.Statement;
import net.deepdragon.util.IdWorker;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.executor.keygen.KeyGenerator;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.session.Configuration;

public class IDKeyGenerator implements KeyGenerator {
    private IdWorker idWorker;

    public IDKeyGenerator(IdWorker idWorker) {
        this.idWorker = idWorker;
    }

    public void processBefore(Executor executor, MappedStatement ms, Statement stmt, Object parameter) {
        this.processGeneratedKeys(executor, ms, parameter);
    }

    public void processAfter(Executor executor, MappedStatement ms, Statement stmt, Object parameter) {
    }

    private void processGeneratedKeys(Executor executor, MappedStatement ms, Object parameter) {
        if(ms.getSqlCommandType() == SqlCommandType.INSERT) {
            if(parameter != null && ms.getKeyProperties() != null) {
                try {
                    Configuration e = ms.getConfiguration();
                    MetaObject metaParam = e.newMetaObject(parameter);
                    String keyProperty = ms.getKeyProperties()[0];
                    if(metaParam.getGetterType(keyProperty) == String.class && metaParam.hasGetter(keyProperty) && metaParam.hasSetter(keyProperty) && (metaParam.getValue(keyProperty) == null || "".equals(metaParam.getValue(keyProperty)))) {
                        metaParam.setValue(keyProperty, Long.toString(this.idWorker.getId()));
                    }
                } catch (Exception var7) {
                    throw new ExecutorException("Error selecting key or setting result to parameter object. Cause: " + var7, var7);
                }
            }

        }
    }
}
