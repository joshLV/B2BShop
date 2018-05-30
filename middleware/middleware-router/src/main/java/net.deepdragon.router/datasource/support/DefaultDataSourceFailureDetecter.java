package net.deepdragon.router.datasource.support;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidPooledConnection;
import com.alibaba.druid.support.logging.Log;
import com.alibaba.druid.support.logging.LogFactory;
import com.alibaba.druid.util.JdbcUtils;
import java.sql.SQLException;
import java.sql.Statement;
import net.deepdragon.router.datasource.support.DataSourceFailureDetecter;

public class DefaultDataSourceFailureDetecter implements DataSourceFailureDetecter {
    private static final Log LOG = LogFactory.getLog(DefaultDataSourceFailureDetecter.class);
    private long maxWaitMillis = 3000L;
    private String validateSql = "SELECT 1";

    public DefaultDataSourceFailureDetecter() {
    }

    public long getMaxWaitMillis() {
        return this.maxWaitMillis;
    }

    public void setMaxWaitMillis(long maxWaitMillis) {
        this.maxWaitMillis = maxWaitMillis;
    }

    public String getValidateSql() {
        return this.validateSql;
    }

    public void setValidateSql(String validateSql) {
        this.validateSql = validateSql;
    }

    public boolean isValid(DruidDataSource dataSource) {
        DruidPooledConnection conn = null;
        Statement stmt = null;

        try {
            conn = dataSource.getConnection(this.maxWaitMillis);
            if(conn != null) {
                stmt = conn.createStatement();
                stmt.execute(this.getValidateSql());
                return true;
            }

            return false;
        } catch (SQLException var9) {
            LOG.error("check datasource valid errror:" + var9.getMessage());
        } catch (Exception var10) {
            LOG.error("check datasource valid errror:" + var10.getMessage());
        } finally {
            JdbcUtils.close(stmt);
            JdbcUtils.close(conn);
        }

        return false;
    }
}
