package net.deepdragon.dao.callback;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import net.deepdragon.procedure.StoredProcedureInfo;
import net.deepdragon.mybatis.SqlSessionTemplateFactory;
import net.deepdragon.mybatis.support.SqlSessionCallback;
import net.deepdragon.procedure.StoredProcedureArgumentInfo;

import org.mybatis.spring.SqlSessionTemplate;

/**
 * 动态执行存储过程
 * @author 张莹
 *
 */
public class StoredProcedureExecuteCallback implements
		SqlSessionCallback<StoredProcedureInfo> {

	private final StoredProcedureInfo storedProcedureInfo;

	public StoredProcedureExecuteCallback(
			StoredProcedureInfo storedProcedureInfo) {
		this.storedProcedureInfo = storedProcedureInfo;
	}

	public StoredProcedureInfo getStoredProcedureInfo() {
		return storedProcedureInfo;
	}

	@Override
	public StoredProcedureInfo doInSqlSession(
			SqlSessionTemplateFactory sqlSessionTemplateFactory)
			throws SQLException {

		SqlSessionTemplate st = sqlSessionTemplateFactory
				.getSqlSessionTemplate();

		Connection conn = st.getConnection();

		StringBuilder sb = new StringBuilder();
		sb.append("{call " + getStoredProcedureInfo().getProcedureName());

		List<StoredProcedureArgumentInfo> storedProcedureArgumentInfo = getStoredProcedureInfo()
				.getArguments();

		// 有参数
		if (storedProcedureArgumentInfo.size() > 0) {
			sb.append("(");
			String args = "";
			for (int i = 0; i < storedProcedureArgumentInfo.size(); i++) {
				if (i + 1 == storedProcedureArgumentInfo.size()) {
					args += "?";
				} else {
					args += "?" + ",";
				}
			}
			sb.append(args);
			sb.append(")");
		}
		sb.append("}");

		CallableStatement cs = conn.prepareCall(sb.toString());

		for (StoredProcedureArgumentInfo argumentInfo : storedProcedureArgumentInfo) {
			if (argumentInfo.isInputParameter()) {
				cs.setObject(argumentInfo.getStatementArgument()
						.getParameterIndex(), argumentInfo.getDataValue(),
						argumentInfo.getDataType());
			}

			if (argumentInfo.isOutputParameter()) {
				cs.registerOutParameter(argumentInfo.getStatementArgument()
						.getParameterIndex(), argumentInfo.getDataType());
			}
		}

		cs.execute();

		for (StoredProcedureArgumentInfo argumentInfo : storedProcedureArgumentInfo) {
			if (argumentInfo.isOutputParameter()) {
				argumentInfo.setDataValue(cs.getString(argumentInfo
						.getStatementArgument().getParameterIndex()));
			}
		}

		cs.close();

		return storedProcedureInfo;

	}

}
