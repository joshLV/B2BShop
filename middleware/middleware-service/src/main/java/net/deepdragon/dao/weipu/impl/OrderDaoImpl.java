package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderDao;
import net.deepdragon.entity.weipu.Order;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import net.deepdragon.weipu.bean.PayType;
import org.apache.ibatis.session.ExecutorType;
import org.springframework.stereotype.Repository;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单信息数据接口实现
 */
@Repository(Weipu.SIGN + "OrderDaoImpl")
public class OrderDaoImpl extends BaseDaoImpl<Order, String> implements OrderDao {

	@Override
	public Order save(Map<String, Object> paramMap, Order entity, boolean isBatch) {
		String defaultStatement = Order.class.getName() + "Mapper.save";

		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
		}
		if(isBatch){
			this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).insert(defaultStatement, entity);

		}else{
			this.sqlSessionTemplateFactory.getSqlSessionTemplate().insert(defaultStatement, entity);

		}


		return entity;
	}

	@Override
	public Order save(Map<String, Object> paramMap, Order entity) {
		return this.save(paramMap, entity, true);
	}

	/**
	 * 删除订单对象
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param orderId
	 *            PK
	 * @param isBatch
	 *            是否采用批量模式操作
	 * 
	 * @return 受影响的行数
	 */
	public int deleteOrder(Map<String, Object> paramMap, String orderId, boolean isBatch) {
		String defaultStatement = Order.class.getName() + "Mapper.delete";
		if (isBatch) {
			return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, orderId);
		} else {
			return sqlSessionTemplateFactory.getSqlSessionTemplate().delete(defaultStatement, orderId);
		}
	}

	/**
	 * 保存一个对象
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param entity
	 *            订单对象
	 * 
	 * @return 保存的对象
	 */
	public Order saveOne(Map<String, Object> paramMap, Order entity) {
		String defaultStatement = Order.class.getName() + "Mapper.save";

		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, Constant.TENANTID_KEY);
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY).toString());
		}

		this.sqlSessionTemplateFactory.getSqlSessionTemplate().insert(defaultStatement, entity);

		return entity;
	}

	@Override
	public List<Order> getExportList(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = Order.class.getName() + "Mapper.getExportList";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
	}

	@Override
	public List<Order> getXYMExportList(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = Order.class.getName() + "Mapper.getXYMExportList";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
	}

	@Override
	public List<Order> getHourOrderList(Map<String, Object> paramMap, int hour, int type) {
		String defaultStatement = Order.class.getName() + "Mapper.getHourOrderList";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("hour", hour);
		parameter.put("type", type);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public List<Order> getConfirmOrderList(Map<String, Object> paramMap, int hour) {
		String defaultStatement = Order.class.getName() + "Mapper.getConfirmOrderList";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("hour", hour);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public PayType getPayAmount(Map<String, Object> paramMap, String start, String end) {
		String defaultStatement = Order.class.getName() + "Mapper.getPayAmount";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("start", start);
		parameter.put("end", end);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, parameter);
	}

	@Override
	public List<Map<String, Object>> getGoodsDayReport(Map<String, Object> paramMap) {
		String defaultStatement = Order.class.getName() + "Mapper.getGoodsDayReport";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement);
	}
	
	@Override
	public List<Map<String, Object>> getOrderGoodsReport(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = Order.class.getName() + "Mapper.getOrderGoodsReport";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
	}
	
	@Override
	public List<Map<String, Object>> getGoodsReport(Map<String, Object> paramMap, Criteria criteria){
		String defaultStatement = Order.class.getName() + "Mapper.getGoodsReport";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
	}

	@Override
	public List<Map<String, Object>> getPassengerByTime(Map<String, Object> paramMap,
			String start, String end) {
		String defaultStatement = Order.class.getName() + "Mapper.getPassengerByTime";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("start", start);
		parameter.put("end", end);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public List<Map<String, Object>> getOrderModeByTime(Map<String, Object> paramMap,
			String start, String end) {
		String defaultStatement = Order.class.getName() + "Mapper.getOrderModeByTime";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("start", start);
		parameter.put("end", end);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public List<Order> findListByOrderSns(Map<String, Object> paramMap, List<String> orderSns) {
		String defaultStatement = Order.class.getName() + "Mapper.findListByOrderSns";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, orderSns);
	}


	public List<Order> queryOrderGoodsAbnormal(Map<String, Object> paramMap, Criteria criteria) throws Exception {
		String defaultStatement = Order.class.getName() + "Mapper.queryOrderGoodsAbnormal";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
	}


	/**
	 * 20160718 dzz
	 * 1.查询当前众筹商品已众筹商品数量总数 (条件: 订单类型orderType:1, 商品Id, 众筹开始结束时间范围)
	 * 2.查询当前用户所众筹商品数量总数 (条件: 订单类型orderType:1, 商品Id, 众筹开始结束时间范围, 当前用户Id)
	 * @param paramMap
	 * @param criteria
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getZCQuantitySum(Map<String, Object> paramMap, Criteria criteria) throws Exception {
		String defaultStatement = Order.class.getName() + "Mapper.getZCQuantitySum";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
	}

}
