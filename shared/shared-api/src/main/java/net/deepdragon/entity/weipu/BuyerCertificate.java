package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购商证件表
 * 表代码：b2b_buyer_certificate
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerCertificate")
public class BuyerCertificate extends BaseEntity {

	private static final long serialVersionUID = 1969853127954248433L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*采购商Id
	*/
	private String buyerId;
	
	/**
	*营业执照
	*/
	private String businessLicense;
	
	/**
	*开户许可证
	*/
	private String openingPermit;
	
	/**
	*税务登记证
	*/
	private String taxRegistrationCertificate;
	
	/**
	*组织机构代码证
	*/
	private String organizationCodeCertificate;

	/**
	 * 开户行
	 */
	private String openingBank;
	/**
	 * 银行账号
	 */
	private String bankNumber;

	/**
	*删除标识
	*/
	private Integer isDelete;

	/**
	 *分组名称
	 */
	private String groupName;
	
	
	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :采购商Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :采购商Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :营业执照
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getBusinessLicense() {
		return this.businessLicense;
	}

	/**
	* 字段名称 :营业执照
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setBusinessLicense(String businessLicense) {
		 this.businessLicense = businessLicense;
    }
    
	/**
	* 字段名称 :开户许可证
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getOpeningPermit() {
		return this.openingPermit;
	}

	/**
	* 字段名称 :开户许可证
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setOpeningPermit(String openingPermit) {
		 this.openingPermit = openingPermit;
    }
    
	/**
	* 字段名称 :税务登记证
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getTaxRegistrationCertificate() {
		return this.taxRegistrationCertificate;
	}

	/**
	* 字段名称 :税务登记证
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setTaxRegistrationCertificate(String taxRegistrationCertificate) {
		 this.taxRegistrationCertificate = taxRegistrationCertificate;
    }
    
	/**
	* 字段名称 :组织机构代码证
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getOrganizationCodeCertificate() {
		return this.organizationCodeCertificate;
	}

	/**
	* 字段名称 :组织机构代码证
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setOrganizationCodeCertificate(String organizationCodeCertificate) {
		 this.organizationCodeCertificate = organizationCodeCertificate;
    }
    
	/**
	* 字段名称 :删除标识
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :删除标识
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setIsDelete(Integer isDelete) {
		 this.isDelete = isDelete;
    }

	/**
	 * 字段名称 :分组名称
	 * 数据类型 :varchar(256)
	 * 是否必填 :false
	 */
	public String getGroupName() {
		return this.groupName;
	}

	/**
	 * 字段名称 :分组名称
	 * 数据类型 :varchar(256)
	 * 是否必填 :false
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getOpeningBank() {
		return openingBank;
	}

	public void setOpeningBank(String openingBank) {
		this.openingBank = openingBank;
	}

	public String getBankNumber() {
		return bankNumber;
	}

	public void setBankNumber(String bankNumber) {
		this.bankNumber = bankNumber;
	}
}