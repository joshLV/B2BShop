package net.deepdragon.weipu.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.deepdragon.bean.Pager;
import net.deepdragon.bean.SystemSetKey;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.Global;

import net.deepdragon.weipu.tools.CrossborderUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 获取缓存数据的入口
 */
@Component(Global.APP_SIGN + "CacheData")
public class CacheData {

	private static Logger logger = LoggerFactory.getLogger(CacheData.class);
	
	@Resource
	private NavigationService navigationService;
	@Resource
	private ArticlesCategoryService articlesCategoryService;
	@Resource
	private ArticlesService articlesService;
	@Resource
	private CatelogService catelogService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private SystemSetService systemSetService;

	/**
	 * Desc:获取搜索热词
	 * Auth:zhangqiang
	 * Time:2015-12-30 17:25:35
	 */
	public List<Keywords> getKeywords(Map<String,Object> paramMap) {
		String key = CacheKeys.KEYWORDS_LIST.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		List<Keywords> list = null;
		Object cacheValue = CacheUtil.get(key);
		if (cacheValue == null) {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.order("orderNo", "DESC"));
			criteria.add(Restrictions.limit("0","5"));
			criteria.add(Restrictions.eq(Constant.TENANTID_KEY,"37100"));
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,2));
			try {
				list = navigationService.getListKeywords(paramMap, criteria);
				if (list != null) {
					CacheUtil.set(key, list);
				}
			} catch (Exception ex) {
				logger.error("CacheData中getBottomNavigation方法发生异常：", ex);
			}
		} else {
			list = (List<Keywords>) cacheValue;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Navigation> getMiddleNavigation(Map<String,Object> paramMap) {
		String key = CacheKeys.NAV_MIDDLE.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		List<Navigation> list = null;
		Object cacheValue = CacheUtil.get(key);
		if (cacheValue == null) {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("position", "middle"));
			criteria.add(Restrictions.order("orderNo", "ASC"));
			criteria.add(Restrictions.eq("isVisible", "1"));
			criteria.add(Restrictions.eq(Constant.TENANTID_KEY,"37100"));
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,2));
			try {
				list = navigationService.getList(paramMap, criteria);
				if (list != null) {
					CacheUtil.set(key, list);
				}
			} catch (Exception ex) {
				logger.error("CacheData中getMiddleNavigation方法发生异常：", ex);
			}
		} else {
			list = (List<Navigation>) cacheValue;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Navigation> getBottomNavigation(Map<String,Object> paramMap) {
		String key = CacheKeys.NAV_BOTTOM.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		List<Navigation> list = null;
		Object cacheValue = CacheUtil.get(key);
		if (cacheValue == null) {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("position", "bottom"));
			criteria.add(Restrictions.order("orderNo", "ASC"));
			criteria.add(Restrictions.eq("isVisible", "1"));
			criteria.add(Restrictions.eq(Constant.TENANTID_KEY,"37100"));
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,2));
			try {
				list = navigationService.getList(paramMap, criteria);
				if (list != null) {
					CacheUtil.set(key, list);
				}
			} catch (Exception ex) {
				logger.error("CacheData中getBottomNavigation方法发生异常：", ex);
			}
		} else {
			list = (List<Navigation>) cacheValue;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getServices(Map<String,Object> paramMap) {
        String key = CacheKeys.SERVICES.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
        List<Map<String, Object>> services = null;
        Object cacheValue = CacheUtil.get(key);
        if (cacheValue == null) {
            try {
            	services = new ArrayList<Map<String, Object>>();
            	String[] signs = (String[]) CacheKeys.SERVICES.getAssociatedData();
                for (String sign : signs) {
                    ArticlesCategory category = getArticlesCategoryMap(paramMap).get(sign);
                    if (category != null) {
                        Map<String, Object> data = new HashMap<String, Object>();
                        data.put("category", category);
                        data.put("articles", articlesService.getArticles(paramMap, sign, null, null, null));
                        services.add(data);
                    }
                }
                if (services.size() > 1) {
					CacheUtil.set(key, services);
				}
            } catch (Exception ex) {
                logger.error("CacheData中getServices方法发生异常：", ex);
            }
        } else {
            services = (List<Map<String, Object>>) cacheValue;
        }
        return services;
    }
	
	@SuppressWarnings("unchecked")
	public List<Catelog> getCatelogList(Map<String,Object> paramMap) {
		String key = CacheKeys.CATELOG_LIST.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		List<Catelog> list = null;
		Object cacheValue = CacheUtil.get(key);
		if (cacheValue == null) {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("enabled", "1"));
			criteria.add(Restrictions.eq("tenantId", paramMap.get(Constant.TENANTID_KEY)));
			criteria.add(Restrictions.order("orderNo", "ASC"));
			try {
				paramMap.remove(Constant.PLATFORM_KEY);
				list = catelogService.getList(paramMap, criteria);
				if (list != null) {
					CacheUtil.set(key, list);
				}
			} catch (Exception ex) {
				logger.error("CacheData中getCatelogList方法发生异常：", ex);
			}
		} else {
			list = (List<Catelog>) cacheValue;
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Catelog> getCatelogMap(Map<String,Object> paramMap) {
		String key = CacheKeys.CATELOG_MAP.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		Map<String, Catelog> map = null;
		Object cacheValue = CacheUtil.get(key);
		if (cacheValue == null) {
			List<Catelog> list = getCatelogList(paramMap);
			if (list != null) {
				map = new HashMap<String, Catelog>();
				for (Catelog catelog : list) {
					map.put(catelog.getId(), catelog);
				}
			}
			if (map != null) {
				CacheUtil.set(key, map);
			}
		} else {
			map = (Map<String, Catelog>) cacheValue;
		}
		return map;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, ArticlesCategory> getArticlesCategoryMap(Map<String,Object> paramMap) {
		String key = CacheKeys.ARTICLES_CATEGORY_MAP.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		Map<String, ArticlesCategory> map = null;
		Object cacheValue = CacheUtil.get(key);
		if (cacheValue == null) {
			try {
				List<ArticlesCategory> list = articlesCategoryService.getAll(paramMap);
				if (list != null) {
					map = new HashMap<String, ArticlesCategory>();
					for (ArticlesCategory articlesCategory : list) {
						map.put(articlesCategory.getSign(), articlesCategory);
					}
				}
				if (map != null) {
					CacheUtil.set(key, map);
				}
			} catch (Exception ex) {
				logger.error("CacheData中getArticlesCategoryMap方法发生异常：", ex);
			}
		} else {
			map = (Map<String, ArticlesCategory>) cacheValue;
		}
		return map;
	}


	/**
	 * 获取首页标签商品
	 * @param paramMap
	 * @param tag
	 * @param pager
	 * @return
     */
	public Pager getIndexTagGoodsMap(Map<String,Object> paramMap, String tag, Pager pager) {
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		String key = tag;
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		List<Goods> tagList = null;
		Object cacheValue = CacheUtil.get(key);
		if (cacheValue == null ) {

			try {
				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("o.tenantId", tenantId));
				criteria.add(Restrictions.eq("o.tagSign", tag));
				criteria.add(Restrictions.eq("o.isIndex", 1));
				pager = goodsService.getPagerByTag4EC(paramMap, criteria, pager);
				tagList = (List<Goods>)pager.getList();

				//判断跨境商品 开关 是否打开
				if(CrossborderUtil.isCrossborder()){//打开
					if(tagList.size() > 0 && tagList != null){
						tagList = getIfCrossborder(tagList);
					}
				}

				Pager pager1 = new Pager();
				pager1.setPageSize( pager.getTotalCount() );
				pager1.setPageNumber(1);

				pager1 = goodsService.getPagerByTag4EC(paramMap, criteria, pager1);

				List<Goods> allTagList = (List<Goods>)pager1.getList();

				//判断跨境商品 开关 是否打开
				if(CrossborderUtil.isCrossborder()){//打开
					if(allTagList.size() > 0 && allTagList != null){
						allTagList = getIfCrossborder(allTagList);
						pager1.setList( allTagList );
					}
				}

				if (allTagList != null && allTagList.size() > 0) {
					CacheUtil.set(key, allTagList);
					CacheUtil.set(key+"PagerCount", pager.getPageCount());
				}
			}catch (Exception e){
				logger.error("查询首页标签商品时出错");
			}
		} else {
			int pageCount = (Integer)CacheUtil.get(key+"PagerCount");
			List<Goods> allTagList = (List<Goods>)cacheValue;
			pager.setTotalCount( allTagList.size() );
			pager.setPageCount( pageCount );
			tagList = new ArrayList<Goods>(pager.getPageSize());
			for(int i = (pager.getPageSize() * (pager.getPageNumber() - 1)); i < pager.getPageNumber() * pager.getPageSize(); i++){
				if( allTagList.size() - i > 0){
					tagList.add( allTagList.get( i ) );
				}
			}
			pager.setList( tagList );

			return pager;

		}
		return pager;
	}

	/**
	 * Desc:判断是否为跨境商品
	 * Auth:zhangqiang
	 * Time:2016-01-29 14:53:25
	 * @param goodsList
	 * @return
	 */
	private List<Goods> getIfCrossborder(List<Goods> goodsList){
		String info = "获取商品是否为跨境商品";
		List<Goods> goodsCrossBorderList = new ArrayList<Goods>();
		try{
			if (goodsList.size() > 0 && goodsList != null) {
				for (int i=0;i<goodsList.size();i++) {
					Goods goods = goodsList.get(i);
					if(net.deepdragon.util.StringUtil.isNotEmpty(goods.getShopId()) && net.deepdragon.util.StringUtil.isNotEmpty(goods.getCategoryId())){
						if(CrossborderUtil.isShopCatelog(goods.getShopId(),goods.getCategoryId())){
							//1表示 为跨境商品
							goods.setCrossBorder("1");
						}else{
							goods.setCrossBorder("0");
						}
					}
					goodsCrossBorderList.add(goods);
				}
			}
		}catch (Exception e) {
			logger.error(info+"发生异常", e);
			e.printStackTrace();
		}
		return goodsCrossBorderList;
	}

	/**
	 * 缓存系统设置数据
	 * @param paramMap
	 * @param setKey
	 * @param isReFresh 是否刷新
	 * @return
	 */
	public String getSystemSetValueByKey(Map<String, Object> paramMap, SystemSetKey setKey, boolean isReFresh) {
		String key = CacheKeys.SYSTEM_SET_MAP.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		Object cacheValue = CacheUtil.get(key);
//		Object cacheValue = null;
		if (cacheValue == null || isReFresh) {
			try {
				List<SystemSet> list = systemSetService.getAll( paramMap );
				if( list != null && list.size() > 0 ){
					Map<String, String> systemSetMap = new HashMap<String, String>();
					for( SystemSet systemSet : list){
						systemSetMap.put( systemSet.getSetkey(), systemSet.getSetvalue() );
					}

					CacheUtil.set( key, systemSetMap, 30 * 60 );

					return systemSetMap.get(setKey.toString());
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			return ((Map<String, String>)cacheValue).get(setKey.toString());
		}

		return null;
	}

	public void getAllCatelog(Map<String,Object> paramMap,List<Catelog> catelogList,Map<String, List<Catelog>> catelogChildrenMap){
		String topCatelogKey = CacheKeys.NAV_CATELOGTOP_LIST.getKey();
		String childrenCatelogKey = CacheKeys.NAV_CATELOGCHILDREN_LIST.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			topCatelogKey += tenantId;
			childrenCatelogKey += tenantId;
		}

		Object cacheCatelogtopList = CacheUtil.get(topCatelogKey);
		Object cacheCatelogChildrenMap = CacheUtil.get(childrenCatelogKey);
		if( cacheCatelogtopList != null && cacheCatelogChildrenMap != null ){
			catelogList.addAll((List<Catelog>)cacheCatelogtopList);
			catelogChildrenMap.putAll((Map<String, List<Catelog>>)cacheCatelogChildrenMap);
		}else{
			List<Catelog> allCatelog = getCatelogList(paramMap);
			Map<String, Catelog> allCatelogMap = getCatelogMap(paramMap);

			List<Catelog> list = new ArrayList<Catelog>();
			Map<String, List<Catelog>> childrenMap = new HashMap<String, List<Catelog>>();
			for (Catelog catelog : allCatelog) {
				if (StringUtils.isEmpty(catelog.getParentId())) {
					list.add(catelog);
				} else {
					Catelog parent = allCatelogMap.get(catelog.getParentId());
					if (parent == null) {
						continue;
					}
					String key = parent.getId();
					if (childrenMap.get(key) == null) {
						childrenMap.put(key, new ArrayList<Catelog>());
					}
					childrenMap.get(key).add(catelog);
				}
			}

			CacheUtil.set(topCatelogKey, list);
			CacheUtil.set(childrenCatelogKey, childrenMap);

			catelogList.addAll(list);
			catelogChildrenMap.putAll(childrenMap);
		}

	}
}
