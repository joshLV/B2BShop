package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.OrderRefund;
import net.deepdragon.entity.weipu.OrderRefundLog;

import java.util.Map;

/**
 * 退款记录数据接口
 */
public interface OrderRefundLogService extends BaseService<OrderRefundLog, String> {
	/**
	 * 保存退款记录
	 * 
	 * @param paramMap
	 * @param orderRefundLog
	 */
	void savelog(Map<String,Object> paramMap, OrderRefundLog orderRefundLog);

	/**
	 * 查看退款记录分页对象
	 * 
	 * @param paramMap
	 * @param criteria
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager getRefundLogPager(Map<String,Object> paramMap, Criteria criteria, Pager pager) throws Exception;
	
	/**
	 * 
	 * @param paramMap
	 * @param orderRefund
	 */
	public void eRPRefund(Map<String,Object> paramMap, OrderRefund orderRefund);

}
