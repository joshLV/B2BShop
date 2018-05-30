package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.entity.cuxiao.MTPromotions;
import net.deepdragon.entity.cuxiao.Promotions;
import net.deepdragon.entity.cuxiao.PromotionsGoods;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.cuxiao.PromotionsGoodsService;
import net.deepdragon.service.cuxiao.PromotionsService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.Constant;
import net.deepdragon.util.DateUtils;
import net.deepdragon.util.HTMLDomUtil;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.staticize.Staticize;
import net.deepdragon.weipu.tools.CrossborderUtil;
import net.deepdragon.weipu.tools.UploadTools;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
	private HistoryService historyService;
	@Resource
	private GoodsAttentionService goodsAttentionService;
	@Resource
	private GoodsReviewService goodsReviewService;
    @Resource
    private MemberService memberService;
	@Resource
	private TodayCommendService tcService;
	@Resource
	private GoodsImagesService goodsImagesService;
	@Resource
	private SystemSetService systemSetService;
	@Resource
	private PromotionsGoodsService promotionsGoodsService;

	@Resource
	private ActivityFullcutService activityFullcutService;
	@Resource
	private ActivityFullcutItemService activityFullcutItemService;
	@Resource
	private ActivityDecreaseamountService activityDecreaseamountService;
	@Resource
	private PromotionsService promotionsService;


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
        List<GoodsReview> goodsReviewList = new ArrayList<GoodsReview>();
		List<ActivityFullcutItem> activityFullcutItems = new ArrayList<>();
		List<ActivityFullcut> activityFullcuts = new ArrayList<>();
		List<ActivityDecreaseamount> activityDecreaseamounts = new ArrayList<>();
		try {
			String isOpen = request.getParameter("isOpen");
			if(isOpen!=null && isOpen!="") {
				String promotionsId = request.getParameter("promotionsId");
				Promotions promotions= promotionsService.getPromotions(getParamMap(), promotionsId);
				model.addAttribute("isOpen",promotions.getIsOpen());
				model.addAttribute("promotionsId", promotionsId);
				if(promotions.getIsOpen().equals(Promotions.START)) {
					PromotionsGoods promotionsGoods = promotionsGoodsService.getPromotionsGoods(getParamMap(), goodsId, promotionsId);
					model.addAttribute("promotionsGoods", promotionsGoods);
				}
			}

			goods = goodsService.get(getParamMap(), goodsId);
			/** 添加秒杀、团购数据 TianYu 2016-07-12 15:18:15 Start **/
			String msOrTg = request.getParameter("mt");//m为秒杀,t为团购
			if( StringUtils.isNotEmpty( msOrTg ) ){
				String promotionsId = request.getParameter("promotionsId");
				String activityType = "seckill";

				if( "m".equals( msOrTg ) ){
					activityType = "seckill";
				}else if( "t".equals(msOrTg) ){
					activityType = "groupon";
				} else if("major".equals(msOrTg)) {//团购
					msOrTg = "z";
				}

				//1、查询组装好的活动数据
				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("id", promotionsId));
				Pager pager = new Pager();
				pager = promotionsService.getMxAndTgPager(getParamMap(), criteria, activityType, pager);

				MTPromotions mTPromotions = pager.getList() != null && pager.getList().size() > 0 ? (MTPromotions)pager.getList().get(0) : null;

				if(mTPromotions!=null && !"".equals(mTPromotions)) { //验证活动即将开始与正在进行

					//2、查询促销(团购)活动
					Promotions promotions = this.promotionsService.get(getParamMap(), promotionsId);

					//3、查询促销(团购)商品
					Criteria pgCriteria = new Criteria();
					pgCriteria.add(Restrictions.eq("promotionsId", promotions.getId()));
					pgCriteria.add(Restrictions.eq("goodsId", goodsId));

					List<PromotionsGoods> promotionsGoodsList = this.promotionsGoodsService.getList(getParamMap(), pgCriteria);
					PromotionsGoods promotionsGoods = new PromotionsGoods();
					if(promotionsGoodsList!=null && promotionsGoodsList.size()>0) {
						for(int i=0; i<promotionsGoodsList.size(); i++) {
							if(goodsId.equals(promotionsGoodsList.get(i).getGoodsId())) {
								promotionsGoods = promotionsGoodsList.get(i);
							}
						}
					}
					model.addAttribute("mTPromotions", mTPromotions);
					model.addAttribute("promotions", promotions);
					model.addAttribute("promotionsGoods", promotionsGoods);
					model.addAttribute("mt", msOrTg);
					model.addAttribute("promotionsId", promotionsId);

					//20160718 dzz 查询商品信息并更新商品价格为促销商品价格(当促销活动开始后, 更新商品价格信息为促销价)
					//if( "m".equals( msOrTg ) ){
						//20160811 dzz 秒杀活动暂无需求, 暂时不处理
//						activityType = "seckill";
					//}else if( "t".equals(msOrTg) ){
					if(pager!=null && pager.getList().size()>0) {
						MTPromotions obj = (MTPromotions) pager.getList().get(0);
						if("ing".equals(obj.getStatus().trim())) {
							if("create".equals(obj.getIsOpen().trim())) {//判断活动是否开始, 开始后则不进行更新
								promotions.setIsOpen("start");//设置活动为已开始状态
								promotionsService.update(getParamMap(), promotions);

								int newStartNum = promotionsGoods.getNewStartNum();    //新起买数量
								int newLimitNum = promotionsGoods.getNewLimitNum();    //新限购数量
								int newStock = promotionsGoods.getNewStock();    //新限购数量

								//20160805 dzz 同步商品原起购, 原限购数量 到 促销活动商品起购, 限购数量
								promotionsGoods.setOldStartNum(StringUtil.isNotEmpty(goods.getStartNum()) ? goods.getStartNum() : 0);
								promotionsGoods.setOldLimitNum(StringUtil.isNotEmpty(goods.getLimitNum()) ? goods.getLimitNum() : 0);
								promotionsGoods.setOldStock( goods.getStock()==null?0:goods.getStock().intValue() );
								promotionsGoodsService.update(getParamMap(), promotionsGoods);

								//20160805 daa 同步促销活动新起购, 新限购数量 到 商品中起购限购
								goods.setPrice(obj.getPromotionsPrice());//设置更新商品价位促销价
								goods.setStartNum(newStartNum);
								goods.setLimitNum(newLimitNum);
								goods.setStock(Double.parseDouble(newStock+""));
								goodsService.update(getParamMap(), goods);
							}
						}  else if("after".equals(mTPromotions.getStatus().trim())) {
							if("start".equals(mTPromotions.getIsOpen().trim()) || "create".equals(mTPromotions.getIsOpen().trim())) {//判断活动是否结束, 结束状态则进行更新
								promotions.setIsOpen("end");//设置活动为已结束状态
								promotionsService.update(getParamMap(), promotions);

								int oldStartNum = promotionsGoods.getOldStartNum();    //原起买数量
								int oldLimitNum = promotionsGoods.getOldLimitNum();    //原限购数量
								int oldStock = promotionsGoods.getOldStock();    //原库存数量
								int newStock = promotionsGoods.getNewStock();    //原库存数量

								goods.setPrice(mTPromotions.getGoodsPrice());//设置商品价为原商品价
								goods.setStartNum(oldStartNum);
								goods.setLimitNum(oldLimitNum);
								goods.setStock( oldStock - (newStock - goods.getStock() ) );
								goodsService.update(getParamMap(), goods);
							}
						}
					}
				//	}

					//验证促销活动获悉相关验证信息
					/*Criteria c = new Criteria();
					c.add(Restrictions.eq("promotionsId", promotionsId));
					if(StringUtil.isNotEmpty(getCurrentMember(request))) {
						c.add(Restrictions.eq("memberId", getCurrentMember(request).getId()));
					}*/
					List<MTPromotions> countList = promotionsService.getCountPromotions(getParamMap(), promotionsId, goodsId, getCurrentMember(request)==null?null:getCurrentMember(request).getId());
					if(countList!=null && countList.size()>0) {
						model.addAttribute("validObj", countList.get(0));
					} else {
						MTPromotions obj = new MTPromotions();
						obj.setStartNum(StringUtil.isNotEmpty(goods.getStartNum()) ? goods.getStartNum() : 0);
						obj.setLimitNum(StringUtil.isNotEmpty(goods.getLimitNum()) ? goods.getLimitNum() : 0);
						obj.setQuantity(0);
						model.addAttribute("validObj", obj);
					}

					//统计当前用户下单订单数量为多少
					/*Criteria c2 = new Criteria();
					Map<String, Object> paramMap = new HashMap<String, Object>(0);
					paramMap = getParamMap();
					paramMap.put("promotionsId", mTPromotions.getId());
					if(StringUtil.isNotEmpty(getCurrentMember(request))) {
						paramMap.put("memberId", getCurrentMember(request).getId());
					}
					List<MTPromotions> countResult = promotionsService.getCountPromotionsOrder(paramMap, c2);*/
					List<MTPromotions> countResult = promotionsService.getCountPromotions(getParamMap(), mTPromotions.getId(), goodsId, getCurrentMember(request)==null?null:getCurrentMember(request).getId());
					if(countResult!=null && countResult.size()>0) {
						model.addAttribute("resultNum", countResult.get(0).getResultCount());
					} else {
						model.addAttribute("resultNum", 0);
					}

				} else {//验证活动已结束情况
					return "redirect:/item/"+goodsId+".html";
				}

			} else {
				//20160802 dzz 根据商品id查询对应的活动类型信息
				Criteria c1 = new Criteria();
				c1.add(Restrictions.eq("goodsId", goodsId));
				Pager pager = new Pager();
				pager = promotionsService.getMxAndTgPager(getParamMap(), c1, null, pager);

				if(pager.getList()!=null && pager.getList().size()>0) {
					MTPromotions mTPromotions = pager.getList() != null && pager.getList().size() > 0 ? (MTPromotions)pager.getList().get(0) : null;
					//2、查询促销(团购)活动
					Promotions promotions = this.promotionsService.get(getParamMap(), mTPromotions.getId());


					//3、查询促销(团购)商品
					Criteria pgCriteria = new Criteria();
					pgCriteria.add(Restrictions.eq("promotionsId", promotions.getId()));
					pgCriteria.add(Restrictions.eq("goodsId", goodsId));

					List<PromotionsGoods> promotionsGoodsList = this.promotionsGoodsService.getList(getParamMap(), pgCriteria);
					PromotionsGoods promotionsGoods = new PromotionsGoods();
					if(promotionsGoodsList!=null && promotionsGoodsList.size()>0) {
						for(int i=0; i<promotionsGoodsList.size(); i++) {
							if(goodsId.equals(promotionsGoodsList.get(i).getGoodsId())) {
								promotionsGoods = promotionsGoodsList.get(i);
							}
						}
					}
					model.addAttribute("mTPromotions", mTPromotions);
					model.addAttribute("promotions", promotions);
					model.addAttribute("promotionsGoods", promotionsGoods);


					model.addAttribute("promotionsId", mTPromotions.getId());


					if("seckill".equals(mTPromotions.getActivityType())) {//秒杀
						msOrTg = "m";
					} else if("groupon".equals(mTPromotions.getActivityType())) {//团购
						msOrTg = "t";
					} else if("major".equals(mTPromotions.getActivityType())) {//团购
						msOrTg = "z";
					}

						//20160718 dzz 查询商品信息并更新商品价格为促销商品价格(当促销活动开始后, 更新商品价格信息为促销价)
						if(pager!=null && pager.getList().size()>0) {
							MTPromotions obj = (MTPromotions) pager.getList().get(0);
							if("ing".equals(obj.getStatus().trim())) {
								if("create".equals(obj.getIsOpen().trim())) {//判断活动是否开始, 开始后则不进行更新
									promotions.setIsOpen("start");//设置活动为已开始状态
									promotionsService.update(getParamMap(), promotions);

									int newStartNum = promotionsGoods.getNewStartNum();    //新起买数量
									int newLimitNum = promotionsGoods.getNewLimitNum();    //新限购数量
									int newStock = promotionsGoods.getNewStock();    //新限购数量

									//20160805 dzz 同步商品原起购, 原限购数量 到 促销活动商品起购, 限购数量
									promotionsGoods.setOldStartNum(StringUtil.isNotEmpty(goods.getStartNum()) ? goods.getStartNum() : 0);
									promotionsGoods.setOldLimitNum(StringUtil.isNotEmpty(goods.getLimitNum()) ? goods.getLimitNum() : 0);
									promotionsGoods.setOldStock( goods.getStock()==null?0:goods.getStock().intValue() );
									promotionsGoodsService.update(getParamMap(), promotionsGoods);

									//20160805 daa 同步促销活动新起购, 新限购数量 到 商品中起购限购
									goods.setPrice(obj.getPromotionsPrice());//设置更新商品价位促销价
									goods.setStartNum(newStartNum);
									goods.setLimitNum(newLimitNum);
									goods.setStock(Double.parseDouble(newStock+""));
									goodsService.update(getParamMap(), goods);
								}
							}  else if("after".equals(mTPromotions.getStatus().trim())) {
								if("start".equals(mTPromotions.getIsOpen().trim()) || "create".equals(mTPromotions.getIsOpen().trim())) {//判断活动是否结束, 结束状态则进行更新
									promotions.setIsOpen("end");//设置活动为已结束状态
									promotionsService.update(getParamMap(), promotions);

									int oldStartNum = promotionsGoods.getOldStartNum();    //原起买数量
									int oldLimitNum = promotionsGoods.getOldLimitNum();    //原限购数量
									int oldStock = promotionsGoods.getOldStock();    //原库存数量
									int newStock = promotionsGoods.getNewStock();    //原库存数量

									goods.setPrice(mTPromotions.getGoodsPrice());//设置商品价为原商品价
									goods.setStartNum(oldStartNum);
									goods.setLimitNum(oldLimitNum);
									goods.setStock( oldStock - (newStock - goods.getStock() ) );
									goodsService.update(getParamMap(), goods);
								}
							}
						}

					model.addAttribute("mt", msOrTg);

					//验证促销活动获悉相关验证信息
					/*Criteria c = new Criteria();
					c.add(Restrictions.eq("promotionsId", mTPromotions.getId()));
					if(StringUtil.isNotEmpty(getCurrentMember(request))) {
						c.add(Restrictions.eq("memberId", getCurrentMember(request).getId()));
					}*/
					List<MTPromotions> countList = promotionsService.getCountPromotions(getParamMap(), mTPromotions.getId(), goodsId, getCurrentMember(request)==null?null:getCurrentMember(request).getId());
					if(countList!=null && countList.size()>0) {
						model.addAttribute("validObj", countList.get(0));
						model.addAttribute("resultNum", countList.get(0).getResultCount());
					} else {
						MTPromotions obj = new MTPromotions();
						obj.setStartNum(StringUtil.isNotEmpty(goods.getStartNum()) ? goods.getStartNum() : 0);
						obj.setLimitNum(StringUtil.isNotEmpty(goods.getLimitNum()) ? goods.getLimitNum() : 0);
						obj.setQuantity(0);
						model.addAttribute("validObj", obj);
						model.addAttribute("resultNum", 0);
					}

					//统计当前用户下单订单数量为多少
					/*Criteria c2 = new Criteria();
					Map<String, Object> paramMap = new HashMap<String, Object>(0);
					paramMap = getParamMap();
					paramMap.put("promotionsId", mTPromotions.getId());
					if(StringUtil.isNotEmpty(getCurrentMember(request))) {
						paramMap.put("memberId", getCurrentMember(request).getId());
					}
					List<MTPromotions> countResult = promotionsService.getCountPromotionsOrder(paramMap, c2);*/
					/*List<MTPromotions> countResult = promotionsService.getCountPromotions(getParamMap(), mTPromotions.getId(), goodsId, getCurrentMember(request).getId());
					if(countResult!=null && countResult.size()>0) {
						model.addAttribute("resultNum", countResult.get(0).getResultCount());
					} else {
						model.addAttribute("resultNum", 0);
					}*/

				}
			}
			/** 添加秒杀、团购数据 TianYu 2016-07-12 15:18:15 End **/

			goods = goodsService.get(getParamMap(), goodsId);

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
//				currSpItems = (List<Map<String, String>>) goodsService.getCurrentSpItems(getParamMap(), "goodsId", goodsId);


				// 加载当前goods的图片
				goodsImagesList = goodsImgsService.findList(getParamMap(), "goodsId", goodsId);
				// 加载商品对应的所有分类（L1/L2/L3三级分类）
				Catelog catelog = catelogService.getCatelogByGategory(getParamMap(), goods.getCategoryId());

				String cateLogPath = catelog.getPath();
				String[] array = cateLogPath.split(",");
				if(array.length >= 1){
					model.addAttribute("catelogGrandfatherId", array[0]);
				}
				// 加载当前商品的前台分类的相关分类(兄弟分类)
				Criteria criteria = new Criteria();

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

				/** 商品详情显示满减活动信息  HKS 2015-9-10 Start **/
				activityFullcutItems = activityFullcutItemService.findList(getParamMap(), "itemId", goods.getId());
				//是否参与满减活动
				if(activityFullcutItems.size() > 0){
					List<String> fullCutIds = new ArrayList<>();
					for (ActivityFullcutItem item:activityFullcutItems){
						fullCutIds.add(item.getFullCutId());
					}
					//详情页显示最新活动信息  排序在sql中进行 所以页面显示是获取集合get(0)
					activityFullcuts = activityFullcutService.findListByIds(getParamMap(),fullCutIds);
					if(activityFullcuts !=null && activityFullcuts.size()>0) {
							//ActivityFullcutItem activityFullcutItem = activityFullcutItemService.find(getParamMap(), "fullCutId", activityFullcuts.get(0).getId());
						String itemId = "";
							for(ActivityFullcutItem item : activityFullcutItems ){
								if( item.getFullCutId().equals(activityFullcuts.get(0).getId())){
									itemId = item.getId();
									break;
								}
							}

							if(StringUtil.isNotEmpty(itemId)){
								activityDecreaseamounts = activityDecreaseamountService.findList(getParamMap(), "fullCutItemId",itemId);
								model.addAttribute("activityFullCut", activityFullcuts.get(0));//满减活动信息
								model.addAttribute("activityFullCutPrice", activityDecreaseamounts);//活动对应的价格区间
							}

					}
				}
				/** 商品详情显示满减活动信息  HKS 2015-9-10 End **/

			}
			/**
			 * 今日爆款
			 */
			getTodayCountGoods(model, "2");

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

		//2016-05-18 liuxiaobing 手机端商品详情是否开启开始-----------------------------------------
		String isEnable="NO";
		try {
			isEnable = systemSetService.find(getParamMap(), "setkey", "isEnable").getSetvalue();
		} catch (Exception e) {
			logger.error("获取系统配置参数isEnable" + "时，发生异常", e);
		}
		model.addAttribute("isEnable", isEnable);
		//2016-05-18 liuxiaobing 手机端商品详情是否开启结束-----------------------------------------
		/**
		 * Desc:获取商品系统参数(国家;产地;保质期)-ec-gwq
		 * Auth:zhangqiang
		 * Time:2015-11-24 11:02:35
		 */
