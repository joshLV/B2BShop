package net.deepdragon.dao.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.mybatis.domain.PageBounds;

import java.util.List;
import java.util.Map;

public interface GoodsDao extends BaseDao<Goods, String> {
	/**
	 * 最直接的分页获取数据
	 *
	 * @param criteria
	 *            查询条件
	 * @param pageBounds
	 *            分页参数
	 *
	 * @return 分页对象
	 */
	List<?> getListByPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

	/**
	 * 以批量的执行方式获取Goods对象
	 *
	 * @param id
	 *            商品Id
	 *
	 * @return 商品对象
	 */
	Goods getGoodsByBatchType(Map<String, Object> paramMap, String id);

	/**
	 * 保存商品相关联的参数
	 *
	 * @param pMapList
	 *            商品参数列表
	 */
	int[] saveGoodsParamDetail(Map<String, Object> paramMap, List<Map<String, Object>> pMapList);

	/**
	 * 保存商品相关联的属性
	 *
	 * @param attrMap
	 *            商品属性
	 */
	int[] saveGoodsAttrValues(Map<String, Object> paramMap, Map<String, Object> attrMap);

	/**
	 * 保存商品相关联的规格
	 *
	 * @param spDataList
	 *            商品规格列表(选中的,即:checked的)
	 */
	int[] saveGoodsSpList(Map<String, Object> paramMap, List<Map<String, Object>> spDataList);

	/**
	 * 保存商品规格项
	 *
	 * @param spMapList
	 *            商品参数列表
	 */
	int[] saveGoodsSpDetail(Map<String, Object> paramMap, List<Map<String, Object>> spMapList);

	/**
	 * 根据goodsId删除商品参数项
	 *
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * @return 处理了多少项
	 */
	int deleteParams(Map<String, Object> paramMap, List<Long> goodsIds);

	/**
	 * 根据goodsId删除商品属性项
	 *
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * @return 处理了多少项
	 */
	int deleteAttrs(Map<String, Object> paramMap, List<Long> goodsIds);

	/**
	 * 根据goodsId删除商品规格
	 *
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * @return 处理了多少项
	 */
	int deleteSpecs(Map<String, Object> paramMap, List<Long> goodsIds);

	/**
	 * 根据goodsId删除商品规格项
	 *
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * @return 处理了多少项
	 */
	int deleteSpItems(Map<String, Object> paramMap, List<Long> goodsIds);

	/**
	 * 根据goodsId删除商品图片
	 *
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * @return 处理了多少项
	 */
	int deleteImages(Map<String, Object> paramMap, List<Long> goodsIds);

