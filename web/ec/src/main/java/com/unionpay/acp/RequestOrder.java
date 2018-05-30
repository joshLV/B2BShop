package com.unionpay.acp;

import com.unionpay.acp.sdk.SDKConfig;
import net.deepdragon.util.Constant;
import net.deepdragon.weipu.tools.PropertiesUtil;

import java.io.Serializable;


/**
 * Explain: 银联支付请求报文
 * FileName:
 * Author: TianYu
 * Time: 2015-09-15 13:53
 * Desc:
 * Version: V1.0
 */
public class RequestOrder implements Serializable {
    private static final long serialVersionUID = 8646073994752198011L;
    /**
     * 版本号
     */
    private String version = "5.0.0";
    /**
     * 字符集编码 默认"UTF-8"
     */
    private String encoding = "UTF-8";
    /**
     * 签名方法 01 RSA
     */
    private String signMethod = "01";
    /**
     * 交易类型 01-消费
     */
    private String txnType = "01";
    /**
     * 交易子类型 01:自助消费 02:订购 03:分期付款
     */
    private String txnSubType = "01";
    /**
     * 业务类型
     */
    private String bizType = "000201";

    /**
     * 渠道类型，07-PC，08-手机
     */
    private String channelType = "07";
    /**
     * 前台通知地址 ，控件接入方式无作用
     */
    private String frontUrl;
    /**
     * 后台通知地址
     */
    private String backUrl;
    /**
     * 接入类型，商户接入填0 0- 商户 ， 1： 收单， 2：平台商户
     */
    private String accessType = "0";
    /**
     * 商户号码，请改成自己的商户号821610173757560
     * 锦鹏   821610152117561
     * 港务区 821610173757560
     */
    private String merId = PropertiesUtil.getValue("acp_sdk.properties","acpsdk.memberId");
    /**
     * 商户订单号，8-40位数字字母
     */
    private String orderId;
    /**
     * 商户发送交易时间，取系统时间
      */
    private String txnTime;
    /**
     * 交易金额，单位分
     * 默认1分
     */
    private String txnAmt = "1";
    /**
     * 交易币种: 156为人民币
     */
    private String currencyCode = "156";
    /**
     * 交易请求url 从配置文件读取
     * 默认前台交易请求
     */
    private String requestUrl = SDKConfig.getConfig().getFrontRequestUrl();

    /**
     * 证书IDcertId
     */
    private String certId;
    /**
     * 签名
     */
    private String signature;
    /**
     * 查询流水号(queryId),交易成功后银联返回
     */
    private String queryId;
    /**
     * 请求方保留域，透传字段，查询、通知、对账文件中均会原样出现
     */
    private String reqReserved;
    /**
     * 订单描述，可不上送，上送时控件中会显示该信息
     */
//    private String orderDesc;

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getEncoding() {
        return encoding;
    }

    public void setEncoding(String encoding) {
        this.encoding = encoding;
    }

    public String getSignMethod() {
        return signMethod;
    }

    public void setSignMethod(String signMethod) {
        this.signMethod = signMethod;
    }

    public String getTxnType() {
        return txnType;
    }

    public void setTxnType(String txnType) {
        this.txnType = txnType;
    }

    public String getTxnSubType() {
        return txnSubType;
    }

    public void setTxnSubType(String txnSubType) {
        this.txnSubType = txnSubType;
    }

    public String getBizType() {
        return bizType;
    }

    public void setBizType(String bizType) {
        this.bizType = bizType;
    }

    public String getChannelType() {
        return channelType;
    }

    public void setChannelType(String channelType) {
        this.channelType = channelType;
    }

    public String getFrontUrl() {
        return frontUrl;
    }

    public void setFrontUrl(String frontUrl) {
        this.frontUrl = frontUrl;
    }

    public String getBackUrl() {
        return backUrl;
    }

    public void setBackUrl(String backUrl) {
        this.backUrl = backUrl;
    }

    public String getAccessType() {
        return accessType;
    }

    public void setAccessType(String accessType) {
        this.accessType = accessType;
    }

    public String getMerId() {
        return merId;
    }

    public void setMerId(String merId) {
        this.merId = merId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getTxnTime() {
        return txnTime;
    }

    public void setTxnTime(String txnTime) {
        this.txnTime = txnTime;
    }

    public String getTxnAmt() {
        return txnAmt;
    }

    public void setTxnAmt(String txnAmt) {
        this.txnAmt = txnAmt;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    public String getRequestUrl() {
        return requestUrl;
    }

    public void setRequestUrl(String requestUrl) {
        this.requestUrl = requestUrl;
    }

    public String getReqReserved() {
        return reqReserved;
    }

    public void setReqReserved(String reqReserved) {
        this.reqReserved = reqReserved;
    }

    /*public String getOrderDesc() {
        return orderDesc;
    }

    public void setOrderDesc(String orderDesc) {
        this.orderDesc = orderDesc;
    }*/

    public String getCertId() {
        return certId;
    }

    public void setCertId(String certId) {
        this.certId = certId;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getQueryId() {
        return queryId;
    }

    public void setQueryId(String queryId) {
        this.queryId = queryId;
    }
}
