package net.deepdragon.dao.callback;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;

import net.deepdragon.mybatis.SqlSessionTemplateFactory;
import net.deepdragon.mybatis.support.SqlSessionCallback;

/**
 * 执行SQL语句返回表总记录数
 * @author 张莹
 *
 */
public class TableRecordCallback implements SqlSessionCallback<Integer> {

	private final String sql;

	public TableRecordCallback(String sql) {
		this.sql = sql;
	}

	public String getSql() {
		return sql;
	}

	@Override
	public Integer doInSqlSession(
			SqlSessionTemplateFactory sqlSessionTemplateFactory)
			throws SQLException {

		Integer result = 0;
		
		SqlSessionTemplate st = sqlSessionTemplateFactory
				.getSqlSessionTemplate();

		Connection connection = st.getConnection();

		java.sql.Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			result = rs.getInt(1);
        }
		rs.close();
		stmt.close();
		
		return result;
	}

}
