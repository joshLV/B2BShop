package com.unionpay.acp;

import com.unionpay.acp.sdk.*;
import net.deepdragon.util.DateUtils;
import net.deepdragon.util.StringUtil;
import net.deepdragon.weipu.Global;
import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Explain: 银联支付工具类
 * FileName:
 * Author: TianYu
 * Time: 2015-09-15 15:04
 * Desc:
 * Version: V1.0
 */
public class UnionpayUtil {

    /**
     * 对数据进行签名
     *
     * @param requestOrder
     * @return　签名后的map对象
     */
    @SuppressWarnings("unchecked")
    public static Map<String, String> signData(com.unionpay.acp.RequestOrder requestOrder) {
        Map<String,Object> params = StringUtil.beanToMap(requestOrder);
        Map.Entry<String, String> obj = null;
        Map<String, String> submitFromData = new HashMap<String, String>();
        for (Iterator<?> it = params.entrySet().iterator(); it.hasNext();) {
            obj = (Map.Entry<String, String>) it.next();
            String value = obj.getValue();
            if (StringUtils.isNotBlank(value) && !"requestUrl".equals(obj.getKey())) {
                // 对value值进行去除前后空处理
                submitFromData.put(obj.getKey(), value.trim());
            }
        }
        /**
         * 签名
         */
        SDKUtil.sign(submitFromData, requestOrder.getEncoding());

        requestOrder.setCertId(submitFromData.get("certId"));
        requestOrder.setSignature(submitFromData.get("signature"));


        submitFromData.put("requestUrl", params.get("requestUrl") + "");
        return submitFromData;
    }

    /**
     * 银联在线支付  支付
     * @param orderSn 订单号
     * @param orderTotalAmount 订单金额，单位 分
     * @param frontUrl 前台通知url
     * @param backUrl 后台通知url
     * @param model 组装数据
     */
    public static void pay(String orderSn, String orderTotalAmount, String frontUrl, String backUrl, Model model){

        // 构造订单请求对象，生成signMsg。
        com.unionpay.acp.RequestOrder requestOrder = new com.unionpay.acp.RequestOrder();
        requestOrder.setFrontUrl(frontUrl);
        requestOrder.setBackUrl(backUrl);
        requestOrder.setOrderId(orderSn);
        requestOrder.setTxnAmt(orderTotalAmount);
        requestOrder.setTxnTime(DateUtils.dateToString(new Date(), "yyyyMMddHHmmss"));
        if(model.containsAttribute(Global.WHICHCLIENT)){
            requestOrder.setChannelType("08");
        }
        model.addAttribute("requestOrder", signData(requestOrder));
    }

    /**
     * 退货
     * @param orderSn
     * @param orderTotalAmount
     * @param orderQueryId 查询流水号
     * @param frontUrl
     * @param backUrl
     * @param model
     */
    public static void refund(String orderSn, String orderTotalAmount, String orderQueryId, String frontUrl, String backUrl, Model model){
        com.unionpay.acp.RequestOrder requestOrder = new com.unionpay.acp.RequestOrder();
        requestOrder.setRequestUrl( SDKConfig.getConfig().getBackRequestUrl() );
        requestOrder.setFrontUrl(frontUrl);
        requestOrder.setBackUrl(backUrl);
        requestOrder.setSignMethod("01");
        requestOrder.setTxnType("04");
        requestOrder.setTxnSubType("00");
        requestOrder.setOrderId(orderSn);
        requestOrder.setTxnAmt(orderTotalAmount);
        requestOrder.setQueryId(orderQueryId);
        requestOrder.setTxnTime(DateUtils.dateToString( new Date(),"yyyyMMddHHmmss"));

        model.addAttribute("requestOrder", UnionpayUtil.signData(requestOrder));
    }

