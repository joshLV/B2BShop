package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.ActivityDecreaseamountDao;
import net.deepdragon.entity.weipu.ActivityDecreaseamount;
import net.deepdragon.service.weipu.ActivityDecreaseamountService;

import java.util.Map;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"ActivityDecreaseamountServiceImpl")
public class ActivityDecreaseamountServiceImpl extends BaseServiceImpl<ActivityDecreaseamount, String> implements ActivityDecreaseamountService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"ActivityDecreaseamountDaoImpl")
	private ActivityDecreaseamountDao activityDecreaseamountDao;
	
	@Override
	public BaseDao<ActivityDecreaseamount, String> getBaseDao() {
		return this.activityDecreaseamountDao;
	}

	@Override
	public ActivityDecreaseamount getDecreByGoodsId(Map<String, Object> paramMap, String goodsId, Double goodsPriceCount) throws Exception {
		return activityDecreaseamountDao.getDecreByGoodsId(paramMap, goodsId, goodsPriceCount);
	}
}

