package net.deepdragon.service.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Goods;
import net.deepdragon.entity.weipu.Order;
import net.deepdragon.entity.weipu.OrderDistribution;
import net.deepdragon.weipu.bean.PayType;

import java.util.List;
import java.util.Map;

/**
 * 订单信息数据接口
 */
public interface OrderService extends BaseService<Order, String> {

	/**
	 * 保存订单信息
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param orders
	 *            订单相关的数据map
	 * @param cartItemIds
	 *            购物车ID
	 * @param isEnableConfirm
	 *            是否开启订单确认
	 *
	 * @return 订单对象
	 */
	List<Order> saveOrder(Map<String, Object> paramMap, List<Map<String, Object>> orders,List<String> cartItemIds,boolean isEnableConfirm);

	/**
	 * 保存订单信息
	 *
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 * @param isEnableConfirm
	 *            是否开启订单确认
	 * @return 订单对象
	 */
	Order saveOrder(Map<String, Object> paramMap, Map<String, Object> pMap,boolean isEnableConfirm);

	/**
	 * 保存订单信息
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 * 
	 * @return 订单对象
	 */
	Order saveOrderJiuTouYa(Map<String, Object> paramMap, Map pMap) throws Exception;

	/**
	 * 保存订单信息
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 * 
	 * @return 订单对象
	 */
	Order saveOrderXiYingMen(Map<String, Object> paramMap, Map pMap) throws Exception;

	/**
	 * 保存团购订单
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 * 
	 * @return 订单对象
	 */
	Order saveGroupBuyOrder(Map<String, Object> paramMap, Map pMap) throws Exception;

	/**
	 * 保存订单信息
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 * 
	 * @return 订单对象
	 */
	Order saveSeckillOrder(Map<String, Object> paramMap, Map pMap, String saleId, String memberId) throws Exception;
	
	
	/**
	 * 保存订单信息(线程同步)
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 * 
	 * @return 订单对象
	 */
	Order saveSeckillOrderSync(Map<String, Object> paramMap, Map pMap, String saleId, String memberId) throws Exception;

	/**
	 * 保存活动订单信息
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param pMap
	 *            订单相关的数据map
	 * 
	 * @return 订单对象
	 */
	Order saveShipOrder(Map<String, Object> paramMap, Map pMap, String saleId, String memberId);


	/**
	 * 拆分订单
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param order
	 *            页面提交过来的总订单
	 * 
	 * @return 总订单对象
	 */
	public Order splitOrder(Map<String, Object> paramMap, Order order);

	/**
	 * 订单确认
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param entity
	 *            订单对象
	 * 
	 * @return
	 */
	boolean orderConfirm(Map<String, Object> paramMap, Order entity, String operator);

	/**
	 * 确认支付
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param entity
	 *            订单对象
	 * 
	 * @return
	 */
	boolean orderPaid(Map<String, Object> paramMap, Order entity, String operator);

	/**
	 * 确认配送
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param entity
	 *            订单对象
	 * 
	 * @return
	 */
	boolean orderShipped(Map<String, Object> paramMap, Order entity, String operator, OrderDistribution OrderDistribution);

	/**
	 * 喜盈门配送
	 * 
	 * @param paramMap
	 * @param entity
	 * @param operator
	 * @param OrderDistribution
	 * @return
	 */
	boolean orderXYMShipped(Map<String, Object> paramMap, Order entity, String operator, OrderDistribution OrderDistribution);

	/**
	 * 作废
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param entity
	 *            订单对象
	 * 
	 * @return
	 */
	boolean orderInvalid(Map<String, Object> paramMap, Order entity, String operator);

	/**
	 * 订单支付成功
	 *
	 * @param paramMap
	 *            租户Id
	 * @param orderNo
	 *            订单编号
	 */
	Order orderPaidSuccess(Map<String, Object> paramMap, String orderNo);

	
	
	/**
	 * 支付并自动确认收货（更新支付状态为已支付，更新配送状态为已收货，更新订单状态为交易完成）
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param orderNo
	 *            订单编号
	 */
	Order orderPaidAndAutoFinished(Map<String, Object> paramMap, String orderNo);

	/**
	 * 取消订单
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param orderId
	 *            订单Id
	 *
	 * @param reason
	 * @return 取消的订单对象
	 */
	Order cancle(Map<String, Object> paramMap, String orderId, String reason);

	/**
	 * 删除订单
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param orderId
	 *            订单Id
	 * 
	 * @return 删除的订单对象
	 */
	Order deleteOrder(Map<String, Object> paramMap, String orderId);

	/**
	 * 订单--确认收货
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param orderId
	 *            订单Id
	 * 
	 * @return 确认的订单对象
	 */
	Order confirmGoods(Map<String, Object> paramMap, String orderId);

