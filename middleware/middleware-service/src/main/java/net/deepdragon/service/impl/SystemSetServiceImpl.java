package net.deepdragon.service.impl;


import net.deepdragon.constant.Shared;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.dao.SystemSetDao;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.service.SystemSetService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Shared.SIGN+"SystemSetServiceImpl")
public class SystemSetServiceImpl extends BaseServiceImpl<SystemSet, String> implements SystemSetService {

	@Resource(name= Shared.SIGN+"SystemSetDaoImpl")
	private SystemSetDao systemSetDao;
	
	@Override
	public BaseDao<SystemSet, String> getBaseDao() {
		return this.systemSetDao;
	}

	@Override
	public boolean updateSystemSet(Map<String, Object> paramMap, List<SystemSet> entity)
			throws Exception {
		if (CollectionUtils.isNotEmpty(entity)) {
			systemSetDao.deleteAll(paramMap);
			systemSetDao.save(paramMap, entity);
		}
		return false;
	}
	
}

