package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.CrossBorderOrderDao;
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
@Repository(Weipu.SIGN + "CrossBorderOrderDaoImpl")
public class CrossBorderOrderDaoImpl extends BaseDaoImpl<Order, String> implements CrossBorderOrderDao {


	@Override
	public Map<String,Object> getCrossBorderOrderMap(Map<String, Object> paramMap, Criteria criteria) {
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne( "net.deepdragon.entity.weipu.CrossBorderOrderMapper.getCrossBorderOrderMap", criteria);
	}

	@Override
	public int updateCrossBorderOrderStatus(Map<String, Object> paramMap) {
		return sqlSessionTemplateFactory.getSqlSessionTemplate().update( "net.deepdragon.entity.weipu.CrossBorderOrderMapper.updateCrossBorderOrderStatus", paramMap);
	}

	@Override
	public Map<String, Object> getCrossBorderOrderInfo(Map<String, Object> paramMap, Criteria criteria) {
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne("net.deepdragon.entity.weipu.CrossBorderOrderMapper.getCrossBorderOrderInfo", paramMap);
	}

	@Override
	public int saveCrossBorderOrder(Map<String, Object> paramMap, Map pMap) {
		return sqlSessionTemplateFactory.getSqlSessionTemplate().insert( "net.deepdragon.entity.weipu.CrossBorderOrderMapper.saveCrossBorderOrder", pMap);
	}

}
