package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderDistributionDao;
import net.deepdragon.entity.weipu.OrderDistribution;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 配送清单数据接口实现
*/
@Repository(Weipu.SIGN + "OrderDistributionDaoImpl")
public class OrderDistributionDaoImpl extends BaseDaoImpl<OrderDistribution, String> implements
		OrderDistributionDao {

	@Override
	public List<Map<String, Object>> getDeliveryAmountReport(Map<String, Object> paramMap, Criteria criteria){
		String defaultStatement = OrderDistribution.class.getName() + "Mapper.getDeliveryAmountReport";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
	}
}
