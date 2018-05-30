package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderPaylogDao;
import net.deepdragon.entity.weipu.OrderPaylog;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单支付记录数据接口实现
 */
@Repository(Weipu.SIGN + "OrderPaylogDaoImpl")
public class OrderPaylogDaoImpl extends BaseDaoImpl<OrderPaylog, String> implements OrderPaylogDao {

	@Override
	public List<OrderPaylog> getPayCount(Map<String, Object> paramMap, String start, String end) {
		String defaultStatement = OrderPaylog.class.getName() + "Mapper.getPayCount";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("start", start);
		parameter.put("end", end);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public Double getPaidAmountTotalByOrderSn(Map<String, Object> paramMap, String orderSn, String no) {
		String defaultStatement = OrderPaylog.class.getName() + "Mapper.getPaidAmountTotalByOrderSn";
		paramMap.put("orderSn", orderSn);
		paramMap.put("no", no);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, paramMap);
	}

	@Override
	public List<OrderPaylog> getRPayTotalGroupByR(Map<String, Object> paramMap, String orderSn, String buyerId) {
		String defaultStatement = OrderPaylog.class.getName() + "Mapper.getRPayTotalGroupByR";
		paramMap.put("orderSn", orderSn);
		paramMap.put("memberId", buyerId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

	@Override
	public List<OrderPaylog> getPayTotalGroupByType(Map<String, Object> paramMap, String orderSn, String buyerId) {
		String defaultStatement = OrderPaylog.class.getName() + "Mapper.getPayTotalGroupByType";
		paramMap.put("orderSn", orderSn);
		paramMap.put("memberId", buyerId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}
}
