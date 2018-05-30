package net.deepdragon.dao.weipu;

import net.deepdragon.entity.weipu.Articles;

import java.util.List;
import java.util.Map;

public interface ArticlesDao extends BaseDao<Articles, String> {
	/**
	 * 保存文章标签数据
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param articleId
	 *            文章ID
	 * @param tagId
	 *            标签ID
	 */
	int saveArticleTagInfos(Map<String,Object> paramMap, String articleId, String tagId);

	/**
	 * 删除文章标签数据
	 * 
	 * @param paramMap
	 *            参数Map
	 * @param articleId
	 *            文章ID
	 */
	int deleteArticleTagInfos(Map<String,Object> paramMap, String articleId);

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
			String orderBy, String orderType);

	public List<Articles> getArticles(Map<String,Object> paramMap,Integer size,String categoryId);
	public List<Articles> getArticlesN(Map<String,Object> paramMap,Integer size,String categoryId);
	public List<Articles> getArticlesByTwoID(Map<String,Object> paramMap,Integer size,String categoryId);

}
