package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.KeywordsLogDao;
import net.deepdragon.dao.weipu.TagDao;
import net.deepdragon.entity.weipu.KeywordsLog;
import net.deepdragon.entity.weipu.Tag;
import net.deepdragon.service.weipu.KeywordsLogService;
import net.deepdragon.service.weipu.TagService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"KeywordsLogServiceImpl")
public class KeywordsLogServiceImpl extends BaseServiceImpl<KeywordsLog, String> implements KeywordsLogService {

	@Resource(name= Weipu.SIGN+"KeywordsLogDaoImpl")
	private KeywordsLogDao keywordsLogDao;
	
	@Override
	public BaseDao<KeywordsLog, String> getBaseDao() {
		return this.keywordsLogDao;
	}

}

