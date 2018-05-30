package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：配送清单 表代码：wp_order_distribution
 */
@Alias(Weipu.SIGN + "OrderDistribution")
public class OrderDistribution extends BaseEntity {

	private static final long serialVersionUID = 1929514515823241862L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 订单编号
	 */
	private String orderSn;

	/**
	 * 物流公司
	 */
	private String logisticsCompanyId;

	/**
	 * 物流单号
	 */
	private String logisticsNo;

	/**
	 * 配送员ID
	 */
	private String deliveryManId;

	/**
	 * 配送员姓名
	 */
	private String deliveryManName;

	/**
	 * 配送员备注
	 */
	private String deliveryManDesc;

	private String shippingStatus;// 配送状态
	private String orderStatus;// 订单状态
	private String logisticsCompany;// 物流公司
	private String deliveryMethodName;// 配送方式

	private String sign;//物流公司英文编码
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
	 * 字段名称 :物流公司 数据类型 :bigint 是否必填 :true
	 */
	public String getLogisticsCompanyId() {
		return this.logisticsCompanyId;
	}

	/**
	 * 字段名称 :物流公司 数据类型 :bigint 是否必填 :true
	 */
	public void setLogisticsCompanyId(String logisticsCompanyId) {
		this.logisticsCompanyId = logisticsCompanyId;
	}

	/**
	 * 字段名称 :物流单号 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getLogisticsNo() {
		return this.logisticsNo;
	}

	/**
	 * 字段名称 :物流单号 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setLogisticsNo(String logisticsNo) {
		this.logisticsNo = logisticsNo;
	}

	public String getDeliveryManId() {
		return deliveryManId;
	}

	public void setDeliveryManId(String deliveryManId) {
		this.deliveryManId = deliveryManId;
	}
	
	public String getDeliveryManName() {
		return deliveryManName;
	}

	public void setDeliveryManName(String deliveryManName) {
		this.deliveryManName = deliveryManName;
	}

	public String getDeliveryManDesc() {
		return deliveryManDesc;
	}

	public void setDeliveryManDesc(String deliveryManDesc) {
		this.deliveryManDesc = deliveryManDesc;
	}

	public String getShippingStatus() {
		return shippingStatus;
	}

	public void setShippingStatus(String shippingStatus) {
		this.shippingStatus = shippingStatus;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getLogisticsCompany() {
		return logisticsCompany;
	}

	public void setLogisticsCompany(String logisticsCompany) {
		this.logisticsCompany = logisticsCompany;
	}

	public String getDeliveryMethodName() {
		return deliveryMethodName;
	}

	public void setDeliveryMethodName(String deliveryMethodName) {
		this.deliveryMethodName = deliveryMethodName;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}
}