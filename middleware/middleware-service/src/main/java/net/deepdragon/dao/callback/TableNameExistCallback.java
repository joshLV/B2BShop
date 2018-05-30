package net.deepdragon.dao.callback;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;

import net.deepdragon.mybatis.SqlSessionTemplateFactory;
import net.deepdragon.mybatis.support.SqlSessionCallback;

/**
 * 判断表名是否存在
 * 
 * @author 张莹
 *
 */
public class TableNameExistCallback implements SqlSessionCallback<Boolean> {

	private final String tableName;

	public TableNameExistCallback(String tableName) {
		this.tableName = tableName;
	}

	public String getTableName() {
		return tableName;
	}

	@Override
	public Boolean doInSqlSession(
			SqlSessionTemplateFactory sqlSessionTemplateFactory)
			throws SQLException {

		boolean result = false;
		
		SqlSessionTemplate st = sqlSessionTemplateFactory
				.getSqlSessionTemplate();
		
		Connection conn = st.getConnection();
		DatabaseMetaData dbMetaData = conn.getMetaData();
		String username = dbMetaData.getUserName().toUpperCase();
		
		ResultSet rs = dbMetaData.getTables(conn.getCatalog(), username,
				this.tableName, new String[] { "TABLE" });
		while (rs.next()) {
			result = true;
		}
		rs.close();

		return result;
	}

}
