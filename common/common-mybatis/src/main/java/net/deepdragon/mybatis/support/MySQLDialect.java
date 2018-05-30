package net.deepdragon.mybatis.support;

import com.alibaba.druid.sql.PagerUtils;
import net.deepdragon.mybatis.support.Dialect;

public class MySQLDialect extends Dialect {
    public MySQLDialect() {
    }

    public boolean supportsLimitOffset() {
        return true;
    }

    public boolean supportsLimit() {
        return true;
    }

    public String getLimitString(String sql, int offset, String offsetPlaceholder, int limit, String limitPlaceholder) {
        return PagerUtils.limit(sql, "mysql", offset, limit);
    }

    public String getLimitString(String sql, int offset, int limit) {
        return super.getLimitString(sql, offset, limit);
    }

    public String getCountString(String sql) {
        return PagerUtils.count(sql, "mysql");
    }
}
