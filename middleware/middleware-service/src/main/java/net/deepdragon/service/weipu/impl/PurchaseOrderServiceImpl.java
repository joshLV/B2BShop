package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.PurchaseOrderDao;
import net.deepdragon.entity.weipu.PurchaseOrder;
import net.deepdragon.service.weipu.PurchaseOrderService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"PurchaseOrderServiceImpl")
public class PurchaseOrderServiceImpl extends BaseServiceImpl<PurchaseOrder, String> implements PurchaseOrderService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"PurchaseOrderDaoImpl")
	private PurchaseOrderDao purchaseOrderDao;
	
	@Override
	public BaseDao<PurchaseOrder, String> getBaseDao() {
		return this.purchaseOrderDao;
	}
	
}

