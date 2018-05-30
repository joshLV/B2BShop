package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.OrderRefundImagesDao;
import net.deepdragon.entity.weipu.OrderRefundImages;
import net.deepdragon.service.weipu.OrderRefundImagesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"OrderRefundImagesServiceImpl")
public class OrderRefundImagesServiceImpl extends BaseServiceImpl<OrderRefundImages, String> implements OrderRefundImagesService{

	@Resource(name= Weipu.SIGN+"OrderRefundImagesDaoImpl")
	private OrderRefundImagesDao orderRefundImagesDao;
	
	@Override
	public BaseDao<OrderRefundImages, String> getBaseDao() {
		return this.orderRefundImagesDao;
	}
	
}

