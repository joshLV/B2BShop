package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.CatelogIndexDao;
import net.deepdragon.entity.weipu.CatelogIndex;
import net.deepdragon.service.weipu.CatelogIndexService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"CatelogIndexServiceImpl")
public class CatelogIndexServiceImpl extends BaseServiceImpl<CatelogIndex, String> implements CatelogIndexService {

	@Resource(name= Weipu.SIGN+"CatelogIndexDaoImpl")
	private CatelogIndexDao catelogIndexDao;
	
	@Override
	public BaseDao<CatelogIndex, String> getBaseDao() {
		return this.catelogIndexDao;
	}

	@Override
	public boolean saveCatelogIndexs(Map<String, Object> paramMap, List<CatelogIndex> list)
			throws Exception {
		catelogIndexDao.deleteAll(paramMap);
		catelogIndexDao.save(paramMap, list);
		return false;
	}
	
}

