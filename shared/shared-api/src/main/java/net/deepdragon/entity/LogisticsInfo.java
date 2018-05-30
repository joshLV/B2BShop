package net.deepdragon.entity;

import net.deepdragon.constant.Shared;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * Created by Administrator on 2016/11/30.
 */
@Alias(Shared.SIGN+"LogisticsInfo")
public class LogisticsInfo  extends BaseEntity  {
    private static final long serialVersionUID = 1816703890322872222L;

    private String tenantId;
    private String orderSn;
    private String logisticsSn;
    private Date logisticsTime;
    private String logisticsContent;
    private String remarks1;
    private String remarks2;

    public String getRemarks2() {
        return remarks2;
    }

    public void setRemarks2(String remarks2) {
        this.remarks2 = remarks2;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn;
    }

    public String getLogisticsSn() {
        return logisticsSn;
    }

    public void setLogisticsSn(String logisticsSn) {
        this.logisticsSn = logisticsSn;
    }

    public Date getLogisticsTime() {
        return logisticsTime;
    }

    public void setLogisticsTime(Date logisticsTime) {
        this.logisticsTime = logisticsTime;
    }

    public String getLogisticsContent() {
        return logisticsContent;
    }

    public void setLogisticsContent(String logisticsContent) {
        this.logisticsContent = logisticsContent;
    }

    public String getRemarks1() {
        return remarks1;
    }

    public void setRemarks1(String remarks1) {
        this.remarks1 = remarks1;
    }
}
