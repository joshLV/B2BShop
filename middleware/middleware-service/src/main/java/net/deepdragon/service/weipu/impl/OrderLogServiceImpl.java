package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.OrderLogDao;
import net.deepdragon.entity.weipu.OrderLog;
import net.deepdragon.service.weipu.OrderLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"OrderLogServiceImpl")
public class OrderLogServiceImpl extends BaseServiceImpl<OrderLog, String> implements OrderLogService {

	@Resource(name= Weipu.SIGN+"OrderLogDaoImpl")
	private OrderLogDao orderLogDao;
	
	@Override
	public BaseDao<OrderLog, String> getBaseDao() {
		return this.orderLogDao;
	}
	
}

