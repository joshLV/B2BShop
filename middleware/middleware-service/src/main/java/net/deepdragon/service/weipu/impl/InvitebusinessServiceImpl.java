package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.InvitebusinessDao;
import net.deepdragon.entity.weipu.Invitebusiness;
import net.deepdragon.service.weipu.InviteBusinessService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"InvitebusinessServiceImpl")
public class InvitebusinessServiceImpl extends BaseServiceImpl<Invitebusiness, String> implements InviteBusinessService{

	@Resource(name=Weipu.SIGN+"InvitebusinessDaoImpl")
	private InvitebusinessDao invitebusinessDao;
	
	@Override
	public BaseDao<Invitebusiness, String> getBaseDao() {
		return this.invitebusinessDao;
	}
	
}

