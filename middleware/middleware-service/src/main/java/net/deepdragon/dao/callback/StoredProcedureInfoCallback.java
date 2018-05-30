package net.deepdragon.dao.callback;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.deepdragon.procedure.StoredProcedureInfo;
import net.deepdragon.mybatis.SqlSessionTemplateFactory;
import net.deepdragon.mybatis.support.SqlSessionCallback;

import org.mybatis.spring.SqlSessionTemplate;

/**
 * 获取存储过程元信息
 * @author 张莹
 *
 */
public class StoredProcedureInfoCallback implements
		SqlSessionCallback<StoredProcedureInfo> {

	private final String catalog;
	private final String name;

	public StoredProcedureInfoCallback(String catalog, String name) {
		this.catalog = catalog;
		this.name = name;
	}

	public String getProcedureName() {
		return name;
	}

	public String getCatalog() {
		return catalog;
	}

	@Override
	public StoredProcedureInfo doInSqlSession(
			SqlSessionTemplateFactory sqlSessionTemplateFactory)
			throws SQLException {

		SqlSessionTemplate st = sqlSessionTemplateFactory
				.getSqlSessionTemplate();

		Connection conn = st.getConnection();

		DatabaseMetaData dbMetaData = conn.getMetaData();
		String username = dbMetaData.getUserName().toUpperCase();
		ResultSet rs = dbMetaData.getProcedureColumns(getCatalog(), username,
				getProcedureName(), "%");

		StoredProcedureInfo storedProcedureInfo = new StoredProcedureInfo(
				getProcedureName());
		while (rs.next()) {
			String columnName = rs.getString(4);
			short columnType = rs.getShort(5);
			short dataType = rs.getShort(6);
			storedProcedureInfo.addColumn(columnName, columnType, dataType);
		}

		rs.close();
		
		return storedProcedureInfo;

	}

}
