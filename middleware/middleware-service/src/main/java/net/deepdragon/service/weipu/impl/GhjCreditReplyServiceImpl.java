package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.GhjCreditReplyDao;
import net.deepdragon.entity.weipu.GhjCreditReply;
import net.deepdragon.service.weipu.GhjCreditReplyService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditReplyServiceImpl")
public class GhjCreditReplyServiceImpl extends BaseServiceImpl<GhjCreditReply, String> implements GhjCreditReplyService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditReplyDaoImpl")
	private GhjCreditReplyDao ghjCreditReplyDao;
	
	@Override
	public BaseDao<GhjCreditReply, String> getBaseDao() {
		return this.ghjCreditReplyDao;
	}
	
}

