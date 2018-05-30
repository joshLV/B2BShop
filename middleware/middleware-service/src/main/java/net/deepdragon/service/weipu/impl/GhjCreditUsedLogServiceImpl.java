package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjCreditUsedLogDao;
import net.deepdragon.entity.weipu.GhjCreditUsedLog;
import net.deepdragon.service.weipu.GhjCreditUsedLogService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditUsedLogServiceImpl")
public class GhjCreditUsedLogServiceImpl extends BaseServiceImpl<GhjCreditUsedLog, String> implements GhjCreditUsedLogService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditUsedLogDaoImpl")
	private GhjCreditUsedLogDao ghjCreditUsedLogDao;
	
	@Override
	public BaseDao<GhjCreditUsedLog, String> getBaseDao() {
		return this.ghjCreditUsedLogDao;
	}
	
}

