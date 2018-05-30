package com.weixin.protocol;

/**
 * Created by chris on 2016/3/14.
 */
public class AsynNotifyReqData extends ReqData {
    //返回状态码 SUCCESS/FAIL 必填   此字段是通信标识，非交易标识，交易是否成功需要查看result_code来判断
    private String return_code;

    //返回信息 非必填
    private String return_msg;


    //-----------以下字段在return_code为SUCCESS的时候有返回--------------
    //-----------begin--------------
    //公众账号ID 必填
    private String appid;

    //商户号 必填
    private String mch_id;

    //设备号 非必填
    private String device_info;

    //随机字符串 必填
    private String nonce_str;

    //签名 必填
    private String sign;

    //业务结果 SUCCESS/FAIL 必填
    private String result_code;

    //错误代码 非必填
    private String err_code;

    //错误代码描述 非必填
    private String err_code_des;

    //用户标识 必填
    private String openid;

    //是否关注公众账号 非必填 Y-关注，N-未关注，仅在公众账号类型支付有效
    private String is_subscribe;

    //交易类型 必填 JSAPI、NATIVE、APP
    private String trade_type;

    //付款银行 必填
    private String bank_type;

    //总金额 必填 订单总金额，单位为分
    private String total_fee;

    //货币种类 必填
    private String fee_type;

    //现金支付金额 必填
    private String cash_fee;

    //现金支付货币类型 非必填
    private String cash_fee_type;

    //代金券或立减优惠金额 非必填
    private String coupon_fee;

    //代金券或立减优惠使用数量 非必填
    private String coupon_count;

    //代金券或立减优惠ID 非必填
    private String coupon_id_$n;

    //单个代金券或立减优惠支付金额 非必填
    private String coupon_fee_$n;

    //微信支付订单号 必填
    private String transaction_id;

    //商户订单号 必填
    private String out_trade_no;

    //商家数据包 非必填
    private String attach;

    //支付完成时间 必填
    private String time_end;
    //------------end---------------


    public String getReturn_code() {
        return return_code;
    }

    public void setReturn_code(String return_code) {
        this.return_code = return_code;
    }

    public String getReturn_msg() {
        return return_msg;
    }

    public void setReturn_msg(String return_msg) {
        this.return_msg = return_msg;
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

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getIs_subscribe() {
        return is_subscribe;
    }

    public void setIs_subscribe(String is_subscribe) {
        this.is_subscribe = is_subscribe;
    }

    public String getTrade_type() {
        return trade_type;
    }

    public void setTrade_type(String trade_type) {
        this.trade_type = trade_type;
    }

    public String getBank_type() {
        return bank_type;
    }

    public void setBank_type(String bank_type) {
        this.bank_type = bank_type;
    }

    public String getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(String total_fee) {
        this.total_fee = total_fee;
    }

    public String getFee_type() {
        return fee_type;
    }

    public void setFee_type(String fee_type) {
        this.fee_type = fee_type;
    }

    public String getCash_fee() {
        return cash_fee;
    }

    public void setCash_fee(String cash_fee) {
        this.cash_fee = cash_fee;
    }

    public String getCash_fee_type() {
        return cash_fee_type;
    }

    public void setCash_fee_type(String cash_fee_type) {
        this.cash_fee_type = cash_fee_type;
    }

    public String getCoupon_fee() {
        return coupon_fee;
    }

    public void setCoupon_fee(String coupon_fee) {
        this.coupon_fee = coupon_fee;
    }

    public String getCoupon_count() {
        return coupon_count;
    }

    public void setCoupon_count(String coupon_count) {
        this.coupon_count = coupon_count;
    }

    public String getCoupon_id_$n() {
        return coupon_id_$n;
    }

    public void setCoupon_id_$n(String coupon_id_$n) {
        this.coupon_id_$n = coupon_id_$n;
    }

    public String getCoupon_fee_$n() {
        return coupon_fee_$n;
    }

    public void setCoupon_fee_$n(String coupon_fee_$n) {
        this.coupon_fee_$n = coupon_fee_$n;
    }

    public String getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public String getTime_end() {
        return time_end;
    }

    public void setTime_end(String time_end) {
        this.time_end = time_end;
    }


    public AsynNotifyReqData buildReturn_code(String return_code) {
        this.return_code = return_code;
        return this;
    }


    public AsynNotifyReqData buildReturn_msg(String return_msg) {
        this.return_msg = return_msg;
        return this;
    }

    public AsynNotifyReqData buildAppid(String appid) {
        this.appid = appid;
        return this;
    }

    public AsynNotifyReqData buildMch_id(String mch_id) {
        this.mch_id = mch_id;
        return this;
    }

    public AsynNotifyReqData buildDevice_info(String device_info) {
        this.device_info = device_info;
        return this;
    }


    public AsynNotifyReqData buildNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
        return this;
    }

