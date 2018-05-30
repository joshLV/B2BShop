package com.icbc.rtreq;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamOmitField;

@XStreamAlias("subOrderInfo")
public class SubOrderInfo {


    // 1订单号：客户支付后商户网站产生的一个唯一的定单号，该订单号应该在相当长的时间内不重复。工行通过订单号加订单日期来唯一确认一笔订单的重复性。
    private String orderid;

    // 1订单金额：客户支付订单的总金额，一笔订单一个，以分为单位。不可以为零，必需符合金额标准。
    private String amount;
    // 1分期付款期数：取值：1、3、6、9、12、18、24；1代表全额付款，必须为以上数值，否则订单校验不通过。
    private String installmentTimes = "1";
    // TODO
    // 1商户账号：商户入账账号，只能交易时指定。（商户付给银行手续费的账户，可以在开户的时候指定，也可以用交易指定方式；用交易指定方式则使用此商户账号）
    private String merAcct;
    // 2商品编号
    private String goodsID = "";
    // 1商品名称
    private String goodsName = "";
    // 2商品数量
    private String goodsNum = "";
    // 2已含运费金额
    private String carriageAmt = "";

    @XStreamOmitField()
    private String tranSerialNo;

    public String getTranSerialNo() {
        return tranSerialNo;
    }

    public void setTranSerialNo(String tranSerialNo) {
        this.tranSerialNo = tranSerialNo;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getCarriageAmt() {
        return carriageAmt;
    }

    public void setCarriageAmt(String carriageAmt) {
        this.carriageAmt = carriageAmt;
    }

    public String getGoodsID() {
        return goodsID;
    }

    public void setGoodsID(String goodsID) {
        this.goodsID = goodsID;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(String goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getInstallmentTimes() {
        return installmentTimes;
    }

    public void setInstallmentTimes(String installmentTimes) {
        this.installmentTimes = installmentTimes;
    }

    public String getMerAcct() {
        return merAcct;
    }

    public void setMerAcct(String merAcct) {
        this.merAcct = merAcct;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }
}