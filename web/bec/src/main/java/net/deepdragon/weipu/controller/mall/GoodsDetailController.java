package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.util.DateUtils;
import net.deepdragon.util.HTMLDomUtil;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.staticize.Staticize;
import net.deepdragon.weipu.tools.UploadTools;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.lf5.util.ResourceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.*;

/**
 * Created by haoxiaolei on 2014/7/10 0010. 网站商城商品详细页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "GoodsDetailController")
@RequestMapping(Global.MALL_PATH + "/goods")
public class GoodsDetailController extends BaseMallController {
	@Resource
	private GoodsService goodsService;
	@Resource
	private GoodsBrandService brandService;
	@Resource
	private GoodsParameterGroupService pGroupService;
	@Resource
	private GoodsParameterService parameterService;
	@Resource
	private GoodsImagesService goodsImgsService;
	@Resource
	private CatelogService catelogService;
	@Resource
	private MerchantService merchantService;
	@Resource
	private CacheData cacheData;
	@Resource
	private B2BBuyerHistoryService b2BBuyerHistoryService;
	@Resource
	private B2BGoodsAttentionService goodsAttentionService;
	@Resource
	private B2BGoodsReviewService goodsReviewService;
    @Resource
    private BuyerService buyerService;
	@Resource
	private TodayCommendService tcService;
	@Resource
	private CartItemService cartItemService;
	@Resource
	private B2BBuyerHistoryService historyService;
	@Resource
	private GoodsImagesService goodsImagesService;
	@Resource
	private SystemSetService systemSetService;
	@RequestMapping("/getGoodsDetail/{goodsId},{type}")
	@Staticize(name = "item",list = "item")
	public String getGoodsDetail(@PathVariable String goodsId, @PathVariable String type, Model model, HttpServletRequest request) {
		String info = "商城获取商品信息(" + goodsId + ")";
		setLogInfo(info);
		String tenantId = getTenantId();
        Goods goods = null;

        Map<String, List<Map<String, Object>>> goodsSpInfoMap = new HashMap<String, List<Map<String, Object>>>();
        Map<String, String> brandMap = new HashMap<String, String>();
        Map<String, List<GoodsParameter>> parameterMap = new HashMap<String, List<GoodsParameter>>();
        List<Map<String, String>> goodsParamList = new ArrayList<Map<String, String>>();
//        List<Map<String, String>> currSpItems = new ArrayList<Map<String, String>>();
        List<GoodsImages> goodsImagesList = new ArrayList<GoodsImages>();
        List<Map<String, Object>> breadcrumbCatList = new ArrayList<Map<String, Object>>();
        List<Catelog> refCatelogList = new ArrayList<Catelog>();
        List<GoodsBrand> brandRefList = new ArrayList<GoodsBrand>();
        Merchant shop = null;
        List<B2BGoodsReview> goodsReviewList = new ArrayList<B2BGoodsReview>();
        Map<String,Object> paramMap = getParamMap();
        if(StringUtil.isNotEmpty(getCurrentMember(request))) {
            paramMap.put("buyerId", getCurrentMember(request).getId());
        }
		try {
			if( "EANCode".equals(request.getParameter("idType"))){
				//goodsId:商品条形码
				List<Goods> goodsList = goodsService.findBarcodeGoods(paramMap, goodsId);
				if( goodsList != null && goodsList.size() >= 1){
					//商品信息
					goods = goodsList.get(0);
					// 商品id
					goodsId = goods.getId();
				}else{
					return "";
				}
			}else{
				goods = goodsService.get(paramMap, goodsId);
			}

			//start 获取商品价格区间  hks 2015-10-19
			List<B2BGoodsPrice> batchPrices =cartItemService.getGoodsTradePrice(getParamMap(), goodsId, null);
			model.addAttribute("batchPrices", batchPrices);
			if(batchPrices != null && batchPrices.size()> 0) {
				String lowerPrice = batchPrices.get(0).getBatchPrice();
				String biggerPrice = batchPrices.get(0).getBatchPrice();
				int startBatchNum = 0;
				for (B2BGoodsPrice b2BGoodsPrice : batchPrices) {
					BigDecimal price = new BigDecimal(b2BGoodsPrice.getBatchPrice());
					if (price.compareTo(new BigDecimal(lowerPrice)) == -1) {
						lowerPrice = price.toString();
					}
					if (price.compareTo(new BigDecimal(biggerPrice)) == 1) {
						biggerPrice = price.toString();
					}
					if( startBatchNum == 0 ){
						startBatchNum = b2BGoodsPrice.getStartBatchNum();
					}else if(startBatchNum > b2BGoodsPrice.getStartBatchNum() ){
						startBatchNum = b2BGoodsPrice.getStartBatchNum();
					}
				}

				/**  组装最大单价、最小单价 和 起批数量 TianYu 2016-3-14 13:53:42 Start**/
				goods.setMinBatchPrice( Double.parseDouble(lowerPrice) );
				goods.setMaxBatchPrice(Double.parseDouble(biggerPrice));
				goods.setStartBatchNum(startBatchNum);
				/**  组装最大单价、最小单价 和 起批数量 TianYu 2016-3-14 13:53:42 End**/

				if(new BigDecimal(lowerPrice).compareTo(new BigDecimal(biggerPrice))==0){
					goods.setBatchPrice(lowerPrice);
				}else{
					goods.setBatchPrice(lowerPrice+"~"+biggerPrice);
				}
			}

			/**
			 * Desc:获取爆款商品
			 * Auth:zhangqiang
			 * Time:2015-11-19 16:54:32
			 * Start
			 */
			getHisList(model, request,"6");
			getMaxSalesCountGoods(model, request,goods.getCategoryId());
			/**
			 * Desc:获取当前用户的浏览历史数据
			 * Auth:zhangqiang
			 * Time:2015-11-19 16:54:32
			 * End
			 */

			//end 获取商品价格区间  hks 2015-10-19

			/** 取消下架商品不组装商品参数设定  TianYu 2015-9-10 Start **/
