package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.EnterpriseBaseQcDao;
import net.deepdragon.entity.weipu.EnterpriseBaseQc;
import net.deepdragon.service.weipu.EnterpriseBaseQcService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"EnterpriseBaseQcServiceImpl")
public class EnterpriseBaseQcServiceImpl extends BaseServiceImpl<EnterpriseBaseQc, String> implements EnterpriseBaseQcService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"EnterpriseBaseQcDaoImpl")
	private EnterpriseBaseQcDao enterpriseBaseQcDao;
	
	@Override
	public BaseDao<EnterpriseBaseQc, String> getBaseDao() {
		return this.enterpriseBaseQcDao;
	}
	
}

