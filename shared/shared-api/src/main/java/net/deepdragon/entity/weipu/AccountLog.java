package net.deepdragon.entity.weipu;

import org.apache.ibatis.type.Alias;


/**
 * 表名称：用户账户日志
 * 表代码：wp_account_log
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"AccountLog")
public class AccountLog extends BaseEntity {

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
	 * 买方用户ID
	 */
	private String userId;
	/**
	 * 账户资金ID(wp_account的主键)
	 */
	private String accountId;
	/**
	 * 买方用户名
	 */
	private String buyUsername;
	/**
	 * 买方姓名
	 */
	private String buyRealname;
	/**
	 * 订单号
	 */
	private String orderSn;
	/**
	 * 交易类型(0:充值 1:冻结 2：解冻 3：提现)
	 */
	private Integer payMethod;
	/**
	 * 卖方用户ID
	 */
	private String sellerId;
	/**
	 * 卖方用户名
	 */
	private String sellerUsername;
	/**
	 * 卖方姓名
	 */
	private String sellerRealname;
	/**
	 * 卖方用户类型
	 */
	private Integer sellerType;
	/**
	 * 交易金额
	 */
	private Double account;
	/**
	 * 手续费
	 */
	private Double feeAccount;
	/**
	 * 账户金额(上次账户金额)
	 */
	private Double oldAccountTotal;
	/**
	 * 冻结资金(上次冻结资金)
	 */
	private Double oldAccountBlock;
	/**
	 * 状态（0：失败 1：成功）
	 */
	private Integer status;
	/**
	 * 备注
	 */
	private String remark;

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

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getBuyUsername() {
		return buyUsername;
	}

	public void setBuyUsername(String buyUsername) {
		this.buyUsername = buyUsername;
	}

	public String getBuyRealname() {
		return buyRealname;
	}

	public void setBuyRealname(String buyRealname) {
		this.buyRealname = buyRealname;
	}

	public String getOrderSn() {
		return orderSn;
	}

	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}

	public Integer getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(Integer payMethod) {
		this.payMethod = payMethod;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getSellerUsername() {
		return sellerUsername;
	}

	public void setSellerUsername(String sellerUsername) {
		this.sellerUsername = sellerUsername;
	}

	public String getSellerRealname() {
		return sellerRealname;
	}

	public void setSellerRealname(String sellerRealname) {
		this.sellerRealname = sellerRealname;
	}

	public Integer getSellerType() {
		return sellerType;
	}

	public void setSellerType(Integer sellerType) {
		this.sellerType = sellerType;
	}

	public Double getAccount() {
		return account;
	}

	public void setAccount(Double account) {
		this.account = account;
	}

	public Double getFeeAccount() {
		return feeAccount;
	}

	public void setFeeAccount(Double feeAccount) {
		this.feeAccount = feeAccount;
	}

	public Double getOldAccountTotal() {
		return oldAccountTotal;
	}

	public void setOldAccountTotal(Double oldAccountTotal) {
		this.oldAccountTotal = oldAccountTotal;
	}

	public Double getOldAccountBlock() {
		return oldAccountBlock;
	}

	public void setOldAccountBlock(Double oldAccountBlock) {
		this.oldAccountBlock = oldAccountBlock;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}