	/**
	 * 获取商品参数列表信息
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * @return 参数列表
	 */
	List<?> getGoodsParamsList(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 获取商品属性列表信息
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * @return 属性列表
	 */
	List<?> getGoodsAttrsList(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 获取商品属性列表信息(以批量的方式)
	 *
	 * @param property 字段名称
	 * @param value    字段值
	 *
	 * @return 属性列表
	 */
	List getGoodsAttrsListBatch(Map<String, Object> paramMap, String property, String value);

	/**
	 * 获取商品选中的规格
	 *

	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * @return 规格列表
	 */
	List<?> getCheckedSpList(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 获取当前goods的规格项
	 *
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * @return List<Map<String, String>> 每个map对应一条规格项数据
	 */
	List<?> getCurrentSpItems(Map<String, Object> paramMap, String property, String value);

	/**
	 * 获取商品规格项
	 *
	 * @param criteria
	 *            字段条件
	 * @return 规格项
	 */
	List<?> getSpItemList(Map<String, Object> paramMap, Criteria criteria);

	/**
	 * 更新商品属性
	 *
	 * @param attrMap
	 *            属性数据
	 * @return 更新了多少数据
	 */
	int updateGoodsAttrValues(Map<String, Object> paramMap, Map<String, Object> attrMap);

	/**
	 * 根据商品Id查询其商品的单品启用了哪些规格
	 *

	 * @param goodsId
	 *            商品Id
	 */
	List<?> getGoodsSpList(Map<String, Object> paramMap, String goodsId);

	/**
	 * 根据规格id列表查询规格项列表
	 *

	 * @param goodsId
	 *            商品Id
	 * @return 规格项列表
	 */
	List<?> getGoodsSpItemList(Map<String, Object> paramMap, String goodsId);

	/**
	 * 根据标签ID获取使用该标签的商品信息列表
	 *
	 * @param tagId
	 *            标签Id
	 * @param size
	 *            条数
	 * @return
	 */
	List<Goods> getGoodsByTagId(Map<String, Object> paramMap, String catlogId, String tagId, Integer size,Integer platform);

	/**
	 * 加载商品对应的所有分类（L1/L2/L3三级分类）
	 *
	 * @param categoryId
	 *            分类Id
	 *
	 * @return Map<分类Id, 分类名称>
	 */
	List<Map<String, Object>> getGoods4Category(Map<String, Object> paramMap, String categoryId);

	/**
	 * 根据当前商品的分类获取同类的其它品牌
	 *
	 * @param categoryId
	 *            分类Id
	 *
	 * @return 商品品牌列表
	 */
	List<GoodsBrand> getBrandListByGoodsCatId(Map<String, Object> paramMap, String categoryId);

	/**
	 * 获取店铺打了标签(wp_tag下的id)的商品列表 criteria
	 * 必须要有的条件：tagId、isMarketable、shopId、size(取多少条数据)
	 *
	 * @param paramMap
	 *            租户Id
	 * @param selectParamMap
	 *            查询条件
	 */
	List<Goods> getGoodsByTagIdInShop(Map<String, Object> paramMap, Map<String, Object> selectParamMap);

	/**
	 * 给商品打标签
	 *
	 * @param goodsTags
	 *            商品标签
	 */
	int[] saveGoodsTags(Map<String, Object> paramMap, List<Map<String, Object>> goodsTags);

	/**
	 * 移除商品标签
	 *

	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 *
	 * @return 处理了多少项
	 */
	int removeGoodsTags(Map<String, Object> paramMap, List<Long> goodsIds);

	/**
	 * 获取商品头上的标签
	 *
	 * @param goodsId
	 *            商品Id
	 *
	 * @return k：goodsId，v：tagId
	 */
	List<Map<String, Object>> getGoodsTags(String goodsId);

	/**
	 * 根据分类Id查询品牌列表
	 *

	 *            租户Id
	 * @param categoryId
	 *            分类Id
	 */
	List<GoodsBrand> getGoodsBrandByCategory(Map<String, Object> paramMap, String categoryId);

	/**
	 * 根据店铺Id调整商品上/下架
	 *

	 *            租户Id
	 * @param shopId
	 *            店铺Id
	 * @param status
	 *            是否上架. 1：上架。0：下架
	 */
	int marketableGoods(Map<String, Object> paramMap, String shopId, int status);

	/**
	 * 根据ID获取实体对象.
	 *

	 *            租户ID
	 * @param id
	 *            记录ID
	 * @return 实体对象
	 */
	Goods getSeckill(Map<String, Object> paramMap, String id);
	/**
	 * 根据ID获取实体对象.
	 *

	 *            租户ID
	 * @param goodsId
	 *            产品ID
	 * @param detailId
	 *            档期ID
	 * @return 实体对象
	 */
	Goods getSeckillByDetailId(Map<String, Object> paramMap, String goodsId,String detailId);
	/**
	 * 根据ID获取实体对象.
	 *

	 *            租户ID
	 * @param id
	 *            记录ID
	 * @return 实体对象
	 */
	Goods getShipGoods(Map<String, Object> paramMap, String id);

	/**
	 * 非批量更新商品
	 *

	 *            租户Id
	 * @param goods
	 *            商品对象
	 */
	int updateUnBatch(Map<String, Object> paramMap, Goods goods);

	/**
	 * 根据标签获取商品信息,用于首页展示
	 *

	 * @param tagSign
	 * @param size
	 * @return
	 */
	List<Goods> getTagGoods4Index(Map<String, Object> paramMap, String tagSign, Integer size,Integer platform);

	/**
	 * 根据标签获取商品信息,用于首页展示
	 *

	 * @param tagSign
	 * @param size
	 * @return
	 */
	List<Goods> getTagGoods4IndexByID(Map<String, Object> paramMap, String tagSign, Integer size,String id ,Integer platform);

	/**
	 * 根据标签获取商品信息,用于首页展示
	 *

	 * @param sign
	 * @return
	 */
	List<Goods> getPagerBysign(Map<String, Object> paramMap, String sign, PageBounds pageBounds);

	/**
	 * 更新商品销量

	 * @param goodsId 商品ID
	 * @param quantity 商品数量
	 * @return
	 */
	int updateGoodsSalesVolume(Map<String, Object> paramMap, String goodsId, int quantity);

	/**
	 * 根据标签和店铺ID获取商品信息,用于店铺展示

	 * @param shopId
	 * @param tagSign
	 * @param size
	 * @return
	 */
	List<Goods> getTagGoods4Shop(Map<String, Object> paramMap, String shopId,
								 String tagSign, Integer size,Integer platform);
	/**
	 * 获取满足时间的零销售商品
	 *
	 */
	List<Map<String, Object>> getRetailGoodsByTime(Map<String, Object> paramMap,String start,String end);

	/**
	 * 获取商品批发价  阶梯
	 * @param paramMap
	 * @param goodsId
	 * @param num
	 * @param isBatch  是否是批量方式查询，true  批量方式  false  不是批量方式
	 * @return
	 */

	List<B2BGoodsPrice> getGoodsTradePrice(Map<String, Object> paramMap, String goodsId, Integer num, Boolean isBatch);


	/**
	 * 根据租户,商品ID,分类ID信息确定商品同类品牌范围,剔除此商品所对应的产品品牌

	 * @param goodsId				商品ID信息
	 * @param categoryId			分类ID
	 * @return
	 */
	public List<GoodsBrand> queryRelGoodsBrandByGoodsId(Map<String, Object> paramMap, String goodsId, String categoryId) throws Exception;

	/**
	 * 获取商品系统参数(国家;产地;保质期)
	 *
	 * @param id
	 *            商品Id
	 *
	 * @return Map<参数名称,参数值>
	 */
	List<Map<String, Object>> getGoodsSystemparameter(Map<String, Object> paramMap,String id);

	/**
	 * 获取商品的阶梯价
	 *

	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * @return 参数列表
	 */
	List<Map<String, Object>> getGoodsBatchPriceList(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 获取商品的同分类下销量靠前6的数据并查阶梯价
	 *

	 * @param criteria
	 *            字段条件
	 * @return 参数列表
	 */
	List<Goods> getGoodsCatelogCountList(Map<String, Object> paramMap, Criteria criteria);


	/**
	 * 2015111204 dzz
	 * 根据分类顶级节点查询品牌(品牌与品牌分类顶级节点关联)
	 * @param paramMap
	 * @param catRootId
	 * @return
	 */
	public List<GoodsBrand> queryBrandListByRootId(Map<String, Object> paramMap, String catRootId) throws Exception;

	/**
	 * 获取众筹商品
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Goods getZhongchouById(Map<String, Object> paramMap, String id) throws Exception;


	public Goods getZCOrderInfoById(Map<String, Object> paramMap, String id) throws Exception;

	/**
	 * 众筹商品订单
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	List<Order> getZhongchouOrder(Map<String, Object> paramMap, String id) throws Exception;

	/**
	 * 众筹商品订单统计
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	Map<String,Object> getZhongchouOrderCount(Map<String, Object> paramMap, String id) throws Exception;

	/**
	 * BEC获取分页集合对象
	 *
	 * @param paramMap
	 *            租户ID
	 * @param criteria
	 *            查询条件
	 * @param pageBounds
	 *            分页参数
	 * @return 分页对象
	 */
	List<Goods> getPager4BEC(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

	/**
	 * BEC获取集合对象
	 *
	 * @param paramMap
	 *            租户ID
	 * @param criteria
	 *            查询条件
	 * @return
	 */
	List<Goods> getList4BEC(Map<String, Object> paramMap, Criteria criteria);
	/**
	 * 分页获取众筹商品
	 *
	 * @param paramMap
	 *            租户标识,平台标识...
	 * @param criteria
	 *            查询条件
	 * @param pageBounds
	 *            分页参数
	 *
	 * @return 商品列表
	 */
	List<?> getZCGoodsByPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);


	List<?> queryListZhongChouGoods(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

	/**
	 * 获取所有商品
	 * @param paramMap 租户标识,平台标识...
	 * @param criteria 查询条件
	 * @param pageBounds 分页参数
	 * @return
	 * @Author TianYu
	 * @DateTime 2016-1-29 09:51:07
	 * @version 0.1
	 */
	List<Goods> getAllGoods(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

	/**
	 * 根据商品Id与查询条件查找商品
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            字段条件
	 * @return 参数列表
	 */
	Goods findConditionGoods(Map<String, Object> paramMap,Criteria criteria,String id);

	/**
	 * 根据商品ID和收货地址查询商品运费系数
	 *
	 * @param paramMap
	 *            租户标识

	 * @return 参数列表
	 *
	 * yuech  2016-02-26 12:25
	 */
	Modulus getModulus(Map<String, Object> paramMap,Criteria criteria);



	/**
	 * 根据商品条形码查商品
	 *
	 * @param paramMap
	 *            租户ID
	 * @param value
	 *            条形码
	 * @return
	 */
	List<Goods> findBarcodeGoods(Map<String, Object> paramMap,Object value);

	/**
	 * 获取促销商品信息
	 */
	List<Goods> getCuxiaoGoods(Map<String, Object> paramMap,PageBounds pageBounds);

	/**
	 * EC 分页获取首页标签商品
	 * @param paramMap
	 * @param criteria
	 * @param pageBounds
     * @return
     */
	List getPagerByTag4EC(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

	/**
	 * BEC分页获取首页标签商品
	 * @param paramMap
	 * @param criteria
	 * @param pageBounds
     * @return
     */
	List getPagerByTag4BEC(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);

	/**
	 * BEC分页获取标签商品
	 * @param paramMap
	 * @param criteria
	 * @param pageBounds
	 * @return
	 */
	List getPagerByTag4BEC2(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);


	/**
	 * 20160511 dzz
	 * BEC获取促销返利商品信息
	 * @param paramMap
	 * @param criteria
	 * @param pageBounds
	 * @return
	 */
	List queryListPromotionOfHasRebate(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds);


	/**
	 * 20160617 dzz
	 * 验证当前众筹商品是否存在订单信息
	 * @param paramMap
	 * @param criteria
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Object validateZcOrderNan(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

	/**
	 * 20160715 dzz
	 * get the Goods Infos By Id's list
	 * @param paramMap
	 * @param ids	the goods's Id list
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> getGoodsInfoById(Map<String, Object> paramMap, List<String> ids) throws Exception;


	List<Map<String,Object>> getGoodsPager4JULI4SJ(Map<String, Object> paramMap, Criteria criteria, Pager pager)
			throws Exception;
}
