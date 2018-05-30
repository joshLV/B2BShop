package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.OrderOnsaleDao;
import net.deepdragon.entity.weipu.OrderOnsale;
import net.deepdragon.service.weipu.OrderOnsaleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"OrderOnsaleServiceImpl")
public class OrderOnsaleServiceImpl extends BaseServiceImpl<OrderOnsale, String> implements OrderOnsaleService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"OrderOnsaleDaoImpl")
	private OrderOnsaleDao orderOnsaleDao;
	
	@Override
	public BaseDao<OrderOnsale, String> getBaseDao() {
		return this.orderOnsaleDao;
	}
	
}