	/**
	 * 导出未发货的商品
	 * 
	 * @param paramMap
	 * @return
	 */
	List<Order> getExportList(Map<String, Object> paramMap, Criteria criteria);

	/**
	 * 导出订单
	 * 
	 * @param paramMap
	 * @return
	 */
	List<Order> getXYMExportList(Map<String, Object> paramMap, Criteria criteria);

	/**
	 * 获取超出时间段外未支付的订单
	 * 
	 * @param paramMap
	 * @param hour
	 * @return
	 */
	List<Order> getHourOrderList(Map<String, Object> paramMap, int hour, int type);

	/**
	 * 获取超出时间段外未确认收货的订单
	 * 
	 * @param paramMap
	 * @param hour
	 * @param type
	 * @return
	 */
	List<Order> getConfirmOrderList(Map<String, Object> paramMap, int hour);

	/**
	 * 更新超出时间段外未支付的订单信息
	 * 
	 * @param paramMap
	 * @param list
	 * @return
	 */
	int updateHourOrder(Map<String, Object> paramMap, List<Order> list, List<Goods> goodsList) throws Exception;


	/**
	 * 出库
	 *
	 * @param orderDistributionList 配送单列表
	 *
	 * @return 日志信息
	 */
	List<String> outStorage(Map<String, Object> paramMap, List<OrderDistribution> orderDistributionList);
	
	/**
	 * 获取支付统计
	 * 
	 * @return 支付类型总金额
	 */
	PayType getPayAmount(Map<String, Object> paramMap, String start, String end);
	/**
	 *  根据时间获取客流客单
	 */
	List<Map<String, Object>> getPassengerByTime(Map<String, Object> paramMap, String start, String end);
	/**
	 *  根据时间获取不同下单方式
	 */
	List<Map<String, Object>> getOrderModeByTime(Map<String, Object> paramMap, String start, String end);

	/**
	 * 后台操作员取消订单
	 *
	 * @param paramMap   租户Id
	 * @param orderList  订单对象列表
	 * @param operator   操作员名称
	 * @param operatorId 操作员Id
	 */
	List<Order> cancelOrderByOperator(Map<String, Object> paramMap, List<Order> orderList, String operator, String operatorId);
	
	/**
	 * 获取商品日报
	 * @return
	 */
	List<Map<String, Object>> getGoodsDayReport(Map<String, Object> paramMap);
	
	/**
	 * 订单商品报表
	 * @param paramMap
	 * @param criteria
	 * @return
	 */
	List<Map<String, Object>> getOrderGoodsReport(Map<String, Object> paramMap, Criteria criteria);
	
	/**
	 * 根据订单商品项编号itemid取消单个商品，是否增减库存flag
	 * @param paramMap
	 * @param itemId
	 * @param flag 0：不操作；1：增加库存
	 * @param operator
	 * @param operatorId
	 * @return
	 */
    boolean updateOrderItemCancel(Map<String, Object> paramMap, String itemId, int flag, String operator, String operatorId);
    
    /**
     * 商品报表
     * @param paramMap
     * @param criteria
     * @return
     */
    List<Map<String, Object>> getGoodsReport(Map<String, Object> paramMap, Criteria criteria);

	/**
	 * 根据订单号获取数据列表
	 *
	 * @param paramMap
	 *            租户标识
	 * @param orderSns
	 *            订单编号集合
	 * @return
	 * @throws Exception
	 */
	List<Order> findListByOrderSns(Map<String, Object> paramMap, List<String> orderSns) throws Exception;

	/**
	 * 订单--确认到货
	 *
	 * @param paramMap
	 *            租户Id
	 * @param orderId
	 *            订单Id
	 *
	 * @return 确认的订单对象
	 */
	Order validateGoods(Map<String, Object> paramMap, String orderId);


	/**
	 * 20160526 dzz
	 * 查询差异化订单明细信息列表集合
	 * @param paramMap
	 * @param criteriar
	 * @return
	 * @throws Exception
	 */
	List<Order> queryOrderGoodsAbnormal(Map<String, Object> paramMap, Criteria criteriar) throws Exception;

	/**
	 * 20160718 dzz
	 * 1.查询当前众筹商品已众筹商品数量总数 (条件: 订单类型orderType:1, 商品Id, 众筹开始结束时间范围)
	 * 2.查询当前用户所众筹商品数量总数 (条件: 订单类型orderType:1, 商品Id, 众筹开始结束时间范围, 当前用户Id)
	 * @param paramMap
	 * @param criteria
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> getZCQuantitySum(Map<String, Object> paramMap, Criteria criteria) throws Exception;
}
