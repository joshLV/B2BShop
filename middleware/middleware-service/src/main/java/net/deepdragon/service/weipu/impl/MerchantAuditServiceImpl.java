package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.MerchantAuditDao;
import net.deepdragon.entity.weipu.MerchantAudit;
import net.deepdragon.service.weipu.MerchantAuditService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"MerchantAuditServiceImpl")
public class MerchantAuditServiceImpl extends BaseServiceImpl<MerchantAudit, String> implements MerchantAuditService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"MerchantAuditDaoImpl")
	private MerchantAuditDao merchantAuditDao;
	
	@Override
	public BaseDao<MerchantAudit, String> getBaseDao() {
		return this.merchantAuditDao;
	}
	
}

