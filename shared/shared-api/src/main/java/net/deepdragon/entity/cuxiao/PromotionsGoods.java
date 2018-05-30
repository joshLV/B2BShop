package net.deepdragon.entity.cuxiao;

import net.deepdragon.constant.cuxiao.Cuxiao;
import net.deepdragon.entity.weipu.BaseEntity;
import org.apache.ibatis.type.Alias;

/**
 * Created by gzj on 2016-04-12.
 * 促销商品实体类
 */
@Alias(Cuxiao.SIGN + "PromotionsGoods")
public class PromotionsGoods extends BaseEntity {
    private String promotionsId;  //优惠活动主表Id
    private String goodsId;  //商品Id
    private Double goodsPrice;  //商品原价
    private Double promotionsPrice;  //商品活动价
    private String description;     //商品描述
    private Integer orderNo;  //排序号

    /** `startNum` int(11) NOT NULL DEFAULT '1' COMMENT '商品起批数量', */
    private Integer startNum;
    /** `limitNum` int(11) NOT NULL DEFAULT '0' COMMENT '商品限购数量,0_不限制', */
    private Integer limitNum;

    private Integer oldStartNum;    //原起买数量
    private Integer oldLimitNum;    //原限购数量
    private Integer newStartNum;    //新起买数量
    private Integer newLimitNum;    //新限购数量

    private Integer oldStock;//原库存数量
    private Integer newStock;//活动库存数量

    private String isDelete; //是否删除：Y-已删除，N-未删除
    private String tenantId;

    public String getPromotionsId() {
        return promotionsId;
    }

    public void setPromotionsId(String promotionsId) {
        this.promotionsId = promotionsId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public Double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Double getPromotionsPrice() {
        return promotionsPrice;
    }

    public void setPromotionsPrice(Double promotionsPrice) {
        this.promotionsPrice = promotionsPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getStartNum() {
        return startNum;
    }

    public void setStartNum(Integer startNum) {
        this.startNum = startNum;
    }

    public Integer getLimitNum() {
        return limitNum;
    }

    public void setLimitNum(Integer limitNum) {
        this.limitNum = limitNum;
    }

    public Integer getOldStartNum() {
        return oldStartNum;
    }

    public void setOldStartNum(Integer oldStartNum) {
        this.oldStartNum = oldStartNum;
    }

    public Integer getOldLimitNum() {
        return oldLimitNum;
    }

    public void setOldLimitNum(Integer oldLimitNum) {
        this.oldLimitNum = oldLimitNum;
    }

    public Integer getNewStartNum() {
        return newStartNum;
    }

    public void setNewStartNum(Integer newStartNum) {
        this.newStartNum = newStartNum;
    }

    public Integer getNewLimitNum() {
        return newLimitNum;
    }

    public void setNewLimitNum(Integer newLimitNum) {
        this.newLimitNum = newLimitNum;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public Integer getOldStock() {
        return oldStock;
    }

    public void setOldStock(Integer oldStock) {
        this.oldStock = oldStock;
    }

    public Integer getNewStock() {
        return newStock;
    }

    public void setNewStock(Integer newStock) {
        this.newStock = newStock;
    }
}
