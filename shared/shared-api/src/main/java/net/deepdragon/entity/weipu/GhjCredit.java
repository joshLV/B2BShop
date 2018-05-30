package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_ghj_credit
 * 表代码：ghj_ghj_credit
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjCredit")
public class GhjCredit extends BaseEntity {

	private static final long serialVersionUID = 1096634562755122890L;
	
	/**
	*tenantId
	*/
	private String tenantId;
	
	/**
	*platform
	*/
	private Integer platform;
	
	/**
	*buyerId
	*/
	private String buyerId;
	
	/**
	*operator
	*/
	private String operator;
	
	/**
	*contacts
	*/
	private String contacts;
	
	/**
	*applyAmount
	*/
	private Double applyAmount;
	
	/**
	*mobile
	*/
	private String mobile;
	
	/**
	*applyTime
	*/
	private Date applyTime;
	
	/**
	*compDesc
	*/
	private String compDesc;
	
	/**
	*dealTime
	*/
	private Date dealTime;
	
	/**
	*status
	*/
	private String status;
	
	/**
	*remark
	*/
	private String remark;

	/**
	 * 回复ID
	 */
	private String replyId;

	public String getReplyId() {
		return replyId;
	}

	public void setReplyId(String replyId) {
		this.replyId = replyId;
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
	* 字段名称 :contacts
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getContacts() {
		return this.contacts;
	}

	/**
	* 字段名称 :contacts
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setContacts(String contacts) {
		 this.contacts = contacts;
    }
    
	/**
	* 字段名称 :applyAmount
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getApplyAmount() {
		return this.applyAmount;
	}

	/**
	* 字段名称 :applyAmount
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setApplyAmount(Double applyAmount) {
		 this.applyAmount = applyAmount;
    }
    
	/**
	* 字段名称 :mobile
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public String getMobile() {
		return this.mobile;
	}

	/**
	* 字段名称 :mobile
	* 数据类型 :varchar(16)
	* 是否必填 :false
	*/
	public void setMobile(String mobile) {
		 this.mobile = mobile;
    }
    
	/**
	* 字段名称 :applyTime
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getApplyTime() {
		return this.applyTime;
	}

	/**
	* 字段名称 :applyTime
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setApplyTime(Date applyTime) {
		 this.applyTime = applyTime;
    }
    
	/**
	* 字段名称 :compDesc
	* 数据类型 :varchar(10000)
	* 是否必填 :false
	*/
	public String getCompDesc() {
		return this.compDesc;
	}

	/**
	* 字段名称 :compDesc
	* 数据类型 :varchar(10000)
	* 是否必填 :false
	*/
	public void setCompDesc(String compDesc) {
		 this.compDesc = compDesc;
    }
    
	/**
	* 字段名称 :dealTime
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getDealTime() {
		return this.dealTime;
	}

	/**
	* 字段名称 :dealTime
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setDealTime(Date dealTime) {
		 this.dealTime = dealTime;
    }
    
	/**
	* 字段名称 :status
	* 数据类型 :varchar(30)
	* 是否必填 :false
	*/
	public String getStatus() {
		return this.status;
	}

	/**
	* 字段名称 :status
	* 数据类型 :varchar(30)
	* 是否必填 :false
	*/
	public void setStatus(String status) {
		 this.status = status;
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