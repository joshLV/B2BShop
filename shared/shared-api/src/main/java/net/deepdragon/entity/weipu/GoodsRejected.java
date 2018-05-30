package net.deepdragon.entity.weipu;

import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：wp_goods_rejected
 * 表代码：wp_goods_rejected
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsRejected")
public class GoodsRejected extends BaseEntity {

	private static final long serialVersionUID = 1131853823845830861L;
	
	/**
	*租户Id信息
	*/
	private String tenantId;
	
	/**
	*所属平台(1、B2B，2、B2C)
	*/
	private Integer platform;
	
	/**
	*退货单号(依照订单号生成规则)
	*/
	private String rejectedSn;
	
	/**
	*订单号
	*/
	private String orderSn;
	
	/**
	*会员Id(采购商Id)
	*/
	private String memberId;
	
	/**
	*店铺或商家Id
	*/
	private String shopId;
	
	/**
	*退货原因
	*/
	private String rejectedReason;
	
	/**
	*退款金额
	*/
	private Double rejectedMoney;
	
	/**
	*运费承担责任方(会员或商家):  存入方案:(member: 会员, merchant: 商家)
	*/
	private String freightTake;
	
	/**
	*运费金额
	*/
	private Double freight;
	
	/**
	*收货地址
	*/
	private String deliveryAddress;
	
	/**
	*物流名称
	*/
	private String logisticsName;
	
	/**
	*物流单号(非物流表主键Id)
	*/
	private String logisticsNo;
	
	/**
	*发货说明
	*/
	private String shippingInstructions;
	
	/**
	*发货凭证1
	*/
	private String shippingVoucher1;
	
	/**
	*发货凭证2
	*/
	private String shippingVoucher2;
	
	/**
	*发货凭证3
	*/
	private String shippingVoucher3;
	
	/**
	*发货时间
	*/
	private Date shippingTime;
	
	/**
	*等待商家审批:waitBusinessApprove, 等待商城审批:waitMallApprove, 等待会员发货:waitMemberSendGoods, 等待商家确认收货:waitBusinessConfirmReceipt, 等待商城退款:waitMallRefund, 退货退款完成refundFinished, 商家审批失败businessApproveFail:, 商城审批失败:mallApproveFail
	*/
	private String rejectedStatus;
	
	/**
	*备注信息
	*/
	private String remark;

	private String createDateFormatter;
	
	
	/**
	* 字段名称 :租户Id信息
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户Id信息
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :所属平台(1、B2B，2、B2C)
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getPlatform() {
		return this.platform;
	}

	/**
	* 字段名称 :所属平台(1、B2B，2、B2C)
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setPlatform(Integer platform) {
		 this.platform = platform;
    }
    
	/**
	* 字段名称 :退货单号(依照订单号生成规则)
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getRejectedSn() {
		return this.rejectedSn;
	}

	/**
	* 字段名称 :退货单号(依照订单号生成规则)
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setRejectedSn(String rejectedSn) {
		 this.rejectedSn = rejectedSn;
    }
    
	/**
	* 字段名称 :订单号
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getOrderSn() {
		return this.orderSn;
	}

	/**
	* 字段名称 :订单号
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setOrderSn(String orderSn) {
		 this.orderSn = orderSn;
    }
    
	/**
	* 字段名称 :会员Id(采购商Id)
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getMemberId() {
		return this.memberId;
	}

	/**
	* 字段名称 :会员Id(采购商Id)
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setMemberId(String memberId) {
		 this.memberId = memberId;
    }
    
	/**
	* 字段名称 :店铺或商家Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getShopId() {
		return this.shopId;
	}

	/**
	* 字段名称 :店铺或商家Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setShopId(String shopId) {
		 this.shopId = shopId;
    }
    
	/**
	* 字段名称 :退货原因
	* 数据类型 :varchar(2000)
	* 是否必填 :false
	*/
	public String getRejectedReason() {
		return this.rejectedReason;
	}

	/**
	* 字段名称 :退货原因
	* 数据类型 :varchar(2000)
	* 是否必填 :false
	*/
	public void setRejectedReason(String rejectedReason) {
		 this.rejectedReason = rejectedReason;
    }
    
	/**
	* 字段名称 :退款金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getRejectedMoney() {
		return this.rejectedMoney;
	}

	/**
	* 字段名称 :退款金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setRejectedMoney(Double rejectedMoney) {
		 this.rejectedMoney = rejectedMoney;
    }
    
	/**
	* 字段名称 :运费承担责任方(会员或商家):  存入方案:(member: 会员, merchant: 商家)
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getFreightTake() {
		return this.freightTake;
	}

	/**
	* 字段名称 :运费承担责任方(会员或商家):  存入方案:(member: 会员, merchant: 商家)
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setFreightTake(String freightTake) {
		 this.freightTake = freightTake;
    }
    
	/**
	* 字段名称 :运费金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getFreight() {
		return this.freight;
	}

	/**
	* 字段名称 :运费金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setFreight(Double freight) {
		 this.freight = freight;
    }
    
	/**
	* 字段名称 :收货地址
	* 数据类型 :varchar(200)
	* 是否必填 :false
	*/
	public String getDeliveryAddress() {
		return this.deliveryAddress;
	}

