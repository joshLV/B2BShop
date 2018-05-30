package net.deepdragon.service.impl;


import net.deepdragon.constant.Shared;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.dao.LogisticsCompanyDao;
import net.deepdragon.dao.LogisticsInfoDao;
import net.deepdragon.entity.LogisticsCompany;
import net.deepdragon.entity.LogisticsInfo;
import net.deepdragon.service.LogisticsCompanyService;
import net.deepdragon.service.LogisticsInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Shared.SIGN+"LogisticsInfoServiceImpl")
public class LogisticsInfoServiceImpl extends BaseServiceImpl<LogisticsInfo, String> implements LogisticsInfoService {

	@Resource(name= Shared.SIGN+"LogisticsInfoDaoImpl")
	private LogisticsInfoDao logisticsInfoDao;
	
	@Override
	public BaseDao<LogisticsInfo, String> getBaseDao() {
		return this.logisticsInfoDao;
	}

}

