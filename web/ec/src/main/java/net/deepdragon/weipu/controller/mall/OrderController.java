package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSONObject;
import net.deepdragon.bean.Pager;
import net.deepdragon.bean.SystemSetKey;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.DeliveryMethod;
import net.deepdragon.entity.LogisticsCompany;
import net.deepdragon.entity.PaymentMethod;
import net.deepdragon.entity.SystemSet;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.erp.yunji.api.YunJiErpApiUtil;
import net.deepdragon.erp.yunji.entity.SalesDeliverEntity;
import net.deepdragon.erp.yunji.entity.SalesDeliverItemEntity;
import net.deepdragon.service.DeliveryMethodService;
import net.deepdragon.service.LogisticsCompanyService;
import net.deepdragon.service.PaymentMethodService;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.cuxiao.PromotionsService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.DateUtil;
import net.deepdragon.util.DateUtils;
import net.deepdragon.util.KdApi;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import org.apache.commons.collections.map.HashedMap;
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
 * 订单页面
 */
@Controller(Global.APP_SIGN + Global.MALL + "OrderController")
@RequestMapping(Global.MALL_PATH + "/order")
public class OrderController extends BaseMallController {
	
	@Resource
	private OrderService orderService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private OrderLogService orderLogService;
	@Resource
	private OrderRefundService orderRefundService;
	@Resource
	private MenuService menuService;
	@Resource
	private CacheData cacheData;
	@Resource
	private MemberRankService memberRankService;
	@Resource
	private GoodsImagesService goodsImagesService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private ReceiverService receiverService;
	@Resource
	private CartItemService cartItemService;
	@Resource
	private DeliveryMethodService deliveryMethodService;
	@Resource
	private PaymentMethodService paymentMethodService;
	@Resource
	private MerchantService merchantService;
	@Resource
	private MerchantUserService merchantUserService;
	@Resource
	private OrderDistributionService orderDistributionService;
	@Resource
	private LogisticsCompanyService logisticsCompanyService;
	@Resource
	private GoodsReviewService goodsReviewService;
	@Resource
	private SystemSetService systemSetService;
	@Resource
	private QuotationService quotationService;
	@Resource
	private QuotationDetailsService quotationDetailsService;
	@Resource
	private EnquiryService enquiryService;
	@Resource
	private ActivityDecreaseamountService activityDecreaseamountService;


	@Resource
	private PromotionsService promotionsService;

