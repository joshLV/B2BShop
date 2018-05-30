package net.deepdragon.weipu.controller.mall;

import com.alibaba.fastjson.JSON;
import net.deepdragon.bean.Pager;
import net.deepdragon.condition.Criteria;
import net.deepdragon.condition.Restrictions;
import net.deepdragon.entity.Area;
import net.deepdragon.entity.weipu.*;
import net.deepdragon.service.weipu.*;
import net.deepdragon.service.AreaService;
import net.deepdragon.util.Constant;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import net.deepdragon.weipu.cache.CacheData;
import net.deepdragon.weipu.tools.UploadTools;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.security.action.GetPropertyAction;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.security.AccessController;
import java.util.*;

/**
 * 会员退款相关
 */
@Controller(Global.APP_SIGN + Global.MALL + "RefundController")
@RequestMapping(Global.MALL_PATH + "/member/refund")
public class RefundController extends BaseMallController {
    @Resource
    private MenuService menuService;
    @Resource
    private OrderService orderService;
    @Resource
    private AreaService areaService;
    @Resource
    private OrderRefundService orderRefundService;
    @Resource
    private OrderRefundLogService orderRefundLogService;
    @Resource
    private OrderRefundImagesService orderRefundImagesService;
    @Resource
    private CacheData cacheData;

    @RequestMapping(value = "list")
    public String list(Pager pager, Model model, HttpServletRequest request) {
        String info = "退款记录";
        setLogInfo(info);
        logger.debug(info);
        String memberId = getCurrentMember(request).getId();
        String orderSn = request.getParameter("orderSn");
        initMenu(model);    // 初始化菜单

        Criteria criteria = new Criteria();

        if(StringUtil.isNotEmpty( orderSn )){
            criteria.add(Restrictions.eq("wp_order_refund.orderSn", orderSn));
        }

        if (StringUtils.isNotEmpty(pager.getOrderBy()) && StringUtils.isNotEmpty(pager.getOrderType())) {
            criteria.add(Restrictions.order("wp_order_refund."+pager.getOrderBy(), pager.getOrderType()));
        }
        criteria.add(Restrictions.eq("wp_order_refund.memberId", memberId));
        criteria.add(Restrictions.eq("wp_order.platform", getPlatform()));
        pager.setPageSize(10);
        try {
            pager = orderRefundService.getPager(getParamMap(), criteria, pager);
            List orderRefundList = pager.getList();
            model.addAttribute("orderRefundList", orderRefundList);
            model.addAttribute("pager", pager);
        } catch (Exception e) {
            logger.error("执行" + info + "时，发生异常", e);
        }
        initRefundType(model);
        initRefundStatus(model);
        getAllCatelog(model);
        setPublicDate2Model( model );
        return Global.TEMPLATE_MALL + PATH + "/member/refund_list";
    }

