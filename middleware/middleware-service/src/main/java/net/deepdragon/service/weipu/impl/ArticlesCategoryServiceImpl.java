package net.deepdragon.service.weipu.impl;


import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.ArticlesCategoryDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.ArticlesCategory;
import net.deepdragon.service.weipu.ArticlesCategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN+"ArticlesCategoryServiceImpl")
public class ArticlesCategoryServiceImpl extends BaseServiceImpl<ArticlesCategory, String> implements ArticlesCategoryService{

	@Resource(name= Weipu.SIGN+"ArticlesCategoryDaoImpl")
	private ArticlesCategoryDao articlesCategoryDao;
	
	@Override
	public BaseDao<ArticlesCategory, String> getBaseDao() {
		return this.articlesCategoryDao;
	}

	@Override
	public List<ArticlesCategory> getArticlesOne(Map<String,Object> paramMap, Integer size, String parentID) {
		return articlesCategoryDao.getArticlesOne(paramMap,size,parentID);
	}

	@Override
	public List<ArticlesCategory> getArticlesByTwoID(Map<String,Object> paramMap, Integer size, String parentID) {
		return articlesCategoryDao.getArticlesByTwoID(paramMap,size,parentID);
	}
}

