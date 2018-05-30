package net.deepdragon.mybatis.plugins;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Paginator;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.mybatis.support.Dialect;
import net.deepdragon.mybatis.support.PropertiesUtils;
import net.deepdragon.mybatis.support.SQLUtils;
import org.apache.ibatis.cache.Cache;
import org.apache.ibatis.cache.CacheKey;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.SqlSource;
import org.apache.ibatis.mapping.MappedStatement.Builder;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Intercepts({    @Signature(
        type = Executor.class,
        method = "query",
        args = {MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class}
)})
public class PagerInterceptor extends PluginAdapter {
    private static Logger logger = LoggerFactory.getLogger(PagerInterceptor.class);
    private static int MAPPED_STATEMENT_INDEX = 0;
    private static int PARAMETER_INDEX = 1;
    private static int ROWBOUNDS_INDEX = 2;
    private static ExecutorService executorService;
    private Dialect dialect;
    boolean asyncTotalCount = false;

    public PagerInterceptor() {
    }

    public Object intercept(final Invocation invocation) throws Throwable {
        final Executor executor = (Executor)invocation.getTarget();
        Object[] queryArgs = invocation.getArgs();
        final MappedStatement ms = (MappedStatement)queryArgs[MAPPED_STATEMENT_INDEX];
        final Object parameter = queryArgs[PARAMETER_INDEX];
        RowBounds rowBounds = (RowBounds)queryArgs[ROWBOUNDS_INDEX];
        if(rowBounds != null && rowBounds != RowBounds.DEFAULT) {
            final PageBounds pageBounds = new PageBounds(rowBounds);
            int offset = pageBounds.getOffset();
            final int pageSize = pageBounds.getPageSize().intValue();
            final int pageNumber = pageBounds.getPageNumber();
            final BoundSql boundSql = ms.getBoundSql(parameter);
            final StringBuffer bufferSql = new StringBuffer(boundSql.getSql().trim());
            if(bufferSql.lastIndexOf(";") == bufferSql.length() - 1) {
                bufferSql.deleteCharAt(bufferSql.length() - 1);
            }

            String sql = bufferSql.toString();
            Callable countTask = null;
            if(this.dialect.supportsLimit() && (offset != 0 || pageSize != 2147483647)) {
                countTask = new Callable() {
                    public Paginator call() throws Exception {
                        Integer totalCount = null;
                        Cache cache = ms.getCache();
                        if(cache != null && ms.isUseCache()) {
                            CacheKey cacheKey = executor.createCacheKey(ms, parameter, pageBounds, PagerInterceptor.this.copyFromBoundSql(ms, boundSql, bufferSql.toString()));
                            totalCount = (Integer)cache.getObject(cacheKey);
                            if(totalCount == null) {
                                totalCount = Integer.valueOf(SQLUtils.getCount(bufferSql.toString(), ms, parameter, boundSql, PagerInterceptor.this.dialect));
                                cache.putObject(cacheKey, totalCount);
                            }
                        } else {
                            totalCount = Integer.valueOf(SQLUtils.getCount(bufferSql.toString(), ms, parameter, boundSql, PagerInterceptor.this.dialect));
                        }

                        return new Paginator(pageNumber, pageSize, totalCount.intValue());
                    }
                };
                if(this.dialect.supportsLimitOffset()) {
                    sql = this.dialect.getLimitString(sql, offset, pageSize);
                } else {
                    sql = this.dialect.getLimitString(sql, 0, pageSize);
                }

                queryArgs[ROWBOUNDS_INDEX] = new RowBounds(0, 2147483647);
            }

            queryArgs[MAPPED_STATEMENT_INDEX] = this.copyFromNewSql(ms, boundSql, sql);
            if(logger.isDebugEnabled()) {
                logger.debug("pager sql:" + sql);
            }

            Boolean async = Boolean.valueOf(pageBounds.getAsyncTotalCount() == null?this.asyncTotalCount:pageBounds.getAsyncTotalCount().booleanValue());
            Future listFuture = this.call(new Callable() {
                public List<?> call() throws Exception {
                    Object result = invocation.proceed();
                    return (List)result;
                }
            }, async.booleanValue());
            if(countTask != null) {
                Future countFutrue = this.call(countTask, async.booleanValue());
                PageList pageList = new PageList((Collection)listFuture.get(), (Paginator)countFutrue.get());
                return pageList;
            } else {
                return listFuture.get();
            }
        } else {
            return invocation.proceed();
        }
    }

