package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjCreditDao;
import net.deepdragon.entity.weipu.GhjCredit;
import net.deepdragon.service.weipu.GhjCreditService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditServiceImpl")
public class GhjCreditServiceImpl extends BaseServiceImpl<GhjCredit, String> implements GhjCreditService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditDaoImpl")
	private GhjCreditDao ghjCreditDao;
	
	@Override
	public BaseDao<GhjCredit, String> getBaseDao() {
		return this.ghjCreditDao;
	}
	
}

