package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

/**
 * author :乐昌海
 * 表代码：ghj_complaint_form
 */
@Alias(Weipu.SIGN+"Complaint")
public class Complaint extends BaseEntity{

    /**
     *租户ID
     */
    private String tenantId;
    /**
     *订单号
     */
    private String orderSn;

    /**
     *申诉人姓名
     */
    private String complaintUserName;
    /**
     *申诉人手机号
     */

    private String complaintUserMobile;

    /**
     *申诉内容
     */
    private String content;

    /**
     *处理人姓名
     */
    private String handleUserName;
    /**
     *处理时间
     */
    private String handleTime;
    /**
     *处理状态
     */
    private String handleResultStatu;

    /**
     *处理结果
     */
    private String handleResult;

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

    public String getComplaintUserName() {
        return complaintUserName;
    }

    public void setComplaintUserName(String complaintUserName) {
        this.complaintUserName = complaintUserName;
    }

    public String getComplaintUserMobile() {
        return complaintUserMobile;
    }

    public void setComplaintUserMobile(String complaintUserMobile) {
        this.complaintUserMobile = complaintUserMobile;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getHandleUserName() {
        return handleUserName;
    }

    public void setHandleUserName(String handleUserName) {
        this.handleUserName = handleUserName;
    }

    public String getHandleTime() {
        return handleTime;
    }

    public void setHandleTime(String handleTime) {
        this.handleTime = handleTime;
    }

    public String getHandleResultStatu() {
        return handleResultStatu;
    }

    public void setHandleResultStatu(String handleResultStatu) {
        this.handleResultStatu = handleResultStatu;
    }

    public String getHandleResult() {
        return handleResult;
    }

    public void setHandleResult(String handleResult) {
        this.handleResult = handleResult;
    }
}
