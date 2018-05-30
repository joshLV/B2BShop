package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerDao;
import net.deepdragon.entity.weipu.Buyer;
import net.deepdragon.entity.weipu.Merchant;
import net.deepdragon.service.weipu.BuyerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerServiceImpl")
public class BuyerServiceImpl extends BaseServiceImpl<Buyer, String> implements BuyerService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerDaoImpl")
	private BuyerDao buyerDao;
	
	@Override
	public BaseDao<Buyer, String> getBaseDao() {
		return this.buyerDao;
	}

	@Override
	public List<Merchant> getMyMerchants(Map<String, Object> paramMap, String id) throws Exception {
		return buyerDao.getMyMerchants(paramMap, id);
	}
	
}

