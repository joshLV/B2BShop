package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.EcLogDao;
import net.deepdragon.entity.weipu.EcLog;
import net.deepdragon.service.weipu.EcLogService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"EcLogServiceImpl")
public class EcLogServiceImpl extends BaseServiceImpl<EcLog, String> implements EcLogService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"EcLogDaoImpl")
	private EcLogDao ecLogDao;
	
	@Override
	public BaseDao<EcLog, String> getBaseDao() {
		return this.ecLogDao;
	}
	
}

