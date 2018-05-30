package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.OrderRefundLogDao;
import net.deepdragon.entity.weipu.OrderRefundLog;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 退款记录数据接口实现
 */
@Repository(Weipu.SIGN + "OrderRefundLogDaoImpl")
public class OrderRefundLogDaoImpl extends BaseDaoImpl<OrderRefundLog, String> implements OrderRefundLogDao {

	@Override
	public List<OrderRefundLog> getRefundLogPager(Map<String,Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = OrderRefundLog.class.getName() + "Mapper.getRefundLogPager";
		criteria.add(Restrictions.eq("tenantId", paramMap.get(Constant.TENANTID_KEY)));
		criteria.add(Restrictions.eq("platform",paramMap.get(Constant.PLATFORM_KEY)));
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

}
