package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjRedenvelopRuleDao;
import net.deepdragon.entity.weipu.GhjRedenvelopRule;
import net.deepdragon.service.weipu.GhjRedenvelopRuleService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopRuleServiceImpl")
public class GhjRedenvelopRuleServiceImpl extends BaseServiceImpl<GhjRedenvelopRule, String> implements GhjRedenvelopRuleService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopRuleDaoImpl")
	private GhjRedenvelopRuleDao ghjRedenvelopRuleDao;
	
	@Override
	public BaseDao<GhjRedenvelopRule, String> getBaseDao() {
		return this.ghjRedenvelopRuleDao;
	}
	
}

