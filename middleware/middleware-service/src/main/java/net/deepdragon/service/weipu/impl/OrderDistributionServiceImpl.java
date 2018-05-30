package net.deepdragon.service.weipu.impl;


import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.OrderDistributionDao;
import net.deepdragon.entity.weipu.OrderDistribution;
import net.deepdragon.service.weipu.OrderDistributionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"OrderDistributionServiceImpl")
public class OrderDistributionServiceImpl extends BaseServiceImpl<OrderDistribution, String> implements OrderDistributionService{

	@Resource(name= Weipu.SIGN+"OrderDistributionDaoImpl")
	private OrderDistributionDao orderDistributionDao;
	
	@Override
	public BaseDao<OrderDistribution, String> getBaseDao() {
		return this.orderDistributionDao;
	}
	
	@Override
	public List<Map<String, Object>> getDeliveryAmountReport(Map<String, Object> paramMap, Criteria criteria){
		return orderDistributionDao.getDeliveryAmountReport(paramMap, criteria);
	}
	
}

