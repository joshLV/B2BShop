package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.OrderDistribution;

import java.util.List;
import java.util.Map;

public interface OrderDistributionDao extends BaseDao<OrderDistribution, String> {

	List<Map<String, Object>> getDeliveryAmountReport(Map<String, Object> paramMap, Criteria criteria);
}