	@RequestMapping("error/{orderNo}")
	public Object error(@PathVariable String orderNo, Model model, HttpServletRequest request) {
		String info = "订单[" + orderNo + "]不存在，请联系管理员。";
		setLogInfo(info);
		logger.error(info);
		model.addAttribute("info", info);
		model.addAttribute("orderNo", orderNo);

		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/order_error";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/order_error";
		}
	}

	@RequestMapping(value = "list")
	public String list(Pager pager, Model model, HttpServletRequest request) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "我的订单";
		setLogInfo(info);
		logger.debug(info);

		//检查订单,检查订单中的商品是否有删除或者下架
		/*checkOrder(pager, request);*/
		// 解析订单列表
		processOrderList(pager, model, request);

        // 便利提醒统计数量
        getConvenientTips(model, request);
		getAllCatelog(model);

		/*
		 * Desc:获取订单状态 并把订单状态返回给订单页面中判断那个状态被选中
		 * Auth:zhangqiang
		 * Time:2015-11-19 11:01:35
		 * Start
		 */
		String orderState = request.getParameter("status");
		if(StringUtil.isNotEmpty(orderState)){
			model.addAttribute("orderStates", orderState);
		}

		model.addAttribute("orderStatusMapping", getOrderStatusMapping());
		setPublicDate2Model( model );
		if(Global.WHICH_APP.equals(whichclient)){
			return Global.TEMPLATE_APP + PATH + "/member/my_order_list";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/order_list";
		}

	}

    @RequestMapping("deleted/list")
    public String deletedList(Model model, HttpServletRequest request) {
        String info = "已删除订单";
        setLogInfo(info);
        logger.debug(info);

        // 解析订单列表
        parsingDeletedOrderList(model, request);
		getAllCatelog(model);
        model.addAttribute("orderStatusMapping", getOrderStatusMapping());
		setPublicDate2Model( model );
        return Global.TEMPLATE_MALL + PATH + "/member/order_deleted_list";
    }


	@RequestMapping("submit")
	@ResponseBody
	public Object submit(HttpServletRequest request) {
		String info = "提交订单信息";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();

		try {

			String _cartItemIds = request.getParameter("cartItemIds"); // 购物车内商品Ids
			List<String> cartItemIds = null;
			if (StringUtils.isNotBlank(_cartItemIds)) {
				cartItemIds = Arrays.asList(_cartItemIds.split(","));
			}

			List<Map<String,Object>> orders = processJsonParameter(cartItemIds,request);

			List<Order> list = orderService.saveOrder(getParamMap(), orders, cartItemIds,isEnableConfirm() );

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
								Goods goods = goodsService.get(getParamMap(), orderItem.getGoodsId());
								if (StringUtils.isNotEmpty(goods.getShopId())) {
									Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
									YunJiErpApiUtil.erpWareHouseList(merchant.getSign(), goods.getSn(), orderItem.getQuantity(), 0);
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
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "保存失败，请联系管理员。");
		}

		return result;
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


	@RequestMapping("confirmGoods/{orderId}")
	@ResponseBody
	public Object confirmGoods(@PathVariable String orderId, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			orderService.confirmGoods(getParamMap(), orderId);
			// 调用接口
			if (isUseErpApi(getParamMap())) {
				BusinessPartnersRequest(orderId, request);
			}
		} catch (Exception e) {
			logger.error("确认收货时，发生异常, orderId=" + orderId, e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "确认收货时，发生异常");
		}
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");

		return result;
	}

	/**
	 * 弹出层，取消订单申请
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "popupcancel/{orderId}")
	public String popupcancel(@PathVariable String orderId,Model model) {
		String info = "弹出层,取消订单申请...";
		setLogInfo(info);
		model.addAttribute("orderId", orderId);
		logger.debug(info);
		return Global.TEMPLATE_MALL + PATH + "/member/order_cancel_reason_popup";
	}

	/**
	 * 取消订单
	 * @param orderId
	 * @param request
	 * @return
	 */
	@RequestMapping("cancle/{orderId}/{reason}")
	@ResponseBody
	public Object cancle(@PathVariable String orderId,@PathVariable String reason, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			reason = URLDecoder.decode(reason,"UTF-8");
			Order order = orderService.get(getParamMap(), orderId);
			if (order.getPaymentStatus().equals(Order.PaymentStatus.paid)) {
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "你已经支付了该订单，不能再取消了！");
				return result;
			} else {
				orderService.cancle(getParamMap(), orderId, reason);
			}

			try {
				if (isUseErpApi(getParamMap())) {
					// ERP-API 解锁库存
					Criteria criteria = new Criteria();
					criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
					List<OrderItem> orderItemList = orderItemService.getList(getParamMap(), criteria);
					for (OrderItem orderItem : orderItemList) {
						Goods goods = goodsService.get(getParamMap(), orderItem.getGoodsId());
						if (StringUtils.isNotEmpty(goods.getShopId())) {
							Merchant merchant = merchantService.get(getParamMap(), goods.getShopId());
							YunJiErpApiUtil.erpWareHouseList(merchant.getSign(), goods.getSn(), orderItem.getQuantity(), 1);
						}
					}
				}
			} catch (Exception ex) {
				logger.error("调用ERP-API解锁库存时，发生异常", ex);
			}

		} catch (Exception e) {
			logger.error("取消订单时，发生异常, orderId=" + orderId, e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "取消订单时，发生异常");
		}
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");

		return result;
	}

	@RequestMapping(value = "delete/{orderId}")
	@ResponseBody
	public Object delete(@PathVariable String orderId, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			orderService.deleteOrder(getParamMap(), orderId);
		} catch (Exception e) {
			logger.error("删除订单时，发生异常, orderId=" + orderId, e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "删除订单时，发生异常");
		}
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");

		return result;
	}

	/**
	 * 获取订单物流信息
	 * */

	@RequestMapping("getExpressLog/{orderId}")
	@ResponseBody
	public Object getExpressLog(@PathVariable  String orderId, HttpServletRequest request){
		Map<String,Object> result = new HashMap<String,Object>();
		String info = "获取订单物流信息";
		LogisticsCompany company=null;
		try {
			Order order = orderService.get(getParamMap(), orderId);
			OrderDistribution orderDistribution = orderDistributionService.find(getParamMap(), "orderSn", order.getOrderSn());
			if (orderDistribution != null) {
				if (StringUtils.isBlank(orderDistribution.getLogisticsCompany())) {
					company = logisticsCompanyService.get(getParamMap(), orderDistribution.getLogisticsCompanyId());
					if( company == null){
						return "{\"message\":\"未合作快递公司\",\"Success\":false}";
					}
					orderDistribution.setLogisticsCompany(company.getName());
				}
			}
			if(orderDistribution!=null && company!=null) {
				//String expressLog = getExpreessInfo(orderDistribution.getLogisticsCompany(), orderDistribution.getLogisticsNo());//apix
				KdApi api = new KdApi();   //快递鸟
				String[] logisticsNos = orderDistribution.getLogisticsNo().split(",");
				List<Map<String,String>> logisticsNoList = new ArrayList<Map<String,String>>(1);
				for( String no : logisticsNos ){
					Map<String,String> map = new HashMap<String,String>(2);
					map.put("no", no);
					map.put("expressLog", api.getOrderTracesByJson(company.getSign(),no).toString().trim());
					logisticsNoList.add(map);
				}
				result.put(STATUS,SUCCESS);
				result.put("list", logisticsNoList);
				return result;
			}else{
//				return "{\"message\":\""+info+"时，发生异常\",\"Success\":false}";
				result.put(STATUS,ERROR);
				result.put(MESSAGE,info+"时，发生异常");
				return result;
			}
		}catch (Exception e) {
			logger.error(info + "时，发生异常", e);
//			return "{\"message\":\""+info+"时，发生异常\",\"Success\":false}";
			result.put(STATUS,ERROR);
			result.put(MESSAGE,info+"时，发生异常");
			return result;
		}
	}


	/**
	 * app获取订单物流信息
	 * */

	@RequestMapping("getExpressLogs/{orderId}")
	@ResponseBody
	public Object getExpressLogs(@PathVariable  String orderId, HttpServletRequest request){
		String info = "获取订单物流信息";
		LogisticsCompany company=null;
		try {
			String gis=request.getParameter("gis");
			Order order = orderService.get(getParamMap(), orderId);
			OrderDistribution orderDistribution = orderDistributionService.find(getParamMap(), "orderSn",  order.getOrderSn());
			if (orderDistribution != null) {
				if (StringUtils.isBlank(orderDistribution.getLogisticsCompany())) {
					company = logisticsCompanyService.get(getParamMap(), orderDistribution.getLogisticsCompanyId());
					if( company == null){
						return "{\"message\":\"未合作快递公司\",\"Success\":false}";
					}
					orderDistribution.setLogisticsCompany(company.getName());
				}
			}
			if(orderId!=null) {
				//String expressLog = getExpreessInfo(orderDistribution.getLogisticsCompany(), orderDistribution.getLogisticsNo());//apix
				KdApi api = new KdApi();   //快递鸟
				String expressLog = api.getOrderTracesByJson(company.getSign(),gis).toString().trim();
				return expressLog;
			}else{
				return "{\"message\":\""+info+"时，发生异常\",\"Success\":false}";
			}
		}catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			return "{\"message\":\""+info+"时，发生异常\",\"Success\":false}";
		}
	}



	@RequestMapping("view/{orderId}")
	public String view(@PathVariable String orderId, Model model, HttpServletRequest request) {

		try {
			Order order = orderService.get(getParamMap(), orderId);
			/**Desc:当订单中心-我的评论列表中点击订单编号传入此方法的是订单编号非订单ID 而订单列表点击订单编号传入的订单ID
			 *      当我的评论传入订单编号时去查出相应的订单ID
			 * Auth:zhangqiang
			 * Time:2015-11-17 16:01:02  Start*/
			if(order==null){
				order = orderService.find(getParamMap(),"orderSn",orderId);
				orderId=order.getId();
			}
			/** end               -----------------------------------------------------------------------*/
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
			List<OrderItem> orderItemList = orderItemService.getList(getParamMap(), criteria);
			if (orderItemList != null && orderItemList.size() > 0) {
				processOrderItemGoods(model, getParamMap(), orderItemList);
			} else {    // 当orderId是主订单的id时就不会有订单项，所以就从它的子订单中取商品
				List<Order> childOrders = orderService.findList(getParamMap(), "parentSn", order.getOrderSn());
				if (childOrders != null && childOrders.size() > 0) {
					List<String> orderSnList = new ArrayList<String>();
					for (Order o : childOrders) {
						orderSnList.add(o.getOrderSn());
					}
					Criteria c = new Criteria();
					c.add(Restrictions.in("orderSn", orderSnList));
					List<OrderItem> mainOrderItemList = orderItemService.getList(getParamMap(), c);
					if (mainOrderItemList != null && mainOrderItemList.size() > 0) {
						processOrderItemGoods(model, getParamMap(), mainOrderItemList);
					}
				}
			}
			// 附加物流配送信息
			OrderDistribution orderDistribution = orderDistributionService.find(getParamMap(), "orderSn", order.getOrderSn());
			if (orderDistribution != null) {
				if (StringUtils.isBlank(orderDistribution.getLogisticsCompany())) {
					LogisticsCompany company = logisticsCompanyService.get(getParamMap(), orderDistribution.getLogisticsCompanyId());
					orderDistribution.setLogisticsCompany(company.getName());
					model.addAttribute("expressCompanyUrl",company.getUrl());
				}
				//String expressLog=getExpreessInfo(orderDistribution.getLogisticsCompany(),orderDistribution.getLogisticsNo());
                String logistcsNos=orderDistribution.getLogisticsNo();
				String [] gisList=logistcsNos.split(",");
				model.addAttribute("gisList",gisList);


				model.addAttribute("orderDistribution", orderDistribution);
				//model.addAttribute("expressLog",expressLog);
			}
			getAllCatelog(model);

			/**如果为作废订单，显示作废原因 TianYu  2015-9-10 Start */
			if(order.getOrderStatus().equals(Order.OrderStatus.cancel) || order.getOrderStatus().equals(Order.OrderStatus.invalid)){
				Criteria logCriteria = new Criteria();
				logCriteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
				logCriteria.add(Restrictions.or(Restrictions.eq("type", Order.OrderStatus.cancel),Restrictions.eq("type", Order.OrderStatus.invalid)));
				logCriteria.add(Restrictions.eq("statusType", "order"));
				logCriteria.add(Restrictions.order("createDate","desc"));
				List<OrderLog> logs = this.orderLogService.getList(getParamMap(), logCriteria);

				if( logs != null && logs.size() > 0 ){
					String cancalReason = null;
					String invalidReason = null;
					for(OrderLog log : logs){
						if( log.getType().equals(Order.OrderStatus.invalid.toString())){
							invalidReason = log.getInfo();
						}
						if( log.getType().equals(Order.OrderStatus.cancel.toString()) ){
							cancalReason = log.getInfo();
							break;
						}
					}
					model.addAttribute("invalidReason", StringUtil.isNotEmpty(cancalReason)?cancalReason:invalidReason);
				}
			}
			/**如果为作废订单，显示作废原因 TianYu  2015-9-10 End */

			/** 组装是否填写退款申请 TianYu 2015-9-22 Start */
			List<OrderRefund> ors = this.orderRefundService.findList(getParamMap(),"orderSn",order.getOrderSn());
			if( ors != null && ors.size() > 0 ){
				order.setIsRefund("Y");
				//如果存在多个退款单
				if( ors.size() > 1 ){
					boolean flag = false;
					//如果存在在流转退款单，取此退款单数据
					for(OrderRefund or : ors ){
						if( !or.getStatus().equals(OrderRefund.RefundStatus.returned) ){
							flag = true;
							order.setOrderRefund( or );
							break;
						}
					}
					//如果不存在在流转退款单，取最后更新的退款单
					if( !flag ){
						order.setOrderRefund( ors.get(0) );
					}
				}else{
					order.setOrderRefund( ors.get(0) );
				}
			}else{
				order.setIsRefund("N");
			}
			/** 组装是否填写退款申请 TianYu 2015-9-22 Start */



			model.addAttribute("order", order);
			setPublicDate2Model( model );
		} catch (Exception e) {
			logger.error("查看订单时，发生异常, orderId=" + orderId, e);
		}

		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/order_detail";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/order_detail";
		}
	}

	private void processOrderItemGoods(Model model, Map<String,Object> paramMap, List<OrderItem> orderItemList) throws Exception {
		Criteria criteria;
		List<String> goodsIds = new ArrayList<String>();
		Map<String,Double> goodsIdPrice= new HashMap<String,Double>();
		Map<String,String> goodsActivicty = new HashMap<String,String>();
		for (OrderItem orderItem : orderItemList) {
            goodsIds.add(orderItem.getGoodsId());
			goodsIdPrice.put(orderItem.getGoodsId(),orderItem.getGoodsPrice());
			String tmj="";
			if(orderItem.getTableName() != null && orderItem.getTableName().equals("cx_activity_decreaseamount")) {
				ActivityDecreaseamount activityDecreaseamount = activityDecreaseamountService.get(getParamMap(), orderItem.getTablePkId());
				if(activityDecreaseamount!=null){
					tmj="满"+activityDecreaseamount.getTotalPrice()+"元减"+activityDecreaseamount.getDecreaseAmount()+"元";
				}
			}
			goodsActivicty.put(orderItem.getGoodsId(),tmj);
        }
		criteria = new Criteria();
		criteria.add(Restrictions.in("a.id", goodsIds));
		criteria.add(Restrictions.eq("status", 5));
		List<Goods> goodsList = goodsService.getList(paramMap, criteria);

		// 加载当前goods的图片
		if (goodsList != null && goodsList.size() > 0) {
            for (Goods goods : goodsList) {
                List<GoodsImages> goodsImagesList = goodsImagesService.findList(paramMap, "goodsId", goods.getId());
                if (goodsImagesList != null && goodsImagesList.size() > 0) {
                    goods.setPic(goodsImagesList.get(0).getPic());
                }
				goods.setPrice(goodsIdPrice.get(goods.getId()));
				goods.setDiscount(goodsActivicty.get(goods.getId()));
            }
        }

		model.addAttribute("goodsList", goodsList);
		model.addAttribute("orderItemList", orderItemList);
		model.addAttribute("orderStatusMapping", getOrderStatusMapping());
		model.addAttribute("services", cacheData.getServices(getParamMap()));
	}

	@RequestMapping("review")
    public String review(Pager pager, String sn, Model model, HttpServletRequest request) {
        try {
			String memberId = getCurrentMember(request).getId();
            if (StringUtils.isNotBlank(sn)) {
                List<String> orderSnList = new ArrayList<String>();
                orderSnList.add(sn);
                processOrderItemToGoodsByOrderIds(pager, getParamMap(), memberId, orderSnList, model);
				model.addAttribute("orderSNStr", sn);
            } else {

                boolean isReviewed = false;
                String goodsId = getParameter(request, "goodsId");
				Criteria orderCriteria = new Criteria();
				orderCriteria.add(Restrictions.eq("memberId", memberId));
				orderCriteria.add(Restrictions.eq("orderStatus", Order.OrderStatus.trade_finished));
				orderCriteria.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid));
				List<Order> orderList = orderService.getList(getParamMap(), orderCriteria);
                if (orderList != null && orderList.size() > 0) {
                    List<String> orderSnList = new ArrayList<String>();
                    for (Order order : orderList) {
                        orderSnList.add(order.getOrderSn());
                    }
					List<String> reviewedGoodsIdList = processOrderItemToGoodsByOrderIds(pager, getParamMap(),memberId, orderSnList, model);
                    if (reviewedGoodsIdList.contains(goodsId)) {
						isReviewed = true;
                    }
                }
                model.addAttribute("currGoodsId", goodsId); // 当前商品的Id，即：在页面上默认要打开此商品的评价...
                model.addAttribute("isReviewed", isReviewed);

            }
			model.addAttribute("memberId", memberId);
        } catch (Exception e) {
            logger.error("获取已完成的订单商品时，发生异常, orderSn=" + sn, e);
        }
		setPublicDate2Model( model );
		getAllCatelog(model);
		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			if(!StringUtil.isEmpty(request.getParameter("orderId"))){
				model.addAttribute("orderId",request.getParameter("orderId"));
			}
			return Global.TEMPLATE_APP + PATH + "/goods_review";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/goods_review";
		}
    }

	@RequestMapping("doReview/{goodsId}")
	@ResponseBody
    public Object doReview(@PathVariable String goodsId, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        String memberId = getCurrentMember(request).getId();
        String createUser = getCurrentMember(request).getUserName();
        String review = getParameter(request, "review");
        try {
            if (StringUtils.isNotBlank(review)) {
                review = URLDecoder.decode(review, "UTF-8");
                GoodsReview goodsReview = JSONObject.parseObject(review, GoodsReview.class);
				Order order = this.orderService.find(getParamMap(), "orderSn", goodsReview.getOrderSn() );
                goodsReview.setGoodsId(goodsId);
				goodsReview.setIp(getIpAddress(request));
                goodsReview.setIsShow(1);
                goodsReview.setMemberId(memberId);
                goodsReview.setCreateUser(createUser);
				goodsReview.setWhichSys("EC");
				goodsReview.setParentId(null);
				goodsReview.setBuyDate(order.getCreateDate());
				goodsReview.setIsRead("NO");
                goodsReviewService.save(getParamMap(), goodsReview);
				OrderItem orderItem=orderItemService.get(getParamMap(),goodsReview.getOrderItemId());
				orderItem.setIsReview(1);
				orderItemService.update(getParamMap(),orderItem);
            }
        } catch (Exception e) {
            logger.error("评价商品时，发生异常, goodsId=" + goodsId, e);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "评价商品时，发生异常");
		}

		result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "");

        return result;
    }


	/**
	 * 追加评论
	 * @param orderSn
	 * @param request
     * @return
     */
	@RequestMapping("appendReview/{orderSn}/{goodsId}")
	@ResponseBody
	public Object appendReview(@PathVariable String orderSn,@PathVariable String goodsId, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		String memberId = getCurrentMember(request).getId();
		String createUser = getCurrentMember(request).getUserName();
		String review = getParameter(request, "review");
		try {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("orderSn", orderSn));
			criteria.add(Restrictions.eq("goodsId", goodsId));
			List<GoodsReview> grs = goodsReviewService.getList(getParamMap(), criteria);
			if( grs == null || grs.size() == 0){
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "原有评价不存在");
				return result;
			}
			if (StringUtils.isNotBlank(review)) {
				GoodsReview gr = grs.get(0);
				review = URLDecoder.decode(review, "UTF-8");

				Order order = this.orderService.find(getParamMap(), "orderSn", orderSn );
				GoodsReview goodsReview = new GoodsReview();
                goodsReview.setOrderSn(orderSn);
				goodsReview.setContent(review);
				goodsReview.setGoodsId(gr.getGoodsId());
				goodsReview.setIp(getIpAddress(request));
				goodsReview.setIsShow(1);
				goodsReview.setMemberId(memberId);
				goodsReview.setCreateUser(createUser);
				goodsReview.setWhichSys("EC");
				goodsReview.setParentId(gr.getId());
				goodsReview.setBuyDate(order.getCreateDate());
				goodsReview.setIsRead("NO");
				goodsReviewService.save(getParamMap(), goodsReview);
			}
		} catch (Exception e) {
			logger.error("追加评论时，发生异常, goodsId=" + goodsId, e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "追加评论时，发生异常, goodsId=" + goodsId);
		}

		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "追加评论成功");

		return result;
	}


    /**
     * 更新评论为已读
     * @param orderSn
     * @param request
     * @return
     */
    @RequestMapping("updateReview/{orderSn}/{goodsId}")
    @ResponseBody
    public Object updateReview(@PathVariable String orderSn,@PathVariable String goodsId, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        String memberId = getCurrentMember(request).getId();

        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("orderSn", orderSn));
            criteria.add(Restrictions.eq("goodsId", goodsId));
            criteria.add(Restrictions.eq("isRead", "NO"));
			criteria.add(Restrictions.notEq("whichSys", "EC"));
            List<GoodsReview> grs = goodsReviewService.getAllByCriteria(getParamMap(), criteria);
            if( grs == null || grs.size() == 0){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "不存在未读评价");
                return result;
            }
            for( GoodsReview gr: grs){
                gr.setIsRead("YES");
            }
            goodsReviewService.update(getParamMap(), grs);

        } catch (Exception e) {
            logger.error("更新评论为已读时，发生异常, goodsId=" + goodsId, e);
            result.put(STATUS, ERROR);
            result.put(MESSAGE, "更新评论为已读时，发生异常, goodsId=" + goodsId);
        }

        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "更新评论为已读");

        return result;
    }

    @RequestMapping("countDeliveryFee")
    @ResponseBody
    public Object countDeliveryFee(HttpServletRequest request) {
        String deliveryMethodId = getParameter(request, "deliveryMethodId"); // 配送方式Id
        String _cartItemIds = getParameter(request, "cartItemIds"); // 购物车内商品Ids
        return calculateGoodsDeliveryFee(getParamMap(), deliveryMethodId, _cartItemIds);
    }

	/**
	 * 处理前端传过来的json参数对象
	 * @param cartItemIds
	 *           购物车ID集合
	 * @param request
	 *            获取前端传过来的json参数对象
	 *
	 * @return 普通map
	 *
	 * updateTime： 2016-1-18 15:46:45
	 * updateAuthor： TianYu
	 * DESC：添加 会员等级优惠
	 */
	private List<Map<String,Object>> processJsonParameter(List<String> cartItemIds,HttpServletRequest request) throws Exception {
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
		List<CartItem> cartItemList = cartItemService.findListByIds(getParamMap(), cartItemIds);
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
			/***
			int goodsTotalQuantity = 0; // 商品总数
			double goodsTotalPrice = 0.00; // 商品总价格
			double deliveryFee = 0.00;
			for (CartItem item : cartItemList) {
				goodsTotalQuantity += item.getQuantity();
				Goods goods = goodsService.get(tenantId, item.getGoodsId());
				goodsTotalPrice += item.getQuantity() * goods.getPrice();
				// 组装OrderItem的Map
				Map<String, Object> orderItemMap = new HashMap<String, Object>();
				orderItemMap.put("goodsId", item.getGoodsId());
				orderItemMap.put("goodsName", item.getName());
				orderItemMap.put("goodsPrice", item.getPrice());
				orderItemMap.put("quantity", item.getQuantity());
				orderItemMapList.add(orderItemMap);
			}
			*/
            // 计算配送费用
//            deliveryFee = calculateGoodsDeliveryFee(tenantId, deliveryMethodId, _cartItemIds);

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
				for(int i = 0; i< sps.length; i++){
					if( i < sps.length-1 ) {
						count += Integer.parseInt(sps[i].substring(sps[i].lastIndexOf("X")+1) );
					}

				}
				ci.setSpecification(ci.getSpecification() + "X" + ( ci.getQuantity() - count));
			} else {
				ci.setSpecification(ci.getSpecification() + "X" + ci.getQuantity());
			}
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
	 * @param cartItems
	 * @return
	 * @author TianYu
	 * @Date 2015-8-19
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


	/**
	 * 根据重量和配送方式计算配送费用
	 *
	 * @param goodsTotalWeight
	 *            商品总重量
	 * @param deliveryMethod
	 *            配送方式对象
	 *
	 * @return 配送费用
	 */
	private Double countDeliveryFeeByWeight(double goodsTotalWeight, DeliveryMethod deliveryMethod) {
		double deliveryFee = 0.00;
		if (goodsTotalWeight <= deliveryMethod.getFirstWeight()) {
			deliveryFee = deliveryMethod.getFirstPrice();
		} else {
			double overWeight = goodsTotalWeight - deliveryMethod.getFirstWeight(); // 多出来的重量
			int continueUnit = deliveryMethod.getContinueWeight() > 0 ? ((int) Math.ceil(overWeight / deliveryMethod.getContinueWeight())) : 0;// 有几个单位的续重
			deliveryFee = deliveryMethod.getFirstPrice() + deliveryMethod.getContinuePrice() * continueUnit;
		}

		return deliveryFee;
	}

	/**
	 * 处理【我的订单】主页面的订单列表
	 */
	private void processOrderList(Pager pager, Model model, HttpServletRequest request) {
		String info = "我的订单主页面";
		setLogInfo(info);
		logger.debug(info);
		try {
			Member mb = getCurrentMember(request);
			MemberRank mbr = memberRankService.get(getParamMap(), mb.getRankId());
			model.addAttribute("mbr", mbr);
			model.addAttribute("mb", mb);

			Criteria criteria = processCriteria(pager, mb, request);
			pager.setPageSize(10);
			pager = orderService.getPager(getParamMap(), criteria, pager);
            List pagerDataList = pager.getList();


            if (pagerDataList != null && pagerDataList.size() > 0) {
                List<Order> orderList = (List<Order>) pagerDataList;
                List<OrderItem> allOrderItemList = new ArrayList<OrderItem>();
				processOrderItem(orderList, allOrderItemList);
				getAllCatelog(model);
				model.addAttribute("orderItemList", allOrderItemList);
                model.addAttribute("orderList", orderList);
                model.addAttribute("pager", pager);
				model.addAttribute("services", cacheData.getServices(getParamMap()));
			}

			//添加日期查询条件 TianYu 2015-9-30
			model.addAttribute("dateSelect", getListDateSelect(getParameter(request, "yearS"), getParameter(request, "yearE")));

			model.addAttribute("currStatus", getParameter(request, "status"));
			model.addAttribute("currYearS", getParameter(request, "yearS"));
			model.addAttribute("currYearE", getParameter(request, "yearE"));
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}
	}


	private void processOrderItem( List<Order> orderList, List<OrderItem> allOrderItemList) throws Exception {

		String refundLimitDayStr = getSystemSetByKey(SystemSetKey.refundLimitDay);
		int refundLimitDay = 0;

		if( StringUtils.isNotBlank( refundLimitDayStr ) ){
			refundLimitDay = Integer.parseInt( refundLimitDayStr );
		}


		List<Order> removeOrderList = new ArrayList<Order>();
		Criteria criteria;
		for (Order order : orderList) {

			if( refundLimitDay - 0 > 0 && Order.OrderStatus.trade_finished.equals( order.getOrderStatus() )){
				int diff = DateUtils.dateDiff('d',  Calendar.getInstance(), DateUtils.getCalendar( order.getModifyDate() ));
				if( refundLimitDay - diff <= 0 ){
					order.setAllowRefund("N");
				}
			}

            Integer isReview=1;
            criteria = new Criteria();
            criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
            List<OrderItem> orderItemList = orderItemService.getList(getParamMap(), criteria);
            if(orderItemList != null && orderItemList.size() > 0) {
                for (OrderItem orderItem : orderItemList) {
                    criteria = new Criteria();
                    criteria.add(Restrictions.eq("goodsId", orderItem.getGoodsId()));
                    criteria.add(Restrictions.limit("0", "1"));
                    List<GoodsImages> goodsImagesList = goodsImagesService.getList(getParamMap(), criteria);
                    if (goodsImagesList != null && goodsImagesList.size() > 0) {
                        String pic = goodsImagesList.get(0).getPic();
                        orderItem.setPic(pic);
                    }
                    allOrderItemList.add(orderItem);
                    // 由于一单中多个商品有一个未评价，则为未评价 chenbin@2015-10-23
                    if( isReview == 1){
                        isReview=(orderItem.getIsReview()==0)?0:1;
                    }
                }
            } else {
                removeOrderList.add(order);
            }

            order.setIsReview(isReview);
        }
		orderList.removeAll(removeOrderList);
	}

	private Criteria processCriteria(Pager pager, Member mb, HttpServletRequest request) {
		Criteria criteria = new Criteria();
		//			List<Order.OrderStatus> orderStatusList = new ArrayList<Order.OrderStatus>();
			/*orderStatusList.add(Order.OrderStatus.deleted);
			orderStatusList.add(Order.OrderStatus.invalid);*/
		String status = getParameter(request, "status");
		if (StringUtils.isNotBlank(status)) {
            criteria.add(Restrictions.eq("orderStatus", status));
        }/* else {
			criteria.add(Restrictions.notIn("orderStatus", orderStatusList));
		}*/
		String yearS = getParameter(request, "yearS");
		if (StringUtils.isNotBlank(yearS)) {
            criteria.add(Restrictions.ge("a.createDate", yearS));//"str_to_date('" +year+" 00:00:00','%Y-%m-%d %H:%i:%s')"));
        }
		String yearE = getParameter(request, "yearE");
		if (StringUtils.isNotBlank(yearE)) {
            criteria.add(Restrictions.lt("a.createDate", yearE));//"str_to_date('" +year+" 00:00:00','%Y-%m-%d %H:%i:%s')"));
        }

		if (StringUtils.isBlank(yearS) && StringUtils.isBlank(yearE)) {
            yearS = DateUtils.dateToString(DateUtil.addMonth(new Date(), -3), "yyyy-MM-dd");
            criteria.add(Restrictions.ge("a.createDate", yearS));
        }

		criteria.add(Restrictions.eq("a.platform", getPlatform()));//所属平台
		criteria.add(Restrictions.eq("a.memberId", mb.getId()));
		if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
            criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType()));
        }

		criteria.add(Restrictions.notEq("a.orderType", "2")); // 订单类型: 0:一般订单, 1:众筹订单, 2:刷单订单

		criteria.add(Restrictions.group(" a.orderSn"));
		return criteria;
	}

	/**
	 * 组装订单列表页日期查询的待选值
	 * @param yearS
	 * @param yearE
	 * @Date 2015-9-30
	 * @Author  TianYu
	 * @return
	 */
	private List<Map<String,String>> getListDateSelect(String yearS, String yearE){
		//组装日期查询条件
		List<Map<String,String>> dateSelect = new ArrayList<Map<String, String>>();
		//近三个月
		Map<String,String> map1 = new HashMap<String, String>();
		map1.put("name", "近三个月");
		String date1 = DateUtils.dateToString(DateUtil.addMonth(new Date(), -3), "yyyy-MM-dd");
		map1.put("sd", date1);
		map1.put("ed", "");
		if( date1.equals(yearS) ){
			map1.put("selected", "true");
		}else{
			map1.put("selected", "false");
		}
		dateSelect.add(map1);
		//今年内
		Map<String,String> map2 = new HashMap<String, String>();
		map2.put("name", "今年内");
		String date2 = DateUtils.dateToString(new Date(), "yyyy")+"-01-01";
		map2.put("sd", date2);
		map2.put("ed", "");
		if( date2.equals(yearS) ){
			map2.put("selected", "true");
		}else{
			map2.put("selected", "false");
		}
		dateSelect.add(map2);
		//一年前
		Map<String,String> map3 = new HashMap<String, String>();
		String name1 = DateUtils.dateToString(DateUtil.addYear(new Date(), -1), "yyyy");
		map3.put("name", name1+"年");
		String date3 = name1 + "-01-01";
		map3.put("sd", date3);
		map3.put("ed", DateUtils.dateToString(new Date(), "yyyy")+"-01-01");
		if( date3.equals(yearS) ){
			map3.put("selected", "true");
		}else{
			map3.put("selected", "false");
		}
		dateSelect.add(map3);
		//两年前
		Map<String,String> map4 = new HashMap<String, String>();
		String name2 = DateUtils.dateToString(DateUtil.addYear(new Date(), -2), "yyyy");
		map4.put("name", name2+"年");
		String date4 = name2 + "-01-01";
		map4.put("sd", date4);
		map4.put("ed", DateUtils.dateToString(DateUtil.addYear(new Date(), -1), "yyyy") + "-01-01");
		if( date4.equals(yearS) ){
			map4.put("selected", "true");
		}else{
			map4.put("selected", "false");
		}
		dateSelect.add(map4);
		//两年前以前
		Map<String,String> map5 = new HashMap<String, String>();
		String name3 = DateUtils.dateToString(DateUtil.addYear(new Date(), -2), "yyyy");
		map5.put("name", name3+"年以前");
		String date5 = name3+"-01-01";
		map5.put("sd", "");
		map5.put("ed", date5);
		if( date5.equals(yearE) ){
			map5.put("selected", "true");
		}else{
			map5.put("selected", "false");
		}
		dateSelect.add(map5);

		return dateSelect;
	}

    /**
     * 解析已删除订单
     */
    private void parsingDeletedOrderList(Model model, HttpServletRequest request) {
        String info = "解析已删除订单项数据";
        setLogInfo(info);
        logger.debug(info);
        try {
            Member mb = getCurrentMember(request);
            MemberRank mbr = memberRankService.get(getParamMap(), mb.getRankId());
            model.addAttribute("mbr", mbr);
            model.addAttribute("mb", mb);
            Criteria criteria = new Criteria();
            List<Order.OrderStatus> orderStatusList = new ArrayList<Order.OrderStatus>();
            orderStatusList.add(Order.OrderStatus.deleted);
            criteria.add(Restrictions.in("orderStatus", orderStatusList));
            criteria.add(Restrictions.eq("memberId", mb.getId()));
//            criteria.add(Restrictions.limit("0", "8"));
            criteria.add(Restrictions.order("createDate", "DESC"));
            List<Order> orderList = orderService.getList(getParamMap(), criteria);
            List<OrderItem> allOrderItemList = new ArrayList<OrderItem>();
            for (Order order : orderList) {
                criteria = new Criteria();
                criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
                List<OrderItem> orderItemList = orderItemService.getList(getParamMap(), criteria);
                for (OrderItem orderItem : orderItemList) {
                    criteria = new Criteria();
                    criteria.add(Restrictions.eq("goodsId", orderItem.getGoodsId()));
                    criteria.add(Restrictions.limit("0", "1"));
                    List<GoodsImages> goodsImagesList = goodsImagesService.getList(getParamMap(), criteria);
                    if (goodsImagesList != null && goodsImagesList.size() > 0) {
                        String pic = goodsImagesList.get(0).getPic();
                        orderItem.setPic(pic);
                    }
                    allOrderItemList.add(orderItem);
                }
            }
            model.addAttribute("orderItemList", allOrderItemList);
            model.addAttribute("orderList", orderList);
        } catch (Exception ex) {
            logger.error("访问" + info + "时，发生异常", ex);
            ex.printStackTrace();
        }
    }

	private Map<String, String> getOrderStatusMapping() {
		Map<String, String> map = new LinkedHashMap<String, String>();
        map.put("", "全部状态");
        map.put("unconfirm", "未确认");
        map.put("wait_buyer_pay", "等待付款");
        map.put("wait_seller_send_goods", "等待发货");
        map.put("wait_buyer_confirm_goods", "等待收货");
        map.put("trade_finished", "交易完成");
        map.put("cancel", "已取消");
        map.put("invalid", "已作废");
        map.put("deleted", "已删除");
        map.put("refunding", "退款中...");
        /*map.put("refund_part", "部分退款");
        map.put("refund_success", "全额退款");
        map.put("reship_part", "部分退货");*/
        /*map.put("reship_success", "已退货");*/
		/*map.put("refund_success", "退款完成");*/
		/**暂时去掉退货完成状态 Auth:zhangqiang Time:2015-09-24 09:59:35 Start */
//		map.put("reship_success", "退款完成");
		/**暂时去掉退货完成状态 Auth:zhangqiang Time:2015-09-24 09:59:35 End */
		/*map.put("order_item_exception","订单中商品已下架或者停售");*/

		return map;
	}

	/**
	 * 销售单的新增
	 */
	private void BusinessPartnersRequest(String id, HttpServletRequest request) {
		// 销售单信息
		SalesDeliverEntity salesDeliverEntity = new SalesDeliverEntity();
		try {
			Order order = orderService.get(getParamMap(), id);
			Set<SalesDeliverItemEntity> salesDeliverItems = new HashSet<SalesDeliverItemEntity>();
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
			List<OrderItem> orderItems = orderItemService.getList(getParamMap(), criteria);
			Goods good = goodsService.get(getParamMap(), orderItems.get(0).getGoodsId());
			if (StringUtils.isNotEmpty(good.getShopId())) {
				Merchant merchant = merchantService.get(getParamMap(), good.getShopId());
				Criteria criteriaMer = new Criteria();
				criteriaMer.add(Restrictions.eq("merchantId", merchant.getId()));
				salesDeliverEntity.setEnterCode(merchant.getSign());// 店铺code
				List<MerchantUser> merchantUsers = merchantUserService.getList(getParamMap(), criteriaMer);
				if (merchantUsers != null) {
					salesDeliverEntity.setCreateEmpCode(merchantUsers.get(0).getId());// 制单人code
				}
				salesDeliverEntity.setVoucherCode(order.getOrderSn()); // 订单编号
				salesDeliverEntity.setCustomerCode(getCurrentMember(request).getId()); // 客户code
				salesDeliverEntity.setSumMoney(order.getGoodsTotalPrice());// 订单金额
				salesDeliverEntity.setIsSettled(1); // 是否结算
				salesDeliverEntity.setSettleMoney(order.getGoodsTotalPrice()); // 结算金额
				salesDeliverEntity.setApproveStatus(false); // 是否审核
				salesDeliverEntity.setBuzEmpCode(getCurrentMember(request).getUserName());// 经办人code
//				salesDeliverEntity.setCreateDate(new Date()); // 制单日期
				salesDeliverEntity.setPaymentAmount(order.getTotalAmount()); // 应付金额
				salesDeliverEntity.settlePayAmount = order.getTotalAmount(); // 已结金额
				salesDeliverEntity.setPaymentType(order.getPayType());// 收款方式名称

				for (OrderItem orderItem : orderItems) {
					Goods goods = goodsService.get(getParamMap(), orderItem.getGoodsId());
					SalesDeliverItemEntity itemEntity = new SalesDeliverItemEntity();
					itemEntity.setVoucherCode(order.getOrderSn()); // 主单code
					itemEntity.setProductCode(goods.getSn()); // 商品code
					itemEntity.setPackingUnitItemName(goods.getUnit());// 计量单位名称
					itemEntity.setCount(orderItem.getQuantity()); // 数量
					itemEntity.setSumCount(orderItem.getQuantity()); // 小计
					itemEntity.setIncludeTaxPrice(goods.getPrice()); // 含税价格
					itemEntity.setExcludeTaxPrice(goods.getPrice()); // 去税价格
					salesDeliverItems.add(itemEntity);
				}
				salesDeliverEntity.setSalesDeliverItems(salesDeliverItems);
				YunJiErpApiUtil.erpSalesDeliverRequest(salesDeliverEntity);
			}
		} catch (Exception e) {
			logger.error("生成新增销售单时，发生异常：", e);
		}
	}

	/**
	 * 把订单项里对应的商品处理成商品列表
	 *
	 * @param pager
	 * @param paramMap
	 * @param memberId
	 * @param orderSnList		订单编号集合
	 * @param model
	 * @return					已评论过的商品Id集合
	 * @throws Exception
	 */
    private List<String> processOrderItemToGoodsByOrderIds(Pager pager, Map<String,Object> paramMap, String memberId, List<String> orderSnList, Model model) throws Exception {
        List<String> reviewedGoodsIdList = new ArrayList<String>();
        /*List<Goods> goodsList = new ArrayList<Goods>();
        Map<String, String> goodsOrderItemMap = new HashMap<String, String>();
        Criteria criteria = new Criteria();
        criteria.add(Restrictions.in("orderSn", orderSnList));
        criteria.add(Restrictions.order("createDate", "desc"));
        pager.setPageSize(6);
        pager = orderItemService.getPager(tenantId, criteria, pager);
        List<OrderItem> orderItemList = (List<OrderItem>) pager.getList();
        if (orderItemList != null && orderItemList.size() > 0) {
            Set<String> goodsIds = new HashSet<String>();
            for (OrderItem item : orderItemList) {
                goodsIds.add(item.getGoodsId());
                goodsOrderItemMap.put(item.getId(), DateUtil.toString(item.getCreateDate()));

                Goods goods = goodsService.get(tenantId, item.getGoodsId());
                if (goods == null) continue;
                // 加载当前goods的图片
                List<GoodsImages> goodsImagesList = goodsImagesService.findList(tenantId, "goodsId", goods.getId());
                if (goodsImagesList != null && goodsImagesList.size() > 0) {
                    goods.setPic(goodsImagesList.get(0).getPic());
                }
                goods.setCreateDate(item.getCreateDate());
				goods.setOrderSn( item.getOrderSn() );
                goodsList.add(goods);
            }

            // 加载商品是否已评价过
            if (goodsIds != null && goodsIds.size() > 0) {
                Criteria c = new Criteria();
                c.add(Restrictions.in("goodsId", goodsIds));
				c.add(Restrictions.eq("memberId", memberId));
				c.add(Restrictions.eq("whichSys", "EC"));
				List<GoodsReview> goodsReviewList = goodsReviewService.getList(tenantId, c);
                if (goodsReviewList != null && goodsReviewList.size() > 0) {
                    for (GoodsReview review : goodsReviewList) {
                        reviewedGoodsIdList.add(review.getGoodsId());
                    }
                }
            }

			getAllCatelog(model);

            model.addAttribute("orderItemList", orderItemList);
            model.addAttribute("goodsList", goodsList);
            model.addAttribute("reviewedGoodsIdList", reviewedGoodsIdList);
            model.addAttribute("reviewedGoodsCount", goodsIds.size() - reviewedGoodsIdList.size());
            model.addAttribute("goodsOrderItemMap", goodsOrderItemMap);
            model.addAttribute("pager", pager);*/
		Integer reviewed=0;
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.in("orderSn", orderSnList));
		criteria.add(Restrictions.order("createDate", "desc"));
		pager.setPageSize(6);
		pager = orderItemService.getPager(getParamMap(), criteria, pager);
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		if (pager.getList() != null && pager.getList().size() > 0) {
			for (OrderItem item : (List<OrderItem>) pager.getList()) {
				Goods goods = goodsService.get(getParamMap(), item.getGoodsId());
				if (goods == null) continue;
				List<GoodsImages> goodsImagesList = goodsImagesService.findList(getParamMap(), "goodsId", goods.getId());
				if (goodsImagesList != null && goodsImagesList.size() > 0) {
					item.setPic(goodsImagesList.get(0).getPic());
				}
				if(item.getIsReview()==0) reviewed++;



                criteria = new Criteria();
                criteria.add(Restrictions.eq("orderSn", item.getOrderSn()));
                criteria.add(Restrictions.eq("memberId", memberId));
                criteria.add(Restrictions.eq("goodSId", item.getGoodsId()));
                criteria.add(Restrictions.eq("isRead", "NO"));
                criteria.add(Restrictions.notEq("whichSys", "EC"));
                List<GoodsReview> grs = goodsReviewService.getAllByCriteria(getParamMap(), criteria);
                item.setUnreadReviewCount(grs == null ? 0 : grs.size());


                orderItemList.add(item);
			}
        }
		model.addAttribute("orderItemList", orderItemList);
		model.addAttribute("reviewed",reviewed);
		getAllCatelog(model);
		model.addAttribute("pager", pager);
		model.addAttribute("services", cacheData.getServices(getParamMap()));

        return reviewedGoodsIdList;
    }

    /**
     * 计算商品的配送费用
     *
     * @param paramMap         租户Id
     * @param deliveryMethodId 配送方式Id
     * @param _cartItemIds     订单项Ids，以逗号分隔
     *
     * @return 最终的配送费用
     */
    private Double calculateGoodsDeliveryFee(Map<String, Object> paramMap, String deliveryMethodId, String _cartItemIds) {
        List<String> cartItemIds = null;
        if (StringUtils.isNotBlank(_cartItemIds)) {
            cartItemIds = Arrays.asList(_cartItemIds.split(","));
        }
        double deliveryFee = 0.00;
        try {
            DeliveryMethod deliveryMethod = deliveryMethodService.get(getParamMap(), deliveryMethodId);
            List<CartItem> cartItemList = cartItemService.findListByIds(getParamMap(), cartItemIds);
            if (cartItemList != null && cartItemList.size() > 0) {
                double goodsTotalWeight = 0.00; // 商品总重量
				boolean isFreeDeliveryFee = true; // 默认true为包邮
                for (CartItem item : cartItemList) {
                    Goods goods = goodsService.get(getParamMap(), item.getGoodsId());
					if(goods.getIsPost() == 0){ // 0为不包邮, 不包邮计算商品总重量
						isFreeDeliveryFee = false;
						goodsTotalWeight += goods.getWeight() * item.getQuantity();
					}
                }
				if(isFreeDeliveryFee){ // 所有商品都包邮，则运费为0
					deliveryFee = 0.0;
				}else{
					// 计算配送费用
					if (goodsTotalWeight <= deliveryMethod.getFirstWeight()) {
						deliveryFee = deliveryMethod.getFirstPrice();
					} else {
						double overWeight = goodsTotalWeight - deliveryMethod.getFirstWeight(); // 多出来的重量
						int continueUnit = deliveryMethod.getContinueWeight() > 0 ? ((int) Math.round(overWeight / deliveryMethod.getContinueWeight())) : 0;// 有几个单位的续重
						deliveryFee = deliveryMethod.getFirstPrice() + deliveryMethod.getContinuePrice() * continueUnit;
					}
				}

            }
        } catch (Exception e) {
            logger.error("计算配送费用时出异常", e);
        }

        return deliveryFee;
    }

    /**
     * 便利提醒统计数量
     */
    private void getConvenientTips(Model model, HttpServletRequest request) {
        String memberId = getCurrentMember(request).getId();
        try {
            Criteria c1 = new Criteria();
            c1.add(Restrictions.eq("memberId", memberId));
			c1.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_pay.toString()));
			c1.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.unpaid.toString()));
            List<Order> orderFuKuanCountList = orderService.getList(getParamMap(), c1);
            model.addAttribute("orderFuKuanCount", orderFuKuanCountList != null ? orderFuKuanCountList.size() : 0); // 待付款

            Criteria c2 = new Criteria();
            c2.add(Restrictions.eq("memberId", memberId));
            c2.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_seller_send_goods.toString()));
