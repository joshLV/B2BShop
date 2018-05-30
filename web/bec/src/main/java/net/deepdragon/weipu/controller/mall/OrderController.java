package net.deepdragon.weipu.controller.mall;

import com.Logistics.LogisticsUtil;
import com.alibaba.fastjson.JSONObject;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.*;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.erp.yunji.api.YunJiErpApiUtil;
import net.deepdragon.erp.yunji.entity.SalesDeliverEntity;
import net.deepdragon.erp.yunji.entity.SalesDeliverItemEntity;
import net.deepdragon.service.*;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.*;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.PropertiesUtil;
import net.deepdragon.weipu.tools.excel.DownloadExcel;
import net.deepdragon.weipu.tools.excel.ExportExcel;
import net.deepdragon.weipu.tools.exportword.WordUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
	private OrderPaylogService orderPaylogService;
	@Resource
	private OrderRefundService orderRefundService;
	@Resource
	private MenuService menuService;
	@Resource
	private CacheData cacheData;
	@Resource
	private BuyerRankService buyerRankService;
	@Resource
	private GoodsImagesService goodsImagesService;
	@Resource
	private GoodsService goodsService;
	@Resource
	private BuyerReceiverService receiverService;
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
	private B2BGoodsReviewService goodsReviewService;
	@Resource
	private SystemSetService systemSetService;
	@Resource
	private QuotationService quotationService;
	@Resource
	private QuotationDetailsService quotationDetailsService;
	@Resource
	private EnquiryService enquiryService;
	@Resource
	private ComplaintService complaintService;
	@Resource
	private PurchaseOrderDetailService purchaseOrderDetailService;
	@Resource
	private AreaService areaService;
	@Resource
	private LogisticsInfoService logisticsInfoService;


	
	@RequestMapping("error/{orderNo}")
	public Object error(@PathVariable String orderNo, Model model) {
		String info = "订单[" + orderNo + "]不存在，请联系管理员。";
		setLogInfo(info);
		logger.error(info);
		model.addAttribute("info", info);
		model.addAttribute("orderNo", orderNo);
		return Global.TEMPLATE_MALL + PATH + "/member/order_error";
	}

	@RequestMapping(value = "list")
	public String list(Pager pager, Model model, HttpServletRequest request) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "我的订单";
		setLogInfo(info);
		logger.debug(info);

		/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
		LoginType loginType = getLoginType(request);
		model.addAttribute("loginType", loginType);
		String operatorRole = getOperatorRole(request);
		BuyerOperator buyerOperator = getCurrentOperator(request);
		if (LoginType.operator.equals(loginType)) {
			model.addAttribute("role", operatorRole);
		}
		/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/

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


		setPublicDate2Model(model);
		model.addAttribute("orderStatusMapping", getOrderStatusMapping());
		if(Global.WHICH_APP.equals(whichclient)){
			return Global.TEMPLATE_APP + PATH + "/member/my_order_list";
		}else{
			String orderType = getParameter(request, "orderType_");
			if (StringUtils.isNotBlank(orderType)) {
				if("1".equals(orderType)) {
					return Global.TEMPLATE_MALL + PATH + "/member/zcorder_list";
				}
			}
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
		setPublicDate2Model(model);
        model.addAttribute("orderStatusMapping", getOrderStatusMapping());
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

			List<Map<String,Object>> orders = processJsonParameter(cartItemIds, request);

			List<Order> list = orderService.saveOrder(getParamMap(), orders, cartItemIds,isEnableConfirm() );

			String dataFrom =request.getParameter("dataFrom");//标记订单来源， 1.EC购物车；2.BEC购物车；3.报价单  来区分商品价格获取
			if(list != null && list.size() > 0){
				if("3".equals(dataFrom)){
					String quotationId=request.getParameter("quotationId"); //报价单ID
					String enquiryId=request.getParameter("enquiryId"); //询价单ID
					//更新报价单 下单状态
					Quotation quotation = quotationService.get(getParamMap(),quotationId);
					quotation.setIsDownOrder(2);
					quotation.setModifyDate(new Date());
					quotation.setModifyUser(list.get(0).getCreateUser());
					quotationService.update(getParamMap(), quotation);
					//更新询价单 状态
					Enquiry enquiry = enquiryService.get(getParamMap(),enquiryId);
					enquiry.setEnquiryState(3);
					enquiry.setModifyDate(new Date());
					enquiry.setModifyUser(list.get(0).getCreateUser());
					enquiryService.update(getParamMap(), enquiry);
				}
			}
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
						} else if ("offlinepay".equals(order.getPayType())) {//线下支付
							result.put("payType", "offlinepay");
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
					if (isUseErpApi(getParamMap())){
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
			e.printStackTrace();
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

	@RequestMapping("validateGoods/{orderId}")
	@ResponseBody
	public Object validateGoods(@PathVariable String orderId, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			orderService.validateGoods(getParamMap(), orderId);

			// 调用接口
			if (isUseErpApi(getParamMap())) {
				BusinessPartnersRequest(orderId, request);
			}
		} catch (Exception e) {
			logger.error("确认到货时，发生异常, orderId=" + orderId, e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "确认到货时，发生异常");
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
		String tenantId = getCurrentMember(request).getTenantId();
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
	 * 根据订单编号获取订单物流信息
	 * 2016年11月30日11:33:59 lxb
	 * @param orderSn
	 * @param request
     * @return
     */
	@RequestMapping("getWLXX4DB_ghj_logistics_info/{orderSn}")
	@ResponseBody
	public Object getWLXX4DB_ghj_logistics_info(@PathVariable  String orderSn, HttpServletRequest request){
		Map<String,Object> result = this.getParamMap();
		String info="获取订单物流信息";
		try{
			result.put("orderSn",orderSn);
			List<LogisticsInfo> logisticsInfosList=logisticsInfoService.getAll(result);
			if(logisticsInfosList!=null && logisticsInfosList.size()>0){
				result.put("status","success");
				result.put("logisticslist",logisticsInfosList);
			}else{
				result.put("status","fall");
				result.put("message","暂时没有物流信息！");
			}
		}catch (Exception e){
			logger.error(info + "时，发生异常", e);
		}
		return result;
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
		String goodsType = request.getParameter("goodsType"); //20160520 dzz 区分普通商品与众筹商品(商品类型：0_普通商品，1_众筹商品)
		String goodsId = request.getParameter("goodsId"); //20160520 dzz 商品信息Id
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
				/** 如果是众筹订单，查询活动是否结束 TianYu 2016-06-12 16:52:55 Start */
				if( order.getOrderType() == 1 ){
					Goods goods = this.goodsService.getZhongchouById(getParamMap(), orderItemList.get(0).getGoodsId());
					if( goods != null ){
						model.addAttribute("isZCSuccess", goods.getZhongChouStatus());
//						endFlag参数代表(1:众筹结束时间小于当前时间, 0:众筹结束时间大于等于当前时间, -1:非众筹菜单)
						if(goods.getZcEndTime().before(new Date())) {
							model.addAttribute("endFlag", "1");
						} else if(goods.getZcEndTime().after(new Date())) {
							model.addAttribute("endFlag", "0");
						}
					}
				/** 如果是众筹订单，查询活动是否结束 TianYu 2016-06-12 16:52:55 End */
				}
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
			/* 报价单下的订单 商品从询价商品表中获取  2015-10-29 hks modify start*/
				if(StringUtil.isNotEmpty(order.getQuotationId())){
				List<QuotationDetails> quotationDetails = quotationDetailsService.findList(getParamMap(), "quotationId", order.getQuotationId());
				List<Goods> goodsList = new ArrayList<>();
				for(QuotationDetails quotationDetails1:quotationDetails){
					for(OrderItem orderItem : orderItemList) {
						if( quotationDetails1.getGoodsName().equals( orderItem.getGoodsName() ) ){
							orderItem.setGoodsId( quotationDetails1.getId() );
							Goods goods = new Goods();
							goods.setId(quotationDetails1.getId() );
							goods.setPrice(quotationDetails1.getQuotationPrice());
							goods.setName(quotationDetails1.getName());
							goods.setFullName(quotationDetails1.getGoodsName());
							goods.setSn(quotationDetails1.getSn());
							goods.setImage( null );
							goodsList.add(goods);

							break;
						}
					}
				}

				model.addAttribute("goodsList", goodsList);
				model.addAttribute("orderItemList", orderItemList);
			}
			/* 报价单下的订单 商品从询价商品表中获取  2015-10-29 hks modify end*/
			// 附加物流配送信息
			OrderDistribution orderDistribution = orderDistributionService.find(getParamMap(), "orderSn", order.getOrderSn());
			if (orderDistribution != null) {
				if (StringUtils.isBlank(orderDistribution.getLogisticsCompany())) {
					LogisticsCompany company = logisticsCompanyService.get(getParamMap(), orderDistribution.getLogisticsCompanyId());
					if(company != null){
						orderDistribution.setLogisticsCompany(company.getName());
						model.addAttribute("expressCompanyUrl",company.getUrl());
					}else{
						orderDistribution.setLogisticsCompany("未知的物流公司");
						model.addAttribute("expressCompanyUrl","");
					}

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
				order.setOrderRefund( ors.get(ors.size()-1) );
			}else{
				order.setIsRefund("N");
			}
			/** 组装是否填写退款申请 TianYu 2015-9-22 Start */



			/** 添加支付信息统计 TianYu 2016-3-22 16:25:49 Start**/
			model.addAttribute("payCountList", getOrderSum(order.getMemberId(), order.getOrderSn()));
			/** 添加支付信息统计 TianYu 2016-3-22 16:25:49 End**/


			if(goodsType!=null && !"".equals(goodsType)) {
				model.addAttribute("goodsType", goodsType);
				if("1".equals(goodsType)) {
					Goods goods = goodsService.getZCOrderInfoById(getParamMap(), goodsId);
					model.addAttribute("zcgoods", goods);
				}
			}

			model.addAttribute("order", order);
			model.addAttribute("shop",  merchantService.get(getParamMap(), order.getShopId()));
			setPublicDate2Model(model);
		} catch (Exception e) {
			logger.error("查看订单时，发生异常, orderId=" + orderId, e);
		}

		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH + "/order_detail";
		}else{

			model.addAttribute("hasSuccesTip", request.getParameter("hasSuccesTip"));
			return Global.TEMPLATE_MALL + PATH + "/member/order_detail";
		}
	}

	/**
	 * 查询订单支付数据：按照支付类型分组统计
	 * @param memberId
	 * @param orderSn
     * @return
     */
	private List<OrderPaylog> getOrderSum(String memberId, String orderSn) throws Exception {
		List<OrderPaylog> paylogs = this.orderPaylogService.getPayTotalGroupByType(getParamMap(), orderSn, memberId);
		for( OrderPaylog payLog : paylogs ){
			if( "allinpay".equals(payLog.getName()) ){
				payLog.setName("通联支付");
			}else if( "chinaumspay".equals(payLog.getName()) ){
				payLog.setName("全民付");
			}else if( "alipay".equals(payLog.getName()) ){
				payLog.setName("支付宝");
			}else if( "unionpay".equals(payLog.getName()) ){
				payLog.setName("银联在线支付");
			}else if( payLog.getName().startsWith("wxpay") ){
				payLog.setName("微信支付");
			}else if( payLog.getName().startsWith("account") ){
				payLog.setName("账户支付");
			}else if( payLog.getName().startsWith("redenvelop") ){
				payLog.setName("红包支付");
			}else if( payLog.getName().startsWith("credit") ){
				payLog.setName("授信支付");
			}else if("offlinepay".equals(payLog.getName())){
				payLog.setName("线下支付");
			}
		}

		return paylogs;
	}

	private void processOrderItemGoods(Model model, Map<String,Object> paramMap, List<OrderItem> orderItemList) throws Exception {
		Criteria criteria;
		List<String> goodsIds = new ArrayList<String>();
		for (OrderItem orderItem : orderItemList) {
            goodsIds.add(orderItem.getGoodsId());
        }
		criteria = new Criteria();
		criteria.add(Restrictions.in("a.id", goodsIds));
//		criteria.add(Restrictions.eq("status", 5));
		List<Goods> goodsList = goodsService.getList(paramMap, criteria);

		// 加载当前goods的图片
		if (goodsList != null && goodsList.size() > 0) {
            for (Goods goods : goodsList) {
                List<GoodsImages> goodsImagesList = goodsImagesService.findList(paramMap, "goodsId", goods.getId());
                if (goodsImagesList != null && goodsImagesList.size() > 0) {
                    goods.setPic(goodsImagesList.get(0).getPic());
                }
				/*** 商品价格取订单详情中的成交价格  TianYu  2015-12-17 17:11:02 Start***/
				for (OrderItem orderItem : orderItemList) {
					if( goods.getId().equals( orderItem.getGoodsId() )){
						goods.setPrice( orderItem.getGoodsPrice() );
						break;
					}
				/*** 商品价格取订单详情中的成交价格  TianYu  2015-12-17 17:11:02 Start***/
				}
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
                processOrderItemToGoodsByOrderIds(pager, getParamMap(),memberId, orderSnList, model);
				model.addAttribute("orderSNStr", sn);
            } else {
//                List<String> reviewedGoodsIdList = new ArrayList<String>();
                boolean isReviewed = false;
                String goodsId = getParameter(request, "goodsId");
				Criteria orderCriteria = new Criteria();
				orderCriteria.add(Restrictions.eq("memberId", memberId));
				orderCriteria.add(Restrictions.eq("orderStatus", Order.OrderStatus.trade_finished));
				orderCriteria.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid));
				/** 过滤掉从报价单下的订单  TianYu 2016-04-26 15:28:06 Start */
				orderCriteria.add(Restrictions.isNull("enquiryId"));
				orderCriteria.add(Restrictions.isNull("quotationId"));
				orderCriteria.add(Restrictions.eq("platform", getPlatform()));
				/** 过滤掉从报价单下的订单  TianYu 2016-04-26 15:28:06 End */

				/** 过滤掉众筹订单  TianYu 2016-06-07 09:23:38 Start */
				orderCriteria.add(Restrictions.eq("orderType", 0));
				/** 过滤掉众筹订单  TianYu 2016-06-07 09:23:38 End */

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
		setPublicDate2Model(model);
		getAllCatelog(model);
		String type = request.getParameter(Global.WHICHCLIENT);

		/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
		LoginType loginType = getLoginType(request);
		model.addAttribute("loginType", loginType);
		String operatorRole = getOperatorRole(request);
		if (LoginType.operator.equals(loginType)) {
			model.addAttribute("role", operatorRole);
		}
        /**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/


		if(Global.WHICH_APP.equals(type)){
			if(!StringUtil.isEmpty(request.getParameter("orderId"))){
				model.addAttribute("orderId",request.getParameter("orderId"));
			}
			return Global.TEMPLATE_APP + PATH + "/goods_review";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/goods_review";
		}
    }


	@RequestMapping(value = "/ajax/review", method = {RequestMethod.POST})
	public
	@ResponseBody
	Object ajaxReview(Pager pager, String sn, Model model, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		//List<OrderItem> reviewedGoodsIdList=null;
		try {

			String memberId = getCurrentMember(request).getId();
			boolean isReviewed = false;
			String goodsId = getParameter(request, "goodsId");
			Criteria orderCriteria = new Criteria();
			orderCriteria.add(Restrictions.eq("memberId", memberId));
			orderCriteria.add(Restrictions.eq("orderStatus", Order.OrderStatus.trade_finished));
			orderCriteria.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid));
			/** 过滤掉从报价单下的订单  TianYu 2016-04-26 15:28:06 Start */
			orderCriteria.add(Restrictions.isNull("enquiryId"));
			orderCriteria.add(Restrictions.isNull("quotationId"));
			orderCriteria.add(Restrictions.eq("platform", getPlatform()));
			/** 过滤掉从报价单下的订单  TianYu 2016-04-26 15:28:06 End */

			/** 过滤掉众筹订单  TianYu 2016-06-07 09:23:38 Start */
			orderCriteria.add(Restrictions.eq("orderType", 0));
			/** 过滤掉众筹订单  TianYu 2016-06-07 09:23:38 End */

			List<Order> orderList = orderService.getList(getParamMap(), orderCriteria);
			if (orderList != null && orderList.size() > 0) {
				List<String> orderSnList = new ArrayList<String>();
				for (Order order : orderList) {
					orderSnList.add(order.getOrderSn());
				}
				result = ajaxProcessOrderItemToGoodsByOrderIds(pager, getParamMap(), memberId, orderSnList, model);
				result.put(STATUS, SUCCESS);
				result.put(MESSAGE, "操作成功");
				/*if (reviewedGoodsIdList.contains(goodsId)) {
					isReviewed = true;
				}*/
			}
			model.addAttribute("currGoodsId", goodsId); // 当前商品的Id，即：在页面上默认要打开此商品的评价...
			model.addAttribute("isReviewed", isReviewed);
			model.addAttribute("memberId", memberId);
		} catch (Exception e) {
			logger.error("获取已完成的订单商品时，发生异常, orderSn=" + sn, e);
		}
		/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
		LoginType loginType = getLoginType(request);
		model.addAttribute("loginType", loginType);
		String operatorRole = getOperatorRole(request);
		if (LoginType.operator.equals(loginType)) {
			model.addAttribute("role", operatorRole);
		}
		/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/
		return result;
	}

	@RequestMapping("doReview/{goodsId}")
	@ResponseBody
    public Object doReview(@PathVariable String goodsId, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<String, Object>();
        String tenantId = getCurrentMember(request).getTenantId();
        String memberId = getCurrentMember(request).getId();
        String createUser = getCurrentMember(request).getUserName();
        String review = getParameter(request, "review");
        try {
            if (StringUtils.isNotBlank(review)) {
                review = URLDecoder.decode(review, "UTF-8");
                B2BGoodsReview goodsReview = JSONObject.parseObject(review, B2BGoodsReview.class);
				Order order = this.orderService.find(getParamMap(), "orderSn", goodsReview.getOrderSn() );
                goodsReview.setGoodsId(goodsId);
				goodsReview.setIp(getIpAddress(request));
                goodsReview.setIsShow(1);
                goodsReview.setBuyerId(memberId);
                goodsReview.setCreateUser(createUser);
				goodsReview.setWhichSys("BEC");
				goodsReview.setIsRead("NO");
				goodsReview.setParentId(null);
				goodsReview.setBuyDate(order.getCreateDate());
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
			List<B2BGoodsReview> grs = goodsReviewService.getList(getParamMap(), criteria);
			if( grs == null || grs.size() == 0){
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "原有评价不存在");
				return result;
			}
			if (StringUtils.isNotBlank(review)) {
				B2BGoodsReview gr = grs.get(0);
				review = URLDecoder.decode(review, "UTF-8");

				Order order = this.orderService.find(getParamMap(), "orderSn", orderSn );
				B2BGoodsReview goodsReview = new B2BGoodsReview();
				goodsReview.setOrderSn(orderSn);
				goodsReview.setContent(review);
				goodsReview.setGoodsId(gr.getGoodsId());
				goodsReview.setIp(getIpAddress(request));
				goodsReview.setIsShow(1);
				goodsReview.setBuyerId(memberId);
				goodsReview.setCreateUser(createUser);
				goodsReview.setWhichSys("BEC");
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
			List<B2BGoodsReview> grs = this.goodsReviewService.getAllByCriteria(getParamMap(), criteria);
			if( grs == null || grs.size() == 0){
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "不存在未读评价");
				return result;
			}
			for( B2BGoodsReview gr: grs){
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

	/**
	 * 处理前端传过来的json参数对象
	 *
	 * @param cartItemIds
	 *           购物车ID集合
	 *
	 * @param request
	 *  获取前端传过来的json参数对象
	 * @return 普通map
	 */
	private List<Map<String,Object>> processJsonParameter(List<String> cartItemIds,HttpServletRequest request) throws Exception {
		List<Map<String,Object>> orders = new ArrayList<Map<String, Object>>();

		Map<String, Object> orderMap = new HashMap<String, Object>();
		Buyer member = getCurrentMember(request);
		/** 获取会员等级 TianYu  2016-1-18 14:45:56 Start **/
		BuyerRank buyerRank = this.buyerRankService.get(getParamMap(), member.getRankId());
		double scale = buyerRank.getScale()/100;//等级优惠
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

		/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 Start****/
		String isMemberPrice = request.getParameter("isMemberPrice"); //询价单ID
		String hasInsuranceFee = request.getParameter("hasInsuranceFee"); //报价单ID
		/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 End****/

		BuyerReceiver receiver = receiverService.get(getParamMap(), receiverId);
		PaymentMethod paymentMethod = paymentMethodService.get(getParamMap(), paymentMethodId);
		DeliveryMethod deliveryMethod = deliveryMethodService.get(getParamMap(), deliveryMethodId);

		/**
		 * Desc:createOrderType--》产生订单类型 值为1表示  由采购单生成订单 其它此参数不起作用
		 * Auth:zhangqiang
		 * Time:2016-02-29 10:45:35
		 */
		List<CartItem> cartItemList = null;

		String createOrderType = request.getParameter("createOrderType");
		if(StringUtil.isNotEmpty(createOrderType) && "1".equals(createOrderType)){
			cartItemList = purchaseOrderDetailService.getListByBuyerIdAndIdsPurchaseOrder(getParamMap(), member.getId(), cartItemIds);
		}else{
			cartItemList = cartItemService.findListByIds(getParamMap(), cartItemIds);
		}
        /*------------------------------------------------------------------------------------------------------------*/

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
		/**会员价、保价 **/
		orderMap.put("isMemberPrice", isMemberPrice);
		orderMap.put("hasInsuranceFee", hasInsuranceFee);


		/** 购物车 **/
		if("1".equals(dataFrom) || "2".equals(dataFrom) ){//1.EC购物车；2.BEC购物车
			if (cartItemList != null && cartItemList.size() > 0) {
				/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 Start */
				List<Map<String,Object>> items = groupCartItemByShop(cartItemList);
				//根据配置文件配置的参数判断是否根据商品运费系数计算运费，pplication.calcFreightByModuls配置属性的值为enabled，则根据商品系数计算，否则按照以前的计算流程
				String calculatByModules= calcFreightByModuls();//PropertiesUtil.getValue("applicationContext.properties", "application.calcFreightByModuls");
				Receiver receiverN=new Receiver();
				MyBeanUtils.copyBean2Bean(receiverN,receiver);
				if("enabled".equals(calculatByModules)){
					costCalculationByModules(items,buyerRank.getScale()/100,receiverN,deliveryMethod,isMemberPrice,hasInsuranceFee);
				}else{
					costCalculation(getParamMap(), receiverN, deliveryMethodId, items,isMemberPrice,hasInsuranceFee);
				}
				//costCalculation(getParamMap(), deliveryMethodId, items);
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
					order.put("defaultDeliveryFee", map.get("defaultDeliveryFee"));
					order.put("goodsTotalQuantity", map.get("goodsTotalQuantity"));

					/** 添加等级优惠金额  TianYu 2016-1-18 15:46:21 Start */
					Double discount = StringUtil.numberHalfAdjust(((Double) map.get("goodsTotal")) * scale , 2);
					order.put("discount", discount);//优惠金额
					/** 添加等级优惠金额  TianYu 2016-1-18 15:46:21 End */

					/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 Start****/
					if("yes".equalsIgnoreCase(hasInsuranceFee)) {
						order.put("insuranceFee", map.get("insuranceFee"));
					}else{
						order.put("insuranceFee", 0);
					}
					/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 End****/

					order.put("totalAmount", (Double)map.get("shopTotal") - discount);
					order.put("memberId",member.getId() );
					order.put("createUser", member.getUserName());
					order.put("platform", getPlatform());

					for (CartItem item : (List<CartItem>)map.get("items")) {
						// 组装OrderItem的Map
						Map<String, Object> orderItemMap = new HashMap<String, Object>();
						orderItemMap.put("goodsId", item.getGoodsId());
						orderItemMap.put("goodsName", item.getName());
						orderItemMap.put("goodsPrice", item.getPrice());
						orderItemMap.put("quantity", item.getQuantity());
						orderItemMap.put("createUser", member.getUserName());

						/** 组装规格及备注 TianYu 2015-9-14 Start */
						installSp(item);
						orderItemMap.put("specification", item.getSpecification());
						orderItemMap.put("ps", request.getParameter("ps_" + item.getGoodsId()));
						/** 组装规格及备注 TianYu 2015-9-14 End */

						orderItemMapList.add(orderItemMap);
					}

					pMap.put("dataFrom", dataFrom);//标记订单来源， 1.EC购物车；2.BEC购物车；3.报价单  来区分商品价格获取
					pMap.put("order", order);
					pMap.put("orderItems", orderItemMapList);
					orders.add(pMap);
				}

			}
		}else if("3".equals(dataFrom)){//报价单

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
						orderItemMap.put("ps", request.getParameter("ps_" + item.getId()));
						/** 组装规格及备注 TianYu 2015-9-14 End */

						orderItemMapList.add(orderItemMap);
					}
					order.put("goodsTotalQuantity", goodsTotalQuantity);
				   //根据配置文件配置的参数判断是否根据商品运费系数计算运费，pplication.calcFreightByModuls配置属性的值为enabled，则根据商品系数计算，否则按照以前的计算流程
					String calculatByModules= calcFreightByModuls();//PropertiesUtil.getValue("applicationContext.properties", "application.calcFreightByModuls");
					Receiver receiverN=new Receiver();
					MyBeanUtils.copyBean2Bean(receiverN,receiver);
					if("enabled".equals(calculatByModules)){
						costCalculationByModules(orderItemMapList,buyerRank.getScale()/100,receiverN,deliveryMethod, isMemberPrice, hasInsuranceFee);
					}else{
						costCalculation(getParamMap(), receiverN, deliveryMethodId, orderItemMapList, isMemberPrice, hasInsuranceFee);
					}
					pMap.put("dataFrom", dataFrom);//标记订单来源， 1.EC购物车；2.BEC购物车；3.报价单  来区分商品价格获取
					pMap.put("order", order);
					pMap.put("orderItems", orderItemMapList);
					orders.add(pMap);

				}
			}
			/** 组装报价单提交过来的商品等数据 hks 2015-10-22 end */
		}
		return orders;
	}

    @RequestMapping("countDeliveryFee")
    @ResponseBody
    public Object countDeliveryFee(HttpServletRequest request) {
        String deliveryMethodId = getParameter(request, "deliveryMethodId"); // 配送方式Id
        String _cartItemIds = getParameter(request, "cartItemIds"); // 购物车内商品Ids
        return calculateGoodsDeliveryFee(getParamMap(), deliveryMethodId, _cartItemIds);
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
	 * @param receiver
	 * @param deliveryMethodId
	 * @param items
	 * @param isMemberPrice
	 * @param hasInsuranceFee
	 */
	private void costCalculation(Map<String, Object> paramMap, Receiver receiver, String deliveryMethodId, List<Map<String, Object>> items, String isMemberPrice, String hasInsuranceFee) throws Exception{
		if( items != null && items.size() > 0 ){
			for(Map<String,Object> map : items ){
				Map<String,Object> m = calculateShopFee(paramMap,receiver,deliveryMethodId,(List<CartItem>)map.get("items"),isMemberPrice);

				/** 查询商家的初始运费并加入运费中 TianYu 2016-07-28 09:29:58 Start */
				Merchant shop = this.merchantService.get(getParamMap(), map.get("shopId")+"");
				double defaultDeliveryFee = shop.getInitialPost()==null ? 0d : shop.getInitialPost();
				/** 查询商家的初始运费并加入运费中 TianYu 2016-07-28 09:29:58 End */

				map.put("goodsTotal", m.get("goodsTotal"));
				map.put("defaultDeliveryFee", defaultDeliveryFee);/** 查询商家的初始运费 */
				map.put("deliveryFeeTotal", (double)m.get("deliveryFeeTotal") + defaultDeliveryFee);/** 查询商家的初始运费并加入运费中 TianYu 2016-07-28 09:29:58 */
				map.put("goodsTotalQuantity", m.get("goodsTotalQuantity"));
				map.put("shopTotal", (double)m.get("shopTotal") + defaultDeliveryFee);
				/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 Start****/
				if("yes".equalsIgnoreCase(hasInsuranceFee)){
					Double insuranceFee = StringUtil.numberHalfAdjust(Double.parseDouble(m.get("goodsTotal")+"") / 1000, 2);
					map.put("insuranceFee", insuranceFee);
					map.put("shopTotal", ((Double)m.get("shopTotal")) + insuranceFee);
				}
				/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 End****/
			}
		}
	}

	/**------------------begin----------------根据商品运费系数计算运费  author yuech time 2016-02-25---------------*/
	/**
	 * 	 * 新增方法：根据商品的运费系数计算订单运费
	 1、计算商品总金额：goodsTotal  【商品购买数量 X 商品价格 X 运费比例】
	 2、计算店铺总运费（订单运费）：deliveryFeeTotal   商品1的运费 + 商品2的运费 + … + 商品n的运费
	 3、店铺合计：shopTotal
	 * @author yuech
	 * @Date 2016-02-25 16:00:00
	 * @param items
	 * @param scale
	 * @param receiver
	 * @param defaultDeliveryMethod  默认的配送方式 如果配送方式为【自提】
	 * @param isMemberPrice
	 * @param hasInsuranceFee
	 */
	private void costCalculationByModules(List<Map<String, Object>> items, Double scale, Receiver receiver, DeliveryMethod defaultDeliveryMethod, String isMemberPrice, String hasInsuranceFee) throws  Exception{
		if( items != null && items.size() > 0 ){
			for(Map<String,Object> map : items ){
				Map<String,Double> m = calculateShopModulesFee((List<CartItem>) map.get("items"), receiver, defaultDeliveryMethod,isMemberPrice);
				//Double discount = StringUtil.numberHalfAdjust(((Double) m.get("goodsTotal")) * scale,2);

				/** 查询商家的初始运费并加入运费中 TianYu 2016-07-28 09:29:58 Start */
				Merchant shop = this.merchantService.get(getParamMap(), map.get("shopId")+"");
				double defaultDeliveryFee = shop.getInitialPost()==null ? 0d : shop.getInitialPost();
				/** 查询商家的初始运费并加入运费中 TianYu 2016-07-28 09:29:58 End */


				map.put("goodsTotal", m.get("goodsTotal"));
				//map.put("discount", discount);//计算优惠比例
				map.put("defaultDeliveryFee", defaultDeliveryFee);/** 查询商家的初始运费*/
				map.put("deliveryFeeTotal", m.get("deliveryFeeTotal") + defaultDeliveryFee);/** 查询商家的初始运费并加入运费中 TianYu 2016-07-28 09:29:58*/
				//map.put("shopTotal", m.get("shopTotal") - discount);
				map.put("shopTotal", m.get("shopTotal") + defaultDeliveryFee);//修复多减去了一次优惠的bug
				map.put("goodsTotalQuantity", m.get("goodsTotalQuantity"));

				/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 Start****/
				if("yes".equalsIgnoreCase(hasInsuranceFee)){
					Double insuranceFee = StringUtil.numberHalfAdjust(Double.parseDouble(m.get("goodsTotal")+"") / 1000, 2);
					map.put("insuranceFee", insuranceFee);
					map.put("shopTotal", ((Double)map.get("shopTotal")) + insuranceFee);
				}
				/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 End****/
			}
		}
	}
	/**
	 * 计算店铺中所有计算商品的
	 * 1、计算店铺商品总金额：goodsTotal
	 * 2、计算店铺总运费：deliveryFeeTotal
	 * 3、店铺合计：shopTotal
	 *
	 * @param cartItemList     订单项列表
	 *
	 * @param isMemberPrice
	 * @return 最终的配送费用
	 */
	private Map<String,Double> calculateShopModulesFee(List<CartItem> cartItemList, Receiver receiver, DeliveryMethod defaultDeliveryMethod, String isMemberPrice) {
		Map<String,Double> map = new HashMap<String, Double>();
		double goodsTotal = 0.00;
		double deliveryFee = 0.00;
		double goodsTotalQuantity = 0;
		/**当参数为0表示第一次进入支付审核页面 快递默认是第一个 否则 快递id为传值 Auth:zhangqiang Time:2015-09-25 17:56"35 Start
		 * */
		try {

			/**当参数为0表示第一次进入支付审核页面 快递默认是第一个 否则 快递id为传值 Auth:zhangqiang Time:2015-09-25 17:56"35 End
			 * */
			if (cartItemList != null && cartItemList.size() > 0) {
				Criteria criteria = new Criteria();
				for (CartItem item : cartItemList) {
					Goods goods = goodsService.get(getParamMap(), item.getGoodsId());
					criteria.add(Restrictions.eq("g."+ Constant.TENANTID_KEY, getParamMap().get(Constant.TENANTID_KEY)));
					criteria.add(Restrictions.eq("g.id", item.getGoodsId()));
					criteria.add(Restrictions.eq("m.areaPath", receiver.getAreaPath()));
					criteria.add(Restrictions.eq("m.areaId", receiver.getAreaId()));
					//根据商品ID和收货地址查询商品
					Modulus modulus = goodsService.getModulus(getParamMap(), criteria);
					/*** 判断商品是否存在阶梯价，如果存在，重新计算商品的单价  TianYu  2015-12-17 17:11:02 Start***/
					//判断该商品启用了阶梯价，按照阶梯价计算 yuech
					Double price = goods.getPrice();

					if(1==goods.getEnableBatchPrice()){
						List<B2BGoodsPrice> batchPrice = cartItemService.getGoodsTradePrice(getParamMap(),item.getGoodsId(), item.getQuantity());
						if (batchPrice != null && batchPrice.size() > 0) {
							price = Double.parseDouble( batchPrice.get(batchPrice.size()-1).getBatchPrice() );
						}
					}else{
						item.setPrice( price!=null?price+"":"0.00");
					}

					/******添加会员价判断 TianYu  2016-05-19 10:12:15 Start****/
					if( "yes".equalsIgnoreCase( isMemberPrice ) ){
						price = StringUtil.numberHalfAdjust(price * (1 - goods.getDefaultPrice() / 100),2);
					}
					/******添加会员价判断 TianYu  2016-05-19 10:12:15 End****/

					item.setPrice( price!=null?price+"":"0.00");
					/*** 判断商品是否存在阶梯价，如果存在，重新计算商品的单价  TianYu  2015-12-17 17:11:02 end***/
					goodsTotal += (price * item.getQuantity());
					goodsTotalQuantity += item.getQuantity();
					//单个商品的运费 = 商品购买数量 X 商品价格 X 运费比例
					//供应商运费（订单运费） = 商品1的运费 + 商品2的运费 + … + 商品n的运费
					// 根据商品运费系数 计算配送费用

					double modul = modulus!=null? (modulus.getShipmentModulus()!=null?Double.parseDouble(modulus.getShipmentModulus()):0):0;

					item.setGoodsFeeModulus(price * item.getQuantity() * modul / 1000);//保存单个商品的配送费用
					deliveryFee += price * item.getQuantity() * modul / 1000;
				}

				//如果是微货通，调用微货通计算接口 TianYu 2016-05-11 17:19:15
				if ("WHT".equalsIgnoreCase( defaultDeliveryMethod.getSign() )){
					List<String> itemIds = new ArrayList<String>();
					for(CartItem item : cartItemList){
						itemIds.add(item.getId());
					}

					try {
						List<Map<String,Object>> items = this.cartItemService.getBuyGoodsByIds(getParamMap(), itemIds);
						deliveryFee = LogisticsUtil.logisticsTools(items, receiver.getAreaId());
					} catch (Exception e) {
						logger.error("微货通接口调用出现异常");
					}
				}else if("MERCHANT".equalsIgnoreCase( defaultDeliveryMethod.getSign() )){//商家配送，费用不做计算，以确认后的订单为准
					deliveryFee = 0d;
				}else if("自提".equals(defaultDeliveryMethod.getName())){
					deliveryFee = 0d;
				}

			}
		} catch (Exception e) {
			logger.error("计算配送费用时出异常", e);
		}

		map.put("goodsTotal", goodsTotal);
		map.put("goodsTotalQuantity", goodsTotalQuantity);
		map.put("deliveryFeeTotal", deliveryFee);
		map.put("shopTotal", goodsTotal + deliveryFee);
		return map;
	}
	/**
	 * 计算店铺中所有计算商品的
	 * 1、计算店铺商品总金额：goodsTotal
	 * 2、计算店铺总运费：deliveryFeeTotal
	 * 3、店铺合计：shopTotal
	 * 4、商品总数：goodsTotalQuantity
	 *
	 * @param receiver
	 * @param cartItemList     订单项列表
	 *
	 * @param isMemberPrice
	 * @return 最终的配送费用
	 */
	private Map<String,Object> calculateShopFee(Map<String, Object> paramMap, Receiver receiver, String deliveryMethodId, List<CartItem> cartItemList, String isMemberPrice) {
		Map<String,Object> map = new HashMap<String, Object>();
		double goodsTotal = 0.00;
		double deliveryFee = 0.00;
		int goodsTotalQuantity = 0;
		try {
			DeliveryMethod deliveryMethod = deliveryMethodService.get(getParamMap(), deliveryMethodId);

			if (cartItemList != null && cartItemList.size() > 0) {
				double goodsTotalWeight = 0.00; // 商品总重量
				for (CartItem item : cartItemList) {
					Goods goods = goodsService.get(getParamMap(), item.getGoodsId());

					/*** 判断商品是否存在阶梯价，如果存在，重新计算商品的单价  TianYu  2015-12-17 17:11:02 Start***/
					Double price = goods.getPrice();

					if(1==goods.getEnableBatchPrice()){//开启阶梯价
						List<B2BGoodsPrice> batchPrice = cartItemService.getGoodsTradePrice(getParamMap(),item.getGoodsId(), item.getQuantity());
						if (batchPrice != null && batchPrice.size() > 0) {
							price = Double.parseDouble( batchPrice.get(batchPrice.size()-1).getBatchPrice() );
						}
					}


					/******添加会员价判断 TianYu  2016-05-19 10:12:15 Start****/
					if( "yes".equalsIgnoreCase( isMemberPrice ) ){
						price = StringUtil.numberHalfAdjust(price * (1 - goods.getDefaultPrice() / 100),2);
					}
					/******添加会员价判断 TianYu  2016-05-19 10:12:15 End****/

					item.setPrice( price!=null?price+"":"0.00");
					/*** 判断商品是否存在阶梯价，如果存在，重新计算商品的单价  TianYu  2015-12-17 17:11:02 end***/

					goodsTotalWeight += goods.getWeight() * item.getQuantity();
					goodsTotal += (price * item.getQuantity());
					goodsTotalQuantity += item.getQuantity();
				}
				//如果是微货通，调用微货通计算接口 TianYu 2016-05-11 17:19:15
				if ("WHT".equalsIgnoreCase( deliveryMethod.getSign() )){
					List<String> itemIds = new ArrayList<String>();
					for(CartItem item : cartItemList){
						itemIds.add(item.getId());
					}

					try {
						List<Map<String,Object>> items = this.cartItemService.getBuyGoodsByIds(getParamMap(), itemIds);
						deliveryFee = LogisticsUtil.logisticsTools(items, receiver.getAreaId());
					} catch (Exception e) {
						logger.error("微货通接口调用出现异常");
					}
				}else if("MERCHANT".equalsIgnoreCase( deliveryMethod.getSign() )){
					deliveryFee = 0d;
				}else if("自提".equals(deliveryMethod.getName())){
					deliveryFee = 0d;
				}else {
				// 计算配送费用
					deliveryFee = countDeliveryFeeByWeight(goodsTotalWeight, deliveryMethod);
				}
			}
		} catch (Exception e) {
			logger.error("计算配送费用时出异常", e);
		}

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
			Buyer mb = getCurrentMember(request);
			BuyerRank mbr = buyerRankService.get(getParamMap(), mb.getRankId());
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
			}

			/** 处理APP扫码收货   根据id查询订单   hks 2016-3-14 14:40:41 Start **/
			String orderId = getParameter(request, "orderId");
			if(orderId != null && !"".equals(orderId)) {
				Order order = orderService.get(getParamMap(), orderId);
				model.addAttribute("huizongOrder",order);
			}
			/** 处理APP扫码收货   根据id查询订单   hks 2016-3-14 14:40:41 end **/

			//添加日期查询条件 TianYu 2015-9-30
			model.addAttribute("dateSelect", getListDateSelect(getParameter(request, "yearS"), getParameter(request, "yearE")));

			model.addAttribute("currStatus", getParameter(request, "status"));
			model.addAttribute("currYearS", getParameter(request, "yearS"));
			model.addAttribute("currYearE", getParameter(request, "yearE"));
			if(getParameter(request, "s")!=null) {
				model.addAttribute("s", URLDecoder.decode(getParameter(request, "s"), "utf-8"));
				model.addAttribute("sOld", getParameter(request, "s"));
			}
		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}
	}


	private void processOrderItem( List<Order> orderList, List<OrderItem> allOrderItemList) throws Exception {
		List<Order> removeOrderList = new ArrayList<Order>();
		Criteria criteria;
		for (Order order : orderList) {
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

	private Criteria processCriteria(Pager pager, Buyer mb, HttpServletRequest request) {
		Criteria criteria = new Criteria();
		//			List<Order.OrderStatus> orderStatusList = new ArrayList<Order.OrderStatus>();
			/*orderStatusList.add(Order.OrderStatus.deleted);
			orderStatusList.add(Order.OrderStatus.invalid);*/
		String status = getParameter(request, "status");
		String orderId = getParameter(request, "orderId");


		if (StringUtils.isNotBlank(status)) {
			criteria.add(Restrictions.eq("orderStatus", status));
		}
		//Begin  增加付款状态 2016-07-29  zhaojincheng
		String paymentStatus = getParameter(request, "paymentStatus");
		if (StringUtils.isNotBlank(paymentStatus)) {
			criteria.add(Restrictions.eq("paymentStatus", paymentStatus));
		}
		String shippingStatus = getParameter(request, "shippingStatus");
		if (StringUtils.isNotBlank(shippingStatus)) {
			criteria.add(Restrictions.eq("shippingStatus", shippingStatus));
		}
		//End

		String orderType = getParameter(request, "orderType_");
		if (StringUtils.isNotBlank(orderType)) {
			criteria.add(Restrictions.eq("a.orderType", orderType));
		}

		/* else {
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

		/** 处理APP扫码收货   查询条件   hks 2016-3-14 14:40:41 Start **/
		if(orderId != null && !"".equals(orderId)){
			//根据orderId 查询 订单 isOriginal  若为huizong 则查询其下子单集合   若为mingxiandhuizong 则直接显示
			try {
				Order order = orderService.get(getParamMap(), orderId);
				if("huizong".equals(order.getIsOriginal())){
					criteria.add(Restrictions.eq("a.parentSn", order.getOrderSn()));
				}else{
					criteria.add(Restrictions.eq("a.id", order.getId()));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			/** 前台只显示原始订单 TianYu  2016-3-14 14:40:41 Start */
			criteria.add(Restrictions.or(Restrictions.eq("a.isOriginal","yuanshi"),Restrictions.eq("a.isOriginal","mingxiandhuizong")));
			/** 前台只显示原始订单 TianYu  2016-3-14 14:40:41 End */
		}
		/** 处理APP扫码收货   查询条件   hks 2016-3-14 14:40:41 end **/

		String s = getParameter(request, "s");
		if (StringUtils.isNotBlank(s)) {
			try {
				s = URLDecoder.decode(s, "utf-8");
				s = "%"+s+"%";

				criteria.add(Restrictions.or(
						Restrictions.like("a.orderSn", s),
						Restrictions.or(
								Restrictions.like("g.name", s),
								Restrictions.or(
										Restrictions.like("g.fullName", s),
										Restrictions.or(
												Restrictions.like("g.barcode", s), Restrictions.like("g.packageBarCode", s))))));



			}catch (Exception e){
				e.printStackTrace();
			}
		}

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
            Buyer mb = getCurrentMember(request);
			BuyerRank mbr = buyerRankService.get(getParamMap(), mb.getRankId());
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
        map.put("wait_buyer_pay_deposit", "待付定金");
		if("ghj".equals(PropertiesUtil.getValue("project.properties","project.name"))){
        	map.put("wait_buyer_validate_goods", "等待验货");
		}
        map.put("trade_finished", "交易完成");
        map.put("cancel", "已取消");
        map.put("invalid", "已作废");
        /*map.put("deleted", "已删除");*/
        map.put("refunding", "退款中...");
        /*map.put("refund_part", "部分退款");
        map.put("refund_success", "全额退款");
        map.put("reship_part", "部分退货");*/
        /*map.put("reship_success", "已退货");*/
//		map.put("refund_success", "退款完成");
		/**暂时去掉退货完成状态 Auth:zhangqiang Time:2015-09-24 09:59:35 Start */
//		map.put("reship_success", "退货完成");
		/**暂时去掉退货完成状态 Auth:zhangqiang Time:2015-09-24 09:59:35 Start */

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
	 * @param paramMap		paramMap
	 * @param memberId
	 * @param orderSnList		订单编号集合
	 * @param model
	 * @return					已评论过的商品Id集合
	 * @throws Exception
	 */
    private List<String> processOrderItemToGoodsByOrderIds(Pager pager, Map<String,Object> paramMap, String memberId, List<String> orderSnList, Model model) throws Exception {
        List<String> reviewedGoodsIdList = new ArrayList<String>();
		Integer reviewed=0;
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.in("orderSn", orderSnList));
		criteria.add(Restrictions.order("createDate", "desc"));
		pager.setPageSize(6);
		pager = orderItemService.getPager(paramMap, criteria, pager);
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		if (pager.getList() != null && pager.getList().size() > 0) {
			for (OrderItem item : (List<OrderItem>) pager.getList()) {
				Goods goods = goodsService.get(paramMap, item.getGoodsId());
				/**
				 * Desc:BEC评论中包含采购单中的商品，此商品部在商品表中无法查询到。
				 * Auth:zhangqiang
				 * Time:2016-01-06
				 */
//				if (goods == null) continue;
				if (StringUtil.isNotEmpty(goods)) {
					List<GoodsImages> goodsImagesList = goodsImagesService.findList(paramMap, "goodsId", goods.getId());
					if (goodsImagesList != null && goodsImagesList.size() > 0) {
						item.setPic(goodsImagesList.get(0).getPic());
					}
				}
				if(item.getIsReview()==0) reviewed++;

                criteria = new Criteria();
                criteria.add(Restrictions.eq("orderSn", item.getOrderSn()));
                criteria.add(Restrictions.eq("buyerId", memberId));
                criteria.add(Restrictions.eq("goodsId", item.getGoodsId()));
                criteria.add(Restrictions.eq("isRead", "NO"));
                criteria.add(Restrictions.notEq("whichSys", "EC"));
                List<B2BGoodsReview> grs = goodsReviewService.getAllByCriteria(getParamMap(), criteria);
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
	 * 把订单项里对应的商品处理成商品列表
	 *
	 * @param pager
	 * @param paramMap		paramMap
	 * @param memberId
	 * @param orderSnList		订单编号集合
	 * @param model
	 * @return					已评论过的商品Id集合
	 * @throws Exception
	 */
	private Map<String,Object> ajaxProcessOrderItemToGoodsByOrderIds(Pager pager, Map<String,Object> paramMap, String memberId, List<String> orderSnList, Model model) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.in("orderSn", orderSnList));
		criteria.add(Restrictions.order("createDate", "desc"));
		pager.setPageSize(6);
		pager = orderItemService.getPager(paramMap, criteria, pager);
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		if (pager.getList() != null && pager.getList().size() > 0) {
			for (OrderItem item : (List<OrderItem>) pager.getList()) {
				Goods goods = goodsService.get(paramMap, item.getGoodsId());
				/**
				 * Desc:BEC评论中包含采购单中的商品，此商品部在商品表中无法查询到。
				 * Auth:zhangqiang
				 * Time:2016-01-06
				 */
				if (StringUtil.isNotEmpty(goods)) {
					List<GoodsImages> goodsImagesList = goodsImagesService.findList(paramMap, "goodsId", goods.getId());
					if (goodsImagesList != null && goodsImagesList.size() > 0) {
						item.setPic(goodsImagesList.get(0).getPic());
					}
				}
				criteria = new Criteria();
				criteria.add(Restrictions.eq("orderSn", item.getOrderSn()));
				criteria.add(Restrictions.eq("buyerId", memberId));
				criteria.add(Restrictions.eq("goodsId", item.getGoodsId()));
				criteria.add(Restrictions.eq("isRead", "NO"));
				criteria.add(Restrictions.notEq("whichSys", "EC"));
				List<B2BGoodsReview> grs = goodsReviewService.getAllByCriteria(getParamMap(), criteria);
				item.setUnreadReviewCount(grs == null ? 0 : grs.size());
				orderItemList.add(item);
			}
		}
		result.put("orderItemList",orderItemList);
		result.put("pager",pager);
		result.put("memberId",memberId);
		return result;
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
    private Double calculateGoodsDeliveryFee(Map<String,Object> paramMap, String deliveryMethodId, String _cartItemIds) {
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
                for (CartItem item : cartItemList) {
                    Goods goods = goodsService.get(paramMap, item.getGoodsId());
                    goodsTotalWeight += goods.getWeight() * item.getQuantity();
                }
                // 计算配送费用
                if (goodsTotalWeight <= deliveryMethod.getFirstWeight()) {
                    deliveryFee = deliveryMethod.getFirstPrice();
                } else {
                    double overWeight = goodsTotalWeight - deliveryMethod.getFirstWeight(); // 多出来的重量
                    int continueUnit = deliveryMethod.getContinueWeight() > 0 ? ((int) Math.round(overWeight / deliveryMethod.getContinueWeight())) : 0;// 有几个单位的续重
                    deliveryFee = deliveryMethod.getFirstPrice() + deliveryMethod.getContinuePrice() * continueUnit;
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
		String orderType = getParameter(request, "orderType_");
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		if( !"1".equals(orderType) ){
			orderType = "0";
		}
        String memberId = getCurrentMember(request).getId();
        try {
			//待付款
            Criteria c1 = new Criteria();
			//c1.add(Restrictions.eq("orderType", orderType));//统计所有订单，不区分是什么类型订单了
            c1.add(Restrictions.eq("memberId", memberId));
			c1.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_pay.toString()));
			c1.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.unpaid.toString()));
			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 Start */
			c1.add(Restrictions.or(Restrictions.eq("isOriginal","yuanshi"),Restrictions.eq("isOriginal","mingxiandhuizong")));
			//PC端统计普通订单
			if(!Global.WHICH_APP.equals(whichclient)) {
				c1.add(Restrictions.eq("orderType", orderType));
			}
			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 End */
            List<Order> orderFuKuanCountList = orderService.getList(getParamMap(), c1);
            model.addAttribute("orderFuKuanCount", orderFuKuanCountList != null ? orderFuKuanCountList.size() : 0); // 待付款

			//待发货
			Criteria c2 = new Criteria();
			//c2.add(Restrictions.eq("orderType", orderType));//统计所有订单，不区分是什么类型订单了
            c2.add(Restrictions.eq("memberId", memberId));
            c2.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_seller_send_goods.toString()));
//            c2.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
			c2.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.unshipped.toString()));
			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 Start */
			c2.add(Restrictions.or(Restrictions.eq("isOriginal","yuanshi"),Restrictions.eq("isOriginal","mingxiandhuizong")));

			//PC端统计普通订单
			if(!Global.WHICH_APP.equals(whichclient)) {
				c2.add(Restrictions.eq("orderType", orderType));
			}

			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 End */
            List<Order> orderFaHuoCountList = orderService.getList(getParamMap(), c2);
            model.addAttribute("orderFaHuoCount", orderFaHuoCountList != null ? orderFaHuoCountList.size() : 0); // 待发货

			//待到货
			Criteria c3 = new Criteria();
			//c3.add(Restrictions.eq("orderType", orderType));//统计所有订单，不区分是什么类型订单了
            c3.add(Restrictions.eq("memberId", memberId));
            c3.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_confirm_goods.toString()));