    @RequestMapping("listRefundLog/{refundId}")
    @ResponseBody
    public Object listRefundLog(@PathVariable String refundId) {
        String info = "查看退款记录日志";
        setLogInfo(info);
        logger.debug(info);
        String tenantId = getTenantId();
        List<OrderRefundLog> logList = null;
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("refundId", refundId));
            criteria.add(Restrictions.order("createDate", "desc"));
            logList = orderRefundLogService.getList(getParamMap(), criteria);
        } catch (Exception e) {
            logger.error("执行" + info + "时，发生异常", e);
        }

        return logList;
    }

    /**
     * 前去修改退款单
     * @param orderSn 订单编号
     */
    @RequestMapping("goEditOrderRefund/{orderSn}/{refundId}")
    @Deprecated
    public String goEditOrderRefund(@PathVariable String orderSn, @PathVariable String refundId, Model model) {
        String info = "修改退款单";
        setLogInfo(info);
        logger.debug(info);
        String tenantId = getTenantId();
        try {
            OrderRefund orderRefund = orderRefundService.get(getParamMap(), refundId);
            OrderRefundImages orderRefundImages = orderRefundImagesService.find(getParamMap(), "refundId", refundId);
            Order order = orderService.find(getParamMap(), "orderSn", orderSn);
            model.addAttribute("orderStatusMapping", getOrderStatusMapping());
            model.addAttribute("order", order);
            model.addAttribute("orderRefund", orderRefund);
            model.addAttribute("orderRefundImages", orderRefundImages);
            getAllCatelog(model);
            setPublicDate2Model( model );
        } catch (Exception e) {
            logger.error("执行" + info + "时，发生异常", e);
        }

        return Global.TEMPLATE_MALL + PATH + "/member/refund_apply";
    }

    /**
     * 买家确认收到退款
     * @param refundId 退款单Id
     */
    @RequestMapping("getRefundSuccess/{refundId}")
    @ResponseBody
    @Deprecated
    public Object getRefundSuccess(@PathVariable String refundId, HttpServletRequest request) {
        String info = "已收到退款,退款成功";
        setLogInfo(info);
        logger.debug(info);
        String tenantId = getTenantId();
        try {
            OrderRefund refund = orderRefundService.get(getParamMap(), refundId);
            if(refund != null) {
                refund.setStatus(OrderRefund.RefundStatus.success);
                orderRefundService.update(getParamMap(), refund);

                //日志
                OrderRefundLog refundLog = new OrderRefundLog();
                refundLog.setRefundId(refund.getId());
                refundLog.setType(refund.getStatus());
                refundLog.setInfo(info);
                refundLog.setOperator(getCurrentMember(request).getUserName());
                refundLog.setCreateUser(getCurrentMember(request).getUserName());
                refundLog.setCreateDate(new Date());
                orderRefundLogService.save(getParamMap(), refundLog);
            }
        } catch (Exception e) {
            logger.error("执行" + info + "时，发生异常", e);
        }
        Map<String, String> result = new HashMap<String, String>();
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "");

        return result;
    }

    @RequestMapping("apply/{orderSn}")
    public String apply(@PathVariable String orderSn, Model model, HttpServletRequest request) {
        String info = "申请退款";
        setLogInfo(info);
        String tenantId = getCurrentMember(request).getTenantId();
        try {
            Order order = orderService.find(getParamMap(),"orderSn",orderSn);
            logger.info(info + order.getOrderSn());
            model.addAttribute("orderStatusMapping", getOrderStatusMapping());
            model.addAttribute("order", order);
            getAllCatelog(model);
            setPublicDate2Model( model );
        } catch (Exception e) {
            logger.error("申请退款时，发生异常, orderSn=" + orderSn, e);
        }
        String type = request.getParameter(Global.WHICHCLIENT);
        if(Global.WHICH_APP.equals(type)){
            return Global.TEMPLATE_APP + PATH + "/member/refund_apply";
        } else {
            return Global.TEMPLATE_MALL + PATH + "/member/refund_apply";
        }
    }
    @RequestMapping(value = "applyfill", method = { RequestMethod.POST })
    public @ResponseBody
    Object  applyFill(OrderRefund orderRefund,HttpServletRequest request) {

        String info = "提交退款申请信息";
        setLogInfo(info);
        logger.debug(info);

        Map<String, Object> result = new HashMap<String, Object>();

        try {
            //获取已经驳回订单记录信息
            Criteria hasReturndCondition = new Criteria();
            hasReturndCondition.add(Restrictions.eq("orderSn", orderRefund.getOrderSn())); //放入订单号
            hasReturndCondition.add(Restrictions.eq(Constant.TENANTID_KEY, getTenantId()));
            hasReturndCondition.add(Restrictions.eq(Constant.PLATFORM_KEY, getPlatform()));
            hasReturndCondition.add(Restrictions.order("createDate", "DESC"));
            List<OrderRefund> hasReturndOrderRefund = orderRefundService.getList(getParamMap(), hasReturndCondition);


            /**
             * 判断退款单
             * 1.判断退款单有无情况(无:0 有:<3)
             * 2.判断退款单有无提交退款单记录信息,有则不进行提交
             */
            if (hasReturndOrderRefund!=null &&(hasReturndOrderRefund.size()>0 && hasReturndOrderRefund.size()<3)) {
                boolean commitFlag = true;
                for(int i=0; i<hasReturndOrderRefund.size(); i++) {
                    if(!OrderRefund.RefundStatus.returned.equals(hasReturndOrderRefund.get(i).getStatus())) {
                       commitFlag = false;
                        break;
                    }
                }
                if(commitFlag) {
                    result = saveOrderRefund(orderRefund, request, info);
                }else{
                    result.put(STATUS, ERROR);
                    result.put(MESSAGE, "已存在退款申请,请勿重复操作!");
                }
            } else if(hasReturndOrderRefund == null || hasReturndOrderRefund.size()==0) {
                    result = saveOrderRefund(orderRefund, request, info);
            }else{
                result.put(STATUS, ERROR);
                result.put(MESSAGE, "已申请三次,无法再次申请.如有疑问,请联系客服!");
            }

        }catch (Exception e) {
            logger.error("提交退款申请信息");
        }

        return result;
    }
    private Map<String, Object> saveOrderRefund(OrderRefund orderRefund, HttpServletRequest request, String info) {
        Map<String, Object> result = new HashMap<String, Object>();
        OrderRefund refund=null;
        try {
            //解决退款原因与退款说明汉字乱码问题
            orderRefund.setReason(java.net.URLDecoder.decode(orderRefund.getReason(), "UTF-8"));
            orderRefund.setInfo(java.net.URLDecoder.decode(orderRefund.getInfo(), "UTF-8"));


            orderRefund.setCreateUser(getCurrentMember(request).getUserName());
            orderRefund.setCreateDate(new Date());
            orderRefund.setStatus(OrderRefund.RefundStatus.commit);
            orderRefund.setMemberId(getCurrentMember(request).getId());
            refund=orderRefundService.save(getParamMap(),orderRefund);
            OrderRefund.RefundType type = refund.getType();
            if (type != null && type.name().equals("received")){
                if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
                    //获取已异步上传的证照(图片)等信息
                    List< Map<String, String>> imagelist = new ArrayList<Map<String, String>>();
                    Map<String, String[]> paramMap = request.getParameterMap();
                    for (String key : paramMap.keySet()) {
                        if (key.startsWith("uploadfile")) {
                            imagelist.add(JSON.toJavaObject(
                                    (JSON) JSON.parse(paramMap.get(key)[0]),
                                    Map.class));
                        }
                    }
                    if (imagelist.size() > 0) {
                        for (int i = 0; i < imagelist.size(); i++) {
                            Map<String, String> image = imagelist.get(i);
                            if (null != image && StringUtil.isNotEmpty(image.get("path"))) {
                                OrderRefundImages orderRefundImages = new OrderRefundImages();
                                orderRefundImages.setRefundId(refund.getId());
                                orderRefundImages.setType(1);
                                orderRefundImages.setGroupName(image.get("projectName"));
                                orderRefundImages.setUrl(image.get("path"));
                                orderRefundImages.setCreateDate(new Date());
                                orderRefundImages.setCreateUser(getCurrentMember(request).getUserName());
                                orderRefundImagesService.save(getParamMap(), orderRefundImages);
                            }
                        }
                    }
                }else{
                    List<String[]> imagelist = UploadTools.upload(request);
                    if(imagelist.size()>0){
                        for(int i = 0; i < imagelist.size(); i++){
                            String results[] = imagelist.get(i);
                            if (!results[0].equals("0")) {
                                OrderRefundImages orderRefundImages = new OrderRefundImages();
                                orderRefundImages.setRefundId(refund.getId());
                                orderRefundImages.setType(1);
                                orderRefundImages.setGroupName(results[0]);
                                orderRefundImages.setUrl(results[1]);
                                orderRefundImages.setCreateDate(new Date());
                                orderRefundImages.setCreateUser(getCurrentMember(request).getUserName());
                                orderRefundImagesService.save(getParamMap(),orderRefundImages);
                            }
                        }
                    }
                }

            }
            //日志
            OrderRefundLog refundLog = new OrderRefundLog();
            refundLog.setRefundId(refund.getId());
            refundLog.setType(refund.getStatus());
            refundLog.setInfo(info);
            refundLog.setOperator(getCurrentMember(request).getUserName());
            refundLog.setCreateUser(getCurrentMember(request).getUserName());
            refundLog.setCreateDate(new Date());
            orderRefundLogService.save(getParamMap(), refundLog);
        } catch (Exception e) {
            logger.error("提交退款申请信息");
            e.printStackTrace();
        }

        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, refund.getOrderSn());

        return result;
    }


    @RequestMapping("applyfillwl/{orderSn}")
    public String applyFillWl(@PathVariable String orderSn, Model model, HttpServletRequest request) {
        String info = "等待商家处理退款信息";
        OrderRefund refund=null;
        try {
            Order order = orderService.find(getParamMap(),"orderSn",orderSn);
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("orderSn",orderSn));
            criteria.add(Restrictions.order("createDate","desc"));
            List<OrderRefund> refundList=orderRefundService.getList(getParamMap(),criteria);
            if(refundList!=null){
                refund =  refundList.get(0);
                //退款单被驳回,获取驳回原因 chenbin@2015-12-04
               /* if(OrderRefund.RefundStatus.returned.equals(refund.getStatus())
                        || OrderRefund.RefundStatus.unrefund.equals(refund.getStatus())
                        || OrderRefund.RefundStatus.refunded.equals(refund.getStatus())){
                    criteria = new Criteria();
                    criteria.add(Restrictions.eq("refundId", refund.getId()));
                    criteria.add(Restrictions.eq("type", refund.getStatus().name()));
                    criteria.add(Restrictions.order("createDate","asc"));
                    List<OrderRefundLog> refundLogList = orderRefundLogService.getList(getParamMap(), criteria);
                    model.addAttribute("refundLog", refundLogList.get(0));
                }
*/
                    List<OrderRefundLog> logList = null;
                    Criteria criterias = new Criteria();
                    criterias.add(Restrictions.eq("refundId",refund.getId()));
                    criterias.add(Restrictions.order("createDate", "desc"));
                    logList = orderRefundLogService.getList(getParamMap(), criterias);
                    model.addAttribute("logList",logList);

            }

            model.addAttribute("size", refundList.size());
            model.addAttribute("orderStatusMapping", getOrderStatusMapping());
            model.addAttribute("refund", refund);
            model.addAttribute("order", order);
            getAllCatelog(model);
            setPublicDate2Model( model );
        } catch (Exception e) {
           e.printStackTrace();
        }
        String type = request.getParameter(Global.WHICHCLIENT);
        if(Global.WHICH_APP.equals(type)){
            return Global.TEMPLATE_APP + PATH + "/member/refund_applyfill";
        }
        return Global.TEMPLATE_MALL + PATH + "/member/refund_applyfill";
    }
    @RequestMapping(value = "applyfilladdress", method = { RequestMethod.POST })
    public @ResponseBody
    Object  applyFillAddress(OrderRefund orderRefund,HttpServletRequest request) {
        String info = "填写退款物流信息";
        setLogInfo(info);
        logger.debug(info);
        Map<String, Object> result = new HashMap<String, Object>();
        String tenantId = getCurrentMember(request).getTenantId();
        OrderRefund refund=null;
        try {
            refund = orderRefundService.find(getParamMap(), "id", orderRefund.getId());
//            String areaPath=orderRefund.getShipAreaPath();
//            if(areaPath!=null  && !areaPath.equals("")){
//                String areaId = areaPath.substring(areaPath.lastIndexOf(',')+1,areaPath.length());
//                refund.setShipAreaId(areaId);
//            }
            refund.setStatus(OrderRefund.RefundStatus.shipped);
            refund.setLogisticsName(orderRefund.getLogisticsName());
            refund.setLogisticsNo(orderRefund.getLogisticsNo());
//            refund.setShipAddress(orderRefund.getShipAddress());
//            refund.setShipAreaPath(orderRefund.getShipAreaPath());
//            refund.setShipName(orderRefund.getShipName());
//            refund.setShipMobile(orderRefund.getShipMobile());
//            refund.setShipPhone(orderRefund.getShipPhone());
//            refund.setShipZipCode(orderRefund.getShipZipCode());

            //日志
            OrderRefundLog refundLog = new OrderRefundLog();
            refundLog.setRefundId(refund.getId());
            refundLog.setType(refund.getStatus());
            refundLog.setInfo(info);
            refundLog.setOperator(getCurrentMember(request).getUserName());
            refundLog.setCreateUser(getCurrentMember(request).getUserName());
            refundLog.setCreateDate(new Date());

            //图片
            //Order order = orderService.find(getParamMap(),"orderSn",refund.getOrderSn());
            if (Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))) {
                //获取已异步上传的证照(图片)等信息
                List< Map<String, String>> imagelist = new ArrayList<Map<String, String>>();
                Map<String, String[]> paramMap = request.getParameterMap();
                for (String key : paramMap.keySet()) {
                    if (key.startsWith("uploadfile")) {
                        imagelist.add(JSON.toJavaObject(
                                (JSON) JSON.parse(paramMap.get(key)[0]),
                                Map.class));
                    }
                }
                if (imagelist.size() > 0) {
                    Map<String, String> image = imagelist.get(0);
                    if (null != image && StringUtil.isNotEmpty(image.get("path"))) {
                        OrderRefundImages orderRefundImages = new OrderRefundImages();
                        orderRefundImages.setRefundId(refund.getId());
                        orderRefundImages.setType(2);
                        orderRefundImages.setGroupName(image.get("projectName"));
                        orderRefundImages.setUrl(image.get("path"));
                        orderRefundImages.setCreateDate(new Date());
                        orderRefundImages.setCreateUser(getCurrentMember(request).getUserName());
                        orderRefundService.update(getParamMap(), refund);
                        orderRefundLogService.save(getParamMap(), refundLog);
                        orderRefundImagesService.save(getParamMap(), orderRefundImages);
                    }
                }
            } else {
                List<String[]> imagelist = UploadTools.upload(request);
                if (imagelist.size() > 0) {
                    String results[] = imagelist.get(0);
                    if (!results[0].equals("0")) {
                        OrderRefundImages orderRefundImages = new OrderRefundImages();
                        orderRefundImages.setRefundId(refund.getId());
                        orderRefundImages.setType(2);
                        orderRefundImages.setGroupName(results[0]);
                        orderRefundImages.setUrl(results[1]);
                        orderRefundImages.setCreateDate(new Date());
                        orderRefundImages.setCreateUser(getCurrentMember(request).getUserName());
                        orderRefundService.update(getParamMap(), refund);
                        orderRefundLogService.save(getParamMap(), refundLog);
                        orderRefundImagesService.save(getParamMap(), orderRefundImages);
                        //orderRefundService.updateRefund(tenantId,refund,refundLog,orderRefundImages);
                    }
                }
            }

        } catch (Exception e) {
            logger.error("填写退款物流信息");
            e.printStackTrace();
        }
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, refund.getId());
        return result;
    }
    @RequestMapping("refundsuccess/{orderSn}")
    public String refundsuccess(@PathVariable String orderSn, Model model, HttpServletRequest request) {
        String info = "等待商家退款";
        setLogInfo(info);
//        String tenantId = getCurrentMember(request).getTenantId();
        String url="";
        OrderRefund refund=null;
        try {
            Order order = orderService.find(getParamMap(),"orderSn",orderSn);
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("orderSn",orderSn));
            criteria.add(Restrictions.order("createDate","desc"));
            List<OrderRefund> refundList=orderRefundService.getList(getParamMap(),criteria);
            if(refundList!=null){
                refund =  refundList.get(0);
            }
            if(refund.getShipAreaPath()!=null){
                List<String> areaPath = Arrays.asList(StringUtils.split(refund.getShipAreaPath(), ","));
                if(areaPath!=null){
                    String i = "";
                    for (String str : areaPath) {
                        Area area = areaService.get(getParamMap(), str);
                        if (null != area) {
                            i = i + area.getName();
                        }
                    }
                    refund.setShipAddress(i+refund.getShipAddress());
                }
            }
            OrderRefund.RefundType type = refund.getType();
            OrderRefund.RefundStatus status=refund.getStatus();
            if(refund.getType().toString().equals("received")){
                if(status.name().equals("confirmed")){
                    url="/member/refund_address";
                }
                if(status.name().equals("returned")){
                    url="/member/refund_applyfill";
                }
                if(status.name().equals("shipped")||status.name().equals("unrefund")||status.name().equals("refunded")||status.name().equals("success")){
                    url="/member/refund_success";
                }
            }
            if(refund.getType().toString().equals("unreceived")){
                url="/member/refund_applyfill";
            }
            model.addAttribute("orderStatusMapping", getOrderStatusMapping());
            model.addAttribute("order", order);
            model.addAttribute("refund", refund);
            getAllCatelog(model);
            setPublicDate2Model( model );
        } catch (Exception e) {
            logger.error("等待商家退款", e);
        }
        if(Global.WHICH_APP.equals(request.getParameter(Global.WHICHCLIENT))){
            return Global.TEMPLATE_APP + PATH + url;
        }
        return Global.TEMPLATE_MALL + PATH + url;
    }
    @RequestMapping(value = "applyfillupdate/{refundId}", method = { RequestMethod.POST })
    public @ResponseBody
    Object  applyFillUpdate(@PathVariable String refundId,HttpServletRequest request) {
        String info = "您已确认收款";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        String tenantId = getCurrentMember(request).getTenantId();
        OrderRefund refund=null;
        Order order=null;
        try {
            refund = orderRefundService.find(getParamMap(), "id", refundId);
            refund.setStatus(OrderRefund.RefundStatus.success);

            //修改更新方法，添加库存更新，增库存
            orderRefundService.updateOrderRefund(getParamMap(),refund);

            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("orderSn",refund.getOrderSn()));
            List<Order> orderList= orderService.getList(getParamMap(),criteria);
            if(orderList!=null&&orderList.size()>0){
                order = orderList.get(0);
                if(refund.getType().toString().equals("unreceived")){
                    /** 未收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-9-28 OLD Start*/
//                    order.setOrderStatus(Order.OrderStatus.refund_success);
                    /** 未收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-9-28 OLD Start*/

                    /** 未收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-9-28 New Start*/
                    order.setOrderStatus( Order.OrderStatus.trade_finished);
                    /** 未收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-9-28 New End*/


//                    order.setShippingStatus(Order.ShippingStatus.unshipped);
                }
                if(refund.getType().toString().equals("received")){
                    /** 收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-11-26 New OLD*/
//                    order.setOrderStatus(Order.OrderStatus.reship_success);
                    /** 收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-11-26 New OLD*/

                    /** 收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-11-26 New Start*/
                    order.setOrderStatus( Order.OrderStatus.trade_finished);
                    /** 收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-11-26 New End*/

//                    order.setShippingStatus(Order.ShippingStatus.reshiped);
                }
//                order.setPaymentStatus(Order.PaymentStatus.refunded);
                orderService.update(getParamMap(),order);
            }
            //日志
            OrderRefundLog refundLog = new OrderRefundLog();
            refundLog.setRefundId(refund.getId());
            refundLog.setType(refund.getStatus());
            refundLog.setInfo(info);
            refundLog.setOperator(getCurrentMember(request).getUserName());
            refundLog.setCreateUser(getCurrentMember(request).getUserName());
            refundLog.setCreateDate(new Date());
            orderRefundLogService.save(getParamMap(), refundLog);
        } catch (Exception e) {
            logger.error("退款成功后修改状态信息");
            e.printStackTrace();
        }
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "");
        return result;
    }
    @RequestMapping(value = "receivableupdate/{orderSn}", method = { RequestMethod.POST })
    public @ResponseBody
    Object  receivablesUpdate(@PathVariable String orderSn,HttpServletRequest request) {
        String info = "您已确认收款";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        String tenantId = getCurrentMember(request).getTenantId();
        OrderRefund refund=null;
        Order order=null;
        try {
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("orderSn",orderSn));
            criteria.add(Restrictions.order("createDate","desc"));
            List<OrderRefund> refundList=orderRefundService.getList(getParamMap(),criteria);
            if(refundList!=null){
                refund =  refundList.get(0);
            }
            refund.setStatus(OrderRefund.RefundStatus.success);

            //修改更新方法，添加库存更新，增库存
            orderRefundService.updateOrderRefund(getParamMap(),refund);

            order = orderService.find(getParamMap(), "orderSn", orderSn);
            if(order!=null){
                if(refund.getType().toString().equals("unreceived")){
                    /** 未收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-9-28 OLD Start*/
//                    order.setOrderStatus(Order.OrderStatus.refund_success);
                    /** 未收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-9-28 OLD Start*/

                    /** 未收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-9-28 New Start*/
                    order.setOrderStatus( Order.OrderStatus.trade_finished);
                    /** 未收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-9-28 New End*/

//                    order.setShippingStatus(Order.ShippingStatus.unshipped);
                }else if(refund.getType().toString().equals("received")){
//                    order.setOrderStatus(Order.OrderStatus.reship_success);//
                    /** 收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-12-24 14:07:35 New Start*/
                    order.setOrderStatus(Order.OrderStatus.trade_finished);
                    /** 收到货的订单退款完成后更新订单主状态为 “交易完成” TianYu 2015-12-24 14:07:35 New End*/
//                    order.setShippingStatus(Order.ShippingStatus.reshiped);
                }
//                order.setPaymentStatus(Order.PaymentStatus.refunded);
                orderService.update(getParamMap(),order);
            }
            //日志
            OrderRefundLog refundLog = new OrderRefundLog();
            refundLog.setRefundId(refund.getId());
            refundLog.setType(refund.getStatus());
            refundLog.setInfo(info);
            refundLog.setOperator(getCurrentMember(request).getUserName());
            refundLog.setCreateUser(getCurrentMember(request).getUserName());
            refundLog.setCreateDate(new Date());
            orderRefundLogService.save(getParamMap(), refundLog);
        } catch (Exception e) {
            logger.error("退款成功后修改状态信息");
            e.printStackTrace();
        }
        result.put(STATUS, SUCCESS);
        result.put(MESSAGE, "");
        return result;
    }
    @RequestMapping("refundurl/{orderSn}")
    public @ResponseBody
    Object refundurl(@PathVariable String orderSn,HttpServletRequest request) {
        String info = "申请退款";
        setLogInfo(info);
        Map<String, Object> result = new HashMap<String, Object>();
        String tenantId = getCurrentMember(request).getTenantId();
        try {
            Order order = orderService.find(getParamMap(),"orderSn", orderSn);
            Criteria criteria = new Criteria();
            criteria.add(Restrictions.eq("orderSn",orderSn));
            criteria.add(Restrictions.order("createDate","desc"));
            List<OrderRefund> refundList=orderRefundService.getList(getParamMap(),criteria);
            if(refundList.size()>0){
                result.put(STATUS, SUCCESS);
                result.put("refundId",refundList.get(0).getId());
                result.put("refundstatus",refundList.get(0).getStatus());
                result.put("type",refundList.get(0).getType());
                result.put("size",refundList.size());
            }else{
                result.put(STATUS, ERROR);
            }
        } catch (Exception e) {
            logger.error("申请退款时，发生异常, orderSn=" + orderSn, e);
        }
        return result;
    }
    private Map<String, String> getOrderStatusMapping() {
        Map<String, String> map = new HashMap<String, String>();
        map.put("", "全部状态");
        map.put("wait_buyer_pay", "等待付款");
        map.put("wait_seller_send_goods", "等待发货");
        map.put("wait_buyer_confirm_goods", "等待收货");
        map.put("trade_finished", "交易完成");
        map.put("unconfirm", "未确认");
        map.put("cancel", "已取消");
        map.put("invalid", "已作废");
//        map.put("refund_part", "部分退款");
        map.put("refund_success", "全额退款");
//        map.put("reship_part", "部分退货");
        map.put("reship_success", "已退货");
        map.put("refunding", "退款中");
        map.put("deleted", "已删除");

        return map;
    }

    /**
     * 初始化菜单
     */
    private void initMenu(Model model) {
        getAllCatelog(model);
        setPublicDate2Model( model );
    }

    /**
     * 初始化退款类型
     */
    private Map<String, String> initRefundType(Model model) {
        Map<String, String> refundTypeMap = new HashMap<String, String>();
        refundTypeMap.put("unreceived", "未收到货");
        refundTypeMap.put("received", "已收到货");
        model.addAttribute("refundTypeMap", refundTypeMap);
        model.addAttribute("refundTypeJSONMap", JSON.toJSONString(refundTypeMap));
        return refundTypeMap;
    }

    /**
     * 初始化退款状态
     */
    private Map<String, String> initRefundStatus(Model model) {
        Map<String, String> refundStatusMap = new HashMap<String, String>();
        refundStatusMap.put("commit", "已提交");
        refundStatusMap.put("confirmed", "已受理");
        refundStatusMap.put("returned", "已退回");
        refundStatusMap.put("shipped", "已发货,等待卖家收货");
        refundStatusMap.put("unrefund", "卖家已收货,等待退款");
        refundStatusMap.put("refunded", "已退款,等待买家确认");
        refundStatusMap.put("success", "已完成");
        model.addAttribute("refundStatusMap", refundStatusMap);
        model.addAttribute("refundStatusJSONMap", JSON.toJSONString(refundStatusMap));
        return refundStatusMap;
    }
}