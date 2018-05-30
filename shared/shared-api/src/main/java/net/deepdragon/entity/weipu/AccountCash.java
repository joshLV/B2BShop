package net.deepdragon.entity.weipu;

import org.apache.ibatis.type.Alias;

import java.util.Date;


/**
 * 表名称：用户提现申请
 * 表代码：wp_account_cash
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"AccountCash")
public class AccountCash extends BaseEntity {

	private static final long serialVersionUID = 1861069741584972248L;

	/**
	 *租户ID
	 */
	private String tenantId;
	/**
	 * 所属平台((1.B2B、2.B2C))
	 */
	private Integer platform;
	/**
	 * 用户ID
	 */
	private String userId;
	/**
	 * 用户名
	 */
	private String userName;
	/**
	 * 提现方式(0:支付宝 1:银联)
	 */
	private Integer cashType;
	/**
	 * 银行卡号/支付宝账号
	 */
	private String cashNo;
	/**
	 * 提现姓名
	 */
	private String cashName;
	/**
	 * 提现手机号
	 */
	private String cashPhone;
	/**
	 * 银行名
	 */
	private String bankName;
	/**
	 * 交易流水号
	 */
	private String numberNo;
	/**
	 * 银行支行省市名称
	 */
	private String bankProvince;
	/**
	 * 银行支行地市名称
	 */
	private String bankCity;
	/**
	 * 提现金额
	 */
	private Double cashAccount;
	/**
	 * 手续费
	 */
	private Double feeAccount;
	/**
	 * 实际到账金额
	 */
	private Double actualAccount;
	/**
	 * 状态(0:未审核 1.审核通过 2.未审核通过 3转账中 4.已转账)
	 */
	private Integer status;
	/**
	 * 申请时间
	 */
	private Date applyDate;
	/**
	 * 审批人
	 */
	private String approveOperator;
	/**
	 * 审批时间
	 */
	private Date approveDate;
	/**
	 * 审批原因
	 */
	private String approveReason;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 转账人
	 */
	private String operator;
	/**
	 * 转账时间
	 */
	private Date operatorDate;

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public Integer getPlatform() {
		return platform;
	}

	public void setPlatform(Integer platform) {
		this.platform = platform;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getCashType() {
		return cashType;
	}

	public void setCashType(Integer cashType) {
		this.cashType = cashType;
	}

	public String getCashNo() {
		return cashNo;
	}

	public void setCashNo(String cashNo) {
		this.cashNo = cashNo;
	}

	public String getCashName() {
		return cashName;
	}

	public void setCashName(String cashName) {
		this.cashName = cashName;
	}

	public String getCashPhone() {
		return cashPhone;
	}

	public void setCashPhone(String cashPhone) {
		this.cashPhone = cashPhone;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getNumberNo() {
		return numberNo;
	}

	public void setNumberNo(String numberNo) {
		this.numberNo = numberNo;
	}

	public String getBankProvince() {
		return bankProvince;
	}

	public void setBankProvince(String bankProvince) {
		this.bankProvince = bankProvince;
	}

	public String getBankCity() {
		return bankCity;
	}

	public void setBankCity(String bankCity) {
		this.bankCity = bankCity;
	}

	public Double getCashAccount() {
		return cashAccount;
	}

	public void setCashAccount(Double cashAccount) {
		this.cashAccount = cashAccount;
	}

	public Double getFeeAccount() {
		return feeAccount;
	}

	public void setFeeAccount(Double feeAccount) {
		this.feeAccount = feeAccount;
	}

	public Double getActualAccount() {
		return actualAccount;
	}

	public void setActualAccount(Double actualAccount) {
		this.actualAccount = actualAccount;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public String getApproveOperator() {
		return approveOperator;
	}

	public void setApproveOperator(String approveOperator) {
		this.approveOperator = approveOperator;
	}

	public Date getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
	}

	public String getApproveReason() {
		return approveReason;
	}

	public void setApproveReason(String approveReason) {
		this.approveReason = approveReason;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public Date getOperatorDate() {
		return operatorDate;
	}

	public void setOperatorDate(Date operatorDate) {
		this.operatorDate = operatorDate;
	}
}