package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：申请放款记录表
 * 表代码：ghj_ghj_credit_loan_log
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditLoanLog")
public class GhjCreditLoanLog extends BaseEntity {

	private static final long serialVersionUID = 1315404764139865993L;
	
	/**
	*主键ID
	*/
	private String loanLogId;
	
	/**
	*授信回复信息表ID
	*/
	private String replyId;
	
	/**
	*采购商Id
	*/
	private String buyerId;
	
	/**
	*申请放款时间
	*/
	private Date applyLoanTime;
	
	/**
	*申请放款金额
	*/
	private Double applyLoanAmount;
	
	/**
	*实际放款金额
	*/
	private Double actualLoanAmount;
	
	/**
	*放款状态
	*/
	private String loanStatus;
	
	/**
	*放款人
	*/
	private String loanUser;
	
	/**
	*放款时间
	*/
	private Date actualLoanTime;
	
	/**
	*备注
	*/
	private String remark;
	
	private String tenantId;

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	/**
	* 字段名称 :主键ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getLoanLogId() {
		return this.loanLogId;
	}

	/**
	* 字段名称 :主键ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setLoanLogId(String loanLogId) {
		 this.loanLogId = loanLogId;
    }
    
	/**
	* 字段名称 :授信回复信息表ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getReplyId() {
		return this.replyId;
	}

	/**
	* 字段名称 :授信回复信息表ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setReplyId(String replyId) {
		 this.replyId = replyId;
    }
    
	/**
	* 字段名称 :采购商Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :采购商Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :申请放款时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getApplyLoanTime() {
		return this.applyLoanTime;
	}

	/**
	* 字段名称 :申请放款时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setApplyLoanTime(Date applyLoanTime) {
		 this.applyLoanTime = applyLoanTime;
    }
    
	/**
	* 字段名称 :申请放款金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getApplyLoanAmount() {
		return this.applyLoanAmount;
	}

	/**
	* 字段名称 :申请放款金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setApplyLoanAmount(Double applyLoanAmount) {
		 this.applyLoanAmount = applyLoanAmount;
    }
    
	/**
	* 字段名称 :实际放款金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getActualLoanAmount() {
		return this.actualLoanAmount;
	}

	/**
	* 字段名称 :实际放款金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setActualLoanAmount(Double actualLoanAmount) {
		 this.actualLoanAmount = actualLoanAmount;
    }
    
	/**
	* 字段名称 :放款状态
	* 数据类型 :varchar(30)
	* 是否必填 :false
	*/
	public String getLoanStatus() {
		return this.loanStatus;
	}

	/**
	* 字段名称 :放款状态
	* 数据类型 :varchar(30)
	* 是否必填 :false
	*/
	public void setLoanStatus(String loanStatus) {
		 this.loanStatus = loanStatus;
    }
    
	/**
	* 字段名称 :放款人
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getLoanUser() {
		return this.loanUser;
	}

	/**
	* 字段名称 :放款人
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setLoanUser(String loanUser) {
		 this.loanUser = loanUser;
    }
    
	/**
	* 字段名称 :放款时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getActualLoanTime() {
		return this.actualLoanTime;
	}

	/**
	* 字段名称 :放款时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setActualLoanTime(Date actualLoanTime) {
		 this.actualLoanTime = actualLoanTime;
    }
    
	/**
	* 字段名称 :备注
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public String getRemark() {
		return this.remark;
	}

	/**
	* 字段名称 :备注
	* 数据类型 :varchar(500)
	* 是否必填 :false
	*/
	public void setRemark(String remark) {
		 this.remark = remark;
    }
    
}