package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjRedenvelopActionDao;
import net.deepdragon.entity.weipu.GhjRedenvelopAction;
import net.deepdragon.service.weipu.GhjRedenvelopActionService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopActionServiceImpl")
public class GhjRedenvelopActionServiceImpl extends BaseServiceImpl<GhjRedenvelopAction, String> implements GhjRedenvelopActionService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopActionDaoImpl")
	private GhjRedenvelopActionDao ghjRedenvelopActionDao;
	
	@Override
	public BaseDao<GhjRedenvelopAction, String> getBaseDao() {
		return this.ghjRedenvelopActionDao;
	}
	
}

