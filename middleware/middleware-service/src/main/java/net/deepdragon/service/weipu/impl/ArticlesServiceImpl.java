package net.deepdragon.service.weipu.impl;

import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.ArticlesDao;
import net.deepdragon.dao.weipu.BaseDao;
import net.deepdragon.entity.weipu.Articles;
import net.deepdragon.service.weipu.ArticlesService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "ArticlesServiceImpl")
public class ArticlesServiceImpl extends BaseServiceImpl<Articles, String>
		implements ArticlesService {

	@Resource(name = Weipu.SIGN
			+ "ArticlesDaoImpl")
	private ArticlesDao articlesDao;

	@Override
	public BaseDao<Articles, String> getBaseDao() {
		return this.articlesDao;
	}

	@Override
	public boolean saveArticleTagInfos(Map<String,Object> paramMap, Articles article,
			String tagId) {
		try {
			Articles articles = articlesDao.save(paramMap, article);
			articlesDao.saveArticleTagInfos(paramMap, articles.getId(), tagId);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteArticleTagInfos(Map<String,Object> paramMap,
			List<String> articleIds) {
		try {
			if (CollectionUtils.isNotEmpty(articleIds)) {
				for (String id : articleIds) {
					articlesDao.delete(paramMap, id);
					articlesDao.deleteArticleTagInfos(paramMap, id);
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Articles> getArticles(Map<String,Object> paramMap, String sign, Integer size,
			String orderBy, String orderType) throws Exception {
		try {
			return this.articlesDao.getArticles(paramMap, sign, size, orderBy,
					orderType);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<Articles> getArticles(Map<String,Object> paramMap, Integer size, String categoryId) {
		return articlesDao.getArticles(paramMap,size,categoryId);
	}

	@Override
	public List<Articles> getArticlesN(Map<String,Object> paramMap, Integer size, String categoryId) {
		return articlesDao.getArticlesN(paramMap,size,categoryId);
	}

	@Override
	public List<Articles> getArticlesByTwoID(Map<String,Object> paramMap, Integer size, String categoryId) {
		return articlesDao.getArticlesByTwoID(paramMap,size,categoryId);
	}

}
