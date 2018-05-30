package net.deepdragon.dao.impl;

import net.deepdragon.constant.Shared;
import net.deepdragon.dao.SystemSetDao;
import net.deepdragon.entity.SystemSet;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * 系统设置数据接口实现
 */
@Repository(Shared.SIGN + "SystemSetDaoImpl")
public class SystemSetDaoImpl extends BaseDaoImpl<SystemSet, String> implements
		SystemSetDao {

	@Override
	public int deleteAll(Map<String, Object> paramMap) {

		String defaultStatement = SystemSet.class.getName()
				+ "Mapper.deleteAll";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(
				ExecutorType.BATCH).delete(defaultStatement);
	}

}
