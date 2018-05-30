package net.deepdragon.mybatis.executor;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.sql.DataSource;
import org.apache.ibatis.cache.CacheKey;
import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.executor.loader.ResultLoader;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.TransactionIsolationLevel;
import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.TransactionFactory;

public class ResultLoaderEx extends ResultLoader {
    public ResultLoaderEx(Configuration config, Executor executor, MappedStatement mappedStatement, Object parameterObject, Class<?> targetType, CacheKey cacheKey, BoundSql boundSql) {
        super(config, executor, mappedStatement, parameterObject, targetType, cacheKey, boundSql);
    }

    public Object loadResult() throws SQLException {
        List list = this.selectList();
        this.resultObject = this.resultExtractor.extractObjectFromList(list, this.targetType);
        return this.resultObject;
    }

    private <E> List<E> selectList() throws SQLException {
        Executor localExecutor = this.executor;
        if(localExecutor.isClosed()) {
            localExecutor = this.newExecutor();
        } else {
            Connection conn = localExecutor.getTransaction().getConnection();
            if(conn == null || conn.isClosed()) {
                localExecutor = this.newExecutor();
            }
        }

        List var3;
        try {
            var3 = localExecutor.query(this.mappedStatement, this.parameterObject, RowBounds.DEFAULT, Executor.NO_RESULT_HANDLER, this.cacheKey, this.boundSql);
        } finally {
            if(localExecutor != this.executor) {
                localExecutor.close(false);
            }

        }

        return var3;
    }

    private Executor newExecutor() throws SQLException {
        Environment environment = this.configuration.getEnvironment();
        if(environment == null) {
            throw new ExecutorException("ResultLoader could not load lazily.  Environment was not configured.");
        } else {
            DataSource ds = environment.getDataSource();
            if(ds == null) {
                throw new ExecutorException("ResultLoader could not load lazily.  DataSource was not configured.");
            } else {
                TransactionFactory transactionFactory = environment.getTransactionFactory();
                Transaction tx = transactionFactory.newTransaction(ds, (TransactionIsolationLevel)null, false);
                return this.configuration.newExecutor(tx, ExecutorType.SIMPLE);
            }
        }
    }
}