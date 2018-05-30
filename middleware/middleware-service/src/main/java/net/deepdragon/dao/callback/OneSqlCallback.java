package net.deepdragon.dao.callback;

import java.sql.Connection;
import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;

import net.deepdragon.mybatis.SqlSessionTemplateFactory;
import net.deepdragon.mybatis.support.SqlSessionCallback;

/**
 * 执行动态SQL
 * @author 张莹
 *
 */
public class OneSqlCallback implements SqlSessionCallback<Boolean>{

	private final String sql;

	public OneSqlCallback(String sql) {
		this.sql = sql;
	}

	public String getSql() {
		return sql;
	}
	
	@Override
	public Boolean doInSqlSession(
			SqlSessionTemplateFactory sqlSessionTemplateFactory)
			throws SQLException {
		SqlSessionTemplate st = sqlSessionTemplateFactory
				.getSqlSessionTemplate();
		Connection connection = st.getConnection();

		java.sql.Statement stmt = connection.createStatement();
		stmt.execute(sql);
		stmt.close();
		
		return true;
	}

}
