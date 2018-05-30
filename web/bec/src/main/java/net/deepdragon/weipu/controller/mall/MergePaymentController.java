package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayCore;
import com.alipay.util.AlipayNotify;
import com.google.common.base.Strings;
import com.icbc.CBCPayOnline;
import com.icbc.ICBCConst;
import com.icbc.rtrep.NotifyData;
import com.icbc.rtreq.*;
import com.unionpay.acp.UnionpayUtil;
import com.unionpay.acp.sdk.LogUtil;
import com.weixin.common.Configure;
import com.weixin.common.Signature;
import com.weixin.common.WXUtil;
import com.weixin.common.XStreamUtil;
import com.weixin.protocol.AsynNotifyReqData;
import com.weixin.protocol.AsynNotifyResData;
import com.weixin.protocol.UnifiedorderReqData;
import com.weixin.protocol.UnifiedorderResData;
import com.weixin.service.UnifiedorderService;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.*;
import net.deepdragon.util.*;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.PropertiesUtil;
import net.deepdragon.weipu.tools.UploadTools;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.*;

/**
 * 订单支付
 */
@Controller(Global.APP_SIGN + Global.MALL + "MergePaymentController")
@RequestMapping(Global.MALL_PATH + "/payment/merge")
public class MergePaymentController extends BaseMallController {
	@Resource
	private OrderService orderService;
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

	@Resource
	private GoodsService goodsService;
	@Resource
	private AccountService accountService;
	@Resource
	private OrderOfflinepayVoucherService orderOfflinepayVoucherService;

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

		Map<String, Object> icbcB2CPay = new HashMap<String, Object>();
		icbcB2CPay.put("sign", "icbcb2c");
		icbcB2CPay.put("name", "中国工商银行B2C支付");
		icbcB2CPay.put("logo", "icbc.png");

		Map<String, Object> icbcB2BPay = new HashMap<String, Object>();
		icbcB2BPay.put("sign", "icbcb2b");
		icbcB2BPay.put("name", "中国工商银行B2B支付");
		icbcB2BPay.put("logo", "icbc.png");

		payTypeAllList.add(allinpay);
		payTypeAllList.add(chinaumspay);
		payTypeAllList.add(alipay);
		payTypeAllList.add(unionpay);
		payTypeAllList.add(wxpay);
		payTypeAllList.add(allinpay);
		payTypeAllList.add(icbcB2CPay);
		payTypeAllList.add(icbcB2BPay);


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
			case "ghj":
				//pc
				payTypeList.add(unionpay);
				payTypeList.add(allinpay);
				payTypeList.add(icbcB2CPay);
				payTypeList.add(icbcB2BPay);
				//wx
				payTypeListForWechat.add(unionpay);
				payTypeListForWechat.add(wxpay);
				payTypeListForWechat.add(alipay);
				//app
				payTypeListForHybridApp.add(unionpay);
				payTypeListForHybridApp.add(wxpay);
				payTypeListForHybridApp.add(alipay);
				break;
			case "ghdj":
				//pc
				payTypeList.add(unionpay);
				payTypeList.add(allinpay);
				payTypeList.add(icbcB2CPay);
				payTypeList.add(icbcB2BPay);
				//wx
				payTypeListForWechat.add(unionpay);
				payTypeListForWechat.add(wxpay);
				payTypeListForWechat.add(alipay);
				//app
				payTypeListForHybridApp.add(unionpay);
				payTypeListForHybridApp.add(wxpay);
				payTypeListForHybridApp.add(alipay);
				break;
			case "xd":
				//pc
				payTypeList.add(unionpay);
				//wx
				payTypeListForWechat.add(unionpay);
				//app
				payTypeListForHybridApp.add(unionpay);

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