//            boolean next = (getParameter(request, "b") != null && getParameter(request, "b").equals("true")) ? true : goods != null && goods.getIsMarketable() == 1;
			/** 取消下架商品不组装商品参数设定  TianYu 2015-9-10 End **/
			boolean next = true;
			if (next) {
				goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);
				/** 取消下架商品不组装商品规格设定  TianYu 2015-9-10 Start **/
				// 处理已经下架的商品，并去除
				/*if (goodsSpInfoMap != null && goodsSpInfoMap.size() > 0) {
					List<Map<String, Object>> willRemoveGoodsSpItemList = new ArrayList<Map<String, Object>>();
					List<Map<String, Object>> goodsSpItemList = goodsSpInfoMap.get("goodsSpItemList");
					if (goodsSpItemList != null && goodsSpItemList.size() > 0) {
						for (Map<String, Object> map : goodsSpItemList) {
							String _goodsId = map.get("goodsId").toString();
							Goods g = goodsService.get(tenantId, _goodsId);
							if (g.getIsMarketable() == 0) willRemoveGoodsSpItemList.add(map);
						}
						goodsSpItemList.removeAll(willRemoveGoodsSpItemList);
					}
				}*/
				/** 取消下架商品不组装商品规格设定  TianYu 2015-9-10 End **/
				brandMap = processBrand(getParamMap());

				parameterMap = processParameterList(getParamMap(), goods.getCategoryId());
				// 加载当前goods所拥有的参数列表,map里的key：parameterId，content，goodsId
				goodsParamList = (List<Map<String, String>>) goodsService.getGoodsParamsList(getParamMap(), "goodsId", goodsId);

				// 加载当前goods所有规格项
//				currSpItems = (List<Map<String, String>>) goodsService.getCurrentSpItems(tenantId, "goodsId", goodsId);


				// 加载当前goods的图片
				goodsImagesList = goodsImgsService.findList(getParamMap(), "goodsId", goodsId);
				// 加载商品对应的所有分类（L1/L2/L3三级分类）

				// 加载当前商品的前台分类的相关分类(兄弟分类)
				Criteria criteria = new Criteria();

				Catelog catelog = catelogService.getCatelogByGategory(getParamMap(), goods.getCategoryId());
				if(!catelog.getPath().contains(",")) {
					Map<String,Object> catelogs=new HashMap<String, Object>();
					catelogs.put("l1_id",catelog.getId());
					catelogs.put("l1_name",catelog.getName());
					catelogs.put("l2_id",null);
					catelogs.put("l2_name",null);
					catelogs.put("l3_id",null);
					catelogs.put("l3_name",null);
					catelogs.put("l4_id",catelog.getGrandfather());
					breadcrumbCatList.add(catelogs);

					criteria.add(Restrictions.eq("parentId", catelog.getId()));//(顶级)加载当前商品的前台分类的相关分类(兄弟分类)
				}else if(catelog.getPath().split(",").length==2){
					Catelog parentCatelog = catelogService.getCatelogByGategory(getParamMap(), catelog.getParentId());
					Map<String,Object> catelogs=new HashMap<String, Object>();

					/*
					 * dzz 20151127
					 * 因商品只有三级结构;1Lev-3Lev生成时与2Lev-3Lev生成有特殊情况,故此处采用特殊方法处理
					 */
					// 档商品ID的父级categoryID与自己本身的path第一位相等时
					if(catelog.getParentId().equals(catelog.getPath().split(",")[0])) {
						catelogs.put("l1_id",parentCatelog.getId());
						catelogs.put("l1_name",parentCatelog.getName());
						catelogs.put("l2_id",catelog.getId());
						catelogs.put("l2_name",catelog.getName());
						catelogs.put("l4_id",catelog.getGrandfather());

						criteria.add(Restrictions.eq("parentId", catelog.getParentId())); // (二级)加载当前商品的前台分类的相关分类(兄弟分类)
					} else {
						Catelog rootCatelog = catelogService.getCatelogByGategory(getParamMap(), parentCatelog.getParentId());
						catelogs.put("l1_id",rootCatelog.getId());
						catelogs.put("l1_name",rootCatelog.getName());
						catelogs.put("l2_id",parentCatelog.getId());
						catelogs.put("l2_name",parentCatelog.getName());
						catelogs.put("l3_id",catelog.getId());
						catelogs.put("l3_name",catelog.getName());
						catelogs.put("l4_id",catelog.getGrandfather());

						criteria.add(Restrictions.eq("parentId", rootCatelog.getId())); // (三级)加载当前商品的前台分类的相关分类(兄弟分类)
					}

					breadcrumbCatList.add(catelogs);
				}else {
					breadcrumbCatList = goodsService.getGoods4Category(getParamMap(), catelog.getId());

					criteria.add(Restrictions.eq("parentId", catelog.getParentId()));
				}
				// 加载当前商品的前台分类的相关分类(兄弟分类)
				criteria.add(Restrictions.eq("enabled", "1"));
				//				criteria.add(Restrictions.notEq("id", goods.getCategoryPath().split(",")[0]));
				criteria.add(Restrictions.notEq("path", catelog.getPath()));
				refCatelogList = catelogService.getList(getParamMap(), criteria);

				// 加载同类其他品牌
				brandRefList = goodsService.queryBrandListByRootId(getParamMap(), goods.getCategoryPath().split(",")[0]);

				// 加载商品所属店铺数据
				shop = merchantService.get(getParamMap(), goods.getShopId());
                // 加载评价
                goodsReviewList = goodsReviewService.findList(getParamMap(), "goodsId", goods.getId());

				/*for(GoodsReview goodsReview:goodsReviews){
					GoodsReview reply = goodsReviewService.getReply(goodsReview.getId());
					goodsReview.setReplyContent(reply.getContent());
					goodsReview.setReplyDate(reply.getCreateDate());
					goodsReviewList.add(goodsReview);
				}*/

				addToHistory(goodsId, request);
			}
			if(Global.WHICH_APP.equals(type) && !StringUtil.isEmpty(goods.getIntroduction())){
				String contextPath = request.getContextPath();
				goods.setIntroduction(HTMLDomUtil.imgLazyload(goods.getIntroduction(), contextPath, UploadTools.getImageServerAddress()));
				//goods.setIntroduction(HTMLDomUtil.imgLazyload(goods.getIntroduction(), contextPath, UploadTools.getImageServerAddress(), UploadTools.getImageServerType()));
			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}
        model.addAttribute("brandMap", brandMap);
        model.addAttribute("goods", goods);
        model.addAttribute("spInfoMap", goodsSpInfoMap);
        model.addAttribute("parameterMap", parameterMap);
        model.addAttribute("goodsParamList", goodsParamList);
