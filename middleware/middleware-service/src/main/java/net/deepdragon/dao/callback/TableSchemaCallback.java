package net.deepdragon.dao.callback;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.deepdragon.bean.TableSchema;
import org.mybatis.spring.SqlSessionTemplate;

import net.deepdragon.mybatis.SqlSessionTemplateFactory;
import net.deepdragon.mybatis.support.SqlSessionCallback;

/**
 * 获取数据表元数据(列名、是否允许空、数据类型、备注)
 * @author 张莹
 *
 */
public class TableSchemaCallback implements SqlSessionCallback<List<TableSchema>> {

	private final String tableOrViewName;

	public TableSchemaCallback(String tableOrViewName) {
		this.tableOrViewName = tableOrViewName;
	}

	public String getTableOrViewName() {
		return tableOrViewName;
	}
	
	@Override
	public List<TableSchema> doInSqlSession(
			SqlSessionTemplateFactory sqlSessionTemplateFactory)
			throws SQLException {
		
		SqlSessionTemplate st = sqlSessionTemplateFactory
				.getSqlSessionTemplate();
		
		Connection conn = st.getConnection();
		DatabaseMetaData dbMetaData = conn.getMetaData();
		String username = dbMetaData.getUserName().toUpperCase();
		
		List<TableSchema> tableSchema =new ArrayList<TableSchema>();
		
		ResultSet rs = dbMetaData.getColumns(conn.getCatalog(), username, tableOrViewName, null);
		while (rs.next()) {
			TableSchema schema = new TableSchema();
			
			schema.setColumnName(rs.getString("COLUMN_NAME"));
			schema.setDataType(rs.getString("DATA_TYPE"));
			schema.setIsNullable(rs.getString("IS_NULLABLE"));
			schema.setColumnComment(rs.getString("REMARKS"));
			
			tableSchema.add(schema);
		}
		rs.close();
		
		return tableSchema;
	}

}
