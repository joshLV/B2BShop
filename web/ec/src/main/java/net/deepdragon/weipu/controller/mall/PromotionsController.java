package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.DeliveryMethod;
import net.deepdragon.entity.DeliveryTime;
import net.deepdragon.entity.PaymentMethod;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.entity.cuxiao.MTPromotions;
import net.deepdragon.entity.cuxiao.Promotions;
import net.deepdragon.entity.cuxiao.PromotionsGoods;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.erp.yunji.api.YunJiErpApiUtil;
import net.deepdragon.service.DeliveryMethodService;
import net.deepdragon.service.DeliveryTimeService;
import net.deepdragon.service.PaymentMethodService;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.cuxiao.PromotionsGoodsService;
import net.deepdragon.service.cuxiao.PromotionsService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.*;
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
import java.net.URLDecoder;
import java.util.*;

/**
 * Created by haoxiaolei on 2014/7/10 0010. 网站商城商品详细页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "PromotionsController")
@RequestMapping(Global.MALL_PATH + "/promotions")
public class PromotionsController extends BaseMallController {
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



	@Resource
	private CartItemService cartItemService;
	@Resource
	private MemberRankService memberRankService;
	@Resource
	private MemberInvoiceService memberInvoiceService;
	@Resource
	private ReceiverService receiverService;
	@Resource
	private PaymentMethodService paymentMethodService;
	@Resource
	private DeliveryMethodService deliveryMethodService;
	@Resource
	private DeliveryTimeService deliveryTimeService;


	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private OrderLogService orderLogService;
	@Resource
	private QuotationService quotationService;
	@Resource
	private QuotationDetailsService quotationDetailsService;


	@RequestMapping("/ms")
	public String miaoShaList(Model model, Pager pager, HttpServletRequest request) {
		String info = "商城获取秒杀商品信息";

		try {
			setLogInfo(info);
			setCommonData(model);

			Criteria criteria = new Criteria();
			pager = promotionsService.getMxAndTgPager(getParamMap(), criteria, "seckill", pager);

			model.addAttribute("pager", pager);
			model.addAttribute("imageUrl", getSystemSetByKey("imageUrl"));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("查询秒杀商品列表时出现错误");
		}
		String type=request.getParameter(Global.WHICHCLIENT);
		if(type!=null && Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/ms_list";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/ms_list";
		}
	}

	@RequestMapping("/msGoods/{promotionsId}")
	public String getMsGoodsDetail(@PathVariable String promotionsId, Model model, HttpServletRequest request) {
		String info = "商城获取秒杀商品信息(" + promotionsId + ")";
		setLogInfo(info);
		setCommonData(model);

		try{
			//
			//1、查询组装好的活动数据
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("id", promotionsId));
			Pager pager = new Pager();
			pager = promotionsService.getMxAndTgPager(getParamMap(), criteria, "seckill", pager);

			MTPromotions mTPromotions = pager.getList() != null && pager.getList().size() > 0 ? (MTPromotions)pager.getList().get(0) : null;

			//2、查询秒杀活动
			Promotions promotions = this.promotionsService.get(getParamMap(), promotionsId);

			//3、查询秒杀商品
			PromotionsGoods promotionsGoods = this.promotionsGoodsService.find(getParamMap(), "promotionsId", promotions.getId());

			//4、查询商品信息
			criteria = new Criteria();
			criteria.add(Restrictions.eq("a.id", promotionsGoods.getGoodsId()));
			List<Goods> goodsList = this.goodsService.getList(getParamMap(), criteria);

			Goods goods = null;
			if( goodsList != null && goodsList.size() > 0 ){
				goods = goodsList.get( 0 );
			}

			model.addAttribute("mTPromotions", mTPromotions);
			model.addAttribute("promotions", promotions);
			model.addAttribute("promotionsGoods", promotionsGoods);
			model.addAttribute("goods", goods);

			String goodsId = goods.getId();

			Map<String, List<Map<String, Object>>> goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);
			Map<String, String> brandMap = processBrand(getParamMap());

			Map<String, List<GoodsParameter>> parameterMap = processParameterList(getParamMap(), goods.getCategoryId());
			// 加载当前goods所拥有的参数列表,map里的key：parameterId，content，goodsId
			List<Map<String, String>> goodsParamList = (List<Map<String, String>>) goodsService.getGoodsParamsList(getParamMap(), "goodsId", goodsId);

			model.addAttribute("brandMap", brandMap);
			model.addAttribute("goodsParamList", goodsParamList);
			model.addAttribute("parameterMap", parameterMap);

		}catch (Exception e){
			e.printStackTrace();
			logger.error("查询秒杀商品【"+ promotionsId +"】详情时出现错误");
		}
		String type=request.getParameter(Global.WHICHCLIENT);
		if(type!=null && Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/ms_detail";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/ms_detail";
		}
	}


	/**
	 * 20160719 dzz
	 * 1.验证商城本次商品秒杀活动是否结束
	 * 2.团购活动暂不验证
	 * @param request
	 * @param promotionsId	本次秒杀促销活动Id
	 * @return
	 */
	@RequestMapping("/validMs/{promotionsId}")
	@ResponseBody
	public Object validateMs(HttpServletRequest request, @PathVariable String promotionsId) {
		String info = "验证商城秒杀商品活动是否结束";
		Map<String, Object> resultMap = new HashMap<String, Object>(0);
		try {

			String msOrTg = request.getParameter("mt");//m为秒杀,t为团购
			if( StringUtils.isNotEmpty( msOrTg ) ){
				String activityType = "seckill";
				if( "m".equals( msOrTg ) ){
					activityType = "seckill";
				}else if( "t".equals(msOrTg) ){
					activityType = "groupon";
				}

				//1、查询组装好的活动数据
				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("id", promotionsId));
				Pager pager = new Pager();
				pager = promotionsService.getMxAndTgPager(getParamMap(), criteria, activityType, pager);



				if( "m".equals( msOrTg ) ){
					MTPromotions mTPromotions = pager.getList() != null && pager.getList().size() > 0 ? (MTPromotions)pager.getList().get(0) : null;

					if("after".equals(mTPromotions.getStatus())) {
						resultMap.put(STATUS, ERROR);
						resultMap.put(MESSAGE, "亲, 此商品秒杀活动已结束, 下次再接再厉哦");
					} else if("before".equals(mTPromotions.getStatus())) {
						resultMap.put(STATUS, SUCCESS);
						resultMap.put(MESSAGE, "亲, 您将错过秒杀机会");
					} else if("ing".equals(mTPromotions.getStatus().trim())) {
						resultMap.put(STATUS, SUCCESS);
						resultMap.put(MESSAGE, "亲, 加油加油!!!");
					}
				}else if( "t".equals(msOrTg) ){
					if(pager.getList()!=null && pager.getList().size()>0) {
						MTPromotions mTPromotions = pager.getList() != null && pager.getList().size() > 0 ? (MTPromotions)pager.getList().get(0) : null;
						Goods goods = goodsService.get(getParamMap(), mTPromotions.getGoodsId());
						resultMap.put("startNum", StringUtil.isNotEmpty(goods.getStartNum()) ? goods.getStartNum() : 0);
						resultMap.put("limitNum", StringUtil.isNotEmpty(goods.getLimitNum()) ? goods.getLimitNum() : 0);
					} else {

					}

					resultMap.put(STATUS, SUCCESS);
					resultMap.put(MESSAGE, "亲, 加油加油!!!");
				}
			} else {
				resultMap.put(STATUS, WARN);
				resultMap.put(MESSAGE, "非促销(秒杀, 团购)活动!");
			}
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}
		return resultMap;
	}

	/**
	 * 查询团购商品
	 * @param catelogId
	 * @param model
	 * @param pager
	 * @param request
     * @return
     */
	@RequestMapping("/tg")
	public String tuanGouList(String catelogId, Model model,Pager pager, HttpServletRequest request) {
		String info = "商城获取团购商品信息";

		String url = "/tg_list";
		try {
			setLogInfo(info);

			setCommonData(model);

			if(StringUtil.isNotEmpty( catelogId )){//更多页面
				pager.setPageSize( 20 );

				//1、获取等级分类
				Catelog catelog = catelogService.get(getParamMap(), catelogId);

				//2、查询活动商品
				Criteria criteria = new Criteria();
				criteria.add( Restrictions.like("categoryPath", catelog.getId()+",%") );
				pager = promotionsService.getMxAndTgPager(getParamMap(), criteria, "groupon", pager);

				model.addAttribute("catelog", catelog);
				model.addAttribute("pager", pager);
				url = "/tg_list_more";
			}else{//一级列表页

				/*
				 * 20160720 dzz
				 * 暂使用全查模式, 后期修正如下备注信息所述, 切记
				 */
				Criteria criteria = new Criteria();;
				pager.setList(null);
				pager.setPageSize( 1000 );
				pager = promotionsService.getMxAndTgPager(getParamMap(), criteria, "groupon", pager);
				List<Map<String, Object>> proList = new ArrayList<Map<String, Object>>();
				if(pager.getList() != null && pager.getList().size() > 0 ){
					Map<String, Object> map = new HashMap<String,Object>();
					map.put("topCatelog", "all");
					map.put("list", pager.getList());
					proList.add( map );
				}
				model.addAttribute("proList", proList);

				/************************************ start 20160720 dzz 暂时注销使用此处功能 ************************************/
				/*
				 * 20160720 dzz 注销原因
				 * 1.取消楼层展示功能, 使用列表方式查询
				 * 2.因时间紧张, 暂定团购功能使用全查列表展示
				 * 3.后期修正为列表部分查询, 剩余团购信息列表使用ajax异步查询(重点)
				 */
				/*//1、获取所有顶级分类
				List<Catelog> catelogList = catelogService.getAllParents(getParamMap());

				//2、按顶级分类循环查询团购商品
				List<Map<String, Object>> proList = new ArrayList<Map<String, Object>>();
				Criteria criteria = null;
				for( Catelog catelog : catelogList ){
					pager.setList(null);
					pager.setPageSize( 10 );
					criteria = new Criteria();
					criteria.add( Restrictions.like("categoryPath", catelog.getId()+",%") );
					pager = promotionsService.getMxAndTgPager(getParamMap(), criteria, "groupon", pager);

					if(pager.getList() != null && pager.getList().size() > 0 ){
						Map<String, Object> map = new HashMap<String,Object>();
						map.put("topCatelog", catelog);
						map.put("list", pager.getList());
						proList.add( map );
					}
				}
				model.addAttribute("proList", proList);*/
				/************************************ end 20160720 dzz 暂时注销使用此处功能 ************************************/
			}

			model.addAttribute("imageUrl", getSystemSetByKey("imageUrl"));
		}catch (Exception e){
			e.printStackTrace();
			logger.error("查询团购商品列表时出现错误");
		}
		String type=request.getParameter(Global.WHICHCLIENT);
		if(type!=null && Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + url;
		}else{
			return Global.TEMPLATE_MALL + PATH + url;
		}
	}

	@RequestMapping("/tgGoods/{goodsId}")
	public String getTgGoodsDetail(@PathVariable String goodsId, Model model, HttpServletRequest request) {
		String info = "商城获取团购商品信息(" + goodsId + ")";
		setLogInfo(info);
		setCommonData(model);
		String type=request.getParameter(Global.WHICHCLIENT);
		if(type!=null && Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/tg_detail";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/tg_detail";
		}
	}


	private void setCommonData(Model model){
		setPublicDate2Model( model );
		getAllCatelog(model);
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

	/*private void getAllCatelog(Model model) {
		List<Catelog> allCatelog = cacheData.getCatelogList(getParamMap());
		Map<String, Catelog> allCatelogMap = cacheData.getCatelogMap(getParamMap());
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
		model.addAttribute("catelogList", list);
		model.addAttribute("catelogChildrenMap", childrenMap);
	}*/


	/**
	 * 20160729 dzz
	 * 促销活动订单验证
	 * @param model
	 * @param request
	 * @param promotionsId		当前促销活动Id
	 * @param goodsId				当前促销活动商品Id
	 * @return
	 */
	@RequestMapping("/ordercheck/{promotionsId}/{goodsId}")
	public String orderCheck(Model model, HttpServletRequest request, @PathVariable String promotionsId, @PathVariable String goodsId) {
		String info = "促销(团购)订单核对页面";
		setLogInfo(info);
		logger.debug(info);

		String dealNum = request.getParameter("dealNum"); //获取促销(团购)购买商品数量
		String memberId = getCurrentMember(request).getId();//当前用户Id信息

		String type = request.getParameter(Global.WHICHCLIENT);
		/** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23*/
		/*String o = request.getParameter("o");//购物车数据ID集合
		if (StringUtils.isEmpty(o)) {
			logger.error(info + "获取团购订单信息时，发生异常：无效的团购订单信息");
			if (Global.WHICH_APP.equals(type)) {
				return "redirect:/cart/list?whichclient=whichapp";
			} else {
				return "redirect:/cart/list";
			}
		}*/

//		model.addAttribute("o", o);//商品ID

		Member currentMember = getCurrentMember(request);

		try {
			if(StringUtils.isNotEmpty(request.getParameter("backurl"))) {
				String backurl = URLDecoder.decode(request.getParameter("backurl"), "utf-8");
				model.addAttribute("backurl", backurl);
			}
			/*获取会员等级 TianYu  2016-1-18 14:45:56*/
			MemberRank memberRank = this.memberRankService.get(getParamMap(), currentMember.getRankId());
			model.addAttribute("memberRankScale", memberRank.getScale()/100);

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("re.memberId", currentMember.getId()));
			String receiverId=request.getParameter("receiverId");

			List<Receiver> receiverList = receiverService.getList(getParamMap(), criteria);
			model.addAttribute("receiverList", receiverList);
			Receiver ReceiverN=new Receiver();

			if (receiverList != null && receiverList.size() > 0 ) {
				if(null != receiverId && !"".equals(receiverId)){
					criteria.add(Restrictions.eq("re.id", receiverId));
					model.addAttribute("receiver", receiverService.getList(getParamMap(),criteria).get(0));
					MyBeanUtils.copyBean2Bean(ReceiverN, receiverService.getList(getParamMap(), criteria).get(0));
				}else{
					for(Receiver receiver:receiverList){//重新修改默认收货地址获取逻辑   hks   2015-11-06  modify
						if(receiver.getIsDefault()==1){
							model.addAttribute("receiver", receiver);
							MyBeanUtils.copyBean2Bean(ReceiverN,receiver);
							break;
						}
					}
				}
				model.addAttribute("receiverN", ReceiverN);
			}

			Map<String, String> invoiceInfo = new HashMap<String, String>();
			invoiceInfo.put("invoiceContent", "no");
			invoiceInfo.put("invoiceTitle", "");
			invoiceInfo.put("invoiceType", "");
			MemberInvoice memberInvoice = memberInvoiceService.getDefaultInvoiceInfo(getParamMap(), currentMember.getId());
			if (memberInvoice != null) {
				invoiceInfo.put("invoiceContent", "infos");
				invoiceInfo.put("invoiceTitle", memberInvoice.getInvoiceTitle());
				invoiceInfo.put("invoiceType", "normal");
			} else {
				memberInvoice = new MemberInvoice();
			}
			List<MemberInvoice> memberInvoicesList = memberInvoiceService.findList(getParamMap(), "memberId", currentMember.getId());
			if (memberInvoicesList.isEmpty()) {
				MemberInvoice newInvoice = new MemberInvoice();
				newInvoice.setInvoiceTitle("个人");
				newInvoice.setTenantId(getTenantId());
				newInvoice.setMemberId(currentMember.getId());
				newInvoice.setIsDefault(1);
				newInvoice.setCreateUser(currentMember.getId());
				newInvoice.setCreateDate(new Date());
				memberInvoiceService.save(getParamMap(), newInvoice);
				memberInvoicesList.add(newInvoice);
			}

			/*
			 * 20160729 dzz
			 * 组装购物车数据信息
			 */
			Goods goods = goodsService.get(getParamMap(), goodsId); //获取促销商品信息
			Merchant merchant = merchantService.get(getParamMap(), goods.getShopId()); //获取商家信息
			List<GoodsImages> goodsImagesList = goodsImagesService.findList(getParamMap(), "goodsId", goodsId);//查询商品图片信息

			List<CartItem> cartItemList = new ArrayList<CartItem>(0);
			CartItem cartItem = new CartItem();
			cartItem.setMemberId(memberId);								//当前用户Id
			cartItem.setGoodsId(goodsId);								//商品Id
			cartItem.setName(goods.getName());							//商品名称
			cartItem.setQuantity(StringUtil.toInt(dealNum)); 	//促销(团购商品数量)购买数量
			cartItem.setPrice(goods.getPrice().toString());				//商品价格
			cartItem.setMarketPrice(goods.getMarketPrice().toString());	//市场价
			cartItem.setPic(goodsImagesList.get(0).getPic());			//图片
			cartItem.setMerchantId(goods.getShopId());					//商家Id
			cartItem.setMerchantUrlAddress(merchant.getUrlAddress());	//商家地址
			cartItem.setMerchantShortName(merchant.getShortName());		//商家名称

			cartItemList.add(cartItem);


			/** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Start */
			//获取商品满减优惠金额 hks 2016-4-15 11:47:24
			getActivityDecreaseAmount(cartItem);
			/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 End */

			model.addAttribute("member", currentMember);
			//发票信息
			model.addAttribute("invoiceInfo", invoiceInfo);
			model.addAttribute("memberInvoice", memberInvoice);
			model.addAttribute("memberInvoicesList", memberInvoicesList);
			// 支付方式
			List<PaymentMethod> paymentMethods = getPaymentMethodList();
			model.addAttribute("paymentMethodList", paymentMethods);

			String paymentMethodId = request.getParameter("paymentMethodId");

			/** APP端订单确认页面已选择支付方式后又重新请求 LiaoHanyin 2015-11-4 start*/
			String payMentId=request.getParameter("paymentMethodId");

			PaymentMethod paymentMethodsN=new PaymentMethod();
			if(StringUtil.isNotEmpty(payMentId)){
				/**  从原来的根据Id查询数据库改为遍历获取  TianYu  2015-12-08 15:11:52 Start */
				PaymentMethod paymentMethod = null;
				if(paymentMethods!=null && paymentMethods.size()>0){
					for( PaymentMethod pm : paymentMethods){
						if( payMentId.equals( pm.getId() ) ){
							paymentMethod = pm;
							break;
						}
					}
				}
				/**  从原来的根据Id查询数据库改为遍历获取  TianYu  2015-12-08 15:11:52 End */
				model.addAttribute("paymentMethod", paymentMethod);
				MyBeanUtils.copyBean2Bean(paymentMethodsN, paymentMethod);
				model.addAttribute("paymentMethodN",paymentMethodsN);
				if (!StringUtil.isEmpty(paymentMethodId)) {
					model.addAttribute("paymentMethodIds", paymentMethodId);
				}else{
					model.addAttribute("paymentMethodIds", paymentMethod.getId());
				}
			}else{
				model.addAttribute("paymentMethod", paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0):null);
				MyBeanUtils.copyBean2Bean(paymentMethodsN, paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0):null);
				model.addAttribute("paymentMethodN",paymentMethodsN);
				if (!StringUtil.isEmpty(paymentMethodId)) {
					model.addAttribute("paymentMethodIds", paymentMethodId);
				}else{
					model.addAttribute("paymentMethodIds", paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0).getId():null);
				}
			}

			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 Start */
			List<Map<String, Object>> items = groupCartItemByShop(cartItemList);

			String deliveryId = null;

			/******** 修改配送方式，获取默认的配送方式  TianYu 2016-1-18 10:08:57  New Start ***********/
			List<DeliveryMethod> deliveryMethods = getDeliveryMethodList();
			model.addAttribute("deliveryMethodList", getDeliveryMethodList());
			if( deliveryMethods!=null && deliveryMethods.size() > 0){
				DeliveryMethod defaultDeliveryMethod = null;
				for(DeliveryMethod dm : deliveryMethods){
					if( 0 == dm.getIsDefault() ){
						defaultDeliveryMethod = dm;
						break;
					}
				}
				if( defaultDeliveryMethod != null ){
					model.addAttribute("deliveryMethod", defaultDeliveryMethod);
					deliveryId = defaultDeliveryMethod.getId();
				}else{
					model.addAttribute("deliveryMethod", deliveryMethods.get(0));
					deliveryId = deliveryMethods.get(0).getId();
				}
			}else{
				throw new Exception("商城未设置配送方式");
			}
			/******** 修改配送方式，获取默认的配送方式  TianYu 2016-1-18 10:08:57  New End ***********/

			costCalculation(items, memberRank.getScale(), deliveryId);
			model.addAttribute("didFlag", deliveryId);
			/**从支付审核页面获取快递ID Auth:zhangqiang Time:2015-09-25 17:49:35 End */
			model.addAttribute("cartItemList", items);
			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 End */


			// 送货时间
			model.addAttribute("deliveryTimeList", getDeliveryTimeList());

			String deliveryTimeId = request.getParameter("deliveryTimeId");
			if (!StringUtil.isEmpty(deliveryTimeId)) {
				model.addAttribute("deliveryTimeIds", deliveryTimeId);
			}else{
				model.addAttribute("deliveryTimeIds", getDeliveryTimeList().get(0).getId());
			}

			String order_deliveryTimeName = request.getParameter("order_deliveryTimeName");
			if (!StringUtil.isEmpty(order_deliveryTimeName)) {
				model.addAttribute("deliveryTimeName", order_deliveryTimeName);
			}else{
				model.addAttribute("deliveryTimeName", getDeliveryTimeList().get(0).getIntroduce());
			}



			/*Criteria c = new Criteria();
			c.add(Restrictions.eq("promotionsId", promotionsId));
			if(StringUtil.isNotEmpty(getCurrentMember(request))) {
				c.add(Restrictions.eq("memberId", getCurrentMember(request).getId()));
			}*/
			List<MTPromotions> countList = promotionsService.getCountPromotions(getParamMap(), promotionsId, goodsId,memberId);
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
			paramMap.put("promotionsId", promotionsId);
			if(StringUtil.isNotEmpty(getCurrentMember(request))) {
				paramMap.put("memberId", getCurrentMember(request).getId());
			}
			List<MTPromotions> countResult = promotionsService.getCountPromotionsOrder(paramMap, c2);*/
			List<MTPromotions> countResult = promotionsService.getCountPromotions(getParamMap(), promotionsId, null, getCurrentMember(request)==null?null:getCurrentMember(request).getId());
			if(countResult!=null && countResult.size()>0) {
				model.addAttribute("resultNum", countResult.get(0).getResultCount());
			} else {
				model.addAttribute("resultNum", 0);
			}


			setPublicDate2Model( model );
			model.addAttribute("promotionsId", promotionsId);
			model.addAttribute("goodsId", goodsId);
			model.addAttribute("dealNum", dealNum);
		} catch (Exception e) {
			logger.error(info + "获取收货人、购物车等信息时，发生异常:" + e);
			e.printStackTrace();
		}
		if (Global.WHICH_APP.equals(type)) {
			return Global.TEMPLATE_APP + PATH + "/member/ordercheck_promotions";
		} else {
			return Global.TEMPLATE_MALL + PATH + "/member/ordercheck_promotions";
		}
	}




	@RequestMapping("submit")
	@ResponseBody
	public Object submit(HttpServletRequest request) {
		String info = "提交订单信息";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();

		String promotionsId = request.getParameter("promotionsId");
		String goodsId = request.getParameter("goodsId");
		String dealNum = request.getParameter("dealNum"); //获取促销(团购)购买商品数量
		String resultNum = request.getParameter("resultNum");//获取用户订单下单数量

		try {

			//统计当前用户下单订单数量为多少
			/*Criteria c2 = new Criteria();
			Map<String, Object> paramMap = new HashMap<String, Object>(0);
			paramMap = getParamMap();
			paramMap.put("promotionsId", promotionsId);
			if(StringUtil.isNotEmpty(getCurrentMember(request))) {
				paramMap.put("memberId", getCurrentMember(request).getId());
			}
			List<MTPromotions> countResult = promotionsService.getCountPromotionsOrder(paramMap, c2);*/
			List<MTPromotions> countResult = promotionsService.getCountPromotions(getParamMap(), promotionsId, goodsId, getCurrentMember(request)==null?null:getCurrentMember(request).getId());

			if((countResult!=null && countResult.size()>0) && (StringUtil.toInt(resultNum)<countResult.get(0).getResultCount())) {//判断用户是否已提交订单
				result.put(STATUS, WARN);
				result.put(MESSAGE, "亲爱的用户请不要频繁点击, 请稍后重试...");
			} else {
				List<CartItem> cartItemList = new ArrayList<CartItem>(0);
				CartItem cartItem = new CartItem();
				if(StringUtil.isNotEmpty(goodsId)) {
				/*
				 * 20160729 dzz
				 * 组装购物车数据信息
				 */
					Goods goods = goodsService.get(getParamMap(), goodsId); //获取促销商品信息
					Merchant merchant = merchantService.get(getParamMap(), goods.getShopId()); //获取商家信息
					List<GoodsImages> goodsImagesList = goodsImagesService.findList(getParamMap(), "goodsId", goodsId);//查询商品图片信息

					cartItem.setMemberId(getCurrentMember(request).getId());								//当前用户Id
					cartItem.setGoodsId(goodsId);								//商品Id
					cartItem.setName(goods.getName());							//商品名称
					cartItem.setQuantity(Integer.parseInt(dealNum.trim())); 	//促销(团购商品数量)购买数量
					cartItem.setPrice(goods.getPrice().toString());				//商品价格
					cartItem.setMarketPrice(goods.getMarketPrice().toString());	//市场价
					cartItem.setPic(goodsImagesList.get(0).getPic());			//图片
					cartItem.setMerchantId(goods.getShopId());					//商家Id
					cartItem.setMerchantUrlAddress(merchant.getUrlAddress());	//商家地址
					cartItem.setMerchantShortName(merchant.getShortName());		//商家名称

					cartItemList.add(cartItem);
				}

				List<Map<String,Object>> orders = processJsonParameter(cartItemList, request);

				List<Order> list = orderService.saveOrder(getParamMap(), orders, null, isEnableConfirm() );

				String orderSn = "";
				String orderId = "";
				double totalAmount = 0.00;
				for( Order order : list ){
					if (StringUtils.isNotBlank(order.getId())) {
						orderSn += order.getOrderSn() + ",";
						orderId += order.getId() + ",";
						totalAmount += order.getTotalAmount();
						result.put("payType", order.getPayType());
						result.put("isEnableConfirm", isEnableConfirm());
						//未开启订单确认
						if( !isEnableConfirm() ){
							// 临时后台自动【确认】订单
							Order updateOrder = new Order();
							updateOrder.setId(order.getId());
							updateOrder.setModifyUser("system");
							updateOrder.setModifyDate(new Date());
							if ("offline".equals(order.getPayType())) {
								result.put("payType", "offline");
								result.put("orderId", order.getId());
								updateOrder.setOrderStatus(Order.OrderStatus.wait_seller_send_goods);
							} else if ("online".equals(order.getPayType())) {
								result.put("payType", "online");
								updateOrder.setOrderStatus(Order.OrderStatus.wait_buyer_pay);
							}
							orderService.update(getParamMap(), updateOrder);

							OrderLog orderLog = new OrderLog();
							orderLog.setTenantId(getTenantId());
							orderLog.setOrderSn(order.getOrderSn());
							orderLog.setType(updateOrder.getOrderStatus().toString());
							orderLog.setOperator(updateOrder.getModifyUser());
							orderLog.setInfo("确认订单");
							orderLog.setCreateUser(order.getCreateUser());
							orderLog.setOldType("cartItem");
							orderLog.setStatusType(OrderLog.StatusType.order.toString());
							orderLogService.save(getParamMap(), orderLog);
						}

						//如果使用云极ERP，调整库存
						if (isUseErpApi(getParamMap())) {
							try {
								// ERP-API 锁库存
								Criteria criteria = new Criteria();
								criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
								List<OrderItem> orderItemList = orderItemService.getList(getParamMap(), criteria);
								for (OrderItem orderItem : orderItemList) {
									Goods goodsObj = goodsService.get(getParamMap(), orderItem.getGoodsId());
									if (StringUtils.isNotEmpty(goodsObj.getShopId())) {
										Merchant merchantObj = merchantService.get(getParamMap(), goodsObj.getShopId());
										YunJiErpApiUtil.erpWareHouseList(merchantObj.getSign(), goodsObj.getSn(), orderItem.getQuantity(), 0);
									}
								}
							} catch (Exception ex) {
								logger.error("调用ERP-API锁库存时，发生异常", ex);
							}
						}

					}//end if
				}//end for
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "");
				result.put("orderSn", orderSn);
				result.put("orderId", orderId);
				result.put("totalAmount", totalAmount);
			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "保存失败，请联系管理员。");
		}

		return result;
	}




	/**
	 * * 新增方法：分店铺计算费用
	 * 1、计算店铺商品总金额：goodsTotal
	 * 2、计算店铺总运费：deliveryFeeTotal
	 * 3、店铺合计：shopTotal
	 * 4、店铺优惠金额：discount
	 *
	 * @param items
	 * @param scale 会员等级优惠比例
	 * @param deliveryId 配送方式ID
	 * @author TianYu
	 * @Date 2015-8-19
	 * UpdateUser:zhangqiang
	 * UPdateMessage:增加一个快递ID用于计算快递费用
	 *
	 * updateTime：  2016-1-18 14:56:29
	 * UpdateAuthor： TianYu
	 * DESC：添加会员优惠比例参数，计算订单的优惠金额
	 */
	private void costCalculation(List<Map<String, Object>> items, Double scale, String deliveryId) {
		if (items != null && items.size() > 0) {
			for (Map<String, Object> map : items) {
				/*增加一个存放快递id的参数 用于计算快递费用 Auth:zhangqiang Time:2015-09-25 17:52:35*/
				Map<String, Double> m = calculateShopFee((List<CartItem>) map.get("items"), deliveryId);

				/** 满减金额  hks 2016-4-15 12:52:13*/
				Double mjDecreaseAmount = 0.00;
				List<CartItem> cartItemList = (List<CartItem>) map.get("items");
				if (cartItemList != null && cartItemList.size() > 0) {
					for (CartItem item : cartItemList) {
						if(item.getMjDecreaseAmount() != null){
							mjDecreaseAmount = mjDecreaseAmount + Double.parseDouble(item.getMjDecreaseAmount());
						}
					}
				}

				Double discount = StringUtil.numberHalfAdjust(((Double)m.get("goodsTotal")) * scale / 100,2);
				discount = discount + mjDecreaseAmount;
				map.put("goodsTotal", m.get("goodsTotal"));
				map.put("discount", discount);//计算优惠比例
				map.put("deliveryFeeTotal", m.get("deliveryFeeTotal"));
				map.put("shopTotal", m.get("shopTotal") - discount);
			}
		}
	}


	/**
	 * 计算店铺中所有计算商品的
	 * 1、计算店铺商品总金额：goodsTotal
	 * 2、计算店铺总运费：deliveryFeeTotal
	 * 3、店铺合计：shopTotal
	 * <p/>
	 * UpdateUser:zhangqiang
	 * UpdateTime:2015-09-25 17:54:35
	 * UpdateContent:增加一个快递ID参数
	 *
	 * @param cartItemList 订单项列表
	 * @return 最终的配送费用
	 */
	private Map<String, Double> calculateShopFee(List<CartItem> cartItemList, String deliveryId) {
		Map<String, Double> map = new HashMap<String, Double>();
		double goodsTotal = 0.00;
		double deliveryFee = 0.00;
		DeliveryMethod deliveryMethod = null;
		try {
			/*当参数为0表示第一次进入支付审核页面 快递默认是第一个 否则 快递id为传值 Auth:zhangqiang Time:2015-09-25 17:56"35*/
			if ("0".equals(deliveryId)) {
				deliveryMethod = deliveryMethodService.get(getParamMap(), getDeliveryMethodList().get(0).getId());
			} else {
				deliveryMethod = deliveryMethodService.get(getParamMap(), deliveryId);
			}

			if (cartItemList != null && cartItemList.size() > 0) {
				double goodsTotalWeight = 0.00; // 商品总重量
				boolean isFreeDeliveryFee = true; // 默认true为包邮
				for (CartItem item : cartItemList) {
					Goods goods = goodsService.get(getParamMap(), item.getGoodsId());
					if(goods.getIsPost() == 0) { // 0为不包邮, 不包邮计算商品总重量
						isFreeDeliveryFee = false;
						goodsTotalWeight += goods.getWeight() * item.getQuantity();
					}
					goodsTotal += (goods.getPrice() * item.getQuantity());
				}
				if(isFreeDeliveryFee){ // 所有商品都包邮，则运费为0
					deliveryFee = 0.0;
				}else{
					/**  判断是否开启满就包邮  TianYu 2016-1-11 17:53:04  Start ***/
					String freeShippingNum = systemSetService.find(getParamMap(), "setkey", "freeShippingNum").getSetvalue();
					if(!"-1".equals( freeShippingNum )){//是否开启满就包邮
						if( goodsTotal >= Integer.parseInt( freeShippingNum ) ){//高于多少，包邮
							deliveryFee = 0;
						}else{//未达到包邮条件
							// 计算配送费用
							deliveryFee = countDeliveryFeeByWeight(goodsTotalWeight, deliveryMethod);
						}
					}else{
						// 计算配送费用
						deliveryFee = countDeliveryFeeByWeight(goodsTotalWeight, deliveryMethod);
					}
					/**  判断是否开启满就包邮  TianYu 2016-1-11 17:53:04  End ***/
				}
			}
		} catch (Exception e) {
			logger.error("计算配送费用时出异常", e);
		}
		map.put("goodsTotal", goodsTotal);
		map.put("deliveryFeeTotal", deliveryFee);
		map.put("shopTotal", goodsTotal + deliveryFee);
		return map;
	}


	/**
	 * 根据重量和配送方式计算配送费用
	 *
	 * @param goodsTotalWeight 商品总重量
	 * @param deliveryMethod   配送方式对象
	 * @return 配送费用
	 */
	private Double countDeliveryFeeByWeight(double goodsTotalWeight, DeliveryMethod deliveryMethod) {
		double deliveryFee = 0.00;
		if (goodsTotalWeight <= deliveryMethod.getFirstWeight()) {
			deliveryFee = deliveryMethod.getFirstPrice();
		} else {
			double overWeight = goodsTotalWeight - deliveryMethod.getFirstWeight(); // 多出来的重量
			int continueUnit = deliveryMethod.getContinueWeight() > 0 ? ((int) Math.ceil(overWeight / deliveryMethod.getContinueWeight())) : 0;// 有几个单位的续重,此处使用进1法，即3.1取4
			deliveryFee = deliveryMethod.getFirstPrice() + deliveryMethod.getContinuePrice() * continueUnit;
		}

		return deliveryFee;
	}



	/**
	 * 获取商品参加促销优惠活动的优惠价格 （目前只有 促销满减活动）
	 * @param cartItem
	 * @return
	 * @author hks
	 * @Date 2016-4-15
	 */
	private void getActivityDecreaseAmount(CartItem cartItem){
		String info = "获取商品满减优惠金额";
		setLogInfo(info);
		List<ActivityFullcutItem> activityFullcutItems = new ArrayList<>();
		List<ActivityFullcut> activityFullcuts = new ArrayList<>();
		List<ActivityDecreaseamount> activityDecreaseamounts = new ArrayList<>();
		try {
			activityFullcutItems = activityFullcutItemService.findList(getParamMap(), "itemId", cartItem.getGoodsId());
			//是否参与满减活动
			if(activityFullcutItems != null && activityFullcutItems.size() > 0){
				List<String> fullCutIds = new ArrayList<>();
				for (ActivityFullcutItem item:activityFullcutItems){
					fullCutIds.add(item.getFullCutId());
				}
				//详情页显示最新活动信息  排序在sql中进行 所以页面显示是获取集合get(0)
				activityFullcuts = activityFullcutService.findListByIds(getParamMap(),fullCutIds);
				if(activityFullcuts !=null && activityFullcuts.size()>0) {
					String itemId = "";
					for(ActivityFullcutItem item : activityFullcutItems ){
						if( item.getFullCutId().equals(activityFullcuts.get(0).getId())){
							itemId = item.getId();
							break;
						}
					}
					if(StringUtil.isNotEmpty(itemId)){
						activityDecreaseamounts = activityDecreaseamountService.findList(getParamMap(), "fullCutItemId", itemId);
						cartItem.setMjDecreaseAmount("0.00");
						for(ActivityDecreaseamount amount:activityDecreaseamounts){
							if(Double.parseDouble(cartItem.getPrice()) * cartItem.getQuantity() >= amount.getTotalPrice()){
								if(amount.getDecreaseAmount()>= Double.parseDouble(cartItem.getMjDecreaseAmount())) {
									cartItem.setMjCondition(String.valueOf(amount.getTotalPrice()));
									cartItem.setMjDecreaseAmount(String.valueOf(amount.getDecreaseAmount()));
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	/**
	 * * 添加方法，list()中调用
	 * 按照商品所属商家对商品进行分组
	 * 返回Map的key：
	 * 1、shopId:String
	 * 2、shopName:String
	 * 3、shopUrl:String
	 * 4、items：List<CartItem>
	 *
	 * @param cartItems
	 * @return
	 * @author TianYu
	 * @Date 2015-8-19
	 */
	private List<Map<String, Object>> groupCartItemByShop(List<CartItem> cartItems) {
		if (cartItems == null || cartItems.size() == 0) {
			return null;
		}
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		//获取所有的商家ID
		Set<String> merchants = new HashSet<String>();
		for (CartItem ci : cartItems) {
			merchants.add(ci.getMerchantId());
		}

		//组装数据
		for (String mid : merchants) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("shopId", mid);

			Iterator<CartItem> it = cartItems.iterator();
			List<CartItem> items = new ArrayList<CartItem>(0);
			while (it.hasNext()) {
				CartItem ci = it.next();
				if (mid.equals(ci.getMerchantId())) {
					if (!map.containsKey("shopName") && !map.containsKey("shopUrl")) {
						map.put("shopName", ci.getMerchantShortName());
						map.put("shopUrl", ci.getMerchantUrlAddress());
					}
					//组装规格
					installSp(ci);

					items.add(ci);
					it.remove();
				}
			}
			map.put("items", items);
			list.add(map);
		}
		return list;
	}
	/**
	 * 组装商品规格
	 * @param ci TianYu 2015-9-14
	 */
	private void installSp(CartItem ci) {
		if (StringUtil.isNotEmpty(ci.getSpecification())) {
			if (ci.getSpecification().indexOf(")X") > 0) {
				int count = 0;
				String[] sps = ci.getSpecification().split(";");
				for (int i = 0; i < sps.length; i++) {
					if (i < sps.length - 1) {
						count += Integer.parseInt(sps[i].substring(sps[i].lastIndexOf("X") + 1));
					}

				}
				ci.setSpecification(ci.getSpecification() + "X" + (ci.getQuantity() - count));
			} else {
				ci.setSpecification(ci.getSpecification() + "X" + ci.getQuantity());
			}
		}
	}


	/**
	 * 查询配送方式
	 *
	 * @return
	 */
	private List<DeliveryMethod> getDeliveryMethodList() {
		List<DeliveryMethod> deliveryMethods = null;
		try {
			/** 查询配送方式加启用条件 Auth:zhangqiang 2015-09-21 14:47:35 Start */
//			deliveryMethods = deliveryMethodService.getAll(getTenantId());
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("enabled", 1));
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY, getPlatform()));
			deliveryMethods = deliveryMethodService.getList(getParamMap(), criteria);
			/** 查询配送方式加启用条件 Auth:zhangqiang 2015-09-21 14:47:35 End */
		} catch (Exception e) {
			logger.error("查询配送方式时发生异常Exception:" + e);
			e.printStackTrace();
		}
		return deliveryMethods;
	}

	/**
	 * 查询支付方式
	 * @return
	 */
	private List<DeliveryTime> getDeliveryTimeList() {
		List<DeliveryTime> list = null;
		try {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.order("orderNo", "ASC"));
			criteria.add(Restrictions.eq(Constant.PLATFORM_KEY,getPlatform()));
			list = deliveryTimeService.getList(getParamMap(), criteria);
		} catch (Exception e) {
			logger.error("查询支付方式时发生异常Exception:" + e);
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 查询字符方式
	 * @return
	 */
	private List<PaymentMethod> getPaymentMethodList() {
		List<PaymentMethod> paymentMethods = null;
		try {
			paymentMethods = paymentMethodService.getAll(getParamMap());
		} catch (Exception e) {
			logger.error("查询支付方式时发生异常Exception:" + e);
			e.printStackTrace();
		}
		return paymentMethods;
	}

	/**
	 * 新增方法
	 * 判断系统是否开启订单确认
	 * @Author TianYu
	 * @Date 2015-8-19
	 * @return
	 */
	private boolean isEnableConfirm(){
		try {
			SystemSet s = systemSetService.find(getParamMap(), "setKey", "isEnableConfirm");

			return s!=null?Boolean.parseBoolean(s.getSetvalue()):false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}


	/**
	 * 处理前端传过来的json参数对象
	 * @param cartItemList 购物车ID集合
	 * @param request 获取前端传过来的json参数对象
	 * @return 普通map
	 *
	 * updateTime： 2016-1-18 15:46:45
	 * updateAuthor： TianYu
	 * DESC：添加 会员等级优惠
	 */
	private List<Map<String,Object>> processJsonParameter(List<CartItem> cartItemList,HttpServletRequest request) throws Exception {
		List<Map<String,Object>> orders = new ArrayList<Map<String, Object>>();

		Map<String, Object> orderMap = new HashMap<String, Object>();
		Member member = getCurrentMember(request);
		/** 获取会员等级 TianYu  2016-1-18 14:45:56 Start **/
		MemberRank memberRank = this.memberRankService.get(getParamMap(), member.getRankId());
		double scale = memberRank.getScale()/100;//等级优惠
		/** 获取会员等级 TianYu  2016-1-18 14:45:56 End **/
		String receiverId = request.getParameter("receiverId"); // 收货人信息Id
		String paymentMethodId = request.getParameter("paymentMethodId"); // 支付方式Id
		String deliveryMethodId = request.getParameter("deliveryMethodId"); // 配送方式Id
		/**送货时间 Auth:hks Time:2015-11-13 14:37:52 Start **/
//		String deliveryTime = request.getParameter("deliveryTime"); // 送货时间
		String deliveryTime = request.getParameter("order_deliveryTimeName");
		/**送货时间 Auth:hks Time:2015-11-13 14:37:52 end **/
		String invoiceType=request.getParameter("invoiceType"); //发票类型
		String invoiceTitle=request.getParameter("invoiceTitle"); //发票抬头
		String invoiceContent=request.getParameter("invoiceContent"); //发票内容
		String platform=request.getParameter("platform"); //平台类型
		String enquiryId=request.getParameter("enquiryId"); //询价单ID
		String quotationId=request.getParameter("quotationId"); //报价单ID

		String dataFrom =request.getParameter("dataFrom"); //标记订单来源， 1.EC购物车；2.BEC购物车；3.报价单  来区分商品价格获取

		Receiver receiver = receiverService.get(getParamMap(), receiverId);
		PaymentMethod paymentMethod = paymentMethodService.get(getParamMap(), paymentMethodId);
		DeliveryMethod deliveryMethod = deliveryMethodService.get(getParamMap(), deliveryMethodId);
		Quotation quotation = quotationService.get(getParamMap(), quotationId);
		List<QuotationDetails> quotationDetailsList = quotationDetailsService.getListByQuotationId(getParamMap(), quotationId);

		/** 收货人信息 **/
		orderMap.put("memberId", getCurrentMember(request).getId());
		orderMap.put("shipName", receiver.getName());
		orderMap.put("shipAreaId", receiver.getAreaId());
		orderMap.put("shipAreaPath", receiver.getAreaPath());
		orderMap.put("shipAddress", receiver.getAddress());
		orderMap.put("shipZipCode", receiver.getZipCode());
		orderMap.put("shipPhone", receiver.getPhone());
		orderMap.put("shipMobile", receiver.getMobile());
		/** 支付方式 **/
		orderMap.put("paymentMethodId", paymentMethod.getId());
		orderMap.put("paymentMethodName", paymentMethod.getName());
		orderMap.put("payType", paymentMethod.getType());
		/** 配送方式 **/
		orderMap.put("deliveryMethodId", deliveryMethod.getId());
		orderMap.put("deliveryMethodName", deliveryMethod.getName());
		orderMap.put("deliveryTime", deliveryTime);
		/** 发票信息 **/
		orderMap.put("invoiceType", invoiceType);
		orderMap.put("invoiceTitle", invoiceTitle);
		orderMap.put("invoiceContent", invoiceContent);
		/**平台类型(1.B2B、2.B2C) **/
		orderMap.put("platform", platform);
		orderMap.put("enquiryId", enquiryId);
		orderMap.put("quotationId", quotationId);


		/** 购物车 **/

		if (cartItemList != null && cartItemList.size() > 0) {

			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 Start */
			List<Map<String,Object>> items = groupCartItemByShop(cartItemList);
			costCalculation(getParamMap(), deliveryMethodId, items);
			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 End */

			for(Map<String,Object> map : items){
				Map<String,Object> pMap = new HashMap<String,Object>();
				Map<String, Object> order = new HashMap<String, Object>();
				List<Map<String, Object>> orderItemMapList = new ArrayList<Map<String, Object>>();
				order.putAll(orderMap);
				/*	1、计算店铺商品总金额：goodsTotal
							* 2、计算店铺总运费：deliveryFeeTotal
							* 3、店铺合计：shopTotal
							* 4、商品总数：goodsTotalQuantity*/
				order.put("shopId", map.get("shopId"));

				order.put("goodsTotalPrice", map.get("goodsTotal"));
				order.put("deliveryFee", map.get("deliveryFeeTotal"));
				order.put("goodsTotalQuantity", map.get("goodsTotalQuantity"));
				/** 添加等级优惠金额  TianYu 2016-1-18 15:46:21 Start */
				Double discount = StringUtil.numberHalfAdjust(((Double) map.get("goodsTotal")) * scale , 2);

				discount += (Double) map.get("cxTotal");//满减优惠  TianYu 2016-04-15 16:37:09

				order.put("discount", discount);//优惠金额
				/** 添加等级优惠金额  TianYu 2016-1-18 15:46:21 End */
				order.put("totalAmount", (Double)map.get("shopTotal") - discount);//订单总额
				order.put("memberId",member.getId() );
				order.put("createUser", member.getUserName());
				order.put("platform", getPlatform());

				for (CartItem item : (List<CartItem>)map.get("items")) {
					// 组装OrderItem的Map
					Map<String, Object> orderItemMap = new HashMap<String, Object>();
					orderItemMap.put("goodsId", item.getGoodsId());
					orderItemMap.put("goodsName", item.getName());
					//orderItemMap.put("goodsPrice", item.getPrice());
					orderItemMap.put("quantity", item.getQuantity());
					orderItemMap.put("createUser", member.getUserName());
					Goods g=goodsService.find(getParamMap(), "id", item.getGoodsId());
					orderItemMap.put("goodsName", g.getName());
					orderItemMap.put("goodsPrice", g.getPrice());
					/** 组装规格及备注 TianYu 2015-9-14 Start */
					installSp(item);
					orderItemMap.put("specification", item.getSpecification());
					orderItemMap.put("ps", request.getParameter("ps_" + item.getGoodsId()));
					/** 组装规格及备注 TianYu 2015-9-14 End */


					/** 满减计算 TianYu 2016-04-15 16:33:04 Start */
					orderItemMap.put("tableName", item.getTableName());
					orderItemMap.put("tablePkId", item.getTablePkId());
					orderItemMap.put("preferentialMoney", item.getPreferentialMoney());
					/** 满减计算 TianYu 2016-04-15 16:33:04 End */
					orderItemMapList.add(orderItemMap);
				}
				pMap.put("dataFrom", dataFrom);//标记订单来源， 1.EC购物车；2.BEC购物车；3.报价单  来区分商品价格获取
				pMap.put("order", order);
				pMap.put("orderItems", orderItemMapList);
				orders.add(pMap);
			}

		}
		/** 组装报价单提交过来的商品等数据 hks 2015-10-22 Start */
		/**
		 * 报价单
		 */
		if(quotation != null && quotation.getIsDownOrder()!=2){//判断报价单是否下单
			if (quotationDetailsList != null && quotationDetailsList.size() > 0) {
				Map<String,Object> pMap = new HashMap<String,Object>();
				Map<String, Object> order = new HashMap<String, Object>();
				List<Map<String, Object>> orderItemMapList = new ArrayList<Map<String, Object>>();

				//组装订单数据
				order.putAll(orderMap);
				order.put("shopId", quotation.getMerchantId());
				order.put("goodsTotalPrice", quotation.getGoodsTotalCost());
				order.put("deliveryFee", quotation.getFreightTotalCost());
				order.put("totalAmount", quotation.getTotalCost());
				order.put("memberId",member.getId() );
				order.put("createUser", member.getUserName());
				int goodsTotalQuantity = 0;
				for (QuotationDetails item : quotationDetailsList) {
					goodsTotalQuantity = goodsTotalQuantity + item.getPurchaseNum();
					// 组装OrderItem的Map
					Map<String, Object> orderItemMap = new HashMap<String, Object>();
					orderItemMap.put("goodsId", item.getGoodsId());
					orderItemMap.put("goodsName", item.getGoodsName());
					orderItemMap.put("goodsPrice", item.getQuotationPrice());
					orderItemMap.put("quantity", item.getPurchaseNum());
					orderItemMap.put("units", item.getUnits());
					orderItemMap.put("containTax", item.getContainTax());
					orderItemMap.put("freight", item.getFreight());
					orderItemMap.put("goodsPriceCount", (item.getProductCount()-item.getFreight()));
					orderItemMap.put("createUser", member.getUserName());
					/** 组装规格及备注 TianYu 2015-9-14 Start */
					//				installSp(item);
					//				orderItemMap.put("specification", item.getSpecification());
					orderItemMap.put("ps", request.getParameter("ps_" + item.getGoodsId()));
					/** 组装规格及备注 TianYu 2015-9-14 End */

					orderItemMapList.add(orderItemMap);
				}
				order.put("goodsTotalQuantity", goodsTotalQuantity);

				pMap.put("dataFrom", dataFrom);//标记订单来源， 1.EC购物车；2.BEC购物车；3.报价单  来区分商品价格获取
				pMap.put("order", order);
				pMap.put("orderItems", orderItemMapList);
				orders.add(pMap);

			}
		}
		/** 组装报价单提交过来的商品等数据 hks 2015-10-22 end */
		return orders;
	}


	/**
	 * 	 * 新增方法：分店铺计算费用
	 * 1、计算店铺商品总金额：goodsTotal
	 * 2、计算店铺总运费：deliveryFeeTotal
	 * 3、店铺合计：shopTotal
	 * 4、商品总数：goodsTotalQuantity
	 * @author TianYu
	 * @Date 2015-8-19
	 * @param paramMap
	 * @param deliveryMethodId
	 * @param items
	 */
	private void costCalculation(Map<String, Object> paramMap, String deliveryMethodId,List<Map<String,Object>> items){
		if( items != null && items.size() > 0 ){
			for(Map<String,Object> map : items ){
				Map<String,Object> m = calculateShopFee(getParamMap(),deliveryMethodId,(List<CartItem>)map.get("items"));
				map.put("cxTotal", m.get("cxTotal"));
				map.put("goodsTotal", m.get("goodsTotal"));
				map.put("deliveryFeeTotal", m.get("deliveryFeeTotal"));
				map.put("goodsTotalQuantity", m.get("goodsTotalQuantity"));
				map.put("shopTotal", m.get("shopTotal"));
			}
		}
	}


	/**
	 * 计算店铺中所有计算商品的
	 * 1、计算店铺商品总金额：goodsTotal
	 * 2、计算店铺总运费：deliveryFeeTotal
	 * 3、店铺合计：shopTotal
	 * 4、商品总数：goodsTotalQuantity
	 * @param cartItemList     订单项列表
	 *
	 * @return 最终的配送费用
	 */
	private Map<String,Object> calculateShopFee(Map<String, Object> paramMap, String deliveryMethodId,List<CartItem> cartItemList) {
		Map<String,Object> map = new HashMap<String, Object>();
		double goodsTotal = 0.00;
		double deliveryFee = 0.00;
		double cxTotal = 0.00;
		int goodsTotalQuantity = 0;
		try {
			DeliveryMethod deliveryMethod = deliveryMethodService.get(getParamMap(), deliveryMethodId);
			if (cartItemList != null && cartItemList.size() > 0) {
				double goodsTotalWeight = 0.00; // 商品总重量
				boolean isFreeDeliveryFee = true; // 默认true为包邮
				for (CartItem item : cartItemList) {
					Goods goods = goodsService.get(getParamMap(), item.getGoodsId());
					/** 组装商品名称、单价  TianYu  2015-10-27 Start */
					item.setName( goods.getName() );
					item.setPrice( goods.getPrice()+"" );
					/** 组装商品名称、单价  TianYu  2015-10-27 End */
					if(goods.getIsPost() == 0) { // 0为不包邮, 不包邮计算商品总重量
						isFreeDeliveryFee = false;
						goodsTotalWeight += goods.getWeight() * item.getQuantity();
					}
					goodsTotal += (goods.getPrice() * item.getQuantity());
					goodsTotalQuantity += item.getQuantity();

					/** 满减计算 TianYu 2016-04-15 16:33:04 Start */
					ActivityDecreaseamount activityDecreaseamount = activityDecreaseamountService.getDecreByGoodsId(getParamMap(), item.getGoodsId(),(goods.getPrice() * item.getQuantity()));
					if( activityDecreaseamount != null ){
						cxTotal += activityDecreaseamount.getDecreaseAmount()==null?0:activityDecreaseamount.getDecreaseAmount();
						item.setTableName("cx_activity_decreaseamount");
						item.setTablePkId( activityDecreaseamount.getId() );
						item.setPreferentialMoney( activityDecreaseamount.getDecreaseAmount() );
					}
					/** 满减计算 TianYu 2016-04-15 16:33:04 End */
				}
				if(isFreeDeliveryFee){ // 所有商品都包邮，则运费为0
					deliveryFee = 0.0;
				}else{
					// 计算配送费用
					/**  判断是否开启满就包邮  TianYu 2016-1-11 17:53:04  Start ***/
					String freeShippingNum = systemSetService.find(getParamMap(), "setkey", "freeShippingNum").getSetvalue();
					if(!"-1".equals( freeShippingNum )){//是否开启满就包邮
						if( goodsTotal >= Integer.parseInt( freeShippingNum ) ){//高于多少，包邮
							deliveryFee = 0;
						}else{//未达到包邮条件
							// 计算配送费用
							deliveryFee = countDeliveryFeeByWeight(goodsTotalWeight, deliveryMethod);
						}
					}else{
						// 计算配送费用
						deliveryFee = countDeliveryFeeByWeight(goodsTotalWeight, deliveryMethod);
					}
					/**  判断是否开启满就包邮  TianYu 2016-1-11 17:53:04  End ***/
				}
			}
		} catch (Exception e) {
			logger.error("计算配送费用时出异常", e);
		}

		map.put("cxTotal", cxTotal);
		map.put("goodsTotal", goodsTotal);
		map.put("deliveryFeeTotal", deliveryFee);
		map.put("goodsTotalQuantity", goodsTotalQuantity);
		map.put("shopTotal", goodsTotal + deliveryFee);
		return map;
	}


	@RequestMapping("/validPromotionsType/{goodsId}")
	@ResponseBody
	public Object validPromotionsType(HttpServletRequest request, @PathVariable String goodsId) {
		String info = "验证此商品是否在促销活动中";
		Map<String, Object> resultMap = new HashMap<String, Object>();

		try {
			//20160802 dzz 根据商品id查询对应的活动类型信息
			Criteria c1 = new Criteria();
			c1.add(Restrictions.eq("goodsId", goodsId));
			c1.add(Restrictions.eq("status", "ing"));
			Pager pager = new Pager();
			pager = promotionsService.getMxAndTgPager(getParamMap(), c1, null, pager);
			if(pager.getList()!=null && pager.getList().size()>0) {
				MTPromotions mTPromotions = pager.getList() != null && pager.getList().size() > 0 ? (MTPromotions)pager.getList().get(0) : null;
				String msOrTg = "";//促销活动类型
				if("seckill".equals(mTPromotions.getActivityType())) {
					msOrTg = "m";
				} else if("groupon".equals(mTPromotions.getActivityType())) {
					msOrTg = "t";
				}
				resultMap.put("mt", msOrTg);
				resultMap.put(STATUS, SUCCESS);
				resultMap.put(MESSAGE, "促销活动商品查询验证成功");
			} else {
				resultMap.put(STATUS, SUCCESS);
				resultMap.put(MESSAGE, "此商品验证失败");
			}
		} catch (Exception e) {
			resultMap.put(STATUS, ERROR);
			resultMap.put(MESSAGE, "亲, 此商品是否在促销活动中验证失败");
			logger.error("访问" + info + "时，发生异常", e);
			e.printStackTrace();
		}

		return resultMap;
	}

}
