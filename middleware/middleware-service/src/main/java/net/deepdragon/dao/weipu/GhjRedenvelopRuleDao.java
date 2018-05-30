package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.GhjRedenvelopRule;

import java.util.List;
import java.util.Map;

public interface GhjRedenvelopRuleDao extends BaseDao<GhjRedenvelopRule, String> {
    List<GhjRedenvelopRule> getRedEnvelopId(Map<String, Object> paramMap, Criteria criteria);

}
