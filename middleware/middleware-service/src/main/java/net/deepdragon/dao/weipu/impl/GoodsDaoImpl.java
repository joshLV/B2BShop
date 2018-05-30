package net.deepdragon.dao.weipu.impl;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GoodsDao;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.util.Constant;
import net.deepdragon.util.ReflectUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品信息表数据接口实现
 */
@Repository(Weipu.SIGN + "GoodsDaoImpl")
public class GoodsDaoImpl extends BaseDaoImpl<Goods, String> implements GoodsDao {
	
	@Override
	public List<Goods> getPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
//		criteria.add(Restrictions.group("a.id"));
//		return super.getPager(paramMap, criteria, pageBounds);
		String defaultStatement = Goods.class.getName() + "Mapper.getPager";

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

	@Override
	public List<Goods> getList(Map<String, Object> paramMap, Criteria criteria) {
		criteria.add(Restrictions.group("a.id"));
		return super.getList(paramMap, criteria);
	}

	@Override
	public List<Goods> getPager4BEC(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
//		criteria.add(Restrictions.group("o.id"));
		String defaultStatement = Goods.class.getName() + "Mapper.getPager4BEC";

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate()
				.selectList(defaultStatement, criteria, pageBounds);
	}

	@Override
	public List<Goods> getList4BEC(Map<String, Object> paramMap, Criteria criteria) {
		criteria.add(Restrictions.group("o.id"));
		String defaultStatement = Goods.class.getName() + "Mapper.getList4BEC";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}

	/**
	 * 最直接的分页获取数据
	 * 
	 * @param paramMap
	 *            租户ID
	 * @param criteria
	 *            查询条件
	 * @param pageBounds
	 *            分页参数
	 * 
	 * @return 分页对象
	 */
	public List<?> getListByPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = Goods.class.getName() + "Mapper.getListByPager";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

	/**
	 * 以批量的执行方式获取Goods对象
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param id
	 *            商品Id
	 * 
	 * @return 商品对象
	 */
	public Goods getGoodsByBatchType(Map<String, Object> paramMap, String id) {
		String defaultStatement = Goods.class.getName() + "Mapper.get";

		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
		parameter.put("id", id);

		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectOne(defaultStatement, parameter);
	}