//		model.addAttribute("goodsSystemParameter", getGoodsSystemParameters(goodsId));

        // 缓存
		setPublicDate2Model( model );
		model.addAttribute("brandMore",request.getParameter("brandMore"));
		getAllCatelog(model);

		//加载热销商品
		getHot(model);
		//商品评论、累计售出、库存 死值
		model.addAttribute("fixed","5233");

		/**
		 * Desc:区分是ECM端预览触发的还是EC/BEC端触发的
		 * Auth:zhangqiang
		 * Time:2015-12-01 12:52:25
		 */
		String showView = request.getParameter("showView");
		if (StringUtil.isNotEmpty(showView)) {
			if ("true".equals(showView)) {
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
			return Global.TEMPLATE_MALL + PATH + "/detail";
		}
	}


	/**
	 * Desc:获取最新参的满减活动，满减价格区间
	 * Auth:HKS
	 * Time:2016-04-14 17:14:25
	 */
	@RequestMapping(value = "/ajaxGetFullCutPrice", method = {RequestMethod.POST})
	public @ResponseBody
	Object ajaxGetFullCutPrice(String fullCutId) {
		String info = "获取满减活动价格区间";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		List<ActivityDecreaseamount> activityDecreaseamounts = new ArrayList<>();
		try {
			ActivityFullcutItem activityFullcutItem =  activityFullcutItemService.find(getParamMap(),"fullCutId", fullCutId);
			activityDecreaseamounts = activityDecreaseamountService.findList(getParamMap(),"fullCutItemId",activityFullcutItem.getId());
			SystemSet systemSet = systemSetService.find(getParamMap(),"setKey","pointMessage");
			if( activityDecreaseamounts.size() > 0 ){
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "成功");
				result.put("activityDecreaseamounts", activityDecreaseamounts);
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "失败");
			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取失败");
			return result;
		}
		return result;
	}


	/**
	 * Desc:获取跨境商品提示信息
	 * Auth:zhangqiang
	 * Time:2016-01-25 15:36:25
	 */
	@RequestMapping(value = "/ajaxGetSystemCrossMsg", method = {RequestMethod.POST})
	public @ResponseBody
	Object ajaxGetSystemCrossMsg() {
		String info = "获取跨境商品提示信息";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			SystemSet systemSet = systemSetService.find(getParamMap(),"setKey","pointMessage");
			if( StringUtil.isNotEmpty(systemSet) ){
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "成功");
				result.put("msg", systemSet.getSetvalue());
			}else{
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "失败");
			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取失败");
			return result;
		}
		return result;
	}


	/**
	 * Desc:获取商品是否为跨境商品
	 * Auth:zhangqiang
	 * Time:2016-01-18 14:07:35
	 * Start
	 */
	@RequestMapping(value = "/ajaxIsCrossBorderGoods", method = { RequestMethod.POST })
	public @ResponseBody
	Object ajaxIsCrossBorderGoods(String shopId,String catelogId){
		String info = "获取商品是否为跨境商品";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		String state = ERROR;
		String message = "获取失败";
		try {
			if(CrossborderUtil.isCrossborder()){
				if(CrossborderUtil.isShopCatelog(shopId,catelogId)){
					state = SUCCESS;
					message = "获取成功";
				}
			}

			if (ERROR.equals(state)) {
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


	@RequestMapping("/getGoodsImages/{goodsId},{type}")
	public String getGoodsImages(@PathVariable String goodsId, @PathVariable String type, Model model, HttpServletRequest request) {
		String info = "商城获取商品信息(" + goodsId + ")";
		setLogInfo(info);
		String tenantId = getTenantId();

		List<GoodsImages> goodsImagesList = new ArrayList<GoodsImages>();
		Goods goods = null;

		try {
			goods = goodsService.get(getParamMap(), goodsId);
			// 加载当前goods的图片
			goodsImagesList = goodsImgsService.findList(getParamMap(), "goodsId", goodsId);

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		model.addAttribute("goods", goods);
		model.addAttribute("goodsImagesList", goodsImagesList);


		// 缓存
		setPublicDate2Model( model );
		getAllCatelog(model);


		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/goodDetail";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/goods_image";
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
				Member mb = getCurrentMember(request);
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


	/**
	 * Desc:获取今日爆款
	 * Time:2015-12-16 18:10:35
	 * @param model
	 * @param size
	 */
	public void getTodayCountGoods(Model model,String size){
		try {
			List<Goods> tcGoodsList=new ArrayList<Goods>();
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.order("t.createDate", "desc"));
			criteria.add(Restrictions.le("g.platform", 2));
			criteria.add(Restrictions.eq("g.isMarketable", "1"));
			criteria.add(Restrictions.eq("g.status", "5"));
			criteria.add(Restrictions.limit("0", size));
			criteria.add(Restrictions.eq("t.status", 1));
			criteria.add(Restrictions.eq("t."+Constant.TENANTID_KEY, getTenantId()));
			criteria.add(Restrictions.eq("t." + Constant.PLATFORM_KEY, getPlatform()));
			List<Goods> tcList = tcService.getTodayCommendGoods(getParamMap(), criteria);
			if (tcList != null && tcList.size() > 0) {
				for(int i=0;i<tcList.size();i++){
					Goods goods = tcList.get(i);
					if (goods != null) {
						Criteria c = new Criteria();
						c.add(Restrictions.eq("goodsId", goods.getId()));
						List<GoodsImages> goodsImgList = goodsImagesService.getList(getParamMap(), c);
						if (goodsImgList != null && goodsImgList.size() > 0) {
							goods.setPic(goodsImgList.get(0).getPic());
//							tcGoodsList.add(goods);
						}
						tcGoodsList.add(goods);
					}
				}
			}
			model.addAttribute("tcGoodsList", tcGoodsList);
		}catch (Exception e) {
			logger.error("获取今日爆款时,发生异常：", e);
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
			criteria.add(Restrictions.le("platform",2));
			if (!StringUtil.isNotEmpty(showFlag)) {
				criteria.add(Restrictions.eq("isMarketable", 1));
				criteria.add(Restrictions.eq("status", 5));
			}
			criteria.add(Restrictions.eq("isDelete", 1));
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
	 * APP端获取商品详情
	 */
	@RequestMapping("/getGoodsDetailToApp/{goodsId}")
	public String getGoodsDetailToApp(@PathVariable String goodsId, Model model, HttpServletRequest request) {
		String info = "手机端商城获取商品信息(" + goodsId + ")";
		setLogInfo(info);
		Goods goods = null;
		Map<String, List<Map<String, Object>>> goodsSpInfoMap = new HashMap<String, List<Map<String, Object>>>();
		Map<String, String> brandMap = new HashMap<String, String>();
		Map<String, List<GoodsParameter>> parameterMap = new HashMap<String, List<GoodsParameter>>();
		List<Map<String, String>> goodsParamList = new ArrayList<Map<String, String>>();
		List<Map<String, String>> currSpItems = new ArrayList<Map<String, String>>();
		List<GoodsImages> goodsImagesList = new ArrayList<GoodsImages>();
		Merchant shop = null;
		List<GoodsReview> goodsReviewList = new ArrayList<GoodsReview>();
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
	 * 热销商品
	 * @param model
	 */
	private void getHot(Model model) {
		List<Goods> hotList=null;
		try{
			/**添加所属平台参数  hks 2015-11-10 18:09:58 modify  start **/
			hotList = goodsService.getTagGoods4Index(getParamMap(), "hot", 4, getWhichPlat());
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
		List<GoodsBrand> brandList = brandService.getList(getParamMap(), brandCriteria);
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
//		c.add(Restrictions.eq("enabled", 1));
		groupList = pGroupService.getList(getParamMap(), c);
		for (GoodsParameterGroup group : groupList) {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("groupId", group.getId()));
			List<GoodsParameter> parameterList = parameterService.getList(getParamMap(), criteria);
			resultMap.put(group.getId()+"_"+group.getName(), parameterList);
		}

		return resultMap;
	}

	// 加入到浏览历史表中
	public void addToHistory(String goodsId, HttpServletRequest request) {
		try {
			Goods goods = goodsService.get(getParamMap(), goodsId);
			if (goods != null) {
				Member mb = getCurrentMember(request);
				if (mb != null && mb.getId() != null) {
					try {
						historyService.saveHistoryValues(getParamMap(), mb.getId(), goodsId);
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
			Member mb = getCurrentMember(request);

			if( mb == null ){
				result.put(STATUS, "NOLOGIN");
				result.put(MESSAGE, "关注失败");
				return result;
			}

			Criteria criteria = new Criteria();
			if(StringUtil.isNotEmpty(getCurrentMember(request))) {
				criteria.add(Restrictions.eq("c.memberId", mb.getId()));
			}
			criteria.add(Restrictions.eq("c.goodsId", goodsId));
			List<GoodsAttention> list = goodsAttentionService.getList(getParamMap(), criteria);

			if (list == null || list.size() == 0) {
				if (mb != null && mb.getId() != null) {
					goodsAttentionService.saveHistoryValues(getParamMap(), mb.getId(), goodsId);
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

    /**
     * 获取商品的评价内容
     *
     * @param goodsId 商品Id
     *
     * @return 评价详细内容
     */
    @RequestMapping("getGoodsReviewList/{goodsId}")
    @ResponseBody
    public Object getGoodsReviewList(@PathVariable String goodsId, String orderSn, String memberId, HttpServletRequest request) {
        List<GoodsReview> goodsReviewList = null;
        List<Map<String, Object>> resultMapList = new ArrayList<Map<String, Object>>();
        // 加载评价
        try {
            //goodsReviewList = goodsReviewService.findList(getParamMap(), "goodsId", goodsId);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("goodsId", goodsId));

			if(StringUtil.isNotEmpty(memberId)){
				criteria.add(Restrictions.eq("memberId", memberId));
			}
            if(StringUtil.isNotEmpty(orderSn)){
                criteria.add(Restrictions.eq("orderSn", orderSn));
            }

			goodsReviewList = goodsReviewService.getList(getParamMap(), criteria);
            if (goodsReviewList != null && goodsReviewList.size() > 0) {
                for (GoodsReview review : goodsReviewList) {
					List list = new ArrayList();
                    Member member = memberService.get(getParamMap(), review.getMemberId());
                    Map<String,Object> map = JSON.parseObject(JSON.toJSONString(review), Map.class);
					//List<GoodsReview> replyList = goodsReviewService.getReply(getParamMap(),review.getId());
                    Criteria ca = new Criteria();
                    ca.add(Restrictions.eq("parentId", review.getId()));
                    ca.add(Restrictions.order("createDate", "ASC"));
                    List<GoodsReview> replyList = goodsReviewService.getAllByCriteria(getParamMap(), ca);
					if(member.getNickName()==null){
						map.put("nickName","会员昵称保密");
					}else {
						map.put("nickName", member.getNickName());
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
		List<GoodsReview> goodsReviewList = new ArrayList<GoodsReview>();
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

	// APP判断商品是否已关注
	@RequestMapping(value = "/isGoodsAttention")
	public @ResponseBody
	Object isGoodsAttention(HttpServletRequest request) {
		String info = "是否关注";
		setLogInfo(info);
		String goodsId = request.getParameter("goodsId");
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Member mb = getCurrentMember(request);
			if( mb == null ){
				result.put(STATUS, "NOLOGIN");
				result.put(MESSAGE, "关注失败");
				return result;
			}
			Criteria criteria = new Criteria();
			if(StringUtil.isNotEmpty(getCurrentMember(request))) {
				criteria.add(Restrictions.eq("c.memberId", mb.getId()));
			}
			criteria.add(Restrictions.eq("c.goodsId", goodsId));
			List<GoodsAttention> list = goodsAttentionService.getList(getParamMap(), criteria);

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

	// 组织微信商城商品列表加入购物车Panel数据
	@RequestMapping(value = "/getData4AddCartPanel")
	public @ResponseBody
	Object getData4AddCartPanel(String goodsId, HttpServletRequest request) {
		String info = "组织微信商城商品列表加入购物车Panel数据";
		setLogInfo(info);

		Map<String, Object> result = new HashMap<String, Object>();
		result.put(STATUS, SUCCESS);
		try {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("a.id", goodsId));
			List<Goods> goodsList = goodsService.getList(getParamMap(), criteria);

            if(goodsList == null || goodsList.size() == 0){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "商品不存在");
                return result;
            }
			Goods goods = goodsList.get(0);
			result.put("goods", goods);
			boolean isCross = false; //是否是跨境商品
			boolean isLogin = false; //是否已经登录
			boolean hasIdCode = false; //是否已经输入身份证

			//判断是否是跨境商品
			if(CrossborderUtil.isCrossborder()){
				if(CrossborderUtil.isShopCatelog(goods.getShopId(),goods.getCategoryId())){
					isCross = true;

					//获取跨境商品提示信息
					SystemSet systemSet = systemSetService.find(getParamMap(),"setKey","pointMessage");
					if( StringUtil.isNotEmpty(systemSet) ){
						result.put("crossGoodsTip", systemSet.getSetvalue());
					}else{
						result.put("crossGoodsTip", false);
					}

					//判断是否已经登录
					Member m = getCurrentMember(request);
					if( m != null){
						isLogin = true;
						if( StringUtil.isNotEmpty(m.getIDCode())){
							hasIdCode = true;
						}
					}

				}
			}

            result.put("isCross", isCross);
            result.put("isLogin", isLogin);
            result.put("hasIdCode", hasIdCode);

            //获取规格信息
            Map<String, List<Map<String, Object>>> goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);
            result.put("spInfoMap", goodsSpInfoMap);


		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, info + "时，发生异常");
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
			String shopId = request.getParameter("shopId");
			if (StringUtil.isNotEmpty(catelogId)) {
				Criteria criteria = new Criteria();
				if( StringUtil.isNotEmpty( shopId ) ) {
					criteria.add(Restrictions.eq("shopId", shopId));
				}
				criteria.add(Restrictions.eq("isMarketable", 1));
				criteria.add(Restrictions.eq("status", 5));
				criteria.add(Restrictions.le("platform", 2));
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


	/**
	 * 获取商品实时库存
	 * 2016年11月10日09:45:34
	 * @param request
	 * @return
     */
	@RequestMapping(value = "/ajaxGetGoodStock", method = {RequestMethod.POST})
	public @ResponseBody
	Object ajaxGetGoodStock(HttpServletRequest request) {
		String info = "获取商品实时库存";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		String goodsId=request.getParameter("goodsId");
		try {
			Goods goods = goodsService.get(getParamMap(), goodsId);
			if( goods!=null ){
				result.put(STATUS, SUCCESS);
				result.put("stock", goods.getStock());
			}else{
				result.put(STATUS, ERROR);
			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "获取失败");
			return result;
		}
		return result;
	}

}