//            c2.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
			c2.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.unshipped.toString()));
            List<Order> orderFaHuoCountList = orderService.getList(getParamMap(), c2);
            model.addAttribute("orderFaHuoCount", orderFaHuoCountList != null ? orderFaHuoCountList.size() : 0); // 待发货

            Criteria c3 = new Criteria();
            c3.add(Restrictions.eq("memberId", memberId));
            c3.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_confirm_goods.toString()));
//            c3.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
            c3.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.shipped.toString()));
            List<Order> orderConfirmCountList = orderService.getList(getParamMap(), c3);
            model.addAttribute("orderConfirmCount", orderConfirmCountList != null ? orderConfirmCountList.size() : 0); // 待确认收货

			Criteria c4 = new Criteria();
			c4.add(Restrictions.eq("memberId", memberId));
			c4.add(Restrictions.eq("orderStatus", Order.OrderStatus.trade_finished.toString()));
			c4.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.takeover.toString()));
			List<Order> orderOverCountList = orderService.getList(getParamMap(), c4);
			model.addAttribute("orderOverCount", orderOverCountList != null ? orderOverCountList.size() : 0); // 已完成
        } catch (Exception e) {
            logger.error("统计订单快捷页的便利提醒时出错:", e.getMessage());
        }
    }

	/**
	 * 便利提醒统计数量APP
	 */
	private Map getConvenientTips(HttpServletRequest request) {
		Map map = new HashedMap();
		String memberId = getCurrentMember(request).getId();
		try {
			Criteria c1 = new Criteria();
			c1.add(Restrictions.eq("memberId", memberId));
			c1.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_pay.toString()));
			c1.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.unpaid.toString()));
			List<Order> orderFuKuanCountList = orderService.getList(getParamMap(), c1);
			map.put("orderFuKuanCount", orderFuKuanCountList != null ? orderFuKuanCountList.size() : 0); // 待付款

			Criteria c2 = new Criteria();
			c2.add(Restrictions.eq("memberId", memberId));
			c2.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_seller_send_goods.toString()));
