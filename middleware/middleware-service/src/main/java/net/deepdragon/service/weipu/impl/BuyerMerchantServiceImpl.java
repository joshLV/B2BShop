package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerMerchantDao;
import net.deepdragon.entity.weipu.BuyerMerchant;
import net.deepdragon.entity.weipu.Merchant;
import net.deepdragon.service.weipu.BuyerMerchantService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerMerchantServiceImpl")
public class BuyerMerchantServiceImpl extends BaseServiceImpl<BuyerMerchant, String> implements BuyerMerchantService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerMerchantDaoImpl")
	private BuyerMerchantDao buyerMerchantDao;
	
	@Override
	public BaseDao<BuyerMerchant, String> getBaseDao() {
		return this.buyerMerchantDao;
	}

	@Override
	public List<Merchant> getByMerchantNameBuyerMerchants(Map<String, Object> paramMap, String id,String searMerchantName) throws Exception {
		return buyerMerchantDao.getByMerchantNameBuyerMerchants(paramMap, id,searMerchantName);
	}

	@Override
	public int updateBuyerMerchantState(Map<String, Object> paramMap, String buyerId, String merchantId) {
		return buyerMerchantDao.updateBuyerMerchantState(paramMap, buyerId, merchantId);
	}
	
}