    /**
     * 撤销消费
     * @param orderSn
     * @param orderTotalAmount
     * @param orderQueryId 查询流水号
     * @param frontUrl
     * @param backUrl
     * @param model
     */
    public static void consumeUndo (String orderSn, String orderTotalAmount, String orderQueryId, String frontUrl, String backUrl, Model model){
        com.unionpay.acp.RequestOrder requestOrder = new com.unionpay.acp.RequestOrder();
        requestOrder.setRequestUrl( SDKConfig.getConfig().getBackRequestUrl() );
        requestOrder.setFrontUrl(frontUrl);
        requestOrder.setBackUrl(backUrl);
        requestOrder.setSignMethod("01");
        requestOrder.setTxnType("31");
        requestOrder.setTxnSubType("00");
        requestOrder.setOrderId(orderSn);
        requestOrder.setTxnAmt(orderTotalAmount);
        requestOrder.setQueryId(orderQueryId);
        requestOrder.setTxnTime(DateUtils.dateToString( new Date(),"yyyyMMddHHmmss"));

        model.addAttribute("requestOrder", UnionpayUtil.signData(requestOrder));
    }

    /**
     * 解析返回报文的 requst 组装成 Map
     *
     * @param request
     * @return
     */
    public static Map<String,String> resp2Map(HttpServletRequest request) throws Exception{
            request.setCharacterEncoding("ISO-8859-1");
            String encoding = request.getParameter(SDKConstants.param_encoding);
            // 获取请求参数中所有的信息
            Map<String, String> reqParam = getAllRequestParam(request);
            // 打印请求报文
            LogUtil.printRequestLog(reqParam);
            Map<String, String> respData = null;
            if (null != reqParam && !reqParam.isEmpty()) {
                Iterator<Map.Entry<String, String>> it = reqParam.entrySet().iterator();
                respData = new HashMap<String, String>(reqParam.size());
                while (it.hasNext()) {
                    Map.Entry<String, String> e = it.next();
                    String key = e.getKey();
                    if(key.equals(Global.WHICHCLIENT)){
                        continue;
                    }
                    String value = e.getValue();
                    value = new String(value.getBytes("ISO-8859-1"), encoding);
                    respData.put(key, value);
                }
            }

            return respData;
    }

    /**
     * 解析返回报文，校验 证书，校验 应答码
     * @param valideData
     * @return
     */
    public static boolean validateResposon(Map<String, String> valideData){
        // 验证签名
        if (SDKUtil.validate(valideData, valideData.get(SDKConstants.param_encoding)) ) {
            LogUtil.writeLog("验证签名结果[成功].");
            /* 校验应答码  respCode 00 为交易成功*/
            if("00".equals( valideData.get("respCode") )){
                return true;
            }else{
                return false;
            }
        } else {
            LogUtil.writeLog("验证签名结果[失败].");
            return false;
        }

    }



    /**
     * 获取请求参数中所有的信息
     *
     * @param request
     * @return
     */
    public static Map<String, String> getAllRequestParam(
            final HttpServletRequest request) {
        Map<String, String> res = new HashMap<String, String>();
        Enumeration<?> temp = request.getParameterNames();
        if (null != temp) {
            while (temp.hasMoreElements()) {
                String en = (String) temp.nextElement();
                String value = request.getParameter(en);
                res.put(en, value);
                // 在报文上送时，如果字段的值为空，则不上送<下面的处理为在获取所有参数数据时，判断若值为空，则删除这个字段>
                if (res.get(en) == null || "".equals(res.get(en))) {
                    res.remove(en);
                }
            }
        }
        return res;
    }


