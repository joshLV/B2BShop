package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.WonderfulShowDao;
import net.deepdragon.entity.weipu.WonderfulShow;
import net.deepdragon.service.weipu.WonderfulShowService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"WonderfulShowServiceImpl")
public class WonderfulShowServiceImpl extends BaseServiceImpl<WonderfulShow, String> implements WonderfulShowService {

	@Resource(name= Weipu.SIGN+"WonderfulShowDaoImpl")
	private WonderfulShowDao wonderfulShowDao;
	
	@Override
	public BaseDao<WonderfulShow, String> getBaseDao() {
		return this.wonderfulShowDao;
	}
	
}

