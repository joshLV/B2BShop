package net.deepdragon.service.impl;


import net.deepdragon.constant.Shared;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.dao.LogisticsCompanyDao;
import net.deepdragon.entity.LogisticsCompany;
import net.deepdragon.service.LogisticsCompanyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Shared.SIGN+"LogisticsCompanyServiceImpl")
public class LogisticsCompanyServiceImpl extends BaseServiceImpl<LogisticsCompany, String> implements LogisticsCompanyService{

	@Resource(name= Shared.SIGN+"LogisticsCompanyDaoImpl")
	private LogisticsCompanyDao logisticsCompanyDao;
	
	@Override
	public BaseDao<LogisticsCompany, String> getBaseDao() {
		return this.logisticsCompanyDao;
	}
	
}

