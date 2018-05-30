package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：ghj_ghj_redenvelop_accesslog
 * 表代码：ghj_ghj_redenvelop_accesslog
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GhjRedenvelopAccesslog")
public class GhjRedenvelopAccesslog extends BaseEntity {

	private static final long serialVersionUID = 1316146347256255139L;

	/**
	 * 租户ID
	 */
	private String tenantId;
	/**
	*采购商ID，参考b2b_buyer表的主键字段
	*/
	private String buyerId;
	
	/**
	*为空时表示由平台发放； 不为空时为供应商ID，参考wp_merchant表的主键字
	 */
	private String merchantId;

	/**
	 * 红包类型：rebate： 返利红包；action：活动红包
	 */
	private String redEnvelopType;
	
	/**
	*红包ID，参考ghj_redenvelop_grandlog表的主键字段
	*/
	private String redEnvelopId;
	
	/**
	*0：存 -- 领取红包；1：取 -- 支付订单；
	 */
	private Integer accessType;
	
	/**
	*交易金额（存为正值，取为负值）
	*/
	private Double amount;
	
	/**
	*订单编号
	*/
	private String orderSn;
	/**
	 *订单ID
	 */
	private String orderId;
	
	/**
	*领取红包的时间或使用红包支付的时间
	*/
	private Date createTime;

	/**
	*红包失效时间
	*/
	private Date expiryTime;
	/**
	 * 红包分组ID
	 */
	private String groupId;

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(String merchantId) {
		this.merchantId = merchantId;
	}

	public String getRedEnvelopType() {
		return redEnvelopType;
	}

	public void setRedEnvelopType(String redEnvelopType) {
		this.redEnvelopType = redEnvelopType;
	}

	public String getRedEnvelopId() {
		return redEnvelopId;
	}

	public void setRedEnvelopId(String redEnvelopId) {
		this.redEnvelopId = redEnvelopId;
	}

	public Integer getAccessType() {
		return accessType;
	}

	public void setAccessType(Integer accessType) {
		this.accessType = accessType;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getOrderSn() {
		return orderSn;
	}

	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getExpiryTime() {
		return expiryTime;
	}

	public void setExpiryTime(Date expiryTime) {
		this.expiryTime = expiryTime;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
}