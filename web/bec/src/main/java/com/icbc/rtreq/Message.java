package com.icbc.rtreq;

/**
 * Created by Administrator on 2016/6/16.
 */
public class Message {

    // 1支持订单支付的银行卡种类：默认“2”。取值范围为0、1、2，其中0表示仅允许使用借记卡支付，1表示仅允许使用信用卡支付，2表示借记卡和信用卡都能对订单进行支付
    private Integer creditType = 2;
    // 1通知类型
    // 在交易转账处理完成后把交易结果通知商户的处理模式。
    // 取值“HS”：在交易完成后实时将通知信息以HTTP协议POST方式，主动发送给商户，发送地址为商户端随订单数据提交的接收工行支付结果的URL即表单中的merURL字段；
    // 取值“AG”：在交易完成后不通知商户。商户需使用浏览器登录工行的B2C商户服务网站，或者使用工行提供的客户端程序API主动获取通知信息。
    private String notifyType = "HS";
    // 2结果发送类型
    // 选输
    // 取值“0”：无论支付成功或者失败，银行都向商户发送交易通知信息；
    // 取值“1”，银行只向商户发送交易成功的通知信息。
    // 只有通知方式为HS时此值有效，如果使用AG方式，可不上送此项，但签名数据中必须包含此项，取值可为空。
    private Integer resultType = 1;

    //TODO
    // 2商户reference：上送商户网站域名（支持通配符，例如“*.某B2C商城.com”），如果上送，工行会在客户支付订单时，校验商户上送域名与客户跳转工行支付页面之前网站域名的一致性。
    private String merReference = "";
    //TODO
    // 2客户端IP：选输，工行在支付页面显示该信息。   注意： 1、	使用IPV4格式。 2、	上送的是客户端的公网IP。 3、	当商户reference项送空时，该项必输。
    private String merCustomIp = "";
    //TODO
    // 2虚拟商品/实物商品标志位：选输，取值“0”：虚拟商品； 取值“1”，实物商品。
    private Integer goodsType = 0;
    // 2买家用户号：选输，工行在支付页面显示该信息。
    private String merCustomID = "";
    // 2买家联系电话：选输，工行在支付页面显示该信息。
    private String merCustomPhone = "";
    // 2收货地址：选输，工行在支付页面显示该信息。
    private String goodsAddress = "";
    // 2订单备注：选输，工行在支付页面显示该信息。
    private String merOrderRemark = "";

    // 2商城提示
    private String merHint = "";
    // 2备注字段1
    private String remark1 = "";
    // 2备注字段2
    private String remark2 = "";


    // 1返回商户URL
    // 必须合法的URL，交易结束，将客户引导到商户的此url，即通过客户浏览器post交易结果信息到商户的此URL
    // 注意：该URL应使用http协议（不能使用https协议），端口号应为80或不指定。
    private String merURL = "";
    // 2返回商户变量：商户自定义，当返回银行结果时，作为一个隐藏域变量，商户可以用此变量维护session等等。由客户端浏览器支付完成后提交通知结果时是明文传输，建议商户对此变量使用额外安全防范措施，如签名、base64
    private String merVAR = "";

    public Integer getCreditType() {
        return creditType;
    }

    public void setCreditType(Integer creditType) {
        this.creditType = creditType;
    }

    public String getGoodsAddress() {
        return goodsAddress;
    }

    public void setGoodsAddress(String goodsAddress) {
        this.goodsAddress = goodsAddress;
    }

    public Integer getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(Integer goodsType) {
        this.goodsType = goodsType;
    }

    public String getMerCustomID() {
        return merCustomID;
    }

    public void setMerCustomID(String merCustomID) {
        this.merCustomID = merCustomID;
    }

    public String getMerCustomIp() {
        return merCustomIp;
    }

    public void setMerCustomIp(String merCustomIp) {
        this.merCustomIp = merCustomIp;
    }

    public String getMerCustomPhone() {
        return merCustomPhone;
    }

    public void setMerCustomPhone(String merCustomPhone) {
        this.merCustomPhone = merCustomPhone;
    }

    public String getMerHint() {
        return merHint;
    }

    public void setMerHint(String merHint) {
        this.merHint = merHint;
    }

    public String getMerOrderRemark() {
        return merOrderRemark;
    }

    public void setMerOrderRemark(String merOrderRemark) {
        this.merOrderRemark = merOrderRemark;
    }

    public String getMerReference() {
        return merReference;
    }

    public void setMerReference(String merReference) {
        this.merReference = merReference;
    }

    public String getMerURL() {
        return merURL;
    }

    public void setMerURL(String merURL) {
        this.merURL = merURL;
    }

    public String getMerVAR() {
        return merVAR;
    }

    public void setMerVAR(String merVAR) {
        this.merVAR = merVAR;
    }

    public String getNotifyType() {
        return notifyType;
    }

    public void setNotifyType(String notifyType) {
        this.notifyType = notifyType;
    }

    public String getRemark1() {
        return remark1;
    }

    public void setRemark1(String remark1) {
        this.remark1 = remark1;
    }

    public String getRemark2() {
        return remark2;
    }

    public void setRemark2(String remark2) {
        this.remark2 = remark2;
    }

    public Integer getResultType() {
        return resultType;
    }

    public void setResultType(Integer resultType) {
        this.resultType = resultType;
    }
}
