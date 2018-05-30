package net.deepdragon.mybatis.support;

import java.sql.SQLException;
import net.deepdragon.mybatis.SqlSessionTemplateFactory;

public interface SqlSessionCallback<T> {
    T doInSqlSession(SqlSessionTemplateFactory var1) throws SQLException;
}

