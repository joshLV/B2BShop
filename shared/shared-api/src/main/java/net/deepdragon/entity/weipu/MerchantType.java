package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商家类型
 * 表代码：wp_merchant_type
*/
@Alias(Weipu.SIGN+"MerchantType")
public class MerchantType extends BaseEntity {

	private static final long serialVersionUID = 1354826143872977111L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*类型名称
	*/
	private String name;
	
	/**
	*是否默认
	*/
	private Integer isDefault;
	
	/**
	*类型描述
	*/
	private String description;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	
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
	* 字段名称 :类型名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :类型名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :是否默认
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getIsDefault() {
		return this.isDefault;
	}

	/**
	* 字段名称 :是否默认
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setIsDefault(Integer isDefault) {
		 this.isDefault = isDefault;
    }
    
	/**
	* 字段名称 :类型描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :类型描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }
    
	/**
	* 字段名称 :显示序号
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	* 字段名称 :显示序号
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setOrderNo(Integer orderNo) {
		 this.orderNo = orderNo;
    }
    
}