	@RequestMapping(value = "payList")
	public String payList(String orderSns, Model model, HttpServletRequest request) {
		String info = "订单[" + orderSns + "]支付，选择支持的在线支付平台";
		setLogInfo(info);
		logger.debug(info);
		Double total = 0d;

		try {

			if( !StringUtils.isNotEmpty( orderSns ) ){
				return "redirect:/order/list";
			}

			List<Order> orderList = getOrderByOrderSns( orderSns );

			if( orderList == null || orderList.size() == 0 ){
				return "redirect:/order/list";
			}

			for(Order order : orderList){
				total += order.getTotalAmount();
			}


			model.addAttribute("orders", orderList);
		} catch (Exception e) {
			logger.error(info + "前，核对订单信息时，发生异常", e);
			e.printStackTrace();
		}

		model.addAttribute("orderSns", orderSns);
		model.addAttribute("total", total);

		model.addAttribute("payTypeList", payTypeList);
		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));
		String type = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_WEIXIN_APP.equals(type)){
			model.addAttribute("payTypeList", payTypeListForWechat);
			return Global.TEMPLATE_APP + PATH + "/pay";
		}else if(Global.HYBRIDAPP.equals(type)){
			model.addAttribute("payTypeList", payTypeListForHybridApp);
			return Global.TEMPLATE_APP + PATH + "/pay";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/merge_payment_list";
		}
	}

	/**
	 * 在线支付点击“下一步”后调用方法
	 * 进入支付页面
	 * @param orderSns
	 * @param payType
	 * @return
	 *
	 */
	@RequestMapping(value = "show", method ={RequestMethod.POST})
	public String show(String orderSns, String payType, Model model, HttpServletRequest request) {
		String info = "订单[" + orderSns + "]支付，暂不保存用户的选择，进入确认支付页面，展示用户的选择";
		setLogInfo(info);
		logger.debug(info);
		Double total = 0d;

		String orderIds = "";
		int orderType = 0;

		try {
			if (!StringUtils.isNotEmpty(orderSns)) {
				return "redirect:/order/list";
			}

			List<Order> orderList = getOrderByOrderSns( orderSns );

			if( orderList == null || orderList.size() == 0 ){
				return "redirect:/order/list";
			}

			for(Order order : orderList){
				total += order.getTotalAmount();
				orderIds += ","+order.getId();
				orderType = order.getOrderType();
			}

			model.addAttribute("orders", orderList);
			model.addAttribute("total", total);
			model.addAttribute("orderSns", orderSns);
			model.addAttribute("orderIds", orderIds.length() > 0?orderIds.substring(1):"");

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

		model.addAttribute("payType", payTypeMap);
		model.addAttribute("orderType", orderType);

		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		model.addAttribute("services", cacheData.getServices(getParamMap()));


		return Global.TEMPLATE_MALL + PATH + "/member/merge_payment_show";
	}

	@RequestMapping(value = "confirm")
	public String confirm(String orderSns, String payType, Model model, HttpServletRequest request, HttpServletResponse response) {
		String info = "订单[" + orderSns + "]支付，保存订单选择的在线支付方式，根据不同的方式组织参数跳转到不同的网关";
		setLogInfo(info);
		logger.debug(info);
		List<Order> orderList = null;
		OrderItem orderItem = null;
		Double total = 0d;
		Buyer member = getCurrentMember(request);
		String mergeOrderSn = OrderGenerator.generator();//合并订单号

		try {
			if (!StringUtils.isNotEmpty(orderSns)) {
				return "redirect:/order/list";
			}

			orderList = this.getOrderByOrderSns( orderSns );

			if( orderList == null || orderList.size() == 0 ){
				return "redirect:/order/list";
			}

			for(Order order : orderList) {
				//计算累计金额
				total += order.getTotalAmount();

				//更新合并订单号
				Order updateObj = new Order();
				updateObj.setId(order.getId());
				updateObj.setPayType(payType);
				updateObj.setMergeOrderSn( mergeOrderSn );
				updateObj.setModifyUser(getCurrentMember(request).getUserName());
				updateObj.setModifyDate(new Date());
				orderService.update(getParamMap(), updateObj);



				if( orderItem == null ) {
					List<OrderItem> orderItemList = orderItemService.findList(getParamMap(), "orderSn", order.getOrderSn());
					if (orderItemList != null && orderItemList.size() > 0) {
						for(OrderItem item : orderItemList){
							if( item.getQuantity() != 0 ){
								orderItem = item;
								break;
							}
						}
					}
				}

				//生成支付日志并保存
				if (StringUtils.equalsIgnoreCase("allinpay", payType)) {
					logger.error("allinpay  通联支付");
					savePaylog(member,order, mergeOrderSn,"allinpay", "通联支付" );
				} else if (StringUtils.equalsIgnoreCase("icbcb2c", payType)){
					logger.error("ICBC  工行支付");
					savePaylog(member,order, mergeOrderSn,payType, "工行B2C支付" );
				} else if (StringUtils.equalsIgnoreCase("icbcb2b", payType)){
					logger.error("ICBC  工行支付");
					savePaylog(member,order, mergeOrderSn,payType, "工行B2B支付" );
				} else if (StringUtils.equalsIgnoreCase("unionpay", payType)) {
					logger.error("unionpay  银联支付");
					savePaylog(member,order, mergeOrderSn,"unionpay", "银联支付" );
				}else {
					payType = "type_error";
					logger.error("系统不支持所选支付类型[" + payType + "]");
				}
			}


			if (StringUtils.equalsIgnoreCase("allinpay", payType)) {
				logger.error("allinpay  通联支付");

				getPayData4allinpay(mergeOrderSn, total, member, orderItem, model);
			}else if (StringUtils.equalsIgnoreCase("icbcb2c", payType)) {
				logger.error("icbcpay  工行B2C支付");

				getPayData4icbcB2CPay(mergeOrderSn, total, member, orderItem, model);

			}  else if (StringUtils.equalsIgnoreCase("icbcb2b", payType)) {
				logger.error("icbcpay  工行B2B支付");

				getPayData4icbcB2BPay(mergeOrderSn, total, member, orderItem, model);

			} else if (StringUtils.equalsIgnoreCase("unionpay", payType)) {
				logger.error("unionpay  银联支付");

				getPayData4Unionpay(mergeOrderSn, total, member, orderItem, model);
			} else {
				payType = "type_error";
				logger.error("系统不支持所选支付类型[" + payType + "]");
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		return Global.TEMPLATE_MALL + PATH + "/member/payment_" + payType;
	}

	/**
	 * 合并支付调用通联B2B接口，使用 ext1 = merge 标识支付为合并订单支付
	 * @param mergeOrderSn 合并订单号
	 * @param total 合并后总价格
	 * @param member
	 * @param orderItem
	 * @param model
	 * @throws Exception
	 *
	 */
	private void getPayData4allinpay(String mergeOrderSn, Double total, Buyer member, OrderItem orderItem, Model model) throws Exception {
		/*
		*
		* https://service.allinpay.com/gateway/index.do
		* http://ceshi.allinpay.com/gateway/index.do
		*
		* */
		Map map = PropertiesUtil.getAll("allinpay.ghj.properties");
		String gateway = (String)map.get("gateway");
		int inputCharset = 1; // 1代表UTF-8

		String shopUrl = getShopUrl();
		String pickupUrl = shopUrl + "payment/allinpayPickup";// 页面通知地址
		String receiveUrl = shopUrl + "payment/receive";// 后台通知地址

		String version = "v1.0";
		int language = 1; // 1代表简体中文
		int signType = 0;//0 :MD5加密 1：证书加密
		//商户ID
		String merchantId =  (String)map.get("merchantId");
		String payerName = member.getUserName(); // 付款人姓名
		if (StringUtils.isNotEmpty(member.getRealName())) {
			payerName += "[" + member.getRealName() + "]";
		}
		String payerEmail = Strings.nullToEmpty(member.getEmail()); // 付款人邮件联系方式
		String payerTelephone = Strings.nullToEmpty(member.getMobile()); // 付款人电话联系方式
		String payerIDCard = ""; // 付款人证件号
		String pid = ""; // 合作伙伴的商户号
		String orderNo = mergeOrderSn; // 商户订单号
		long orderAmount = Math.round(total * 100); // 商户订单金额。人民币单位是分，1代表1分钱。

		//orderAmount = 1;// 测试统一设置成1分钱

		int orderCurrency = 0; // 订单金额币种类型。0和156代表人民币
		String orderDatetime = DateUtils.format(new Date(), DateUtils.DATETIME_FORMAT); // 商户订单提交时间。日期格式：yyyyMMDDhhmmss
		int orderExpireDatetime = 0; // 订单过期时间。整形数字，单位为分钟。 最大值为9999分钟。

		String productName = orderItem.getGoodsName().trim(); // 商品名称
		long productPrice = Math.round(orderItem.getGoodsPrice() * 100); // 商品价格。整型数字
		int productNum = orderItem.getQuantity(); // 商品数量。整型数字，默认传1
		String productId = Strings.nullToEmpty(orderItem.getGoodsId()); // 商品代码。字母、数字或-
		// 、_
		// 的组合；
		String productDesc = ""; // 商品描述

		String ext1 = "merge"; // 扩展字段1。英文或中文字符串，支付完成后，按照原样返回给商户,标识是 合并支付订单
		String ext2 = ""; // 扩展字段2。英文或中文字符串，支付完成后，按照原样返回给商户
		String extTL = ""; // 业务扩展字段。可为空

		int payType = 4; // 支付方式。接入互联网关时，默认为间连模式，填0
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
	 * 银联支付
	 * @param mergeOrderSn 合并订单号
	 * @param total 订单总额合计
	 * @param member 用户
	 * @param orderItem 订单明细
	 * @param model
	 * @throws Exception
	 */
	private void getPayData4Unionpay(String mergeOrderSn, Double total, Buyer member, OrderItem orderItem, Model model) throws Exception {
		String becShopUrl = getShopUrl();
//		becShopUrl = "http://localhost:8080/bec/";
		String frontUrl = becShopUrl + "payment/merge/unionpayFront";// 页面通知地址
		String backUrl = becShopUrl + "payment/merge/unionpayBack";// 后台通知地址
		if(Global.WHICH_APP.equals(model.asMap().get(Global.WHICHCLIENT))){
			frontUrl += "?whichclient=whichapp";// 页面通知地址
			backUrl += "?whichclient=whichapp";// 后台通知地址
		}

		UnionpayUtil.pay(mergeOrderSn, Math.round(total * 100) + "", frontUrl, backUrl, model);
	}


	/**
	 * 工行B2B支付
	 * yanchao 2016-6-16 14:13:35
	 */
	private void getPayData4icbcB2BPay(String  orderSn, Double total, Buyer member, OrderItem orderItem, Model model) throws Exception {
		String becShopUrl = getShopUrl();
//		becShopUrl = "http://ghj168.cn:8084/bec/";
		String frontUrl = becShopUrl + "payment/merge/unionpayFront";// 页面通知地址
		String backUrl = becShopUrl + "payment/merge/icbcb2bPickup";// 后台通知地址
		if(Global.WHICH_APP.equals(model.asMap().get(Global.WHICHCLIENT))){
			frontUrl += "?whichclient=whichapp";// 页面通知地址
		}
		model.addAttribute("APIName", "B2B");//固定值“B2B”
		model.addAttribute("APIVersion","001.001.001.001");//
		model.addAttribute("Shop_code", ICBCConst.b2b_shopCode);//商户的代码
		model.addAttribute("MerchantURL",backUrl);//通知接口
		model.addAttribute("ContractNo", orderSn);//订单编号
		model.addAttribute("ContractAmt", Math.round(total * 100));//订单总额
		model.addAttribute("Account_cur", "001");//货币单位
		model.addAttribute("JoinFlag", "2");
		model.addAttribute("Mer_Icbc20_signstr","");
		model.addAttribute("Cert","");
		model.addAttribute("SendType",1);//0：成功失败信息都发送 1：只发送成功信息

		Calendar cal = Calendar.getInstance();
		//调整与工行接口服务器的时间差
//		cal.add(Calendar.DATE,-1);
		model.addAttribute("TranTime",DateUtils.dateToString(cal.getTime(),"yyyyMMddHHmmss"));
		model.addAttribute("Shop_acc_num", ICBCConst.b2b_account);
		model.addAttribute("PayeeAcct", ICBCConst.b2b_account);
		model.addAttribute("GoodsCode", orderItem.getGoodsId());
		model.addAttribute("GoodsName", orderItem.getGoodsName());
		model.addAttribute("Amount", orderItem.getQuantity());
		model.addAttribute("TransFee", 0.00);
		model.addAttribute("ShopRemark", ICBCConst.b2b_shopName);//商城提示
		model.addAttribute("ShopRem", "merge");//商城备注字段
		model.addAttribute("PayeeName","");//收款人名称

		CBCPayOnline.mer_Icbc20_signstr(model);

		model.addAttribute("serverUrl", ICBCConst.b2b_serverUrl);

	}
	/**
	 * 工行B2C支付
	 * yanchao 2016-6-16 14:13:35
	 */
	private void getPayData4icbcB2CPay(String  orderSn, Double total, Buyer member, OrderItem orderItem, Model model) throws Exception {
		String becShopUrl = getShopUrl();
//		becShopUrl = "http://ghj168.cn:8084/bec/";
		String frontUrl = becShopUrl + "payment/merge/icbcb2cPickup";// 页面通知地址
		String backUrl = becShopUrl + "payment/merge/icbcpayPickup";// 后台通知地址
		if(Global.WHICH_APP.equals(model.asMap().get(Global.WHICHCLIENT))){
			frontUrl += "?whichclient=whichapp";// 页面通知地址
		}

		TranData tranData = new TranData();
		OrderInfo orderInfo = tranData.getOrderInfo();
		//商户ID
		orderInfo.setMerID(ICBCConst.b2c_shopCode);
		Calendar cal = Calendar.getInstance();
		//调整与工行接口服务器的时间差
//		cal.add(Calendar.DATE,-1);
		orderInfo.setOrderDate(DateUtils.dateToString(cal.getTime(),"yyyyMMddHHmmss"));

		SubOrderInfo subInfo = new SubOrderInfo();
		subInfo.setOrderid(orderSn);
		subInfo.setAmount(Math.round(total * 100) + "");
		subInfo.setGoodsName(orderItem.getGoodsName());
		subInfo.setGoodsNum(orderItem.getQuantity() + "");
		subInfo.setGoodsID(orderItem.getGoodsId());
		subInfo.setMerAcct(ICBCConst.b2c_account);

		orderInfo.addSubOrderInfo(subInfo);

		Message message = tranData.getMessage();
//		message.setMerReference("*.yanchao.ngrok.cc");
		message.setMerReference(ICBCConst.b2c_domain);
		message.setMerCustomID(member.getUserName());
		message.setMerURL(frontUrl);
		message.setMerVAR("merge");

		ICBC icbc = CBCPayOnline.getBase64ICBC(tranData);
		model.addAllAttributes(JSON.parseObject(JSON.toJSONString(icbc)));
		model.addAttribute("serverUrl", ICBCConst.b2c_serverUrl);
	}


	/**
	 * 工行B2C支付回调接口
	 * yanchao 2016-6-16 14:13:35
	 */
	@RequestMapping("icbcb2cPickup")
	public String icbcb2cPickup(HttpServletRequest request, HttpServletResponse response) {
		String info = "工行B2C支付，支付成功之后。同步通知(页面跳转)，处理支付网管返回的支付结果，订单号[" + request.getParameter("orderNo") + "]";
		setLogInfo(info);
		logger.error(info);
		String orderId = null;
		try {
			String base64 = request.getParameter("notifyData").trim();
			String merVAR = request.getParameter("merVAR");
			String signMsg = request.getParameter("signMsg").trim();

			//验证签名：返回true代表验签成功；否则验签失败。
			if (!CBCPayOnline.verifyNotify(base64, signMsg)) {
				NotifyData notifyData = CBCPayOnline.getNotifyData(base64);
				if ("1".equals(notifyData.getBank().getTranStat())) {
					logger.info("ICBC_B2C支付成功：＝＝＝＝＝＝＝＝＝＝" + base64);
					SubOrderInfo subOrderInfo = (SubOrderInfo) notifyData.getOrderInfo().getSubOrderInfoList().get(0);
					orderId = subOrderInfo.getOrderid();
					if("merge".equals(merVAR)){
						/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu Start */
						String txnAmtStr = subOrderInfo.getAmount();//notifyData.getAmout();
						Double txnAmt = Double.parseDouble(txnAmtStr);
						List<Map<String, Object>> orderAndPaylogs = judgePayAmount(orderId, txnAmt );
						/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */
						if(orderAndPaylogs != null){
							mergeOrderUpdateOrderAndPaylog(orderAndPaylogs, subOrderInfo.getTranSerialNo(), notifyData.getCustom().getUserNum(), notifyData.getBank().getNotifyDate(), request, response);
//							mergeOrderUpdateOrderAndPaylog(orderId, notifyData.getBank().getTranBatchNo(), "工行B2C支付", request, response);
						}
					}
				}
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}
		return "";
	}

	/**
	 * 工行B2B支付回调接口
	 * yanchao 2016-6-16 14:13:35
	 */
	@RequestMapping("icbcb2bPickup")
	public String icbcb2bPickup(HttpServletRequest request, HttpServletResponse response) {
		String info = "工行支付，支付成功之后。同步通知(页面跳转)，处理支付网管返回的支付结果，订单号[" + request.getParameter("orderNo") + "]";
		setLogInfo(info);
		logger.error(info);
		try {
			//交易成功标识
			//验证签名：返回true代表验签成功；否则验签失败。
			if ("0".equals(request.getParameter("PayStatusZHCN")) && CBCPayOnline.verifyB2BNotify(request)) {

				String shopRem =  request.getParameter("shopRem");
				String orderId = request.getParameter("ContractNo");

				logger.info("ICBC_B2C支付成功：＝＝＝＝＝＝＝＝＝＝" );
				if("merge".equals( shopRem )){
					/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu Start */
					String txnAmtStr = request.getParameter("ContractAmt");
					Double txnAmt = Double.parseDouble(txnAmtStr);
					List<Map<String, Object>> orderAndPaylogs = judgePayAmount(orderId, txnAmt );
					/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */
					if(orderAndPaylogs != null){
						mergeOrderUpdateOrderAndPaylog(orderAndPaylogs, request.getParameter("CustJoinNumber"), request.getParameter("CustJoinNumber"), request.getParameter("NotifyTime"), request, response);
					}
//					mergeOrderUpdateOrderAndPaylog(orderId, "", "工行B2C支付", request, response);
				}
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		return "";
	}

	/**
	 * 根据订单号查询订单
	 * @param orderSns
	 * @return
	 * @throws Exception
     */
	private List<Order> getOrderByOrderSns(String orderSns) throws Exception{
		List<String> orderSnList = null;
		orderSnList = Arrays.asList(orderSns.split(","));
		List<Order> orders = orderService.findListByOrderSns(getParamMap(), orderSnList);

		return orders;
	}

	/**
	 * 保存支付日志
	 * @param member
	 * @param order
	 * @param mergeOrderSn
	 * @param payType
	 * @param payTypeName
	 * @return
	 * @throws Exception
	 */
	private OrderPaylog savePaylog( Buyer member, Order order, String mergeOrderSn,String payType,String payTypeName) throws Exception{
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
		paylog.setMergeOrderSn( mergeOrderSn );
		paylog.setCreateUser(member.getUserName());
		paylog.setCreateDate(new Date());

		paylog = this.orderPaylogService.save(getParamMap(), paylog);

		return paylog;
	}


	/**
	 * 银联支付
	 * 后台通知地址
	 * version 2 TianYu 2016-2-26 17:12:26
	 * 1、实现多次支付，与银行交互的订单号为支付日志ID
	 * 2、更新支付日志的支付状态 status = true
	 * 3、比较支付总额和订单总额，如果相等，更新订单状态；如果不相等，不对订单做处理
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
			paySuccess = UnionpayUtil.validateResposon(respData);
			if (paySuccess) {
				updateOrder4Unionpay( respData, request, response);
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
	 * 银联支付 - 页面通知地址
	 */
	@RequestMapping("unionpayFront")
	public String unionpayFront(HttpServletRequest request, HttpServletResponse response) {
		String info = "银联支付，支付成功之后。同步通知(页面跳转)，处理支付网管返回的支付结果，订单号[" + request.getParameter("orderId") + "]";
		setLogInfo(info);
		logger.error(info);

		int orderType = 0;
		String type = request.getParameter(Global.WHICHCLIENT);
		try {

			Map<String, String> valideData = UnionpayUtil.resp2Map(request);
			if (!UnionpayUtil.validateResposon(valideData)) {
				LogUtil.writeLog("验证签名结果[失败].");
			} else {
				//验证成功
				orderType = updateOrder4Unionpay( valideData, request, response);
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		String redirectURL = "redirect:/order/list?orderType_="+orderType;
		if (Global.WHICH_APP.equals(type)) {
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
	public Object unionpayQuery(String orderSns, HttpServletRequest request, HttpServletResponse response) {
		String info = "银联支付，通过支付订单的订单号查询订单支付情况";
		setLogInfo(info);
		logger.error(info);

		Map<String, String> result = new HashMap<String,String>();
		result.put(STATUS,SUCCESS);
		result.put(MESSAGE,"查询成功");

		boolean paySuccess = false;
		try {
			// 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
			// 配送状态：unshipped）valideData.get("queryId"),
			List<Order> orderList = this.getOrderByOrderSns( orderSns );

			boolean flag = true;
			String mergeOrderSn = "";
			String payDate = "";

			if( orderList != null && orderList.size() > 0 ){
				for(Order order : orderList) {
					if( Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus())  && !Order.PaymentStatus.paid.equals(order.getPaymentStatus() )){
						flag = false;
						mergeOrderSn = order.getMergeOrderSn();

						Criteria criteria = new Criteria();
						criteria.add(Restrictions.eq("orderSn",order.getOrderSn()));
						criteria.add(Restrictions.eq("mergeOrderSn",orderSns));
						criteria.add(Restrictions.or(Restrictions.eq("name", "unionpay"),Restrictions.eq("sign", "unionpay")));
						criteria.add(Restrictions.order("createDate", "desc"));
						List<OrderPaylog> paylogs = orderPaylogService.getList(getParamMap(), criteria);
						if( paylogs != null && paylogs.size() > 0){
							payDate = DateUtils.dateToString(paylogs.get(0).getCreateDate(),"yyyyMMdd010000" );
						}
						break;
					}
				}
			}

			if(!flag && StringUtils.isNotEmpty( mergeOrderSn )){
				Map<String,String> respData = UnionpayUtil.queryOrder(mergeOrderSn, payDate, null);
				paySuccess = UnionpayUtil.validateResposon( respData );
				//respCode="00"且origRespCode="00"表示被查询交易成功。
				if (paySuccess && "00".equals( respData.get("origRespCode") )) {
					updateOrder4Unionpay( respData, request, response);
				}
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}
		return result;
	}

	private int updateOrder4Unionpay(Map<String, String> respData, HttpServletRequest request, HttpServletResponse response) throws  Exception{
		String mergeOrderSn = respData.get("orderId");
		String accNo = respData.get("accNo");
		String uniqueno = respData.get("queryId");
		String txnTime = respData.get("txnTime");

		/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu Start */
		String txnAmtStr = respData.get("txnAmt");
		Double txnAmt = Double.parseDouble(txnAmtStr);
		List<Map<String, Object>> orderAndPaylogs = judgePayAmount(mergeOrderSn, txnAmt );
		/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */
		if(orderAndPaylogs == null){
			return 0;
		}
		/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */
		return mergeOrderUpdateOrderAndPaylog(orderAndPaylogs, uniqueno, accNo, txnTime, request, response);
	}

	/**
	 * 回调时添加金额校验
	 * @param mergeOrderSn
	 * @param txnAmt
     * @return 返回NULL说明金额不对等
	 * 			不是 null  	key： paylog V：支付日志
	 * 						key： order  V：订单
     */
	private List<Map<String, Object>> judgePayAmount(String mergeOrderSn, Double txnAmt)  throws  Exception{
		List<Map<String, Object>> returnList = new ArrayList<Map<String, Object>>();

		double totalAmount = 0.0d;

		List<OrderPaylog> orderPaylogList = this.orderPaylogService.findList(getParamMap(), "mergeOrderSn", mergeOrderSn);
		if(orderPaylogList != null && orderPaylogList.size() > 0){
			for(OrderPaylog paylog : orderPaylogList){
				Map<String, Object> map = new HashMap<String, Object>();
				//更新订单状态
				Order order = this.orderService.find(getParamMap(),"orderSn", paylog.getOrderSn());
				totalAmount += order.getTotalAmount();

				map.put("paylog",paylog);
				map.put("order",order);
				returnList.add( map);
			}
		}

		totalAmount = totalAmount * 100d;

		if( txnAmt - totalAmount != 0){
			logger.error("Consolidated payment order ["+mergeOrderSn+"] totalAmount ("+ totalAmount +") != payAmount(" + txnAmt + ")");
			return null;
		}
		return returnList;
	}

	private int mergeOrderUpdateOrderAndPaylog(List<Map<String, Object>> orderAndPaylogs, String uniqueno,String accNo, String payDate, HttpServletRequest request, HttpServletResponse response) throws  Exception{
		int orderType = 0;
		if(orderAndPaylogs != null && orderAndPaylogs.size() > 0){
			for(Map<String, Object> map : orderAndPaylogs){
				//更新订单状态
				Order order = (Order)map.get("order");
				updateOrderStatusAndRedirect(order, request, response);
				orderType = order.getOrderType();

				//更新支付日志状态
				OrderPaylog paylog = (OrderPaylog) map.get("paylog");
				paylog.setNo( accNo );
				paylog.setUniqueno(uniqueno);
				paylog.setPayDate( payDate );
				paylog.setStatus("true");
				paylog.setInfo("支付成功");
				paylog.setModifyUser("system");
				paylog.setModifyDate(new Date());
				this.orderPaylogService.update(getParamMap(), paylog);
				if (order != null && Order.OrderStatus.wait_buyer_pay.equals(order.getOrderStatus()) && !Order.PaymentStatus.paid.equals(order.getPaymentStatus())) {
					//给商家发短信 TianYu 2016-04-27 08:43:46
					sendSMS(order.getOrderSn(), order.getShopId());
				}
			}
		}

		return orderType;
	}

	/**
	 * 更新订单状态并重定向到订单详细页
	 */
	private Order updateOrderStatusAndRedirect(Order order, HttpServletRequest request, HttpServletResponse response) {
		Order newOrder = null;
		try {
			// 1、先查看该订单状态是否已经更新成了wait_seller_send_goods; 支付状态：paid;
			// 配送状态：unshipped
			if (order != null && !order.getOrderStatus().equals(Order.OrderStatus.wait_seller_send_goods) && order.getOrderStatus().equals(Order.OrderStatus.wait_buyer_pay) && !order.getPaymentStatus().equals(Order.PaymentStatus.paid) && order.getPaymentStatus().equals(Order.PaymentStatus.unpaid)) {
				// 更新订单各种状态（订单状态：wait_seller_send_goods; 支付状态：paid;
				// 配送状态：unshipped）
				newOrder = orderService.orderPaidSuccess(getParamMap(), order.getOrderSn());

				/*
				 * 20160607 dzz
				 * 众筹订单, 解冻众筹订单冻结金额
				 * 计算公式:
				 * 可用金额 = 账户可用金额 + 解冻金额
				 * 冻结金额 = 冻结金额 - 需解冻金额
				 */
				if(order.getOrderType()!=null && !"".equals(order.getOrderType())) {
					if("1".equals(order.getOrderType())) { //众筹订单
						unlockAccountOfZhongChou(order.getOrderSn(), order, request, response);
					}
				}
			}
		} catch (Exception e) {
			logger.error("更新订单:" + order.getOrderSn() + "失败!");
		}

		return newOrder;
	}
	private String getShopUrl() throws Exception {
		String shopUrl = null;
		try {
            shopUrl = systemSetService.find(getParamMap(), "setkey", "becShopUrl").getSetvalue();
        } catch (Exception e) {
            e.printStackTrace();
			throw e;
        } finally {
            if (StringUtils.isEmpty(shopUrl)) {
                throw new Exception("获取系统配置[becShopUrl]失败，请检查系统配置项！");
            }
        }
		return shopUrl;
	}
	/**
	 * 20160607 dzz
	 * 众筹订单付款后解冻账户冻结金额
	 * @param orderNo
	 * @param request
	 * @param response
	 */
	private void unlockAccountOfZhongChou(String orderNo, Order order, HttpServletRequest request, HttpServletResponse response) {
		try {
			Criteria criteriaItem = new Criteria();
			criteriaItem.add(Restrictions.eq("orderSn", order.getOrderSn()));
			List<OrderItem> orderItemList = orderItemService.getList(getParamMap(), criteriaItem);
			//获取众筹商品信息
			Goods goods = goodsService.getZhongchouById(getParamMap(), orderItemList.get(0).getGoodsId());


			Buyer currentMember = getCurrentMember(request);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("tenantId", getTenantId());
			params.put("userId", currentMember.getId());
			params.put("userName", currentMember.getUserName());
			params.put("platform", getPlatform());

			//获取保证金账户
			Account acct = accountService.findAccountByUser(params);
			BigDecimal bond = new BigDecimal("0.0000"); //保证金
			//预付类型：0_不需要支付预付款,1_比例,2_金额
			if (goods.getPrepaymentType() == 0) {
				// 保证金为初始值, 不进行变化
			} else if (goods.getPrepaymentType() == 1) {
				bond = new BigDecimal(goods.getSuccessPrice())
						.multiply(new BigDecimal(orderItemList.get(0).getQuantity()))
						.multiply(new BigDecimal(goods.getPrepaymentRatio()))
						.divide(new BigDecimal("100"));
			} else if (goods.getPrepaymentType() == 2) {
				bond = new BigDecimal(goods.getPrepaymentRatio());
			} else {
				logger.error("更新众筹订单账户解冻:" + orderNo + "失败!");
			}

			/** 保证金 **/
			Map<String, Object> acctMap = new HashMap<String, Object>();
			acctMap.put("id", acct.getId());
			acctMap.put("accountBlock", bond);


			AccountLog accountLog = new AccountLog();
			accountLog.setAccountId(acct.getId());
			accountLog.setOrderSn(order.getOrderSn());
			accountLog.setPayMethod(2);//交易类型(0:充值 1:冻结 2：解冻 3：提现)
			accountLog.setAccount(bond.doubleValue());
			accountLog.setFeeAccount(0.0);//手续费
			accountLog.setOldAccountTotal(acct.getAccountTotal()); //账户金额(上次账户金额)
			accountLog.setOldAccountBlock(acct.getAccountBlock()); //冻结资金(上次冻结资金)
			accountLog.setStatus(1); // 状态（0：失败 1：成功）
			accountLog.setCreateDate(DateUtil.getCalendar().getTime());

			accountService.unblock(acctMap, acct, accountLog, true);
		} catch(Exception e) {
			logger.error("众筹订单账户解冻:" + orderNo + "失败!", e);
		}
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
					String msg = "采购单 " + orderSn + " 已支付成功，请您尽快发货！";
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

	//合并支付移动端开始-----------------------------------------------------------------------------------------------------------------------------------------

	/**
	 * 微信APP支付合并付款
	 * @param orderSns
	 * @param payType
	 * @param request
	 * @param response
     * @return
     */
	@RequestMapping(value = "/app/wxpay")
	public
	@ResponseBody
	Object appWXpay(String orderSns,String payType,HttpServletRequest request, HttpServletResponse response) {
		String info = "微信APP支付";
		setLogInfo(info);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(SUCCESS, Boolean.TRUE);
		result.put(MESSAGE, "微信统一下单成功");
		List<Order> orderList = null;
		OrderItem orderItem = null;
		Double total = 0d;
		try {

			Buyer member = getCurrentMember(request);
			String mergeOrderSn = OrderGenerator.generator();//合并订单号
			String shopUrl = getShopUrl();


			if (!StringUtils.isNotEmpty(orderSns)) {
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "订单不存在");
				return result;
			}

			orderList = this.getOrderByOrderSns( orderSns );

			if( orderList == null || orderList.size() == 0 ){
				result.put(STATUS, ERROR);
				result.put(MESSAGE, "订单不存在");
				return result;
			}

			for(Order order : orderList) {
				//计算累计金额
				total += order.getTotalAmount();
				OrderPaylog paylog = null;

				//更新合并订单号
				Order updateObj = new Order();
				updateObj.setId(order.getId());
				updateObj.setPayType(payType);
				updateObj.setMergeOrderSn( mergeOrderSn );
				updateObj.setModifyUser(getCurrentMember(request).getUserName());
				updateObj.setModifyDate(new Date());
				orderService.update(getParamMap(), updateObj);



				if( orderItem == null ) {
					List<OrderItem> orderItemList = orderItemService.findList(getParamMap(), "orderSn", order.getOrderSn());
					if (orderItemList != null && orderItemList.size() > 0) {
						orderItem = orderItemList.get(0);
					}
				}

				savePaylog(member,order, mergeOrderSn,"wxpay", "微信支付" );
			}


			String finalmoney = String.format("%.2f", total).replace(".", "");//金额转化为分为单位


			String nonceStr = WXUtil.getRandomStringByLength(16);
			UnifiedorderReqData unifiedorderReqData = new UnifiedorderReqData()
					.buildAppid(Configure.getAppid_app())
					.buildMch_id(Configure.getMchid_app())
					.buildNonce_str(nonceStr)
					.buildBody(mergeOrderSn)
					.buildOut_trade_no(mergeOrderSn)
					.buildFee_type(Configure.FEE_TYPE_CNY)
					.buildTotal_fee(Integer.valueOf(finalmoney).intValue())
					.buildSpbill_create_ip(getIpAddr(request))
					.buildNotify_url(shopUrl + "/payment/merge/unifieorder/notify")//异步通知接口
					.buildTrade_type(Configure.WX_TRADE_TYPE.APP.toString());
			logger.info("--------------------------------unifiedorderReqData-----------------------------------------");
			UnifiedorderResData unifiedorderResData = new UnifiedorderService().sendRequest(unifiedorderReqData);
			logger.info("--------------------------------UnifiedorderResData-----------------------------------------");
			if (unifiedorderReqData != null) {
				if (SUCCESS.equalsIgnoreCase(unifiedorderResData.getReturn_code())) {
					if (SUCCESS.equalsIgnoreCase(unifiedorderResData.getResult_code())) {
						result.put(DATA, unifiedorderResData);
					} else {
						result.put(SUCCESS, Boolean.FALSE);
						result.put(DATA, "微信统一下单失败: err_code: " + unifiedorderResData.getErr_code()
								+ ", err_msg: " + unifiedorderResData.getErr_code_des());
						return result;
					}
				} else {
					result.put(SUCCESS, Boolean.FALSE);
					result.put(DATA, "微信统一下单失败:" + unifiedorderResData.getReturn_msg());
					return result;
				}
			} else {
				result.put(SUCCESS, Boolean.FALSE);
				result.put(DATA, "微信统一下单失败");
				return result;
			}

			//设置待加密支付参数并加密gt
			Map<String, Object> paySignMap = new HashMap<String, Object>();
			paySignMap.put("appid", Configure.getAppid_app());
			paySignMap.put("noncestr", nonceStr);
			paySignMap.put("package", "Sign=WXPay");
			paySignMap.put("prepayid", unifiedorderResData.getPrepay_id());
			paySignMap.put("partnerid", Configure.getMchid_app());
			String timeStamp = new Date().getTime()/1000 + "";
			paySignMap.put("timestamp", timeStamp);
			String paySign = Signature.getSignForAPP(paySignMap);
			paySignMap.put("sign", paySign);
			logger.info("--------------------------------paySignMap-----------------------------------------");
			logger.info(JSON.toJSONString(paySignMap));
			result.put(DATA, JSON.toJSONString(paySignMap));
		} catch (Exception e) {
			result.put(SUCCESS, Boolean.FALSE);
			result.put(DATA, "微信统一下单失败q");
			logger.error(info + "时，发生异常", e);
		}
		return result;
	}

	/**
	 * 合并付款微信支付成功后异步通知接口
	 * @param request
	 * @param response
     * @return
     */
	@RequestMapping(value = "/unifieorder/notify")
	@ResponseBody
	public String wxpayNotify(HttpServletRequest request, HttpServletResponse response) {
		String info = "合并付款微信统一下单，异步通知接口";
		setLogInfo(info);
		logger.error(info);

		try {

			String resXml = WXUtil.streamToString(request.getInputStream());
			boolean isSignValid = Signature.checkIsSignValidFromResponseString(resXml);

			//如果微信收到商户的应答不是成功或超时，微信认为通知失败，微信会通过一定的策略定期重新发起通知
			//通知频率为15/15/30/180/1800/1800/1800/1800/3600，单位：秒
			//所以在对业务数据进行状态检查和处理之前，要采用数据锁进行并发控制，以避免函数重入造成的数据混乱。
			synchronized (lock) {
				if (isSignValid) {
					AsynNotifyReqData reqData = (AsynNotifyReqData) XStreamUtil.getObjectFromXML(resXml, AsynNotifyReqData.class);
					// 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
					// 配送状态：unshipped）valideData.get("queryId"),

					String mergeOrderSn = reqData.getOut_trade_no();
					String accNo = "";//支付账号
					String uniqueno = reqData.getTransaction_id();//支付流水号
					String txnTime = reqData.getTime_end();//支付时间

					/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu Start */
					String txnAmtStr = reqData.getCash_fee();
					Double txnAmt = Double.parseDouble(txnAmtStr);
					List<Map<String, Object>> orderAndPaylogs = judgePayAmount(mergeOrderSn, txnAmt );
					/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */
					if(orderAndPaylogs == null){
						AsynNotifyResData resData = new AsynNotifyResData();
						resData.buildReturn_code("FAIL").buildReturn_msg("支付金额验证失败");
						return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
					}
					/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */

					mergeOrderUpdateOrderAndPaylog(orderAndPaylogs, uniqueno, accNo, txnTime, request, response);

				} else {
					AsynNotifyResData resData = new AsynNotifyResData();
					resData.buildReturn_code("FAIL")
							.buildReturn_msg("签名验证失败");
					return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
				}
			}

		} catch (Exception e) {
			logger.error(info + "时，发生异常", e);
		}

		AsynNotifyResData resData = new AsynNotifyResData();
		resData.buildReturn_code("FAIL");
		return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
	}

	/**
	 * 合并付款支付宝APP支付
	 * @param request
	 * @param response
     * @return
     */
	@RequestMapping(value = "/app/alipay")
	public
	@ResponseBody
	Object appAlipay(HttpServletRequest request, HttpServletResponse response) {
		String info = "支付宝APP支付";
		setLogInfo(info);
		Map map = new HashMap();
		List<Order> orderList = null;
		OrderItem orderItem = null;
		Double total = 0d;
		try {
			Buyer member = getCurrentMember(request);
			String mergeOrderSn = OrderGenerator.generator();//合并订单号
			String becShopUrl = getShopUrl();
			String orderSns = request.getParameter("orderSns");

			if (!StringUtils.isNotEmpty(orderSns)) {
				map.put(STATUS, ERROR);
				map.put(MESSAGE, "订单不存在");
				return map;
			}

			orderList = this.getOrderByOrderSns( orderSns );

			if( orderList == null || orderList.size() == 0 ){
				map.put(STATUS, ERROR);
				map.put(MESSAGE, "订单不存在");
				return map;
			}

			for(Order order : orderList) {
				//计算累计金额
				total += order.getTotalAmount();
				OrderPaylog paylog = null;

				//更新合并订单号
				Order updateObj = new Order();
				updateObj.setId(order.getId());
				updateObj.setPayType("alipay");
				updateObj.setMergeOrderSn( mergeOrderSn );
				updateObj.setModifyUser(getCurrentMember(request).getUserName());
				updateObj.setModifyDate(new Date());
				orderService.update(getParamMap(), updateObj);



				if( orderItem == null ) {
					List<OrderItem> orderItemList = orderItemService.findList(getParamMap(), "orderSn", order.getOrderSn());
					if (orderItemList != null && orderItemList.size() > 0) {
						orderItem = orderItemList.get(0);
					}
				}

				savePaylog(member,order, mergeOrderSn,"wxpay", "微信支付" );
			}

			String notify_url = becShopUrl+"payment/merge/alipayAsynchronous";// 服务器异步通知页面路径
			String return_url = becShopUrl+"payment/merge/alipay";		// 页面跳转同步通知页面路径


			//金额转化为分为单位
			String orderInfo = AlipayCore.getOrderInfo(orderSns,orderSns, orderSns, total+"", notify_url, return_url);

			String sign = AlipayCore.sign(orderInfo, AlipayConfig.private_key);
			// 仅需对sign 做URL编码
			sign = URLEncoder.encode(sign, "UTF-8");

			String linkString = orderInfo + "&sign=\"" + sign + "\"&" + AlipayCore.getSignType();
			logger.error("支付宝APP支付，订单签名结果---->linkString-->linkString:"+linkString);
			map.put("success",Boolean.TRUE);
			map.put("data",linkString);

		} catch (Exception e) {
			map.put("success",Boolean.FALSE);
			map.put("data",e);
			logger.error(info + "时，发生异常", e);
		}
		return map;
	}


	/**
	 * 合并付款支付宝支付 支付成功之后-->后台通知处理，异步通知
	 */
	@RequestMapping("alipayAsynchronous")
	@ResponseBody
	public String alipayAsynchronous(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String out_trade_no=request.getParameter("out_trade_no");//获取支付宝返回的合并订单编号
		String trade_no=request.getParameter("trade_no");//支付宝交易号
		String buyer_email=request.getParameter("buyer_email");//买家支付宝账号
		String gmt_payment=request.getParameter("gmt_payment");//交易付款时间
		String info = "支付宝支付，支付成功之后。异步通知，处理支付宝返回的支付结果";
		setLogInfo(info);
		logger.error(info);
		Boolean paySuccess=false;
		if (AlipayNotify.verify(getParamsReback(request.getParameterMap()))) {
			paySuccess=true;

			String mergeOrderSn = out_trade_no;
			String accNo = buyer_email;//支付账号
			String uniqueno = trade_no;//支付流水号
			String txnTime = gmt_payment;//支付时间

			/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu Start */
			String txnAmtStr = request.getParameter("total_fee");
			Double txnAmt = Double.parseDouble(txnAmtStr);
			List<Map<String, Object>> orderAndPaylogs = judgePayAmount(mergeOrderSn, txnAmt );
			/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */
			if(orderAndPaylogs == null){
				return ajaxText("false", response);
			}
			/** 回调时添加金额校验  2016-08-30 14:20:22 TianYu End */

			mergeOrderUpdateOrderAndPaylog(orderAndPaylogs, uniqueno, accNo, txnTime, request, response);
		}else{
			paySuccess=false;
		}
		return ajaxText("" + paySuccess, response);
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
	 * 合并付款银联
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
     */
		@RequestMapping(value = "/app/unionpay")
	public
	@ResponseBody
	Object appUnionpay(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String info = "银联APP支付";
		setLogInfo(info);
		Map map = new HashMap();
		List<Order> orderList = null;
		OrderItem orderItem = null;
		Double total = 0d;
		try {

			Buyer member = getCurrentMember(request);
			String mergeOrderSn = OrderGenerator.generator();//合并订单号
			String becShopUrl = getShopUrl();
			String orderSns = request.getParameter("orderSns");

			if (!StringUtils.isNotEmpty(orderSns)) {
				map.put(STATUS, ERROR);
				map.put(MESSAGE, "订单不存在");
				return map;
			}

			orderList = this.getOrderByOrderSns( orderSns );

			if( orderList == null || orderList.size() == 0 ){
				map.put(STATUS, ERROR);
				map.put(MESSAGE, "订单不存在");
				return map;
			}

			for(Order order : orderList) {
				//计算累计金额
				total += order.getTotalAmount();
				OrderPaylog paylog = null;

				//更新合并订单号
				Order updateObj = new Order();
				updateObj.setId(order.getId());
				updateObj.setPayType("alipay");
				updateObj.setMergeOrderSn( mergeOrderSn );
				updateObj.setModifyUser(getCurrentMember(request).getUserName());
				updateObj.setModifyDate(new Date());
				orderService.update(getParamMap(), updateObj);



				if( orderItem == null ) {
					List<OrderItem> orderItemList = orderItemService.findList(getParamMap(), "orderSn", order.getOrderSn());
					if (orderItemList != null && orderItemList.size() > 0) {
						orderItem = orderItemList.get(0);
					}
				}

				savePaylog(member,order, mergeOrderSn,"wxpay", "微信支付" );
			}


			String shopUrl = getShopUrl();
			String frontUrl = shopUrl + "/html/paysuccess.html";// 页面通知地址
			String backUrl = shopUrl + "payment/unionpayBack?whichclient=whichapp";// 后台通知地址
			// 构造订单请求对象，生成signMsg。
			com.unionpay.acp.RequestOrder requestOrder = new com.unionpay.acp.RequestOrder();
			requestOrder.setFrontUrl(frontUrl);
			requestOrder.setBackUrl(backUrl);
			requestOrder.setOrderId(mergeOrderSn);//采用PayLog.ID
			requestOrder.setTxnAmt( Math.round(total * 100) + "" );
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

		} catch (Exception e) {
			map.put(SUCCESS,Boolean.FALSE);
			map.put(DATA,e);
			logger.error(info + "时，发生异常", e);
		}
		return map;

	}


	//合并支付移动端结束-----------------------------------------------------------------------------------------------------------------------------------------
	@RequestMapping(value = "offlinePay")
	public String offlinePay(String orderSns, Model model, HttpServletRequest request) {
		String info = "订单[" + orderSns + "]支付凭证上传";
		String type = request.getParameter(Global.WHICHCLIENT);
		String voucherType = request.getParameter("voucherType");
		if( !StringUtil.isNotEmpty(voucherType) ){
			voucherType = "order";
		}
		setLogInfo(info);
		logger.debug(info);
		try {
			if( !StringUtils.isNotEmpty(orderSns) ){
				return "redirect:/order/list";
			}
			List<Order> orderList = getOrderByOrderSns(orderSns);
			Order order = new Order();
			if( orderList == null || orderList.size() == 0 ){
				return "redirect:/order/list";
			}else{
				order = orderList.get(0);
				model.addAttribute("order", order);
				List<OrderOfflinepayVoucher> list = orderOfflinepayVoucherService.findListByOrderSn(getParamMap(), "orderSn",order.getOrderSn());
				if(list.size()>0){
					String imgSrvAddr = UploadTools.getImageServerAddress();

					model.addAttribute("imgSrvAddr",imgSrvAddr);
                    OrderOfflinepayVoucher depositOOV = null;
                    OrderOfflinepayVoucher orderOOV = null;
                    for(OrderOfflinepayVoucher oov : list){
                        if( oov.getVoucherType().equals( OrderOfflinepayVoucher.VoucherType.deposit ) ){
                            depositOOV = oov;
                        }else if( oov.getVoucherType().equals( OrderOfflinepayVoucher.VoucherType.order ) ){
                            orderOOV = oov;
                        }
                    }

                    if( Order.OrderStatus.wait_buyer_pay_deposit.equals( order.getOrderStatus() )){
                    	if(depositOOV == null){
							model.addAttribute("isUpdate","false");
						}else{
							model.addAttribute("isUpdate","true");
						}
                        model.addAttribute("orderOfflinepayVoucher", depositOOV);
                    }else if(Order.OrderStatus.wait_buyer_pay.equals( order.getOrderStatus() )){
						if(orderOOV == null){
							model.addAttribute("isUpdate","false");
						}else{
							model.addAttribute("isUpdate","true");
						}
                        model.addAttribute("orderOfflinepayVoucher", orderOOV);
                    }

				}else{
					model.addAttribute("isUpdate","false");
				}
                model.addAttribute("voucherType",voucherType);
			}
		} catch (Exception e) {
			logger.error(info + "前，核对订单信息时，发生异常", e);
			e.printStackTrace();
		}
		if (Global.WHICH_APP.equals(type)) {
			return Global.TEMPLATE_APP + PATH + "/member/offlinePay_payment";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/offlinePay_payment";
		}
	}
	//上传凭证
	@RequestMapping(value = "saveOrUpdateOfflinePay")
	public String saveOrUpdateOfflinePay(String orderSn,String isUpdate, String orderOfflinepayVoucherId,Model model, HttpServletRequest request) {
		String info = "订单[" + orderSn + "]支付凭证录入";
		Map<String, Object> result = new HashMap<String, Object>();
		setLogInfo(info);
		logger.debug(info);
		try {

			if( !StringUtils.isNotEmpty(orderSn) ){
				return "redirect:/order/list";
			}
			List<Order> orderList = getOrderByOrderSns(orderSn);
			if( orderList == null || orderList.size() == 0 ){
				return "redirect:/order/list";
			}else{
				Order order = orderList.get(0);
				model.addAttribute("order", order);
			}

			OrderOfflinepayVoucher orderOfflinepayVoucher = new OrderOfflinepayVoucher();
			List<String[]> imagelist = UploadTools.upload(request);
			if(imagelist.size()>0){
				String results[] = imagelist.get(0);
				orderOfflinepayVoucher.setVoucherPic1(results[0] + "/" + results[1]);
				if(imagelist.size() >= 2) {
					String results1[] = imagelist.get(1);
					orderOfflinepayVoucher.setVoucherPic2(results1[0] + "/" + results1[1]);
				}
				if(imagelist.size() >= 3) {
					String results2[] = imagelist.get(2);
					orderOfflinepayVoucher.setVoucherPic3(results2[0] + "/" + results2[1]);
				}
				Buyer currentMember = getCurrentMember(request);
				if(isUpdate.equals("true")){
					orderOfflinepayVoucher.setId(orderOfflinepayVoucherId);
					orderOfflinepayVoucher.setModifyUser(currentMember.getId());
					orderOfflinepayVoucher.setModifyDate(new Date());
					orderOfflinepayVoucherService.update(getParamMap(), orderOfflinepayVoucher);
					model.addAttribute(STATUS, SUCCESS);
					model.addAttribute("MESSAGE", "更新成功,请等待管理员审核！");
					logger.info("订单[" + orderSn + "]支付凭证更新成功,请等待管理员审核！");
				}else {
					orderOfflinepayVoucher.setOrderSn(orderSn);
                    String voucherType = request.getParameter("voucherType");
                    if(!StringUtil.isNotEmpty(voucherType)){
                        voucherType = "order";
                    }
                    orderOfflinepayVoucher.setVoucherType( OrderOfflinepayVoucher.VoucherType.valueOf(voucherType) );
					orderOfflinepayVoucher.setCreateUser(currentMember.getId());
					orderOfflinepayVoucher.setCreateDate(new Date());
					orderOfflinepayVoucherService.save(getParamMap(), orderOfflinepayVoucher);
					model.addAttribute(STATUS, SUCCESS);
					model.addAttribute("MESSAGE", "上传成功,请等待管理员审核！");
					logger.info("订单[" + orderSn + "]支付凭证上传成功,请等待管理员审核！");
				}

			}
		}catch(Exception ex){
			logger.error("订单[" + orderSn + "]支付凭证上传失败");
			logger.error(info + "时，发生异常", ex);
			model.addAttribute(STATUS, ERROR);
			model.addAttribute("MESSAGE", "上传失败，请重新上传或联系管理员！");
		}

		return Global.TEMPLATE_MALL + PATH + "/member/offlinePay_payment_success";

	}
	//上传凭证APP
	@RequestMapping(value = "addOfflinePayApp")
	public String addOfflinePayApp(String orderSn, String orderOfflinepayVoucherId,Model model, HttpServletRequest request) {
		String info = "订单[" + orderSn + "]支付凭证录入";
		Map<String, Object> result = new HashMap<String, Object>();
		setLogInfo(info);
		logger.debug(info);
		try {

			if( !StringUtils.isNotEmpty(orderSn) ){
				return "redirect:/order/list";
			}
			List<Order> orderList = getOrderByOrderSns(orderSn);
			if( orderList == null || orderList.size() == 0 ){
				return "redirect:/order/list";
			}else{
				Order order = orderList.get(0);
				model.addAttribute("order", order);
			}
			String uploadfile1=request.getParameter("uploadfile1");
			String uploadfile2=request.getParameter("uploadfile2");
			String uploadfile3=request.getParameter("uploadfile3");

			OrderOfflinepayVoucher orderOfflinepayVoucher = new OrderOfflinepayVoucher();
			if(uploadfile1!="")
			orderOfflinepayVoucher.setVoucherPic1(uploadfile1);
			if(uploadfile2!="")
			orderOfflinepayVoucher.setVoucherPic2(uploadfile2);
			if(uploadfile3!="")
				orderOfflinepayVoucher.setVoucherPic3(uploadfile3);

			Buyer currentMember = getCurrentMember(request);
			if(!orderOfflinepayVoucherId.equals("-1")){
				orderOfflinepayVoucher.setId(orderOfflinepayVoucherId);
				orderOfflinepayVoucher.setModifyUser(currentMember.getId());
				orderOfflinepayVoucher.setModifyDate(new Date());
				orderOfflinepayVoucherService.update(getParamMap(), orderOfflinepayVoucher);
				model.addAttribute(STATUS, SUCCESS);
				model.addAttribute("MESSAGE", "更新成功,请等待管理员审核！");
				logger.info("订单[" + orderSn + "]支付凭证更新成功,请等待管理员审核！");
			}else {
				orderOfflinepayVoucher.setOrderSn(orderSn);
				String voucherType = request.getParameter("voucherType");
				if(!StringUtil.isNotEmpty(voucherType)){
					voucherType = "order";
				}
				orderOfflinepayVoucher.setVoucherType( OrderOfflinepayVoucher.VoucherType.valueOf(voucherType) );

				orderOfflinepayVoucher.setCreateUser(currentMember.getId());
				orderOfflinepayVoucher.setCreateDate(new Date());
				orderOfflinepayVoucherService.save(getParamMap(), orderOfflinepayVoucher);
				model.addAttribute(STATUS, SUCCESS);
				model.addAttribute("MESSAGE", "上传成功,请等待管理员审核！");
				logger.info("订单[" + orderSn + "]支付凭证上传成功,请等待管理员审核！");
			}
		}catch(Exception ex){
			logger.error("订单[" + orderSn + "]支付凭证上传失败");
			logger.error(info + "时，发生异常", ex);
			model.addAttribute(STATUS, ERROR);
			model.addAttribute("MESSAGE", "上传失败，请重新上传或联系管理员！");
		}
		return Global.TEMPLATE_APP + PATH + "/member/offlinePay_payment_success";
	}

	//查询凭证
	@ResponseBody
	@RequestMapping(value = "findOfflinePayByOrderSn")
	public Object findOfflinePayByOrderSn(String orderSn, Model model, HttpServletRequest request) {
		String info = "订单[" + orderSn + "]支付凭证查询";
		Map<String, Object> result = new HashMap<String, Object>();
		setLogInfo(info);
		logger.debug(info);
		try {
			String imgSrvAddr = UploadTools.getImageServerAddress();
			List<OrderOfflinepayVoucher> list=orderOfflinepayVoucherService.findListByOrderSn(getParamMap(),"orderSn",orderSn);
			if(list.size()>0) {
				result.put("status",true);
				result.put("data",list);
				result.put("imgSrvAddr",imgSrvAddr);
			}else{
				result.put("status",false);
			}
		}catch(Exception ex){
			result.put("status",false);
			logger.error(info + "时，发生异常", ex);
		}
		return result;
	}
}
