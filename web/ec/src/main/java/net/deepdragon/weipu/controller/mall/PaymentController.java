package net.deepdragon.weipu.controller.mall;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayCore;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.allinpay.ets.client.*;
import com.allinpay.ets.client.StringUtil;
import com.google.common.base.Strings;
import com.unionpay.acp.UnionpayUtil;
import com.unionpay.acp.sdk.LogUtil;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.*;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.PropertiesUtil;
import net.deepdragon.weipu.tools.CrossBorderOrderEntity;
import net.deepdragon.weipu.tools.CrossborderUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 订单支付
 */
@Controller(Global.APP_SIGN + Global.MALL + "PaymentController")
@RequestMapping(Global.MALL_PATH + "/payment")
public class PaymentController extends BaseMallController {
	@Resource
	private GoodsService goodsService;
	@Resource
	private OrderService orderService;
	@Resource
	private CrossBorderOrderService crossBorderOrderService;
	@Resource
	private OrderItemService orderItemService;
	@Resource
	private CacheData cacheData;
	@Resource
	private SystemSetService systemSetService;
	@Resource
	private OrderPaylogService orderPaylogService;
	@Resource
	private MerchantService shopService;
	@Resource
	private SMSLogService smsLogService;

	private static Object lock = new Object();
	private static List<Map<String, Object>> payTypeAllList = new ArrayList<Map<String, Object>>();


	private static List<Map<String, Object>> payTypeList = new ArrayList<Map<String, Object>>();
	private static List<Map<String, Object>> payTypeListForHybridApp = new ArrayList<Map<String, Object>>();
	private static List<Map<String, Object>> payTypeListForWechat = new ArrayList<Map<String, Object>>();
	static {
		Map<String, Object> allinpay = new HashMap<String, Object>();
		allinpay.put("sign", "allinpay");
		allinpay.put("name", "通联支付");
		allinpay.put("logo", "allinpay.gif");


		Map<String, Object> chinaumspay = new HashMap<String, Object>();
		chinaumspay.put("sign", "chinaumspay");
		chinaumspay.put("name", "全民付");// 银联商务-全民付
		chinaumspay.put("logo", "chinaumspay.png");;

		Map<String, Object> alipay = new HashMap<String, Object>();
		alipay.put("sign", "alipay");
		alipay.put("name", "支付宝");
		alipay.put("logo", "alipay.gif");

		Map<String, Object> unionpay = new HashMap<String, Object>();
		unionpay.put("sign", "unionpay");
		unionpay.put("name", "银联在线支付");
		unionpay.put("logo", "unionpay.jpg");

		Map<String, Object> wxpay = new HashMap<String, Object>();
        wxpay.put("sign", "wxpay");
        wxpay.put("name", "微信支付");
        wxpay.put("logo", "wxpay.png");

		payTypeAllList.add(allinpay);
		payTypeAllList.add(chinaumspay);
		payTypeAllList.add(alipay);
		payTypeAllList.add(unionpay);
		payTypeAllList.add(wxpay);
		payTypeAllList.add(allinpay);
		String projectName = PropertiesUtil.getValue(Constant.PROJECTCONF,"project.name");
		switch (projectName){
			case "gwq":
				//pc
				payTypeList.add(unionpay);
				payTypeList.add(wxpay);
				//wx
				payTypeListForWechat.add(unionpay);
				payTypeListForWechat.add(wxpay);
				//app
				payTypeListForHybridApp.add(unionpay);
				payTypeListForHybridApp.add(wxpay);
				break;
			case "jp":
				//pc
				payTypeList.add(unionpay);
				payTypeList.add(alipay);
				payTypeList.add(wxpay);
				//wx
				payTypeListForWechat.add(unionpay);
				payTypeListForWechat.add(wxpay);
				//app
				payTypeListForHybridApp.add(unionpay);
				payTypeListForHybridApp.add(wxpay);
				payTypeListForHybridApp.add(alipay);
				break;
			case "xd":
				//pc
				payTypeList.add(unionpay);
				payTypeList.add(alipay);
				payTypeList.add(wxpay);
				//wx
				payTypeListForWechat.add(unionpay);
				payTypeListForWechat.add(alipay);
				payTypeListForWechat.add(wxpay);
				//app
				payTypeListForHybridApp.add(unionpay);
				payTypeListForHybridApp.add(alipay);
				break;
			case "gdnz":
				//pc
				payTypeList.add(unionpay);
				payTypeList.add(wxpay);
				payTypeList.add(alipay);
				//wx
				payTypeListForWechat.add(unionpay);
				payTypeListForWechat.add(wxpay);
				//app
				payTypeListForHybridApp.add(unionpay);
				break;
			case "tzrh":
				//pc
				payTypeList.add(wxpay);
				//wx
				payTypeListForWechat.add(wxpay);
				//app
				payTypeListForHybridApp.add(wxpay);
				break;
			default:
				//pc
				payTypeList.add(unionpay);
				//wx
				payTypeListForWechat.add(unionpay);
				//app
				payTypeListForHybridApp.add(unionpay);
				break;
		}



	}

	@RequestMapping(value = "")
	public String list(String orderSn, @RequestParam(value = "key") String id,
					   String total, Model model, HttpServletRequest request) {
		String info = "订单[" + orderSn + "]支付，选择支持的在线支付平台";
		setLogInfo(info);
		logger.debug(info);

		/*
		 try {
			Order order = orderService.find(getParamMap(), "orderSn", orderSn);

			logger.info("订单信息order:" + order);

			model.addAttribute("order", order);
			// 此处建议对id,total等数据进行校验

		} catch (Exception e) {
			logger.error(info + "前，核对订单信息时，发生异常", e);
			e.printStackTrace();
		}

		model.addAttribute("orderSn", orderSn);
		*/
		try {

			List<String> cartItemIds = null;
			if (StringUtils.isNotBlank(id)) {
				cartItemIds = Arrays.asList(id.split(","));
			}
			List<Order> orders = orderService.findListByIds(getParamMap(), cartItemIds);

			/** 添加订单状态校验 TianYu 2015-9-23 Strat */
			boolean flag = false;
			if( orders != null && orders.size() > 0 ){
				for(Order order : orders){
					if( !Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus()) ){
						flag = true;
						break;
					}
				}
			}

			if(flag){
				return "redirect:/order/list";
			}
			/** 添加订单状态校验 TianYu 2015-9-23 End */

			logger.info("订单信息order:" + orders);

			model.addAttribute("orders", orders);
			// 此处建议对id,total等数据进行校验

		} catch (Exception e) {
			logger.error(info + "前，核对订单信息时，发生异常", e);
			e.printStackTrace();
		}

