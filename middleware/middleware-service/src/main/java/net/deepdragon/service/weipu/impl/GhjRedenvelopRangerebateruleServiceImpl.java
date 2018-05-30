package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjRedenvelopRangerebateruleDao;
import net.deepdragon.entity.weipu.GhjRedenvelopRangerebaterule;
import net.deepdragon.service.weipu.GhjRedenvelopRangerebateruleService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopRangerebateruleServiceImpl")
public class GhjRedenvelopRangerebateruleServiceImpl extends BaseServiceImpl<GhjRedenvelopRangerebaterule, String> implements GhjRedenvelopRangerebateruleService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopRangerebateruleDaoImpl")
	private GhjRedenvelopRangerebateruleDao ghjRedenvelopRangerebateruleDao;
	
	@Override
	public BaseDao<GhjRedenvelopRangerebaterule, String> getBaseDao() {
		return this.ghjRedenvelopRangerebateruleDao;
	}
	
}

