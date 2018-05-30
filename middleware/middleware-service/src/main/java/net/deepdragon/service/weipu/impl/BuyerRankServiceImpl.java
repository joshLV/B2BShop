package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerRankDao;
import net.deepdragon.entity.weipu.BuyerRank;
import net.deepdragon.service.weipu.BuyerRankService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerRankServiceImpl")
public class BuyerRankServiceImpl extends BaseServiceImpl<BuyerRank, String> implements BuyerRankService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerRankDaoImpl")
	private BuyerRankDao buyerRankDao;
	
	@Override
	public BaseDao<BuyerRank, String> getBaseDao() {
		return this.buyerRankDao;
	}

	@Override
	public BuyerRank getDefaultBuyerRank(Map<String, Object> paramMap) throws Exception {
		try {
			return this.buyerRankDao.getDefaultBuyerRank(paramMap);
		} catch (Exception e) {
			throw e;
		}
	}
	
}

