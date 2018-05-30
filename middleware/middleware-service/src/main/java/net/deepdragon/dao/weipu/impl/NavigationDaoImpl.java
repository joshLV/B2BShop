package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.NavigationDao;
import net.deepdragon.entity.weipu.Keywords;
import net.deepdragon.entity.weipu.Navigation;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 导航管理数据接口实现
*/
@Repository(Weipu.SIGN + "NavigationDaoImpl")
public class NavigationDaoImpl extends BaseDaoImpl<Navigation, String> implements
		NavigationDao {

	@Override
	public List<Keywords> getListKeywords(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = Navigation.class.getName() + "Mapper.getListKeywords";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}

}
