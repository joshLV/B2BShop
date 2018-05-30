package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerLabelDao;
import net.deepdragon.entity.weipu.BuyerLabel;
import net.deepdragon.service.weipu.BuyerLabelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerLabelServiceImpl")
public class BuyerLabelServiceImpl extends BaseServiceImpl<BuyerLabel, String> implements BuyerLabelService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerLabelDaoImpl")
	private BuyerLabelDao buyerLabelDao;
	
	@Override
	public BaseDao<BuyerLabel, String> getBaseDao() {
		return this.buyerLabelDao;
	}
	
}

