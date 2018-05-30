package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjRedenvelopActiondetailDao;
import net.deepdragon.entity.weipu.GhjRedenvelopActiondetail;
import net.deepdragon.service.weipu.GhjRedenvelopActiondetailService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopActiondetailServiceImpl")
public class GhjRedenvelopActiondetailServiceImpl extends BaseServiceImpl<GhjRedenvelopActiondetail, String> implements GhjRedenvelopActiondetailService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopActiondetailDaoImpl")
	private GhjRedenvelopActiondetailDao ghjRedenvelopActiondetailDao;
	
	@Override
	public BaseDao<GhjRedenvelopActiondetail, String> getBaseDao() {
		return this.ghjRedenvelopActiondetailDao;
	}
	
}

