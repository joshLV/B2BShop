package net.deepdragon.entity.cuxiao;

import net.deepdragon.constant.cuxiao.Cuxiao;
import net.deepdragon.entity.weipu.BaseEntity;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * Created by gzj on 2016-04-12.
 * 促销信息实体类
 */
@Alias(Cuxiao.SIGN + "Promotions")
public class Promotions extends BaseEntity {
    private String pName; //活动名称
    private String pFlag; //活动标识
    private String description; //活动描述
    private String imgUrl; //活动图片
    private Date startTime; //活动开始时间
    private Date endTime; //活动结束时间
    private String isOpen; //活动是否开启
    //活动即将开始
    public static String CREATE="create";
    //活动开始
    public static String START="start";
    //活动结束
    public static String END="end";

    private String tenantId;

    private String isDelete;//是否删除：Y-已删除，N-未删除
    private String activityType; //活动类型(major：专场；groupon:团购; seckill :秒杀)
    private String restore;//是否恢复商品原价(yes:已恢复；no未恢复)

    public String getpName() {
        return pName;
    }
    public String getPName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpFlag() {
        return pFlag;
    }
    public String getPFlag() {
        return pFlag;
    }

    public void setpFlag(String pFlag) {
        this.pFlag = pFlag;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
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

    public String getIsOpen() {
        return isOpen;
    }

    public void setIsOpen(String isOpen) {
        this.isOpen = isOpen;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public String getRestore() {
        return restore;
    }

    public void setRestore(String restore) {
        this.restore = restore;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }
}
