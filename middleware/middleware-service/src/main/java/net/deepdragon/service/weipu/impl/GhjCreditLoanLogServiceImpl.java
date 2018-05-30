package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjCreditLoanLogDao;
import net.deepdragon.entity.weipu.GhjCreditLoanLog;
import net.deepdragon.service.weipu.GhjCreditLoanLogService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditLoanLogServiceImpl")
public class GhjCreditLoanLogServiceImpl extends BaseServiceImpl<GhjCreditLoanLog, String> implements GhjCreditLoanLogService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditLoanLogDaoImpl")
	private GhjCreditLoanLogDao ghjCreditLoanLogDao;
	
	@Override
	public BaseDao<GhjCreditLoanLog, String> getBaseDao() {
		return this.ghjCreditLoanLogDao;
	}
	
}

