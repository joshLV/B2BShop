package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.dao.weipu.GhjRedenvelopGrandlogDao;
import net.deepdragon.entity.weipu.GhjRedenvelopGrandlog;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * ghj_ghj_redenvelop_grandlog数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "GhjRedenvelopGrandlogDaoImpl")
public class GhjRedenvelopGrandlogDaoImpl extends BaseDaoImpl<GhjRedenvelopGrandlog, String> implements
		GhjRedenvelopGrandlogDao {
	@Override
	public List<GhjRedenvelopGrandlog> getRedEnvelopByShopId(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = GhjRedenvelopGrandlog.class.getName() + "Mapper.getRedEnvelopByShopId";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}
}