//            c2.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
			c2.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.unshipped.toString()));
			List<Order> orderFaHuoCountList = orderService.getList(getParamMap(), c2);
			map.put("orderFaHuoCount", orderFaHuoCountList != null ? orderFaHuoCountList.size() : 0); // 待发货

			Criteria c3 = new Criteria();
			c3.add(Restrictions.eq("memberId", memberId));
			c3.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_confirm_goods.toString()));
//            c3.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
			c3.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.shipped.toString()));
			List<Order> orderConfirmCountList = orderService.getList(getParamMap(), c3);
			map.put("orderConfirmCount", orderConfirmCountList != null ? orderConfirmCountList.size() : 0); // 待确认收货

			Criteria c4 = new Criteria();
			c4.add(Restrictions.eq("memberId", memberId));
			c4.add(Restrictions.eq("orderStatus", Order.OrderStatus.trade_finished.toString()));
			c4.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.takeover.toString()));
			List<Order> orderOverCountList = orderService.getList(getParamMap(), c4);
			map.put("orderOverCount", orderOverCountList != null ? orderOverCountList.size() : 0); // 已完成
		} catch (Exception e) {
			logger.error("统计订单快捷页的便利提醒时出错:", e.getMessage());
		}
		return map;
	}

	/*
	private void checkOrder(Pager pager,HttpServletRequest request){
		try{
			Member mb = getCurrentMember(request);
			Criteria criteria = new Criteria();
			String status = getParameter(request, "status");
			if (StringUtils.isNotBlank(status)) {
				criteria.add(Restrictions.eq("orderStatus", status));
			}
			String yearS = getParameter(request, "yearS");
			if (StringUtils.isNotBlank(yearS)) {
				criteria.add(Restrictions.ge("a.createDate", yearS));//"str_to_date('" +year+" 00:00:00','%Y-%m-%d %H:%i:%s')"));
			}
			String yearE = getParameter(request, "yearE");
			if (StringUtils.isNotBlank(yearE)) {
				criteria.add(Restrictions.lt("a.createDate", yearE));//"str_to_date('" +year+" 00:00:00','%Y-%m-%d %H:%i:%s')"));
			}

			if( StringUtils.isBlank(yearS) && StringUtils.isBlank(yearE) ){
				yearS = DateUtils.dateToString(DateUtil.addMonth(new Date(), -3), "yyyy-MM-dd");
				criteria.add(Restrictions.ge("a.createDate", yearS));
			}

			criteria.add(Restrictions.eq("memberId", mb.getId()));
			if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
				criteria.add(Restrictions.order(pager.getOrderBy(), pager.getOrderType()));
			}
			pager.setPageSize(10);
			pager = orderService.getPager(getParamMap(), criteria, pager);
			List pagerDataList = pager.getList();
			if (pagerDataList != null && pagerDataList.size() > 0) {
				List<Order> orderList=(List<Order>) pagerDataList;
				for (Order order : orderList) {
					if(!order.getOrderStatus().equals(Order.OrderStatus.wait_buyer_pay) && !order.getPaymentStatus().equals(Order.PaymentStatus.unpaid)) continue;
					criteria = new Criteria();
					criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
					List<OrderItem> orderItemList = orderItemService.getList(getParamMap(), criteria);
					if(orderItemList != null && orderItemList.size() > 0) {
						for (OrderItem orderItem : orderItemList) {
							Goods goods=goodsService.get(getParamMap(),orderItem.getGoodsId());
							if(goods == null){
								order.setOrderStatus(Order.OrderStatus.order_item_exception);
								order.setPaymentStatus(Order.PaymentStatus.order_item_exception);
								continue;
							}else if(goods.getIsMarketable()==0){
								order.setOrderStatus(Order.OrderStatus.order_item_exception);
								order.setPaymentStatus(Order.PaymentStatus.order_item_exception);
								continue;
							}
						}
					}
					if(order.getOrderStatus().equals(Order.OrderStatus.order_item_exception) && order.getPaymentStatus().equals(Order.PaymentStatus.order_item_exception)){
						orderService.update(getParamMap(),order);
					}
				}
			}
		}catch(Exception e){
			logger.error("检查订单项商品信息时出错:", e.getMessage());
		}
	}*/

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

	@RequestMapping(value = "/ajax/loadmore", method = {RequestMethod.POST})
	public
	@ResponseBody
	Object orderLoadMore(Model model,HttpServletRequest request) {
		String info = "Ajax加载更多的我的订单";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "操作成功");
		try {

			Member mb = getCurrentMember(request);

			Pager pager = new Pager();
			pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
			pager.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
			Criteria criteria = processCriteria(pager, mb, request);
			pager = orderService.getPager(getParamMap(), criteria, pager);
			if(Global.HYBRIDAPP.equals(request.getParameter(Global.WHICHCLIENT))){
				List pagerDataList = pager.getList();

				if (pagerDataList != null && pagerDataList.size() > 0) {
					List<Order> orderList = (List<Order>) pagerDataList;
					List<OrderItem> allOrderItemList = new ArrayList<OrderItem>();
					processOrderItem(orderList, allOrderItemList);
					result.put("orderList", orderList);
					result.put("orderItemList", allOrderItemList);
					result.put("pager", pager);
				}
			}else{
				if (pager.getList() != null && pager.getList().size() > 0) {
					List<OrderItem> allOrderItemList = new ArrayList<OrderItem>();
					processOrderItem((List<Order>)pager.getList(), allOrderItemList);
					result.put("orderItemList", allOrderItemList);
					result.put("pager", pager);
				}

			}
			Map map=getConvenientTips(request);

			result.put("orderFuKuanCount", map.get("orderFuKuanCount"));
			result.put("orderFaHuoCount", map.get("orderFaHuoCount"));
			result.put("orderConfirmCount", map.get("orderConfirmCount"));
			result.put("orderOverCount", map.get("orderOverCount"));

			result.put("orderStatusMapping", getOrderStatusMapping());
			return result;
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "操作失败");
		}
		return result;
	}


	@RequestMapping("/tradingsuccess/{orderId}")
	public String tradingsuccess(@PathVariable String orderId, Model model, HttpServletRequest request) {

		try {
			Order order = orderService.get(getParamMap(), orderId);
			model.addAttribute("order", order);
			model.addAttribute("services", cacheData.getServices(getParamMap()));
		} catch (Exception e) {
			logger.error("跳转到交易成功页面时，发生异常, orderId=" + orderId, e);
		}
		String type = request.getParameter(Global.WHICHCLIENT);
		return Global.TEMPLATE_APP + PATH + "/trading_success";
	}
}
