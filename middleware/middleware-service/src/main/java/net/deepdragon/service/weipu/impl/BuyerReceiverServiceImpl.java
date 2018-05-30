package net.deepdragon.service.weipu.impl;


import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.BuyerReceiverDao;
import net.deepdragon.entity.weipu.BuyerReceiver;
import net.deepdragon.service.weipu.BuyerReceiverService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerReceiverServiceImpl")
public class BuyerReceiverServiceImpl extends BaseServiceImpl<BuyerReceiver, String> implements BuyerReceiverService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerReceiverDaoImpl")
	private BuyerReceiverDao buyerReceiverDao;
	
	@Override
	public BaseDao<BuyerReceiver, String> getBaseDao() {
		return this.buyerReceiverDao;
	}
	
}

