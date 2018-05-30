package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerOperatorDao;
import net.deepdragon.entity.weipu.BuyerOperator;
import net.deepdragon.service.weipu.BuyerOperatorService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerOperatorServiceImpl")
public class BuyerOperatorServiceImpl extends BaseServiceImpl<BuyerOperator, String> implements BuyerOperatorService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerOperatorDaoImpl")
	private BuyerOperatorDao buyerOperatorDao;
	
	@Override
	public BaseDao<BuyerOperator, String> getBaseDao() {
		return this.buyerOperatorDao;
	}
	
}

