package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：询价单采购商中间表
 * 表代码：b2b_enquiry_buyer
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"EnquiryBuyer")
public class EnquiryBuyer extends BaseEntity {

	private static final long serialVersionUID = 1604446079414113023L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*采购商表ID
	*/
	private String buyerId;
	
	/**
	*询价表ID
	*/
	private String enquiryId;
	
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
	* 字段名称 :采购商表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :采购商表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :询价表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getEnquiryId() {
		return this.enquiryId;
	}

	/**
	* 字段名称 :询价表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setEnquiryId(String enquiryId) {
		 this.enquiryId = enquiryId;
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