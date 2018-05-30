package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerInvoiceDao;
import net.deepdragon.entity.weipu.BuyerInvoice;
import net.deepdragon.service.weipu.BuyerInvoiceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerInvoiceServiceImpl")
public class BuyerInvoiceServiceImpl extends BaseServiceImpl<BuyerInvoice, String> implements BuyerInvoiceService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerInvoiceDaoImpl")
	private BuyerInvoiceDao buyerInvoiceDao;
	
	@Override
	public BaseDao<BuyerInvoice, String> getBaseDao() {
		return this.buyerInvoiceDao;
	}

	@Override
	public BuyerInvoice getDefaultInvoiceInfo(Map<String, Object> paramMap, String buyerId) {
		return buyerInvoiceDao.getDefaultInvoiceInfo(paramMap,buyerId);
	}

	@Override
	public void updateDefault(Map<String, Object> paramMap, String buyerId, String id) {
		buyerInvoiceDao.updateDefault(paramMap, buyerId,id);
	}
}

