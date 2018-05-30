package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.ArticlesCategory;

import java.util.List;
import java.util.Map;

public interface ArticlesCategoryDao extends BaseDao<ArticlesCategory, String> {
    public List<ArticlesCategory> getArticlesOne(Map<String,Object> paramMap,Integer size,String parentID);
    public List<ArticlesCategory> getArticlesByTwoID(Map<String,Object> paramMap,Integer size,String parentID);
}
