package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.ArticlesCategory;

import java.util.List;
import java.util.Map;

/**
 * 文章分类数据接口
*/
public interface ArticlesCategoryService extends BaseService<ArticlesCategory, String> {
    public List<ArticlesCategory> getArticlesOne(Map<String,Object> paramMap,Integer size,String parentID);
    public List<ArticlesCategory> getArticlesByTwoID(Map<String,Object> paramMap,Integer size,String parentID);

}
