package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSONObject;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.cuxiao.MTPromotions;
import net.deepdragon.entity.cuxiao.Promotions;
import net.deepdragon.entity.cuxiao.PromotionsGoods;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.erp.yunji.api.YunJiErpApiUtil;
import net.deepdragon.service.cuxiao.PromotionsGoodsService;
import net.deepdragon.service.cuxiao.PromotionsService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.bean.CartItemCookie;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.CrossborderUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.util.*;

/**
 * 购物车页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "CartController")
@RequestMapping("/cart")
public class CartController extends BaseMallController {
	@Resource
	private CacheData cacheData;
	@Resource
	private CartItemService cartItemService;
	@Resource
	private GoodsImagesService goodsImagesService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private MerchantService merchantService;
	@Resource
	private ActivityFullcutService activityFullcutService;
	@Resource
	private ActivityFullcutItemService activityFullcutItemService;
	@Resource
	private ActivityDecreaseamountService activityDecreaseamountService;

	@Resource
	private PromotionsService promotionsService;
	@Resource
	private PromotionsGoodsService promotionsGoodsService;

	@RequestMapping(value = "/ajaxAddCart")
	public @ResponseBody
	Object ajaxAddCart(HttpServletRequest request) {
		String info = "购物车添加商品";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String memberId = request.getParameter("memberId");
			String goodsId = request.getParameter("gid");
			String quantity = request.getParameter("cnt");
			int count = Integer.parseInt(quantity);

			/** 保存购物车时保存商品所属商家信息 TianYu 2015-8-19  */
			Goods goods = goodsService.get(getParamMap(), goodsId);
			boolean flag = cartItemService.saveCartItemValues(getParamMap(), memberId, goodsId, goods.getShopId(), count, "");

			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "操作成功");
			result.put(DATA, flag);
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}

	@RequestMapping(value = "/settlement")
	public String toSettlement(Model model, HttpServletRequest request, HttpServletResponse response){
		add(model, request, response, true);
		String type=request.getParameter(Global.WHICHCLIENT);
		if (Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/shopping_cart";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/cart_list";
		}
	}

	@RequestMapping(value = "/add")
	public String addToCart(Model model, HttpServletRequest request, HttpServletResponse response) {
		String type=request.getParameter(Global.WHICHCLIENT);
		if (Global.WHICH_APP.equals(type)){//移动端商品详情页加入购物车
//			cartItemList(model,request,info);

			//add(model, request, response, true);
			Map<String, Object> result = add(request, response, true);
			for(String key: result.keySet()){
				model.addAttribute(key, result.get(key));
			}
			return "redirect:/cart/list?whichclient=whichapp";
		}else{
			/*
			 * 20160803 dzz 验证商品是否为促销活动类型, 如果是则跳转至商品详情页
			 */
			try {
				String goodsId = request.getParameter("gid");
				//20160802 dzz 根据商品id查询对应的活动类型信息
				Criteria c1 = new Criteria();
				c1.add(Restrictions.eq("goodsId", goodsId));
				c1.add(Restrictions.eq("status", "ing"));
				c1.add(Restrictions.eq("activityType", "groupon"));//团购
				Pager pager = new Pager();
				pager = promotionsService.getMxAndTgPager(getParamMap(), c1, null, pager);
				if(pager.getList()!=null && pager.getList().size()>0) {
					return "redirect:/item/"+goodsId+".html";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			add(model, request, response, false);
			getAllCatelog(model);// 首页类目展示
			return Global.TEMPLATE_MALL + PATH + "/cart";
		}
	}

	@RequestMapping(value = "/ajax/add")
	public
	@ResponseBody
	Map<String, Object> addToCart(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result = add(request, response, true);
		} catch (Exception e) {
			logger.error("购物车添加商品时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "购物车添加商品时，发生异常");
		}
		return result;
	}


	/**
	 * 验证是否在团购活动中
	 * @param request
	 * @param response
	 * @return
     */
	@RequestMapping(value = "/ajaxCheckP")
	public
	@ResponseBody
	Map<String, Object> ajaxCheckP(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "success");
		try {
			String goodsId = request.getParameter("gid");
			//20160802 dzz 根据商品id查询对应的活动类型信息
			Criteria c1 = new Criteria();
			c1.add(Restrictions.eq("goodsId", goodsId));
			c1.add(Restrictions.eq("status", "ing"));
			c1.add(Restrictions.eq("activityType", "groupon"));//团购
			Pager pager = new Pager();
			pager = promotionsService.getMxAndTgPager(getParamMap(), c1, null, pager);
			if(pager.getList()!=null && pager.getList().size()>0) {
				result.put(STATUS, WARN);
				result.put(MESSAGE, "success");
			}
		} catch (Exception e) {
			logger.error("购物车添加商品时，发生异常", e);
			e.printStackTrace();
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "购物车添加商品时，发生异常");
		}
		return result;
	}

	@RequestMapping(value = "/goBuy")
	public String goBuy(Model model, HttpServletRequest request, HttpServletResponse response) {
		String type=request.getParameter(Global.WHICHCLIENT);
		if (Global.WHICH_APP.equals(type)){//移动端商品详情页加入购物车
//			cartItemList(model,request,info);

			add(model, request, response, true);
			return "redirect:/cart/list?whichclient=whichapp";
		}else{
			add(model, request, response, false);
			return "redirect:/cart/list";
		}
	}

	/**
	 * 保存购物车数据
	 * 1、判断是否启用ERP，启用，进行库存校验；
	 * 2、判断用户登录状态：
	 * 		登录，调用CartItemService.saveCartItemValues直接更新或保存商品信息到购物车表（wp_cart_item）；
	 * 		未登录：
	 * 			如果 Cookie中存在商品数据，CartItemService.saveCartItemValuesByUserKey直更新或保存商品数据到购物车表；
	 * 			如果Cookie中不存在，添加商品信息到Cookie，同时保存购物信息到购物车
	 *
	 * 	更新：TianYu 2015-8-19 同时保存商品所属商家的ID到购物车表
	 *
	 * @param model
	 * @param request
	 * @param response
	 * @param isAddList true 手机端， false PC端
	 */
	private void add(Model model, HttpServletRequest request, HttpServletResponse response, Boolean isAddList){
		String info = "加入购物车";
		setLogInfo(info);
		logger.debug(info);
		String goodsId = request.getParameter("gid");
		String quantity = request.getParameter("cnt");
		String sp = request.getParameter("sp");//规格


		try {
			String backurl = URLDecoder.decode(request.getParameter("backurl"),"utf-8");

			if(StringUtil.isNotEmpty(sp)){
				sp = URLDecoder.decode(sp,"utf-8");
			}//规格

			/** 在搜索列表页点击加入购物车时，添加默认的规格型号（默认第一个）  TianYu  2015-9-29 Start */
			if( StringUtil.isEmpty(sp) ){
				Map<String, List<Map<String, Object>>> goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);
//				result.put("goodsSpList", goodsSpList);
//				result.put("goodsSpItemList", goodsSpItemList);
				List<Map<String, Object>> goodsSpList = goodsSpInfoMap.get("goodsSpList");
				List<Map<String, Object>> goodsSpItemList = goodsSpInfoMap.get("goodsSpItemList");
				StringBuilder sb = new StringBuilder();
				if( goodsSpList != null && goodsSpList.size() > 0 && goodsSpItemList != null && goodsSpItemList.size() > 0){
					int i = 0;
					for(Map<String, Object> spm : goodsSpList ){
						for(Map<String, Object> spi : goodsSpItemList ){
							if( StringUtil.isNotEmpty(spm.get("id")) && spm.get("id").equals(spi.get("specificationId")) ){
								if( i > 0 ){
									sb.append(",");
								}
								i++;
								sb.append(spm.get("name")).append(":").append( spi.get("name") );
								break;
							}
						}
					}
				}

				sp = sb.toString();
			}
			/** 在搜索列表页点击加入购物车时，添加默认的规格型号  TianYu  2015-9-29 End */

			// 查询库存
			int stock = -1;
			try {
				//如果使用了云极ERP，与ERP进行库存查询
				if (isUseErpApi(getParamMap())) {
					Goods goods = goodsService.get(getParamMap(), goodsId);
					if (StringUtils.isNotEmpty(goods.getShopId())) {
						Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
						String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
//						String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getProductId());
						JSONObject json = JSONObject.parseObject(result);
						if (json.getBoolean("isSuccessed")) {
							stock = json.getInteger("stock");
						}
					}// end if goods.getShopId()
				}// end if isUseErpApi
			} catch (Exception e) {
				e.printStackTrace();
			}
			//如果使用云极ERP，且购买数量 > 实际库存，且此商品存在，不能加入购物车
			if (isUseErpApi(getParamMap()) && Integer.parseInt(quantity)>stock&& stock!=-1) {
				model.addAttribute("message", "库存不足,加入购物车失败！");
				model.addAttribute("backurl", backurl);
				setPublicDate2Model( model );

			} else {
				//使用云极ERP且库存充足或者未使用云极ERP
				Goods goods = goodsService.get(getParamMap(), goodsId);
				if (goods != null) {
					int count = Integer.parseInt(quantity);
					Member mb = getCurrentMember(request);
					//用户登录时
					if (mb != null && mb.getId() != null) {
						try {
							//保存数据到购物车
							boolean flag = cartItemService.saveCartItemValues(getParamMap(), mb.getId(), goodsId, goods.getShopId(), count, sp);
							if (flag) {
								model.addAttribute("message", "success");
							} else {
								model.addAttribute("message", "商品加入购物车失败！");
							}
							//没有中转页面，所以需要直接读取商品数据
							if (isAddList) {//APP端
								model.addAttribute("isLogin", "1");
								model.addAttribute("cartItemList", cartItemService.getListByMemberId(getParamMap(), mb.getId()));
							}
						} catch (Exception e) {
							model.addAttribute("message", "商品加入购物车失败！");
						}
					} else { //未登陆时
						boolean isExist = false;
						Cookie[] cookies = request.getCookies();
						//判断是否存在Cookie
						if (cookies != null && cookies.length > 0) {
							for (Cookie cookie : cookies) {
								//判断Cookie中是否存在购物信息
								if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
									if (StringUtils.isNotEmpty(cookie.getValue())) {
										String userkey = cookie.getValue();
										try {
											//保存数据到购物车
											boolean flag = cartItemService.saveCartItemValuesByUserKey(getParamMap(), userkey, goodsId, goods.getShopId(), count, sp);
											if (flag) {
												model.addAttribute("message", "success");
											} else {
												model.addAttribute("message", "商品加入购物车失败！");
											}
											//没有中转页面，所以需要直接读取商品数据
											if (isAddList) {
												model.addAttribute("cartItemList", cartItemService.getListByUserKey(getParamMap(), userkey));
											}
										} catch (Exception e) {
											model.addAttribute("message", "商品加入购物车失败！");
										}
										isExist = true;
									}
								}//end if 是否存在购物信息
							}
						}
						//如果没有购物信息，保存购物信息到Cookie和购物车表
						if (!isExist) {
							String userkey = request.getSession().getId();
							try {
								Cookie cookie = new Cookie(CartItemCookie.USERKEY_COOKIE_NAME, userkey);
								cookie.setPath(request.getContextPath() + "/");
								cookie.setMaxAge(CartItemCookie.USERKEY_COOKIE_MAX_AGE);
								response.addCookie(cookie);
								boolean flag = cartItemService.saveCartItemValuesByUserKey(getParamMap(), userkey, goodsId, goods.getShopId(), count, sp);
								if (flag) {
									model.addAttribute("message", "success");
								} else {
									model.addAttribute("message", "商品加入购物车失败！");
								}
								//没有中转页面，所以需要直接读取商品数据
								if (isAddList) {
									model.addAttribute("cartItemList", cartItemService.getListByUserKey(getParamMap(), userkey));
								}
							} catch (Exception e) {
								model.addAttribute("message", "商品加入购物车失败！");
							}
						}
					}//end if 是否登录
					model.addAttribute("message", "success");
					model.addAttribute("backurl", backurl);
					model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
					model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
					model.addAttribute("services", cacheData.getServices(getParamMap()));
				}// end if 商品存在
			}// end else 未使用云极ERP

		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}
	}


	private Map<String, Object> add(HttpServletRequest request, HttpServletResponse response, Boolean isAddList){
		String info = "加入购物车";
		setLogInfo(info);
		logger.debug(info);
		String goodsId = request.getParameter("gid");
		String quantity = request.getParameter("cnt");
		String backurl = request.getParameter("backurl");
		String sp = request.getParameter("sp");//规格
		Map<String, Object> resultMap = new HashMap<String, Object>();

		try {

			if(StringUtil.isNotEmpty(sp)){
				sp = URLDecoder.decode(sp,"utf-8");
			}//规格

			/** 在搜索列表页点击加入购物车时，添加默认的规格型号（默认第一个）  TianYu  2015-9-29 Start */
			if( StringUtil.isEmpty(sp) ){
				Map<String, List<Map<String, Object>>> goodsSpInfoMap = goodsService.getGoodsSpInfo(getParamMap(), goodsId);
//				result.put("goodsSpList", goodsSpList);
//				result.put("goodsSpItemList", goodsSpItemList);
				List<Map<String, Object>> goodsSpList = goodsSpInfoMap.get("goodsSpList");
				List<Map<String, Object>> goodsSpItemList = goodsSpInfoMap.get("goodsSpItemList");
				StringBuilder sb = new StringBuilder();
				if( goodsSpList != null && goodsSpList.size() > 0 && goodsSpItemList != null && goodsSpItemList.size() > 0){
					int i = 0;
					for(Map<String, Object> spm : goodsSpList ){
						for(Map<String, Object> spi : goodsSpItemList ){
							if( StringUtil.isNotEmpty(spm.get("id")) && spm.get("id").equals(spi.get("specificationId")) ){
								if( i > 0 ){
									sb.append(",");
								}
								i++;
								sb.append(spm.get("name")).append(":").append( spi.get("name") );
								break;
							}
						}
					}
				}

				sp = sb.toString();
			}
			/** 在搜索列表页点击加入购物车时，添加默认的规格型号  TianYu  2015-9-29 End */

			// 查询库存
			int stock = -1;
			try {
				//如果使用了云极ERP，与ERP进行库存查询
				if (isUseErpApi(getParamMap())) {
					Goods goods = goodsService.get(getParamMap(), goodsId);
					if (StringUtils.isNotEmpty(goods.getShopId())) {
						Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
						String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
//						String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getProductId());
						JSONObject json = JSONObject.parseObject(result);
						if (json.getBoolean("isSuccessed")) {
							stock = json.getInteger("stock");
						}
					}// end if goods.getShopId()
				}// end if isUseErpApi
			} catch (Exception e) {
				e.printStackTrace();
			}
			//如果使用云极ERP，且购买数量 > 实际库存，且此商品存在，不能加入购物车
			if (isUseErpApi(getParamMap()) && Integer.parseInt(quantity)>stock&& stock!=-1) {
				resultMap.put("message", "库存不足,加入购物车失败！");
				resultMap.put("backurl", backurl);
				resultMap.put("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
				resultMap.put("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
				resultMap.put("services", cacheData.getServices(getParamMap()));

			} else {
				//使用云极ERP且库存充足或者未使用云极ERP
				Goods goods = goodsService.get(getParamMap(), goodsId);
				if (goods != null) {
					int count = Integer.parseInt(quantity);
					Member mb = getCurrentMember(request);
					//用户登录时
					if (mb != null && mb.getId() != null) {
						try {
							//保存数据到购物车
							boolean flag = cartItemService.saveCartItemValues(getParamMap(), mb.getId(), goodsId, goods.getShopId(), count, sp);
							if (flag) {
								resultMap.put(STATUS, SUCCESS);
								resultMap.put(MESSAGE, "success");
							} else {
								resultMap.put(STATUS, ERROR);
								resultMap.put(MESSAGE, "商品加入购物车失败！");
							}
							//没有中转页面，所以需要直接读取商品数据
							if (isAddList) {//APP端
								resultMap.put("isLogin", "1");
								resultMap.put("cartItemList", cartItemService.getListByMemberId(getParamMap(), mb.getId()));
							}
						} catch (Exception e) {
							resultMap.put(STATUS, ERROR);
							resultMap.put(MESSAGE, "商品加入购物车失败！");
						}
					} else { //未登陆时
						boolean isExist = false;
						Cookie[] cookies = request.getCookies();
						//判断是否存在Cookie
						if (cookies != null && cookies.length > 0) {
							for (Cookie cookie : cookies) {
								//判断Cookie中是否存在购物信息
								if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
									if (StringUtils.isNotEmpty(cookie.getValue())) {
										String userkey = cookie.getValue();
										try {
											//保存数据到购物车
											boolean flag = cartItemService.saveCartItemValuesByUserKey(getParamMap(), userkey, goodsId, goods.getShopId(), count, sp);
											if (flag) {
												resultMap.put(STATUS, SUCCESS);
												resultMap.put(MESSAGE, "success");
											} else {
												resultMap.put(STATUS, ERROR);
												resultMap.put(MESSAGE, "商品加入购物车失败！");
											}
											//没有中转页面，所以需要直接读取商品数据
											if (isAddList) {
												resultMap.put("cartItemList", cartItemService.getListByUserKey(getParamMap(), userkey));
											}
										} catch (Exception e) {
											resultMap.put(STATUS, ERROR);
											resultMap.put(MESSAGE, "商品加入购物车失败！");
										}
										isExist = true;
									}
								}//end if 是否存在购物信息
							}
						}
						//如果没有购物信息，保存购物信息到Cookie和购物车表
						if (!isExist) {
							String userkey = request.getSession().getId();
							try {
								Cookie cookie = new Cookie(CartItemCookie.USERKEY_COOKIE_NAME, userkey);
								cookie.setPath(request.getContextPath() + "/");
								cookie.setMaxAge(CartItemCookie.USERKEY_COOKIE_MAX_AGE);
								response.addCookie(cookie);
								boolean flag = cartItemService.saveCartItemValuesByUserKey(getParamMap(), userkey, goodsId, goods.getShopId(), count, sp);
								if (flag) {
									resultMap.put(STATUS, SUCCESS);
									resultMap.put(MESSAGE, "success");
								} else {
									resultMap.put(STATUS, ERROR);
									resultMap.put(MESSAGE, "商品加入购物车失败！");
								}
								//没有中转页面，所以需要直接读取商品数据
								if (isAddList) {
									resultMap.put("cartItemList", cartItemService.getListByUserKey(getParamMap(), userkey));
								}
							} catch (Exception e) {
								resultMap.put(STATUS, ERROR);
								resultMap.put(MESSAGE, "商品加入购物车失败！");
							}
						}
					}//end if 是否登录
					resultMap.put(STATUS, SUCCESS);
					resultMap.put(MESSAGE, "success");
					resultMap.put("backurl", backurl);
					resultMap.put("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
					resultMap.put("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
					resultMap.put("services", cacheData.getServices(getParamMap()));
				}// end if 商品存在
			}// end else 未使用云极ERP

		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}
		return resultMap;
	}
	/**
	 * 点击“我的购物车”按钮调用方法，组装购物车数据到购物车页面
 	 * @param backurl
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/list")
	public String list( String backurl,Model model, HttpServletRequest request) {
		String info = "购物车结算";
		setLogInfo(info);
		logger.debug(info);
		Member currentMember = getCurrentMember(request);
		String type = request.getParameter(Global.WHICHCLIENT);
		try {
			if (currentMember != null && currentMember.getId() != null) {//会员登录
				//根据会员ID查询所有的购物车信息
				List<CartItem> list = cartItemService.getListByMemberId(getParamMap(), currentMember.getId());
//				for (CartItem ci : list) {
				for(int i=0; i<list.size(); i++) {
					CartItem ci = list.get(i);
					Criteria criteria = new Criteria();
					criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
					criteria.add(Restrictions.limit("0", "1"));
					try {
						Goods goods = new Goods();
						if (isUseErpApi(getParamMap())) {
							ci.setStock(-1d);
							goods = goodsService.get(getParamMap(), ci.getGoodsId());
							if (StringUtils.isNotEmpty(goods.getShopId())) {
								Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
								String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
								JSONObject json = JSONObject.parseObject(result);
								if (json.getBoolean("isSuccessed")) {
									ci.setStock(Double.parseDouble(json.getInteger("stock")+""));
								}
								ci.setShortName(goods.getShortName());
							}
						} else{
							goods = goodsService.get(getParamMap(), ci.getGoodsId());
							ci.setShortName(goods.getShortName());
						}


//						Criteria c = new Criteria();
//						if(StringUtil.isNotEmpty(getCurrentMember(request).getId())) {
//							c.add(Restrictions.eq("memberId", getCurrentMember(request).getId()));
//						}
//						c.add(Restrictions.eq("goodsId", ci.getGoodsId()));
						List<MTPromotions> countList = promotionsService.getCountPromotions(getParamMap(), null, ci.getGoodsId(), getCurrentMember(request)==null?null:getCurrentMember(request).getId());
						if(countList!=null && countList.size()>0) {
							MTPromotions obj = (MTPromotions) countList.get(0);

							//查询促销活动
							Promotions promotions = this.promotionsService.get(getParamMap(), obj.getPromotionsId());
							//查询促销活动商品
							Criteria pgCriteria = new Criteria();
							pgCriteria.add(Restrictions.eq("promotionsId", promotions.getId()));
							pgCriteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));

							List<PromotionsGoods> promotionsGoodsList = this.promotionsGoodsService.getList(getParamMap(), pgCriteria);
							PromotionsGoods promotionsGoods = new PromotionsGoods();
							if(promotionsGoodsList!=null && promotionsGoodsList.size()>0) {
								for(int f=0; f<promotionsGoodsList.size(); f++) {
									if(ci.getGoodsId().equals(promotionsGoodsList.get(f).getGoodsId())) {
										promotionsGoods = promotionsGoodsList.get(f);
									}
								}
							}

							if("ing".equals(countList.get(0).getStatus().trim())) {
								if("create".equals(obj.getIsOpen().trim())) {//判断活动是否开始, 开始后则不进行更新
									updatePromAndGoods(promotions, promotionsGoods, goods,"start");
								}
							} else if("after".equals(countList.get(0).getStatus().trim())) {
								if("start".equals(obj.getIsOpen().trim()) || "create".equals(obj.getIsOpen().trim())) {//判断活动是否结束, 结束状态则进行更新
									updatePromAndGoods(promotions, promotionsGoods, goods,"end");
								}
							}
						}

					} catch (Exception e) {
						e.printStackTrace();
					}
				}

				/** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 OLD  Start */
//								model.addAttribute("cartItemList", list);
				/** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 OLD  End */

				/** 满减商品  Start */
				model.addAttribute("cartItemListMj", groupCartItemMjhd(list));
				/** 满减商品  End */

				/** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 NEW  Start */
				model.addAttribute("cartItemList", groupCartItemByShop(list));
				/** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 NEW  End */

			} else {
				Cookie[] cookies = request.getCookies();
				if (cookies != null && cookies.length > 0) {
					for (Cookie cookie : cookies) {
						if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
							if (StringUtils.isNotEmpty(cookie.getValue())) {
								String userkey = cookie.getValue();
								List<CartItem> list = cartItemService.getListByUserKey(getParamMap(), userkey);
								for (CartItem ci : list) {

									Criteria criteria = new Criteria();
									criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
									criteria.add(Restrictions.limit("0", "1"));
									try {
										if (isUseErpApi(getParamMap())) {
											ci.setStock(-1d);
											Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
											if (StringUtils.isNotEmpty(goods.getShopId())) {
												Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
												String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
												JSONObject json = JSONObject.parseObject(result);
												if (json.getBoolean("isSuccessed")) {
													ci.setStock(Double.parseDouble(json.getInteger("stock")+""));
												}
												ci.setShortName(goods.getShortName());
											}
										} else{
											Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
											ci.setShortName(goods.getShortName());
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
								}

								/** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 OLD  Start */
//								model.addAttribute("cartItemList", list);
								/** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 OLD  End */

								/** 满减商品  Start */
								model.addAttribute("cartItemListMj", groupCartItemMjhd(list));
								/** 满减商品  End */

								/** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 NEW  Start */
								model.addAttribute("cartItemList", groupCartItemByShop(list));
								/** 修改购物车数据的数据结构，按商家拆分 TianYu  2015-8-19 NEW  End */

							}
						}
					}
				}
			}

			model.addAttribute("isLogin", currentMember == null ? "0" : "1");
			model.addAttribute("backurl", backurl);
			model.addAttribute("crossborderMember", CrossborderUtil.isCrossborderMember(currentMember));

			setPublicDate2Model( model );
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}
		if (Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP+PATH+"/shopping_cart";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/cart_list";
		}
	}

	/**
	 * 商品满减活动
	 * @param cartItems
	 * @return
     */
	private List<Map<String,Object>> groupCartItemMjhd(List<CartItem> cartItems) {
		List<Map<String,Object>> list = new ArrayList<Map<String, Object>>(0);

		String info="购物车查询满减活动信息";
		try {
			Map<String,Object> cxmj= new HashMap<String,Object>();
			for(int i=0;i<cartItems.size();i++){
				CartItem ci=cartItems.get(i);
				/** 商品详情显示满减活动信息  LXB 2016-1-15 Start **/
				List<ActivityFullcutItem> activityFullcutItems = new ArrayList<>();
				List<ActivityFullcut> activityFullcuts = new ArrayList<>();
				List<ActivityDecreaseamount> activityDecreaseamounts = new ArrayList<>();
				activityFullcutItems = activityFullcutItemService.findList(getParamMap(), "itemId", ci.getGoodsId());
				cxmj=new HashMap<String,Object>();
				//是否参与满减活动
				if (activityFullcutItems.size() > 0) {
					List<String> fullCutIds = new ArrayList<>();
					for (ActivityFullcutItem item : activityFullcutItems) {
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
						//ActivityFullcutItem activityFullcutItem = activityFullcutItemService.find(getParamMap(), "fullCutId", activityFullcuts.get(0).getId());
						if(StringUtil.isNotEmpty(itemId)) {
							activityDecreaseamounts = activityDecreaseamountService.findList(getParamMap(), "fullCutItemId", itemId);
							cxmj.put("goodsId", ci.getGoodsId());//商品ID
							cxmj.put("activityFullCut", activityFullcuts.get(0));//满减活动信息
							cxmj.put("activityFullCutPrice", activityDecreaseamounts);//活动对应的价格区间
						}
					}
				}
				/** 商品详情显示满减活动信息  LXB 2016-1-15 Start **/
				list.add(cxmj);
			}

		}catch (Exception e){
			logger.error(info + "时，发生异常", e);
		}
		return list;
	}

	/**
	 * * 添加方法，list()中调用
	 * 按照商品所属商家对商品进行分组
	 * 返回Map的key：
	 * 1、shopId:String
	 * 2、shopName:String
	 * 3、shopUrl:String
	 * 4、items：List<CartItem>
	 * @param cartItems
	 * @return
	 */
	private List<Map<String,Object>> groupCartItemByShop(List<CartItem> cartItems) {
		if( cartItems == null || cartItems.size() == 0 ){
			return null;
		}
		List<Map<String,Object>> list = new ArrayList<Map<String, Object>>();

		//获取所有的商家ID
		Set<String> merchants = new HashSet<String>();
		for(CartItem ci : cartItems ){
			merchants.add( ci.getMerchantId() );
		}

		//组装数据
		for(String mid : merchants ){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("shopId",mid);

			Iterator<CartItem> it = cartItems.iterator();
			List<CartItem> items = new ArrayList<CartItem>(0);
			while(it.hasNext()){
				CartItem ci = it.next();
				if( mid.equals( ci.getMerchantId() ) ){
					if( !map.containsKey( "shopName" ) && !map.containsKey( "shopUrl" )){
						map.put("shopName", ci.getMerchantShortName());
						map.put("shopUrl", ci.getMerchantUrlAddress() );
					}
					items.add( ci );
					it.remove();
				}
			}

			map.put("items",items);
			list.add( map );
		}

		return list;
	}

	public void cartItemList(Model model,HttpServletRequest request,String info){
		Member currentMember = getCurrentMember(request);
		//type=request.getParameter("type");
		try {
			if (currentMember != null && currentMember.getId() != null) {
				List<CartItem> list = cartItemService.getListByMemberId(getParamMap(), currentMember.getId());
				for (CartItem ci : list) {
					Criteria criteria = new Criteria();
					criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
					criteria.add(Restrictions.limit("0", "1"));
					try {
						if (isUseErpApi(getParamMap())) {
							ci.setStock(-1d);
							Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
							if (StringUtils.isNotEmpty(goods.getShopId())) {
								Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
								String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
								JSONObject json = JSONObject.parseObject(result);
								if (json.getBoolean("isSuccessed")) {
									ci.setStock(Double.parseDouble(json.getInteger("stock")+""));
								}
							}
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				model.addAttribute("cartItemList", list);
			} else {
				Cookie[] cookies = request.getCookies();
				if (cookies != null && cookies.length > 0) {
					for (Cookie cookie : cookies) {
						if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
							if (StringUtils.isNotEmpty(cookie.getValue())) {
								String userkey = cookie.getValue();
								List<CartItem> list = cartItemService.getListByUserKey(getParamMap(), userkey);
								for (CartItem ci : list) {

									Criteria criteria = new Criteria();
									criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
									criteria.add(Restrictions.limit("0", "1"));
									try {
										if (isUseErpApi(getParamMap())) {
											ci.setStock(-1d);
											Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
											if (StringUtils.isNotEmpty(goods.getShopId())) {
												Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
												String result = YunJiErpApiUtil.erpWareHouseListQuery(merchant.getSign(), goods.getSn());
												JSONObject json = JSONObject.parseObject(result);
												if (json.getBoolean("isSuccessed")) {
													ci.setStock(Double.parseDouble(json.getInteger("stock")+""));
												}
											}
										}
									} catch (Exception e) {
										e.printStackTrace();
									}
								}
								model.addAttribute("cartItemList", list);
							}
						}
					}
				}
			}

			model.addAttribute("isLogin", currentMember == null ? "0" : "1");
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
		}
	}

	@RequestMapping(value = "/ajaxCartList")
	public @ResponseBody
	Object ajaxCartList(HttpServletRequest request) {
		String info = "ajax方式购物车列表";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		Member currentMember = getCurrentMember(request);
		try {
			List<CartItem> list = new ArrayList<CartItem>();
			if (currentMember != null && currentMember.getId() != null) {
				list = cartItemService.getListByMemberId(getParamMap(), currentMember.getId());
				for (CartItem ci : list) {

					Criteria criteria = new Criteria();
					criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
					criteria.add(Restrictions.limit("0", "1"));
				}
			} else {
				Cookie[] cookies = request.getCookies();
				if (cookies != null && cookies.length > 0) {
					for (Cookie cookie : cookies) {
						if (StringUtils.equalsIgnoreCase(cookie.getName(), CartItemCookie.USERKEY_COOKIE_NAME)) {
							if (StringUtils.isNotEmpty(cookie.getValue())) {
								String userkey = cookie.getValue();
								list = cartItemService.getListByUserKey(getParamMap(), userkey);
								for (CartItem ci : list) {

									Criteria criteria = new Criteria();
									criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
									criteria.add(Restrictions.limit("0", "1"));
								}
							}
						}
					}
				}
			}
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "操作成功");
			result.put(DATA, list);
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}

	@RequestMapping(value = "/ajaxMemberCartList")
	public @ResponseBody
	Object ajaxMemberCartList(HttpServletRequest request) {
		String info = "根据会员ID查询购物车商品列表";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String memberId = request.getParameter("memberId");

			List<CartItem> list = cartItemService.getListByMemberId(getParamMap(), memberId);
			for (CartItem ci : list) {

				Criteria criteria = new Criteria();
				criteria.add(Restrictions.eq("goodsId", ci.getGoodsId()));
				criteria.add(Restrictions.limit("0", "1"));
			}
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "操作成功");
			result.put(DATA, list);
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}

	@RequestMapping(value = "/ajaxUpdateCartId")
	public @ResponseBody
	Object ajaxUpdateCartId(HttpServletRequest request) {
		String info = "根据购物车ID更新";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			String quantity = request.getParameter("quantity");
			CartItem entity = new CartItem();
			entity.setId(id);
			entity.setQuantity(Integer.parseInt(quantity));
			/** 更新规格 TianYu 2015-9-14 Start */
			CartItem entityOld = this.cartItemService.get(getParamMap(), id);
			if (entity.getQuantity() < entityOld.getQuantity()){
				entity.setSpecification(entityOld.getSpecification());
				installSp(entity);
			}
			/** 更新规格 TianYu 2015-9-14 End */

			cartItemService.update(getParamMap(), entity);
			result.put(STATUS, SUCCESS);
			result.put("sp", entity.getSpecification());
			result.put(MESSAGE, "操作成功");
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}

	/**
	 * 组装商品规格
	 * @param ci
	 * TianYu
	 * 2015-9-14
	 */
	private void installSp(CartItem ci){
		if( StringUtil.isNotEmpty(ci.getSpecification()) ){
			if( ci.getSpecification().indexOf(")X") > 0 ){
				int count = 0;
				String[] sps = ci.getSpecification().split(";");
				StringBuilder specifucation = new StringBuilder();
				for(int i = 0; i< sps.length; i++){
					String sp = sps[i];
					if( i != 0 ){
						specifucation.append(";");
					}
					if( i < sps.length-1 ) {
						count += Integer.parseInt(sp.substring(sp.lastIndexOf("X") + 1));
						if (ci.getQuantity() > count) {
							specifucation.append(sp);
						} else {
							specifucation.append(sp.substring(0, sp.lastIndexOf("X")) );
							break;
						}
					}else {
						specifucation.append(sp);
					}
				}
				ci.setSpecification(specifucation.toString());
			} else {
				ci.setSpecification(ci.getSpecification());
			}

			if(ci.getSpecification().indexOf(")X") < 0 && ci.getSpecification().indexOf(")") > 0) {
				ci.setSpecification( ci.getSpecification().substring(1, ci.getSpecification().length() - 1) );
			}
		}
	}

	@RequestMapping(value = "/ajaxDeleteCartId")
	public @ResponseBody
	Object ajaxDeleteCartId(HttpServletRequest request) {
		String info = "根据购物车ID删除";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String id = request.getParameter("id");
			cartItemService.delete(getParamMap(), id);
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "操作成功");
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}

	@RequestMapping(value = "/ajaxDeleteCartIds")
	public @ResponseBody
	Object ajaxDeleteCartIds(HttpServletRequest request) {
		String info = "根据购物车ID删除";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String ids[] = request.getParameterValues("cartId");
			if (ids != null && ids.length > 0) {
				cartItemService.delete(getParamMap(), Arrays.asList(ids));
			}
			result.put(STATUS, SUCCESS);
			result.put(MESSAGE, "操作成功");
			return result;
		} catch (Exception ex) {
			logger.error(info + "时，发生异常", ex);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
			return result;
		}
	}


	/**
	 * 20160808 dzz
	 * 验证商品是否为促销活动(团购)商品, 如果是则执行如下操作
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/validGoodsNums")
	@ResponseBody
	public Object validGoodsNums(HttpServletRequest request) {
		String info = "验证商品限购数量信息";
		Map<String,Object> result = new HashMap<String, Object>();


		String o = request.getParameter("o");//购物车数据ID集合
		Member currentMember = getCurrentMember(request);
		synchronized(this) {
			try {
				String[] orderIds = o.split(",");
				List<String> orderIdsList = new ArrayList<String>();
				for (String orderId : orderIds) {
					if (!StringUtils.isEmpty(orderId)) {
						orderIdsList.add(orderId);
					}
				}
				//获取当前用户选择购物车订单信息
				List<CartItem> cartItemList = cartItemService.getIdAndGoodsIdByMemberIdAndIds(getParamMap(), currentMember.getId(), orderIdsList);

				List<String> goodsIds  = new ArrayList<String>() ;
				List<Goods> goodsList = null;
				if(  cartItemList != null && cartItemList.size() > 0){
					for(CartItem cartItem : cartItemList){
						goodsIds.add( cartItem.getGoodsId() );
					}
					goodsList = goodsService.findListByIds(getParamMap(), goodsIds);
			  }

				List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>(0);//声明存入用户选择购物车商品结果列表集合
				for(CartItem item:cartItemList) {
					Map<String, Object> resultMap = new HashMap<String, Object>();//声明结果对象

//					Goods goods = goodsService.get(getParamMap(), item.getGoodsId()); //查询商品信息
					for(Goods goods : goodsList){
						if( item.getGoodsId().equals(  goods.getId()) ){

							resultMap.put("cartItemId", item.getId()); 	//购物车明细Id
							resultMap.put("goodsId", item.getGoodsId()); 	//商品Id
							resultMap.put("startNum", StringUtil.isNotEmpty(goods.getStartNum()) ? goods.getStartNum() : 0);
							resultMap.put("limitNum", StringUtil.isNotEmpty(goods.getLimitNum()) ? goods.getLimitNum() : 0);
							resultMap.put("goodsPrice", goods.getPrice());
							resultMap.put("stock", goods.getStock());


							//20160802 dzz 根据商品id查询对应的活动类型信息
							/*Criteria c1 = new Criteria();
							c1.add(Restrictions.eq("goodsId", item.getGoodsId()));
							Pager pager = new Pager();
							pager = promotionsService.getMxAndTgPager(getParamMap(), c1, null, pager);*/
							MTPromotions mTPromotions = promotionsService.getMTProtions4ValidGoodsNumsByGoodsId(getParamMap(), goods.getId());

							/*if(pager.getList()!=null && pager.getList().size()>0) {
								MTPromotions mTPromotions = pager.getList() != null && pager.getList().size() > 0 ? (MTPromotions)pager.getList().get(0) : null;*/
							if(mTPromotions != null){

								//2、查询促销(团购)活动
								Promotions promotions = this.promotionsService.get(getParamMap(), mTPromotions.getId());

								//3、查询促销(团购)商品
								Criteria pgCriteria = new Criteria();
								pgCriteria.add(Restrictions.eq("promotionsId", promotions.getId()));
								pgCriteria.add(Restrictions.eq("goodsId", item.getGoodsId()));

								List<PromotionsGoods> promotionsGoodsList = this.promotionsGoodsService.getList(getParamMap(), pgCriteria);
								PromotionsGoods promotionsGoods = new PromotionsGoods();
								if(promotionsGoodsList!=null && promotionsGoodsList.size()>0) {
									for(int i=0; i<promotionsGoodsList.size(); i++) {
										if(item.getGoodsId().equals(promotionsGoodsList.get(i).getGoodsId())) {
											promotionsGoods = promotionsGoodsList.get(i);
											break;
										}
									}
								}

								if("ing".equals(mTPromotions.getStatus().trim())) {
									if("create".equals(mTPromotions.getIsOpen().trim())) {//判断活动是否开始, 开始后则不进行更新
										updatePromAndGoods(promotions, promotionsGoods, goods,"start");
									}
								}  else if("after".equals(mTPromotions.getStatus().trim())) {
									if("start".equals(mTPromotions.getIsOpen().trim()) || "create".equals(mTPromotions.getIsOpen().trim())) {//判断活动是否结束, 结束状态则进行更新
										updatePromAndGoods(promotions, promotionsGoods, goods,"end");
									}
								}

								//统计当前用户下单订单数量为多少
								/*Criteria c2 = new Criteria();
								Map<String, Object> paramMap = new HashMap<String, Object>(0);
								paramMap = getParamMap();
								paramMap.put("promotionsId", mTPromotions.getId());
								if(StringUtil.isNotEmpty(getCurrentMember(request))) {
									paramMap.put("memberId", getCurrentMember(request).getId());
								}*/
		//						List<MTPromotions> countResult = promotionsService.getCountPromotionsOrder(paramMap, c2);
		//						List<MTPromotions> countResult = promotionsService.getCountPromotions(getParamMap(), mTPromotions.getId(), null, );
								MTPromotions countResult = promotionsService.getBuyCount( getParamMap(),  getCurrentMember(request)==null?null:getCurrentMember(request).getId(), goods.getId(), mTPromotions.getStartTime(), mTPromotions.getEndTime());
								if(countResult!=null ) {
									resultMap.put("resultNum", countResult.getResultCount());//存在下单
								} else {
									resultMap.put("resultNum", 0);//不存在下单
								}
							} else {
								resultMap.put("resultNum", -1);//不属于促销活动
							}

							resultList.add(resultMap);
						}
					}
				}

				if(resultList!=null && resultList.size()>0) {
					result.put(STATUS, SUCCESS);
					result.put(MESSAGE, "查询数据成功");
					result.put("resultList", resultList);
				} else {
					result.put(STATUS, WARN);
					result.put(MESSAGE, "所选择商品没有相关促销活动商品");
					result.put("resultList", resultList);
				}
			} catch (Exception e) {
				logger.error(info + "时，发生异常", e);
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "数据异常, 请您稍后再试");
			}
		}
		return  result;
	}

	private void updatePromAndGoods(Promotions promotions,PromotionsGoods promotionsGoods,Goods goods, String startOrEnd) throws  Exception{
		if( "start".equals( startOrEnd ) ){
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
			goods.setPrice(promotionsGoods.getPromotionsPrice());//设置更新商品价位促销价
			goods.setStartNum(newStartNum);
			goods.setLimitNum(newLimitNum);
			goods.setStock(Double.parseDouble(newStock+""));
			goodsService.update(getParamMap(), goods);
		}else if ("end".equals(startOrEnd)){
			promotions.setIsOpen("end");//设置活动为已结束状态
			promotionsService.update(getParamMap(), promotions);

			int oldStartNum = promotionsGoods.getOldStartNum();    //原起买数量
			int oldLimitNum = promotionsGoods.getOldLimitNum();    //原限购数量
			int oldStock = promotionsGoods.getOldStock();    //原库存数量
			int newStock = promotionsGoods.getNewStock();    //原库存数量

			goods.setPrice(promotionsGoods.getGoodsPrice());//设置商品价为原商品价
			goods.setStartNum(oldStartNum);
			goods.setLimitNum(oldLimitNum);
			goods.setStock( oldStock - (newStock - goods.getStock() ) );
			goodsService.update(getParamMap(), goods);
		}
	}

}