		model.addAttribute("orderSn", orderSn);
		model.addAttribute("total", total);
		if(Global.HYBRIDAPP.equals(request.getParameter(Global.WHICHCLIENT))) {
			model.addAttribute("payTypeList", payTypeListForHybridApp);
		}else if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
			model.addAttribute("payTypeList", payTypeListForWechat);
		}else{
			Member member = getCurrentMember(request);
			if (CrossborderUtil.isCrossborderMember(member)) {
				List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				Map<String, Object> allinpay = new HashMap<String, Object>();
				allinpay.put("sign", "allinpay");
				allinpay.put("name", "通联支付");
				allinpay.put("logo", "allinpay.gif");
				list.add(allinpay);
				model.addAttribute("payTypeList", list);
			} else {
				model.addAttribute("payTypeList", payTypeList);
			}
		}

		getAllCatelog(model);// 首页类目展示
		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)) {
			return Global.TEMPLATE_APP + PATH + "/pay";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/payment_list";
		}
	}

	/**
	 * 在线支付点击“下一步”后调用方法
	 * 进入支付页面
	 * @param orderSn
	 * @param payType
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "show")
	public String show(String orderSn, String payType, Model model, HttpServletRequest request) {
		String info = "订单[" + orderSn + "]支付，暂不保存用户的选择，进入确认支付页面，展示用户的选择";
		setLogInfo(info);
		logger.debug(info);

		try {
			if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))) {
				Order order = orderService.find(getParamMap(), "orderSn", orderSn);
				model.addAttribute("order", order);
			}
			List<String> orderSns = null;
			if (StringUtils.isNotBlank(orderSn)) {
				orderSns = Arrays.asList(orderSn.split(","));
			}
			List<Order> orders = orderService.findListByOrderSns(getParamMap(), orderSns);
			model.addAttribute("orders", orders);

			if( !Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT)) && orders != null && orders.size() > 0 && !Order.OrderStatus.wait_buyer_pay.equals(orders.get(0).getOrderStatus()) ){
				return "redirect:/order/view/" + orders.get(0).getId() + ".html";
			}

			StringBuilder ids = new StringBuilder();
			double total = 0.00;
			int i = 0;
			for(Order order : orders){
				if(i > 0){
					ids.append(",");
				}
				i++;
				ids.append(order.getId());
				total += order.getTotalAmount();
			}

			model.addAttribute("orderIds", ids);
			model.addAttribute("total", total);

		} catch (Exception e) {
			logger.error(info + "前，核对订单信息时，发生异常", e);
			e.printStackTrace();
		}

		Map<String, Object> payTypeMap = null;
		for (Map<String, Object> tempPayTypeMap : payTypeAllList) {
			if (StringUtils.equalsIgnoreCase(payType, tempPayTypeMap.get("sign").toString())) {
				payTypeMap = tempPayTypeMap;
			}
		}

		model.addAttribute("orderSn", orderSn);
		model.addAttribute("payType", payTypeMap);

		getAllCatelog(model);// 首页类目展示
		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(type)){
			if("unionpay".equals(payType)){
				return Global.TEMPLATE_APP + PATH + "/payment_show_unionpay";
			}
			if("wxpay".equals(payType)){
				return Global.TEMPLATE_APP + PATH + "/payment_show_wxpay";
			}
			return Global.TEMPLATE_APP + PATH + "/payment_show";
		}else if("wxpay".equals(payType)){
			return Global.TEMPLATE_MALL + PATH + "/member/payment_show_wxpay";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/payment_show";
		}

	}

	@RequestMapping(value = "confirm")
	public String confirm(String orderSn, String payType, Model model, HttpServletRequest request, HttpServletResponse response) {
		String info = "订单[" + orderSn + "]支付，保存订单选择的在线支付方式，根据不同的方式组织参数跳转到不同的网关";
		setLogInfo(info);
		logger.debug(info);
//		Order order = null;
		List<Order> orders = null;
		try {
			List<String> orderSns = null;
			if (StringUtils.isNotBlank(orderSn)) {
				orderSns = Arrays.asList(orderSn.split(","));
			}
			orders = orderService.findListByOrderSns(getParamMap(), orderSns);

//			order=orderService.find(tenantId, "orderSn", orderSn);
			for(Order order : orders) {

				if( !Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT)) && orders != null && orders.size() > 0 && !Order.OrderStatus.wait_buyer_pay.equals(orders.get(0).getOrderStatus()) ){
					return "redirect:/order/view/" + orders.get(0).getId() + ".html";
				}

				Order updateObj = new Order();
				updateObj.setId(order.getId());
				updateObj.setPayType(payType);
				updateObj.setModifyUser(getCurrentMember(request).getUserName());
				updateObj.setModifyDate(new Date());
				orderService.update(getParamMap(), updateObj);

				Member member = getCurrentMember(request);
				OrderItem orderItem = null;
				List<OrderItem> orderItemList = orderItemService.findList(getParamMap(), "orderSn", order.getOrderSn());
				if (orderItemList != null && orderItemList.size() > 0) {
					orderItem = orderItemList.get(0);
				}

				if (StringUtils.equalsIgnoreCase("allinpay", payType)) {
					logger.error("allinpay  通联支付");

					/**----------- 支付时先保存支付日志，再跳转支付 TianYu 2016-04-25 09:54:28 Start ---------------------**/
					savePaylog(member,order, "allinpay", "通联支付" );
					/**----------- 支付时先保存支付日志，再跳转支付 TianYu 2016-04-25 09:54:28 End ---------------------**/

					getPayData4allinpay(order, member, orderItem, model);

				} else if (StringUtils.equalsIgnoreCase("chinaumspay", payType)) {
					logger.error("chinaumspay  全民付");
					/**----------- 支付时先保存支付日志，再跳转支付 TianYu 2016-04-25 09:54:28 Start ---------------------**/
					savePaylog(member,order, "chinaumspay", "全民付" );
					/**----------- 支付时先保存支付日志，再跳转支付 TianYu 2016-04-25 09:54:28 End ---------------------**/
					getPayData4chinaumspay(order, member, orderItem, model);

				} else if (StringUtils.equalsIgnoreCase("alipay", payType)) {
					logger.error("alipay  支付宝");
					/**----------- 支付时先保存支付日志，再跳转支付 TianYu 2016-04-25 09:54:28 Start ---------------------**/
					savePaylog(member,order, "alipay", "支付宝" );
					/**----------- 支付时先保存支付日志，再跳转支付 TianYu 2016-04-25 09:54:28 End ---------------------**/
					getPayData4alipay(order, member, orderItem, model,request,response);

				} else if (StringUtils.equalsIgnoreCase("unionpay", payType)) {
					logger.error("unionpay  银联支付");
					String type = request.getParameter(Global.WHICHCLIENT);
					if(Global.WHICH_APP.equals(type)){
						model.addAttribute(Global.WHICHCLIENT, Global.WHICH_APP);
					}

					/**----------- 支付时先保存支付日志，再跳转支付 TianYu 2016-04-25 09:54:28 Start ---------------------**/
					savePaylog(member,order, "unionpay", "银联支付" );
					/**----------- 支付时先保存支付日志，再跳转支付 TianYu 2016-04-25 09:54:28 End ---------------------**/

					getPayData4unionpay(order, member, orderItem, model);

				} else {
					payType = "type_error";
					logger.error("系统不支持所选支付类型[" + payType + "]");
				}

				//更新订单状态
//				updateOrderStatusAndRedirect(order.getOrderSn(), request, response);
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))
				&& StringUtils.equalsIgnoreCase("unionpay", payType)){
			return Global.TEMPLATE_APP + PATH + "/payment_" + payType;
		}
		return Global.TEMPLATE_MALL + PATH + "/member/payment_" + payType;



		/**屏蔽在线支付问题  暂时不通过支付方式，直接就默认支付成功  xsy 2015-05-26 11:54:10    begin---------------------**/


