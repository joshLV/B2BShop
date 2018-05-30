package net.deepdragon.weipu.cache;

import java.util.*;

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
	private SystemSetService systemSetService;
	@Resource
	private GoodsBrandService goodsBrandService;

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
			criteria.add(Restrictions.limit("0","8"));
			criteria.add(Restrictions.eq(Constant.TENANTID_KEY,"37100"));
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,1));
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
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,1));
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
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,1));
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
                        data.put("articles", articlesService.getArticles(paramMap, sign, null, "orderNo", "asc"));
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
			criteria.add(Restrictions.order("orderNo", "ASC"));
			try {
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

	/**
	 * 首页获取新闻
	 * @param paramMap
	 * @param pager
     * @return
     */
	public Pager getIndexNews(Map<String, Object> paramMap, Pager pager) {
		String key = CacheKeys.INDEX_NEWS_LIST.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		Map<String, ArticlesCategory> map = null;
		Object cacheValue = CacheUtil.get(key);
		if (cacheValue == null) {

			List<Articles> list = getCategory(paramMap, pager);
			if (list != null && list.size() > 0) {
				CacheUtil.set(key, list, 60 * 10);//保存到缓存

				pager.setTotalCount(list.size());
				List<Articles> articlesList = new ArrayList<Articles>(pager.getPageSize());
				for (int i = (pager.getPageSize() * (pager.getPageNumber() - 1)); i < pager.getPageNumber() * pager.getPageSize(); i++) {
					if (list.size() - i > 0) {
						articlesList.add(list.get(i));
					}
				}
				pager.setList(articlesList);
			} else {
				pager.setList(null);
			}
		} else {
			List<Articles> list = (List<Articles>) cacheValue;

			pager.setTotalCount(list.size());
			List<Articles> articlesList = new ArrayList<Articles>(pager.getPageSize());
			for (int i = (pager.getPageSize() * (pager.getPageNumber() - 1)); i < pager.getPageNumber() * pager.getPageSize(); i++) {
				if (list.size() - i > 0) {
					articlesList.add(list.get(i));
				}
			}
			pager.setList(articlesList);
		}
		return pager;
	}

	/**
	 * 获取所有新闻
	 * @param paramMap
	 * @param pager
     * @return
     */
	private List<Articles> getCategory(Map<String, Object> paramMap, Pager pager) {
		try {
			ArticlesCategory category = articlesCategoryService.find(paramMap, "sign", "news");
			if (category != null) {

				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("tenantId", paramMap.get(Constant.TENANTID_KEY).toString()));
				criteria.add(Restrictions.eq("platform", Constant.PLATFORM_B2B));
				criteria.add(Restrictions.eq("categoryId", category.getId()));
				criteria.add(Restrictions.eq("isPublication", 1));
				criteria.add(Restrictions.order("isTop", "desc"));
				criteria.add(Restrictions.order("modifyDate", "desc"));
				criteria.add(Restrictions.order("createDate", "desc"));

				List<Articles> list = articlesService.getList(paramMap, criteria);

				return list;
			}
			return null;
		} catch (Exception ex) {
			logger.error("CacheData中getArticlesCategoryMap方法发生异常：", ex);
			return null;
		}
	}

	/**
	 * 缓存系统设置数据
	 * @param paramMap
	 * @param setKey
	 * @param isRefresh 是否刷新
	 * @return
	 */
	public String getSystemSetValueByKey(Map<String, Object> paramMap, SystemSetKey setKey,  boolean isRefresh) {
		String key = CacheKeys.SYSTEM_SET_MAP.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		Object cacheValue = CacheUtil.get(key);
		if (cacheValue == null || isRefresh) {
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


	/**
	 * 获取品牌
	 * @param paramMap
	 * @param pager
	 * @return
	 */
	public Pager getBrandByPager(Map<String, Object> paramMap, Pager pager) {
		String key = CacheKeys.ALL_BRAND_LIST.getKey();
		String tenantId = paramMap.get(Constant.TENANTID_KEY).toString();
		if (StringUtils.isNotEmpty(tenantId)) {
			key += tenantId;
		}
		Object cacheValue = CacheUtil.get(key);
		if (cacheValue == null) {

			try {
				Criteria criteria = new Criteria();
				criteria.add(Restrictions.order("createDate", "desc"));
				List<GoodsBrand> barndList = goodsBrandService.getList(paramMap, criteria);
				if (barndList != null && barndList.size() > 0) {
					CacheUtil.set(key, barndList, 60 * 10);//保存到缓存

					pager.setTotalCount(barndList.size());
					List<GoodsBrand> articlesList = new ArrayList<GoodsBrand>(pager.getPageSize());
					for (int i = (pager.getPageSize() * (pager.getPageNumber() - 1)); i < pager.getPageNumber() * pager.getPageSize(); i++) {
						if (barndList.size() - i > 0) {
							articlesList.add(barndList.get(i));
						}
					}
					pager.setList(articlesList);
				} else {
					pager.setList(null);
				}
			}catch (Exception e){
				logger.error("保存品牌数据到缓存：查询品牌时出错,"+e);
				pager.setList(null);
			}
		} else {
			List<GoodsBrand> list = (List<GoodsBrand>) cacheValue;

			pager.setTotalCount(list.size());
			List<GoodsBrand> brandList = new ArrayList<GoodsBrand>(pager.getPageSize());
			for (int i = (pager.getPageSize() * (pager.getPageNumber() - 1)); i < pager.getPageNumber() * pager.getPageSize(); i++) {
				if (list.size() - i > 0) {
					brandList.add(list.get(i));
				}
			}
			pager.setList(brandList);
		}
		return pager;
	}
}
