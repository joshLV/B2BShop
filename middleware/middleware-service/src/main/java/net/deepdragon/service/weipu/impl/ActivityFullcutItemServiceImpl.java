package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.ActivityFullcutItemDao;
import net.deepdragon.entity.weipu.ActivityFullcutItem;
import net.deepdragon.service.weipu.ActivityFullcutItemService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"ActivityFullcutItemServiceImpl")
public class ActivityFullcutItemServiceImpl extends BaseServiceImpl<ActivityFullcutItem, String> implements ActivityFullcutItemService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"ActivityFullcutItemDaoImpl")
	private ActivityFullcutItemDao activityFullcutItemDao;
	
	@Override
	public BaseDao<ActivityFullcutItem, String> getBaseDao() {
		return this.activityFullcutItemDao;
	}
	
}

