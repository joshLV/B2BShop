package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：店铺审核意见
 * 表代码：wp_merchant_audit
*/
@Alias(Weipu.SIGN+"MerchantAudit")
public class MerchantAudit extends BaseEntity {

	private static final long serialVersionUID = 1032317123340974322L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*店铺ID
	*/
	private String merchantId;
	
	/**
	*操作员类型
	*/
	private String userType;
	
	/**
	*操作员
	*/
	private String userName;
	
	/**
	*审核状态
	*/
	private Integer status;
	
	/**
	*描述信息
	*/
	private String description;
	
	
	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :店铺ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getMerchantId() {
		return this.merchantId;
	}

	/**
	* 字段名称 :店铺ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setMerchantId(String merchantId) {
		 this.merchantId = merchantId;
    }
    
	/**
	* 字段名称 :操作员类型
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public String getUserType() {
		return this.userType;
	}

	/**
	* 字段名称 :操作员类型
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public void setUserType(String userType) {
		 this.userType = userType;
    }
    
	/**
	* 字段名称 :操作员
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getUserName() {
		return this.userName;
	}

	/**
	* 字段名称 :操作员
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setUserName(String userName) {
		 this.userName = userName;
    }
    
	/**
	* 字段名称 :审核状态
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getStatus() {
		return this.status;
	}

	/**
	* 字段名称 :审核状态
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setStatus(Integer status) {
		 this.status = status;
    }
    
	/**
	* 字段名称 :描述信息
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :描述信息
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }
    
}