package net.deepdragon.entity.weipu;

/**
 * author :乐昌海
 */

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

/**
 * 表名称：资产中心 银行卡
 * 表代码：ghj_assets_bankcard
 */
@Alias(Weipu.SIGN+"BankCard")
public class BankCard extends BaseEntity{

    /**
     *采购商ID
     */
    private String buyerId;
    /**
     *租户ID
     */
    private String tenantId;
    /**
     *开户名
     */
    private String accountName;

    /**
     *开户行名称
     */
    private String bankName;

    /**
     *银行卡号
     */
    private String bankcardcode;

    /**
     *分行地址
     */
    private String branchAddress;

    /**
     *手机
     */
    private String mobile;
    /**
     *地区名称
     */
    private String areaName;
    /**
     *地区ID
     */
    private String areaId;
    /**
     *地区路径
     */
    private String areaPath;
    /**
     * 银行卡余额
     */
    private Double balance;

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
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

    public String getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankcardcode() {
        return bankcardcode;
    }

    public void setBankcardcode(String bankcardcode) {
        this.bankcardcode = bankcardcode;
    }

    public String getBranchAddress() {
        return branchAddress;
    }

    public void setBranchAddress(String branchAddress) {
        this.branchAddress = branchAddress;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }
}
