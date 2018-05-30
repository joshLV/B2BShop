package net.deepdragon.mybatis.handlers;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Locale;
import org.apache.commons.lang3.LocaleUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

@MappedTypes({Locale.class})
@MappedJdbcTypes({JdbcType.VARCHAR})
public class LocaleTypeHandler extends BaseTypeHandler<Locale> {
    public LocaleTypeHandler() {
    }

    public void setNonNullParameter(PreparedStatement ps, int i, Locale parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter.toString());
    }

    public Locale getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String s = rs.getString(columnName);
        return StringUtils.isNotBlank(s)?LocaleUtils.toLocale(s):null;
    }

    public Locale getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String s = rs.getString(columnIndex);
        return StringUtils.isNotBlank(s)?LocaleUtils.toLocale(s):null;
    }

    public Locale getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String s = cs.getString(columnIndex);
        return StringUtils.isNotBlank(s)?LocaleUtils.toLocale(s):null;
    }
}