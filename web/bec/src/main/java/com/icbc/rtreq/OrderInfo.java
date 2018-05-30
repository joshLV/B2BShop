package com.icbc.rtreq;

import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamImplicit;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/6/16.
 */

public class OrderInfo {


    // 1交易日期时间：目前要求在银行系统当前时间的前后十分钟范围内，否则判定交易时间非法。
    private String orderDate;
    // 1支付币种：用来区分一笔支付的币种，目前工行只支持使用人民币（001）支付。 取值： “001”
    private String curType = "001";

    //TODO
    // 1商户代码：唯一确定一个商户的代码，由商户在工行开户时，由工行告知商户。
    private String merID;

    public void setSubOrderInfoList(List subOrderInfoList) {
        this.subOrderInfoList = subOrderInfoList;
    }

    private List subOrderInfoList = new ArrayList();

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getCurType() {
        return curType;
    }

    public void setCurType(String curType) {
        this.curType = curType;
    }

    public String getMerID() {
        return merID;
    }

    public void setMerID(String merID) {
        this.merID = merID;
    }


    public List getSubOrderInfoList() {
        return subOrderInfoList;
    }

    public void addSubOrderInfo(SubOrderInfo subOrder) {
        this.subOrderInfoList.add(subOrder);
    }

}
