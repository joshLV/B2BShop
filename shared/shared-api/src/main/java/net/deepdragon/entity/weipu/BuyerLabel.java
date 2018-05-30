package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购商标签管理
 * 表代码：b2b_buyer_label
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerLabel")
public class BuyerLabel extends BaseEntity {

	private static final long serialVersionUID = 1164467302210702447L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*标签名称
	*/
	private String name;
	
	/**
	*采购商ID
	*/
	private String buyerId;
	
	/**
	*删除标识
	*/
	private Integer isDelete;
	
	
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
	* 字段名称 :标签名称
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :标签名称
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :采购商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :采购商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
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