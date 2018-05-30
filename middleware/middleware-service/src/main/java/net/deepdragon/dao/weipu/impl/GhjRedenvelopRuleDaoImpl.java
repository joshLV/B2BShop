package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.dao.weipu.GhjRedenvelopRuleDao;
import net.deepdragon.entity.weipu.GhjRedenvelopRule;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * ghj_ghj_redenvelop_rule数据接口实现
*/
@Repository(net.deepdragon.constant.weipu.Weipu.SIGN + "GhjRedenvelopRuleDaoImpl")
public class GhjRedenvelopRuleDaoImpl extends BaseDaoImpl<GhjRedenvelopRule, String> implements
		GhjRedenvelopRuleDao {

	@Override
	public List<GhjRedenvelopRule> getRedEnvelopId(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = GhjRedenvelopRule.class.getName() + "Mapper.getRedEnvelopId";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}

}