//            c3.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
            c3.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.shipped.toString()));
			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 Start */
			c3.add(Restrictions.or(Restrictions.eq("isOriginal","yuanshi"),Restrictions.eq("isOriginal","mingxiandhuizong")));
			//PC端统计普通订单
			if(!Global.WHICH_APP.equals(whichclient)) {
				c3.add(Restrictions.eq("orderType", orderType));
			}

			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 End */
            List<Order> orderConfirmCountList = orderService.getList(getParamMap(), c3);
            model.addAttribute("orderConfirmCount", orderConfirmCountList != null ? orderConfirmCountList.size() : 0); // 待确认收货

			//待验货
			Criteria c4 = new Criteria();
			//c4.add(Restrictions.eq("orderType", orderType));//统计所有订单，不区分是什么类型订单了
			c4.add(Restrictions.eq("memberId", memberId));
			c4.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_validate_goods.toString()));
            c4.add(Restrictions.eq("paymentStatus", Order.PaymentStatus.paid.toString()));
			c4.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.takeover.toString()));
			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 Start */
			c4.add(Restrictions.or(Restrictions.eq("isOriginal","yuanshi"),Restrictions.eq("isOriginal","mingxiandhuizong")));
			//PC端统计普通订单
			if(!Global.WHICH_APP.equals(whichclient)) {
				c4.add(Restrictions.eq("orderType", orderType));
			}

			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 End */
			List<Order> orderValidateCountList = orderService.getList(getParamMap(), c4);
			model.addAttribute("orderValidateCount", orderValidateCountList != null ? orderValidateCountList.size() : 0); // 待确认收货

			//已完成
			Criteria c5 = new Criteria();
			//c5.add(Restrictions.eq("orderType", orderType));//统计所有订单，不区分是什么类型订单了
			c5.add(Restrictions.eq("memberId", memberId));
			c5.add(Restrictions.eq("orderStatus", Order.OrderStatus.trade_finished.toString()));
			c5.add(Restrictions.eq("shippingStatus", Order.ShippingStatus.takeover.toString()));
			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 Start */
			c5.add(Restrictions.or(Restrictions.eq("isOriginal","yuanshi"),Restrictions.eq("isOriginal","mingxiandhuizong")));
			c5.add(Restrictions.eq("orderType", orderType));
			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 End */
			List<Order> orderOverCountList = orderService.getList(getParamMap(), c5);
			model.addAttribute("orderOverCount", orderOverCountList != null ? orderOverCountList.size() : 0); // 已完成

			//待支付定金
			Criteria c6 = new Criteria();
			//c5.add(Restrictions.eq("orderType", orderType));//统计所有订单，不区分是什么类型订单了
			c6.add(Restrictions.eq("memberId", memberId));
			c6.add(Restrictions.eq("orderStatus", Order.OrderStatus.wait_buyer_pay_deposit.toString()));
			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 Start */
			c6.add(Restrictions.or(Restrictions.eq("isOriginal","yuanshi"),Restrictions.eq("isOriginal","mingxiandhuizong")));
			c6.add(Restrictions.eq("orderType", orderType));
			/** 前台只显示原始订单 TianYu  2016-03-28 16:18:03 End */
			List<Order> orderFuDingJinList = orderService.getList(getParamMap(), c6);
			model.addAttribute("orderFuDingJin", orderFuDingJinList != null ? orderFuDingJinList.size() : 0); // 已完成
        } catch (Exception e) {
            logger.error("统计订单快捷页的便利提醒时出错:", e.getMessage());
        }
    }


	@RequestMapping(value = "/ajax/loadmore", method = {RequestMethod.POST})
	public
	@ResponseBody
	Object orderLoadMore(HttpServletRequest request) {
		String info = "Ajax加载更多的我的订单";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "操作成功");
		try {

			Buyer mb = getCurrentMember(request);

			Pager pager = new Pager();
			pager.setPageNumber(Integer.valueOf(request.getParameter("pageNumber")));
			pager.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
			pager.setOrderBy("a.createDate");
			pager.setOrderType("desc");
			Criteria criteria = processCriteria(pager, mb, request);
			pager = orderService.getPager(getParamMap(), criteria, pager);
			List pagerDataList = pager.getList();

			if (pagerDataList != null && pagerDataList.size() > 0) {
				List<Order> orderList = (List<Order>) pagerDataList;
				List<OrderItem> allOrderItemList = new ArrayList<OrderItem>();
				processOrderItem(orderList, allOrderItemList);
				result.put("orderList", orderList);
				result.put("orderItemList", allOrderItemList);
				result.put("pager", pager);
			}
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
	/**
	 * yuech
	 * 2016-03-01 15:23
	 * 弹出层，订单验货申诉
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "popupComplaint/{orderId}")
	public String popupComplaint(@PathVariable String orderId,Model model) {
		String info = "弹出层,申诉...";
		setLogInfo(info);
		model.addAttribute("orderId", orderId);
		logger.debug(info);
		return Global.TEMPLATE_MALL + PATH + "/member/order_complaint_popup";
	}
	/**
	 * * yuech
	 * 2016-03-01 14:23
	 * 验货申诉
	 * @param orderId
	 * @param request
	 * @return
	 */
	@RequestMapping("complaint/{orderId}/{reason}")
	@ResponseBody
	public Object complaint(@PathVariable String orderId,@PathVariable String reason, HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");
		try {
			Complaint complaint = new Complaint();
			complaint.setCreateDate(new Date());
			complaint.setCreateUser(getCurrentMember(request).getCreateUser());
			complaint.setTenantId(getTenantId());
			complaint.setComplaintUserName(getCurrentMember(request).getUserName());//用户名存的是  真是姓名
			complaint.setContent( URLDecoder.decode(reason,"utf-8"));
			complaint.setOrderSn(orderId);
			complaint.setComplaintUserMobile(getCurrentMember(request).getUserName());//用户名就是 手机号
			complaintService.save(getParamMap(), complaint);
		} catch (Exception e) {
			logger.error("订单申诉时，发生异常, orderId=" + orderId, e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "订单申诉时，发生异常");
		}
		return result;
	}
	/**
	 * yuech
	 * 2016-03-01 15:23
	 * 弹出层，订单验货申诉
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "lookComplaint/{orderId}")
	public String lookComplaint(@PathVariable String orderId,Model model) {
		String info = "弹出层,申诉...";
		setLogInfo(info);
		try {
			Complaint complaint = complaintService.get(getParamMap(), orderId);
			model.addAttribute("complaint", complaint);
		} catch (Exception e) {
			logger.error("根据订单编号查询申诉信息时，发生异常, orderId=" + orderId, e);
		}
		return Global.TEMPLATE_MALL + PATH + "/member/order_complaint_detail_popup";
	}

	/**
	 * chenbin
	 * 2016-03-08 17:23
	 * 查看申诉状态
	 * @param orderId
	 * @return
	 */
	@RequestMapping(value = "viewComplaint/{orderId}")

	@ResponseBody
	public Object viewComplaint(@PathVariable String orderId , HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");
		try {
			Complaint complaint = complaintService.get(getParamMap(), orderId);
			result.put("complaint", complaint);
		} catch (Exception e) {
			logger.error("根据订单编号查询申诉信息时，发生异常, orderId=" + orderId, e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "根据订单编号查询申诉信息时，发生异常");
		}
		return result;
	}


	/**
	 * chenbin
	 * 2016-05-05 17:23
	 * APP扫码查询订单
	 * @param orderId
	 * @return
	 */
	@RequestMapping(value = "viewByScanBarcode/{orderId}")
	public
	@ResponseBody
	Object viewByScanBarcode(@PathVariable String orderId , HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(STATUS, SUCCESS);
		result.put(MESSAGE, "");
		try {
            Buyer buyer = getCurrentMember(request);

			Order order = orderService.get(getParamMap(), orderId);
			if(order == null){
				order = orderService.find(getParamMap(),"orderSn",orderId);

			}
            if( order == null || !buyer.getId().equals(order.getMemberId())){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "订单不存在");
                return result;
            }

			orderId=order.getId();
            Order huizongOrder = null;
            List<Order> orderList = null;
            if( Order.IsOriginal.yuanshi.name().equals(order.getIsOriginal())){//原始单
                if( StringUtil.isNotEmpty(order.getParentSn())){
                    orderList = orderService.findList(getParamMap(), "parentSn", order.getParentSn());
                    huizongOrder = orderService.find(getParamMap(),"orderSn",order.getParentSn());

                }else{
                    orderList = new ArrayList<>();
                    Order temp = new Order();
                    MyBeanUtils.copyBean2Bean(temp, order);
                    orderList.add(temp);
					huizongOrder = order;
                }

            }else if (Order.IsOriginal.huizong.name().equals(order.getIsOriginal())){//汇总单
                orderList = orderService.findList(getParamMap(), "parentSn", order.getOrderSn());
                huizongOrder = new Order();
                MyBeanUtils.copyBean2Bean(huizongOrder, order);
            }else if (Order.IsOriginal.mingxiandhuizong.name().equals(order.getIsOriginal())){//既是汇总也是明细
				orderList = new ArrayList<>();
				Order temp = new Order();
				MyBeanUtils.copyBean2Bean(temp, order);
				orderList.add(temp);
				huizongOrder = order;
			}
            boolean allOrderArrived = true;
            for (Order o : orderList) {
                if( !Order.OrderStatus.wait_buyer_confirm_goods.equals(o.getOrderStatus())){
                    allOrderArrived = false;
                    break;
                }
            }


			List<OrderItem> allOrderItemList = new ArrayList<OrderItem>();
			processOrderItem(orderList, allOrderItemList);
            result.put("huizongOrder", huizongOrder);
			result.put("orderList", orderList);
            result.put("allOrderArrived", allOrderArrived);
			result.put("orderItemList", allOrderItemList);
			result.put("orderStatusMapping", getOrderStatusMapping());
		} catch (Exception e) {
			logger.error("APP扫码查询订单时，发生异常, orderId=" + orderId, e);
			result.put(STATUS, ERROR);
			result.put(MESSAGE, "APP扫码查询订单时，发生异常");
		}
		return result;
	}

	/**
	 * 新增方法
	 * 判断系统是否开启运费系数
	 * @Author TianYu
	 * @Date 2015-8-19
	 * @return
	 */
	private String calcFreightByModuls(){
		try {
			SystemSet s = systemSetService.find(getParamMap(), "setKey", "calcFreightByModuls");

			return s!=null?s.getSetvalue():"disEnabled";
		} catch (Exception e) {
			e.printStackTrace();
			return "disEnabled";
		}
	}



	/**
	 * 20160526 dzz
	 * 查询订单差异化信息列表集合
	 * @param pager
	 * @param model
	 * @param request
	 */
	@RequestMapping("orderAbnormal/{orderSn}")
	public String queryOrderAbnormal(Pager pager, Model model, HttpServletRequest request, @PathVariable String orderSn)  {
		String info = "我的订单-差异单页面";
		setLogInfo(info);

		List<Order> hasAbnormalItems = new ArrayList<Order>(0);//有差异化订单明细列表 wogo.getItemDiffTotal>0 and wogo.quantityAbnormal<wogo.ooldQuantity and wogo.quantityAbnormal>0
		List<Order> noAbnormalGoodsItems = new ArrayList<Order>(0);//无货订单明细列表	wogo.getItemDiffTotal>0 and wogo.quantityAbnormal=wogo.ooldQuantity
		List<Order> noAbnormalItems = new ArrayList<Order>(0);//无差异会订单列表	wogo.getItemDiffTotal=0

		Criteria hasAbnormalCriteria = new Criteria();
		Criteria noAbnormalGoodsCriteria = new Criteria();
		Criteria noAbnormalCriteria = new Criteria();

		hasAbnormalCriteria.add(Restrictions.eq("wogo.orderSn", orderSn));
		hasAbnormalCriteria.add(Restrictions.gt("wogo.getItemDiffTotal", "0"));
		hasAbnormalCriteria.add(Restrictions.notEq("wogo.newQuantity", 0));
		hasAbnormalCriteria.add(Restrictions.order("wogo.createDate", "desc"));

		noAbnormalGoodsCriteria.add(Restrictions.eq("wogo.orderSn", orderSn));
		noAbnormalGoodsCriteria.add(Restrictions.gt("wogo.getItemDiffTotal", "0"));
		noAbnormalGoodsCriteria.add(Restrictions.sql("wogo.quantityAbnormal=wogo.oldQuantity"));
		noAbnormalGoodsCriteria.add(Restrictions.order("wogo.createDate", "desc"));

		noAbnormalCriteria.add(Restrictions.eq("wogo.orderSn", orderSn));
		noAbnormalCriteria.add(Restrictions.or(Restrictions.eq("wogo.getItemDiffTotal", "0"), Restrictions.eq("wogo.quantityAbnormal", "0")));
		noAbnormalCriteria.add(Restrictions.order("wogo.createDate", "desc"));

		try {
			hasAbnormalItems = orderService.queryOrderGoodsAbnormal(getParamMap(), hasAbnormalCriteria);
			noAbnormalGoodsItems = orderService.queryOrderGoodsAbnormal(getParamMap(), noAbnormalGoodsCriteria);
			noAbnormalItems = orderService.queryOrderGoodsAbnormal(getParamMap(), noAbnormalCriteria);
		} catch (Exception e) {
			logger.error("访问" + info + "时，发生异常", e);
			e.printStackTrace();
		}

		model.addAttribute("hasAbnormalItems", hasAbnormalItems);
		model.addAttribute("noAbnormalGoodsItems", noAbnormalGoodsItems);
		model.addAttribute("noAbnormalItems", noAbnormalItems);
		model.addAttribute("pager", pager);
		model.addAttribute("orderSn", orderSn);
		return Global.TEMPLATE_MALL + PATH + "/member/order_list_abnormal";
	}


	private static String downloadExcelName = "order_abnormal_template.xlsx";
	private static String ExportExcelName = "orderAbnormal.xls";
	private static String[] TABLE_TITLE = {"商品名称","商品条码","差异数量"};
	private static String ExcelSheetName = "订单差异单";
	/**
	 * 20160527 dzz
	 * 导出订单差异单信息
	 * @param request
	 * @param response
	 * @param orderSn
	 */
	@RequestMapping(value = "exportOrderAbnormal/{orderSn}")
	public void exportOrderAbnormal(HttpServletRequest request, HttpServletResponse response, @PathVariable String orderSn) {

		String info = "我的订单-差异单导出";
		setLogInfo(info);

		List<Order> hasAbnormalItems = new ArrayList<Order>(0);//有差异化订单明细列表 wogo.getItemDiffTotal>0 and wogo.quantityAbnormal<wogo.ooldQuantity and wogo.quantityAbnormal>0
		List<Order> noAbnormalGoodsItems = new ArrayList<Order>(0);//无货订单明细列表	wogo.getItemDiffTotal>0 and wogo.quantityAbnormal=wogo.ooldQuantity

		Criteria hasAbnormalCriteria = new Criteria();
		Criteria noAbnormalGoodsCriteria = new Criteria();

		hasAbnormalCriteria.add(Restrictions.eq("wogo.orderSn", orderSn));
		hasAbnormalCriteria.add(Restrictions.gt("wogo.getItemDiffTotal", "0"));
		hasAbnormalCriteria.add(Restrictions.sql(" (wogo.quantityAbnormal!=wogo.oldQuantity) "));
		hasAbnormalCriteria.add(Restrictions.order("wogo.createDate", "desc"));

		noAbnormalGoodsCriteria.add(Restrictions.eq("wogo.orderSn", orderSn));
		noAbnormalGoodsCriteria.add(Restrictions.gt("wogo.getItemDiffTotal", "0"));
		noAbnormalGoodsCriteria.add(Restrictions.sql("wogo.quantityAbnormal=wogo.oldQuantity"));
		noAbnormalGoodsCriteria.add(Restrictions.order("wogo.createDate", "desc"));


		try {
			hasAbnormalItems = orderService.queryOrderGoodsAbnormal(getParamMap(), hasAbnormalCriteria);
			noAbnormalGoodsItems = orderService.queryOrderGoodsAbnormal(getParamMap(), noAbnormalGoodsCriteria);
			hasAbnormalItems.addAll( noAbnormalGoodsItems );
		} catch (Exception e) {
			logger.error("访问" + info + "时，发生异常", e);
			e.printStackTrace();
		}


		//执行 将数据在服务器上生成Excel文件
		ExportExcel.exportExcelNew(ExportExcelName, ExcelSheetName, TABLE_TITLE, hasAbnormalItems, request);
		//执行 导出Excel文件
		DownloadExcel.getFilePath(request, response, ExportExcelName);
	}




	/**
	 * 20160725 dzz
	 * 导出订单明细
	 * @param request
	 * @param response
	 * @param orderSn
	 */
	@RequestMapping(value = "exportOrderDetail/{orderSn}")
	public void exportOrderDetail(HttpServletRequest request, HttpServletResponse response, @PathVariable String orderSn) {
		String info = "我的订单-订单明细导出";
		setLogInfo(info);

		String downloadExcelName = "order_abnormal_template.xlsx";
		String OrderDetailExportExcelName = "order_"+orderSn+".xls";
		String[] ORDER_DETAIL_TABLE_TITLE = {"商品名称","商品条码","购买价格", "购买数量", "商品价格小计"};
		String OrderDetailExcelSheetName = "订单明细";

		List<Map<String, Object>> listObj = new ArrayList<Map<String, Object>>(0);
		Map<String, Object> resultMap = new HashMap<String, Object>();

		List orderItemList = new ArrayList(0);//此处暂不进行泛华处理
		try {
			Criteria oc = new Criteria();
			oc.add(Restrictions.eq("orderSn", orderSn));
			Order order = orderService.getList(getParamMap(), oc).get(0);
			MyBeanUtils.copyBean2Map(resultMap, order);
			listObj.add(resultMap);


			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("orderSn", orderSn));
			orderItemList = orderItemService.getExportList(getParamMap(), criteria);
//			MyBeanUtils.copyBean2Map();;
		} catch (Exception e) {
			logger.error("访问" + info + "时，发生异常", e);
			e.printStackTrace();
		}

		//执行 将数据在服务器上生成Excel文件
		ExportExcel.exportExcelComm(OrderDetailExportExcelName, OrderDetailExcelSheetName, ORDER_DETAIL_TABLE_TITLE, orderItemList, OrderItem.class, listObj, request);
		//执行 导出Excel文件
		DownloadExcel.getFilePath(request, response, OrderDetailExportExcelName);
	}

	@RequestMapping(value = "exportOrder2Word/{orderSn}")
	public void exprotOrder2Word(HttpServletRequest request, HttpServletResponse response, @PathVariable String orderSn){
		File file = null;
		InputStream fin = null;
		ServletOutputStream out = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();

			Order order = this.orderService.find(getParamMap(), "orderSn", orderSn);

			map.put( "orderSn", order.getOrderSn());
			map.put( "createOrderTime", DateUtil.dateToString(order.getCreateDate(), "yyyy-MM-dd HH:mm:ss"));
			map.put( "shipName", order.getShipName());
			map.put( "shipMobile", order.getShipMobile());
			map.put( "shipPhone", order.getShipPhone());
			map.put( "goodsTotalPrice", order.getGoodsTotalPrice());
			map.put( "discount", order.getDiscount());
			map.put( "insuranceFee", order.getInsuranceFee());
			map.put( "deliveryFee", order.getDeliveryFee());
			map.put( "totalAmount", order.getTotalAmount());

			Area area = this.areaService.get(getParamMap(), order.getShipAreaId());
			map.put( "shipAddress", (area!=null? area.getFullName() : "") + order.getShipAddress());


			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("orderSn", orderSn));
			List<OrderItem> orderItems = orderItemService.getExportList(getParamMap(), criteria);
			if( orderItems != null && orderItems.size() > 0 ){
				map.put("items" , orderItems );
			}

			// 调用工具类WordGenerator的createDoc方法生成Word文档

			file = WordUtil.createWord(request.getSession().getServletContext().getRealPath("/"), map, "order_2_word.ftl");
			fin = new FileInputStream(file);

			response.setCharacterEncoding("utf-8");
			response.setContentType("application/msword");
			// 设置浏览器以下载的方式处理该文件默认名为resume.doc
			response.addHeader("Content-Disposition", "attachment;filename=order_" + orderSn + ".doc");

			out = response.getOutputStream();
			byte[] buffer = new byte[512];// 缓冲区
			int bytesToRead = -1;
			// 通过循环将读入的Word文件的内容输出到浏览器中
			while((bytesToRead = fin.read(buffer)) != -1) {
				out.write(buffer, 0, bytesToRead);
			}
		}catch (Exception e){

		}finally {
			if(fin != null) {
				try {
					fin.close();
				}catch (Exception e) {
				}
			}
			if(out != null){
				try {
					out.close();
				}catch (Exception e) {
				}
			}

			if(file != null) file.delete();	// 删除临时文件
		}
	}

}
