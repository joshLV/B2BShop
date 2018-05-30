package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：退款单信息 表代码：wp_order_refund
 */
@Alias(Weipu.SIGN + "OrderRefund")
public class OrderRefund extends BaseEntity {

	private static final long serialVersionUID = 1144643128132044164L;

	// 退款类型（未收到货、已收到货）
	public enum RefundType {
		unreceived, received
	}

	// 退款状态（已提交、已受理、已退回、已发货,等待卖家收货、卖家已收货,等待退款、已退款,等待买家确认、已完成）,失败
	public enum RefundStatus {
		commit, confirmed, returned, shipped, unrefund, refunded, success,fail
	}

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 店铺标识
	 */
	private String shopId;

	/**
	 * 订单主键
	 */
	private String orderId;

	/**
	 * 订单编号
	 */
	private String orderSn;

	/**
	 * 会员ID
	 */
	private String memberId;

	/**
	 * 退款金额
	 */
	private Double amount;

	/**
	 * 退款卡号
	 */
	private String cardNo;

	/**
	 * 退款类型
	 */
	private RefundType type;

	/**
	 * 退款状态
	 */
	private RefundStatus status;

	/**
	 * 退款原因
	 */
	private String reason;

	/**
	 * 退款说明
	 */
	private String info;

	/**
	 * 物流名称
	 */
	private String logisticsName;

	/**
	 * 物流单号
	 */
	private String logisticsNo;

	/**
	 * 收货人姓名
	 */
	private String shipName;

	/**
	 * 收货地区ID
	 */
	private String shipAreaId;

	/**
	 * 收货地区路径
	 */
	private String shipAreaPath;

	/**
	 * 收货地址
	 */
	private String shipAddress;

	/**
	 * 收货邮编
	 */
	private String shipZipCode;

	/**
	 * 收货电话
	 */
	private String shipPhone;

	/**
	 * 收货手机
	 */
	private String shipMobile;

	/**
	 * 经办人
	 */
	private String attn;
	private String address;// 收货地址

	/**
	 *所属平台
	 */
	private String platform;
	/**
	 *退款单类型：0_一般退款单，1_众筹退款单
	 */
	private Integer orderType;

	public Integer getOrderType() {
		return orderType;
	}

	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public String getPlatform() {
		return this.platform;
	}

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public void setPlatform(String platform) {
		this.platform = platform;
	}

	/**
	 * 字段名称 :租户ID 数据类型 :bigint 是否必填 :true
	 */
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	 * 字段名称 :租户ID 数据类型 :bigint 是否必填 :true
	 */
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	/**
	 * 字段名称 :店铺标识 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getShopId() {
		return this.shopId;
	}

	/**
	 * 字段名称 :店铺标识 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	/**
	 * 字段名称 :订单编号 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getOrderSn() {
		return this.orderSn;
	}

	/**
	 * 字段名称 :订单编号 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}

	/**
	 * 字段名称 :会员ID 数据类型 :bigint 是否必填 :true
	 */
	public String getMemberId() {
		return this.memberId;
	}

	/**
	 * 字段名称 :会员ID 数据类型 :bigint 是否必填 :true
	 */
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	/**
	 * 字段名称 :退款金额 数据类型 :decimal(24,4) 是否必填 :true
	 */
	public Double getAmount() {
		return this.amount;
	}

	/**
	 * 字段名称 :退款金额 数据类型 :decimal(24,4) 是否必填 :true
	 */
	public void setAmount(Double amount) {
		this.amount = amount;
	}

	/**
	 * 字段名称 :退款卡号 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getCardNo() {
		return this.cardNo;
	}

	/**
	 * 字段名称 :退款卡号 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	/**
	 * 字段名称 :退款类型 数据类型 :varchar(32) 是否必填 :true
	 */
	public RefundType getType() {
		return this.type;
	}

	/**
	 * 字段名称 :退款类型 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setType(RefundType type) {
		this.type = type;
	}

	/**
	 * 字段名称 :退款状态 数据类型 :varchar(32) 是否必填 :true
	 */
	public RefundStatus getStatus() {
		return this.status;
	}

	/**
	 * 字段名称 :退款状态 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setStatus(RefundStatus status) {
		this.status = status;
	}

	/**
	 * 字段名称 :退款原因 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getReason() {
		return this.reason;
	}

	/**
	 * 字段名称 :退款原因 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}

	/**
	 * 字段名称 :退款说明 数据类型 :varchar(1024) 是否必填 :false
	 */
	public String getInfo() {
		return this.info;
	}

	/**
	 * 字段名称 :退款说明 数据类型 :varchar(1024) 是否必填 :false
	 */
	public void setInfo(String info) {
		this.info = info;
	}

	/**
	 * 字段名称 :物流名称 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getLogisticsName() {
		return this.logisticsName;
	}

	/**
	 * 字段名称 :物流名称 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setLogisticsName(String logisticsName) {
		this.logisticsName = logisticsName;
	}

	/**
	 * 字段名称 :物流单号 数据类型 :varchar(64) 是否必填 :false
	 */
	public String getLogisticsNo() {
		return this.logisticsNo;
	}

	/**
	 * 字段名称 :物流单号 数据类型 :varchar(64) 是否必填 :false
	 */
	public void setLogisticsNo(String logisticsNo) {
		this.logisticsNo = logisticsNo;
	}

	/**
	 * 字段名称 :收货人姓名 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getShipName() {
		return this.shipName;
	}

	/**
	 * 字段名称 :收货人姓名 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	/**
	 * 字段名称 :收货地区ID 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getShipAreaId() {
		return this.shipAreaId;
	}

	/**
	 * 字段名称 :收货地区ID 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setShipAreaId(String shipAreaId) {
		this.shipAreaId = shipAreaId;
	}

	/**
	 * 字段名称 :收货地区路径 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getShipAreaPath() {
		return this.shipAreaPath;
	}

	/**
	 * 字段名称 :收货地区路径 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setShipAreaPath(String shipAreaPath) {
		this.shipAreaPath = shipAreaPath;
	}

	/**
	 * 字段名称 :收货地址 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getShipAddress() {
		return this.shipAddress;
	}

	/**
	 * 字段名称 :收货地址 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	/**
	 * 字段名称 :收货邮编 数据类型 :varchar(16) 是否必填 :false
	 */
	public String getShipZipCode() {
		return this.shipZipCode;
	}

	/**
	 * 字段名称 :收货邮编 数据类型 :varchar(16) 是否必填 :false
	 */
	public void setShipZipCode(String shipZipCode) {
		this.shipZipCode = shipZipCode;
	}

	/**
	 * 字段名称 :收货电话 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getShipPhone() {
		return this.shipPhone;
	}

	/**
	 * 字段名称 :收货电话 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setShipPhone(String shipPhone) {
		this.shipPhone = shipPhone;
	}

	/**
	 * 字段名称 :收货手机 数据类型 :varchar(16) 是否必填 :false
	 */
	public String getShipMobile() {
		return this.shipMobile;
	}

	/**
	 * 字段名称 :收货手机 数据类型 :varchar(16) 是否必填 :false
	 */
	public void setShipMobile(String shipMobile) {
		this.shipMobile = shipMobile;
	}

	/**
	 * 字段名称 :经办人 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getAttn() {
		return this.attn;
	}

	/**
	 * 字段名称 :经办人 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setAttn(String attn) {
		this.attn = attn;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
}