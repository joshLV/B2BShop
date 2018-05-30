package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购商信息审核表
 * 表代码：b2b_buyer_audit
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerAudit")
public class BuyerAudit extends BaseEntity {

	private static final long serialVersionUID = 1415256145079993102L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*采购商ID
	*/
	private String buyerId;
	
	/**
	*审核人
	*/
	private String auditUser;
	
	/**
	*审核时间
	*/
	private Date auditTime;
	
	/**
	*审核意见
	*/
	private String auditOpinion;
	
	/**
	*审核状态
	*/
	private Integer auditStatus;
	
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
	* 字段名称 :审核人
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getAuditUser() {
		return this.auditUser;
	}

	/**
	* 字段名称 :审核人
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setAuditUser(String auditUser) {
		 this.auditUser = auditUser;
    }
    
	/**
	* 字段名称 :审核时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getAuditTime() {
		return this.auditTime;
	}

	/**
	* 字段名称 :审核时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setAuditTime(Date auditTime) {
		 this.auditTime = auditTime;
    }
    
	/**
	* 字段名称 :审核意见
	* 数据类型 :varcahar(256)
	* 是否必填 :false
	*/
	public String getAuditOpinion() {
		return this.auditOpinion;
	}

	/**
	* 字段名称 :审核意见
	* 数据类型 :varcahar(256)
	* 是否必填 :false
	*/
	public void setAuditOpinion(String auditOpinion) {
		 this.auditOpinion = auditOpinion;
    }
    
	/**
	* 字段名称 :审核状态
	* 数据类型 :tinyint(1)
	* 是否必填 :false
	*/
	public Integer getAuditStatus() {
		return this.auditStatus;
	}

	/**
	* 字段名称 :审核状态
	* 数据类型 :tinyint(1)
	* 是否必填 :false
	*/
	public void setAuditStatus(Integer auditStatus) {
		 this.auditStatus = auditStatus;
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