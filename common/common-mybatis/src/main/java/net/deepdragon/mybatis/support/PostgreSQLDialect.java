package net.deepdragon.mybatis.support;

import net.deepdragon.mybatis.support.Dialect;

public class PostgreSQLDialect extends Dialect {
    public PostgreSQLDialect() {
    }

    public boolean supportsLimit() {
        return true;
    }

    public boolean supportsLimitOffset() {
        return true;
    }

    public String getLimitString(String sql, int offset, String offsetPlaceholder, int limit, String limitPlaceholder) {
        return (new StringBuffer(sql.length() + 20)).append(sql).append(offset > 0?" limit " + limitPlaceholder + " offset " + offsetPlaceholder:" limit " + limitPlaceholder).toString();
    }
}