package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

/**
 * Created by gzj on 2015/9/24 0024.
 */
@Alias(Weipu.SIGN+"MemberInvoice")
public class MemberInvoice extends BaseEntity {
    /**
     *租户Id
     * */
    private String tenantId;

    /**
     *会员Id
     * */
    private String memberId;

    /**
     *发票抬头
     * */
    private String invoiceTitle;

    /**
     *是否默认
     * */
    private Integer isDefault;

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getMemberId() {
        return memberId;
    }

    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }

    public String getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(String invoiceTitle) {
        this.invoiceTitle = invoiceTitle;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }
}
