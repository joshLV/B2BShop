package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_ghj_credit_used_log
 * 表代码：ghj_ghj_credit_used_log
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditUsedLog")
public class GhjCreditUsedLog extends BaseEntity {

	private static final long serialVersionUID = 1821990867177026656L;

	/**
	*tenantId
	*/
	private String tenantId;
	
	/**
	*platform
	*/
	private Integer platform;
	
	/**
	*replyId
	*/
	private String replyId;
	
	/**
	*buyerId
	*/
	private String buyerId;
	
	/**
	*amount
	*/
	private Double amount;
	
	/**
	*usedTime
	*/
	private Date usedTime;
	
	/**
	*remark
	*/
	private String remark;


	private String bankName;
	private String bankDept;
	private Double totalAmount;
	private Double usedAmount;
    private Double creditAmount;

	public Double getCreditAmount() {
		return creditAmount;
	}

	public void setCreditAmount(Double creditAmount) {
		this.creditAmount = creditAmount;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankDept() {
		return bankDept;
	}

	public void setBankDept(String bankDept) {
		this.bankDept = bankDept;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public Double getUsedAmount() {
		return usedAmount;
	}

	public void setUsedAmount(Double usedAmount) {
		this.usedAmount = usedAmount;
	}

	/**
	* 字段名称 :tenantId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :tenantId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :platform
	* 数据类型 :int(1)
	* 是否必填 :false
	*/
	public Integer getPlatform() {
		return this.platform;
	}

	/**
	* 字段名称 :platform
	* 数据类型 :int(1)
	* 是否必填 :false
	*/
	public void setPlatform(Integer platform) {
		 this.platform = platform;
    }
    
	/**
	* 字段名称 :replyId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getReplyId() {
		return this.replyId;
	}

	/**
	* 字段名称 :replyId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setReplyId(String replyId) {
		 this.replyId = replyId;
    }
    
	/**
	* 字段名称 :buyerId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :buyerId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :amount
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getAmount() {
		return this.amount;
	}

	/**
	* 字段名称 :amount
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setAmount(Double amount) {
		 this.amount = amount;
    }
    
	/**
	* 字段名称 :usedTime
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getUsedTime() {
		return this.usedTime;
	}

	/**
	* 字段名称 :usedTime
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setUsedTime(Date usedTime) {
		 this.usedTime = usedTime;
    }
    
	/**
	* 字段名称 :remark
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public String getRemark() {
		return this.remark;
	}

	/**
	* 字段名称 :remark
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public void setRemark(String remark) {
		 this.remark = remark;
    }
    
}