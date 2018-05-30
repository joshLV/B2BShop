package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购商发票信息
 * 表代码：b2b_buyer_invoice
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerInvoice")
public class BuyerInvoice extends BaseEntity {

	private static final long serialVersionUID = 1544358763601466637L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*采购商ID
	*/
	private String buyerId;
	
	/**
	*发票类型
	*/
	private Integer invoiceType;
	
	/**
	*发票抬头
	*/
	private String invoiceTitle;
	
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
	* 字段名称 :发票类型
	* 数据类型 :tinyint(1)
	* 是否必填 :false
	*/
	public Integer getInvoiceType() {
		return this.invoiceType;
	}

	/**
	* 字段名称 :发票类型
	* 数据类型 :tinyint(1)
	* 是否必填 :false
	*/
	public void setInvoiceType(Integer invoiceType) {
		 this.invoiceType = invoiceType;
    }
    
	/**
	* 字段名称 :发票抬头
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public String getInvoiceTitle() {
		return this.invoiceTitle;
	}

	/**
	* 字段名称 :发票抬头
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public void setInvoiceTitle(String invoiceTitle) {
		 this.invoiceTitle = invoiceTitle;
    }
    
	/**
	* 字段名称 :是否默认
	* 数据类型 :int(1)
	* 是否必填 :false
	*/
	public Integer getIsDefault() {
		return this.isDefault;
	}

	/**
	* 字段名称 :是否默认
	* 数据类型 :int(1)
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