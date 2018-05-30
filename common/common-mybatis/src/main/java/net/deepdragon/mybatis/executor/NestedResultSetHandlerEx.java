package net.deepdragon.mybatis.executor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import net.deepdragon.mybatis.executor.ResultLoaderEx;
import org.apache.ibatis.cache.Cache;
import org.apache.ibatis.cache.CacheKey;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.loader.ResultLoaderMap;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.resultset.NestedResultSetHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ResultMapping;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;

public class NestedResultSetHandlerEx extends NestedResultSetHandler {
    public NestedResultSetHandlerEx(Executor executor, MappedStatement mappedStatement, ParameterHandler parameterHandler, ResultHandler resultHandler, BoundSql boundSql, RowBounds rowBounds) {
        super(executor, mappedStatement, parameterHandler, resultHandler, boundSql, rowBounds);
    }

    protected Object getNestedQueryConstructorValue(ResultSet rs, ResultMapping constructorMapping, String columnPrefix) throws SQLException {
        String nestedQueryId = constructorMapping.getNestedQueryId();
        MappedStatement nestedQuery = this.configuration.getMappedStatement(nestedQueryId);
        Class nestedQueryParameterType = nestedQuery.getParameterMap().getType();
        Object nestedQueryParameterObject = this.prepareParameterForNestedQuery(rs, constructorMapping, nestedQueryParameterType, columnPrefix);
        Object value = null;
        if(nestedQueryParameterObject != null) {
            BoundSql nestedBoundSql = nestedQuery.getBoundSql(nestedQueryParameterObject);
            CacheKey key = this.executor.createCacheKey(nestedQuery, nestedQueryParameterObject, RowBounds.DEFAULT, nestedBoundSql);
            Class targetType = constructorMapping.getJavaType();
            Object nestedQueryCacheObject = this.getNestedQueryCacheObject(nestedQuery, key);
            if(nestedQueryCacheObject != null && nestedQueryCacheObject instanceof List) {
                value = this.resultExtractor.extractObjectFromList((List)nestedQueryCacheObject, targetType);
            } else {
                ResultLoaderEx resultLoader = new ResultLoaderEx(this.configuration, this.executor, nestedQuery, nestedQueryParameterObject, targetType, key, nestedBoundSql);
                value = resultLoader.loadResult();
            }
        }

        return value;
    }

    protected Object getNestedQueryMappingValue(ResultSet rs, MetaObject metaResultObject, ResultMapping propertyMapping, ResultLoaderMap lazyLoader, String columnPrefix) throws SQLException {
        String nestedQueryId = propertyMapping.getNestedQueryId();
        String property = propertyMapping.getProperty();
        MappedStatement nestedQuery = this.configuration.getMappedStatement(nestedQueryId);
        Class nestedQueryParameterType = nestedQuery.getParameterMap().getType();
        Object nestedQueryParameterObject = this.prepareParameterForNestedQuery(rs, propertyMapping, nestedQueryParameterType, columnPrefix);
        Object value = this.OMIT;
        if(nestedQueryParameterObject != null) {
            BoundSql nestedBoundSql = nestedQuery.getBoundSql(nestedQueryParameterObject);
            CacheKey key = this.executor.createCacheKey(nestedQuery, nestedQueryParameterObject, RowBounds.DEFAULT, nestedBoundSql);
            Class targetType = propertyMapping.getJavaType();
            Object nestedQueryCacheObject = this.getNestedQueryCacheObject(nestedQuery, key);
            if(nestedQueryCacheObject != null && nestedQueryCacheObject instanceof List) {
                value = this.resultExtractor.extractObjectFromList((List)nestedQueryCacheObject, targetType);
            } else if(this.executor.isCached(nestedQuery, key)) {
                this.executor.deferLoad(nestedQuery, metaResultObject, property, key, targetType);
            } else {
                ResultLoaderEx resultLoader = new ResultLoaderEx(this.configuration, this.executor, nestedQuery, nestedQueryParameterObject, targetType, key, nestedBoundSql);
                if(this.configuration.isLazyLoadingEnabled()) {
                    lazyLoader.addLoader(property, metaResultObject, resultLoader);
                } else {
                    value = resultLoader.loadResult();
                }
            }
        }

        return value;
    }

    private Object getNestedQueryCacheObject(MappedStatement nestedQuery, CacheKey key) {
        Cache nestedQueryCache = nestedQuery.getCache();
        return nestedQueryCache != null?nestedQueryCache.getObject(key):null;
    }
}
