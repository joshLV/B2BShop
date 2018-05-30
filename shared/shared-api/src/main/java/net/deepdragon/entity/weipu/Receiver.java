package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：收货地址
 * 表代码：wp_receiver
*/
@Alias(Weipu.SIGN+"Receiver")
public class Receiver extends BaseEntity {

	private static final long serialVersionUID = 1959895632888085966L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*会员ID
	*/
	private String memberId;
	
	/**
	*姓名
	*/
	private String name;
	
	/**
	*电子信箱
	*/
	private String email;
	
	/**
	*地区ID
	*/
	private String areaId;
	
	/**
	*地区路径
	*/
	private String areaPath;
	
	/**
	*地区名称
	*/
	private String areaName;
	
	/**
	*地址
	*/
	private String address;
	
	/**
	*邮编
	*/
	private String zipCode;
	
	/**
	*电话
	*/
	private String phone;
	
	/**
	*手机
	*/
	private String mobile;
	
	/**
	*是否默认
	*/
	private Integer isDefault;
	
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
	* 字段名称 :会员ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getMemberId() {
		return this.memberId;
	}

	/**
	* 字段名称 :会员ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setMemberId(String memberId) {
		 this.memberId = memberId;
    }
    
	/**
	* 字段名称 :姓名
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :姓名
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :电子信箱
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getEmail() {
		return this.email;
	}

	/**
	* 字段名称 :电子信箱
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setEmail(String email) {
		 this.email = email;
    }
	
	/**
	* 字段名称 :地区ID
	* 数据类型 :varchar(128)
	* 是否必填 :true
	*/
	public String getAreaId() {
		return this.areaId;
	}

	/**
	* 字段名称 :地区ID
	* 数据类型 :varchar(128)
	* 是否必填 :true
	*/
	public void setAreaId(String areaId) {
		 this.areaId = areaId;
    }
    
	/**
	* 字段名称 :地区路径
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public String getAreaPath() {
		return this.areaPath;
	}

	/**
	* 字段名称 :地区路径
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public void setAreaPath(String areaPath) {
		 this.areaPath = areaPath;
    }
	
	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	/**
	* 字段名称 :地址
	* 数据类型 :varchar(128)
	* 是否必填 :true
	*/
	public String getAddress() {
		return this.address;
	}

	/**
	* 字段名称 :地址
	* 数据类型 :varchar(128)
	* 是否必填 :true
	*/
	public void setAddress(String address) {
		 this.address = address;
    }
    
	/**
	* 字段名称 :邮编
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public String getZipCode() {
		return this.zipCode;
	}

	/**
	* 字段名称 :邮编
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public void setZipCode(String zipCode) {
		 this.zipCode = zipCode;
    }
    
	/**
	* 字段名称 :电话
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getPhone() {
		return this.phone;
	}

	/**
	* 字段名称 :电话
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setPhone(String phone) {
		 this.phone = phone;
    }
    
	/**
	* 字段名称 :手机
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public String getMobile() {
		return this.mobile;
	}

	/**
	* 字段名称 :手机
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public void setMobile(String mobile) {
		 this.mobile = mobile;
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
    
}