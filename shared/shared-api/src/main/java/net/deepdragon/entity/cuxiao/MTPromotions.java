package net.deepdragon.entity.cuxiao;

import net.deepdragon.constant.cuxiao.Cuxiao;
import net.deepdragon.entity.weipu.BaseEntity;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * Created by gzj on 2016-04-12.
 * 促销信息实体类
 */
@Alias(Cuxiao.SIGN + "MTPromotions")
public class MTPromotions extends BaseEntity {
    /**
     * 活动商品ID
     */
    private String pgId;
    /**
     * 商品ID
     */
    private String goodsId;
    /**
     * 商品全名
     */
    private String goodsFullName;
    /**
     * 商品名称
     */
    private String goodsName;
    /**
     * 商品图片URL
     */
    private String url;
    /**
     * 开始时间
     */
    private Date startTime;
    /**
     * 结束时间
     */
    private Date endTime;
    /**
     * 活动价格
     */
    private Double promotionsPrice;
    /**
     * 商品价格
     */
    private Double price;
    /**
     * 商品原价格
     */
    private Double goodsPrice;
    /**
     * 活动类型
     */
    private String activityType;
    /**
     * 起购数量
     */
    private Integer startNum;
    /**
     * 限购数量
     */
    private Integer limitNum;
    /**
     * 活动状态， ing 正在进行， before 即将开始， after 已结束
     */
    private String status;

    /**
     * 距离开始时间的时间差 秒
     */
    private Long intervalStartTime;

    /**
     * 距离结束时间的时间差 秒
     */
    private Long intervalEndTime;

    /**
     * 分类ID
     */
    private String categoryId;
    /**
     * 分类Path
     */
    private String categoryPath;

    private String promotionsId;
    private String isOpen;
    private String restore;
    private String orderNo;
    private Integer quantity;


    private Integer resultCount;//促销活动用户下单统计数量


    public String getPgId() {
        return pgId;
    }

    public void setPgId(String pgId) {
        this.pgId = pgId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsFullName() {
        return goodsFullName;
    }

    public void setGoodsFullName(String goodsFullName) {
        this.goodsFullName = goodsFullName;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Double getPromotionsPrice() {
        return promotionsPrice;
    }

    public void setPromotionsPrice(Double promotionsPrice) {
        this.promotionsPrice = promotionsPrice;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getIntervalStartTime() {
        return intervalStartTime;
    }

    public void setIntervalStartTime(Long intervalStartTime) {
        this.intervalStartTime = intervalStartTime;
    }

    public Long getIntervalEndTime() {
        return intervalEndTime;
    }

    public void setIntervalEndTime(Long intervalEndTime) {
        this.intervalEndTime = intervalEndTime;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryPath() {
        return categoryPath;
    }

    public void setCategoryPath(String categoryPath) {
        this.categoryPath = categoryPath;
    }

    public String getPromotionsId() {
        return promotionsId;
    }

    public void setPromotionsId(String promotionsId) {
        this.promotionsId = promotionsId;
    }

    public String getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(String isOpen) {
        this.isOpen = isOpen;
    }

    public String getRestore() {
        return restore;
    }

    public void setRestore(String restore) {
        this.restore = restore;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getResultCount() {
        return resultCount;
    }

    public void setResultCount(Integer resultCount) {
        this.resultCount = resultCount;
    }
}
