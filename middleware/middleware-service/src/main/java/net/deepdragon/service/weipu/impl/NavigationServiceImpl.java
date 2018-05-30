package net.deepdragon.service.weipu.impl;


import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.dao.weipu.NavigationDao;
import net.deepdragon.entity.weipu.Keywords;
import net.deepdragon.entity.weipu.Navigation;
import net.deepdragon.service.weipu.NavigationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"NavigationServiceImpl")
public class NavigationServiceImpl extends BaseServiceImpl<Navigation, String> implements NavigationService{

	@Resource(name= Weipu.SIGN+"NavigationDaoImpl")
	private NavigationDao navigationDao;
	
	@Override
	public BaseDao<Navigation, String> getBaseDao() {
		return this.navigationDao;
	}

	@Override
	public List<Keywords> getListKeywords(Map<String, Object> paramMap, Criteria criteria) throws Exception {
		try {

			return this.navigationDao.getListKeywords(paramMap, criteria);
		} catch (Exception e) {
			throw e;
		}
	}
	
}

