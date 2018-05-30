package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.ArticlesDao;
import net.deepdragon.entity.weipu.Articles;
import net.deepdragon.util.Constant;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文章管理数据接口实现
*/
@Repository(Weipu.SIGN + "ArticlesDaoImpl")
public class ArticlesDaoImpl extends BaseDaoImpl<Articles, String> implements
        ArticlesDao {

    @Override
    public int saveArticleTagInfos(Map<String,Object> paramMap, String articlesId, String tagId) {
        Assert.notNull(articlesId, "parameter 'articlesId' can't be null");
        Assert.notNull(tagId, "parameter 'tagId' can't be null");
        String defaultStatement = Articles.class.getName()
                + "Mapper.saveArticleTagInfos";
        SqlSession sqlSession = sqlSessionTemplateFactory
                .getSqlSessionTemplate();
        try {
            Map<String, String> relationship = new HashMap<String, String>();
            relationship.put("articlesId", articlesId);
            relationship.put("tagId", tagId);
            relationship.put("tenantId",paramMap.get(Constant.TENANTID_KEY).toString());
            relationship.put("platform",paramMap.get(Constant.PLATFORM_KEY).toString());
            sqlSession.insert(defaultStatement, relationship);
            return 1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int deleteArticleTagInfos(Map<String,Object> paramMap, String articlesId) {
        String defaultStatement = Articles.class.getName() + "Mapper.deleteArticleTagInfos";
        return this.sqlSessionTemplateFactory.getSqlSessionTemplate().delete(
                defaultStatement, articlesId);
    }
    
	@Override
	public List<Articles> getArticles(Map<String,Object> paramMap, String sign, Integer size,
			String orderBy, String orderType) {
		String defaultStatement = Articles.class.getName()
				+ "Mapper.getArticles";
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("art.tenantId", paramMap.get(Constant.TENANTID_KEY).toString()));
        criteria.add(Restrictions.eq("art.platform", paramMap.get(Constant.PLATFORM_KEY).toString()));
		criteria.add(Restrictions.eq("art.isPublication", 1));
		criteria.add(Restrictions.eq("cate.sign", sign));
        criteria.add(Restrictions.order("isTop", "DESC"));
		if (StringUtils.isNotEmpty(orderBy)) {
			criteria.add(Restrictions.order("art." + orderBy, StringUtils
					.equalsIgnoreCase("desc", orderType) ? "DESC" : "ASC"));
		}
		criteria.add(Restrictions.order("art.orderNo", "DESC"));
		criteria.add(Restrictions.order("art.createDate", "DESC"));
		if (size!=null && size > 0) {
			criteria.add(Restrictions.limit("0", size.toString()));
		}
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}


    @Override
    public List<Articles> getArticles(Map<String,Object> paramMap, Integer size, String parentID) {
        String defaultStatement = Articles.class.getName() + "Mapper.getArticlesByID";
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("tenantId",paramMap.get(Constant.TENANTID_KEY));
        parameter.put("platform",paramMap.get(Constant.PLATFORM_KEY));
        parameter.put("size", size);
        parameter.put("parentID", parentID);
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
    }

    @Override
    public List<Articles> getArticlesN(Map<String,Object> paramMap, Integer size, String categoryId) {
        String defaultStatement = Articles.class.getName() + "Mapper.getArticlesByThree";
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("tenantId",paramMap.get(Constant.TENANTID_KEY));
        parameter.put("platform",paramMap.get(Constant.PLATFORM_KEY));
        parameter.put("size", size);
        parameter.put("categoryId", categoryId);
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
    }

    @Override
    public List<Articles> getArticlesByTwoID(Map<String,Object> paramMap, Integer size, String categoryId) {
        String defaultStatement = Articles.class.getName() + "Mapper.getArticlesByTwoID";
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("tenantId",paramMap.get(Constant.TENANTID_KEY));
        parameter.put("platform",paramMap.get(Constant.PLATFORM_KEY));
        parameter.put("size", size);
        parameter.put("categoryId", categoryId);
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
    }
}
