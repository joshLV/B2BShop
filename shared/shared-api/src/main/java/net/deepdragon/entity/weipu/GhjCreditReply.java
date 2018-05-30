package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_ghj_credit_reply
 * 表代码：ghj_ghj_credit_reply
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCreditReply")
public class GhjCreditReply extends BaseEntity {

	private static final long serialVersionUID = 1750180219216390919L;

	
	/**
	*tenantId
	*/
	private String tenantId;
	
	/**
	*platform
	*/
	private Integer platform;
	
	/**
	*creditId
	*/
	private String creditId;
	
	/**
	*buyerId
	*/
	private String buyerId;
	
	/**
	*bankName
	*/
	private String bankName;
	/**
	 *银行对应本银行分行或支行名称
	 */
	private String bankDept;
	
	/**
	*creditAmount
	*/
	private Double creditAmount;

	/**
	*totalAmount 累计已放款金额
	*/
	private Double totalAmount;
	
	/**
	*usedAmount
	*/
	private Double usedAmount;

	/**
	 *剩余金额
	 */
	private Double surplusAmount;
	
	/**
	*creditStartDate
	*/
	private Date creditStartDate;
	
	/**
	*creditEndDate
	*/
	private Date creditEndDate;
	
	/**
	*bankrate
	*/
	private Double bankrate;
	
	/**
	*operator
	*/
	private String operator;
	
	/**
	*operatTime
	*/
	private Date operatTime;
	
	/**
	*remark
	*/
	private String remark;

	/**
	 *本次使用资金
	 */
	private Double thisUsedAmount;

	private String replyId;
	/**
	 * 放款申请状态
	 */
	private String loanStatus;

	public String getIsValid() {
		return isValid;
	}

	public void setIsValid(String isValid) {
		this.isValid = isValid;
	}

	/**
	 * 主要用于贷款申请是否在授信有效期内

	 */
	private String isValid;
	/**
	 * 字符串形式的授信起始日期和结束日期
	 */
	private String creditStart;
	private String creditEnd;

	public String getCreditStart() {
		return creditStart;
	}

	public void setCreditStart(String creditStart) {
		this.creditStart = creditStart;
	}

	public String getCreditEnd() {
		return creditEnd;
	}

	public void setCreditEnd(String creditEnd) {
		this.creditEnd = creditEnd;
	}

	/**
	 *剩余的可申请金额
	 */
	private Double residualCredit;

	public Double getResidualCredit() {
		return residualCredit;
	}

	public void setResidualCredit(Double residualCredit) {
		this.residualCredit = residualCredit;
	}

	public String getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}

	public GhjCreditReply() {
	}

	public String getBankDept() {
		return bankDept;
	}

	public void setBankDept(String bankDept) {
		this.bankDept = bankDept;
	}
//	public GhjCreditReply(String id,Double thisUsedAmount) {
//		setId(id);
//		this.thisUsedAmount = thisUsedAmount;
//	}

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
	* 字段名称 :creditId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getCreditId() {
		return this.creditId;
	}

	/**
	* 字段名称 :creditId
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setCreditId(String creditId) {
		 this.creditId = creditId;
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
	* 字段名称 :bankName
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getBankName() {
		return this.bankName;
	}

	/**
	* 字段名称 :bankName
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setBankName(String bankName) {
		 this.bankName = bankName;
    }
    
	/**
	* 字段名称 :creditAmount
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getCreditAmount() {
		return this.creditAmount;
	}

	/**
	* 字段名称 :creditAmount
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setCreditAmount(Double creditAmount) {
		this.creditAmount = creditAmount;
    }
    
	/**
	* 字段名称 :usedAmount
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getUsedAmount() {
		return this.usedAmount;
	}

	/**
	* 字段名称 :usedAmount
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setUsedAmount(Double usedAmount) {
		if( this.totalAmount != null && usedAmount != null ){
			setSurplusAmount(this.totalAmount - usedAmount);
		}
		 this.usedAmount = usedAmount;
    }
    
	/**
	* 字段名称 :creditStartDate
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getCreditStartDate() {
		return this.creditStartDate;
	}

	/**
	* 字段名称 :creditStartDate
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setCreditStartDate(Date creditStartDate) {
		 this.creditStartDate = creditStartDate;
    }
    
	/**
	* 字段名称 :creditEndDate
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getCreditEndDate() {
		return this.creditEndDate;
	}

	/**
	* 字段名称 :creditEndDate
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setCreditEndDate(Date creditEndDate) {
		 this.creditEndDate = creditEndDate;
    }
    
	/**
	* 字段名称 :bankrate
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getBankrate() {
		return this.bankrate;
	}

	/**
	* 字段名称 :bankrate
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setBankrate(Double bankrate) {
		 this.bankrate = bankrate;
    }
    
	/**
	* 字段名称 :operator
	* 数据类型 :varchar(20)
	* 是否必填 :false
	*/
	public String getOperator() {
		return this.operator;
	}

	/**
	* 字段名称 :operator
	* 数据类型 :varchar(20)
	* 是否必填 :false
	*/
	public void setOperator(String operator) {
		 this.operator = operator;
    }
    
	/**
	* 字段名称 :operatTime
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getOperatTime() {
		return this.operatTime;
	}

	/**
	* 字段名称 :operatTime
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setOperatTime(Date operatTime) {
		 this.operatTime = operatTime;
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


	public Double getSurplusAmount() {
		return surplusAmount;
	}

	public void setSurplusAmount(Double surplusAmount) {
		this.surplusAmount = surplusAmount;
	}

	public Double getThisUsedAmount() {
		return thisUsedAmount;
	}

	public void setThisUsedAmount(Double thisUsedAmount) {
		this.thisUsedAmount = thisUsedAmount;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		if( totalAmount != null && this.usedAmount != null ){
			setSurplusAmount(totalAmount - this.usedAmount);
		}
		this.totalAmount = totalAmount;
	}
}