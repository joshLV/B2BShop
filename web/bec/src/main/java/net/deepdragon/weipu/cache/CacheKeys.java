package net.deepdragon.weipu.cache;

/**
 * 集中管理缓存的Key
 */
public enum CacheKeys {
	
	NAV_MIDDLE("middleNavigation", "中间导航", null), 
	NAV_BOTTOM("bottomNavigation", "底部导航", null),
	ARTICLES_CATEGORY_MAP("articlesCategoryMap", "文章分类", null),
	// 购物指南-shopping,配送方式-send,支付方式-pay,售后服务-saleservice,特色服务-characterService
	SERVICES("services", "服务信息", new String[] { "shopping", "send", "pay",
			"saleservice", "characterService","commonProblem" }),
	CATELOG_MAP("catelogMap","前台类目Map", null), 
	CATELOG_LIST("catelogList", "前台类目List", null),
	KEYWORDS_LIST("keywordsList", "热词List", null),
	NAV_CATELOGTOP_LIST("navCatelogtopList", "导航一级分类List", null),
	NAV_CATELOGCHILDREN_LIST("navCatelogchildrenList", "导航二三级分类Map", null),
	INDEX_NEWS_LIST("indexNewsList", "首页新闻List", null),
	SYSTEM_SET_MAP("systemSetMap", "系统设置Map", null),
	ALL_BRAND_LIST("allBrandList", "品牌List", null);


	private String key;// key
	private String description;// 描述
	private Object associatedData;// 关联数据
	
	private CacheKeys(String key, String description,Object associatedData) {
		this.key = key;
		this.description = description;
		this.associatedData = associatedData;
	}

	public String getKey() {
		return this.key;
	}

	public String getDescription() {
		return this.description;
	}

	public Object getAssociatedData() {
		return associatedData;
	}
}
