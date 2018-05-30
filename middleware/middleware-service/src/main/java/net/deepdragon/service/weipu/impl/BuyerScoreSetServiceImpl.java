package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerScoreSetDao;
import net.deepdragon.entity.weipu.BuyerScoreSet;
import net.deepdragon.service.weipu.BuyerScoreSetService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerScoreSetServiceImpl")
public class BuyerScoreSetServiceImpl extends BaseServiceImpl<BuyerScoreSet, String> implements BuyerScoreSetService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerScoreSetDaoImpl")
	private BuyerScoreSetDao buyerScoreSetDao;
	
	@Override
	public BaseDao<BuyerScoreSet, String> getBaseDao() {
		return this.buyerScoreSetDao;
	}
	
}

