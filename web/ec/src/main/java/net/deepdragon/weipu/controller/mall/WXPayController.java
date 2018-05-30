package net.deepdragon.weipu.controller.mall;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.weixin.common.Configure;
import com.weixin.common.Signature;
import com.weixin.common.WXUtil;
import com.weixin.common.XStreamUtil;
import com.weixin.protocol.AsynNotifyReqData;
import com.weixin.protocol.AsynNotifyResData;
import com.weixin.protocol.UnifiedorderReqData;
import com.weixin.protocol.UnifiedorderResData;
import com.weixin.service.UnifiedorderService;
import net.deepdragon.entity.weipu.Member;
import net.deepdragon.entity.weipu.Merchant;
import net.deepdragon.entity.weipu.Order;
import net.deepdragon.entity.weipu.OrderPaylog;
import net.deepdragon.service.SystemSetService;
import net.deepdragon.service.weipu.MerchantService;
import net.deepdragon.service.weipu.OrderPaylogService;
import net.deepdragon.service.weipu.OrderService;
import net.deepdragon.service.weipu.SMSLogService;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.tools.PropertiesUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * 微信支付
 */
@Controller(Global.APP_SIGN + Global.MALL + "WXPayController")
@RequestMapping(Global.MALL_PATH + "/payment")
public class WXPayController extends BaseMallController {
    protected Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private OrderService orderService;

    @Resource
    private OrderPaylogService orderPaylogService;

