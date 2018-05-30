package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.OrderPaylog;

import java.util.List;
import java.util.Map;

public interface OrderPaylogDao extends BaseDao<OrderPaylog, String> {
	List<OrderPaylog> getPayCount(Map<String, Object> paramMap, String start, String end);

	Double getPaidAmountTotalByOrderSn(Map<String, Object> paramMap, String orderSn, String no);

	/**
	 * 根据订单号和采购商ID获取红包支付的总金额
	 * 按照红包的 groupId 进行分组， 即按照wp_order_paylog的 uniqueno 字段进行分组
	 * @param paramMap
	 * @param orderSn 订单号
	 * @param buyerId 采购商
	 * @return
	 */
	List<OrderPaylog> getRPayTotalGroupByR(Map<String, Object> paramMap, String orderSn, String buyerId);
	/**
	 * 根据订单号和采购商ID获取各种支付类型支付的总金额
	 * 按照支付类型 name 进行分组， 即按照wp_order_paylog的 name 字段进行分组
	 * @param paramMap
	 * @param orderSn 订单号
	 * @param buyerId 采购商
	 * @return
	 */
	List<OrderPaylog> getPayTotalGroupByType(Map<String, Object> paramMap, String orderSn, String buyerId);


}
