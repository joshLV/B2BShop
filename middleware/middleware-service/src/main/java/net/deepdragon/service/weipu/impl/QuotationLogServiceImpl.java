package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.QuotationLogDao;
import net.deepdragon.entity.weipu.QuotationLog;
import net.deepdragon.service.weipu.QuotationLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"QuotationLogServiceImpl")
public class QuotationLogServiceImpl extends BaseServiceImpl<QuotationLog, String> implements QuotationLogService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"QuotationLogDaoImpl")
	private QuotationLogDao quotationLogDao;
	
	@Override
	public BaseDao<QuotationLog, String> getBaseDao() {
		return this.quotationLogDao;
	}
	
}

