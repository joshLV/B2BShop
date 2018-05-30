package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.Order;
import net.deepdragon.weipu.bean.PayType;

import java.util.List;
import java.util.Map;

public interface OrderDao extends BaseDao<Order, String> {

	Order save(Map<String, Object> paramMap, Order entity, boolean isBatch);
	/**
	 * 删除订单对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param orderId
	 *            PK
	 * @param isBatch
	 *            是否以批量模式操作
	 * 
	 * @return 受影响的行数
	 */
	int deleteOrder(Map<String, Object> paramMap, String orderId, boolean isBatch);

	/**
	 * 保存一个对象
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param order
	 *            订单对象
	 * 
	 * @return 保存的对象
	 */
	Order saveOne(Map<String, Object> paramMap, Order order);

	/**
	 * 
	 * @param paramMap
	 * @return
	 */
	List<Order> getExportList(Map<String, Object> paramMap, Criteria criteria);
	/**
	 * 
	 * @param paramMap
	 * @return
	 */
	List<Order> getXYMExportList(Map<String, Object> paramMap, Criteria criteria);

	/**
	 * 
	 * @param paramMap
	 * @return
	 */
	List<Order> getHourOrderList(Map<String, Object> paramMap, int hour, int type);
	
	/**
	 * 
	 * @param paramMap
	 * @return
	 */
	List<Order> getConfirmOrderList(Map<String, Object> paramMap, int hour);
	
	/**
	 * 获取支付统计
	 * 
	 * @return 支付类型总金额
	 */
	PayType getPayAmount (Map<String, Object> paramMap,String start,String end);
	
	/**
	 * 商品日报统计
	 * @return
	 */
    List<Map<String, Object>> getGoodsDayReport(Map<String, Object> paramMap);
    
    /**
     * 获取满足时间条件的客流客单 
     * 
     */
    List<Map<String, Object>> getPassengerByTime(Map<String, Object> paramMap,String start,String end);
    
    /**
     * 获取满足时间条件的不同下单方式
     * 
     */
    List<Map<String, Object>> getOrderModeByTime(Map<String, Object> paramMap,String start,String end);
    /**
     * 订单商品报表
     * @param paramMap
     * @param criteria
     * @return
     */
    List<Map<String, Object>> getOrderGoodsReport(Map<String, Object> paramMap, Criteria criteria);
    /**
     * 商品报表
     * @param paramMap
     * @param criteria
     * @return
     */
    List<Map<String, Object>> getGoodsReport(Map<String, Object> paramMap, Criteria criteria);

	/**
	 * 根据订单号获取订单
	 * @param paramMap
	 * @param orderSns
	 * @return
	 */
	List<Order> findListByOrderSns(Map<String, Object> paramMap, List<String> orderSns);


	List<Order> queryOrderGoodsAbnormal(Map<String, Object> paramMap, Criteria criteria) throws Exception;


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
