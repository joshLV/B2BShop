package net.deepdragon.dao.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.PermissionsDao;
import net.deepdragon.entity.Permissions;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 权限表数据接口实现
 */
@Repository(Shared.SIGN + "PermissionsDaoImpl")
public class PermissionsDaoImpl extends BaseDaoImpl<Permissions, String>
		implements PermissionsDao {
	@Override
	public int deleteRelationship(Map<String, Object> paramMap, String roleId) {
		Assert.notNull(roleId, "parameter 'roleId' can't be null");

		String defaultStatement = Permissions.class.getName()
				+ "Mapper.deleteRelationship";

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate(
				ExecutorType.BATCH).delete(defaultStatement, roleId);
	}

	@Override
	public int[] saveRelationship(Map<String, Object> paramMap, String roleId,
			List<Permissions> permissions) {
		Assert.notNull(roleId, "parameter 'roleId' can't be null");
		Assert.notEmpty(permissions,
				"parameter 'permissions' can't be null or empty!");

		String defaultStatement = Permissions.class.getName()
				+ "Mapper.saveRelationship";

		List<Integer> batchResultList = new ArrayList<Integer>();
		SqlSession sqlSession = sqlSessionTemplateFactory
				.getSqlSessionTemplate(ExecutorType.BATCH);

		try {
			for (int i = 0; i < permissions.size(); i++) {
				Permissions permission = permissions.get(i);
				permission.setRoleId(roleId);

				sqlSession.insert(defaultStatement, permission);
				if ((i + 1) % DEFAULT_FLUSH_BATCH_SIZE == 0) {
					List<BatchResult> currentBatchResultList = sqlSession
							.flushStatements();
					extractBatchResult(batchResultList, currentBatchResultList);
				}
			}
		} finally {
			List<BatchResult> currentBatchResultList = sqlSession
					.flushStatements();
			extractBatchResult(batchResultList, currentBatchResultList);
		}

		return ArrayUtils
				.toPrimitive(batchResultList.toArray(new Integer[] {}));

	}

	@Override
	public List<Permissions> getList(Map<String, Object> paramMap, String userId) {
		String defaultStatement = Permissions.class.getName() + "Mapper.getList4User";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("userId", userId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, parameter);
	}

}
