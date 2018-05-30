/*
 * Copyright (c) 2014.
 * All Rights Reversed by WanXiang Corp.
 */

package net.deepdragon.erp.yunji.entity;

import java.util.Date;

/**
 * 功能：商品单位APIrequest类
 * 作者: 田敬
 * 时间: 2014年6月25日
 */
public class PackingUnitRequest {
    public Date lastModifiedTime;   //最后一次修改时间 即最近同步时间
    public String productCode;       //商品code
    public String productID;         //商品ID

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public Date getLastModifiedTime() {
        return lastModifiedTime!=null?(Date)lastModifiedTime.clone():null;
    }
    public void setLastModifiedTime(Date lastModifiedTime) {
        this.lastModifiedTime = lastModifiedTime!=null?(Date)lastModifiedTime.clone():null;
    }
}
