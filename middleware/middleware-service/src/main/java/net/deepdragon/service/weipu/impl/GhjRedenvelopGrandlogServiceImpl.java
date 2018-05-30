package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjRedenvelopGrandlogDao;
import net.deepdragon.entity.weipu.GhjRedenvelopGrandlog;
import net.deepdragon.service.weipu.GhjRedenvelopGrandlogService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopGrandlogServiceImpl")
public class GhjRedenvelopGrandlogServiceImpl extends BaseServiceImpl<GhjRedenvelopGrandlog, String> implements GhjRedenvelopGrandlogService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopGrandlogDaoImpl")
	private GhjRedenvelopGrandlogDao ghjRedenvelopGrandlogDao;
	
	@Override
	public BaseDao<GhjRedenvelopGrandlog, String> getBaseDao() {
		return this.ghjRedenvelopGrandlogDao;
	}
	
}

