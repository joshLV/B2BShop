package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.DeliveryManDao;
import net.deepdragon.entity.weipu.DeliveryMan;
import net.deepdragon.service.weipu.DeliveryManService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"DeliveryManServiceImpl")
public class DeliveryManServiceImpl extends BaseServiceImpl<DeliveryMan, String> implements DeliveryManService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"DeliveryManDaoImpl")
	private DeliveryManDao deliveryManDao;
	
	@Override
	public BaseDao<DeliveryMan, String> getBaseDao() {
		return this.deliveryManDao;
	}
	
}

