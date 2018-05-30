package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购商收货地址
 * 表代码：b2b_buyer_receiver
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerReceiver")
public class BuyerReceiver extends BaseEntity {

	private static final long serialVersionUID = 1184432503620572368L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*采购商ID
	*/
	private String buyerId;
	
	/**
	*收货人
	*/
	private String name;
	
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
	*手机
	*/
	private String mobile;
	
	/**
	*电话
	*/
	private String phone;
	
	/**
	*是否默认
	*/
	private Integer isDefault;
	
	/**
	*删除标识
	*/
	private Integer isDelete;
	
	
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
	* 字段名称 :采购商ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :采购商ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :收货人
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :收货人
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :地区ID
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getAreaId() {
		return this.areaId;
	}

	/**
	* 字段名称 :地区ID
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setAreaId(String areaId) {
		 this.areaId = areaId;
    }
    
	/**
	* 字段名称 :地区路径
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getAreaPath() {
		return this.areaPath;
	}

	/**
	* 字段名称 :地区路径
	* 数据类型 :varchar(256)
	* 是否必填 :false
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
	* 是否必填 :false
	*/
	public String getAddress() {
		return this.address;
	}

	/**
	* 字段名称 :地址
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setAddress(String address) {
		 this.address = address;
    }
    
	/**
	* 字段名称 :邮编
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getZipCode() {
		return this.zipCode;
	}

	/**
	* 字段名称 :邮编
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setZipCode(String zipCode) {
		 this.zipCode = zipCode;
    }
    
	/**
	* 字段名称 :手机
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getMobile() {
		return this.mobile;
	}

	/**
	* 字段名称 :手机
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setMobile(String mobile) {
		 this.mobile = mobile;
    }
    
	/**
	* 字段名称 :电话
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getPhone() {
		return this.phone;
	}

	/**
	* 字段名称 :电话
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setPhone(String phone) {
		 this.phone = phone;
    }
    
	/**
	* 字段名称 :是否默认
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getIsDefault() {
		return this.isDefault;
	}

	/**
	* 字段名称 :是否默认
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setIsDefault(Integer isDefault) {
		 this.isDefault = isDefault;
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
    
}