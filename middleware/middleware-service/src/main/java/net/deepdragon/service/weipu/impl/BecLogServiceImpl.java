package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BecLogDao;
import net.deepdragon.entity.weipu.BecLog;
import net.deepdragon.service.weipu.BecLogService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BecLogServiceImpl")
public class BecLogServiceImpl extends BaseServiceImpl<BecLog, String> implements BecLogService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BecLogDaoImpl")
	private BecLogDao becLogDao;
	
	@Override
	public BaseDao<BecLog, String> getBaseDao() {
		return this.becLogDao;
	}
	
}

