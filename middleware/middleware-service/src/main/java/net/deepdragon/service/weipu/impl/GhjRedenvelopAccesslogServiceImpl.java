package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjRedenvelopAccesslogDao;
import net.deepdragon.entity.weipu.GhjRedenvelopAccesslog;
import net.deepdragon.service.weipu.GhjRedenvelopAccesslogService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopAccesslogServiceImpl")
public class GhjRedenvelopAccesslogServiceImpl extends BaseServiceImpl<GhjRedenvelopAccesslog, String> implements GhjRedenvelopAccesslogService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopAccesslogDaoImpl")
	private GhjRedenvelopAccesslogDao ghjRedenvelopAccesslogDao;
	
	@Override
	public BaseDao<GhjRedenvelopAccesslog, String> getBaseDao() {
		return this.ghjRedenvelopAccesslogDao;
	}
	
}

