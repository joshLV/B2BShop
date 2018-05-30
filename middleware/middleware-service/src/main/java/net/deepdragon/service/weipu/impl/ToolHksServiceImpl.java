package net.deepdragon.service.weipu.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.ToolHksDao;
import net.deepdragon.entity.weipu.ToolHks;
import net.deepdragon.service.weipu.ToolHksService;

@Service(net.deepdragon.constant.weipu.Weipu.SIGN+"ToolHksServiceImpl")
public class ToolHksServiceImpl extends BaseServiceImpl<ToolHks, String> implements ToolHksService{

	@Resource(name=net.deepdragon.constant.weipu.Weipu.SIGN+"ToolHksDaoImpl")
	private ToolHksDao toolHksDao;
	
	@Override
	public BaseDao<ToolHks, String> getBaseDao() {
		return this.toolHksDao;
	}
	
}

