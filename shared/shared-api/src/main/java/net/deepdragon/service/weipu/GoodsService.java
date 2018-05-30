package net.deepdragon.service.weipu;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.entity.weipu.*;

import java.util.List;
import java.util.Map;

/**
 * 商品信息表数据接口
 */
public interface GoodsService extends BaseService<Goods, String> {
	/**
	 * 最直接的分页获取数据

	 * @param criteria
	 *            条件对象
	 * @param pager
	 *            分页对象
	 *
	 * @return 分页对象
	 */
	Pager getListByPager(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

	/**
	 * 保存商品相关的一系列东西
	 *            租户Id
	 * @param goodsMap
	 *            商品相关数据
	 */
	boolean saveGoods(Map<String, Object> paramMap, Map<String, Object> goodsMap, List<GoodsImages> list) throws Exception;

	/**
	 * 保存商品相关的一系列东西(-----扩展)
	 *
	 * @param goodsMap 商品相关数据
	 */
	public Product saveGoodsEx(Map<String, Object> paramMap, Map<String, Object> goodsMap, List<GoodsImages> list, String carTypeId) throws Exception;

	/**
	 * 更新商品相关的一系列东西
	 *
	 *            租户Id
	 * @param goodsMap
	 *            商品相关数据
	 */
	boolean updateGoods(Map<String, Object> paramMap, Map<String, Object> goodsMap, List<String> deleteallId, List<GoodsImages> updatentity, List<GoodsImages> saveentity) throws Exception;

	/**
	 * 删除商品和其相关的数据
	 *
	 *            租户标识
	 * @param ids
	 *            商品Ids，用逗号分隔
	 */
	boolean deleteGoods(Map<String, Object> paramMap, List<String> ids) throws Exception;

	/**
	 * 获取商品参数列表信息
	 *
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 *
	 * @return 参数列表
	 */
	List<?> getGoodsParamsList(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 获取商品属性列表字段信息列表
	 *
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 *
	 * @return 字段信息列表
	 */
	List<String> getGoodsAttrs(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 获取商品选中的规格
	 *
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 *
	 * @return 规格列表
	 */
	List<?> getCheckedSpList(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 获取当前goods的规格项
	 *
	 *            租户标识
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
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * @return 规格项
	 */
	@Deprecated
	List<?> getSpItemList(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 根据goodsId获取当前单品的规格和规格项信息
	 *
	 *            租户标识
	 * @param goodsId
	 *            商品Id
	 *
	 * @return
	 */
	Map<String, List<Map<String, Object>>> getGoodsSpInfo(Map<String, Object> paramMap, String goodsId);

	/**
	 *
	 *
	 * 根据标签ID获取使用该标签的商品信息列表
	 *
	 *            租户Id
	 * @param tagId
	 *            标签Id
	 * @param catlogId
	 *            标签Id
	 * @param size
	 *            条数
	 * @return
	 */
	List<Goods> getGoodsByTagId(Map<String, Object> paramMap, String catlogId, String tagId, Integer size,Integer platform) throws Exception;

	/**
	 * 获取店铺打了标签(wp_tag下的id)的商品列表 criteria
	 * 必须要有的条件：tagId、isMarketable、shopId、size(取多少条数据)
	 *

	 *            租户Id
	 * @param paramMap
	 *            查询条件
	 */
	List<Goods> getGoodsByTagIdInShop(Map<String, Object> paramMap, Map<String, Object> selectParamMap) throws Exception;

	/**
	 * 加载商品对应的所有分类（L1/L2/L3三级分类）
	 *

	 *            租户Id
	 * @param categoryId
	 *            分类Id
	 *
	 * @return Map<分类Id, 分类名称>
	 */
	List<Map<String, Object>> getGoods4Category(Map<String, Object> paramMap, String categoryId);

	Goods get(Map<String, Object> paramMap, String id) throws Exception;

	/**
	 * 获取众筹商品详情
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	Goods getZhongchouById(Map<String, Object> paramMap, String id) throws Exception;

	/**
	 * 20160519 dzz
	 * 根据众筹商品Id信息获取商品信息
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	Goods getZCOrderInfoById(Map<String, Object> paramMap, String id) throws Exception;

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
	 * 根据当前商品的分类获取同类的其它品牌
	 *
	 *            租户Id
	 * @param categoryId
	 *            分类Id
	 *
	 * @return 商品品牌列表
	 */
	List<GoodsBrand> getBrandListByGoodsCatId(Map<String, Object> paramMap, String categoryId);

	/**
	 * 商品上/下架
	 *
	 *            租户Id
	 * @param status
	 *            商品是否上架 1:上架，0:下架
	 * @param goodsIds
	 *            用逗号分隔的商品Ids
	 */
	int marketableOrDisable(Map<String, Object> paramMap, int status, List<String> goodsIds);

	/**
	 * 获取商品头上的标签
	 *
	 *            租户Id
	 * @param goodsId
	 *            商品Id
	 *
	 * @return k：goodsId，v：tagId
	 */
	List<Map<String, Object>> getGoodsTags(Map<String, Object> paramMap, String goodsId);

	/**
	 * 根据分类Id查询品牌列表
	 *
	 *            租户Id
	 * @param categoryId
	 *            分类Id
	 */
	List<GoodsBrand> getGoodsBrandByCategory(Map<String, Object> paramMap, String categoryId);

	/**
	 * 根据主键获取唯一的实体对象.
	 *
	 *            租户标识
	 * @param id
	 *            主键
	 * @return
	 * @throws Exception
	 */
	Goods getSeckill(Map<String, Object> paramMap, String id) throws Exception;
	/**
	 * 根据主键获取唯一的实体对象.
	 *
	 *            租户标识
	 * @param goodsId
	 *            主键
	 * @param detailId
	 *     		档期Id
	 * @return
	 * @throws Exception
	 */
	Goods getSeckillByDetailId(Map<String, Object> paramMap, String goodsId,
							   String detailId) throws Exception;
	/**
	 * 根据主键获取唯一的实体对象.
	 *

	 *            租户标识
	 * @param id
	 *            主键
	 * @return
	 * @throws Exception
	 */
	Goods getShipGoods(Map<String, Object> paramMap, String id) throws Exception;

	/**
	 * modify by hks 2015年11月10日17:33:48  添加参数platform（所属平台）
	 *
	 * 根据标签获取商品信息,用于首页展示

	 * @param tagSign
	 * @param size
	 * @return
	 * @throws Exception
	 */
	List<Goods> getTagGoods4Index(Map<String, Object> paramMap, String tagSign, Integer size,Integer platform) throws Exception;
	/**
	 *  modify by hks 2015年11月10日17:33:48  添加参数platform（所属平台）
	 *
	 * 根据标签获取商品信息,用于首页展示

	 * @param tagSign
	 * @param size
	 * @return
	 * @throws Exception
	 */
	List<Goods> getTagGoods4IndexbyID(Map<String, Object> paramMap, String tagSign, Integer size,String id,Integer platform) throws Exception;
	/**
	 * 获取分页数据
	 *
	 *            租户标识
	 * @param sign
	 *            标签ID
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager getPagerBysign(Map<String, Object> paramMap, String sign, Pager pager)
			throws Exception;

	/**
	 * 更新销量
	 * @param goodsId
	 * @param quantity
	 * @return
	 */
	int updateGoodsSalesVolume(Map<String, Object> paramMap, String goodsId, int quantity);

	/**
	 * 添加所属平台参数  hks 2015-11-10 18:09:58 modify
	 *
	 * 根据标签和店铺ID获取商品信息,用于店铺展示
	 *
	 * @param shopId
	 * @param tagSign
	 * @param size
	 * @return
	 * @throws Exception
	 */
	List<Goods> getTagGoods4Shop(Map<String, Object> paramMap, String shopId, String tagSign, Integer size,Integer platform)
			throws Exception;
	/**
	 * 零销售商品分析
	 */
	List<Map<String, Object>> getRetailGoodsByTime(Map<String, Object> paramMap, String start, String end) throws Exception;
	/**
	 * 保存商品相关的一系列东西(只为爱家用)

	 * @param goodsMap 商品相关数据
	 */
	public List<Goods> saveGoods4aijia(Map<String, Object> paramMap, Map<String, Object> goodsMap, List<GoodsImages> list) throws Exception;


	/**
	 * 根据商品ID查询此与此商品同类型的其他品牌分类;除却此商品

	 * @param goodsId				商品ID信息
	 * @return
	 */
	public List<GoodsBrand> queryRelGoodsBrandByGoodsId(Map<String, Object> paramMap, String goodsId) throws Exception;

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
	 * @return 规格项
	 */
	List<Map<String, Object>> getGoodsBatchPriceList(Map<String, Object> paramMap, String property, Object value);

	/**
	 * 获取商品的同分类下销量靠前6的数据并查阶梯价
	 *
	 * @param paramMap
	 *            租户标识
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
	 * BEC获取分页数据
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            查询条件
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager getPager4BEC(Map<String, Object> paramMap, Criteria criteria, Pager pager)
			throws Exception;

	/**
	 * BEC获取列表数据
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            查询条件
	 * @return
	 * @throws Exception
	 */
	List<Goods> getList4BEC(Map<String, Object> paramMap, Criteria criteria)
			throws Exception;
	/**
	 * 获取众筹商品
	 *
	 * @param paramMap
	 *            租户标识,平台标识...
	 * @param criteria
	 *            字段条件
	 * @param pager
	 *
	 * @return 分页对象
	 */
	Pager getZCGoodsList(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;


	Pager queryListZhongChouGoods(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

	/**
	 * 获取所有商品
	 * @param paramMap
	 * @param criteria
	 * @param pager
	 * @return
	 * @Author TianYu
	 * @DateTime 2016-1-29 09:51:07
	 * @version 0.1
	 */
	Pager getAllGoods(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

	/**
	 * 根据商品Id与查询条件查找商品
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            字段条件
	 * @return 参数列表
	 */
	Goods findConditionGoods(Map<String, Object> paramMap,Criteria criteria,String Id) throws Exception;

	/**
	 * 根据商品ID和收货地址查询商品运费系数
	 *
	 * @param paramMap
	 *            租户标识
	 *            商品ID
	 * @return 参数列表
	 *
	 * yuech  2016-02-26 9:53
	 */
	Modulus getModulus(Map<String, Object> paramMap,Criteria criteria) throws Exception;


	/**
	 * 根据商品条形码查商品
	 * @param paramMap
	 *            租户标识
	 * @param value
	 *            条形码
	 * @return
	 * @throws Exception
	 */
	List<Goods> findBarcodeGoods(Map<String, Object> paramMap,Object value) throws Exception;

	/**
	 * 获取促销商品信息
	 * @return
     */
	Pager getCuxiaoGoods(Map<String, Object> paramMap,Pager pager);


	/**
	 * EC全文搜索获取分页数据
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            查询条件
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager getSearchPager4EC(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;


	/**
	 * BEC全文搜索获取分页数据
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            查询条件
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager getSearchPager4BEC(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

	/**
	 * EC分页获取首页标签商品
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            查询条件
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager getPagerByTag4EC(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

	/**
	 * BEC分页获取首页标签商品
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            查询条件
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager getPagerByTag4BEC(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

	/**
	 * BEC分页获取标签商品
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            查询条件
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager getPagerByTag4BEC2(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;


	/**
	 * 20160511 dzz
	 * @param paramMap		租户标识
	 * @param criteria		查询条件
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	Pager queryListPromotionOfHasRebate(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception;

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

	/**
	 * 更具关键字长店铺里面的商品
	 * @param paramMap
	 * @param criteria
	 * @param pager
	 * @return
     * @throws Exception
     */
	Pager getGoodsPagerJl4SJ(Map<String, Object> paramMap, Criteria criteria, Pager pager)
			throws Exception;

}