    public AsynNotifyReqData buildSign(String sign) {
        this.sign = sign;
        return this;
    }


    public AsynNotifyReqData buildResult_code(String result_code) {
        this.result_code = result_code;
        return this;
    }


    public AsynNotifyReqData buildErr_code(String err_code) {
        this.err_code = err_code;
        return this;
    }

    public AsynNotifyReqData buildErr_code_des(String err_code_des) {
        this.err_code_des = err_code_des;
        return this;
    }


    public AsynNotifyReqData buildOpenid(String openid) {
        this.openid = openid;
        return this;
    }


    public AsynNotifyReqData buildIs_subscribe(String is_subscribe) {
        this.is_subscribe = is_subscribe;
        return this;
    }

    public AsynNotifyReqData buildTrade_type(String trade_type) {
        this.trade_type = trade_type;
        return this;
    }


    public AsynNotifyReqData buildBank_type(String bank_type) {
        this.bank_type = bank_type;
        return this;
    }


    public AsynNotifyReqData buildTotal_fee(String total_fee) {
        this.total_fee = total_fee;
        return this;
    }

    public AsynNotifyReqData buildFee_type(String fee_type) {
        this.fee_type = fee_type;
        return this;
    }

    public AsynNotifyReqData buildCash_fee(String cash_fee) {
        this.cash_fee = cash_fee;
        return this;
    }


    public AsynNotifyReqData buildCash_fee_type(String cash_fee_type) {
        this.cash_fee_type = cash_fee_type;
        return this;
    }


    public AsynNotifyReqData buildCoupon_fee(String coupon_fee) {
        this.coupon_fee = coupon_fee;
        return this;
    }

    public AsynNotifyReqData buildCoupon_count(String coupon_count) {
        this.coupon_count = coupon_count;
        return this;
    }

    public AsynNotifyReqData buildCoupon_id_$n(String coupon_id_$n) {
        this.coupon_id_$n = coupon_id_$n;
        return this;
    }

    public AsynNotifyReqData buildCoupon_fee_$n(String coupon_fee_$n) {
        this.coupon_fee_$n = coupon_fee_$n;
        return this;
    }


    public AsynNotifyReqData buildTransaction_id(String transaction_id) {
        this.transaction_id = transaction_id;
        return this;
    }


    public AsynNotifyReqData buildOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
        return this;
    }


    public AsynNotifyReqData buildAttach(String attach) {
        this.attach = attach;
        return this;
    }


    public AsynNotifyReqData buildTime_end(String time_end) {
        this.time_end = time_end;
        return this;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("AsynNotifyReqData{");
        sb.append("return_code='").append(return_code).append('\'');
        sb.append(", return_msg='").append(return_msg).append('\'');
        sb.append(", appid='").append(appid).append('\'');
        sb.append(", mch_id='").append(mch_id).append('\'');
        sb.append(", device_info='").append(device_info).append('\'');
        sb.append(", nonce_str='").append(nonce_str).append('\'');
        sb.append(", sign='").append(sign).append('\'');
        sb.append(", result_code='").append(result_code).append('\'');
        sb.append(", err_code='").append(err_code).append('\'');
        sb.append(", err_code_des='").append(err_code_des).append('\'');
        sb.append(", openid='").append(openid).append('\'');
        sb.append(", is_subscribe='").append(is_subscribe).append('\'');
        sb.append(", trade_type='").append(trade_type).append('\'');
        sb.append(", bank_type='").append(bank_type).append('\'');
        sb.append(", total_fee='").append(total_fee).append('\'');
        sb.append(", fee_type='").append(fee_type).append('\'');
        sb.append(", cash_fee='").append(cash_fee).append('\'');
        sb.append(", cash_fee_type='").append(cash_fee_type).append('\'');
        sb.append(", coupon_fee='").append(coupon_fee).append('\'');
        sb.append(", coupon_count='").append(coupon_count).append('\'');
        sb.append(", coupon_id_$n='").append(coupon_id_$n).append('\'');
        sb.append(", coupon_fee_$n='").append(coupon_fee_$n).append('\'');
        sb.append(", transaction_id='").append(transaction_id).append('\'');
        sb.append(", out_trade_no='").append(out_trade_no).append('\'');
        sb.append(", attach='").append(attach).append('\'');
        sb.append(", time_end='").append(time_end).append('\'');
        sb.append('}');
        return super.toString() + ", " + sb.toString();
    }

    @Override
    public String getUrl() {
        return null;
    }
}
