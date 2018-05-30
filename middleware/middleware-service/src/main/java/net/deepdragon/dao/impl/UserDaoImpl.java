package net.deepdragon.dao.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.UserDao;
import net.deepdragon.entity.User;
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
 * 用户表数据接口实现
 */
@Repository(Shared.SIGN + "UserDaoImpl")
public class UserDaoImpl extends BaseDaoImpl<User, String> implements UserDao {
	
	@Override
	public User getUserByUserName(String userName) {
		String defaultStatement = User.class.getName()
				+ "Mapper.getUserByUserName";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate()
				.selectOne(defaultStatement, userName);
	}

	@Override
	public List<String> getRoleIdByUserId(Map<String, Object> paramMap, String userId) {
		String defaultStatement = User.class.getName()
				+ "Mapper.getRoleIdByUserId";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate()
				.selectList(defaultStatement, userId);
	}
	
	@Override
	public int[] saveRelationUserRole(Map<String, Object> paramMap, String userId,
			List<String> roleIds) {
		Assert.notNull(userId, "parameter 'userId' can't be null");
		Assert.notEmpty(roleIds, "parameter 'roleIds' can't be null or empty!");
		String defaultStatement = User.class.getName()
				+ "Mapper.saveRelationUserRole";
		List<Integer> batchResultList = new ArrayList<Integer>();
		SqlSession sqlSession = sqlSessionTemplateFactory
				.getSqlSessionTemplate(ExecutorType.BATCH);
		try {
			for (int i = 0; i < roleIds.size(); i++) {
				Map<String, String> relationship = new HashMap<String, String>();
				relationship.put("userId", userId);
				relationship.put("roleId", roleIds.get(i));
				sqlSession.insert(defaultStatement, relationship);
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
	public int delRelationUserRole(Map<String, Object> paramMap, String userId) {
		String defaultStatement = User.class.getName() + "Mapper.delRelationUserRole";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(
				defaultStatement, userId);
	}

	@Override
	public int updatePasswd(Map<String, Object> paramMap, String userId, String passwd) {
		String defaultStatement = User.class.getName() + "Mapper.updatePasswd";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("userId", userId);
		parameter.put("passwd", passwd);
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().delete(
				defaultStatement, parameter);
	}

}
