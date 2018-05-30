package net.deepdragon.weipu.controller.mall;

import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 店铺相关
 */
@Controller(Global.APP_SIGN + Global.MALL + "ShopExtendController")
@RequestMapping(Global.MALL_PATH + "/shop")
public class ShopExtendController extends BaseMallController {

	@Resource
	private CacheData cacheData;
	@Resource
	private MerchantService shopService;
	@Resource
    private GoodsService goodsService;
	@Resource
    private CatelogService catelogService;
	@Resource
	private MerchantSettingService merchantSettingService;
	@Resource
	private SystemSetService systemSetService;
	@Resource
	private MerchantAdvertisingService merchantAdvertisingService;
	@Resource
	private MerchantExtendService merchantExtendService;
	@Resource
	private IndexShopService indexShopService;
	/**
	 * 店铺访问入口
	 */
	@RequestMapping(value = "/{urlAddress}")
	public String index(@PathVariable String urlAddress, Model model, Pager pager,  HttpServletRequest request) {
		String info = "访问店铺[" + urlAddress + "]";
		setLogInfo(info);
		logger.debug(info);
		try {
			//店铺信息
			Merchant shop = shopService.find(getParamMap(), "urlAddress", urlAddress);
			model.addAttribute("shop", shop);
			String shopId = shop.getId();


			//店铺商品分类
			Map<String,Object> param = getParamMap();
			param.put(Constant.PLATFORM_KEY, "1");
			List<Catelog> catelogList = catelogService.getList4Shop(param, shopId);
			List<Catelog> parentCatelogList = new ArrayList<Catelog>();
			Map<String, List<Catelog>> childCatelogMap = new HashMap<String, List<Catelog>>();
			for(Catelog catelog : catelogList){
				String parentId = catelog.getParentId();
				if(childCatelogMap.get(parentId)==null){
					childCatelogMap.put(parentId, new ArrayList<Catelog>());
					Catelog parent = cacheData.getCatelogMap(getParamMap()).get(catelog.getParentId());
					if(parent!=null && !"".equals(parent)) {
					parentCatelogList.add(parent);
					}
				}
				childCatelogMap.get(parentId).add(catelog);
			}
			model.addAttribute("parentCatelogList", parentCatelogList);
			model.addAttribute("childCatelogMap", childCatelogMap);
			
			//获取店铺设置信息
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("shopId", shopId));
			List<MerchantSetting> merchantSettingList = merchantSettingService.getList(getParamMap(), criteria);
			Map<String, String> shopSettingMap = new HashMap<String, String>();
			for (MerchantSetting ms : merchantSettingList) {
				shopSettingMap.put(ms.getSetkey(), ms.getSetvalue());
			}
			
			SystemSet imageUrlSet = systemSetService.find(getParamMap(), "setkey", "imageUrl");
			//店铺Logo
			String shopLogo = StringUtils.isNotEmpty(shopSettingMap.get("pic")) ? imageUrlSet.getSetvalue() + shopSettingMap.get("pic") : null;
			model.addAttribute("shopLogo", shopLogo);
			//system.out.println(shopLogo);
			//头部广告
			boolean enableHeadAd = StringUtils.equalsIgnoreCase(shopSettingMap.get("enableHeadAd"), "on");
			model.addAttribute("enableHeadAd", enableHeadAd);
			if(enableHeadAd){
				criteria = new Criteria();
				criteria.add(Restrictions.eq("shopId", shopId));
				criteria.add(Restrictions.eq("orderNo", 1));
				criteria.add(Restrictions.order("modifyDate", "desc"));
				criteria.add(Restrictions.order("createDate", "desc"));
				List<MerchantAdvertising> list = merchantAdvertisingService.getList(getParamMap(), criteria);
				MerchantAdvertising merchantAdvertising = null;
				if (list != null && list.size() > 0) {
					merchantAdvertising = list.get(0);
				}

				if(StringUtil.isNotEmpty(merchantAdvertising.getUrl()) && merchantAdvertising.getUrl().indexOf("http://")!=0){
					merchantAdvertising.setUrl("http://" + merchantAdvertising.getUrl());
				}
				List<String> imgList=new ArrayList<String>();
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage())) {
					imgList.add(merchantAdvertising.getImage());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage1())) {
					imgList.add(merchantAdvertising.getImage1());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage2())) {
					imgList.add(merchantAdvertising.getImage2());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage3())) {
					imgList.add(merchantAdvertising.getImage3());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage4())) {
					imgList.add(merchantAdvertising.getImage4());
				}
				model.addAttribute("imglist",imgList);
				model.addAttribute("headAd", merchantAdvertising);
				logger.info("headAd:" + merchantAdvertising);
			}
			logger.info("shopId:" + shopId);
			logger.info("shopLogo:" + shopLogo);
			logger.info("enableHeadAd:" + enableHeadAd);
			
			//掌柜推荐(掌柜推荐-highRecommended)
			String tagSign = "highRecommended";
			String b2b_highRecommendedtagSign = "B2B_highRecommended";
			int size = 4;
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
			List<Goods> recommendGoodsList = goodsService.getTagGoods4Shop(getParamMap(), shopId, b2b_highRecommendedtagSign, size, getWhichPlat());
			if(recommendGoodsList.size()<=0){
				recommendGoodsList = goodsService.getTagGoods4Shop(getParamMap(), shopId, tagSign, size, getWhichPlat());
			}
			model.addAttribute("recommendGoodsList", recommendGoodsList);
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
			//商品列表
			criteria = new Criteria();
            criteria.add(Restrictions.eq("isMarketable", 1));
            criteria.add(Restrictions.eq("shopId", shopId));
			criteria.add(Restrictions.eq("status", 5));
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
			criteria.add(Restrictions.gt("platform",1));
			criteria.add(Restrictions.eq("type",0));//2016-05-17 liuxiaobing bug:0003592: 建议在首页搜索时和商家店铺页面屏蔽掉众筹商品
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
			criteria.add(Restrictions.order("a.createDate", "DESC"));
			if(StringUtils.isNotEmpty(request.getParameter("pageSize"))){
				pager.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
			}else{
				pager.setPageSize(12);
			}
            pager = goodsService.getPager(getParamMap(), criteria, pager);
			/** 组装阶梯价 TianYu 2015-12-28 14:43:11 Start */
			if( pager.getList() != null && pager.getList().size() > 0 ){
				pager.setList(getGoodsBatchPrice((List<Goods>) pager.getList()));
			}
			/** 组装阶梯价 TianYu 2015-12-28 14:43:11 End */
            model.addAttribute("pager", pager);

			Buyer buyer = getCurrentMember(request);
			if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
				model.addAttribute("priceHide", "hide");
			}else {
				model.addAttribute("member", buyer);
			}

			model.addAttribute("imageUrlSet", imageUrlSet.getSetvalue());
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}
		model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		model.addAttribute("type","shop");
		getAllCatelog(model);
		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/brand_list_info";
		}
		return Global.TEMPLATE_MALL + PATH + "/shop/default/index";
	}
	/**
	 * 店铺介绍
	 */
	@RequestMapping(value = "/detail/{urlAddress}")
	public String detail(@PathVariable String urlAddress, Model model) {
		String info="访问店铺介绍["+urlAddress+"]";
		setLogInfo(info);
		logger.debug(info);

		try {
			//店铺信息
			Merchant shop = shopService.find(getParamMap(), "urlAddress", urlAddress);
			model.addAttribute("shop", shop);
			String shopId = shop.getId();
			MerchantExtend merchantExtend = merchantExtendService.find(getParamMap(),"merchantId",shopId);
			if(null != merchantExtend && !"".equals(merchantExtend)){
				model.addAttribute("introduce",merchantExtend.getIntroduce());
			}
			//店铺商品分类
			Map<String,Object> param = getParamMap();
			param.put(Constant.PLATFORM_KEY, "1");
			List<Catelog> catelogList = catelogService.getList4Shop(param, shopId);
			List<Catelog> parentCatelogList = new ArrayList<Catelog>();
			Map<String, List<Catelog>> childCatelogMap = new HashMap<String, List<Catelog>>();
			for(Catelog catelog : catelogList){
				String parentId = catelog.getParentId();
				if(childCatelogMap.get(parentId)==null){
					childCatelogMap.put(parentId, new ArrayList<Catelog>());
					Catelog parent = cacheData.getCatelogMap(getParamMap()).get(catelog.getParentId());
					parentCatelogList.add(parent);
				}
				childCatelogMap.get(parentId).add(catelog);
			}
			model.addAttribute("parentCatelogList", parentCatelogList);
			model.addAttribute("childCatelogMap", childCatelogMap);

			//获取店铺设置信息
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("shopId", shopId));
			List<MerchantSetting> merchantSettingList = merchantSettingService.getList(getParamMap(), criteria);
			Map<String, String> shopSettingMap = new HashMap<String, String>();
			for (MerchantSetting ms : merchantSettingList) {
				shopSettingMap.put(ms.getSetkey(), ms.getSetvalue());
			}

			SystemSet imageUrlSet = systemSetService.find(getParamMap(), "setkey", "imageUrl");
			//店铺Logo
			String shopLogo = StringUtils.isNotEmpty(shopSettingMap.get("pic")) ? imageUrlSet.getSetvalue() + shopSettingMap.get("pic") : null;
			model.addAttribute("shopLogo", shopLogo);

			//头部广告
			boolean enableHeadAd = StringUtils.equalsIgnoreCase(shopSettingMap.get("enableHeadAd"), "true");
			model.addAttribute("enableHeadAd", enableHeadAd);
			if(enableHeadAd){
				criteria = new Criteria();
				criteria.add(Restrictions.eq("shopId", shopId));
				criteria.add(Restrictions.eq("orderNo", 1));
				criteria.add(Restrictions.order("modifyDate", "desc"));
				criteria.add(Restrictions.order("createDate", "desc"));
				List<MerchantAdvertising> list = merchantAdvertisingService.getList(getParamMap(), criteria);
				MerchantAdvertising merchantAdvertising = null;
				if (list != null && list.size() > 0) {
					merchantAdvertising = list.get(0);
				}
				List<String> imgList=new ArrayList<String>();
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage())) {
					imgList.add(merchantAdvertising.getImage());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage1())) {
					imgList.add(merchantAdvertising.getImage1());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage2())) {
					imgList.add(merchantAdvertising.getImage2());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage3())) {
					imgList.add(merchantAdvertising.getImage3());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage4())) {
					imgList.add(merchantAdvertising.getImage4());
				}
				model.addAttribute("imglist",imgList);
				model.addAttribute("headAd", merchantAdvertising);
				logger.info("headAd:" + merchantAdvertising);
			}
			logger.info("shopId:" + shopId);
			logger.info("shopLogo:" + shopLogo);
			logger.info("enableHeadAd:" + enableHeadAd);

			//商品列表
			criteria = new Criteria();
			criteria.add(Restrictions.eq("isMarketable", 1));
			criteria.add(Restrictions.eq("status", 5));
			criteria.add(Restrictions.eq("shopId", shopId));
			criteria.add(Restrictions.order("a.createDate", "DESC"));

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}
		model.addAttribute("type","info");
		model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		getAllCatelog(model);
		return Global.TEMPLATE_MALL + PATH + "/shop/default/index";
	}
    /**
     * 分类查询店铺商品
     */
    @RequestMapping(value = "/goodsShop")
    public String getShopGoodsbyCatlogId( Model model, HttpServletRequest request,Pager pager) {
        String shopId = request.getParameter("shopId");
        String catlogId = request.getParameter("catlogId");
        try {
            //店铺信息
            Merchant shop = shopService.find(getParamMap(), "id", shopId);
            model.addAttribute("shop", shop);
            Catelog cateloge = catelogService.getCatelogByGategory(getParamMap(), catlogId);
            model.addAttribute("cateloge", cateloge);
            //获取店铺设置信息
            Criteria criteria1 = new Criteria();
            criteria1.add(Restrictions.eq("shopId", shopId));
            List<MerchantSetting> merchantSettingList = merchantSettingService.getList(getParamMap(), criteria1);
            Map<String, String> shopSettingMap = new HashMap<String, String>();
            for (MerchantSetting ms : merchantSettingList) {
                shopSettingMap.put(ms.getSetkey(), ms.getSetvalue());
            }

            SystemSet imageUrlSet = systemSetService.find(getParamMap(), "setkey", "imageUrl");
            //店铺Logo
            String shopLogo = StringUtils.isNotEmpty(shopSettingMap.get("pic")) ? imageUrlSet.getSetvalue() + shopSettingMap.get("pic") : null;
            model.addAttribute("shopLogo", shopLogo);
            //头部广告
            boolean enableHeadAd = StringUtils.equalsIgnoreCase(shopSettingMap.get("enableHeadAd"), "on");
            model.addAttribute("enableHeadAd", enableHeadAd);
            if(enableHeadAd){
                MerchantAdvertising merchantAdvertising = merchantAdvertisingService.find(getParamMap(), "shopId", shopId);

				if(StringUtil.isNotEmpty(merchantAdvertising.getUrl()) && merchantAdvertising.getUrl().indexOf("http://")!=0){
					merchantAdvertising.setUrl("http://" + merchantAdvertising.getUrl());
				}

				List<String> imgList=new ArrayList<String>();
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage())) {
					imgList.add(merchantAdvertising.getImage());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage1())) {
					imgList.add(merchantAdvertising.getImage1());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage2())) {
					imgList.add(merchantAdvertising.getImage2());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage3())) {
					imgList.add(merchantAdvertising.getImage3());
				}
				if(StringUtil.isNotEmpty(merchantAdvertising.getImage4())) {
					imgList.add(merchantAdvertising.getImage4());
				}
				model.addAttribute("imglist",imgList);
				model.addAttribute("headAd", merchantAdvertising);
                logger.error("headAd:" + merchantAdvertising);
            }
            //店铺商品分类
			Map<String,Object> param = getParamMap();
			param.put(Constant.PLATFORM_KEY, "1");
            List<Catelog> catelogList = catelogService.getList4Shop(param, shopId);
            List<Catelog> parentCatelogList = new ArrayList<Catelog>();
            Map<String, List<Catelog>> childCatelogMap = new HashMap<String, List<Catelog>>();
            for(Catelog catelog : catelogList){
                String parentId = catelog.getParentId();
                if(childCatelogMap.get(parentId)==null){
                    childCatelogMap.put(parentId, new ArrayList<Catelog>());
                    Catelog parent = cacheData.getCatelogMap(getParamMap()).get(catelog.getParentId());
                    parentCatelogList.add(parent);
                }
                childCatelogMap.get(parentId).add(catelog);
            }
            model.addAttribute("parentCatelogList", parentCatelogList);
            model.addAttribute("childCatelogMap", childCatelogMap);

			if(StringUtils.isNotEmpty(request.getParameter("pageSize"))){
				pager.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
			}else{
				pager.setPageSize(12);
			}
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.like("categoryPath", "%" + catlogId + "%"));
			criteria.add(Restrictions.eq("isMarketable", 1));
            criteria.add(Restrictions.eq("shopId", shopId));
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
			criteria.add(Restrictions.gt("platform",1));
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
			criteria.add(Restrictions.order("createDate", "DESC"));
			criteria.add(Restrictions.eq("status", 5));
            pager = goodsService.getPager(getParamMap(), criteria, pager);

			/** 组装阶梯价 TianYu 2015-12-28 14:43:11 Start */
			if( pager.getList() != null && pager.getList().size() > 0 ){
				pager.setList(getGoodsBatchPrice((List<Goods>) pager.getList()));
			}
			/** 组装阶梯价 TianYu 2015-12-28 14:43:11 End */


            model.addAttribute("pager", pager);


			//掌柜推荐(掌柜推荐-highRecommended)
			String tagSign = "highRecommended";
			int size = 4;
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
			model.addAttribute("recommendGoodsList", goodsService.getTagGoods4Shop(getParamMap(), shopId, tagSign, size,getWhichPlat()));
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/

			Buyer buyer = getCurrentMember(request);
			if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
				model.addAttribute("priceHide", "hide");
			}else {
				model.addAttribute("member", buyer);
			}

			model.addAttribute("imageUrlSet",systemSetService.find(getParamMap(), "setkey", "imageUrl").getSetvalue());

        } catch (Exception e) {
            logger.error("根据分类查询店铺商品信息时");
            e.printStackTrace();
        }

        model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
        model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
        model.addAttribute("services", cacheData.getServices(getParamMap()));
		model.addAttribute("type","result");
		model.addAttribute("catlogId",catlogId);
		getAllCatelog(model);
        return Global.TEMPLATE_MALL + PATH + "/shop/default/index";
    }

	@RequestMapping(value = "/brandShop")
	public String brandShop( Model model, Pager pager, HttpServletRequest request) {
		try {
			Criteria criteria = new Criteria();

			if(StringUtils.isNotEmpty(request.getParameter("pageSize"))) {
				pager.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
			}else{
				pager.setPageSize(8);
			}
			criteria.add(Restrictions.order("wis.orderNo", "asc"));
			criteria.add(Restrictions.eq("wis."+Constant.TENANTID_KEY,getTenantId()));
			criteria.add(Restrictions.eq("wis."+Constant.PLATFORM_KEY,getPlatform()));
			pager = indexShopService.getPager(getParamMap(), criteria, pager);
			List<IndexShop> list = (List<IndexShop>)pager.getList();
			model.addAttribute("cls","app_shop");
			model.addAttribute("indexShopList", list);
			model.addAttribute("pager", pager);
		} catch (Exception e) {
			logger.error("IndexController中getData4IndexShop方法，发生异常：", e);
		}
		return Global.TEMPLATE_APP + PATH + "/brand_list";
	}

	@RequestMapping(value = "/brandShop/loadmore",  method = { RequestMethod.POST })
	public
	@ResponseBody
	Object brandShopLoadMore(HttpServletRequest request) {
		String info = "加载更多的品牌旗舰店";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "操作成功");
		try {
			Criteria criteria = new Criteria();

			Pager pager = new Pager();
			if(StringUtils.isNotEmpty(request.getParameter("pageSize"))){
				pager.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
			}else{
				pager.setPageSize(8);
			}
			pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
			criteria.add(Restrictions.order("wis.orderNo", "asc"));
			criteria.add(Restrictions.eq("wis."+Constant.TENANTID_KEY,getTenantId()));
			criteria.add(Restrictions.eq("wis."+ Constant.PLATFORM_KEY,getPlatform()));
			pager = indexShopService.getPager(getParamMap(), criteria, pager);
			List<IndexShop> list = (List<IndexShop>)pager.getList();

			result.put(DATA, list);
			result.put("pager", pager);
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
		}
		return result;
	}

	@RequestMapping(value = "/goods/loadmore", method = {RequestMethod.POST})
	public
	@ResponseBody
	Object goodsLoadMore(HttpServletRequest request) {
		String info = "加载更多的品牌旗舰店店内商品";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "操作成功");
		try {
			Pager pager = new Pager();
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("isMarketable", 1));
			criteria.add(Restrictions.eq("shopId", request.getParameter("shopId")));
			criteria.add(Restrictions.eq("status", 5));
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
			criteria.add(Restrictions.gt("platform", 1));
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
			criteria.add(Restrictions.order("a.createDate", "DESC"));
			if(StringUtils.isNotEmpty(request.getParameter("pageSize"))){
				pager.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
			}else{
				pager.setPageSize(12);
			}
			pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
			pager = goodsService.getPager(getParamMap(), criteria, pager);
			List<IndexShop> list = (List<IndexShop>)pager.getList();
			result.put(DATA, list);
			result.put("pager", pager);
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
		}
		return result;
	}

	/**
	 * Desc:获取商品的阶梯价
	 * Auth:zhangqiang
	 * Time:2015-11-26 11:44:35
	 * @param goodsList
	 * @return
	 */
	private List<Goods> getGoodsBatchPrice(List<Goods> goodsList){
		String info = "查看商品的阶梯价";
		setLogInfo(info);
		logger.debug(info);
		List<Goods> goodsBatchList = new ArrayList<Goods>();
		StringBuffer sb = new StringBuffer();
		try {
			for (int i=0;i<goodsList.size();i++) {
				Goods goods = goodsList.get(i);
				if(net.deepdragon.util.StringUtil.isNotEmpty(goods)){
					List<Map<String, Object>> goodsBatchsList = goodsService.getGoodsBatchPriceList(getParamMap(),"g.id", goods.getId());
					if (goodsBatchsList != null && goodsBatchsList.size() > 0) {
						for(Map<String, Object> map : goodsBatchsList){
							for(String k : map.keySet()){
								if(!"total".equals(k) && !"ypice".equals(k) && !"stock".equals(k)){
									sb.append(map.get(k));
								}
							}
						}
						goods.setBatchPrice(sb.toString());
						sb.setLength(0);
					}
				}
				goodsBatchList.add(goods);
			}
		}catch (Exception ex) {
			logger.error("查看商品的阶梯价时，发生异常。", ex);
			ex.printStackTrace();
		}
		return goodsBatchList;
	}

	public void getAllCatelog(Model model) {
		List<Catelog> list = new ArrayList<Catelog>();
		Map<String, List<Catelog>> childrenMap = new HashMap<String, List<Catelog>>();
		cacheData.getAllCatelog(getParamMap(),list,childrenMap);
		model.addAttribute("catelogList", list);
		model.addAttribute("catelogChildrenMap", childrenMap);
	}
}
