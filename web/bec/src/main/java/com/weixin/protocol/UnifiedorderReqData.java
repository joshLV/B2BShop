package com.weixin.protocol;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.weixin.common.Configure;

/**
 * Created by chris on 2016/3/10.
 */
@XStreamAlias("xml")
public class UnifiedorderReqData extends ReqData {



    //公众账号ID
    private String appid;
    //商户号
    private String mch_id;
    //随机字符串，不长于32位
    private String nonce_str;
    //签名，不长于32位
    private String sign;

    //商品描述，不长于128位，非必填
    private String body;

    //附加数据,不长于127位，非必填
    private String attach;

    //商户订单号,不长于32位
    private String out_trade_no;

    //货币类型,不长于16位，非必填，默认CNY
    private String fee_type;

    //订单总金额,整形，单位为分
    private int total_fee;

    //终端IP，不长于16位，APP和网页支付提交用户端ip，Native支付填调用微信支付API的机器IP
    private String spbill_create_ip;

    //通知地址,不长于256位（接收微信支付异步通知回调地址，通知url必须为直接可访问的url，不能携带参数。）
    private String notify_url;

    //交易类型,不长于16位，JSAPI--公众号支付、NATIVE--原生扫码支付、APP--app支付
    private String trade_type;

    //用户标识,不长于128位，trade_type=JSAPI时，此参数必传，用户在商户appid下的唯一标识。
    private String openid;

    @Override
    public String getUrl() {
        return Configure.WXPAY_UNIFIEDORDER_URL;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getMch_id() {
        return mch_id;
    }

    public void setMch_id(String mch_id) {
        this.mch_id = mch_id;
    }

    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getFee_type() {
        return fee_type;
    }

    public void setFee_type(String fee_type) {
        this.fee_type = fee_type;
    }

    public int getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(int total_fee) {
        this.total_fee = total_fee;
    }

    public String getSpbill_create_ip() {
        return spbill_create_ip;
    }

    public void setSpbill_create_ip(String spbill_create_ip) {
        this.spbill_create_ip = spbill_create_ip;
    }

    public String getNotify_url() {
        return notify_url;
    }

    public void setNotify_url(String notify_url) {
        this.notify_url = notify_url;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public UnifiedorderReqData buildAppid(String appid) {
        this.appid = appid;
        return this;
    }

    public UnifiedorderReqData buildMch_id(String mch_id) {
        this.mch_id = mch_id;
        return this;
    }

    public UnifiedorderReqData buildNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
        return this;
    }

    public UnifiedorderReqData buildSign(String sign) {
        this.sign = sign;
        return this;
    }


    public UnifiedorderReqData buildBody(String body) {
        this.body = body;
        return this;
    }

    public UnifiedorderReqData buildAttach(String attach) {
        this.attach = attach;
        return this;
    }

    public UnifiedorderReqData buildOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
        return this;
    }

    public UnifiedorderReqData buildFee_type(String fee_type) {
        this.fee_type = fee_type;
        return this;
    }

    public UnifiedorderReqData buildTotal_fee(int total_fee) {
        this.total_fee = total_fee;
        return this;
    }

    public UnifiedorderReqData buildSpbill_create_ip(String spbill_create_ip) {
        this.spbill_create_ip = spbill_create_ip;
        return this;
    }

    public UnifiedorderReqData buildNotify_url(String notify_url) {
        this.notify_url = notify_url;
        return this;
    }

    public UnifiedorderReqData buildTrade_type(String trade_type) {
        this.trade_type = trade_type;
        return this;
    }

    public UnifiedorderReqData buildOpenid(String openid) {
        this.openid = openid;
        return this;
    }
}


