    private <T> Future<T> call(Callable<T> callable, boolean async) {
        if(async) {
            return executorService.submit(callable);
        } else {
            FutureTask future = new FutureTask(callable);
            future.run();
            return future;
        }
    }

    private BoundSql copyFromBoundSql(MappedStatement ms, BoundSql boundSql, String sql) {
        BoundSql newBoundSql = new BoundSql(ms.getConfiguration(), sql, boundSql.getParameterMappings(), boundSql.getParameterObject());
        Iterator var6 = boundSql.getParameterMappings().iterator();

        while(var6.hasNext()) {
            ParameterMapping mapping = (ParameterMapping)var6.next();
            String prop = mapping.getProperty();
            if(boundSql.hasAdditionalParameter(prop)) {
                newBoundSql.setAdditionalParameter(prop, boundSql.getAdditionalParameter(prop));
            }
        }

        return newBoundSql;
    }

    private MappedStatement copyFromNewSql(MappedStatement ms, BoundSql boundSql, String sql) {
        BoundSql newBoundSql = this.copyFromBoundSql(ms, boundSql, sql);
        return this.copyFromMappedStatement(ms, new BoundSqlSqlSource(newBoundSql));
    }

    private MappedStatement copyFromMappedStatement(MappedStatement ms, SqlSource newSqlSource) {
        Builder builder = new Builder(ms.getConfiguration(), ms.getId(), newSqlSource, ms.getSqlCommandType());
        builder.resource(ms.getResource());
        builder.fetchSize(ms.getFetchSize());
        builder.statementType(ms.getStatementType());
        builder.keyGenerator(ms.getKeyGenerator());
        if(ms.getKeyProperties() != null && ms.getKeyProperties().length != 0) {
            StringBuffer keyProperties = new StringBuffer();
            String[] var8;
            int var7 = (var8 = ms.getKeyProperties()).length;

            for(int var6 = 0; var6 < var7; ++var6) {
                String keyProperty = var8[var6];
                keyProperties.append(keyProperty).append(",");
            }

            keyProperties.delete(keyProperties.length() - 1, keyProperties.length());
            builder.keyProperty(keyProperties.toString());
        }

        builder.timeout(ms.getTimeout());
        builder.parameterMap(ms.getParameterMap());
        builder.resultMaps(ms.getResultMaps());
        builder.resultSetType(ms.getResultSetType());
        builder.cache(ms.getCache());
        builder.flushCacheRequired(ms.isFlushCacheRequired());
        builder.useCache(ms.isUseCache());
        return builder.build();
    }

    public void setProperties(Properties properties) {
        PropertiesUtils propertiesHelper = new PropertiesUtils(properties);
        String dialectClass = propertiesHelper.getRequiredString("dialectClass");

        try {
            this.setDialect((Dialect)Class.forName(dialectClass).newInstance());
        } catch (Exception var5) {
            throw new RuntimeException("cannot create dialect instance by dialectClass:" + dialectClass, var5);
        }

        this.setAsyncTotalCount(propertiesHelper.getBoolean("asyncTotalCount", false));
        this.setPoolMaxSize(propertiesHelper.getInt("poolMaxSize", 0));
    }

    public void setDialect(Dialect dialect) {
        logger.debug("dialectClass: {} ", dialect.getClass().getName());
        this.dialect = dialect;
    }

    public void setAsyncTotalCount(boolean asyncTotalCount) {
        logger.debug("asyncTotalCount: {} ", Boolean.valueOf(asyncTotalCount));
        this.asyncTotalCount = asyncTotalCount;
    }

    public void setPoolMaxSize(int poolMaxSize) {
        if(poolMaxSize > 0) {
            logger.debug("poolMaxSize: {} ", Integer.valueOf(poolMaxSize));
            executorService = Executors.newFixedThreadPool(poolMaxSize);
        } else {
            executorService = Executors.newCachedThreadPool();
        }

    }

    public static class BoundSqlSqlSource implements SqlSource {
        BoundSql boundSql;

        public BoundSqlSqlSource(BoundSql boundSql) {
            this.boundSql = boundSql;
        }

        public BoundSql getBoundSql(Object parameterObject) {
            return this.boundSql;
        }
    }
}
