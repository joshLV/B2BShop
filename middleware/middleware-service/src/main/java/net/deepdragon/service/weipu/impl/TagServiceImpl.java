package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.TagDao;
import net.deepdragon.entity.weipu.Tag;
import net.deepdragon.service.weipu.TagService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(Weipu.SIGN+"TagServiceImpl")
public class TagServiceImpl extends BaseServiceImpl<Tag, String> implements TagService {

	@Resource(name= Weipu.SIGN+"TagDaoImpl")
	private TagDao tagDao;
	
	@Override
	public BaseDao<Tag, String> getBaseDao() {
		return this.tagDao;
	}

}

