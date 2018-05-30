package net.deepdragon.mybatis.support;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import net.deepdragon.mybatis.support.Dialect;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SQLUtils {
    private static Logger logger = LoggerFactory.getLogger(SQLUtils.class);

    public SQLUtils() {
    }

    public static int getCount(String sql, MappedStatement mappedStatement, Object parameterObject, BoundSql boundSql, Dialect dialect) throws SQLException {
        String count_sql = dialect.getCountString(sql);
        logger.debug("Total count SQL [{}] ", count_sql);
        logger.debug("Total count Parameters: {} ", parameterObject);
        Connection connection = null;
        PreparedStatement countStmt = null;
        ResultSet rs = null;

        int var13;
        try {
            connection = mappedStatement.getConfiguration().getEnvironment().getDataSource().getConnection();
            countStmt = connection.prepareStatement(count_sql);
            BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(), count_sql, boundSql.getParameterMappings(), parameterObject);
            DefaultParameterHandler handler = new DefaultParameterHandler(mappedStatement, parameterObject, countBS);
            handler.setParameters(countStmt);
            rs = countStmt.executeQuery();
            int count = 0;
            if(rs.next()) {
                count = rs.getInt(1);
            }

            logger.debug("Total count: {}", Integer.valueOf(count));
            var13 = count;
        } finally {
            try {
                if(rs != null) {
                    rs.close();
                }
            } finally {
                try {
                    if(countStmt != null) {
                        countStmt.close();
                    }
                } finally {
                    if(connection != null && !connection.isClosed()) {
                        connection.close();
                    }

                }

            }

        }

        return var13;
    }
}
