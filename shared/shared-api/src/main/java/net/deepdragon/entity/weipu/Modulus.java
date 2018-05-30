package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

/**
 * author :乐昌海
 * 表代码：ghj_shipment_modulus
 */
@Alias(Weipu.SIGN + "Modulus")
public class Modulus extends BaseEntity {
    /**
     * 主键Id
     */
    private String  shipmentId;
    /**
     * 租户ID
     */
    private String tenantId;
    /**
     * 商品Id
     */
    private String goodsId;
    /**
     * 商家Id
     */
    private String shopId;
    /**
     * 区域Id
     */
    private String areaId;
    /**
     * 区域path
     */
    private String areaPath;
    /**
     * 起始区域Id
     */
    private String originAreaId;
    /**
     * 起始区域path
     */
    private String originAreaPath;
    /**
     * 运费系数
     */
    private String shipmentModulus;
    /**
     * 备注
     */
    private String remark;

    public String getShipmentId() {
        return shipmentId;
    }

    public void setShipmentId(String shipmentId) {
        this.shipmentId = shipmentId;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getShopId() {
        return shopId;
    }

    public void setShopId(String shopId) {
        this.shopId = shopId;
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId;
    }

    public String getAreaPath() {
        return areaPath;
    }

    public void setAreaPath(String areaPath) {
        this.areaPath = areaPath;
    }

    public String getOriginAreaId() {
        return originAreaId;
    }

    public void setOriginAreaId(String originAreaId) {
        this.originAreaId = originAreaId;
    }

    public String getOriginAreaPath() {
        return originAreaPath;
    }

    public void setOriginAreaPath(String originAreaPath) {
        this.originAreaPath = originAreaPath;
    }

    public String getShipmentModulus() {
        return shipmentModulus;
    }

    public void setShipmentModulus(String shipmentModulus) {
        this.shipmentModulus = shipmentModulus;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
