package net.deepdragon.dao.callback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import net.deepdragon.mybatis.SqlSessionTemplateFactory;
import net.deepdragon.mybatis.support.SqlSessionCallback;

/**
 * 动态执行Create、Drop、Alert
 * @author 张莹
 *
 */
public class TableOperationCallback implements SqlSessionCallback<Boolean> {

	private final List<String> sql;

	public TableOperationCallback(List<String> sql) {
		this.sql = sql;
	}

	public List<String> getSql() {
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
		for(String sql:this.getSql()){
			stmt.addBatch(sql);
		}
		stmt.executeBatch();
		stmt.close();
		
		return true;
	}

}
