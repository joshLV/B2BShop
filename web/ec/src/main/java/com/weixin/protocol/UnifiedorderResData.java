package com.weixin.protocol;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * Created by chris on 2016/3/10.
 */
@XStreamAlias("xml")
public class UnifiedorderResData extends ResData {

    //----------------以下字段在return_code为SUCCESS的时候有返回-----------

    //-----------------------start-----------------------
    //公众帐号ID
    private String appid;

    //商户号
    private String mch_id;

    //设备号
    private String device_info;

    //随机字符串
    private String nonce_str;

    //签名
    private String sign;

    //业务结果
    private String result_code;

    //错误代码
    private String err_code;

    //错误代码描述
    private String err_code_des;
    //------------------------end------------------------

    //----------------以下字段在return_code 和result_code都为SUCCESS的时候有返回-----------
    //-----------------------start-----------------------
    //交易类型
    private String trade_type;

    //预支付交易会话
    private String prepay_id;

    //二维码链接
    private String code_url;

    //------------------------end------------------------


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

    public String getDevice_info() {
        return device_info;
    }

    public void setDevice_info(String device_info) {
        this.device_info = device_info;
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

    public String getResult_code() {
        return result_code;
    }

    public void setResult_code(String result_code) {
        this.result_code = result_code;
    }

    public String getErr_code() {
        return err_code;
    }

    public void setErr_code(String err_code) {
        this.err_code = err_code;
    }

    public String getErr_code_des() {
        return err_code_des;
    }

    public void setErr_code_des(String err_code_des) {
        this.err_code_des = err_code_des;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public String getPrepay_id() {
        return prepay_id;
    }

    public void setPrepay_id(String prepay_id) {
        this.prepay_id = prepay_id;
    }

    public String getCode_url() {
        return code_url;
    }

    public void setCode_url(String code_url) {
        this.code_url = code_url;
    }

    public UnifiedorderResData buildAppid(String appid) {
        this.appid = appid;
        return this;
    }

    public UnifiedorderResData buildMch_id(String mch_id) {
        this.mch_id = mch_id;
        return this;
    }

    public UnifiedorderResData buildDevice_info(String device_info) {
        this.device_info = device_info;
        return this;
    }

    public UnifiedorderResData buildNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
        return this;
    }

    public UnifiedorderResData buildSign(String sign) {
        this.sign = sign;
        return this;
    }

    public UnifiedorderResData buildResult_code(String result_code) {
        this.result_code = result_code;
        return this;
    }

    public UnifiedorderResData buildErr_code(String err_code) {
        this.err_code = err_code;
        return this;
    }

    public UnifiedorderResData buildErr_code_des(String err_code_des) {
        this.err_code_des = err_code_des;
        return this;
    }

    public UnifiedorderResData buildTrade_type(String trade_type) {
        this.trade_type = trade_type;
        return this;
    }

    public UnifiedorderResData buildPrepay_id(String prepay_id) {
        this.prepay_id = prepay_id;
        return this;
    }

    public UnifiedorderResData buildCode_url(String code_url) {
        this.code_url = code_url;
        return this;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("UnifiedorderResData{");
        sb.append("appid='").append(appid).append('\'');
        sb.append(", mch_id='").append(mch_id).append('\'');
        sb.append(", device_info='").append(device_info).append('\'');
        sb.append(", nonce_str='").append(nonce_str).append('\'');
        sb.append(", sign='").append(sign).append('\'');
        sb.append(", result_code='").append(result_code).append('\'');
        sb.append(", err_code='").append(err_code).append('\'');
        sb.append(", err_code_des='").append(err_code_des).append('\'');
        sb.append(", trade_type='").append(trade_type).append('\'');
        sb.append(", prepay_id='").append(prepay_id).append('\'');
        sb.append(", code_url='").append(code_url).append('\'');
        sb.append('}');
        return  super.toString()  + ", " + sb.toString();
    }
}