    @Resource
    private SystemSetService systemSetService;
    @Resource
    private MerchantService shopService;
    @Resource
    private SMSLogService smsLogService;
    private static Object lock = new Object();
    /**
     * 微信支付方法[手机微信支付]
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "wxprepay")
    public
    @ResponseBody
    Object wxprepay(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String info = "微信统一下单";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "微信统一下单成功");
        try {
            //获取当前对象
            Member member = getCurrentMember(request);

            String open_id = member.getOpenId();
            String orderNo = request.getParameter("orderNo");
            if (StringUtil.isEmpty(orderNo)) {
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "订单编号不能为空");
                return result;
            }
            String total_fee = request.getParameter("money");
            if (StringUtil.isEmpty(total_fee)) {
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "订单金额不能为空");
                return result;
            }
            Order order = orderService.find(getParamMap(), "orderSn", orderNo);
            if( order == null){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "订单不存在");
                return result;
            }


            String finalmoney = String.format("%.2f", order.getTotalAmount()).replace(".", "");//金额转化为分为单位

            String shopUrl = getShopUrl();
            if( shopUrl == null){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "获取系统配置[shopUrl]失败，请检查系统配置项！");
                return result;
            }

            UnifiedorderReqData unifiedorderReqData = new UnifiedorderReqData()
                    .buildAppid(Configure.getAppid())
                    .buildMch_id(Configure.getMchID())
                    .buildNonce_str(WXUtil.getRandomStringByLength(32))
                    .buildBody(orderNo)
                    .buildOut_trade_no(orderNo)
                    .buildFee_type(Configure.FEE_TYPE_CNY)
                    .buildTotal_fee(Integer.valueOf(finalmoney).intValue())
                    .buildSpbill_create_ip(getIpAddr(request))
                    .buildNotify_url(shopUrl + "/payment/unifieorder/notify")
                    .buildTrade_type(Configure.WX_TRADE_TYPE.JSAPI.toString())
                    .buildOpenid(open_id);
            logger.info("--------------------------------unifiedorderReqData-----------------------------------------");
            UnifiedorderResData unifiedorderResData = new UnifiedorderService().sendRequestN(unifiedorderReqData);
            if (unifiedorderReqData != null) {
                logger.info("--------------------------------unifiedorderResData-----------------------------------------");
                logger.info(unifiedorderResData.toString());
                if (SUCCESS.toUpperCase().equals(unifiedorderResData.getReturn_code())) {
                    if (SUCCESS.toUpperCase().equals(unifiedorderResData.getResult_code())) {
                        Map<String, Object> signMap = new HashMap<String, Object>();
                        signMap.put("appId", Configure.getAppid());
                        signMap.put("timeStamp", (System.currentTimeMillis() / 1000) + "");
                        signMap.put("nonceStr", WXUtil.getRandomStringByLength(32));

                        signMap.put("package", "prepay_id=" + unifiedorderResData.getPrepay_id());
                        signMap.put("signType", "MD5");
                        String paySign = Signature.getSignForJSAPI(signMap);
                        signMap.put("paySign", paySign);
                        logger.info("--------------------------------paySign-----------------------------------------");
                        logger.info(paySign);
                        result.put(DATA, signMap);
                    } else {
                        result.put(STATUS, ERROR);
                        result.put(MESSAGE, info + "失败: err_code: " + unifiedorderResData.getErr_code()
                                + ", err_msg: " + unifiedorderResData.getErr_code_des());
                    }
                } else {
                    result.put(STATUS, ERROR);
                    result.put(MESSAGE, info + "失败:" + unifiedorderResData.getReturn_msg());
                }
            } else {
                result.put(STATUS, ERROR);
                result.put(MESSAGE, info + "失败,连接微信支付服务器失败，请重试！");
            }
        } catch (Exception e) {
            result.put(STATUS, ERROR);
            result.put(MESSAGE, info + "失败:" + e.getMessage());
            logger.error(info + "时，发生异常", e);
        }
        return result;

    }

    @RequestMapping(value = "/unifieorder/notify")
    @ResponseBody
    public String wxpayNotify(HttpServletRequest request, HttpServletResponse response) {
        String info = "微信统一下单，异步通知接口";
        setLogInfo(info);
        logger.error(info);

        try {

            String resXml = WXUtil.streamToString(request.getInputStream());
            boolean isSignValid = Signature.checkIsSignValidFromResponseString(resXml);
            logger.error("resXml----------->"+resXml);
            //如果微信收到商户的应答不是成功或超时，微信认为通知失败，微信会通过一定的策略定期重新发起通知
            //通知频率为15/15/30/180/1800/1800/1800/1800/3600，单位：秒
            //所以在对业务数据进行状态检查和处理之前，要采用数据锁进行并发控制，以避免函数重入造成的数据混乱。
            synchronized (lock) {
                if (isSignValid) {
                    logger.error("isSignValid------------->"+isSignValid);
                    AsynNotifyReqData reqData = (AsynNotifyReqData) XStreamUtil.getObjectFromXML(resXml, AsynNotifyReqData.class);
                    logger.error("reqData------------->"+ JSONObject.toJSONString(reqData));
                    // 商户订单处理（订单状态：wait_seller_send_goods; 支付状态：paid;
                    // 配送状态：unshipped）valideData.get("queryId"),
                    Order order = orderService.find(getParamMap(), "orderSn", reqData.getOut_trade_no());
                    if (order != null) {
                        if (!Order.PaymentStatus.paid.toString().equals(order.getPaymentStatus())) {
                            logger.error("微信支付异步通知接口返回参数验证----->XXXX:reqData.getTotal_fee():"+reqData.getTotal_fee()+"order.getTotalAmount():"+order.getTotalAmount()+"-->");
                            if(reqData.getTotal_fee()!=null && StringUtil.toFloat(reqData.getTotal_fee())-StringUtil.toFloat(order.getTotalAmount()+"")*100==0){
                                updateOrderStatusAndRedirect(reqData.getOut_trade_no(), request, response);


                                //保存之前先删除其它的支付记录
                                List<OrderPaylog> paylogs = this.orderPaylogService.findList(getParamMap(), "orderSn", order.getOrderSn());
                                if( paylogs != null && paylogs.size() > 0 ){
                                    for(OrderPaylog orderPaylog : paylogs){
                                        orderPaylog.setIsDetele("Y");
                                        orderPaylog.setModifyUser( "system" );

                                        this.orderPaylogService.update(getParamMap(), orderPaylog);
                                    }
                                }

                                //组装订单支付记录
                                OrderPaylog paylog = this.buildOrderPaylog(order, reqData, "支付成功");

                                //保存订单支付记录
                                this.orderPaylogService.save(getParamMap(), paylog);
                                setLogInfo("订单【" + reqData.getOut_trade_no() + "】支付成功");
                                logger.error("订单【" + reqData.getOut_trade_no() + "】支付成功");

                                //给商家发短信 Liu xiao bing 2016-04-27 08:43:46
                                sendSMS(order.getOrderSn(), order.getShopId());

                                AsynNotifyResData resData = new AsynNotifyResData();
                                resData.buildReturn_code("SUCCESS");
                                return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
                            }else{
                                logger.error("微信支付，支付成功之后。异步通知，处理微信返回的支付结果:支付的金额和订单的金额不一致orderSn:" + reqData.getOut_trade_no()+"支付金额："+reqData.getCash_fee()+"订单金额："+order.getTotalAmount());
                            }

                        } else {
                            AsynNotifyResData resData = new AsynNotifyResData();
                            resData.buildReturn_code("SUCCESS");
                            return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
                        }

                    } else {
                        AsynNotifyResData resData = new AsynNotifyResData();
                        resData.buildReturn_code("FAIL")
                                .buildReturn_msg("该订单[" + reqData.getOut_trade_no() + "]不存在");

                        return ajaxText(XStreamUtil.objectToXml(resData, new Class[]{AsynNotifyResData.class}), response);
                    }

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

    private OrderPaylog buildOrderPaylog(Order order, AsynNotifyReqData reqData, String info) {
        OrderPaylog paylog = new OrderPaylog();
        paylog.setTenantId(order.getTenantId());
        paylog.setMemberId(order.getMemberId());
        paylog.setOrderSn(reqData.getOut_trade_no());
        paylog.setNo(reqData.getOpenid());
         String name;
        if(Configure.WX_TRADE_TYPE.JSAPI.toString().equalsIgnoreCase(reqData.getTrade_type())){
            paylog.setSign(OrderPaylog.SIGN_WXPAY_JSAPI);
            name = "微信公众号支付";
        }else if(Configure.WX_TRADE_TYPE.APP.toString().equalsIgnoreCase(reqData.getTrade_type())){
            paylog.setSign(OrderPaylog.SIGN_WXPAY_APP);
            name = "微信APP支付";
        }else if(Configure.WX_TRADE_TYPE.NATIVE.toString().equalsIgnoreCase(reqData.getTrade_type())){
            paylog.setSign(OrderPaylog.SIGN_WXPAY_NATIVE);
            name = "微信扫码支付";
        }else{
            paylog.setSign(OrderPaylog.SIGN_WXPAY_JSAPI);
            name = "微信公众号支付";
        }

        paylog.setName(name);
        paylog.setUniqueno(reqData.getTransaction_id());
        paylog.setAmount(Double.valueOf(reqData.getTotal_fee()) / 100.0);
        paylog.setPayDate(reqData.getTime_end());//yyyyMMddHHmmss
        paylog.setStatus("true");
        paylog.setInfo(info);
        paylog.setCreateUser("system");
        paylog.setCreateDate(new Date());
        return paylog;
    }
    private void buildOrderPaylog(OrderPaylog paylog,AsynNotifyReqData reqData, String info) {

        paylog.setNo(reqData.getOpenid());
        String name;
        if(Configure.WX_TRADE_TYPE.JSAPI.toString().equalsIgnoreCase(reqData.getTrade_type())){
            paylog.setSign(OrderPaylog.SIGN_WXPAY_JSAPI);
            name = "微信公众号支付";
        }else if(Configure.WX_TRADE_TYPE.APP.toString().equalsIgnoreCase(reqData.getTrade_type())){
            paylog.setSign(OrderPaylog.SIGN_WXPAY_APP);
            name = "微信APP支付";
        }else if(Configure.WX_TRADE_TYPE.NATIVE.toString().equalsIgnoreCase(reqData.getTrade_type())){
            paylog.setSign(OrderPaylog.SIGN_WXPAY_NATIVE);
            name = "微信扫码支付";
        }else{
            paylog.setSign(OrderPaylog.SIGN_WXPAY_JSAPI);
            name = "微信公众号支付";
        }

        paylog.setName(name);
        paylog.setUniqueno(reqData.getTransaction_id());
        paylog.setPayDate(reqData.getTime_end());//yyyyMMddHHmmss
        paylog.setStatus("true");
        paylog.setInfo(info);
        paylog.setModifyDate(new Date());
        paylog.setModifyUser("system");

    }

    private String getShopUrl(){
        try {
            String shopUrl = systemSetService.find(getParamMap(), "setkey", "shopUrl").getSetvalue();
            return shopUrl;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    @RequestMapping(value = "/app/wxpay")
    public
    @ResponseBody
    Object appWXpay(HttpServletRequest request, HttpServletResponse response) {
        String info = "微信APP支付";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(SUCCESS, Boolean.TRUE);
        result.put(MESSAGE, "微信统一下单成功");
        try {

            Member member = getCurrentMember(request);

            String open_id = member.getOpenId();

            String shopUrl = getShopUrl();
            if( shopUrl == null){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "获取系统配置[shopUrl]失败，请检查系统配置项！");
                return result;
            }
            String orderSn = request.getParameter("orderSn");
            if (StringUtil.isEmpty(orderSn)) {
                result.put(SUCCESS, Boolean.FALSE);
                result.put(DATA, "订单编号不能为空");
                return result;
            }
            String total_fee = request.getParameter("total");
            if (StringUtil.isEmpty(total_fee)) {
                result.put(SUCCESS, Boolean.FALSE);
                result.put(DATA, "订单金额不能为空");
                return result;
            }
            Order order = orderService.find(getParamMap(), "orderSn", orderSn);
            if( order == null){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "订单不存在");
                return result;
            }


            String finalmoney = String.format("%.2f", order.getTotalAmount()).replace(".", "");//金额转化为分为单位


            String nonceStr = WXUtil.getRandomStringByLength(16);
            UnifiedorderReqData unifiedorderReqData = new UnifiedorderReqData()
                    .buildAppid(Configure.getAppid_app())
                    .buildMch_id(Configure.getMchid_app())
                    .buildNonce_str(nonceStr)
                    .buildBody(orderSn)
                    .buildOut_trade_no(orderSn)
                    .buildFee_type(Configure.FEE_TYPE_CNY)
                    .buildTotal_fee(Integer.valueOf(finalmoney).intValue())
                    .buildSpbill_create_ip(getIpAddr(request))
                    .buildNotify_url(shopUrl + "/payment/unifieorder/notify")
                    .buildTrade_type(Configure.WX_TRADE_TYPE.APP.toString());
            logger.info("--------------------------------unifiedorderReqData-----------------------------------------");
            UnifiedorderResData unifiedorderResData = new UnifiedorderService().sendRequestN(unifiedorderReqData);
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
     * 微信支付方法[PC扫码支付]
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "wxQRCodePay")
    public
    @ResponseBody
    Object wxQRCodePay(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String info = "微信统一下单";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "微信统一下单成功");
        System.out.println("*********************************"+Configure.getKey_app()+"*********************************");
        try {
            //获取当前对象
            Member member = getCurrentMember(request);
            String open_id = member.getOpenId();
            String orderNo = request.getParameter("orderNo");
            if (StringUtil.isEmpty(orderNo)) {
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "订单编号不能为空");
                return result;
            }
            String total_fee = request.getParameter("money");
            if (StringUtil.isEmpty(total_fee)) {
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "订单金额不能为空");
                return result;
            }

            orderNo=orderNo.split(",")[0];


            Order order = orderService.find(getParamMap(), "orderSn", orderNo);
            if( order == null){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "订单不存在");
                return result;
            }


            String finalmoney = String.format("%.2f", order.getTotalAmount()).replace(".", "");//金额转化为分为单位

            String shopUrl = getShopUrl();
            if( shopUrl == null){
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "获取系统配置[shopUrl]失败，请检查系统配置项！");
                return result;
            }
            UnifiedorderReqData unifiedorderReqData = new UnifiedorderReqData()
                    .buildAppid(Configure.getAppid())
                    .buildMch_id(Configure.getMchID())
                    .buildNonce_str(WXUtil.getRandomStringByLength(32))
                    .buildBody(orderNo)
                    .buildOut_trade_no(orderNo)
                    .buildFee_type(Configure.FEE_TYPE_CNY)
                    .buildTotal_fee(Integer.valueOf(finalmoney).intValue())
                    .buildSpbill_create_ip(getIpAddr(request))
                    .buildNotify_url(shopUrl + "/payment/unifieorder/notify")
                    .buildTrade_type(Configure.TRADE_TYPE_NATIVE);//微信扫码支付
                    //.buildOpenid(open_id);
            logger.info("--------------------------------unifiedorderReqData-----------------------------------------");
            UnifiedorderResData unifiedorderResData = new UnifiedorderService().sendRequest(unifiedorderReqData);
            if (unifiedorderReqData != null) {
                logger.info("--------------------------------unifiedorderResData-----------------------------------------");
                logger.info(unifiedorderResData.toString());
                if (SUCCESS.toUpperCase().equals(unifiedorderResData.getReturn_code())) {
                    if (SUCCESS.toUpperCase().equals(unifiedorderResData.getResult_code())) {
                        logger.info("code_url----->"+unifiedorderResData.getCode_url());
                        result.put(STATUS, SUCCESS);
                        result.put(DATA, unifiedorderResData.getCode_url());
                    } else {
                        result.put(STATUS, ERROR);
                        result.put(MESSAGE, info + "失败: err_code: " + unifiedorderResData.getErr_code()
                                + ", err_msg: " + unifiedorderResData.getErr_code_des());
                    }
                } else {
                    result.put(STATUS, ERROR);
                    result.put(MESSAGE, info + "失败:" + unifiedorderResData.getReturn_msg());
                }
            } else {
                result.put(STATUS, ERROR);
                result.put(MESSAGE, info + "失败");
            }
        } catch (Exception e) {
            result.put(STATUS, ERROR);
            result.put(MESSAGE, info + "失败:" + e.getMessage());
            logger.error(info + "时，发生异常", e);
        }
        return result;
    }


    @RequestMapping(value = "getOrderT")
    public
    @ResponseBody
    Object getOrderT(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(STATUS, ERROR);
        String orderSn=request.getParameter("orderNo").split(",")[0];
        if(orderSn!=null && !orderSn.equals("")){
            Order order = orderService.find(getParamMap(), "orderSn", orderSn);
            // 支付完后更新订单各种状态（订单状态：wait_seller_send_goods; 支付状态：paid;
            if(order.getOrderStatus().equals(Order.OrderStatus.wait_seller_send_goods) && order.getPaymentStatus().equals(Order.PaymentStatus.paid)){
                result.put(STATUS, SUCCESS);
            }
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
                //给商家发短信 Liu xiao bing 2016-04-27 08:43:46 Start
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
}