	@Override
	public Goods save(Map<String, Object> paramMap, Goods entity) {
		String defaultStatement = Goods.class.getName() + "Mapper.save";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, "tenantId");
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, "tenantId", paramMap.get(Constant.TENANTID_KEY));
		}
		this.sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).insert(defaultStatement, entity);

		return entity;
	}

	@Override
	public int update(Map<String, Object> paramMap, Goods entity) {
		String defaultStatement = Goods.class.getName() + "Mapper.update";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, "tenantId");
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, "tenantId", paramMap.get(Constant.TENANTID_KEY));
		}

		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).update(defaultStatement, entity);
	}

	/**
	 * 保存商品相关联的参数(批量保存)
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param pMapList
	 *            商品参数对象
	 */
	public int[] saveGoodsParamDetail(Map<String, Object> paramMap, List<Map<String, Object>> pMapList) {
		String defaultStatement = Goods.class.getName() + "Mapper.saveGoodsParamDetail";
		return saveEntities(paramMap, pMapList, defaultStatement);
	}

	/**
	 * 保存商品相关联的属性
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param attrMap
	 *            商品属性列表
	 */
	public int[] saveGoodsAttrValues(Map<String, Object> paramMap, Map<String, Object> attrMap) {
		String defaultStatement = Goods.class.getName() + "Mapper.saveGoodsAttrValues";
		List<Map<String, Object>> attrMapList = new ArrayList<Map<String, Object>>();
		attrMapList.add(attrMap);
		return saveEntities(paramMap, attrMapList, defaultStatement);
	}

	/**
	 * 保存商品相关联的规格
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param spDataList
	 *            商品规格列表(选中的,即:checked的)
	 */
	public int[] saveGoodsSpList(Map<String, Object> paramMap, List<Map<String, Object>> spDataList) {
		String defaultStatement = Goods.class.getName() + "Mapper.saveGoodsSpList";
		return saveEntities(paramMap, spDataList, defaultStatement);
	}

	/**
	 * 保存商品规格项
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param spMapList
	 *            商品参数列表
	 */
	public int[] saveGoodsSpDetail(Map<String, Object> paramMap, List<Map<String, Object>> spMapList) {
		String defaultStatement = Goods.class.getName() + "Mapper.saveGoodsSpDetail";
		return saveEntities(paramMap, spMapList, defaultStatement);
	}

	/**
	 * 根据goodsId删除商品参数项
	 * 
	 * @param paramMap
	 *            用户Id
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * 
	 * @return 处理了多少项
	 */
	public int deleteParams(Map<String, Object> paramMap, List<Long> goodsIds) {
		String defaultStatement = Goods.class.getName() + "Mapper.deleteParams";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, goodsIds);
	}

	/**
	 * 根据goodsId删除商品属性项
	 * 
	 * @param paramMap
	 *            用户Id
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * 
	 * @return 处理了多少项
	 */
	public int deleteAttrs(Map<String, Object> paramMap, List<Long> goodsIds) {
		String defaultStatement = Goods.class.getName() + "Mapper.deleteAttrs";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, goodsIds);
	}

	/**
	 * 根据goodsId删除商品规格
	 * 
	 * @param paramMap
	 *            用户Id
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * 
	 * @return 处理了多少项
	 */
	public int deleteSpecs(Map<String, Object> paramMap, List<Long> goodsIds) {
		String defaultStatement = Goods.class.getName() + "Mapper.deleteSpecs";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, goodsIds);
	}

	/**
	 * 根据goodsId删除商品规格项
	 * 
	 * @param paramMap
	 *            用户Id
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * 
	 * @return 处理了多少项
	 */
	public int deleteSpItems(Map<String, Object> paramMap, List<Long> goodsIds) {
		String defaultStatement = Goods.class.getName() + "Mapper.deleteSpItems";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, goodsIds);
	}

	/**
	 * 根据goodsId删除商品图片
	 * 
	 * @param paramMap
	 *            用户Id
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * 
	 * @return 处理了多少项
	 */
	@Override
	public int deleteImages(Map<String, Object> paramMap, List<Long> goodsIds) {
		String defaultStatement = Goods.class.getName() + "Mapper.deleteImages";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, goodsIds);
	}

	/**
	 * 获取商品参数列表信息
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * 
	 * @return 参数列表
	 */
	public List<?> getGoodsParamsList(Map<String, Object> paramMap, String property, Object value) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsParamsList";
		return getList(defaultStatement, property, value);
	}

	/**
	 * 获取商品属性列表信息
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * 
	 * @return 属性列表
	 */
	public List<?> getGoodsAttrsList(Map<String, Object> paramMap, String property, Object value) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsAttrsList";
		return getList(defaultStatement, property, value);
	}

    /**
     * 获取商品属性列表信息(以批量的方式)
     *
     * @param paramMap 租户标识
     * @param property 字段名称
     * @param value    字段值
     *
     * @return 属性列表
     */
    public List getGoodsAttrsListBatch(Map<String, Object> paramMap, String property, String value) {
        String defaultStatement = Goods.class.getName() + "Mapper.getGoodsAttrsList";
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.eq(property, value));

        return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectList(defaultStatement, criteria);
    }

    /**
	 * 获取商品选中的规格
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * 
	 * @return 规格列表
	 */
	public List<?> getCheckedSpList(Map<String, Object> paramMap, String property, Object value) {
		String defaultStatement = Goods.class.getName() + "Mapper.getCheckedSpList";
		return getList(defaultStatement, property, value);
	}

	/**
	 * 获取当前goods的规格项
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * 
	 * @return List<Map<String, String>> 每个map对应一条规格项数据
	 */
	public List<?> getCurrentSpItems(Map<String, Object> paramMap, String property, String value) {
		String defaultStatement = Goods.class.getName() + "Mapper.getCurrentSpItems";
		return getList(defaultStatement, property, value);
	}

	/**
	 * 获取商品规格项
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            字段条件
	 * 
	 * @return 规格项
	 */
	public List<?> getSpItemList(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = Goods.class.getName() + "Mapper.getSpItemList";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
	}

	/**
	 * 更新商品属性
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param attrMap
	 *            属性数据
	 * 
	 * @return 更新了多少数据
	 */
	public int updateGoodsAttrValues(Map<String, Object> paramMap, Map<String, Object> attrMap) {
		String defaultStatement = Goods.class.getName() + "Mapper.updateGoodsAttrValues";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).update(defaultStatement, attrMap);
	}

	/**
	 * 根据商品Id查询其商品的单品启用了哪些规格
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param goodsId
	 *            商品Id
	 */
	public List<?> getGoodsSpList(Map<String, Object> paramMap, String goodsId) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsSpList";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("id", goodsId);
		parameter.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	/**
	 * 根据规格id列表查询规格项列表
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param goodsId
	 *            商品Id
	 * 
	 * @return 规格项列表
	 */
	public List<?> getGoodsSpItemList(Map<String, Object> paramMap, String goodsId) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsSpItemList";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("goodsId", goodsId);
		parameter.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	/**
	 * 加载商品对应的所有分类（L1/L2/L3三级分类）
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param categoryId
	 *            分类Id
	 * 
	 * @return Map<分类Id, 分类名称>
	 */
	public List<Map<String, Object>> getGoods4Category(Map<String, Object> paramMap, String categoryId) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoods4Category";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
		parameter.put("id", categoryId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	/**
	 * 根据当前商品的分类获取同类的其它品牌
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param categoryId
	 *            分类Id
	 * 
	 * @return 商品品牌列表
	 */
	public List<GoodsBrand> getBrandListByGoodsCatId(Map<String, Object> paramMap, String categoryId) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsRefBrand";
//		Map<String, Object> parameter = new HashMap<String, Object>();
//		paramMap.put("tenantId", tenantId);
		paramMap.put("categoryId", categoryId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

	/**
	 * 批量保存实体
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param entity
	 *            实体类
	 * @param defaultStatement
	 *            mybatis 映射文件里的哪个sql语句
	 * 
	 * @return 保存了多少条数据
	 */
	private int[] saveEntities(Map<String, Object> paramMap, List<?> entity, String defaultStatement) {
		Assert.notEmpty(entity, "parameter 'entity' can't be null or empty!");
		List<Integer> batchResultList = new ArrayList<Integer>();
		SqlSession sqlSession = sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH);

		try {
			for (int i = 0; i < entity.size(); i++) {
				// 实体类存在tenantId字段
				Field field = ReflectUtils.getFieldByFieldName(entity.get(i), "tenantId");
				if (field != null) {
					ReflectUtils.setValueByFieldName(entity.get(i), "tenantId", paramMap.get(Constant.TENANTID_KEY));
				}

				sqlSession.insert(defaultStatement, entity.get(i));
				if ((i + 1) % DEFAULT_FLUSH_BATCH_SIZE == 0) {
					List<BatchResult> currentBatchResultList = sqlSession.flushStatements();
					extractBatchResult(batchResultList, currentBatchResultList);
				}
			}
		} finally {
			List<BatchResult> currentBatchResultList = sqlSession.flushStatements();
			extractBatchResult(batchResultList, currentBatchResultList);
		}

		return ArrayUtils.toPrimitive(batchResultList.toArray(new Integer[]{}));
	}

	/**
	 * 获取某张表的列表信息(根据字段条件)
	 * 
	 * @param statement
	 *            对应的mybatis的sql语句
	 * @param property
	 *            字段名
	 * @param value
	 *            字段值
	 */
	private List<?> getList(String statement, String property, Object value) {
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq(property, value));

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(statement, criteria);
	}

	/**
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param tagId
	 *            标签Id
	 * @param size
	 *            条数
	 * @return 已上架的商品列表
	 */
	public List<Goods> getGoodsByTagId(Map<String, Object> paramMap, String catlogId, String tagId, Integer size,Integer platform) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsByTagId";
