package net.deepdragon.dao.weipu;

import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.GoodsBrand;
import net.deepdragon.entity.weipu.GoodsCategory;

import java.util.List;
import java.util.Map;

public interface GoodsCategoryDao extends BaseDao<GoodsCategory, String> {
    /**
     * 根据商品类别id获取品牌id集合
     *
     * @param paramMap
     *            租户ID
     * @param categoryId
     *            商品类别ID
     * @return
     * @throws Exception
     */;
    List<String> getBrandIdsBycategoryId(Map<String, Object> paramMap, String categoryId);
    /**
     * 获取商品级别下所有品牌信息ID集合
     *
     * @param paramMap
     *          租户ID
     * @param categoryId
     *          商品类别ID
     * @param size
     * 			 取多少条数据       
     * @return
     * @throws Exception
     */;
    List<String> getBrandIds(Map<String, Object> paramMap, String categoryId,int size);

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
     * 获取商品级别下所有品牌信息ID集合
     *
     * @param paramMap
     *          租户ID
     * @param categoryId
     *          商品类别ID
     * @return
     * @throws Exception
     */;
    List<String> getBrandBycatcategoryId(Map<String, Object> paramMap, String categoryId);
    /**
     * 删除商品类别品牌关系
     *
     * @param categoryId
     *            商品类别ID
     * @return
     * @throws Exception
     */
    int delRelationCategoryBrand(Map<String, Object> paramMap, String categoryId) throws Exception;
    /**
     * 批量商品类别品牌关系信息
     *
     * @param categoryId
     *            商品类别id
     *
     *
     * @param brandIds
     *            品牌类别id
     * @return
     */
    int[] saveRelationCategoryBrand(Map<String, Object> paramMap, String categoryId, List<String> brandIds);

    /**
     * 根据前端catelog获取对应的后台GoodsCategory对象
     *
     * @param criteria 条件对象
     *
     * @return 商品分类列表
     */
    List<?> getGategoryByCatelog(Criteria criteria);
    /**
     * 根据前端shopId获取对应的商品类别
     *
     * @param paramMap  租户Id
     * @param shopId 店铺对象
     *
     * @return 商品分类对象
     */
    List<GoodsCategory> getGategoryByshopId(Map<String, Object> paramMap, String shopId);
}
