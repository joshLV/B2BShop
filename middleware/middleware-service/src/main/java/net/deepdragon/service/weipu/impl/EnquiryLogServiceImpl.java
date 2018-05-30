package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.EnquiryLogDao;
import net.deepdragon.entity.weipu.EnquiryLog;
import net.deepdragon.service.weipu.EnquiryLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryLogServiceImpl")
public class EnquiryLogServiceImpl extends BaseServiceImpl<EnquiryLog, String> implements EnquiryLogService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryLogDaoImpl")
	private EnquiryLogDao enquiryLogDao;
	
	@Override
	public BaseDao<EnquiryLog, String> getBaseDao() {
		return this.enquiryLogDao;
	}
	
}

