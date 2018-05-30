package net.deepdragon.service.weipu.impl;

import com.alibaba.fastjson.JSON;
import net.deepdragon.bean.PageList;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.constant.weipu.Weipu;
import net.deepdragon.dao.weipu.*;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.mybatis.domain.PageBounds;
import net.deepdragon.service.weipu.GoodsService;
import net.deepdragon.util.OrderGenerator;
import net.deepdragon.util.SearchSQL;
import net.deepdragon.util.StringUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service(Weipu.SIGN + "GoodsServiceImpl")
public class GoodsServiceImpl extends BaseServiceImpl<Goods, String> implements GoodsService {

	@Resource(name = Weipu.SIGN + "GoodsDaoImpl")
	private GoodsDao goodsDao;
	@Resource(name = Weipu.SIGN + "ProductDaoImpl")
	private ProductDao productDao;
	@Resource(name = Weipu.SIGN + "GoodsImagesDaoImpl")
	private GoodsImagesDao goodsImagesDao;
	@Resource(name = Weipu.SIGN + "SpecificationValueDaoImpl")
	private SpecificationValueDao specificationValueDao;
	@Resource(name = Weipu.SIGN + "GoodsCartypeDaoImpl")
	private GoodsCartypeDao goodsCartypeDao;

	@Override
	public BaseDao<Goods, String> getBaseDao() {
		return this.goodsDao;
	}

