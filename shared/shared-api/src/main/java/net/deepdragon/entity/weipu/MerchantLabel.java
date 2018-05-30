package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：供应商-采购商标签关联表
 * 表代码：b2b_merchant_label
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"MerchantLabel")
public class MerchantLabel extends BaseEntity {

	private static final long serialVersionUID = 1706770539749607702L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*供应商ID
	*/
	private String merchantId;
	
	/**
	*标签ID
	*/
	private String labelId;
	
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
	* 字段名称 :供应商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getMerchantId() {
		return this.merchantId;
	}

	/**
	* 字段名称 :供应商ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setMerchantId(String merchantId) {
		 this.merchantId = merchantId;
    }
    
	/**
	* 字段名称 :标签ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getLabelId() {
		return this.labelId;
	}

	/**
	* 字段名称 :标签ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setLabelId(String labelId) {
		 this.labelId = labelId;
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