    /**
     * 构造HTTP POST交易表单的方法示例
     *
     * @param action
     *            表单提交地址
     * @param hiddens
     *            以MAP形式存储的表单键值
     * @return 构造好的HTTP POST交易表单
     */
    public static String createHtml(String action, Map<String, String> hiddens) {
        StringBuffer sf = new StringBuffer();
        sf.append("<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\"/></head><body>");
        sf.append("<form id = \"pay_form\" action=\"" + action
                + "\" method=\"post\">");
        if (null != hiddens && 0 != hiddens.size()) {
            Set<Map.Entry<String, String>> set = hiddens.entrySet();
            Iterator<Map.Entry<String, String>> it = set.iterator();
            while (it.hasNext()) {
                Map.Entry<String, String> ey = it.next();
                String key = ey.getKey();
                String value = ey.getValue();
                sf.append("<input type=\"hidden\" name=\"" + key + "\" id=\""
                        + key + "\" value=\"" + value + "\"/>");
            }
        }
        sf.append("</form>");
        sf.append("</body>");
        sf.append("<script type=\"text/javascript\">");
        sf.append("document.all.pay_form.submit();");
        sf.append("</script>");
        sf.append("</html>");
        return sf.toString();
    }

    /**
     * 根据订单号和支付时间查询支付情况
     * @param orderSn 订单号
     * @param payTime 支付时间，至少需要知道是那一天
     * @param whichSys app时为手机端，其他为PC端
     * @return
     * 应答报文中，“应答码”即respCode字段，表示的是查询交易本身的应答，即查询这个动作是否成功，不代表被查询交易的状态；
     * 若查询动作成功，即应答码为“00“，则根据“原交易应答码”即origRespCode来判断被查询交易是否成功。
     * 此时若origRespCode为00，则表示被查询交易成功。
     */
    public static Map<String, String> queryOrder(String orderSn,String payTime,String whichSys){
        com.unionpay.acp.RequestOrder requestOrder = new com.unionpay.acp.RequestOrder();
        /**
         * 组装请求报文
         */
        Map<String, String> data = new HashMap<String, String>();
        // 版本号
        data.put("version", requestOrder.getVersion());
        // 字符集编码 默认"UTF-8"
        data.put("encoding", requestOrder.getEncoding());
        // 签名方法 01 RSA
        data.put("signMethod", "01");
        // 交易类型
        data.put("txnType", "00");
        // 交易子类型
        data.put("txnSubType", "00");
        // 业务类型
        data.put("bizType", "000000");
        // 渠道类型，07-PC，08-手机
        data.put("channelType", "07");
        if( "app".equals(whichSys) ){
            data.put("channelType", "08");
        }
        // 接入类型，商户接入填0 0- 商户 ， 1： 收单， 2：平台商户
        data.put("accessType", "0");
        // 商户号码，请改成自己的商户号
        data.put("merId", requestOrder.getMerId());
        // 商户订单号，请修改被查询的交易的订单号
        data.put("orderId", orderSn);
        // 订单发送时间，请修改被查询的交易的订单发送时间
        data.put("txnTime", payTime);

        data = signData(data);

        // 交易请求url 从配置文件读取
        String url = SDKConfig.getConfig().getSingleQueryUrl();

        return submitUrl(data, url);
    }

    public static Map<String, String> submitUrl(
            Map<String, String> submitFromData,String requestUrl) {
        String resultString = "";
        /**
         * 发送
         */
        HttpClient hc = new HttpClient(requestUrl, 30000, 30000);
        try {
            int status = hc.send(submitFromData, "UTF-8");
            if (200 == status) {
                resultString = hc.getResult();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String, String> resData = new HashMap<String, String>();
        /**
         * 验证签名
         */
        if (null != resultString && !"".equals(resultString)) {
            // 将返回结果转换为map
            resData = SDKUtil.convertResultStringToMap(resultString);
        }
        return resData;
    }

    public static Map<String, String> signData(Map<String, ?> contentData) {
        Map.Entry<String, String> obj = null;
        Map<String, String> submitFromData = new HashMap<String, String>();
        for (Iterator<?> it = contentData.entrySet().iterator(); it.hasNext();) {
            obj = (Map.Entry<String, String>) it.next();
            String value = obj.getValue();
            if (StringUtils.isNotBlank(value)) {
                // 对value值进行去除前后空处理
                submitFromData.put(obj.getKey(), value.trim());
            }
        }
        /**
         * 签名
         */
        SDKUtil.sign(submitFromData, "UTF-8");

        return submitFromData;
    }
}
