package net.deepdragon.service.weipu.impl;

import com.alibaba.fastjson.JSON;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.*;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.weipu.GoodsCategoryService;
import net.deepdragon.util.Constant;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service(Weipu.SIGN + "GoodsCategoryServiceImpl")
public class GoodsCategoryServiceImpl extends BaseServiceImpl<GoodsCategory, String> implements GoodsCategoryService {
	@Resource(name = Weipu.SIGN + "GoodsDaoImpl")
	private GoodsDao goodsDao;
	@Resource(name = Weipu.SIGN + "GoodsImagesDaoImpl")
	private GoodsImagesDao goodsImagesDao;

	@Resource(name = Weipu.SIGN + "GoodsCategoryDaoImpl")
	private GoodsCategoryDao goodsCategoryDao;

	@Resource(name = Weipu.SIGN + "CatelogDaoImpl")
	private CatelogDao catelogDao;

	@Override
	public BaseDao<GoodsCategory, String> getBaseDao() {
		return goodsCategoryDao;
	}

	@Override
	public List<String> getbrandIdsBycategoryId(Map<String, Object> paramMap, String categoryId) {
		return this.goodsCategoryDao.getBrandIdsBycategoryId(paramMap, categoryId);
	}

	@Override
	public List<String> getBrandIds(Map<String, Object> paramMap, String categoryId, int size) {
		return this.goodsCategoryDao.getBrandIds(paramMap, categoryId, size);
	}

	@Override
	public List<GoodsBrand> getGoodsBrandByCatelogId(Map<String, Object> paramMap, String categoryId,int size){
		return this.goodsCategoryDao.getGoodsBrandByCatelogId(paramMap, categoryId, size);
	}

    @Override
    public List<String> getBrandBycatcategoryId(Map<String, Object> paramMap, String categoryId) {
        return this.goodsCategoryDao.getBrandBycatcategoryId(paramMap,categoryId);

    }

    @Override
	public boolean saveRelationCategoryBrand(Map<String, Object> paramMap, String categoryId, List<String> brandIds) throws Exception {
		try {
			goodsCategoryDao.delRelationCategoryBrand(paramMap, categoryId);
			if (CollectionUtils.isNotEmpty(brandIds)) {
				goodsCategoryDao.saveRelationCategoryBrand(paramMap, categoryId, brandIds);
			}
			return true;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int delRelationCategoryBrand(Map<String, Object> paramMap, String categoryId) throws Exception {
		return 0;
	}

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
	public List<?> getCategoryOfGoods(Map<String, Object> paramMap, String categoryId, Integer nums) throws Exception {
		List<String> categoryIdList = new ArrayList<String>();
		categoryIdList.add(categoryId);

		Criteria c2 = new Criteria();
		c2.add(Restrictions.eq("parentId", categoryId));
		List<GoodsCategory> gcListL2 = getList(paramMap, c2);
		if (gcListL2 != null && gcListL2.size() > 0) { // 如果有下一级分类，有可能是二级或三级分类
			categoryIdList = new ArrayList<String>();
			for (GoodsCategory gc : gcListL2) {
				categoryIdList.add(gc.getId());
			}

			Criteria c3 = new Criteria();
			c3.add(Restrictions.in("parentId", categoryIdList));
			List<GoodsCategory> gcListL3 = getList(paramMap, c3);
			if (gcListL3 != null && gcListL3.size() > 0) {
				categoryIdList = new ArrayList<String>();
				for (GoodsCategory gc : gcListL3) {
					categoryIdList.add(gc.getId());
				}
			}
		}
		// 如果没有下级分类了，则说明是最底层（第三级）分类了，直接拿此categoryId下的商品就行了
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.in("categoryId", categoryIdList));
		criteria.add(Restrictions.eq("isMarketable", 1));
		criteria.add(Restrictions.eq("status", 5));
		PageBounds pager = new PageBounds();
		pager.setPageSize(nums);
		List<Goods> goodsList = goodsDao.getPager(paramMap, criteria, pager);

		List<Map<String, Object>> resultMapList = null;
		if (goodsList != null && goodsList.size() > 0) {
			resultMapList = new ArrayList<Map<String, Object>>();
			Map<String, Object> goodsMap;
			for (Goods g : goodsList) {
				List<GoodsImages> imgList = goodsImagesDao.findList(paramMap, "goodsId", g.getId());
				goodsMap = JSON.parseObject(JSON.toJSONString(g), Map.class);
				goodsMap.put("imageList", imgList);
				resultMapList.add(goodsMap);
			}
		}

		return resultMapList;
	}

	/**
	 * 根据前端catelog获取对应的后台GoodsCategory对象
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param catelogId
	 *            条件对象
	 * 
	 * @return 商品分类
	 */
	public GoodsCategory getGategoryByCatelog(Map<String, Object> paramMap, String catelogId) {
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("id", catelogId));
		criteria.add(Restrictions.eq("tenantId", paramMap.get(Constant.TENANTID_KEY).toString()));
		List<GoodsCategory> categoryList = (List<GoodsCategory>) goodsCategoryDao.getGategoryByCatelog(criteria);
		return (categoryList != null && categoryList.size() > 0) ? categoryList.get(0) : null;
	}

	public List<GoodsCategory> getGategoryByshopId(Map<String, Object> paramMap, String shopId) throws Exception {
		return (List<GoodsCategory>) goodsCategoryDao.getGategoryByshopId(paramMap, shopId);
	}

	@Override
	public void saveCategory(Map<String, Object> paramMap, GoodsCategory goodsCategory) throws Exception {
		GoodsCategory newgoodsCategory = goodsCategoryDao.save(paramMap, goodsCategory);
		Catelog catelog = new Catelog();
		catelog.setId(newgoodsCategory.getId());
		catelog.setCreateDate(newgoodsCategory.getCreateDate());
		catelog.setCreateUser(newgoodsCategory.getCreateUser());
		catelog.setDescription(newgoodsCategory.getDescription());
		catelog.setEnabled(newgoodsCategory.getEnabled());
		catelog.setName(newgoodsCategory.getName());
		catelog.setOrderNo(newgoodsCategory.getOrderNo());
		catelog.setParentId(newgoodsCategory.getParentId());
		catelog.setPath(newgoodsCategory.getPath());
		catelog.setSign(newgoodsCategory.getSign());
		catelog.setTenantId(paramMap.get(Constant.TENANTID_KEY).toString());
		catelogDao.save(paramMap, catelog);
	}
}
