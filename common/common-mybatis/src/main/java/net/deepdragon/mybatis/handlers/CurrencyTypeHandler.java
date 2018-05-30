package net.deepdragon.mybatis.handlers;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Currency;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

@MappedTypes({Currency.class})
@MappedJdbcTypes({JdbcType.VARCHAR})
public class CurrencyTypeHandler extends BaseTypeHandler<Currency> {
    public CurrencyTypeHandler() {
    }

    public void setNonNullParameter(PreparedStatement ps, int i, Currency parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, parameter.getCurrencyCode());
    }

    public Currency getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String s = rs.getString(columnName);
        return StringUtils.isNotBlank(s)?Currency.getInstance(s):null;
    }

    public Currency getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String s = rs.getString(columnIndex);
        return StringUtils.isNotBlank(s)?Currency.getInstance(s):null;
    }

    public Currency getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String s = cs.getString(columnIndex);
        return StringUtils.isNotBlank(s)?Currency.getInstance(s):null;
    }
}
