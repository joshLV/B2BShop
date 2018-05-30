package net.deepdragon.service.weipu;

import net.deepdragon.entity.weipu.GoodsBrand;
import net.deepdragon.entity.weipu.GoodsCategory;

import java.util.List;
import java.util.Map;

/**
 * 商品分类表数据接口
 */
public interface GoodsCategoryService extends BaseService<GoodsCategory, String> {
	/**
	 * 根据商品分类id获取品牌id
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param categoryId
	 *            商品类别ID
	 * 
	 * @return
	 * 
	 * @throws Exception
	 */
	List<String> getbrandIdsBycategoryId(Map<String, Object> paramMap, String categoryId);

	/**
	 * 根据商品分类id获取品牌id
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param categoryId
	 *            商品类别ID
	 * @param size
	 *            取多少条
	 * @return
	 * 
	 * @throws Exception
	 */
	List<String> getBrandIds(Map<String, Object> paramMap, String categoryId, int size);

	/**
	 * 获取商品级别下所有品牌信息集合
	 *
	 * @param paramMap
	 *          租户ID
	 * @param categoryId
	 *          商品类别ID
	 * @param size
	 * 			 取多少条数据
	 * @return
	 * @throws Exception
	 * TianYu 2015-12-09 15:14:33
	 */
	List<GoodsBrand> getGoodsBrandByCatelogId(Map<String, Object> paramMap, String categoryId,int size);
    /**
     * 根据商品分类id获取品牌id
     *
     * @param paramMap
     *            租户ID
     * @param categoryId
     *            商品类别ID
     * @return
     *
     * @throws Exception
     */
    List<String> getBrandBycatcategoryId(Map<String, Object> paramMap, String categoryId);
	/**
	 * 保存商品类别与品牌关系
	 * 
	 * @param categoryId
	 *            * @param GoodsBrands 品牌集合
	 * 
	 * @return
	 */
	boolean saveRelationCategoryBrand(Map<String, Object> paramMap, String categoryId, List<String> brandIds) throws Exception;

	/**
	 * 删除商品类别与品牌关系
	 * 
	 * @param categoryId
	 *            * @param GoodsBrands 品牌集合
	 * 
	 * @return
	 */
	int delRelationCategoryBrand(Map<String, Object> paramMap, String categoryId) throws Exception;

	/**
	 * 获取某个商品类别下的所有商品列表
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param categoryId
	 *            商品类别Id
	 * @param nums
	 *            要取多少条商品数据
	 * 
	 * @return List<Goods> 商品列表
	 */
	List<?> getCategoryOfGoods(Map<String, Object> paramMap, String categoryId, Integer nums) throws Exception;

	/**
	 * 根据前端catelogId获取对应的后台GoodsCategory对象
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param catelogId
	 *            条件对象
	 * 
	 * @return 商品分类对象
	 */
	GoodsCategory getGategoryByCatelog(Map<String, Object> paramMap, String catelogId);

	/**
	 * 根据前端shopId获取对应的商品类别
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param shopId
	 *            店铺对象
	 * 
	 * @return 商品分类对象
	 */
	List<?> getGategoryByshopId(Map<String, Object> paramMap, String shopId) throws Exception;

	/**
	 * 保存商品分类的同时 同步前台分类
	 * 
	 * @param paramMap
	 * @param goodsCategory
	 * @return
	 */
	void saveCategory(Map<String, Object> paramMap, GoodsCategory goodsCategory) throws Exception;
}
