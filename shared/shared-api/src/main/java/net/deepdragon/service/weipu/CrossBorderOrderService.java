package net.deepdragon.service.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.Order;
import net.deepdragon.entity.weipu.OrderDistribution;
import net.deepdragon.weipu.bean.PayType;

import java.util.List;
import java.util.Map;

/**
 * 跨境订单信息数据接口
 */
public interface CrossBorderOrderService extends BaseService<Order, String> {

	/**
	 * 保存跨境支付订单信息
	 *
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 *
	 * @return 订单对象
	 */
	int saveCrossBorderOrder(Map<String, Object> paramMap, Map pMap);


	int updateCrossBorderOrderStatus(Map<String, Object> paramMap);

	/*
	 *组装海关报批字段
	 */
	Map<String, Object> getCrossBorderOrderMap(Map<String, Object> paramMap, Criteria criteria);


	/*
     *跨境交易订单附加信息
     */
	Map<String, Object> getCrossBorderOrderInfo(Map<String, Object> paramMap, Criteria criteria);

}
