package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerAuditDao;
import net.deepdragon.entity.weipu.BuyerAudit;
import net.deepdragon.service.weipu.BuyerAuditService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerAuditServiceImpl")
public class BuyerAuditServiceImpl extends BaseServiceImpl<BuyerAudit, String> implements BuyerAuditService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerAuditDaoImpl")
	private BuyerAuditDao buyerAuditDao;
	
	@Override
	public BaseDao<BuyerAudit, String> getBaseDao() {
		return this.buyerAuditDao;
	}
	
}

