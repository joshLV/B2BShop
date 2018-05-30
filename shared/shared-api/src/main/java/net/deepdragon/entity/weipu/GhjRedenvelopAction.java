package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_redenvelop_action
 * 表代码：ghj_ghj_redenvelop_action
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopAction")
public class GhjRedenvelopAction extends BaseEntity {

	private static final long serialVersionUID = 1646497031389224295L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*为空时表示由平台发放；NOT NULL时为供应商ID，参考wp_merchant表的主键字段
	*/
	private String merchantId;
	
	/**
	*活动总金额
	*/
	private Double allAmount;
	
	/**
	*0：定向；1：非定向
	*/
	private Integer isAssigned;
	
	/**
	*红包有效期（单位天）；为0时表示永远有效
	*/
	private Integer validityPeriod;
	
	/**
	*创建时间
	*/
	private Date createTime;
	
	/**
	*confirmed 审核状态：1.unconfirm未审核;2.confirmed 审核通过;3.reject 拒绝，审核不通过;（平台活动，不需要审核，默认审核通过）
	*/
	private String status;
	
	/**
	*审核人
	*/
	private String auditPersonId;
	
	/**
	*审核人姓名
	*/
	private String auditPersonName;
	
	/**
	*审核时间
	*/
	private Date auditTime;
	
	/**
	*审核意见
	*/
	private String auditOpinion;
	
	/**
	*是否删除：Y-已删除，N-未删除
	*/
	private Boolean isDelete;
	
	
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
	* 字段名称 :为空时表示由平台发放；NOT NULL时为供应商ID，参考wp_merchant表的主键字段
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getMerchantId() {
		return this.merchantId;
	}

	/**
	* 字段名称 :为空时表示由平台发放；NOT NULL时为供应商ID，参考wp_merchant表的主键字段
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setMerchantId(String merchantId) {
		 this.merchantId = merchantId;
    }
    
	/**
	* 字段名称 :活动总金额
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getAllAmount() {
		return this.allAmount;
	}

	/**
	* 字段名称 :活动总金额
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setAllAmount(Double allAmount) {
		 this.allAmount = allAmount;
    }
    
	/**
	* 字段名称 :0：定向；1：非定向
	* 数据类型 :int(2)
	* 是否必填 :false
	*/
	public Integer getIsAssigned() {
		return this.isAssigned;
	}

	/**
	* 字段名称 :0：定向；1：非定向
	* 数据类型 :int(2)
	* 是否必填 :false
	*/
	public void setIsAssigned(Integer isAssigned) {
		 this.isAssigned = isAssigned;
    }
    
	/**
	* 字段名称 :红包有效期（单位天）；为0时表示永远有效
	* 数据类型 :int(4)
	* 是否必填 :false
	*/
	public Integer getValidityPeriod() {
		return this.validityPeriod;
	}

	/**
	* 字段名称 :红包有效期（单位天）；为0时表示永远有效
	* 数据类型 :int(4)
	* 是否必填 :false
	*/
	public void setValidityPeriod(Integer validityPeriod) {
		 this.validityPeriod = validityPeriod;
    }
    
	/**
	* 字段名称 :创建时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getCreateTime() {
		return this.createTime;
	}

	/**
	* 字段名称 :创建时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setCreateTime(Date createTime) {
		 this.createTime = createTime;
    }
    
	/**
	* 字段名称 :confirmed 审核状态：1.unconfirm未审核;2.confirmed 审核通过;3.reject 拒绝，审核不通过;（平台活动，不需要审核，默认审核通过）
	* 数据类型 :varchar(20)
	* 是否必填 :false
	*/
	public String getStatus() {
		return this.status;
	}

	/**
	* 字段名称 :confirmed 审核状态：1.unconfirm未审核;2.confirmed 审核通过;3.reject 拒绝，审核不通过;（平台活动，不需要审核，默认审核通过）
	* 数据类型 :varchar(20)
	* 是否必填 :false
	*/
	public void setStatus(String status) {
		 this.status = status;
    }
    
	/**
	* 字段名称 :审核人
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getAuditPersonId() {
		return this.auditPersonId;
	}

	/**
	* 字段名称 :审核人
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setAuditPersonId(String auditPersonId) {
		 this.auditPersonId = auditPersonId;
    }
    
	/**
	* 字段名称 :审核人姓名
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getAuditPersonName() {
		return this.auditPersonName;
	}

	/**
	* 字段名称 :审核人姓名
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setAuditPersonName(String auditPersonName) {
		 this.auditPersonName = auditPersonName;
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
	* 数据类型 :varchar(100)
	* 是否必填 :false
	*/
	public String getAuditOpinion() {
		return this.auditOpinion;
	}

	/**
	* 字段名称 :审核意见
	* 数据类型 :varchar(100)
	* 是否必填 :false
	*/
	public void setAuditOpinion(String auditOpinion) {
		 this.auditOpinion = auditOpinion;
    }
    
	/**
	* 字段名称 :是否删除：Y-已删除，N-未删除
	* 数据类型 :char(1)
	* 是否必填 :false
	*/
	public Boolean getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :是否删除：Y-已删除，N-未删除
	* 数据类型 :char(1)
	* 是否必填 :false
	*/
	public void setIsDelete(Boolean isDelete) {
		 this.isDelete = isDelete;
    }
    
}