//		String redirectURL = "";//"redirect:/order/view/" + order.getId() + ".html";
//		if (orders == null || orders.isEmpty() ) {
//			redirectURL = "redirect:/order/error/" + orderSn;
//		}else if( orders.size() == 1 ){
//			redirectURL = "redirect:/order/view/" + orders.get(0).getId() + ".html";
//		}else{
//			redirectURL = "redirect:/order/list";
//		}
//		return redirectURL;

		/***屏蔽在线支付问题  暂时不通过支付方式，直接就默认支付成功  xsy 2015-05-26 11:54:10    end---------------------  **/

	}

	/**
	 * 保存支付日志
	 * @param member
	 * @param order
	 * @param payType
	 * @param payTypeName
	 * @return
     * @throws Exception
     */
	private void savePaylog( Member member, Order order,String payType,String payTypeName) throws Exception{
		/**----------- 支付时先保存支付日志，再跳转支付 TianYu 2016-04-25 09:54:28 Start ---------------------**/
		OrderPaylog paylog = new OrderPaylog();
		paylog.setTenantId(getTenantId());
		paylog.setMemberId(member.getId());
		paylog.setOrderSn(order.getOrderSn());
		paylog.setSign(payType);
		paylog.setName(payType);
		paylog.setAmount(order.getTotalAmount());
		paylog.setPayDate(DateUtils.getCurrDatetime());
		paylog.setStatus("false");
		paylog.setInfo(payTypeName+"支付");
		paylog.setCreateUser(member.getUserName());
		paylog.setCreateDate(new Date());

		//保存之前先删除其它的支付记录
		List<OrderPaylog> paylogs = this.orderPaylogService.findList(getParamMap(), "orderSn", order.getOrderSn());
		if( paylogs != null && paylogs.size() > 0 ){
			for(OrderPaylog orderPaylog : paylogs){
				orderPaylog.setIsDetele("Y");
				orderPaylog.setModifyUser( member.getUserName() );

				this.orderPaylogService.update(getParamMap(), orderPaylog);
			}
		}



		this.orderPaylogService.save(getParamMap(), paylog);
		/**----------- 支付时先保存支付日志，再跳转支付 TianYu 2016-04-25 09:54:28 End ---------------------**/
	}

	/**
	 * 弹出层,等待支付
	 */
	@RequestMapping(value = "popupconfirm")
	public String popupConfirm(Model model) {
		String info = "弹出层,等待支付完成...";
		setLogInfo(info);
		model.addAttribute("1", "1");
		logger.debug(info);
		return Global.TEMPLATE_MALL + PATH + "/member/payment_confirm_popup";
	}

	@RequestMapping(value = "allinpayQuery")
	public String query(String orderSn, Model model) {
		String info = "订单[" + orderSn + "]查询";
		setLogInfo(info);
		logger.debug(info);
		try {
			Order order = orderService.find(getParamMap(), "orderSn", orderSn);

			Map map  = PropertiesUtil.getAll("allinpay.properties");
			String serverUrl = (String)map.get("gateway");
			String merchantId = (String)map.get("merchantId");
			String version = "v1.5";
			int signType = 1;
			String orderDatetime = DateUtils.format(order.getCreateDate(), DateUtils.DATETIME_FORMAT);
			String queryDatetime = DateUtils.getCurrDatetime();

			// 组装签名字符串
			StringBuffer bufSignSrc = new StringBuffer();
			StringUtil.appendSignPara(bufSignSrc, "merchantId", merchantId);
			StringUtil.appendSignPara(bufSignSrc, "version", version);
			StringUtil.appendSignPara(bufSignSrc, "signType", signType + "");
			StringUtil.appendSignPara(bufSignSrc, "orderNo", orderSn);
			StringUtil.appendSignPara(bufSignSrc, "orderDatetime", orderDatetime);
			StringUtil.appendSignPara(bufSignSrc, "queryDatetime", queryDatetime);
			StringUtil.appendLastSignPara(bufSignSrc, "key", "1234567890");
			String signMsg = SecurityUtil.MD5Encode(bufSignSrc.toString());

			model.addAttribute("serverUrl", serverUrl);
			model.addAttribute("merchantId", merchantId);
			model.addAttribute("version", version);
			model.addAttribute("signType", signType);
			model.addAttribute("orderNo", orderSn);
			model.addAttribute("orderDatetime", orderDatetime);
			model.addAttribute("queryDatetime", queryDatetime);
			model.addAttribute("signMsg", signMsg);
			model.addAttribute("key", 1234567890);
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		return "redirect:allinpayOrderQuery.jsp";
	}

	/**
	 * 通联支付 支付成功之后-->后台通知处理，异步通知
	 */
	@RequestMapping("receive")
	@ResponseBody
	public String receive(HttpServletRequest request, HttpServletResponse response) {
		String info = "通联支付，支付成功之后。异步通知，处理支付网管返回的支付结果";
		setLogInfo(info);
		logger.error(info);

		boolean paySuccess = false;
		try {
			// 异步通知，接收通联网管返回的支付结果
			String merchantId = request.getParameter("merchantId");
			String version = request.getParameter("version");
			String language = request.getParameter("language");
			String signType = request.getParameter("signType");
			String payType = request.getParameter("payType");
			String issuerId = request.getParameter("issuerId");
			String paymentOrderId = request.getParameter("paymentOrderId");
			String orderNo = request.getParameter("orderNo");
			String orderDatetime = request.getParameter("orderDatetime");
			String orderAmount = request.getParameter("orderAmount");
			String payDatetime = request.getParameter("payDatetime");
			String payAmount = request.getParameter("payAmount");
			String ext1 = request.getParameter("ext1");
			String ext2 = request.getParameter("ext2");
			String payResult = request.getParameter("payResult");
			String errorCode = request.getParameter("errorCode");
			String returnDatetime = request.getParameter("returnDatetime");
			String signMsg = request.getParameter("signMsg");

			System.out.println("===================================");
			// 验签是商户为了验证接收到的报文数据确实是支付网关发送的。
			// 构造订单结果对象，验证签名。
			com.allinpay.ets.client.PaymentResult paymentResult = new com.allinpay.ets.client.PaymentResult();
			paymentResult.setMerchantId(merchantId);
			paymentResult.setVersion(version);
			paymentResult.setLanguage(language);
			paymentResult.setSignType(signType);
			paymentResult.setPayType(payType);
			paymentResult.setIssuerId(issuerId);
			paymentResult.setPaymentOrderId(paymentOrderId);
			paymentResult.setOrderNo(orderNo);
			paymentResult.setOrderDatetime(orderDatetime);
			paymentResult.setOrderAmount(orderAmount);
			paymentResult.setPayDatetime(payDatetime);
			paymentResult.setPayAmount(payAmount);
			paymentResult.setExt1(ext1);
			paymentResult.setExt2(ext2);
			paymentResult.setPayResult(payResult);
			paymentResult.setErrorCode(errorCode);
			paymentResult.setReturnDatetime(returnDatetime);
			// signMsg为服务器端返回的签名值。
			paymentResult.setSignMsg(signMsg);
			paymentResult.setKey("1234567890");
			// signType为"1"时，必须设置证书路径。
			//paymentResult.setCertPath(request.getServletContext().getRealPath("WEB-INF/cert/TLCert-test.cer"));

			// 验证签名：返回true代表验签成功；否则验签失败。
			boolean verifyResult = paymentResult.verify();

			logger.error(info + "  验证签名:" + verifyResult);

			// 验签成功，还需要判断订单状态，为"1"表示支付成功。
			paySuccess = verifyResult && payResult.equals("1");
			if (paySuccess) {
				// 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
				// 配送状态：unshipped）

				if (updateOrderStatusAndRedirect(orderNo, request, response) != null && CrossborderUtil.CROSSBORDER_FLAGS.equals(request.getParameter("ext1"))) {
					Order order = orderService.find(getParamMap(), "orderSn", orderNo);
					//组装订单支付记录
					OrderPaylog paylog = new OrderPaylog();
					paylog.setTenantId(order.getTenantId());
					paylog.setMemberId(order.getMemberId());
					paylog.setOrderSn(orderNo);
					paylog.setSign(OrderPaylog.KJ_PAY);
					paylog.setName("通联支付");
					paylog.setUniqueno(paymentOrderId);
					paylog.setAmount(Double.valueOf(payAmount) / 100.0);
					paylog.setPayDate(payDatetime);//yyyyMMddHHmmss
					paylog.setStatus("true");
					paylog.setInfo("支付成功");
					paylog.setCreateUser("system");
					paylog.setCreateDate(new Date());
					//保存订单支付记录
					this.orderPaylogService.save(getParamMap(), paylog);
					setLogInfo("订单【" + orderNo + "】支付成功");
					logger.error("订单【" + orderNo + "】支付成功");
					prepare4CustomOrder(order);

					//给商家发短信 Liu xiao bing 2016-04-27 08:43:46
					sendSMS(order.getOrderSn(), order.getShopId());
				}
			}
		} catch (Exception e) {
			paySuccess = false;
			System.out.println(e);
			logger.error(info + "时，发生异常", e);
		}

		return ajaxText("" + paySuccess, response);
	}

	/**
	 * 通联支付 - 同步通知
	 */
	@RequestMapping("allinpayPickup")
	public String allinpayPickup(HttpServletRequest request, HttpServletResponse response) {
		String info = "通联支付，支付成功之后。同步通知(页面跳转)，处理支付网管返回的支付结果，订单号[" + request.getParameter("orderNo") + "]";
		setLogInfo(info);
		logger.error(info);

		boolean paySuccess = false;
		String orderId = null;
		String orderSn = null;
		Order order = null;
		try {

			String merchantId = request.getParameter("merchantId");
			String version = request.getParameter("version");
			String language = request.getParameter("language");
			String signType = request.getParameter("signType");
			String payType = request.getParameter("payType");
			String issuerId = request.getParameter("issuerId");
			String paymentOrderId = request.getParameter("paymentOrderId");
			String orderNo = request.getParameter("orderNo");
			String orderDatetime = request.getParameter("orderDatetime");
			String orderAmount = request.getParameter("orderAmount");
			String payDatetime = request.getParameter("payDatetime");
			String payAmount = request.getParameter("payAmount");
			String ext1 = request.getParameter("ext1");
			String ext2 = request.getParameter("ext2");
			String payResult = request.getParameter("payResult");
			String errorCode = request.getParameter("errorCode");
			String returnDatetime = request.getParameter("returnDatetime");
			String signMsg = request.getParameter("signMsg");

			// 验签是商户为了验证接收到的报文数据确实是支付网关发送的。
			// 构造订单结果对象，验证签名。
			com.allinpay.ets.client.PaymentResult paymentResult = new com.allinpay.ets.client.PaymentResult();
			paymentResult.setMerchantId(merchantId);
			paymentResult.setVersion(version);
			paymentResult.setLanguage(language);
			paymentResult.setSignType(signType);
			paymentResult.setPayType(payType);
			paymentResult.setIssuerId(issuerId);
			paymentResult.setPaymentOrderId(paymentOrderId);
			paymentResult.setOrderNo(orderNo);
			paymentResult.setOrderDatetime(orderDatetime);
			paymentResult.setOrderAmount(orderAmount);
			paymentResult.setPayDatetime(payDatetime);
			paymentResult.setPayAmount(payAmount);
			paymentResult.setExt1(ext1);
			paymentResult.setExt2(ext2);
			paymentResult.setPayResult(payResult);
			paymentResult.setErrorCode(errorCode);
			paymentResult.setReturnDatetime(returnDatetime);

			// signMsg为服务器端返回的签名值。
			paymentResult.setSignMsg(signMsg);
			paymentResult.setKey("1234567890");
			// signType为"1"时，必须设置证书路径。
			//paymentResult.setCertPath(request.getServletContext().getRealPath("WEB-INF/cert/TLCert-test.cer"));

			// 验证签名：返回true代表验签成功；否则验签失败。
			boolean verifyResult = paymentResult.verify();

			// 验签成功，还需要判断订单状态，为"1"表示支付成功。
			paySuccess = verifyResult && payResult.equals("1");

			orderSn = orderNo;
			order = orderService.find(getParamMap(), "orderSn", orderNo);
			logger.error("orderSn:" + orderSn + ",order:" + order);
			if (order != null) {
				orderId = order.getId();
			}
			if (paySuccess && order != null) {
				//通联支付跨境商品处理跨境商品处理.
				if (updateOrderStatusAndRedirect(orderNo, request, response) != null && CrossborderUtil.CROSSBORDER_FLAGS.equals(request.getParameter("ext1"))) {
					prepare4CustomOrder(order);
					//组装订单支付记录
					OrderPaylog paylog = new OrderPaylog();
					paylog.setTenantId(order.getTenantId());
					paylog.setMemberId(order.getMemberId());
					paylog.setOrderSn(orderNo);
					paylog.setSign(OrderPaylog.KJ_PAY);
					paylog.setName("通联支付");
					paylog.setUniqueno(paymentOrderId);
					paylog.setAmount(Double.valueOf(payAmount) / 100.0);
					paylog.setPayDate(payDatetime);//yyyyMMddHHmmss
					paylog.setStatus("true");
					paylog.setInfo("支付成功");
					paylog.setCreateUser("system");
					paylog.setCreateDate(new Date());
					//保存订单支付记录
					this.orderPaylogService.save(getParamMap(), paylog);
					setLogInfo("订单【" + orderNo + "】支付成功");
					logger.error("订单【" + orderNo + "】支付成功");
					//给商家发短信 Liu xiao bing 2016-04-27 08:43:46
					sendSMS(order.getOrderSn(), order.getShopId());

				}
			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		String redirectURL = "redirect:/order/view/" + orderId + ".html";
		if (StringUtils.isEmpty(orderId)) {
			redirectURL = "redirect:/order/error/" + orderSn;
		}
		return redirectURL;
	}

	/**
	 * 更新订单状态并重定向到订单详细页
	 */
	private Order updateOrderStatusAndRedirect(String orderNo, HttpServletRequest request, HttpServletResponse response) {
		Order order = null;
		Order newOrder = null;
		try {
			// 1、先查看该订单状态是否已经更新成了wait_seller_send_goods; 支付状态：paid;
			// 配送状态：unshipped
			order = orderService.find(getParamMap(), "orderSn", orderNo);
			if (order != null && !order.getOrderStatus().equals(Order.OrderStatus.wait_seller_send_goods) && order.getOrderStatus().equals(Order.OrderStatus.wait_buyer_pay) && !order.getPaymentStatus().equals(Order.PaymentStatus.paid) && order.getPaymentStatus().equals(Order.PaymentStatus.unpaid)) {
				// 更新订单各种状态（订单状态：wait_seller_send_goods; 支付状态：paid;
				// 配送状态：unshipped）
				newOrder = orderService.orderPaidSuccess(getParamMap(), orderNo);
			}
		} catch (Exception e) {
			logger.error("更新订单:" + orderNo + "失败!");
		}

		return newOrder;
	}

	@RequestMapping("isCrossborderMember")
	@ResponseBody
	public Object isCrossborderMember(HttpServletRequest request, HttpServletResponse response)  throws  Exception{
		//prepare4CustomOrder( orderService.find(getParamMap(), "orderSn", "6032352796972174"));
		Map map = new HashMap();
		map.put("isCrossborderMember", CrossborderUtil.isCrossborderMember(getCurrentMember(request)));
		map.put("success",true);
		return map;
	}

	public int updateCustomOrder(Map map) throws Exception{
		map.put(Constant.TENANTID_KEY, getTenantId());
		return crossBorderOrderService.updateCrossBorderOrderStatus(map);
	}

	//生成xml海关提交用
	private void prepare4CustomOrder(Order order) throws  Exception{
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
		List orderItemList = orderItemService.getCrossBorderItemList(getParamMap(), criteria);
		if (orderItemList.size() > 0) {
			criteria = new Criteria();
			criteria.add(Restrictions.eq("o.orderSn", order.getOrderSn()));
			CrossBorderOrderEntity oe = new CrossBorderOrderEntity(crossBorderOrderService.getCrossBorderOrderMap(getParamMap(), criteria), orderItemList);
			Map map = new HashMap();
			map.put("tenantId", order.getTenantId());
			map.put("orderSn", order.getOrderSn());
			map.put("status", "-1");
			map.put("id",new IdWorker(0, 0, 0).getId());
			crossBorderOrderService.saveCrossBorderOrder(getParamMap(),map);
			//输出到指定文件
			oe.writeXML();
			//开启定时任务。
			CustomsResponseTimer.startJob();
		}
	}

	private void processOrderItemGoods(List<Goods> goodsList, Map<String,Object> paramMap, List<OrderItem> orderItemList) throws Exception {

	}
	/**
	 * 银联支付
	 *
	 * @param order
	 *            订单信息
	 * @param member
	 *            会员信息
	 * @param orderItem
	 *            商品清单(只取了订单中的第一个商品)
	 * @param model
	 *
	 *            注：测试商户号: 777290058118694 测试MD5 key: 1234567890
	 *            <p/>
	 *            商户可以到测试商户服务平台查询交易: 访问地址:
	 *            https://101.231.204.80:5000/gateway/api/frontTransReq.do
	 *            商户号:
	 *            777290058118694 操作员ID: admin 密码: 1111111!
	 *            <p/>
	 * @throws Exception
	 */
	private void getPayData4unionpay(Order order, Member member, OrderItem orderItem, Model model) throws Exception {
		String shopUrl = getShopUrl();

		String frontUrl = shopUrl + "payment/unionpayFront";// 页面通知地址
		String backUrl = shopUrl + "payment/unionpayBack";// 后台通知地址
		if(Global.WHICH_APP.equals(model.asMap().get(Global.WHICHCLIENT))){
			frontUrl += "?whichclient=whichapp";// 页面通知地址
			backUrl += "?whichclient=whichapp";// 页面通知地址
		}
		// 构造订单请求对象，生成signMsg。
		/*com.unionpay.acp.RequestOrder requestOrder = new com.unionpay.acp.RequestOrder();
		requestOrder.setFrontUrl(frontUrl);
		requestOrder.setBackUrl(backUrl);
		requestOrder.setOrderId(order.getOrderSn());
		requestOrder.setTxnAmt( Math.round(order.getTotalAmount() * 100)+"" );
		requestOrder.setTxnTime(DateUtils.dateToString( new Date(),"yyyyMMddHHmmss"));

		model.addAttribute("requestOrder", UnionpayUtil.signData(requestOrder));*/
		UnionpayUtil.pay(order.getOrderSn(), Math.round(order.getTotalAmount() * 100)+"", frontUrl, backUrl, model);
	}

	@RequestMapping(value = "/app/unionpay")
	public
	@ResponseBody
	Object appUnionpay(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String info = "银联APP支付";
		setLogInfo(info);

		Map map = new HashMap();
		try {

			String orderSn = request.getParameter("orderSn");
			Order order = orderService.find(getParamMap(), "orderSn", orderSn);
			if( order == null ){
				map.put(SUCCESS,Boolean.FALSE);
				map.put(DATA,"订单不存在");
                return map;
			}
			String total_fee = request.getParameter("total");//付款金额


			String shopUrl = getShopUrl();
			String frontUrl = shopUrl + "/html/paysuccess.html";// 页面通知地址
			String backUrl = shopUrl + "payment/unionpayBack?whichclient=whichapp";// 后台通知地址
			// 构造订单请求对象，生成signMsg。
			com.unionpay.acp.RequestOrder requestOrder = new com.unionpay.acp.RequestOrder();
			requestOrder.setFrontUrl(frontUrl);
			requestOrder.setBackUrl(backUrl);
			requestOrder.setOrderId(orderSn);
			requestOrder.setTxnAmt( Math.round(order.getTotalAmount() * 100) + "" );
			requestOrder.setTxnTime(DateUtils.dateToString( new Date(),"yyyyMMddHHmmss"));
			Map signedMap = UnionpayUtil.signData(requestOrder);
			logger.info(signedMap.toString());

			String actionUrl = requestOrder.getRequestUrl();


			Map params = net.deepdragon.util.StringUtil.beanToMap(requestOrder);
			params.remove("requestUrl");
			String html = UnionpayUtil.createHtml(actionUrl, params);

			logger.info(html);

			map.put(SUCCESS,Boolean.TRUE);
			map.put("html",html);
			Member member = getCurrentMember(request);

			this.savePaylog(member, order, "unionpay", "银联支付" );

		} catch (Exception e) {
			map.put(SUCCESS,Boolean.FALSE);
			map.put(DATA,e);
			logger.error(info + "时，发生异常", e);
		}
		return map;

	}

	private String getShopUrl() throws Exception {
		String shopUrl = null;
		try {
            shopUrl = systemSetService.find(getParamMap(), "setkey", "shopUrl").getSetvalue();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (StringUtils.isEmpty(shopUrl)) {
                throw new Exception("获取系统配置[shopUrl]失败，请检查系统配置项！");
            }
        }
		return shopUrl;
	}

	/**
	 * 银联支付
	 * 后台通知地址
	 */
	@RequestMapping("unionpayBack")
	@ResponseBody
	public String unionpayBack(HttpServletRequest request, HttpServletResponse response) {
		String info = "银联支付，支付成功之后。异步通知，处理支付网管返回的支付结果";
		setLogInfo(info);
		logger.error(info);

		boolean paySuccess = false;
		try {
			Map<String, String> respData = UnionpayUtil.resp2Map(request);
			paySuccess = UnionpayUtil.validateResposon( respData );
			if (paySuccess) {
				// 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
				// 配送状态：unshipped）valideData.get("queryId"),
				Order order = orderService.find(getParamMap(), "orderSn", respData.get("orderId"));


				/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu Start */
				String txnAmt = respData.get("txnAmt");

				if( order.getTotalAmount()*100d - Double.parseDouble(txnAmt) != 0 ){
					String msg = "Order[" + respData.get("orderId") + "] pay error:Order TotalAmount("+ order.getTotalAmount()*100 +") != txnAmt("+txnAmt+")";
					setLogInfo(msg);
					logger.error(msg);

					response.setStatus(250);

					return ajaxText("false", response);
				}
				/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */

				if( order != null && !Order.PaymentStatus.paid.toString().equals(order.getPaymentStatus() )){

					updateOrderStatusAndRedirect(respData.get("orderId"), request, response);

					//查询支付日志
					OrderPaylog paylog = this.orderPaylogService.find(getParamMap(), "orderSn", order.getOrderSn());
					//更新支付日志状态，回写支付数据
					updatePayLog(paylog, respData);
					//保存订单支付记录
					this.orderPaylogService.update(getParamMap(), paylog);

					setLogInfo("Order[" + respData.get("orderId") + "] pay success");
					logger.error("Order[" + respData.get("orderId") + "] pay success");

					//给商家发短信 TianYu 2016-04-27 08:43:46
					sendSMS(order.getOrderSn(), order.getShopId());
				}

			}
		} catch (Exception e) {
			paySuccess = false;
			logger.error(info + "时，发生异常", e);
			response.setStatus(250);//仅当POST返回码为200时，才认为商户已经成功收到并且能正确解析后台通知
		}

		response.setStatus(200);

		return ajaxText("" + paySuccess, response);
	}

	/**
	 * 银联支付成功后，更新支付日志
	 * @param paylog
	 * @param respData
     */
	private void updatePayLog(OrderPaylog paylog,Map<String, String> respData){
		paylog.setNo(respData.get("accNo"));
		paylog.setUniqueno(respData.get("queryId"));
		paylog.setPayDate(respData.get("txnTime"));
		paylog.setStatus("true");
		paylog.setInfo("银联支付-支付成功");
		paylog.setModifyDate(new Date());
		paylog.setModifyUser( "unionpay" );
	}

	/**
	 * 银联支付 - 页面通知地址
	 */
	@RequestMapping("unionpayFront")
	public String unionpayFront(HttpServletRequest request, HttpServletResponse response) {
		String info = "银联支付，支付成功之后。同步通知(页面跳转)，处理支付网管返回的支付结果，Order's orderSn = [" + request.getParameter("orderId") + "]";
		setLogInfo(info);
		logger.error(info);

		String orderId = null;
		String orderSn = null;
		Order order = null;
		String type = request.getParameter(Global.WHICHCLIENT);
		try {

			Map<String, String> valideData = UnionpayUtil.resp2Map(request);
			if (!UnionpayUtil.validateResposon( valideData)) {
				LogUtil.writeLog("验证签名结果[失败].");
			} else {
				//验证成功
				orderSn = valideData.get("orderId");

				order = orderService.find(getParamMap(), "orderSn", orderSn);

				logger.error("orderSn:" + orderSn + ",order:" + order);
				if (order != null) {
					orderId = order.getId();
				}

				/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu Start */
				boolean flag = true;
				String txnAmt = valideData.get("txnAmt");


				if( order.getTotalAmount()*100d - Double.parseDouble(txnAmt) != 0){
					String msg = "Order[" + valideData.get("orderId") + "] pay error:Order TotalAmount("+ order.getTotalAmount()*100 +") != txnAmt("+txnAmt+")";
					setLogInfo(msg);
					logger.error(msg);

					flag = false;
				}
				/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */


				if ( flag && order != null && !Order.PaymentStatus.paid.toString().equals(order.getPaymentStatus() )) {//valideData.get("queryId"),
					updateOrderStatusAndRedirect(valideData.get("orderId"), request, response);

					//查询支付日志
					OrderPaylog paylog = this.orderPaylogService.find(getParamMap(), "orderSn", order.getOrderSn());
					//更新支付日志状态，回写支付数据
					updatePayLog(paylog, valideData);
					//保存订单支付记录
					this.orderPaylogService.update(getParamMap(), paylog);

					setLogInfo("Order【" + valideData.get("orderId") + "】pay success");
					logger.error("Order[" + valideData.get("orderId") + "] pay success");

					//给商家发短信 TianYu 2016-04-27 08:43:46
					sendSMS(order.getOrderSn(), order.getShopId());
				}
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		String redirectURL = "redirect:/order/view/" + orderId + ".html";
		if (StringUtils.isEmpty(orderId)) {
			redirectURL = "redirect:/order/error/" + orderSn;
		}
		if(Global.WHICH_APP.equals(type)){
			redirectURL += "?" + Global.WHICHCLIENT + "=" + Global.WHICH_APP;
		}
		return redirectURL;
	}


	/**
	 * 银联支付
	 * 后台通知地址
	 */
	@RequestMapping("unionpayQuery")
	@ResponseBody
	public Object unionpayQuery(String orderSn,HttpServletRequest request, HttpServletResponse response) {
		String info = "银联支付，通过支付订单的订单号查询订单支付情况,orderSn="+orderSn;
		setLogInfo(info);
		logger.error(info);

		Map<String, String> result = new HashMap<String,String>();
		result.put(STATUS,SUCCESS);
		result.put(MESSAGE,"查询成功");

		boolean paySuccess = false;
		try {
			// 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
			// 配送状态：unshipped）valideData.get("queryId"),
			if( StringUtils.isNotEmpty(orderSn) && orderSn.contains(",") ){
				orderSn = orderSn.split(",")[0];
			}

			Order order = orderService.find(getParamMap(), "orderSn", orderSn);

			if( order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus())  && !Order.PaymentStatus.paid.equals(order.getPaymentStatus() )){

				Map<String,String> respData = UnionpayUtil.queryOrder(orderSn, DateUtils.dateToString(order.getModifyDate(),"yyyyMMdd010000" ), null);
				paySuccess = UnionpayUtil.validateResposon( respData );
				//respCode="00"且origRespCode="00"表示被查询交易成功。
				if (paySuccess && "00".equals( respData.get("origRespCode") )) {

					/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu Start */
					String txnAmt = respData.get("txnAmt");

					if( order.getTotalAmount()*100d != Double.parseDouble(txnAmt) ){
						String msg = "Order[" + respData.get("orderId") + "] pay error:Order TotalAmount("+ order.getTotalAmount()*100 +") != txnAmt("+txnAmt+")";
						setLogInfo(msg);
						logger.error(msg);

						result.put(MESSAGE, "查询成功，交易金额!=订单金额");
					}else {
						/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */


						updateOrderStatusAndRedirect(respData.get("orderId"), request, response);

						//查询支付日志
						OrderPaylog paylog = this.orderPaylogService.find(getParamMap(), "orderSn", order.getOrderSn());
						//更新支付日志状态，回写支付数据
						updatePayLog(paylog, respData);
						//保存订单支付记录
						this.orderPaylogService.update(getParamMap(), paylog);
						setLogInfo("order[" + respData.get("orderId") + "] query pay status success,save pay log");
						logger.error("order[" + respData.get("orderId") + "] query pay status success,save pay log");

						//给商家发短信 TianYu 2016-04-27 08:43:46
						sendSMS(order.getOrderSn(), order.getShopId());

						result.put(MESSAGE, "查询成功，交易成功");
					}
				}

			}
		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
			response.setStatus(250);//仅当POST返回码为200时，才认为商户已经成功收到并且能正确解析后台通知
			result.put(STATUS,ERROR);
			result.put(MESSAGE,info + "时，发生异常");

			return  result;
		}


		return result;
	}


	/**
	 * 发送短信
	 * @param orderSn
	 * @param shopId
     */
	private void sendSMS(String orderSn,String shopId){
		try {
			if("true".equalsIgnoreCase(PropertiesUtil.getValue("applicationContext.properties","application.sendSMSToShop4Paid"))) {
				//给商家发短信 TianYu 2016-04-27 08:43:46 Start
				Merchant merchant = this.shopService.get(getParamMap(), shopId);
				if (merchant != null && net.deepdragon.util.StringUtil.isNotEmpty(merchant.getMobile())) {
					//发送短信
					String msg = "订单" + orderSn + "已支付成功，请您尽快发货！";
					Map<String, Object> sendResult = smsLogService.sendSMS(getParamMap(), merchant.getMobile(), msg, systemSetService.getAll(getParamMap()));
					if (!SUCCESS.equals(sendResult.get(STATUS))) {
						logger.error("短信通知商家失败");
					} else {
						//保存短信日志
						this.shopService.insertOne(getParamMap(), (String) sendResult.get("smslogSql"));
						logger.error("短信通知商家成功");
					}
				}
				//给商家发短信 TianYu 2016-04-27 08:43:46 End
			}
		}catch (Exception e){
			logger.error("短信通知商家时发生异常");
		}

	}

	/**
	 * 全民付
	 *
	 * @param order
	 *            订单信息
	 * @param member
	 *            会员信息
	 * @param orderItem
	 *            订单项(只取了订单中的第一个商品)
	 * @param model
	 */
	private void getPayData4chinaumspay(Order order, Member member, OrderItem orderItem, Model model) {
//		String orderDesc = "订单号：" + order.getId();
		// ChinaumsUtil.createOrder(order.getOrderSn(), order.getTotalAmount(),
		// "" + order);
	}

	/**
	 * 支付宝
	 *
	 * @param order
	 *            订单信息
	 * @param member
	 *            会员信息
	 * @param orderItem
	 *            订单项(只取了订单中的第一个商品)
	 * @param model
	 */
	private void getPayData4alipay(Order order, Member member, OrderItem orderItem, Model model,HttpServletRequest request,HttpServletResponse response)throws Exception  {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		String shopUrl = getShopUrl();
		String whichclient=request.getParameter("whichclient")==null?"":request.getParameter("whichclient");
		String service="create_direct_pay_by_user";//PC端支付地址
		//String show_url=shopUrl+"item/"+orderItem.getId()+".html";

		PrintWriter writer = response.getWriter();

		String orderNo = order.getOrderSn();						//订单编号
		//支付宝支付开始
		////////////////////////////////////请求参数//////////////////////////////////////
		Map<String, String> sParaTemp = new HashMap<String, String>();
		sParaTemp.put("service", service);							//服务地址
		sParaTemp.put("partner", AlipayConfig.partner);				// 合作身份者ID，以2088开头由16位纯数字组成的字符串
		sParaTemp.put("seller_email", AlipayConfig.seller_id);	//商家支付宝账号
		sParaTemp.put("_input_charset", "utf-8");					// 字符编码格式 目前支持 gbk 或 utf-8
		sParaTemp.put("payment_type", "1");							// 支付类型
		sParaTemp.put("notify_url", shopUrl+"payment/alipayAsynchronous");// 服务器异步通知页面路径
		sParaTemp.put("return_url", shopUrl+"payment/alipay");		// 页面跳转同步通知页面路径
		sParaTemp.put("anti_phishing_key", "");						// 防钓鱼时间戳
		sParaTemp.put("exter_invoke_ip",request.getRemoteAddr());	// 客户端的IP地址
		sParaTemp.put("out_trade_no", orderNo);						//订单编号
		sParaTemp.put("subject", orderItem.getGoodsName()+"订单");						// 订单名称
		sParaTemp.put("total_fee", order.getTotalAmount()+"");		//付款金额
		sParaTemp.put("body", orderItem.getGoodsName()+"订单");		// 订单描述
		sParaTemp.put("whichclient",whichclient);					//用于区分是移动端支付还是PC端支付
		sParaTemp.put("sign_type",AlipayConfig.sign_type);			//签名方式 pc 使用MD5签名
		//sParaTemp.put("show_url", show_url);						// 商品展示地址(强烈建议必传，该参数影响支付过程中左上角的“返回”按钮的出现。)
		String sHtmlText = AlipaySubmit.buildRequest(sParaTemp, "get", "确认");
		System.out.println("支付post数据开始-----------------------------------------------------------");
		System.out.println(sHtmlText);
		System.out.println("支付post数据结束-----------------------------------------------------------");
		writer.println(sHtmlText);//输出到页面自动提交
		//////////////////////////////////////////////////////////////////////////////////
	}

	//获取支付宝返回的参数
	public Map<String, String> getParamsReback(Map requestParams)
			throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		// Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {

			String name = (String) iter.next();

			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";

			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}

			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			 //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			logger.error("valueStr=====================" + name + "---"+ valueStr);
			params.put(name, valueStr);
		}
		return params;
	}

	/**
	 * 支付宝支付 - 同步通知（页面跳转通知）
	 */
	@RequestMapping("alipay")
	public String alipay(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String orderId="";

		String orderSn=request.getParameter("out_trade_no");//获取支付宝返回的订单编号
		String whichclient=request.getParameter("whichclient")==null?"":request.getParameter("whichclient");

		String info = "支付宝支付，支付成功之后。同步通知(页面跳转)，处理支付宝返回的支付结果，订单号[" + orderSn + "]";
		setLogInfo(info);
		logger.error(info);

		logger.error("支付宝支付，支付成功之后。同步通知(页面跳转)，处理支付宝返回的支付结果---->step1-->orderSn:"+orderSn);
		logger.error("支付宝支付，支付成功之后。同步通知(页面跳转)，处理支付宝返回的支付结果---->返回参数-->params:"+request.getParameterMap());
		//验证支付成功还是失败
		if (AlipayNotify.verify(getParamsReback(request.getParameterMap()))) {
			String out_trade_no =request.getParameter("out_trade_no");
			logger.error("支付宝支付，支付成功之后。同步通知(页面跳转)，处理支付宝返回的支付结果---->step2-->out_trade_no:"+out_trade_no);
			String trade_no = request.getParameter("trade_no");
			String buyer_id  = request.getParameter("buyer_id ");//买家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字
			String trade_status =request.getParameter("trade_status");
			synchronized (lock) {
				//更新订单状态
				orderSn = out_trade_no;
				Order order = orderService.find(getParamMap(), "orderSn", orderSn);
				OrderPaylog paylog = this.orderPaylogService.find(getParamMap(),"orderSn",orderSn);
				if(order != null){
					orderId = order.getId();
				}
				if (order != null && !order.getOrderStatus().equals(Order.OrderStatus.wait_seller_send_goods) && order.getOrderStatus().equals(Order.OrderStatus.wait_buyer_pay) && !order.getPaymentStatus().equals(Order.PaymentStatus.paid) && order.getPaymentStatus().equals(Order.PaymentStatus.unpaid)) {

					//判断支付宝支付返回来的支付金额和订单金额是否一致
					String total_fee=request.getParameter("total_fee");//支付宝返回的支付金额
					String ordertotal_fee=order.getTotalAmount()+"";//订单中订单金额
					if(total_fee!=null && net.deepdragon.util.StringUtil.toFloat(total_fee)- net.deepdragon.util.StringUtil.toFloat(ordertotal_fee)==0){
						logger.error("orderSn:" + orderSn + ",order:" + order);
						/**2016-04-25 LXB 支付逻辑修改，先插入支付日志，再更新日志状态 start**/
						//1、更新订单状态
						updateOrderStatusAndRedirect(orderSn, request, response);

						//2、更新支付日志状态
						paylog.setStatus("true");
						paylog.setModifyDate(new Date());
						paylog.setModifyUser("system");
						this.orderPaylogService.update(getParamMap(), paylog);
						/**2016-04-25 LXB 支付逻辑修改，先插入支付日志，再更新日志状态 end**/

						//给商家发短信 Liu xiao bing 2016-04-27 08:43:46
						sendSMS(order.getOrderSn(), order.getShopId());
					}else{
						logger.error("支付宝支付，支付成功之后。同步通知(页面跳转)，处理支付宝返回的支付结果:支付的金额和订单的金额不一致orderSn:" + orderSn+"支付金额："+total_fee+"订单金额："+ordertotal_fee);
					}

				}
			}

		} else {
			//支付失败
			info = "订单号[" + orderSn + "] 的订单支付失败";
			setLogInfo(info);
			logger.error(info);
		}
		String redirectURL = "";
		if(whichclient.equals("whichapp")){
			redirectURL = "redirect:/order/view/" + orderId + ".html?whichclient=whichapp";
		}else{
			redirectURL = "redirect:/order/view/" + orderId + ".html";
		}
		if (StringUtils.isEmpty(orderId)) {
			redirectURL = "redirect:/order/error/" + orderSn;
		}
		return redirectURL;
	}

	/**
	 * 支付宝支付 支付成功之后-->后台通知处理，异步通知
	 */
	@RequestMapping("alipayAsynchronous")
	@ResponseBody
	public String alipayAsynchronous(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String orderId="";
		String orderSn=request.getParameter("out_trade_no");//获取支付宝返回的订单编号
		String info = "支付宝支付，支付成功之后。异步通知，处理支付宝返回的支付结果";
		setLogInfo(info);
		logger.error(info);
		logger.error("支付宝支付，支付成功之后。异步通知，处理支付宝返回的支付结果---->step1-->orderSn:"+orderSn);
		String paySuccess="fail";
		logger.error("支付宝支付，支付成功之后。异步通知，处理支付宝返回的支付结果---->返回参数-->params:"+request.getParameterMap());

		if (AlipayNotify.verify(getParamsReback(request.getParameterMap()))) {
			String out_trade_no =request.getParameter("out_trade_no");
			logger.error("支付宝支付，支付成功之后。异步通知，处理支付宝返回的支付结果---->step2-->out_trade_no:"+out_trade_no);
			String trade_no = request.getParameter("trade_no");
			String buyer_id  = request.getParameter("buyer_id ");//买家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字
			String trade_status =request.getParameter("trade_status");
			synchronized (lock) {
				//更新订单状态
				orderSn = out_trade_no;
				Order order = orderService.find(getParamMap(), "orderSn", orderSn);
				OrderPaylog paylog = this.orderPaylogService.find(getParamMap(),"orderSn",orderSn);
				if (order != null ) {
					logger.error("支付宝支付，支付成功之后。异步通知，处理支付宝返回的支付结果---->step3-->orderSn:"+order.getOrderSn());
					logger.error("orderSn:" + orderSn + ",order:" + order);
					orderId = order.getId();
					if(!order.getOrderStatus().equals(Order.OrderStatus.wait_seller_send_goods) && order.getOrderStatus().equals(Order.OrderStatus.wait_buyer_pay) && !order.getPaymentStatus().equals(Order.PaymentStatus.paid) && order.getPaymentStatus().equals(Order.PaymentStatus.unpaid)){

						//判断支付宝支付返回来的支付金额和订单金额是否一致
						String total_fee=request.getParameter("total_fee");//支付宝返回的支付金额
						String ordertotal_fee=order.getTotalAmount()+"";//订单中订单金额
						if(total_fee!=null && net.deepdragon.util.StringUtil.toFloat(total_fee)- net.deepdragon.util.StringUtil.toFloat(ordertotal_fee)==0){
							logger.error("支付宝支付，支付成功之后。异步通知，处理支付宝返回的支付结果---->step4-->orderSn:"+order.getOrderSn());
							/**2016-04-25 LXB 支付逻辑修改，先插入支付日志，再更新日志状态 start**/
							//1、更新订单状态
							updateOrderStatusAndRedirect(orderSn, request, response);
							//2、更新支付日志状态
							paylog.setStatus("true");
							paylog.setModifyDate(new Date());
							paylog.setModifyUser("system");
							this.orderPaylogService.update(getParamMap(), paylog);
							paySuccess="success";//如果没有收到该页面返回的 success 信息，支付宝会在24小时内按一定的时间策略重发通知
							/**2016-04-25 LXB 支付逻辑修改，先插入支付日志，再更新日志状态 end**/

							//给商家发短信 Liu xiao bing 2016-04-27 08:43:46
							sendSMS(order.getOrderSn(), order.getShopId());
						}else{
							logger.error("支付宝支付，支付成功之后。异步通知，处理支付宝返回的支付结果:支付的金额和订单的金额不一致orderSn:" + orderSn+"支付金额："+total_fee+"订单金额："+ordertotal_fee);
						}
					}else{
						paySuccess="success";//如果没有收到该页面返回的 success 信息，支付宝会在24小时内按一定的时间策略重发通知
					}
				}else{
					logger.error("支付宝支付，支付成功之后。异步通知，处理支付宝返回的支付结果:订单不存在：orderSn:" + orderSn );
				}
			}

		} else {
			//支付失败
			info = "订单号[" + orderSn + "] 的订单支付失败";
			setLogInfo(info);
			logger.error(info);
		}
		return ajaxText("" + paySuccess, response);
	}

	private void getPayData4allinpay(Order order, Member member, OrderItem orderItem, Model model) throws Exception {
		Map map  = PropertiesUtil.getAll("allinpay.properties");
		String gateway = (String)map.get("gateway");
		int inputCharset = 1; // 1代表UTF-8
		// String pickupUrl =
		// "http://127.0.0.1:8081/web-admin/payment/allinpayPickup"; // 页面通知地址
		// String receiveUrl =
		// "http://127.0.0.1:8081/web-admin/payment/receive"; // 后台通知地址

		String shopUrl = getShopUrl();

		String pickupUrl = shopUrl + "/payment/allinpayPickup";// 页面通知地址
		String receiveUrl = shopUrl + "/payment/receive";// 后台通知地址

		String version = "v1.0";
		int language = 1; // 1代表简体中文
		int signType = 0;
		String merchantId =  (String)map.get("merchantId");
		String payerName = member.getUserName(); // 付款人姓名
		if (StringUtils.isNotEmpty(member.getNickName())) {
			payerName += "[" + member.getNickName() + "]";
		}
		String payerEmail = Strings.nullToEmpty(member.getEmail()); // 付款人邮件联系方式
		String payerTelephone = Strings.nullToEmpty(member.getMobile()); // 付款人电话联系方式
		String payerIDCard = ""; // 付款人证件号
		String pid = ""; // 合作伙伴的商户号
		String orderNo = order.getOrderSn(); // 商户订单号
		long orderAmount = Math.round(order.getTotalAmount() * 100); // 商户订单金额。人民币单位是分，1代表1分钱。

		//orderAmount = 1;// 测试统一设置成1分钱

		int orderCurrency = 0; // 订单金额币种类型。0和156代表人民币
		String orderDatetime = DateUtils.format(order.getCreateDate(), DateUtils.DATETIME_FORMAT); // 商户订单提交时间。日期格式：yyyyMMDDhhmmss
		int orderExpireDatetime = 0; // 订单过期时间。整形数字，单位为分钟。 最大值为9999分钟。

		String productName = orderItem.getGoodsName().trim(); // 商品名称
		long productPrice = Math.round(orderItem.getGoodsPrice() * 100); // 商品价格。整型数字
		int productNum = orderItem.getQuantity(); // 商品数量。整型数字，默认传1
		String productId = Strings.nullToEmpty(orderItem.getGoodsId()); // 商品代码。字母、数字或-
		// 、_
		// 的组合；
		String productDesc = ""; // 商品描述

		String ext1 = ""; // 扩展字段1。英文或中文字符串，支付完成后，按照原样返回给商户
		String ext2 = ""; // 扩展字段2。英文或中文字符串，支付完成后，按照原样返回给商户
		String extTL = ""; // 业务扩展字段。可为空

		int payType = 0; // 支付方式。接入互联网关时，默认为间连模式，填0
		String issuerId = ""; // 发卡方代码。payType为0时，issuerId必须为空
		String pan = ""; // 付款人支付卡号。可为空
		String tradeNature = "GOODS"; // 贸易类型。固定选择值：GOODS或SERVICES

		String serverUrl = gateway;
		String key = "1234567890";
		String signMsg = "";

		// 构造订单请求对象，生成signMsg。
		com.allinpay.ets.client.RequestOrder requestOrder = new com.allinpay.ets.client.RequestOrder();
		requestOrder.setInputCharset(inputCharset);
		requestOrder.setPickupUrl(pickupUrl);
		requestOrder.setReceiveUrl(receiveUrl);
		requestOrder.setVersion(version);
		requestOrder.setLanguage(language);
		requestOrder.setSignType(signType);
		requestOrder.setPayType(payType);
		requestOrder.setIssuerId(issuerId);
		requestOrder.setMerchantId(merchantId);
		requestOrder.setPayerName(payerName);
		requestOrder.setPayerEmail(payerEmail);
		requestOrder.setPayerTelephone(payerTelephone);
		requestOrder.setPayerIDCard(payerIDCard);
		requestOrder.setPid(pid);
		requestOrder.setOrderNo(orderNo);
		requestOrder.setOrderAmount(orderAmount);
		requestOrder.setOrderCurrency("" + orderCurrency);
		requestOrder.setOrderDatetime(orderDatetime);
		requestOrder.setOrderExpireDatetime("" + orderExpireDatetime);
		requestOrder.setProductName(productName);
		requestOrder.setProductPrice(productPrice);
		requestOrder.setProductNum(productNum);
		requestOrder.setProductId(productId);
		requestOrder.setProductDesc(productDesc);
		requestOrder.setExt1(ext1);
		requestOrder.setExt2(ext2);
		requestOrder.setExtTL(extTL);// 通联商户拓展业务字段，在v2.2.0版本之后才使用到的，用于开通分账等业务
		requestOrder.setPan(pan);
		requestOrder.setTradeNature(tradeNature);
		requestOrder.setKey(key); // key为MD5密钥，密钥是在通联支付网关会员服务网站上设置。

		//默认该用户所有订单均为跨境交易
		if(CrossborderUtil.isCrossborderMember(member)){
			//如果涉及跨境商品交易，添加海关扩展字段

			CustomsEntity customs = new XianCustoms();
			customs.setAPP_UID((String)map.get("appUid"));
			customs.setAPP_UNAME((String) map.get("appUname"));
			customs.setESHOP_ENT_CODE((String) map.get("ecpCode"));
			customs.setESHOP_ENT_NAME((String) map.get("ecpName"));
			customs.setMEMO("");
			String customsExt = customs.toXml();
			model.addAttribute("customsExt", customsExt);
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("o.orderSn", order.getOrderSn()));
			//回调地址标记下，该该次交易涉及跨境。
			requestOrder.setExt1(ext1 = CrossborderUtil.CROSSBORDER_FLAGS);
			requestOrder.setExt2(ext2 = SecurityUtil.MD5Encode(customsExt));
		}

		String strSrcMsg = requestOrder.getSrc(); // 此方法用于debug，测试通过后可注释。
		signMsg = requestOrder.doSign(); // 签名，设为signMsg字段值。

		logger.info("通联支付 - strSrcMsg:" + strSrcMsg);
		logger.info("通联支付 - signMsg:" + signMsg);

		model.addAttribute("inputCharset", inputCharset);
		model.addAttribute("pickupUrl", pickupUrl);
		model.addAttribute("receiveUrl", receiveUrl);
		model.addAttribute("version", version);
		model.addAttribute("language", language);
		model.addAttribute("signType", signType);
		model.addAttribute("merchantId", merchantId);
		model.addAttribute("payerName", payerName);
		model.addAttribute("payerEmail", payerEmail);
		model.addAttribute("payerTelephone", payerTelephone);
		model.addAttribute("payerIDCard", payerIDCard);
		model.addAttribute("pid", pid);
		model.addAttribute("orderNo", orderNo);
		model.addAttribute("orderAmount", orderAmount);
		model.addAttribute("orderCurrency", orderCurrency);
		model.addAttribute("orderDatetime", orderDatetime);
		model.addAttribute("orderExpireDatetime", orderExpireDatetime);

		model.addAttribute("productName", productName);
		model.addAttribute("productPrice", productPrice);
		model.addAttribute("productNum", productNum);
		model.addAttribute("productId", productId);
		model.addAttribute("productDesc", productDesc);

		model.addAttribute("ext1", ext1);
		model.addAttribute("ext2", ext2);
		model.addAttribute("extTL", extTL);

		model.addAttribute("payType", payType);
		model.addAttribute("issuerId", issuerId);
		model.addAttribute("pan", pan);
		model.addAttribute("tradeNature", tradeNature);

		model.addAttribute("serverUrl", serverUrl);
		model.addAttribute("key", key);
		model.addAttribute("signMsg", signMsg);
	}


	/**
	 * 银联退货
	 * @param order
	 * @param member
	 * @param model
	 * @throws Exception
	 */
	private void unionpayRefund(Order order, Member member, Model model) throws Exception {
		String shopUrl = getShopUrl();

		String frontUrl = shopUrl + "/payment/unionpayFront";// 页面通知地址
		String backUrl = shopUrl + "/payment/unionpayBack";// 后台通知地址

		List<OrderPaylog> paylogs = this.orderPaylogService.findList(getParamMap(), "orderSn", order.getOrderSn());

		String queryId = null;
		if( paylogs != null && paylogs.size() > 0 ){
			for(OrderPaylog paylog : paylogs){
				if( OrderPaylog.SIGN_PAY.equals(paylog.getSign()) ){
					queryId = paylog.getUniqueno();
				}
			}
		}

		UnionpayUtil.refund(order.getOrderSn(), Math.round(order.getTotalAmount() * 100) + "", queryId,frontUrl, backUrl, model);
	}

	/**
	 * 银联撤销消费
	 * @param order
	 * @param member
	 * @param model
	 * @throws Exception
	 */
	private void unionpayUndo(Order order, Member member, Model model) throws Exception {
		String shopUrl = getShopUrl();

		String frontUrl = shopUrl + "/payment/unionpayFront";// 页面通知地址
		String backUrl = shopUrl + "/payment/unionpayBack";// 后台通知地址

		List<OrderPaylog> paylogs = this.orderPaylogService.findList(getParamMap(), "orderSn", order.getOrderSn());

		String queryId = null;
		if( paylogs != null && paylogs.size() > 0 ){
			for(OrderPaylog paylog : paylogs){
				if( OrderPaylog.SIGN_PAY.equals(paylog.getSign()) ){
					queryId = paylog.getUniqueno();
				}
			}
		}
		UnionpayUtil.consumeUndo(order.getOrderSn(), Math.round(order.getTotalAmount() * 100) + "", queryId, frontUrl, backUrl, model);
	}

	@RequestMapping(value = "/app/alipay")
	public
	@ResponseBody
	Object appAlipay(HttpServletRequest request, HttpServletResponse response) {
		String info = "支付宝APP支付";
		setLogInfo(info);

		Map map = new HashMap();
		try {
			String shopUrl = getShopUrl();

			String notify_url = shopUrl+"payment/alipayAsynchronous";// 服务器异步通知页面路径
			String return_url = shopUrl+"payment/alipay";		// 页面跳转同步通知页面路径
			String orderSn = request.getParameter("orderSn");
			Order order = orderService.find(getParamMap(), "orderSn", orderSn);
			if(order!=null){
				String total_fee =order.getTotalAmount()+""; //request.getParameter("total");//付款金额

				//金额转化为分为单位
				//total_fee = String.format("%.2f", Float.parseFloat(total_fee));
				String orderInfo = AlipayCore.getOrderInfo(orderSn,orderSn, orderSn, total_fee, notify_url, return_url);

				String sign = AlipayCore.sign(orderInfo, AlipayConfig.private_key);
				// 仅需对sign 做URL编码
				sign = URLEncoder.encode(sign, "UTF-8");

				String linkString = orderInfo + "&sign=\"" + sign + "\"&"
						+ AlipayCore.getSignType();
				logger.error("支付宝APP支付，订单签名结果---->linkString-->linkString:"+linkString);
				map.put("success",Boolean.TRUE);
				map.put("data",linkString);

				//先插入支付日志，再更新支付状态
				order = orderService.find(getParamMap(), "orderSn", orderSn);
				Member member = getCurrentMember(request);
				//插入支付日志
				savePaylog(member,order, "alipay", "支付宝" );


			}else{
				logger.error("支付宝APP支付，订单不存在orderSn--->"+orderSn);
				return map;
			}
		} catch (Exception e) {
			map.put("success",Boolean.FALSE);
			map.put("data",e);
			logger.error(info + "时，发生异常", e);
		}
		return map;
	}


	/**
	 *支付回调接口插入支付日志
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	public void insertOrderPayLog(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String info="支付回调通知接口插入订单支付日志信息";

		String out_trade_no =request.getParameter("out_trade_no");
		String trade_no = request.getParameter("trade_no");
		String buyer_id  = request.getParameter("buyer_id ");//买家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字
		String trade_status =request.getParameter("trade_status");
		synchronized (lock) {
			//更新订单状态
			String orderSn = out_trade_no;
			String orderId;
			Order order = orderService.find(getParamMap(), "orderSn", orderSn);
			if (order != null && !order.getOrderStatus().equals(Order.OrderStatus.wait_seller_send_goods) && order.getOrderStatus().equals(Order.OrderStatus.wait_buyer_pay) && !order.getPaymentStatus().equals(Order.PaymentStatus.paid) && order.getPaymentStatus().equals(Order.PaymentStatus.unpaid)) {
				logger.error("orderSn:" + orderSn + ",order:" + order);
				if (order != null) {
					orderId = order.getId();
				}
				if (order != null) {
					updateOrderStatusAndRedirect(orderSn, request, response);
				}
				//组装订单支付记录
				OrderPaylog paylog = new OrderPaylog();
				paylog.setTenantId(order.getTenantId());
				paylog.setMemberId(order.getMemberId());
				paylog.setOrderSn(orderSn);
				paylog.setNo(buyer_id);//
				paylog.setSign("alipay_direct");//支付宝即时到账接口
				paylog.setName("支付宝即时到账接口支付[PC支付]");
				paylog.setUniqueno(trade_no);
				paylog.setAmount(order.getTotalAmount());
				paylog.setPayDate(new SimpleDateFormat("YYYYMMddHHmmss").format(new Date()));//yyyyMMddHHmmss
				paylog.setStatus("true");
				paylog.setInfo(info);
				paylog.setCreateUser("system");
				paylog.setCreateDate(new Date());
				//保存订单支付记录
				this.orderPaylogService.save(getParamMap(), paylog);
			}
		}
	}

}
