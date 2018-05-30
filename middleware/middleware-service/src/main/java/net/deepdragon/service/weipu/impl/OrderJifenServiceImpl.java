package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.OrderJifenDao;
import net.deepdragon.entity.weipu.OrderJifen;
import net.deepdragon.service.weipu.OrderJifenService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"OrderJifenServiceImpl")
public class OrderJifenServiceImpl extends BaseServiceImpl<OrderJifen, String> implements OrderJifenService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"OrderJifenDaoImpl")
	private OrderJifenDao orderJifenDao;
	
	@Override
	public BaseDao<OrderJifen, String> getBaseDao() {
		return this.orderJifenDao;
	}
	
}

