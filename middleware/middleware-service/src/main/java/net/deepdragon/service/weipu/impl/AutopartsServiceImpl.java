package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.AutopartsDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.Autoparts;
import net.deepdragon.service.weipu.AutopartsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"AutopartsServiceImpl")
public class AutopartsServiceImpl extends BaseServiceImpl<Autoparts, String> implements AutopartsService{

	@Resource(name= Weipu.SIGN+"AutopartsDaoImpl")
	private AutopartsDao autopartsDao;
	
	@Override
	public BaseDao<Autoparts, String> getBaseDao() {
		return this.autopartsDao;
	}
	
}