	/**
	 * 最直接的分页获取数据
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param criteria
	 *            条件对象
	 * @param pager
	 *            分页对象
	 * 
	 * @return 分页对象
	 */
	public Pager getListByPager(Map<String,Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List list = goodsDao.getListByPager(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList pageList = (PageList) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Pager getPager(Map<String,Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List<Goods> list = goodsDao.getPager(paramMap, criteria, pageBounds);

			if( list != null && list.size() > 0){
				Criteria criteria1;
				for( Goods goods : list){
					criteria1 = new Criteria();
					criteria1.add(Restrictions.eq("goodsId", goods.getId()));
					criteria1.add(Restrictions.order("createDate", "desc"));
					List<GoodsImages> goodsImages = this.goodsImagesDao.getList(paramMap, criteria1);
					if( goodsImages != null && goodsImages.size() > 0 ){
						goods.setPic( goodsImages.get(0).getPic() );
					}
				}
			}

			pager.setList(list);
			PageList<Goods> pageList = (PageList<Goods>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<Goods> getList(Map<String,Object> paramMap, Criteria criteria) throws Exception {
		criteria.add(Restrictions.order("d.orderNo", "desc"));
		return super.getList(paramMap, criteria);
	}

	/**
	 * 保存商品相关的一系列东西
	 *
	 * @param paramMap
	 *            租户Id
	 * @param goodsMap
	 *            商品相关数据
	 */
	public boolean saveGoods(Map<String,Object> paramMap, Map<String, Object> goodsMap, List<GoodsImages> list) throws Exception {
		/**** 注：先确定有多少个商品规格，就会对应有多少个商品 ***/
		// 保存单品信息(一个单品下面会对应有多个商品)
		Product product = (Product) goodsMap.get("product");
		if (product.getId() == null || StringUtils.isBlank(product.getId())) {
			product = productDao.save(paramMap, product);
		}
		List spItemList = JSON.parseObject(JSON.toJSONString(goodsMap.get("goodsSpList")), List.class); // 规格项的ids
		List spItemTextList = JSON.parseObject(JSON.toJSONString(goodsMap.get("goodsSpItemTextList")), List.class); // 规格项的text值,和ids一一对应
		int spItemSize = spItemList.size();
		spItemSize = spItemSize == 0 ? 1 : spItemSize;
		for (int i = 0; i < spItemSize; i++) {
			// 保存商品基本信息
			Goods goods = JSON.parseObject(JSON.toJSONString(goodsMap.get("baseInfo")), Goods.class);
			if (StringUtils.isEmpty(goods.getSn())) {
				goods.setSn(OrderGenerator.generator());
			}
			if (StringUtils.isEmpty(goods.getBrandId())) {
				goods.setBrandId(null);
			}
			goods.setId(null); // 以免出现库里已经有当前数据了...
			if (goods.getStock() != null && goods.getStock() == 0) {
				goods.setStock(null);
			}
			// 根据规格项组装出来商品的全名称
			if (spItemTextList.size() > 0) {
				goods.setFullName(goods.getName() + " " + spItemTextList.get(i).toString());
			} else {
				goods.setFullName(goods.getName());
			}
			goods.setCreateUser(goodsMap.get("createUser").toString());
			goods.setProductId(product.getId());
			goods = goodsDao.save(paramMap, goods);

			// 保存商品参数列表
			List<Map<String, Object>> paramList = (List<Map<String, Object>>) goodsMap.get("goodsParameterList");
			if (paramList != null && paramList.size() > 0) {
				for (Map<String, Object> map : paramList) {
					map.put("goodsId", goods.getId());
				}
				goodsDao.saveGoodsParamDetail(paramMap, paramList);
			}

			// 保存商品属性列表
			Map<String, Object> attrMap = new HashMap<String, Object>();
			attrMap.put("goodsId", goods.getId());
			List<String> attrList = (List<String>) goodsMap.get("goodsAttrList");
			if (attrList != null && attrList.size() > 0) {
				String[] vInfo;
				for (int j = 1; j <= attrList.size(); j++) {
					vInfo = attrList.get(j - 1).split("_");
					attrMap.put(vInfo[0], vInfo[1]);
				}
				goodsDao.saveGoodsAttrValues(paramMap, attrMap);
			}

			// 保存选择的商品规格
			List<String> checkSpList = (List<String>) goodsMap.get("checkSpList");
			if (checkSpList != null && checkSpList.size() > 0) {
				List<Map<String, Object>> spDataList = new ArrayList<Map<String, Object>>();
				Map<String, Object> checkSpMap;
				for (String s : checkSpList) {
					checkSpMap = new HashMap<String, Object>();
					checkSpMap.put("goodsId", goods.getId());
					if (StringUtils.isBlank(s))
						continue;
					checkSpMap.put("specificationId", Long.valueOf(s));
					spDataList.add(checkSpMap);
				}
				goodsDao.saveGoodsSpList(paramMap, spDataList);
			}

			// 保存商品规格项列表
			List<Map<String, Object>> spMapList = new ArrayList<Map<String, Object>>();
			if (spItemList.size() > 0) {
				String[] spArray = spItemList.get(i).toString().split(",");
				if (spArray.length > 0) {
					Map<String, Object> spMap;
					for (String sp : spArray) { // 具体的各个商品规格
						spMap = new HashMap<String, Object>();
						spMap.put("goodsId", goods.getId());
						spMap.put("content", sp);
						if (StringUtils.isNotBlank(sp)) {
							spMapList.add(spMap);
						}
					}
					goodsDao.saveGoodsSpDetail(paramMap, spMapList);
				}
			}

			// 给商品打标签
			List<String> tags = (List<String>) goodsMap.get("goodsTags"); // 拿到tag的Id列表
			if (tags != null && tags.size() > 0) {
				List<Map<String, Object>> goodsTags = new ArrayList<Map<String, Object>>();
				Map<String, Object> tagMap;
				for (String tagId : tags) {
					tagMap = new HashMap<String, Object>();
					tagMap.put("goodsId", goods.getId());
					tagMap.put("tagId", tagId);
					goodsTags.add(tagMap);
				}
				goodsDao.saveGoodsTags(paramMap, goodsTags);
			}

			// 保存商品图片信息
			if (CollectionUtils.isNotEmpty(list)) {
				for (GoodsImages gi : list) {
					gi.setId(null);
					gi.setGoodsId(goods.getId());
				}
				this.goodsImagesDao.save(paramMap, list);
			}

		}

		return true;
	}

	/**
	 * 保存商品相关的一系列东西(-----扩展)
	 *
	 * @param paramMap 租户Id
	 * @param goodsMap 商品相关数据
	 */
	public Product saveGoodsEx(Map<String,Object> paramMap, Map<String, Object> goodsMap, List<GoodsImages> list, String carTypeId) throws Exception {
		/**** 注：先确定有多少个商品规格，就会对应有多少个商品 ***/
		// 保存单品信息(一个单品下面会对应有多个商品)
		Product product = (Product) goodsMap.get("product");
		if (product.getId() == null || StringUtils.isBlank(product.getId())) {
			product = productDao.save(paramMap, product);
		}
		List spItemList = JSON.parseObject(JSON.toJSONString(goodsMap.get("goodsSpList")), List.class); // 规格项的ids
		List spItemTextList = JSON.parseObject(JSON.toJSONString(goodsMap.get("goodsSpItemTextList")), List.class); // 规格项的text值,和ids一一对应
		int spItemSize = spItemList.size();
		spItemSize = spItemSize == 0 ? 1 : spItemSize;
		for (int i = 0; i < spItemSize; i++) {
			// 保存商品基本信息
			Goods goods = JSON.parseObject(JSON.toJSONString(goodsMap.get("baseInfo")), Goods.class);
			if (StringUtils.isEmpty(goods.getSn())) {
				goods.setSn(OrderGenerator.generator());
			}
			if (StringUtils.isEmpty(goods.getBrandId())) {
				goods.setBrandId(null);
			}
			goods.setId(null); // 以免出现库里已经有当前数据了...
			if (goods.getStock() != null && goods.getStock() == 0) {
				goods.setStock(null);
			}
			// 根据规格项组装出来商品的全名称
			if (spItemTextList.size() > 0) {
				goods.setFullName(goods.getName() + " " + spItemTextList.get(i).toString());
			} else {
				goods.setFullName(goods.getName());
			}
			goods.setCreateUser(goodsMap.get("createUser").toString());
			goods.setProductId(product.getId());
			goods = goodsDao.save(paramMap, goods);

			// 保存商品参数列表
			List<Map<String, Object>> paramList = (List<Map<String, Object>>) goodsMap.get("goodsParameterList");
			if (paramList != null && paramList.size() > 0) {
				for (Map<String, Object> map : paramList) {
					map.put("goodsId", goods.getId());
				}
				goodsDao.saveGoodsParamDetail(paramMap, paramList);
			}

			// 保存商品属性列表
			Map<String, Object> attrMap = new HashMap<String, Object>();
			attrMap.put("goodsId", goods.getId());
			List<String> attrList = (List<String>) goodsMap.get("goodsAttrList");
			if (attrList != null && attrList.size() > 0) {
				String[] vInfo;
				for (int j = 1; j <= attrList.size(); j++) {
					vInfo = attrList.get(j - 1).split("_");
					attrMap.put(vInfo[0], vInfo[1]);
				}
				goodsDao.saveGoodsAttrValues(paramMap, attrMap);
			}

			// 保存选择的商品规格
			List<String> checkSpList = (List<String>) goodsMap.get("checkSpList");
			if (checkSpList != null && checkSpList.size() > 0) {
				List<Map<String, Object>> spDataList = new ArrayList<Map<String, Object>>();
				Map<String, Object> checkSpMap;
				for (String s : checkSpList) {
					checkSpMap = new HashMap<String, Object>();
					checkSpMap.put("goodsId", goods.getId());
					if (StringUtils.isBlank(s))
						continue;
					checkSpMap.put("specificationId", Long.valueOf(s));
					spDataList.add(checkSpMap);
				}
				goodsDao.saveGoodsSpList(paramMap, spDataList);
			}

			// 保存商品规格项列表
			List<Map<String, Object>> spMapList = new ArrayList<Map<String, Object>>();
			if (spItemList.size() > 0) {
				String[] spArray = spItemList.get(i).toString().split(",");
				if (spArray.length > 0) {
					Map<String, Object> spMap;
					for (String sp : spArray) { // 具体的各个商品规格
						spMap = new HashMap<String, Object>();
						spMap.put("goodsId", goods.getId());
						spMap.put("content", sp);
						if (StringUtils.isNotBlank(sp)) {
							spMapList.add(spMap);
						}
					}
					goodsDao.saveGoodsSpDetail(paramMap, spMapList);
				}
			}

			// 给商品打标签
			List<String> tags = (List<String>) goodsMap.get("goodsTags"); // 拿到tag的Id列表
			if (tags != null && tags.size() > 0) {
				List<Map<String, Object>> goodsTags = new ArrayList<Map<String, Object>>();
				Map<String, Object> tagMap;
				for (String tagId : tags) {
					tagMap = new HashMap<String, Object>();
					tagMap.put("goodsId", goods.getId());
					tagMap.put("tagId", tagId);
					goodsTags.add(tagMap);
				}
				goodsDao.saveGoodsTags(paramMap, goodsTags);
			}

			// 保存商品图片信息
			if (CollectionUtils.isNotEmpty(list)) {
				for (GoodsImages gi : list) {
					gi.setId(null);
					gi.setGoodsId(goods.getId());
				}
				this.goodsImagesDao.save(paramMap, list);
			}

			// 保存“汽车车型”与商品之间的关系
			if (StringUtils.isNotBlank(carTypeId)) {
				GoodsCartype goodsCartype = new GoodsCartype();
				goodsCartype.setCreateUser(goods.getCreateUser());
				goodsCartype.setGoodsId(goods.getId());
				goodsCartype.setCartypeId(carTypeId);
				List<GoodsCartype> gctList = new ArrayList<GoodsCartype>();
				gctList.add(goodsCartype);
				goodsCartypeDao.save(paramMap, gctList);
			}

		}

		return product;
	}

	/**
	 * 更新商品相关的一系列东西
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param goodsMap
	 *            商品相关数据
	 */
	public boolean updateGoods(Map<String,Object> paramMap, Map<String, Object> goodsMap, List<String> deleteallId, List<GoodsImages> updatentity, List<GoodsImages> saveentity) throws Exception {
		/**** 注：先确定有多少个商品规格，就会对应有多少个商品 ***/
		List spItemList = JSON.parseObject(JSON.toJSONString(goodsMap.get("goodsSpList")), List.class); // 规格项的ids
		List gids = JSON.parseObject(JSON.toJSONString(goodsMap.get("gids")), List.class); // 规格项中对应的商品Id列表
		List newGoodsSpList = JSON.parseObject(JSON.toJSONString(goodsMap.get("newGoodsSpList")), List.class); // 要新添加的规格项的ids
		List newGoodsSpItemTextList = JSON.parseObject(JSON.toJSONString(goodsMap.get("newGoodsSpItemTextList")), List.class); // 要新添加的规格项的text值,和ids一一对应
		// 更新商品基本信息
		Goods goods = JSON.parseObject(JSON.toJSONString(goodsMap.get("baseInfo")), Goods.class);
		if (StringUtils.isEmpty(goods.getSn()))
			goods.setSn(OrderGenerator.generator());
		if (StringUtils.isEmpty(goods.getBrandId()))
			goods.setBrandId(null);
		goods.setModifyDate(new Date());
		goods.setModifyUser(goodsMap.get("modifyUser").toString());
		// 在没有规格项的情况下商品的全名称就是商品名称
		goods.setFullName(goods.getName());
		goodsDao.update(paramMap, goods);

		// 更新商品参数列表
		List<Map<String, Object>> paramList = (List<Map<String, Object>>) goodsMap.get("goodsParameterList");
		if (paramList != null && paramList.size() > 0) {
			for (Map<String, Object> map : paramList) {
				map.put("goodsId", goods.getId());
			}
			List<Long> goodsIds = new ArrayList<Long>();
			goodsIds.add(Long.valueOf(goods.getId()));
			// 先把原来的删除，再添加新的参数数据
			goodsDao.deleteParams(paramMap, goodsIds);
			goodsDao.saveGoodsParamDetail(paramMap, paramList);
		}

		// 更新商品属性列表
		Map<String, Object> attrMap = new HashMap<String, Object>();
		attrMap.put("goodsId", goods.getId());
		List<String> attrList = (List<String>) goodsMap.get("goodsAttrList");
		if (attrList != null && attrList.size() > 0) {
			String[] vInfo;
			for (int j = 1; j <= attrList.size(); j++) {
				vInfo = attrList.get(j - 1).split("_");
				attrMap.put(vInfo[0], vInfo[1]);
			}
            List al = goodsDao.getGoodsAttrsListBatch(paramMap, "goodsId", goods.getId());
            if(al != null && al.size() > 0) {
                goodsDao.updateGoodsAttrValues(paramMap, attrMap);
            } else {
                goodsDao.saveGoodsAttrValues(paramMap, attrMap);
            }
		}

		List<Long> goodsIds = new ArrayList<Long>();
		goodsIds.add(Long.valueOf(goods.getId()));
		// 更新选择的商品规格
		List<String> checkSpList = (List<String>) goodsMap.get("checkSpList");
		if (checkSpList.size() > 0) {
			List<Long> allGoodsIds = new ArrayList<Long>();
			allGoodsIds.add(Long.valueOf(goods.getId()));
			for (Object s : gids) {
				if (s != null)
					allGoodsIds.add(Long.valueOf(s.toString()));
			}
			if (allGoodsIds.size() > 0) {
				for (Long id : allGoodsIds) {
					List<Long> ids = new ArrayList<Long>();
					ids.add(id);
					reSaveGoodsSp(paramMap, checkSpList, ids);
				}
			}
		} else { // 相当于规格不启用了
			goodsDao.deleteSpecs(paramMap, goodsIds);
		}

		// 更新商品规格项列表
		if (spItemList.size() > 0) {
			String[] itemArray = spItemList.get(0).toString().split(","); // 拆分成一个个规格项
			reSaveGoodsSpDetail(paramMap, itemArray, goodsIds);
			// 其它商品的规格项
			List otherSpItemList = spItemList.subList(1, spItemList.size());
			if (gids != null && gids.size() <= otherSpItemList.size()) {
				for (int i = 0; i < otherSpItemList.size(); i++) {
					String[] otherItemArray = otherSpItemList.get(i).toString().split(",");
					List<Long> otherGoodsIds = new ArrayList<Long>();
					if (gids.get(i) == null || StringUtils.isBlank(gids.get(i).toString()))
						continue;
					otherGoodsIds.add(Long.valueOf(gids.get(i).toString()));
					reSaveGoodsSpDetail(paramMap, otherItemArray, otherGoodsIds);
				}
			}
		} else {
			goodsDao.deleteSpItems(paramMap, goodsIds);
		}

		// 给商品打标签
		List<String> tags = (List<String>) goodsMap.get("goodsTags"); // 拿到tag的Id列表
		if (tags != null && tags.size() > 0) {
			List<Map<String, Object>> goodsTags = new ArrayList<Map<String, Object>>();
			Map<String, Object> tagMap;
			for (String tagId : tags) {
				tagMap = new HashMap<String, Object>();
				tagMap.put("goodsId", goods.getId());
				tagMap.put("tagId", tagId);
				goodsTags.add(tagMap);
			}
			// 先把原来的删除，再重新给商品添加标签
			goodsDao.removeGoodsTags(paramMap, goodsIds);
			goodsDao.saveGoodsTags(paramMap, goodsTags);
		} else {
			goodsDao.removeGoodsTags(paramMap, goodsIds);
        }

		// 保存商品图片信息
		List<GoodsImages> list = new ArrayList<GoodsImages>();
		if (CollectionUtils.isNotEmpty(deleteallId)) {
			this.goodsImagesDao.delete(paramMap, deleteallId);
		}
		if (CollectionUtils.isNotEmpty(updatentity)) {
			// for (GoodsImages gi : updatentity) {
			// gi.setId(null);
			// list.add(gi);
			// }
			this.goodsImagesDao.update(paramMap, updatentity);
		}
		if (CollectionUtils.isNotEmpty(saveentity)) {
			for (GoodsImages gi : updatentity) {
				gi.setId(null);
				list.add(gi);
			}
			this.goodsImagesDao.save(paramMap, saveentity);
		}

		if (newGoodsSpList != null && newGoodsSpList.size() > 0) {
			// 当规格项从第二行开始就已经不是当前商品的规格了，就得新添加成商品
			// 沿用第一个的单品信息
			Product product = new Product();
			product.setId(goods.getProductId());
			goodsMap.put("product", product);
			goodsMap.put("goodsSpList", newGoodsSpList);
			goodsMap.put("goodsSpItemTextList", newGoodsSpItemTextList);
			// 重置商品编号
			goods.setSn(null);
			goodsMap.put("baseInfo", goods);
			saveGoods(paramMap, goodsMap, list);
		}

		return true;
	}

	private void reSaveGoodsSp(Map<String,Object> paramMap, List<String> checkSpList, List<Long> goodsIdList) {
		List<Map<String, Object>> spDataList = new ArrayList<Map<String, Object>>();
		Map<String, Object> checkSpMap;
		for (String s : checkSpList) {
			checkSpMap = new HashMap<String, Object>();
			checkSpMap.put("goodsId", goodsIdList.get(0));
			if (StringUtils.isBlank(s))
				continue;
			checkSpMap.put("specificationId", Long.valueOf(s));
			spDataList.add(checkSpMap);
		}
		// 先把原来的删除，再添加新的规格数据
		if (spDataList.size() > 0) {
			goodsDao.deleteSpecs(paramMap, goodsIdList);
			goodsDao.saveGoodsSpList(paramMap, spDataList);
		}
	}

	private void reSaveGoodsSpDetail(Map<String,Object> paramMap, String[] itemArray, List<Long> goodsIdList) {
		List<Map<String, Object>> spItemMapList = new ArrayList<Map<String, Object>>();
		Map<String, Object> spItemMap;
		List<String> spNameList = new ArrayList<String>();
		for (int i = 0; i < itemArray.length; i++) { // 具体的各个商品规格
			spItemMap = new HashMap<String, Object>();
			spItemMap.put("goodsId", goodsIdList.get(0));
			spItemMap.put("content", itemArray[i]);
			if (StringUtils.isNotBlank(itemArray[i])) {
				spItemMapList.add(spItemMap);
			}
			SpecificationValue spVal = specificationValueDao.getSpBatch(paramMap, itemArray[i]);
			if (spVal != null)
				spNameList.add(spVal.getName());
		}
		Goods g = goodsDao.getGoodsByBatchType(paramMap, goodsIdList.get(0).toString());
		g.setFullName(g.getName() + " " + (spNameList.size() > 0 ? spNameList.toString().substring(1, spNameList.toString().length() - 1) : ""));
		goodsDao.update(paramMap, g);
		// 先把原来的删除，再添加新的规格项数据
		if (spItemMapList.size() > 0) {
			goodsDao.deleteSpItems(paramMap, goodsIdList);
			goodsDao.saveGoodsSpDetail(paramMap, spItemMapList);
		}
	}

	/**
	 * 删除商品和其相关的数据
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param ids
	 *            商品Ids，用逗号分隔
	 */
	public boolean deleteGoods(Map<String,Object> paramMap, List<String> ids) throws Exception {
		int[] deleteGoodsResult = goodsDao.delete(paramMap, ids);

		List<Long> goodsIds = new ArrayList<Long>();
		for (String id : ids) {
			if (StringUtils.isNotBlank(id)) {
				goodsIds.add(Long.valueOf(id));
			}
		}

		int deleteParamsResult = goodsDao.deleteParams(paramMap, goodsIds);
		int deleteAttrsResult = goodsDao.deleteAttrs(paramMap, goodsIds);
		int deleteSpecsResult = goodsDao.deleteSpecs(paramMap, goodsIds);
		int deleteSpItemsResult = goodsDao.deleteSpItems(paramMap, goodsIds);
		int deleteImagesResult = goodsDao.deleteImages(paramMap, goodsIds);

		return deleteGoodsResult.length >= 0 && deleteParamsResult >= 0 && deleteAttrsResult >= 0 && deleteSpecsResult >= 0 && deleteSpItemsResult >= 0 && deleteImagesResult >= 0;
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
	public List<?> getGoodsParamsList(Map<String,Object> paramMap, String property, Object value) {
		return goodsDao.getGoodsParamsList(paramMap, property, value);
	}

	/**
	 * 获取商品属性字段信息列表
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * 
	 * @return 字段信息列表
	 */
	public List<String> getGoodsAttrs(Map<String,Object> paramMap, String property, Object value) {
		List<String> resultList = new ArrayList<String>();
		List<Map<String, Object>> mapList = (List<Map<String, Object>>) goodsDao.getGoodsAttrsList(paramMap, property, value);
		if (mapList != null && mapList.size() > 0) {
			Map<String, Object> dataMap = mapList.get(0);
			for (Map.Entry<String, Object> map : dataMap.entrySet()) {
				resultList.add(map.getKey() + "_" + map.getValue());
			}
		}

		return resultList;
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
	public List<?> getCheckedSpList(Map<String,Object> paramMap, String property, Object value) {
		List<Map<String, Object>> mapList = (List<Map<String, Object>>) goodsDao.getCheckedSpList(paramMap, property, value);
		List<Object> resultList = null;
		if (mapList != null && mapList.size() > 0) {
			resultList = new ArrayList<Object>();
			for (Map<String, Object> map : mapList) {
				for (Map.Entry<String, Object> m : map.entrySet()) {
					if (m.getKey().equals("specificationId")) {
						resultList.add(m.getValue());
					}
				}
			}
		}

		return resultList;
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
	public List<?> getCurrentSpItems(Map<String,Object> paramMap, String property, String value) {
		List<Map<String, Object>> currentSpItems = (List<Map<String, Object>>) goodsDao.getCurrentSpItems(paramMap, property, value);
		if (currentSpItems != null && currentSpItems.size() > 0) {
			for (Map<String, Object> map : currentSpItems) {
				for (Map.Entry<String, Object> m : map.entrySet()) {
					map.put(m.getKey(), m.getValue().toString());
				}
			}
		}

		return currentSpItems;
	}

	/**
	 * 获取商品规格项
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param property
	 *            字段名称
	 * @param value
	 *            字段值
	 * 
	 * @return 规格项
	 */
	@Deprecated
	public List<?> getSpItemList(Map<String,Object> paramMap, String property, Object value) {
		if (value == null)
			return null;

		Goods goods = goodsDao.get(paramMap, value.toString());
		List<Goods> goodsList = goodsDao.findList(paramMap, "productId", goods.getProductId());
		List<String> goodsIds = null;
		if (goodsList != null && goodsList.size() > 0) {
			goodsIds = new ArrayList<String>();
			for (Goods g : goodsList) {
				goodsIds.add(g.getId());
			}
		}

		// 获取当前商品的
		Object currentGoodsId = null;
		if (goodsIds != null) {
			currentGoodsId = goodsIds.remove(value.toString());
		}
		Criteria c = new Criteria();
		c.add(Restrictions.eq("goodsId", currentGoodsId));
		List<Map<String, Object>> currentGoodsSpItem = (List<Map<String, Object>>) goodsDao.getSpItemList(paramMap, c);

		List<Map<String, Object>> spItems = null;
		if (goodsIds != null && goodsIds.size() > 0) {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.in("goodsId", goodsIds));
			spItems = (List<Map<String, Object>>) goodsDao.getSpItemList(paramMap, criteria);
			spItems.addAll(0, currentGoodsSpItem); // 把当前商品的规格放第一位
			for (Map<String, Object> map : spItems) {
				for (Map.Entry<String, Object> m : map.entrySet()) {
					if (m.getValue() != null)
						map.put(m.getKey(), m.getValue().toString());
				}
			}
		}

		return spItems;
	}

	/**
	 * 根据goodsId获取当前单品的规格和规格项信息
	 * 
	 * @param paramMap
	 *            租户标识
	 * @param goodsId
	 *            商品Id
	 * 
	 * @return 返回map，map的goodsSpList是商品规格列表,map的goodsSpItemList是商品对应的规格项列表
	 */
	public Map<String, List<Map<String, Object>>> getGoodsSpInfo(Map<String,Object> paramMap, String goodsId) {
		List<Long> spIds = new ArrayList<Long>();
		// 规格列表
		List<Map<String, Object>> goodsSpList = (List<Map<String, Object>>) goodsDao.getGoodsSpList(paramMap, goodsId);
		for (Map<String, Object> map : goodsSpList) {
			spIds.add(Long.valueOf(map.get("id").toString()));
		}
		// 规格项列表
		List<Map<String, Object>> goodsSpItemList = null;
		if (spIds.size() > 0) {
			goodsSpItemList = (List<Map<String, Object>>) goodsDao.getGoodsSpItemList(paramMap, goodsId);
		}

		Map<String, List<Map<String, Object>>> result = new HashMap<String, List<Map<String, Object>>>();
		result.put("goodsSpList", goodsSpList);
		result.put("goodsSpItemList", goodsSpItemList);

		return result;
	}

	@Override
	public List<Goods> getGoodsByTagId(Map<String,Object> paramMap, String catlogId, String tagId, Integer size,Integer platform) throws Exception {
		try {
			return this.goodsDao.getGoodsByTagId(paramMap, catlogId, tagId, size,platform);
		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * 获取店铺打了标签(wp_tag下的id)的商品列表 criteria
	 * 必须要有的条件：tagId、isMarketable、shopId、size(取多少条数据)
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param paramMap
	 *            查询条件
	 */
	public List<Goods> getGoodsByTagIdInShop(Map<String,Object> paramMap, Map<String, Object> selectParamMap) throws Exception {
		return goodsDao.getGoodsByTagIdInShop(paramMap, selectParamMap);
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
	public List<Map<String, Object>> getGoods4Category(Map<String,Object> paramMap, String categoryId) {
		return goodsDao.getGoods4Category(paramMap, categoryId);
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
	public List<GoodsBrand> getBrandListByGoodsCatId(Map<String,Object> paramMap, String categoryId) {
		return goodsDao.getBrandListByGoodsCatId(paramMap, categoryId);
	}

	/**
	 * 商品上/下架
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param status
	 *            商品是否上架 1:上架，0:下架
	 * @param goodsIds
	 *            用逗号分隔的商品Ids
	 */
	public int marketableOrDisable(Map<String,Object> paramMap, int status, List<String> goodsIds) {
		int[] updateResult = null;
		if (goodsIds != null && goodsIds.size() > 0) {
			List<Goods> goodsList = new ArrayList<Goods>();
			Goods goods;
			for (String id : goodsIds) {
				goods = new Goods();
				goods.setId(id);
				goods.setIsMarketable(status);
				goodsList.add(goods);
			}
			updateResult = goodsDao.update(paramMap, goodsList);
		}

		return updateResult.length;
	}

	/**
	 * 获取商品头上的标签
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param goodsId
	 *            商品Id
	 * 
	 * @return k：goodsId，v：tagId
	 */
	public List<Map<String, Object>> getGoodsTags(Map<String,Object> paramMap, String goodsId) {
		return goodsDao.getGoodsTags(goodsId);
	}

	/**
	 * 根据分类Id查询品牌列表
	 * 
	 * @param paramMap
	 *            租户Id
	 * @param categoryId
	 *            分类Id
	 */
	public List<GoodsBrand> getGoodsBrandByCategory(Map<String,Object> paramMap, String categoryId) {
		return goodsDao.getGoodsBrandByCategory(paramMap, categoryId);
	}

	@Override
	public Goods getSeckill(Map<String,Object> paramMap, String id) throws Exception {
		return goodsDao.getSeckill(paramMap, id);
	}

	@Override
	public Goods getShipGoods(Map<String,Object> paramMap, String id) throws Exception {
		return goodsDao.getShipGoods(paramMap, id);
	}

	@Override
	public List<Goods> getTagGoods4Index(Map<String,Object> paramMap, String tagSign, Integer size,Integer platform) throws Exception {
		return goodsDao.getTagGoods4Index(paramMap, tagSign, size ,platform);
	}

	@Override
	public List<Goods> getTagGoods4IndexbyID(Map<String,Object> paramMap, String tagSign, Integer size,String id,Integer platform) throws Exception {
		return goodsDao.getTagGoods4IndexByID(paramMap, tagSign, size,id,platform);
	}

	@Override
	public Pager getPagerBysign(Map<String,Object> paramMap, String sign, Pager pager) throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List<Goods> list = goodsDao.getPagerBysign(paramMap, sign, pageBounds);
			pager.setList(list);
			PageList<Goods> pageList = (PageList<Goods>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public int updateGoodsSalesVolume(Map<String,Object> paramMap, String goodsId, int quantity) {
		return goodsDao.updateGoodsSalesVolume(paramMap, goodsId, quantity);
	}

	@Override
	public List<Goods> getTagGoods4Shop(Map<String,Object> paramMap, String shopId,
			String tagSign, Integer size,Integer platform) throws Exception {
		return goodsDao.getTagGoods4Shop(paramMap, shopId, tagSign, size,platform);
	}


	/**
	 * 保存商品相关的一系列东西(只为爱家用)
	 *
	 * @param paramMap 租户Id
	 * @param goodsMap 商品相关数据
	 */
	public List<Goods> saveGoods4aijia(Map<String,Object> paramMap, Map<String, Object> goodsMap, List<GoodsImages> list) throws Exception {
		List<Goods> goodsList = new ArrayList<Goods>();    // 要返回的所有goodsId列表
		/**** 注：先确定有多少个商品规格，就会对应有多少个商品 ***/
		// 保存单品信息(一个单品下面会对应有多个商品)
		Product product = (Product) goodsMap.get("product");
		if (product.getId() == null || StringUtils.isBlank(product.getId())) {
			product = productDao.save(paramMap, product);
		}
		List spItemList = JSON.parseObject(JSON.toJSONString(goodsMap.get("goodsSpList")), List.class); // 规格项的ids
		List spItemTextList = JSON.parseObject(JSON.toJSONString(goodsMap.get("goodsSpItemTextList")), List.class); // 规格项的text值,和ids一一对应
		int spItemSize = spItemList.size();
		spItemSize = spItemSize == 0 ? 1 : spItemSize;
		for (int i = 0; i < spItemSize; i++) {
			// 保存商品基本信息
			Goods goods = JSON.parseObject(JSON.toJSONString(goodsMap.get("baseInfo")), Goods.class);
			if (StringUtils.isEmpty(goods.getSn())) {
				goods.setSn(OrderGenerator.generator());
			}
			if (StringUtils.isEmpty(goods.getBrandId())) {
				goods.setBrandId(null);
			}
			goods.setId(null); // 以免出现库里已经有当前数据了...
			if (goods.getStock() != null && goods.getStock() == 0) {
				goods.setStock(null);
			}
			// 根据规格项组装出来商品的全名称
			if (spItemTextList.size() > 0) {
				goods.setFullName(goods.getName() + " " + spItemTextList.get(i).toString());
			} else {
				goods.setFullName(goods.getName());
			}
			goods.setCreateUser(goodsMap.get("createUser").toString());
			goods.setProductId(product.getId());
			goods = goodsDao.save(paramMap, goods);

			// 保存商品参数列表
			List<Map<String, Object>> paramList = (List<Map<String, Object>>) goodsMap.get("goodsParameterList");
			if (paramList != null && paramList.size() > 0) {
				for (Map<String, Object> map : paramList) {
					map.put("goodsId", goods.getId());
				}
				goodsDao.saveGoodsParamDetail(paramMap, paramList);
			}

			// 保存商品属性列表
			Map<String, Object> attrMap = new HashMap<String, Object>();
			attrMap.put("goodsId", goods.getId());
			List<String> attrList = (List<String>) goodsMap.get("goodsAttrList");
			if (attrList != null && attrList.size() > 0) {
				String[] vInfo;
				for (int j = 1; j <= attrList.size(); j++) {
					vInfo = attrList.get(j - 1).split("_");
					attrMap.put(vInfo[0], vInfo[1]);
				}
				goodsDao.saveGoodsAttrValues(paramMap, attrMap);
			}

			// 保存选择的商品规格
			List<String> checkSpList = (List<String>) goodsMap.get("checkSpList");
			if (checkSpList != null && checkSpList.size() > 0) {
				List<Map<String, Object>> spDataList = new ArrayList<Map<String, Object>>();
				Map<String, Object> checkSpMap;
				for (String s : checkSpList) {
					checkSpMap = new HashMap<String, Object>();
					checkSpMap.put("goodsId", goods.getId());
					if (StringUtils.isBlank(s)) continue;
					checkSpMap.put("specificationId", Long.valueOf(s));
					spDataList.add(checkSpMap);
				}
				goodsDao.saveGoodsSpList(paramMap, spDataList);
			}

			// 保存商品规格项列表
			List<Map<String, Object>> spMapList = new ArrayList<Map<String, Object>>();
			if (spItemList.size() > 0) {
				String[] spArray = spItemList.get(i).toString().split(",");
				if (spArray.length > 0) {
					Map<String, Object> spMap;
					for (String sp : spArray) { // 具体的各个商品规格
						spMap = new HashMap<String, Object>();
						spMap.put("goodsId", goods.getId());
						spMap.put("content", sp);
						if (StringUtils.isNotBlank(sp)) {
							spMapList.add(spMap);
						}
					}
					goodsDao.saveGoodsSpDetail(paramMap, spMapList);
				}
			}

			// 给商品打标签
			List<String> tags = (List<String>) goodsMap.get("goodsTags"); // 拿到tag的Id列表
			if (tags != null && tags.size() > 0) {
				List<Map<String, Object>> goodsTags = new ArrayList<Map<String, Object>>();
				Map<String, Object> tagMap;
				for (String tagId : tags) {
					tagMap = new HashMap<String, Object>();
					tagMap.put("goodsId", goods.getId());
					tagMap.put("tagId", tagId);
					goodsTags.add(tagMap);
				}
				goodsDao.saveGoodsTags(paramMap, goodsTags);
			}

			// 保存商品图片信息
			if (CollectionUtils.isNotEmpty(list)) {
				for (GoodsImages gi : list) {
					gi.setId(null);
					gi.setGoodsId(goods.getId());
				}
				this.goodsImagesDao.save(paramMap, list);
			}

			goodsList.add(goods);
		}

		return goodsList;
	}

	@Override
	public Goods getSeckillByDetailId(Map<String,Object> paramMap, String goodsId,
			String detailId) throws Exception {
		return goodsDao.getSeckillByDetailId(paramMap, goodsId,detailId);
	}

	@Override
	public List<Map<String, Object>> getRetailGoodsByTime(Map<String,Object> paramMap,
			String start, String end) throws Exception {
		return goodsDao.getRetailGoodsByTime(paramMap, start,end);
	}


	/**
	 * 根据商品ID查询此与此商品同类型的其他品牌分类;除却此商品
	 * @param paramMap			租户ID
	 * @param goodsId				商品ID信息
	 * @return
	 */
	public List<GoodsBrand> queryRelGoodsBrandByGoodsId(Map<String,Object> paramMap, String goodsId) throws Exception {
		//根据租户与商品ID获取对应商品对象信息
		Goods goodsObj = goodsDao.get(paramMap, goodsId);
		return goodsDao.queryRelGoodsBrandByGoodsId(paramMap,goodsId, goodsObj.getCategoryId());
	}

	/**
	 * 获取商品系统参数(国家;产地;保质期)
	 *
	 * @param id
	 *            商品Id
	 *
	 * @return k：参数名称，v：参数值
	 */
	public List<Map<String, Object>> getGoodsSystemparameter(Map<String,Object> paramMap,String id) {
		return goodsDao.getGoodsSystemparameter(paramMap,id);
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
	public List<Map<String, Object>> getGoodsBatchPriceList(Map<String,Object> paramMap, String property, Object value) {
		return goodsDao.getGoodsBatchPriceList(paramMap, property, value);
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
	public List<Goods> getGoodsCatelogCountList(Map<String,Object> paramMap, Criteria criteria) {
		return goodsDao.getGoodsCatelogCountList(paramMap,criteria);
	}


	/**
	 * 2015111204 dzz
	 * 根据分类顶级节点查询品牌(品牌与品牌分类顶级节点关联)
	 * @param paramMap
	 * @param catRootId
	 * @return
	 */
	public List<GoodsBrand> queryBrandListByRootId(Map<String,Object> paramMap, String catRootId) throws Exception {
		return goodsDao.queryBrandListByRootId(paramMap, catRootId);
	}

	@Override
	public Pager getPager4BEC(Map<String, Object> paramMap, Criteria criteria, Pager pager)
			throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List<Goods> list = this.goodsDao.getPager4BEC(paramMap, criteria, pageBounds);

			if( list != null && list.size() > 0 ){
				Criteria criteria1 = new Criteria();
				for(Goods goods : list){
					criteria1 = new Criteria();
					criteria1.add(Restrictions.eq("goodsId", goods.getId()));
					criteria1.add(Restrictions.order("createDate", "desc"));
					List<GoodsImages> goodsImages = this.goodsImagesDao.getList(paramMap, criteria1);
					if( goodsImages != null && goodsImages.size() > 0 ){
						goods.setPic( goodsImages.get(0).getPic() );
					}
				}
			}

			pager.setList(list);
			PageList<Goods> pageList = (PageList<Goods>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public List<Goods> getList4BEC(Map<String, Object> paramMap, Criteria criteria) throws Exception {
		try {

			return this.goodsDao.getList4BEC(paramMap, criteria);
		} catch (Exception e) {
			throw e;
		}
	}
	/**
	 * 获取众筹商品
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Goods getZhongchouById(Map<String, Object> paramMap, String id) throws Exception {
		return goodsDao.getZhongchouById(paramMap, id);
	}



	public Goods getZCOrderInfoById(Map<String, Object> paramMap, String id) throws Exception {
		return goodsDao.getZCOrderInfoById(paramMap, id);
	}

	/**
	 * 众筹商品订单
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<Order> getZhongchouOrder(Map<String, Object> paramMap, String id) throws Exception {
		return goodsDao.getZhongchouOrder(paramMap, id);
	}

	/**
	 * 众筹商品订单统计
	 * @param paramMap
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getZhongchouOrderCount(Map<String, Object> paramMap, String id) throws Exception {
		return goodsDao.getZhongchouOrderCount(paramMap, id);
	}
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
	public Pager getZCGoodsList(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception{
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List list = goodsDao.getZCGoodsByPager(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList pageList = (PageList) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	public Pager queryListZhongChouGoods(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List list = goodsDao.queryListZhongChouGoods(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList pageList = (PageList) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
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
	public Pager getAllGoods(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception{
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List list = goodsDao.getAllGoods(paramMap, criteria, pageBounds);

			//组装图片 TianYu  2016-08-01 11:55:31 Start
			if( list != null && list.size() > 0 ){
				for( Goods goods : (List<Goods>)list ){
					List<GoodsImages> imgs = goodsImagesDao.findList(paramMap, "goodsId", goods.getId());
					if( imgs != null && imgs.size() > 0 ){
						goods.setImage( imgs.get( 0 ).getPic() );
					}
				}
			}

			//组装图片 TianYu  2016-08-01 11:55:31 End



			pager.setList(list);
			PageList pageList = (PageList) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
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
	public Goods findConditionGoods(Map<String,Object> paramMap, Criteria criteria,String id) {
		return goodsDao.findConditionGoods(paramMap, criteria,id);
	}
	public Modulus getModulus(Map<String, Object> paramMap,Criteria criteria) throws Exception{
		return goodsDao.getModulus(paramMap,criteria);
	}
	/**
	 * 根据商品条形码查商品
	 *
	 * @param paramMap
	 *            租户标识
	 * @param value
	 *            条形码
	 *
	 * @return 参数列表
	 */
	public List<Goods> findBarcodeGoods(Map<String, Object> paramMap, Object value) {
		try {
			return goodsDao.findBarcodeGoods(paramMap, value);
		} catch (Exception e) {
			throw e;
		}
	}

	/**
	 * 获取促销商品信息
	 */
	public Pager getCuxiaoGoods(Map<String, Object> paramMap,Pager pager){
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List list = goodsDao.getCuxiaoGoods(paramMap,pageBounds);
			pager.setList(list);
			PageList pageList = (PageList) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}


	@Override
	public Pager getSearchPager4EC(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			return selectPager(paramMap, SearchSQL.getEcSearchSql( paramMap.get("keyword")+"", pager, (String)paramMap.get("gb")), pager);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Pager getSearchPager4BEC(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			return selectPager(paramMap, SearchSQL.getBecSearchSql( paramMap.get("keyword")+"", pager), pager);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Pager getPagerByTag4EC(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List<Goods> list = this.goodsDao.getPagerByTag4EC(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList<Goods> pageList = (PageList<Goods>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Pager getPagerByTag4BEC(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List<Goods> list = this.goodsDao.getPagerByTag4BEC(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList<Goods> pageList = (PageList<Goods>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Pager getPagerByTag4BEC2(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List<Goods> list = this.goodsDao.getPagerByTag4BEC2(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList<Goods> pageList = (PageList<Goods>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public Pager queryListPromotionOfHasRebate(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			PageBounds pageBounds = new PageBounds(pager.getPageNumber(), pager.getPageSize());
			List<Goods> list = this.goodsDao.queryListPromotionOfHasRebate(paramMap, criteria, pageBounds);
			pager.setList(list);
			PageList<Goods> pageList = (PageList<Goods>) list;
			pager.setTotalCount(pageList.getPaginator().getTotalCount());
			return pager;
		} catch (Exception e) {
			throw e;
		}
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
		return this.goodsDao.validateZcOrderNan(paramMap, criteria, pager);
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
		return this.goodsDao.getGoodsInfoById(paramMap, ids);
	}

	/**
	 * 更具关键字长店铺里面的商品
	 * @param paramMap
	 * @param criteria
	 * @param pager
	 * @return
     * @throws Exception
     */
	@Override
	public Pager getGoodsPagerJl4SJ(Map<String, Object> paramMap, Criteria criteria, Pager pager) throws Exception {
		try {
			//计算分页
			int s=(pager.getPageNumber()-1)* pager.getPageSize();
			int e= pager.getPageSize();
			paramMap.put("s",s);
			paramMap.put("e",e);
			paramMap.put("limtString","limtString");
			List<Map<String,Object>> list =goodsDao.getGoodsPager4JULI4SJ(paramMap, criteria, pager);
			pager.setList(list);
			return pager;
		} catch (Exception e) {
			throw e;
		}
	}
}
