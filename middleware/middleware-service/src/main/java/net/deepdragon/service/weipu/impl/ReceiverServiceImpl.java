package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.ReceiverDao;
import net.deepdragon.entity.weipu.Receiver;
import net.deepdragon.service.weipu.ReceiverService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"ReceiverServiceImpl")
public class ReceiverServiceImpl extends BaseServiceImpl<Receiver, String> implements ReceiverService {

	@Resource(name= Weipu.SIGN+"ReceiverDaoImpl")
	private ReceiverDao receiverDao;
	
	@Override
	public BaseDao<Receiver, String> getBaseDao() {
		return this.receiverDao;
	}
	
}

