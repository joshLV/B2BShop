package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.OrderRefundLog;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.List;
import java.util.Map;

public interface OrderRefundLogDao extends BaseDao<OrderRefundLog, String> {
	/**
	 * 查看退款记录分页对象
	 * @param paramMap
	 * @param criteria
	 * @param pageBounds
	 * @return
	 */
	List<OrderRefundLog> getRefundLogPager(Map<String,Object> paramMap, Criteria criteria, PageBounds pageBounds);

}
