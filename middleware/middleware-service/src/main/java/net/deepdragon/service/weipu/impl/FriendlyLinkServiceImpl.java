package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.FriendlyLinkDao;
import net.deepdragon.entity.weipu.FriendlyLink;
import net.deepdragon.service.weipu.FriendlyLinkService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"FriendlyLinkServiceImpl")
public class FriendlyLinkServiceImpl extends BaseServiceImpl<FriendlyLink, String> implements FriendlyLinkService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"FriendlyLinkDaoImpl")
	private FriendlyLinkDao friendlyLinkDao;
	
	@Override
	public BaseDao<FriendlyLink, String> getBaseDao() {
		return this.friendlyLinkDao;
	}
	
}

