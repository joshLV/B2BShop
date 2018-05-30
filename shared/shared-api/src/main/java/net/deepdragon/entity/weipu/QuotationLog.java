package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：报价表日志表
 * 表代码：b2b_quotation_log
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"QuotationLog")
public class QuotationLog extends BaseEntity {

	private static final long serialVersionUID = 1647214582773298474L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*报价表ID
	*/
	private String quotationId;
	
	/**
	*内容
	*/
	private String content;
	
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
	* 字段名称 :报价表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getQuotationId() {
		return this.quotationId;
	}

	/**
	* 字段名称 :报价表ID
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setQuotationId(String quotationId) {
		 this.quotationId = quotationId;
    }
    
	/**
	* 字段名称 :内容
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public String getContent() {
		return this.content;
	}

	/**
	* 字段名称 :内容
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public void setContent(String content) {
		 this.content = content;
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