//		Map<String, Object> parameter = new HashMap<String, Object>();
//		paramMap.put("tenantId", tenantId);
		paramMap.put("tagId", tagId);
		paramMap.put("size", size);
		paramMap.put("categoryId", catlogId);
		paramMap.put("isMarketable", 1);
		paramMap.put("platform", platform);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

	/**
	 * 获取店铺打了标签(wp_tag下的id)的商品列表 criteria
	 * 必须要有的条件：tagId、isMarketable、shopId、size(取多少条数据)
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param selectParamMap
	 *            查询条件
	 */
	public List<Goods> getGoodsByTagIdInShop(Map<String, Object> paramMap, Map<String, Object> selectParamMap) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsByTagIdInShop";
//		paramMap.put("tenantId", tenantId);
		selectParamMap.putAll(paramMap);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, selectParamMap);
	}

	/**
	 * 给商品打标签
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param goodsTags
	 *            商品标签
	 */
	public int[] saveGoodsTags(Map<String, Object> paramMap, List<Map<String, Object>> goodsTags) {
		String defaultStatement = Goods.class.getName() + "Mapper.saveGoodsTags";
		return saveEntities(paramMap, goodsTags, defaultStatement);
	}

	/**
	 * 移除商品标签
	 * 
	 * @param paramMap
	 *            用户Id
	 * @param goodsIds
	 *            商品Id,用逗号分隔
	 * 
	 * @return 处理了多少项
	 */
	public int removeGoodsTags(Map<String, Object> paramMap, List<Long> goodsIds) {
		String defaultStatement = Goods.class.getName() + "Mapper.removeGoodsTags";
		return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).delete(defaultStatement, goodsIds);
	}

	/**
	 * 获取商品头上的标签
	 * 
	 * @param goodsId
	 *            商品Id
	 * 
	 * @return k：goodsId，v：tagId
	 */
	public List<Map<String, Object>> getGoodsTags(String goodsId) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsTags";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, goodsId);
	}

	/**
	 * 根据分类Id查询品牌列表
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param categoryId
	 *            分类Id
	 */
	public List<GoodsBrand> getGoodsBrandByCategory(Map<String, Object> paramMap, String categoryId) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsBrandByCategory";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
		parameter.put("categoryId", categoryId);
		parameter.put("enabled", 1);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	/**
	 * 根据店铺Id调整商品上/下架
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param shopId
	 *            店铺Id
	 * @param status
	 *            是否上架. 1：上架。0：下架
	 */
	public int marketableGoods(Map<String, Object> paramMap, String shopId, int status) {
		String defaultStatement = Goods.class.getName() + "Mapper.marketableGoods";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",  paramMap.get(Constant.TENANTID_KEY));
		parameter.put("shopId", shopId);
		parameter.put("isMarketable", status);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().update(defaultStatement, parameter);
	}

	@Override
	public Goods getSeckill(Map<String, Object> paramMap, String id) {
		String defaultStatement = Goods.class.getName() + "Mapper.getSeckill";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",  paramMap.get(Constant.TENANTID_KEY));
		parameter.put("id", id);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, parameter);
	}

	@Override
	public Goods getShipGoods(Map<String, Object> paramMap, String id) {
		String defaultStatement = Goods.class.getName() + "Mapper.getShipGoods";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",  paramMap.get(Constant.TENANTID_KEY));
		parameter.put("id", id);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, parameter);
	}

	/**
	 * 非批量更新商品
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param entity
	 *            商品对象
	 */
	public int updateUnBatch(Map<String, Object> paramMap, Goods entity) {
		String defaultStatement = Goods.class.getName() + "Mapper.update";
		// 实体类存在tenantId字段
		Field field = ReflectUtils.getFieldByFieldName(entity, "tenantId");
		if (field != null) {
			ReflectUtils.setValueByFieldName(entity, "tenantId",  paramMap.get(Constant.TENANTID_KEY));
		}

		return sqlSessionTemplateFactory.getSqlSessionTemplate().update(defaultStatement, entity);
	}

	@Override
	public List<Goods> getTagGoods4Index(Map<String, Object> paramMap, String tagSign, Integer size,Integer platform) {
		String defaultStatement = Goods.class.getName() + "Mapper.getTagGoods4Index";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",  paramMap.get(Constant.TENANTID_KEY));
		parameter.put("tagSign", tagSign);
		parameter.put("size", size);
		parameter.put("platform", platform);
		parameter.put("tagPlatform", paramMap.get(Constant.PLATFORM_KEY));
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}
	@Override
	public List<Goods> getTagGoods4IndexByID(Map<String, Object> paramMap, String tagSign, Integer size,String id,Integer platform) {
		String defaultStatement = Goods.class.getName() + "Mapper.getTagGoods4IndexByID";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",  paramMap.get(Constant.TENANTID_KEY));
		parameter.put("tagSign", tagSign);
		parameter.put("size", size);
		parameter.put("categoryPath", id+",");
		parameter.put("platform", platform);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public List<Goods> getPagerBysign(Map<String, Object> paramMap, String sign, PageBounds pageBounds) {
		String defaultStatement = Goods.class.getName() + "Mapper.getPagerBysign";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("sign", sign);
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter, pageBounds);
	}

	@Override
	public int updateGoodsSalesVolume(Map<String, Object> paramMap, String goodsId, int quantity) {
		String defaultStatement = Goods.class.getName() + "Mapper.updateGoodsSalesVolume";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("goodsId", goodsId);
		parameter.put("quantity", quantity);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().update(defaultStatement, parameter);
	}

	@Override
	public List<Goods> getTagGoods4Shop(Map<String, Object> paramMap, String shopId,
			String tagSign, Integer size,Integer platform) {
		String defaultStatement = Goods.class.getName() + "Mapper.getTagGoods4Shop";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",  paramMap.get(Constant.TENANTID_KEY));
		parameter.put("shopId", shopId);
		parameter.put("tagSign", tagSign);
		parameter.put("size", size);
		parameter.put("platform", platform);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public Goods getSeckillByDetailId(Map<String, Object> paramMap, String goodsId,
			String detailId) {
		String defaultStatement = Goods.class.getName() + "Mapper.getSeckillByDetailId";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",  paramMap.get(Constant.TENANTID_KEY));
		parameter.put("goodsId", goodsId);
		parameter.put("detailId", detailId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, parameter);
	}

	@Override
	public List<Map<String, Object>> getRetailGoodsByTime(Map<String, Object> paramMap,
			String start, String end) {
		String defaultStatement = Goods.class.getName() + "Mapper.getRetailGoodsByTime";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("start", start);
		parameter.put("end", end);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	@Override
	public List<B2BGoodsPrice> getGoodsTradePrice(Map<String, Object> paramMap, String goodsId, Integer num, Boolean isBatch) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsTradePrice";

		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("goodsId", goodsId);
		parameter.put("quantity", num);
		if(isBatch){
			return sqlSessionTemplateFactory.getSqlSessionTemplate(ExecutorType.BATCH).selectList(defaultStatement, parameter);
		}else{

			return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
		}

	}



	/**
	 * 根据租户,商品ID,分类ID信息确定商品同类品牌范围,剔除此商品所对应的产品品牌
	 * @param paramMap			租户ID
	 * @param goodsId				商品ID信息
	 * @param categoryId			分类ID
	 * @return
	 */
	public List<GoodsBrand> queryRelGoodsBrandByGoodsId(Map<String, Object> paramMap, String goodsId, String categoryId) throws Exception {
		String defaultStatement = Goods.class.getName() + "Mapper.queryRelGoodsBrandByGoodsId";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",  paramMap.get(Constant.TENANTID_KEY));
		parameter.put("goodsId", goodsId);
		parameter.put("categoryId", categoryId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	/**
	 * 获取商品系统参数(国家;产地;保质期)
	 *
	 * @param id
	 *            商品Id
	 *
	 * @return k：goodsId，v：tagId
	 */
	public List<Map<String, Object>> getGoodsSystemparameter(Map<String, Object> paramMap,String id) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsSystemparameter";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, id);
	}

	/**
	 * 获取商品的阶梯价
	 *
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 *
	 * @return 参数列表
	 */
	public List<Map<String, Object>> getGoodsBatchPriceList(Map<String, Object> paramMap, String property, Object value) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsBatchPriceList";
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq(property, value));
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
	}

	/**
	 * 获取商品的同分类下销量靠前6的数据并查阶梯价
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            字段条件
	 *
	 * @return 参数列表
	 */
	public List<Goods> getGoodsCatelogCountList(Map<String, Object> paramMap, Criteria criteria) {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoodsCatelogCountList";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, criteria);
	}


	/**
	 * 2015111204 dzz
	 * 根据分类顶级节点查询品牌(品牌与品牌分类顶级节点关联)
	 * @param paramMap
	 * @param catRootId
	 * @return
	 */
	public List<GoodsBrand> queryBrandListByRootId(Map<String, Object> paramMap, String catRootId) throws Exception {
		String defaultStatement = Goods.class.getName() + "Mapper.queryBrandListByRootId";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId",  paramMap.get(Constant.TENANTID_KEY));
		parameter.put("categoryId", catRootId);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}
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
	public List<?> getZCGoodsByPager(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds){
		String defaultStatement = Goods.class.getName() + "Mapper.getZCGoodsByPager";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}


	public List<?> queryListZhongChouGoods(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds){
		String defaultStatement = Goods.class.getName() + "Mapper.queryListZhongChouGoods";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}
	/**
	 * 获取众筹商品
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Goods getZhongchouById(Map<String, Object> paramMap, String id) throws Exception {
		String defaultStatement = Goods.class.getName() + "Mapper.getZhongchouById";

		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
		parameter.put("id", id);
		parameter.put("memberId", paramMap.get("memberId"));
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, parameter);
	}

	public Goods getZCOrderInfoById(Map<String, Object> paramMap, String id) throws Exception {
		String defaultStatement = Goods.class.getName() + "Mapper.getZCOrderInfoById";

		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
		parameter.put("id", id);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, parameter);
	}

	/**
	 * 众筹商品订单
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<Order> getZhongchouOrder(Map<String, Object> paramMap, String id) throws Exception {
		String defaultStatement = Goods.class.getName() + "Mapper.getZhongchouOrder";

		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
		parameter.put("id", id);
		if(paramMap.get("size")!=null){
			parameter.put("size", paramMap.get("size"));
		}else{
			parameter.put("size", 10000000);
		}
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, parameter);
	}

	/**
	 * 众筹商品订单统计
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getZhongchouOrderCount(Map<String, Object> paramMap, String id) throws Exception {
		String defaultStatement = Goods.class.getName() + "Mapper.getZhongchouOrderCount";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("tenantId", paramMap.get(Constant.TENANTID_KEY));
		parameter.put("id", id);
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, parameter);
	}

	/**
	 * 获取所有商品
	 * @param paramMap
	 * @param criteria
	 * @return
	 * @Author TianYu
	 * @DateTime 2016-1-29 09:51:07
	 * @version 0.1
	 */
	public List<Goods> getAllGoods(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = Goods.class.getName() + "Mapper.getAllGoods";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

	/**
	 * 根据商品Id与查询条件查找商品
	 *
	 * @param paramMap
	 *            租户标识
	 * @param criteria
	 *            字段条件
	 *
	 * @return 参数列表
	 */
	public Goods findConditionGoods(Map<String, Object> paramMap, Criteria criteria,String id) {
		String defaultStatement = Goods.class.getName() + "Mapper.findConditionGoods";
		criteria.add(Restrictions.eq("id", id));
		criteria.add(Restrictions.eq(Constant.TENANTID_KEY, paramMap.get(Constant.TENANTID_KEY)));
		if ("1".equals(paramMap.get(Constant.PLATFORM_KEY).toString())) {
			criteria.add(Restrictions.ge(Constant.PLATFORM_KEY, 2));
		}else{
			criteria.add(Restrictions.le(Constant.PLATFORM_KEY, 2));
		}

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
				defaultStatement, criteria);
	}
	/**
	 * 根据商品ID和收货地址查询商品运费系数
	 *
	 * author yuech
	 *
	 * time 2016-02-26 12:44
	 */
	public Modulus getModulus(Map<String, Object> paramMap,Criteria criteria) {
		String defaultStatement = Goods.class.getName() + "Mapper.getModulus";
		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(
				defaultStatement, criteria);
	}

	/**
	 * 根据商品Id与查询条件查找商品
	 *
	 * @param paramMap
	 *            租户标识
	 *
	 * @return 参数列表
	 */
	public List<Goods> findBarcodeGoods(Map<String,Object> paramMap, Object value) {

		String defaultStatement = Goods.class.getName() + "Mapper.findBarcodeGoods";

		paramMap.put("value", value);

		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(
				defaultStatement, paramMap);
	}

	@Override
	public List<Goods> getCuxiaoGoods(Map<String, Object> paramMap,PageBounds pageBounds) {
		String defaultStatement = Goods.class.getName() + "Mapper.getCuxiaoGoods";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement,paramMap,pageBounds);
	}

	@Override
	public List getPagerByTag4EC(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = Goods.class.getName() + "Mapper.getPagerByTag4EC";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

	@Override
	public List getPagerByTag4BEC(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = Goods.class.getName() + "Mapper.getPagerByTag4BEC";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

	@Override
	public List getPagerByTag4BEC2(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = Goods.class.getName() + "Mapper.getPagerByTag4BEC2";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}

	@Override
	public List queryListPromotionOfHasRebate(Map<String, Object> paramMap, Criteria criteria, PageBounds pageBounds) {
		String defaultStatement = Goods.class.getName() + "Mapper.queryListPromotionOfHasRebate";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria, pageBounds);
	}


	/**
	 * 20160617 dzz
	 * 验证当前众筹商品是否存在订单信息
	 * @param paramMap
	 * @param criteria
	 * @param pager
	 * @return
	 * @throws Exception
	 */
	public Object validateZcOrderNan(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		String defaultStatement = Goods.class.getName() + "Mapper.validateZcOrderNan";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectOne(defaultStatement, paramMap);
	}

	/**
	 * 20160715 dzz
	 * get the Goods Infos By Id's list
	 * @param paramMap
	 * @param ids	the goods's Id list
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> getGoodsInfoById(Map<String, Object> paramMap, List<String> ids) throws Exception {
		String defaultStatement = CartItem.class.getName() + "Mapper.getGoodsInfoById";
		paramMap.put("ids", ids);

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}


	@Override
	public List<Map<String,Object>> getGoodsPager4JULI4SJ(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		String defaultStatement = Goods.class.getName() + "Mapper.getGoods4Pager4JULI4SJ";

		return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}
}