	/**
	* 字段名称 :收货地址
	* 数据类型 :varchar(200)
	* 是否必填 :false
	*/
	public void setDeliveryAddress(String deliveryAddress) {
		 this.deliveryAddress = deliveryAddress;
    }
    
	/**
	* 字段名称 :物流名称
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getLogisticsName() {
		return this.logisticsName;
	}

	/**
	* 字段名称 :物流名称
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setLogisticsName(String logisticsName) {
		 this.logisticsName = logisticsName;
    }
    
	/**
	* 字段名称 :物流单号(非物流表主键Id)
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getLogisticsNo() {
		return this.logisticsNo;
	}

	/**
	* 字段名称 :物流单号(非物流表主键Id)
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setLogisticsNo(String logisticsNo) {
		 this.logisticsNo = logisticsNo;
    }
    
	/**
	* 字段名称 :发货说明
	* 数据类型 :varchar(200)
	* 是否必填 :false
	*/
	public String getShippingInstructions() {
		return this.shippingInstructions;
	}

	/**
	* 字段名称 :发货说明
	* 数据类型 :varchar(200)
	* 是否必填 :false
	*/
	public void setShippingInstructions(String shippingInstructions) {
		 this.shippingInstructions = shippingInstructions;
    }
    
	/**
	* 字段名称 :发货凭证1
	* 数据类型 :varchar(2000)
	* 是否必填 :false
	*/
	public String getShippingVoucher1() {
		return this.shippingVoucher1;
	}

	/**
	* 字段名称 :发货凭证1
	* 数据类型 :varchar(2000)
	* 是否必填 :false
	*/
	public void setShippingVoucher1(String shippingVoucher1) {
		 this.shippingVoucher1 = shippingVoucher1;
    }
    
	/**
	* 字段名称 :发货凭证2
	* 数据类型 :varchar(2000)
	* 是否必填 :false
	*/
	public String getShippingVoucher2() {
		return this.shippingVoucher2;
	}

	/**
	* 字段名称 :发货凭证2
	* 数据类型 :varchar(2000)
	* 是否必填 :false
	*/
	public void setShippingVoucher2(String shippingVoucher2) {
		 this.shippingVoucher2 = shippingVoucher2;
    }
    
	/**
	* 字段名称 :发货凭证3
	* 数据类型 :varchar(2000)
	* 是否必填 :false
	*/
	public String getShippingVoucher3() {
		return this.shippingVoucher3;
	}

	/**
	* 字段名称 :发货凭证3
	* 数据类型 :varchar(2000)
	* 是否必填 :false
	*/
	public void setShippingVoucher3(String shippingVoucher3) {
		 this.shippingVoucher3 = shippingVoucher3;
    }
    
	/**
	* 字段名称 :发货时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getShippingTime() {
		return this.shippingTime;
	}

	/**
	* 字段名称 :发货时间
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setShippingTime(Date shippingTime) {
		 this.shippingTime = shippingTime;
    }
    
	/**
	* 字段名称 :等待商家审批:waitBusinessApprove, 等待商城审批:waitMallApprove, 等待会员发货:waitMemberSendGoods, 等待商家确认收货:waitBusinessConfirmReceipt, 等待商城退款:waitMallRefund, 退货退款完成refundFinished, 商家审批失败businessApproveFail:, 商城审批失败:mallApproveFail
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public String getRejectedStatus() {
		return this.rejectedStatus;
	}

	/**
	* 字段名称 :等待商家审批:waitBusinessApprove, 等待商城审批:waitMallApprove, 等待会员发货:waitMemberSendGoods, 等待商家确认收货:waitBusinessConfirmReceipt, 等待商城退款:waitMallRefund, 退货退款完成refundFinished, 商家审批失败businessApproveFail:, 商城审批失败:mallApproveFail
	* 数据类型 :varchar(50)
	* 是否必填 :false
	*/
	public void setRejectedStatus(String rejectedStatus) {
		 this.rejectedStatus = rejectedStatus;
    }
    
	/**
	* 字段名称 :备注信息
	* 数据类型 :varchar(2000)
	* 是否必填 :false
	*/
	public String getRemark() {
		return this.remark;
	}

	/**
	* 字段名称 :备注信息
	* 数据类型 :varchar(2000)
	* 是否必填 :false
	*/
	public void setRemark(String remark) {
		 this.remark = remark;
    }

	public String getCreateDateFormatter() {
		return createDateFormatter;
	}

	public void setCreateDateFormatter(String createDateFormatter) {
		this.createDateFormatter = createDateFormatter;
	}
}