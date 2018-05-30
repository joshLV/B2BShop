package net.deepdragon.dao.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.ArticlesCategoryDao;
import net.deepdragon.entity.weipu.ArticlesCategory;
import net.deepdragon.util.Constant;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文章分类数据接口实现
*/
@Repository(Weipu.SIGN + "ArticlesCategoryDaoImpl")
public class ArticlesCategoryDaoImpl extends BaseDaoImpl<ArticlesCategory, String> implements
		ArticlesCategoryDao {

	@Override
	public List<ArticlesCategory> getArticlesOne(Map<String,Object> paramMap, Integer size, String categoryId) {
		String defaultStatement = ArticlesCategory.class.getName() + "Mapper.getArticlesOne";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",paramMap.get(Constant.TENANTID_KEY));
		parameter.put("platform",paramMap.get(Constant.PLATFORM_KEY));
		parameter.put("size", size);
		parameter.put("categoryId", categoryId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public List<ArticlesCategory> getArticlesByTwoID(Map<String,Object> paramMap, Integer size, String parentID) {
		String defaultStatement = ArticlesCategory.class.getName() + "Mapper.getArticlesCThree";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",paramMap.get(Constant.TENANTID_KEY));
		parameter.put("platform",paramMap.get(Constant.PLATFORM_KEY));
		parameter.put("size", size);
		parameter.put("parentID", parentID);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}
}
