package net.deepdragon.dao.weipu.impl;

import net.deepdragon.condition.Criteria;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.GoodsCategoryDao;
import net.deepdragon.entity.weipu.GoodsBrand;
import net.deepdragon.entity.weipu.GoodsCategory;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品分类表数据接口实现
 */
@Repository(Weipu.SIGN + "GoodsCategoryDaoImpl")
public class GoodsCategoryDaoImpl extends BaseDaoImpl<GoodsCategory, String>
		implements GoodsCategoryDao {

	@Override
	public List<String> getBrandIdsBycategoryId(Map<String, Object> paramMap,
			String categoryId) {
		String defaultStatement = GoodsCategory.class.getName()
				+ "Mapper.getBrandIdsBycategoryId";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate()
				.selectList(defaultStatement, categoryId);
	}

	@Override
	public List<String> getBrandIds(Map<String, Object> paramMap, String categoryId, int size) {
		String defaultStatement = GoodsCategory.class.getName()
				+ "Mapper.getBrandIds";
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("categoryId", categoryId);
		parameter.put("size", size);
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate()
				.selectList(defaultStatement, parameter);
	}

	@Override
	public List<GoodsBrand> getGoodsBrandByCatelogId(Map<String, Object> paramMap, String categoryId,int size){
		String defaultStatement = GoodsCategory.class.getName()
				+ "Mapper.getGoodsBrandByCatelogId";
		paramMap.put("categoryId", categoryId);
		paramMap.put("size", size);
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, paramMap);
	}

    @Override
    public List<String> getBrandBycatcategoryId(Map<String, Object> paramMap, String categoryId) {
        String defaultStatement = GoodsCategory.class.getName()
                + "Mapper.getBrandBycatcategoryId";
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("categoryId", categoryId);
        return this.sqlSessionTemplateFactory.getSqlSessionTemplate()
                .selectList(defaultStatement, parameter);
    }

    @Override
	public int delRelationCategoryBrand(Map<String, Object> paramMap, String categoryId)
			throws Exception {
		String defaultStatement = GoodsCategory.class.getName()
				+ "Mapper.delRelationCategoryBrand";
		return this.sqlSessionTemplateFactory.getSqlSessionTemplate(
				ExecutorType.BATCH).delete(defaultStatement, categoryId);
	}

	@Override
	public int[] saveRelationCategoryBrand(Map<String, Object> paramMap, String categoryId,
			List<String> brandIds) {
		Assert.notNull(categoryId, "parameter 'categoryId' can't be null");
		Assert.notEmpty(brandIds,
				"parameter 'brandIds' can't be null or empty!");
		String defaultStatement = GoodsCategory.class.getName()
				+ "Mapper.saveRelationCategoryBrand";
		List<Integer> batchResultList = new ArrayList<Integer>();
		SqlSession sqlSession = sqlSessionTemplateFactory
				.getSqlSessionTemplate(ExecutorType.BATCH);
		try {
			for (int i = 0; i < brandIds.size(); i++) {
				Map<String, String> relationship = new HashMap<String, String>();
				relationship.put("categoryId", categoryId);
				relationship.put("brandId", brandIds.get(i));
				sqlSession.insert(defaultStatement, relationship);
				if ((i + 1) % DEFAULT_FLUSH_BATCH_SIZE == 0) {
					List<BatchResult> currentBatchResultList = sqlSession
							.flushStatements();
					extractBatchResult(batchResultList, currentBatchResultList);
				}
			}
		} finally {
			List<BatchResult> currentBatchResultList = sqlSession
					.flushStatements();
			extractBatchResult(batchResultList, currentBatchResultList);
		}
		return ArrayUtils
				.toPrimitive(batchResultList.toArray(new Integer[] {}));
	}

    /**
     * 根据前端catelog获取对应的后台GoodsCategory对象
     *
     * @param criteria 条件对象
     *
     * @return 商品分类列表
     */
    public List<?> getGategoryByCatelog(Criteria criteria) {
        String defaultStatement = GoodsCategory.class.getName() + "Mapper.getGategoryByCatelog";
        return sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, criteria);
    }

    @Override
    public List<GoodsCategory> getGategoryByshopId(Map<String, Object> paramMap, String shopId) {
        String defaultStatement = GoodsCategory.class.getName() + "Mapper.getGategoryByshopId";
        return this.sqlSessionTemplateFactory.getSqlSessionTemplate().selectList(defaultStatement, shopId);
    }

}
