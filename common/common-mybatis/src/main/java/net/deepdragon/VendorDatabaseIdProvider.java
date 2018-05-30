package net.deepdragon;

import org.apache.ibatis.mapping.DatabaseIdProvider;

import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by TianYu on 2015-06-13.
 */
public class VendorDatabaseIdProvider implements DatabaseIdProvider {
    public VendorDatabaseIdProvider() {
    }

    public void setProperties(Properties p) {
    }

    public String getDatabaseId(DataSource dataSource) throws SQLException {
        return null;
    }
}
