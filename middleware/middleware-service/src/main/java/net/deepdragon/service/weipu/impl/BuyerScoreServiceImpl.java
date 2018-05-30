package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerScoreDao;
import net.deepdragon.entity.weipu.BuyerScore;
import net.deepdragon.service.weipu.BuyerScoreService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerScoreServiceImpl")
public class BuyerScoreServiceImpl extends BaseServiceImpl<BuyerScore, String> implements BuyerScoreService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerScoreDaoImpl")
	private BuyerScoreDao buyerScoreDao;
	
	@Override
	public BaseDao<BuyerScore, String> getBaseDao() {
		return this.buyerScoreDao;
	}
	
}