//        model.addAttribute("currSpItems", JSON.toJSONString(currSpItems));
        model.addAttribute("goodsImagesList", goodsImagesList);
        model.addAttribute("breadcrumbCatList", breadcrumbCatList);
        model.addAttribute("refCatelogList", refCatelogList);
        model.addAttribute("brandRefList", brandRefList);
        model.addAttribute("shop", shop);
        model.addAttribute("goodsReviewList", goodsReviewList);

        // 缓存
		setPublicDate2Model(model);
		getAllCatelog(model);

		//2016-05-18 liuxiaobing 手机端商品详情是否开启开始-----------------------------------------
		String isEnable="NO";
		try {
			isEnable = systemSetService.find(getParamMap(), "setkey", "isEnable").getSetvalue();
		} catch (Exception e) {
			logger.error("获取系统配置参数isEnable" + "时，发生异常", e);
		}
		model.addAttribute("isEnable", isEnable);
		//2016-05-18 liuxiaobing 手机端商品详情是否开启结束-----------------------------------------

		//加载热销商品
		getHot(model);
		//商品评论、累计售出、库存 死值
		model.addAttribute("fixed","5233");

		//获取Session中是否有登录信息 没有则加标识 首页商品价格不可见
		Buyer buyer = getCurrentMember(request);
		if(!net.deepdragon.util.StringUtil.isNotEmpty(buyer)){
			model.addAttribute("priceHide", "hide");
		}

		/**
		 * Desc:区分是ECM端预览触发的还是EC/BEC端触发的
		 * Auth:zhangqiang
		 * Time:2015-12-01 12:52:25
		 */
		String showView = request.getParameter("showView");
		String retURL = "/detail";
		if (StringUtil.isNotEmpty(showView)) {
			if ("true".equals(showView)) {
				retURL = "/detailShowView";
				model.addAttribute("showView","success");
			}
		}

		/**
		 * Desc:获取此商品所属单品下的所有商品
		 * Auth:zhangqiang
		 * Time:2015-11-27 10:33:25
		 */
		if (StringUtil.isNotEmpty(goods.getProductId())) {
			goodsProductList(model, request,goods,showView);
		}

		model.addAttribute("goodsCategoryId",goods.getCategoryId());

		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/goodDetail";
		}else{
//			return Global.TEMPLATE_MALL + PATH + "/detail";
			return Global.TEMPLATE_MALL + PATH + retURL;
		}
	}

	/**
	 * Desc:获取此商品所属单品下的所有商品
	 * Auth:zhangqiang
	 * Time:2015-11-27 10:33:25
	 */
	private void goodsProductList(Model model, HttpServletRequest request,Goods goods,String showFlag){
		String info = "商城获取商品信息";
		setLogInfo(info);
		List<Goods> goodsProList = null;
		try{
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.ge("platform",2));
			if (!StringUtil.isNotEmpty(showFlag)) {
				criteria.add(Restrictions.eq("isMarketable", 1));
				criteria.add(Restrictions.eq("status", 5));
			}
			criteria.add(Restrictions.eq("isDelete", 1));
			criteria.add(Restrictions.eq("type", 0));
			criteria.add(Restrictions.eq("productId", goods.getProductId()));

			goodsProList = goodsService.getList(getParamMap(), criteria);
			model.addAttribute("goodsProductList",goodsProList);
		}catch (Exception e){
			logger.error(info + "时，发生异常", e);
		}

	}
	/**
	 * Desc:获取商品系统参数(国家;产地;保质期)-ec-gwq
	 * Auth:zhangqiang
	 * Time:2015-11-24 11:02:35
	 * Start
	 */
	@RequestMapping(value = "/ajaxGetGoodsSystemParameters", method = { RequestMethod.POST })
	public @ResponseBody
	Object ajaxGetGoodsSystemParameters(String goodsId){
		String info = "获取商品ID:"+goodsId+"的系统参数信息";
		setLogInfo(info);
		StringBuffer sb = new StringBuffer();
		StringBuffer sbParameters = new StringBuffer();
		List<Map<String, Object>> goodsSysParameterList = new ArrayList<Map<String, Object>>();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			if (StringUtil.isNotEmpty(goodsId)){
				goodsSysParameterList = goodsService.getGoodsSystemparameter(getParamMap(),goodsId);
				for (Map<String, Object> map : goodsSysParameterList) {
					for (String key : map.keySet()) {
						if ("国家".equals(map.get(key)) || "产地".equals(map.get(key)) || "保质期".equals(map.get(key))) {
							sb.append(map.get(key)+"##");
						}else{
							sb.append(map.get(key)+"#&");
						}
					}
				}

				if (sb.length() >0 ) {
					String[] paramsArr = sb.toString().split("##");
					for(int i=0;i<paramsArr.length;i++){
						String[] parameVal = paramsArr[i].toString().split("#&");
						if(parameVal.length>=2){
							sbParameters.append("&nbsp;&nbsp;&nbsp;&nbsp;"+parameVal[1]+"&nbsp;:&nbsp;");
							sbParameters.append(parameVal[0]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						}
					}
				}
			}
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "获取成功");
			result.put("sysParms", sbParameters.toString());
			return result;
		}catch (Exception e){
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取失败");
			return result;
		}
	}
	/**
	 * @desc 获取当前用户的浏览历史数据
	 * @Auth zhangqiang
	 * @Time 2015-11-19 16:52:35
	 * @param model
	 * @param request
	 * @throws Exception
	 */
	public void getHisList(Model model, HttpServletRequest request,String size) throws Exception {
		try {
//			Buyer member = getCurrentMember(request);
//			if (StringUtil.isNotEmpty(member)) {
//				List<B2BBuyerHistory> hisList = historyService.getListByBuyerId(getParamMap(), member.getId());
//				model.addAttribute("hisList", hisList);
//			}

			Criteria criteria = new Criteria();

			criteria.add(Restrictions.ge("a.platform", 2));
			criteria.add(Restrictions.eq("a.isMarketable", "1"));
			criteria.add(Restrictions.eq("a.status", "5"));
			criteria.add(Restrictions.eq("c.status", "1"));
			criteria.add(Restrictions.eq("c." + Constant.TENANTID_KEY, getTenantId()));
			criteria.add(Restrictions.eq("c." + Constant.PLATFORM_KEY, getPlatform()));

			criteria.add(Restrictions.group("a.id "));
			criteria.add(Restrictions.order("c.createDate", "desc"));
			criteria.add(Restrictions.limit("0", size));
			List<Goods> tcList = tcService.getTodayCommendGoodsNew(getParamMap(), criteria);

			model.addAttribute("tcGoodsList", tcList);
		}catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * @desc 获取当前商品分类下销量靠前的数据
	 * @Auth zhangqiang
	 * @Time 2015-11-19 16:52:35
	 * @param model
	 * @param request
	 * @throws Exception
	 */
	public void getMaxSalesCountGoods(Model model, HttpServletRequest request,String catelogId) throws Exception {
		List<Goods> goodsCatelogCountList = null;
		try {
			if (StringUtil.isNotEmpty(catelogId)) {
				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("isMarketable", 1));
				criteria.add(Restrictions.eq("status", 5));
				criteria.add(Restrictions.ge("platform",2));
				criteria.add(Restrictions.eq("categoryId", catelogId));
				criteria.add(Restrictions.order("sales", "DESC"));
				criteria.add(Restrictions.group("a.id"));
				criteria.add(Restrictions.limit("0", "8"));
				goodsCatelogCountList = goodsService.getGoodsCatelogCountList(getParamMap(), criteria);
				model.addAttribute("goodslist", goodsCatelogCountList);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}


	/**
	 * Desc:根据购买数量获取批发价 Auth:zhangqiang Time:2015-11-24 16:55:35 Start
	 */
	@RequestMapping("/getGoodsDetailBatchPrice/{goodsId}/{buyNum}")
	public @ResponseBody
	Object getGoodsDetailBatchPrice(@PathVariable String goodsId,@PathVariable String buyNum, HttpServletRequest request) {
		String info = "根据商品数量获取批发价";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		String batchPrice = "";
		String states = FALSE;
		try {
			List<B2BGoodsPrice> batchPriceList =cartItemService.getGoodsTradePrice(getParamMap(), goodsId, null);//查询此商品阶梯价集合
			List<B2BGoodsPrice> batchPrices =cartItemService.getGoodsTradePrice(getParamMap(), goodsId, Integer.parseInt(buyNum));//根据buyNum 查询对应阶梯的批发价

			if (batchPriceList.size() > 0) {
				batchPrice += batchPriceList.get(0).getBatchPrice();
				batchPrice += "~";
				batchPrice += batchPriceList.get(batchPriceList.size()-1).getBatchPrice();

				if (!"0".equals(buyNum) && batchPrices.size() > 0) {
					batchPrice = batchPrices.get(batchPrices.size()-1).getBatchPrice();
				}
				states = SUCCESS;
				result.put("batchPrice", batchPrice);
			}
//			if(batchPrices != null && batchPrices.size() > 0){
//				batchPrice = batchPrices.get(0).getBatchPrice();
//				states = SUCCESS;
//				result.put("batchPrice", batchPrice);
//			}
//			if(batchPriceList != null && batchPriceList.size() > 0){
//				if (Integer.parseInt(buyNum) > batchPriceList.get(0).getEndBatchNum()) {
//					batchPrice = batchPriceList.get(0).getBatchPrice();
//					states = SUCCESS;
//					result.put("batchPrice", batchPrice);
//				}
//			}
			result.put(STATUS, states);
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取失败");
			return result;
		}
		return result;
	}


	/**
	 *
	 * APP端获取商品详情
	 */
	@RequestMapping("/getGoodsDetailToApp/{goodsId}")
	public String getGoodsDetailToApp(@PathVariable String goodsId, Model model, HttpServletRequest request) {
		String info = "手机端商城获取商品信息(" + goodsId + ")";
		setLogInfo(info);
		String tenantId = getTenantId();
		Goods goods = null;
		Map<String, List<Map<String, Object>>> goodsSpInfoMap = new HashMap<String, List<Map<String, Object>>>();
		Map<String, String> brandMap = new HashMap<String, String>();
		Map<String, List<GoodsParameter>> parameterMap = new HashMap<String, List<GoodsParameter>>();
		List<Map<String, String>> goodsParamList = new ArrayList<Map<String, String>>();
		List<Map<String, String>> currSpItems = new ArrayList<Map<String, String>>();
		List<GoodsImages> goodsImagesList = new ArrayList<GoodsImages>();
		Merchant shop = null;
		List<B2BGoodsReview> goodsReviewList = new ArrayList<B2BGoodsReview>();
		try {
			goods = goodsService.get(getParamMap(), goodsId);
//			boolean next = (getParameter(request, "b") != null && getParameter(request, "b").equals("true")) ? true : goods != null && goods.getIsMarketable() == 1;
			boolean next = true;
			if (next) {
				goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);
				/** 取消下架商品不组装商品参数设定  TianYu 2015-9-10 Start **/
				// 处理已经下架的商品，并去除
				/*if (goodsSpInfoMap != null && goodsSpInfoMap.size() > 0) {
					List<Map<String, Object>> willRemoveGoodsSpItemList = new ArrayList<Map<String, Object>>();
					List<Map<String, Object>> goodsSpItemList = goodsSpInfoMap.get("goodsSpItemList");
					if (goodsSpItemList != null && goodsSpItemList.size() > 0) {
						for (Map<String, Object> map : goodsSpItemList) {
							String _goodsId = map.get("goodsId").toString();
							Goods g = goodsService.get(tenantId, _goodsId);
							if (g.getIsMarketable() == 0) willRemoveGoodsSpItemList.add(map);
						}
						goodsSpItemList.removeAll(willRemoveGoodsSpItemList);
					}
				}*/
				/** 取消下架商品不组装商品参数设定  TianYu 2015-9-10 End **/
				brandMap = processBrand(getParamMap());
				parameterMap = processParameterList(getParamMap(), goods.getCategoryId());
				// 加载当前goods所拥有的参数列表,map里的key：parameterId，content，goodsId
				goodsParamList = (List<Map<String, String>>) goodsService.getGoodsParamsList(getParamMap(), "goodsId", goodsId);
				// 加载当前goods所有规格项
				currSpItems = (List<Map<String, String>>) goodsService.getCurrentSpItems(getParamMap(), "goodsId", goodsId);
				// 加载当前goods的图片
				goodsImagesList = goodsImgsService.findList(getParamMap(), "goodsId", goodsId);
				// 加载商品所属店铺数据
				shop = merchantService.get(getParamMap(), goods.getShopId());
				// 加载评价
				goodsReviewList = goodsReviewService.findList(getParamMap(), "goodsId", goods.getId());

				addToHistory(goodsId, request);
			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}
		model.addAttribute("brandMap", brandMap);
		model.addAttribute("goods", goods);
		model.addAttribute("spInfoMap", goodsSpInfoMap);
		model.addAttribute("parameterMap", parameterMap);
		model.addAttribute("goodsParamList", goodsParamList);
		model.addAttribute("currSpItems", JSON.toJSONString(currSpItems));
		model.addAttribute("goodsImagesList", goodsImagesList);
		model.addAttribute("shop", shop);
		model.addAttribute("goodsReviewList", goodsReviewList);
		// 缓存
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		getAllCatelog(model);

		//加载热销商品
		getHot(model);
		//商品评论、累计售出、库存 死值
		model.addAttribute("fixed","5233");

		return Global.TEMPLATE_APP + PATH + "/goodDetail";
	}


	/**
	 *
	 * APP端获取商品参数详情
	 */
	@RequestMapping(value="/getGoodsDetailTypeToApp" , method = { RequestMethod.POST })
	@ResponseBody
	public String getGoodsDetailTypeToApp(String goodsId, Model model, HttpServletRequest request) {
		String info = "手机端商城获取商品参数信息(" + goodsId + ")";
		setLogInfo(info);
		Map<String, List<Map<String, Object>>> goodsSpInfoMap = new HashMap<String, List<Map<String, Object>>>();
		try {
			boolean next = true;
			if (next) {
				goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);

			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}
		return  JSON.toJSONString(goodsSpInfoMap);
	}

	/**
	 * 热销商品
	 * @param model
	 */
	private void getHot(Model model) {
		List<Goods> hotList=null;
		try{
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
			hotList = goodsService.getTagGoods4Index(getParamMap(), "hot", 4, getPlatform());
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  end **/
		}catch (Exception e){
			logger.error("GoodsDetialController中getHot方法，发生异常：", e);
		}
		model.addAttribute("hotList",hotList);
	}



	/**
	 * 处理品牌数据成map
	 * 
	 * @param paramMap
	 */
	private Map<String, String> processBrand(Map<String, Object> paramMap) throws Exception {
		Map<String, String> brandMap = new HashMap<String, String>();
		Criteria brandCriteria = new Criteria();
		brandCriteria.add(Restrictions.eq("enabled", 1));
		List<GoodsBrand> brandList = brandService.getList(paramMap, brandCriteria);
		if (brandList != null && brandList.size() > 0) {
			for (GoodsBrand brand : brandList) {
				brandMap.put(brand.getId(), brand.getName());
			}
		}

		return brandMap;
	}

	private Map<String, List<GoodsParameter>> processParameterList(Map<String, Object> paramMap, String categoryId) throws Exception {
		Map<String, List<GoodsParameter>> resultMap = new HashMap<String, List<GoodsParameter>>();
		List<GoodsParameterGroup> groupList = null;
		Criteria c = new Criteria();
		c.add(Restrictions.eq("categoryId", categoryId));
		c.add(Restrictions.eq("enabled", 1));
		groupList = pGroupService.getList(paramMap, c);
		for (GoodsParameterGroup group : groupList) {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("groupId", group.getId()));
			List<GoodsParameter> parameterList = parameterService.getList(paramMap, criteria);
			//防止分组名称相同引起参数缺失
			resultMap.put(group.getId()+'_'+group.getName(), parameterList);
		}

		return resultMap;
	}

	// 加入到浏览历史表中
	public void addToHistory(String goodsId, HttpServletRequest request) {
		try {
			Goods goods = goodsService.get(getParamMap(), goodsId);
			if (goods != null) {
				Buyer mb = getCurrentMember(request);
				if (mb != null && mb.getId() != null) {
					try {
						b2BBuyerHistoryService.saveHistoryValues(getParamMap(), mb.getId(), goodsId);
						logger.debug("加入到浏览历史成功");
					} catch (Exception e) {
						logger.error("加入到浏览历史失败", e);
					}
				}
			}
		} catch (Exception e1) {
			logger.error("根据商品ID查询商品失败", e1);
		}
	}

	// 加入到关注列表中
	@RequestMapping(value = "/addToGoodsAttention")
	public @ResponseBody
	Object addToGoodsAttention(HttpServletRequest request) {
		String info = "加入到关注列表";
		setLogInfo(info);
		String goodsId = request.getParameter("goodsId");
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Buyer mb = getCurrentMember(request);

			if( mb == null ){
				result.put(STATUS, "NOLOGIN");
				result.put(MESSAGE, "关注失败");
				return result;
			}

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.buyerId", mb.getId()));
			criteria.add(Restrictions.eq("c.goodsId", goodsId));
			List<B2BGoodsAttention> list = goodsAttentionService.getList(getParamMap(), criteria);

			if (list == null || list.size() == 0) {
				if (net.deepdragon.util.StringUtil.isNotEmpty(mb) && net.deepdragon.util.StringUtil.isNotEmpty(mb.getId())) {
					goodsAttentionService.saveHistoryValues(getParamMap(), mb.getId(), mb.getUserName(), goodsId);
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "关注成功");
				} else {
					result.put(STATUS, WARN);
					result.put(MESSAGE, "请先登录");
				}
			} else {
				result.put(STATUS, WARN);
				result.put(MESSAGE, "您已经关注过该商品");
			}
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "关注失败");
			return result;
		}
	}


	@RequestMapping(value = "/getParamNoGroup", method = {RequestMethod.POST})
	public
	@ResponseBody
	Map<String, Object> getParamNoGroup(String goodsId, HttpServletRequest request) {

		Map<String, Object> result = new HashMap<String, Object>();
		try {

			List<Map<String, Object>> params = this.parameterService.getParamNoGroup(getParamMap(), goodsId);

			result.put("params", params);
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "查询参数成功");
		} catch (Exception e) {
			logger.error("会员登录校验时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "会员登录校验时，发生异常");
		}
		return result;
	}
	//ajax 添加到浏览历史
	@RequestMapping(value = "/ajaxaddToHistory", method = { RequestMethod.POST })
	public @ResponseBody
	Object ajaxaddToHistory(String goodsId,HttpServletRequest request){
		String info = "获取商品ID:"+goodsId+"的系统参数信息";
		setLogInfo(info);
		StringBuffer sb = new StringBuffer();
		StringBuffer sbParameters = new StringBuffer();
		List<Map<String, Object>> goodsSysParameterList = new ArrayList<Map<String, Object>>();
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Goods goods = goodsService.get(getParamMap(), goodsId);
			if (goods != null) {
				Buyer mb = getCurrentMember(request);
				if (mb != null && mb.getId() != null) {
					try {
						historyService.saveHistoryValues(getParamMap(), mb.getId(), goodsId);
						logger.debug("加入到浏览历史成功");
					} catch (Exception e) {
						logger.error("加入到浏览历史失败", e);
					}
				}
			}
			result.put(STATUS, SUCCESS);
			return result;
		}catch (Exception e){
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			return result;
		}
	}


	// APP判断商品是否已关注
	@RequestMapping(value = "/isGoodsAttention")
	public @ResponseBody
	Object isGoodsAttention(HttpServletRequest request) {
		String info = "是否关注";
		setLogInfo(info);
		String goodsId = request.getParameter("goodsId");
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Buyer mb = getCurrentMember(request);
			if( mb == null ){
				result.put(STATUS, "NOLOGIN");
				result.put(MESSAGE, "关注失败");
				return result;
			}
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("c.buyerId", mb.getId()));
			criteria.add(Restrictions.eq("c.goodsId", goodsId));
			List<B2BGoodsAttention> list = goodsAttentionService.getList(getParamMap(), criteria);

			if (list == null || list.size() == 0) {
			} else {
				result.put(STATUS, WARN);
				result.put(MESSAGE, "您已经关注过该商品");
			}
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "关注失败");
			return result;
		}
	}

    /**
     * 获取商品的评价内容
     *
     * @param goodsId 商品Id
     *
     * @return 评价详细内容
     */
    @RequestMapping("getGoodsReviewList/{goodsId}")
    @ResponseBody
    public Object getGoodsReviewList(@PathVariable String goodsId, String orderSn,String memberId, HttpServletRequest request) {
        List<B2BGoodsReview> goodsReviewList = null;
        String tenantId = getTenantId();
        List<Map<String, Object>> resultMapList = new ArrayList<Map<String, Object>>();
        // 加载评价
        try {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("goodsId", goodsId));

			if(StringUtil.isNotEmpty(memberId)){
				criteria.add(Restrictions.eq("buyerId", memberId));
			}
			if(StringUtil.isNotEmpty(orderSn)){
				criteria.add(Restrictions.eq("orderSn", orderSn));
			}


			goodsReviewList = goodsReviewService.getList(getParamMap(), criteria);
            if (goodsReviewList != null && goodsReviewList.size() > 0) {
                for (B2BGoodsReview review : goodsReviewList) {
					List list = new ArrayList();
                    Buyer member = buyerService.get(getParamMap(), review.getBuyerId());
                    Map<String,Object> map = JSON.parseObject(JSON.toJSONString(review), Map.class);
//					List<B2BGoodsReview> replyList= goodsReviewService.getReply(getParamMap(),review.getId());
					Criteria ca = new Criteria();
					ca.add(Restrictions.eq("parentId", review.getId()));
					ca.add(Restrictions.order("createDate", "ASC"));
					List<B2BGoodsReview> replyList = goodsReviewService.getAllByCriteria(getParamMap(), ca);
					if(member.getCompanyName()==null){
						map.put("nickName","公司名称保密");
					}else {
						map.put("nickName", member.getCompanyName());
					}
					map.put("buyDateStr", DateUtils.dateToString(review.getBuyDate(), "yyyy-MM-dd HH:mm"));
					map.put("cdStr", DateUtils.dateToString(review.getCreateDate(), "yyyy-MM-dd HH:mm"));
					for (int i=0;i<replyList.size();i++) {
						Map<String,Object> maps = new LinkedHashMap<String, Object>();

						if(replyList.get(i) != null) {
							maps.put("whichSys", replyList.get(i).getWhichSys());//ec会员 mcm商家 ecm商城
							maps.put("replyContent", replyList.get(i).getContent());
							maps.put("replyDate", DateUtils.dateToString(replyList.get(i).getCreateDate(), "yyyy-MM-dd HH:mm"));
						}
						list.add(maps);
					}
					map.put("maps", list);
					resultMapList.add(map);
                }
            }
        } catch (Exception e) {
            logger.error("获取评价列表时，发生异常", e);
        }

        return resultMapList;
    }

	/**
	 * Desc:获取商品评论次数，商品详情页静态化使用
	 * Auth:zhangqiang
	 * Time:2016-01-18 14:07:35
	 * Start
	 */
	@RequestMapping(value = "/ajaxGetGoodsReviewSize", method = { RequestMethod.POST })
	public @ResponseBody
	Object ajaxGetGoodsReviewSize(String goodsId){
		String info = "获取商品ID:"+goodsId+"的评论次数";
		setLogInfo(info);
		List<B2BGoodsReview> goodsReviewList = new ArrayList<B2BGoodsReview>();
		Map<String, Object> result = new HashMap<String, Object>();
		String state = "";
		String message = "";
		try {
			if (StringUtil.isNotEmpty(goodsId)){
				goodsReviewList = goodsReviewService.findList(getParamMap(), "goodsId", goodsId);
				if (goodsReviewList.size() >= 0) {
					state = SUCCESS;
					message = "获取成功";
					result.put("goodsReviewSize", goodsReviewList.size());
				}else{
					state = ERROR;
					message = "获取失败";
				}
			}else{
				state = ERROR;
				message = "获取失败";
			}
			result.put(STATUS, state);
			result.put(MESSAGE, message);
			return result;
		}catch (Exception e){
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取失败");
			return result;
		}
	}

	/**
	 * Desc:获取浏览历史
	 * Auth:zhangqiang
	 * Time:2016-01-19 11:36:35
	 * Start
	 */
	@RequestMapping(value = "/ajaxGethistory", method = { RequestMethod.POST })
	public @ResponseBody
	Object ajaxGethistory(HttpServletRequest request){
		String info = "获取浏览历史商品";
		setLogInfo(info);
		List<B2BBuyerHistory> hisList = new ArrayList<B2BBuyerHistory>();
		Map<String, Object> result = new HashMap<String, Object>();
		String state = "";
		String message = "";
		try {
			Buyer member = getCurrentMember(request);
			if (StringUtil.isNotEmpty(member)) {
				hisList = historyService.getListByBuyerId(getParamMap(), member.getId());
				state = SUCCESS;
				message = "获取成功";
				result.put("list",hisList);
			}else{
				state = ERROR;
				message = "获取失败";
			}
			result.put(STATUS, state);
			result.put(MESSAGE, message);
			return result;
		}catch (Exception e){
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取失败");
			return result;
		}
	}

	/**
	 * Desc:获取爆款
	 * Auth:zhangqiang
	 * Time:2016-01-19 11:36:35
	 * Start
	 */
	@RequestMapping(value = "/ajaxGetCommend", method = { RequestMethod.POST })
	public @ResponseBody
	Object ajaxGetCommend(HttpServletRequest request){
		String info = "获取爆款商品";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Criteria criteria = new Criteria();

			criteria.add(Restrictions.ge("a.platform", 2));
			criteria.add(Restrictions.eq("a.isMarketable", "1"));
			criteria.add(Restrictions.eq("a.status", "5"));
			criteria.add(Restrictions.eq("c.status", "1"));
			criteria.add(Restrictions.eq("c." + Constant.TENANTID_KEY, getTenantId()));
			criteria.add(Restrictions.eq("c." + Constant.PLATFORM_KEY, getPlatform()));

			criteria.add(Restrictions.group("a.id "));
			criteria.add(Restrictions.order("c.createDate", "desc"));
			criteria.add(Restrictions.limit("0", "6"));

			List<Goods> tcList = tcService.getTodayCommendGoodsNew(getParamMap(), criteria);

			result.put("list",tcList);
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "获取成功");
		}catch (Exception e){
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取失败");
			return result;
		}
		return result;
	}

	/**
	 * @desc 获取当前商品分类下销量靠前的数据
	 * @Auth zhangqiang
	 * @Time 2015-11-19 16:52:35
	 */
	@RequestMapping(value = "/ajaxGetMaxSalesCountGoods", method = { RequestMethod.POST })
	public @ResponseBody
	Object ajaxGetMaxSalesCountGoods(HttpServletRequest request){
		String info = "获取商品分类下销量靠前的数据";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String catelogId = request.getParameter("ajaxCatelogId");
			String goodsId = request.getParameter("gid");
			if (StringUtil.isNotEmpty(catelogId)) {
				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("isMarketable", 1));
				criteria.add(Restrictions.eq("status", 5));
				criteria.add(Restrictions.ge("platform", 2));
				criteria.add(Restrictions.eq("categoryId", catelogId));
				criteria.add(Restrictions.order("sales", "DESC"));
				criteria.add(Restrictions.group("a.id"));
				criteria.add(Restrictions.limit("0", "10"));
				criteria.add(Restrictions.notEq("a.id",goodsId));
				List<Goods> goodsCatelogCountList = goodsService.getGoodsCatelogCountList(getParamMap(), criteria);

				result.put("list",goodsCatelogCountList);
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "获取成功");
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "获取失败");
			}

		}catch (Exception e){
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取失败");
			return result;
		}
		return result;
	}

}
