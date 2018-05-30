package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.MultiPayRecord;
import net.deepdragon.entity.weipu.OrderPaylog;

import java.util.List;
import java.util.Map;

/**
 * 订单支付记录数据接口
 */
public interface OrderPaylogService extends BaseService<OrderPaylog, String> {
	
	/**
	 * 获取支付统计
	 * 
	 * @param paramMap
	 * @param start
	 * @param end
	 * @return
	 */
	List<OrderPaylog> getPayCount(Map<String, Object> paramMap, String start, String end);

	/**
	 * 保存多方支付的支付数据
	 * @param paramMap
	 * @param multiPayRecord
	 *	1、账户数据更新
	 *  2、账户使用日志保存
	 *  3、授信回复数据更新
	 *  4、授信使用日志保存
	 *  5、红包使用日志保存
	 *  6、支付日志保存
	 * version 1 TianYu 2016-2-26 09:21:37
	 */
	void saveMultiPayData(Map<String, Object> paramMap,MultiPayRecord multiPayRecord) throws Exception;

	/**
	 * 根据订单号统计支付总金额
	 * @param paramMap
	 * @param orderSn
	 * @param no
	 * @return
	 * version 1 TianYu 2016-2-26 14:08:39
	 */
	Double getPaidAmountTotalByOrderSn(Map<String, Object> paramMap, String orderSn, String no) throws Exception ;

	/**
	 * 根据订单号和采购商ID获取红包支付的总金额
	 * 按照红包的 groupId 进行分组， 即按照wp_order_paylog的 uniqueno 字段进行分组
	 * @param paramMap
	 * @param orderSn 订单号
	 * @param buyerId 采购商
	 * @return
	 * @throws Exception
	 */
	List<OrderPaylog> getRPayTotalGroupByR(Map<String, Object> paramMap, String orderSn, String buyerId) throws Exception ;

	/**
	 * 根据订单号和采购商ID获取各种支付类型支付的总金额
	 * 按照支付类型 name 进行分组， 即按照wp_order_paylog的 name 字段进行分组
	 * @param paramMap
	 * @param orderSn 订单号
	 * @param buyerId 采购商
	 * @return
	 */
	List<OrderPaylog> getPayTotalGroupByType(Map<String, Object> paramMap, String orderSn, String buyerId) throws Exception ;
}
