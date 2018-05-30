package net.deepdragon.dao.weipu.impl;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.IndexShopDao;
import net.deepdragon.entity.weipu.Enquiry;
import net.deepdragon.entity.weipu.IndexShop;
import net.deepdragon.mybatis.domain.PageBounds;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 首页品牌旗舰店数据接口实现
*/
@Repository(Weipu.SIGN + "IndexShopDaoImpl")
public class IndexShopDaoImpl extends BaseDaoImpl<IndexShop, String> implements
		IndexShopDao {

	@Override
	public List<Map<String,Object>> getPager4JULI(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		String defaultStatement = IndexShop.class.getName() + "Mapper.getPager4JULI";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}
	public Long getPager4JULICount(Map<String, Object> paramMap){

		String defaultStatement = IndexShop.class.getName()
				+ "Mapper.getPager4JULICout";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
				defaultStatement, paramMap);
	}

	public Long getPager4JULI4SJCout(Map<String, Object> paramMap){

		String defaultStatement = IndexShop.class.getName()
				+ "Mapper.getPager4JULI4SJCout";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
				defaultStatement, paramMap);
	}


	@Override
	public List<Map<String,Object>> getPager4JULI4SJ(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		String defaultStatement = IndexShop.class.getName() + "Mapper.getPager4JULI4SJ";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}


}
