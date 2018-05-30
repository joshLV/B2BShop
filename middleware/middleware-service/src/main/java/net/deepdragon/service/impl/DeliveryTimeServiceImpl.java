package net.deepdragon.service.impl;


import net.deepdragon.constant.Shared;
import net.deepdragon.dao.BaseDao;
import net.deepdragon.dao.DeliveryTimeDao;
import net.deepdragon.entity.DeliveryTime;
import net.deepdragon.service.DeliveryTimeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Shared.SIGN+"DeliveryTimeServiceImpl")
public class DeliveryTimeServiceImpl extends BaseServiceImpl<DeliveryTime, String> implements DeliveryTimeService {

	@Resource(name= Shared.SIGN+"DeliveryTimeDaoImpl")
	private DeliveryTimeDao deliveryTimeDao;
	
	@Override
	public BaseDao<DeliveryTime, String> getBaseDao() {
		return this.deliveryTimeDao;
	}
	
}

