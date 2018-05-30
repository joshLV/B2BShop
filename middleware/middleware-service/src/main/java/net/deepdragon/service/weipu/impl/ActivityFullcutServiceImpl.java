package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.ActivityFullcutDao;
import net.deepdragon.entity.weipu.ActivityFullcut;
import net.deepdragon.service.weipu.ActivityFullcutService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"ActivityFullcutServiceImpl")
public class ActivityFullcutServiceImpl extends BaseServiceImpl<ActivityFullcut, String> implements ActivityFullcutService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"ActivityFullcutDaoImpl")
	private ActivityFullcutDao activityFullcutDao;
	
	@Override
	public BaseDao<ActivityFullcut, String> getBaseDao() {
		return this.activityFullcutDao;
	}
	
}

