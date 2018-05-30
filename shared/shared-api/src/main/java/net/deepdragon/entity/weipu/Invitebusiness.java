package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：wp_invitebusiness
 * 表代码：wp_invitebusiness
 */
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"Invitebusiness")
public class Invitebusiness extends BaseEntity {

    private static final long serialVersionUID = 1398771933447155911L;

    /**
     *租户ID
     */
    private String tenantId;

    /**
     *商家名
     */
    private String name;

    /**
     *营业执照编号
     */
    private String businessLicenseCode;

    /**
     *营业执照
     */
    private String businessLicense;

    /**
     *联系人
     */
    private String head;

    /**
     *性别
     */
    private Integer sex;

    /**
     *移动电话
     */
    private String mobile;

    /**
     *固定电话
     */
    private String telphone;

    /**
     *邮箱
     */
    private String email;

    /**
     *所属省份
     */
    private String areaPath;

    /**
     *详细地址
     */
    private String address;

    /**
     *状态
     */
    private Integer status;

    /**
     *备注
     */
    private String remarks;


    /**
     * 字段名称 :租户ID
     * 数据类型 :bigint
     * 是否必填 :false
     */
    public String getTenantId() {
        return this.tenantId;
    }

    /**
     * 字段名称 :租户ID
     * 数据类型 :bigint
     * 是否必填 :false
     */
    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }

    /**
     * 字段名称 :商家名
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public String getName() {
        return this.name;
    }

    /**
     * 字段名称 :商家名
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 字段名称 :营业执照编号
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public String getBusinessLicenseCode() {
        return this.businessLicenseCode;
    }

    /**
     * 字段名称 :营业执照编号
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public void setBusinessLicenseCode(String businessLicenseCode) {
        this.businessLicenseCode = businessLicenseCode;
    }

    /**
     * 字段名称 :营业执照
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public String getBusinessLicense() {
        return this.businessLicense;
    }

    /**
     * 字段名称 :营业执照
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense;
    }

    /**
     * 字段名称 :联系人
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public String getHead() {
        return this.head;
    }

    /**
     * 字段名称 :联系人
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public void setHead(String head) {
        this.head = head;
    }

    /**
     * 字段名称 :性别
     * 数据类型 :int
     * 是否必填 :false
     */
    public Integer getSex() {
        return this.sex;
    }

    /**
     * 字段名称 :性别
     * 数据类型 :int
     * 是否必填 :false
     */
    public void setSex(Integer sex) {
        this.sex = sex;
    }

    /**
     * 字段名称 :移动电话
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public String getMobile() {
        return this.mobile;
    }

    /**
     * 字段名称 :移动电话
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 字段名称 :固定电话
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public String getTelphone() {
        return this.telphone;
    }

    /**
     * 字段名称 :固定电话
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    /**
     * 字段名称 :邮箱
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public String getEmail() {
        return this.email;
    }

    /**
     * 字段名称 :邮箱
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 字段名称 :所属省份
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public String getAreaPath() {
        return this.areaPath;
    }

    /**
     * 字段名称 :所属省份
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public void setAreaPath(String areaPath) {
        this.areaPath = areaPath;
    }

    /**
     * 字段名称 :详细地址
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public String getAddress() {
        return this.address;
    }

    /**
     * 字段名称 :详细地址
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 字段名称 :状态
     * 数据类型 :int
     * 是否必填 :false
     */
    public Integer getStatus() {
        return this.status;
    }

    /**
     * 字段名称 :状态
     * 数据类型 :int
     * 是否必填 :false
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 字段名称 :备注
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public String getRemarks() {
        return this.remarks;
    }

    /**
     * 字段名称 :备注
     * 数据类型 :varchar
     * 是否必填 :false
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

}