package net.deepdragon.service.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.OrderDistribution;

import java.util.List;
import java.util.Map;

/**
 * 配送清单数据接口
*/
public interface OrderDistributionService extends BaseService<OrderDistribution, String> {

	/**
	 * 获取配送人员报表
	 * @param paramMap
	 * @param criteria
	 * @return
	 */
	List<Map<String, Object>> getDeliveryAmountReport(Map<String, Object> paramMap, Criteria criteria);
}
