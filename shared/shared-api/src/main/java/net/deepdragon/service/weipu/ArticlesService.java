package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.Articles;

import java.util.List;
import java.util.Map;

/**
 * 文章管理数据接口
 */
public interface ArticlesService extends BaseService<Articles, String> {
	
	/**
	 * 保存文章标签数据
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param articles
	 *            文章
	 * @param tagId
	 *            标签ID
	 */
	boolean saveArticleTagInfos(Map<String,Object> paramMap, Articles articles, String tagId);

	/**
	 * 删除文章标签数据
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param articleIds
	 *            文章ID集合
	 */
	boolean deleteArticleTagInfos(Map<String,Object> paramMap, List<String> articleIds);

	/**
	 * 根据文章分类标识获取文章信息
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param sign
	 *            文章分类标识
	 * @param size
	 *            条数
	 * @param orderBy
	 * @param orderType
	 * @return
	 */
	List<Articles> getArticles(Map<String,Object> paramMap, String sign, Integer size,
							   String orderBy, String orderType) throws Exception;
	public List<Articles> getArticles(Map<String,Object> paramMap,Integer size,String categoryId);
	public List<Articles> getArticlesN(Map<String,Object> paramMap,Integer size,String categoryId);
	public List<Articles> getArticlesByTwoID(Map<String,Object> paramMap,Integer size,String categoryId);
}
