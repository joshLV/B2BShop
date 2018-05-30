package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

import java.util.Date;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：订单信息 表代码：wp_order
 */
@Alias(Weipu.SIGN + "Order")
public class Order extends BaseEntity {

	private static final long serialVersionUID = 1978573153417916404L;

	// 订单状态（等待买家支付定金 、已取消、已作废、等待买家付款、买家已付款,等待卖家发货、卖家已发货,等待买家收货、买家已收货，交易完成,部分退款，全额退款，部分退货，已退货，已删除, 退款进行中,等待买家验货 订单项商品异常）
	public enum OrderStatus {
		wait_buyer_pay_deposit,unconfirm, cancel, invalid, wait_buyer_pay, wait_seller_send_goods, wait_buyer_confirm_goods, trade_finished, refund_part, refund_success, reship_part, reship_success, deleted,refunding,wait_buyer_validate_goods/*,order_item_exception*/
	}

	// 付款状态（未支付、部分支付、已支付、部分退款、已退款,等待买家确认、全额退款,订单项商品异常）
	public enum PaymentStatus {
		unpaid, partPayment, paid, partRefund, refunding, refunded /*,order_item_exception*/
	}

	// 配送状态（未发货、分拣中、部分发货、已发货、已收货、部分退货、已退货、已打印）
	public enum ShippingStatus {
		unshipped, sorting, partShipped, shipped, takeover, partReshiped, reshiped,printed
	}

	//是否原始订单(汇总、子单、既是汇总也是明细)
	public enum IsOriginal{
		huizong, yuanshi, mingxiandhuizong
	}

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 订单编号
	 */
	private String orderSn;
	/**
	 * 门店编号
	 */
	private String storeId;
	/**
	 * 父级编号
	 */
	private String parentSn;

	/**
	 * 订单状态
	 */
	private OrderStatus orderStatus;

	/**
	 * 支付状态
	 */
	private PaymentStatus paymentStatus;

	/**
	 * 发货状态
	 */
	private ShippingStatus shippingStatus;
	
	/**
	 * 是否锁定
	 */
	private Integer isLock;

	/**
	 * 会员ID
	 */
	private String memberId;

	/**
	 * 店铺标识
	 */
	private String shopId;

	/**
	 * 商品总数
	 */
	private Integer goodsTotalQuantity;

	/**
	 * 商品总价格
	 */
	private Double goodsTotalPrice;

	/**
	 * 配送费用
	 */
	private Double deliveryFee;

	/**
	 * 商家设置的默认配送费用
	 */
	private Double defaultDeliveryFee;

	/**
	 * 优惠金额
	 */
	private Double discount;

	/**
	 * 订单总额
	 */
	private Double totalAmount;

	/**
	 * 定金金额
	 */
	private Double depositMoney;

	/**
	 * 支付方式
	 */
	private String paymentMethodId;

	/**
	 * 支付方式名称
	 */
	private String paymentMethodName;

	/**
	 * 支付类型 在线支付时选择的支付平台，货到付款时选择的是现金或者刷卡等。
	 */
	private String payType;

	/**
	 * 配送方式
	 */
	private String deliveryMethodId;

	/**
	 * 配送方式名称
	 */
	private String deliveryMethodName;
	
	/**
	*自提时间
	*/
	private String selfgetTime;

	/**
	 * 自提地址
	 */
	private String selfgetAreaId;

	/**
	 * 自提方式名称
	 */
	private String selfgetAreaName;

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
	 * 收货地区名称
	 */
	private String shipAreaName;

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
	 * 订单类型 0:普通订单，1:秒杀订单，2:团购订单
	 */
	private Integer type;

	/**
	 * 订单描述
	 */
	private String description;

	/**
	 * 会员昵称
	 */
	private String nickName;

	/**
	 * 会员登录名
	 */
	private String userName;

	// 导出相关
	private String goodsName;// 商品名称
	private String quantity;// 商品数量
	private String goodsPrice;// 商品价格

	private Integer isReview; //是否已经评论

	/*
	* 是否提交退款申请
	 */
	private String isRefund;

	/**
	 * 退款单数量
	 */
	private Integer refundCount;


	/**
	 * 当前流转中的退款单
	 */
	private OrderRefund orderRefund;

	/**
	 * 当前流转中的退款单ID
	 */
	private String currRefundId;

	/**
	 * 当前流转中的退款单状态
	 */
	private String currRefundStatus;

	/*
	* 发票类型
	 */
	private String invoiceType;

	/*
	* 发票抬头
	 */
	private String invoiceTitle;

	/*
	* 发票内容
	 */
	private String invoiceContent;

	/*
	* 订单中是否有异常商品
	* */
	private Integer isHaveGoodsException;

	/*
	* 平台类型 (1.B2B、2.B2C)
	* */
	private String platform;
	/*
    *询价表ID
    */
	private String enquiryId;
	/*
	*报价表ID
	 */
	private String quotationId;
	/*
	*送货时间
	 */
	private String deliveryTime;

	/**
	 * 2016-03-01 16:51
	 * 申诉处理状态
	 */

	private String handleResultStatu;
	/**
	 * 订单类型：0_一般订单，1_众筹订单
	 */
	private Integer orderType;

	/**
	 * 第三方调用，是否已拉取订单：0_未拉取,1_已拉取
	 */
	private Integer isPull;

	/**
	 * 订单商品总重量
	 */
	private Double goodsWeight;

	/**
	 * 订单商品总体积
	 */
	private String goodsVolume;

	/**
	 * 运输里程
	 */
	private String transportDistance;

	/**
	 * 是否原始订单：yuanshi_原始订单，mingxiandhuizong_即是明细单，也是汇总单，huizong_汇总订单
	 */
	private String isOriginal;

	/**
	 * 是否允许退款， 默认Y允许， N不允许
	 */
	private String allowRefund = "Y";

	/**
	 * 会员价 yes 使用会员价， no 不使用会员价
	 */
	private String isMemberPrice;
	/**
	 * 保价 yes 保价， no 不保价
	 */
	private String hasInsuranceFee;
	/**
	 * 保价费
	 */
	private Double insuranceFee;

	/**
	 * 合并订单号
	 */
	private String mergeOrderSn;

	/*退货单号*/
	private String rejectedSn;

	private Double rejectedMoney;

	public String getHandleResultStatu() {
		return handleResultStatu;
	}

	public void setHandleResultStatu(String handleResultStatu) {
		this.handleResultStatu = handleResultStatu;
	}

	public String getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getEnquiryId() {
		return enquiryId;
	}

	public void setEnquiryId(String enquiryId) {
		this.enquiryId = enquiryId;
	}

	public String getQuotationId() {
		return quotationId;
	}

	public void setQuotationId(String quotationId) {
		this.quotationId = quotationId;
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
	 * 字段名称 :父级编号 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getParentSn() {
		return this.parentSn;
	}

	/**
	 * 字段名称 :父级编号 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setParentSn(String parentSn) {
		this.parentSn = parentSn;
	}

	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}

	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public ShippingStatus getShippingStatus() {
		return shippingStatus;
	}

	public void setShippingStatus(ShippingStatus shippingStatus) {
		this.shippingStatus = shippingStatus;
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
	 * 字段名称 :店铺标识 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getShopId() {
		return this.shopId;
	}

	/**
	 * 字段名称 :店铺标识 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

	/**
	 * 字段名称 :商品总数 数据类型 :int 是否必填 :true
	 */
	public Integer getGoodsTotalQuantity() {
		return this.goodsTotalQuantity;
	}

	/**
	 * 字段名称 :商品总数 数据类型 :int 是否必填 :true
	 */
	public void setGoodsTotalQuantity(Integer goodsTotalQuantity) {
		this.goodsTotalQuantity = goodsTotalQuantity;
	}

	/**
	 * 字段名称 :商品总价格 数据类型 :decimal(24,4) 是否必填 :true
	 */
	public Double getGoodsTotalPrice() {
		return this.goodsTotalPrice;
	}

	/**
	 * 字段名称 :商品总价格 数据类型 :decimal(24,4) 是否必填 :true
	 */
	public void setGoodsTotalPrice(Double goodsTotalPrice) {
		this.goodsTotalPrice = goodsTotalPrice;
	}

	/**
	 * 字段名称 :配送费用 数据类型 :decimal(24,4) 是否必填 :true
	 */
	public Double getDeliveryFee() {
		return this.deliveryFee;
	}

	/**
	 * 字段名称 :配送费用 数据类型 :decimal(24,4) 是否必填 :true
	 */
	public void setDeliveryFee(Double deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	/**
	 * 字段名称 :订单总额 数据类型 :decimal(24,4) 是否必填 :true
	 */
	public Double getTotalAmount() {
		return this.totalAmount;
	}

	/**
	 * 字段名称 :订单总额 数据类型 :decimal(24,4) 是否必填 :true
	 */
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	/**
	 * 字段名称 :支付方式 数据类型 :bigint 是否必填 :true
	 */
	public String getPaymentMethodId() {
		return this.paymentMethodId;
	}

	/**
	 * 字段名称 :支付方式 数据类型 :bigint 是否必填 :true
	 */
	public void setPaymentMethodId(String paymentMethodId) {
		this.paymentMethodId = paymentMethodId;
	}

	/**
	 * 字段名称 :支付方式名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getPaymentMethodName() {
		return this.paymentMethodName;
	}

	/**
	 * 字段名称 :支付方式名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setPaymentMethodName(String paymentMethodName) {
		this.paymentMethodName = paymentMethodName;
	}

	/**
	 * 字段名称 :支付类型 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getPayType() {
		return payType;
	}

	/**
	 * 字段名称 :支付类型 数据类型 :varchar(32) 是否必填 :false 在线支付时选择的支付平台，货到付款时选择的是现金或者刷卡等。
	 */
	public void setPayType(String payType) {
		this.payType = payType;
	}

	/**
	 * 字段名称 :配送方式 数据类型 :bigint 是否必填 :true
	 */
	public String getDeliveryMethodId() {
		return this.deliveryMethodId;
	}

	/**
	 * 字段名称 :配送方式 数据类型 :bigint 是否必填 :true
	 */
	public void setDeliveryMethodId(String deliveryMethodId) {
		this.deliveryMethodId = deliveryMethodId;
	}

	/**
	 * 字段名称 :配送方式名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getDeliveryMethodName() {
		return this.deliveryMethodName;
	}

	/**
	 * 字段名称 :配送方式名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setDeliveryMethodName(String deliveryMethodName) {
		this.deliveryMethodName = deliveryMethodName;
	}
	
	

	public String getSelfgetTime() {
		return selfgetTime;
	}

	public void setSelfgetTime(String selfgetTime) {
		this.selfgetTime = selfgetTime;
	}

	/**
	 * 字段名称 :自提地址 数据类型 :bigint 是否必填 :false
	 */
	public String getSelfgetAreaId() {
		return this.selfgetAreaId;
	}

	/**
	 * 字段名称 :自提地址 数据类型 :bigint 是否必填 :false
	 */
	public void setSelfgetAreaId(String selfgetAreaId) {
		this.selfgetAreaId = selfgetAreaId;
	}

	/**
	 * 字段名称 :自提方式名称 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getSelfgetAreaName() {
		return this.selfgetAreaName;
	}

	/**
	 * 字段名称 :自提方式名称 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setSelfgetAreaName(String selfgetAreaName) {
		this.selfgetAreaName = selfgetAreaName;
	}

	/**
	 * 字段名称 :收货人姓名 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getShipName() {
		return this.shipName;
	}

	/**
	 * 字段名称 :收货人姓名 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setShipName(String shipName) {
		this.shipName = shipName;
	}

	/**
	 * 字段名称 :收货地区ID 数据类型 :varchar(128) 是否必填 :true
	 */
	public String getShipAreaId() {
		return this.shipAreaId;
	}

	/**
	 * 字段名称 :收货地区ID 数据类型 :varchar(128) 是否必填 :true
	 */
	public void setShipAreaId(String shipAreaId) {
		this.shipAreaId = shipAreaId;
	}

	/**
	 * 字段名称 :收货地区路径 数据类型 :varchar(256) 是否必填 :true
	 */
	public String getShipAreaPath() {
		return this.shipAreaPath;
	}

	/**
	 * 字段名称 :收货地区路径 数据类型 :varchar(256) 是否必填 :true
	 */
	public void setShipAreaPath(String shipAreaPath) {
		this.shipAreaPath = shipAreaPath;
	}

	/**
	 * 收货地区名称
	 */
	public String getShipAreaName() {
		return shipAreaName;
	}

	/**
	 * 收货地区名称
	 */
	public void setShipAreaName(String shipAreaName) {
		this.shipAreaName = shipAreaName;
	}

	/**
	 * 字段名称 :收货地址 数据类型 :varchar(128) 是否必填 :true
	 */
	public String getShipAddress() {
		return this.shipAddress;
	}

	/**
	 * 字段名称 :收货地址 数据类型 :varchar(128) 是否必填 :true
	 */
	public void setShipAddress(String shipAddress) {
		this.shipAddress = shipAddress;
	}

	/**
	 * 字段名称 :收货邮编 数据类型 :varchar(16) 是否必填 :true
	 */
	public String getShipZipCode() {
		return this.shipZipCode;
	}

	/**
	 * 字段名称 :收货邮编 数据类型 :varchar(16) 是否必填 :true
	 */
	public void setShipZipCode(String shipZipCode) {
		this.shipZipCode = shipZipCode;
	}

	/**
	 * 字段名称 :收货电话 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getShipPhone() {
		return this.shipPhone;
	}

	/**
	 * 字段名称 :收货电话 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setShipPhone(String shipPhone) {
		this.shipPhone = shipPhone;
	}

	/**
	 * 字段名称 :收货手机 数据类型 :varchar(16) 是否必填 :true
	 */
	public String getShipMobile() {
		return this.shipMobile;
	}

	/**
	 * 字段名称 :收货手机 数据类型 :varchar(16) 是否必填 :true
	 */
	public void setShipMobile(String shipMobile) {
		this.shipMobile = shipMobile;
	}

	/**
	 * 字段名称 :订单类型 数据类型 :int 是否必填 :false
	 */
	public Integer getType() {
		return this.type;
	}

	/**
	 * 字段名称 :订单类型 数据类型 :int 是否必填 :false 普通0,秒杀1,团购2,限购类型4
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getStoreId() {
		return storeId;
	}

	public void setStoreId(String storeId) {
		this.storeId = storeId;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(String goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public Integer getIsLock() {
		return isLock;
	}

	public void setIsLock(Integer isLock) {
		this.isLock = isLock;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Integer getIsReview() {
		return isReview;
	}

	public void setIsReview(Integer isReview) {
		this.isReview = isReview;
	}

	public String getIsRefund() {
		return isRefund;
	}

	public void setIsRefund(String isRefund) {
		this.isRefund = isRefund;
	}

	public OrderRefund getOrderRefund() {
		return orderRefund;
	}

	public void setOrderRefund(OrderRefund orderRefund) {
		this.orderRefund = orderRefund;
	}

	public String getInvoiceType() {
		return invoiceType;
	}

	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}

	public String getInvoiceTitle() {
		return invoiceTitle;
	}

	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}

	public String getInvoiceContent() {
		return invoiceContent;
	}

	public void setInvoiceContent(String invoiceContent) {
		this.invoiceContent = invoiceContent;
	}

	public Integer getRefundCount() {
		return refundCount;
	}

	public void setRefundCount(Integer refundCount) {
		this.refundCount = refundCount;
	}

	public String getCurrRefundId() {
		return currRefundId;
	}

	public void setCurrRefundId(String currRefundId) {
		this.currRefundId = currRefundId;
		if( this.orderRefund == null){
			this.orderRefund = new OrderRefund();
		}
		this.orderRefund.setId( currRefundId );
	}

	public String getCurrRefundStatus() {
		return currRefundStatus;
	}

	public void setCurrRefundStatus(String currRefundStatus) {
		this.currRefundStatus = currRefundStatus;
		if( this.orderRefund == null){
			this.orderRefund = new OrderRefund();
		}

		this.orderRefund.setStatus( Enum.valueOf(OrderRefund.RefundStatus.class, currRefundStatus.trim()) );
	}

	public Integer getOrderType() { return this.orderType; }

	public void setOrderType(Integer orderType) { this.orderType = orderType; }

	public Integer getIsHaveGoodsException() {
		return isHaveGoodsException;
	}

	public void setIsHaveGoodsException(Integer isHaveGoodsException) {
		this.isHaveGoodsException = isHaveGoodsException;
	}

	public Integer getIsPull() {
		return isPull;
	}

	public void setIsPull(Integer isPull) {
		this.isPull = isPull;
	}

	public Double getGoodsWeight() {
		return goodsWeight;
	}

	public void setGoodsWeight(Double goodsWeight) {
		this.goodsWeight = goodsWeight;
	}

	public String getGoodsVolume() {
		return goodsVolume;
	}

	public void setGoodsVolume(String goodsVolume) {
		this.goodsVolume = goodsVolume;
	}

	public String getTransportDistance() {
		return transportDistance;
	}

	public void setTransportDistance(String transportDistance) {
		this.transportDistance = transportDistance;
	}

	public String getIsOriginal() {
		return isOriginal;
	}

	public void setIsOriginal(String isOriginal) {
		this.isOriginal = isOriginal;
	}


	public String getIsMemberPrice() {
		return isMemberPrice;
	}

	public void setIsMemberPrice(String isMemberPrice) {
		this.isMemberPrice = isMemberPrice;
	}

	public String getHasInsuranceFee() {
		return hasInsuranceFee;
	}

	public void setHasInsuranceFee(String hasInsuranceFee) {
		this.hasInsuranceFee = hasInsuranceFee;
	}

	public Double getInsuranceFee() {
		return insuranceFee;
	}

	public void setInsuranceFee(Double insuranceFee) {
		this.insuranceFee = insuranceFee;
	}


	public Integer zhongChouStatus;
	private Date startTime;// 开始时间
	private Date endTime;// 结束时间
	//endFlag参数代表(1:众筹结束时间小于当前时间, 0:众筹结束时间大于等于当前时间, -1:非众筹菜单)
	private String endFlag;
	public Integer getZhongChouStatus() { return this.zhongChouStatus; }
	public void setZhongChouStatus(Integer zhongChouStatus) { this.zhongChouStatus = zhongChouStatus; }
	//当前众筹商品已众筹总数量
	private Integer zhongChouSumQuantity;


	/*条形码*/
	private String barcode;
	/*统计本次订单中的所有差异明细单数量*/
	private Integer itemDiffTotal;
	/*商家名称*/
	private String merchantName;
	/*商家地址*/
	private String urlAddress;
	/*订单明细商品原始购买数量*/
	private Integer oldQuantity;
	/*修改后商品数量*/
	private Integer newQuantity;
	/*订单明细商品原始价格*/
	private Double oldGoodsPrice;
	/*修改后商品价格*/
	private Double newGoodsPrice;
	/*商品数量差值*/
	private Integer quantityAbnormal;
	/*商品价格差值*/
	private Double goodsPriceAbnormal;
	/*商品图片*/
	private String pic;
	/*商品Id信息*/
	private String goodsId;
	/**
	 * 字段名称 :条形码 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getBarcode() {
		return this.barcode;
	}
	/*字段名称 :条形码 数据类型 :varchar(32) 是否必填 :true*/
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public Integer getItemDiffTotal() {
		return itemDiffTotal;
	}

	public void setItemDiffTotal(Integer itemDiffTotal) {
		this.itemDiffTotal = itemDiffTotal;
	}

	public String getMerchantName() {
		return merchantName;
	}

	public void setMerchantName(String merchantName) {
		this.merchantName = merchantName;
	}

	public String getUrlAddress() {
		return urlAddress;
	}

	public void setUrlAddress(String urlAddress) {
		this.urlAddress = urlAddress;
	}

	public Integer getOldQuantity() {
		return oldQuantity;
	}

	public void setOldQuantity(Integer oldQuantity) {
		this.oldQuantity = oldQuantity;
	}

	public Integer getNewQuantity() {
		return newQuantity;
	}

	public void setNewQuantity(Integer newQuantity) {
		this.newQuantity = newQuantity;
	}

	public Double getOldGoodsPrice() {
		return oldGoodsPrice;
	}

	public void setOldGoodsPrice(Double oldGoodsPrice) {
		this.oldGoodsPrice = oldGoodsPrice;
	}

	public Double getNewGoodsPrice() {
		return newGoodsPrice;
	}

	public void setNewGoodsPrice(Double newGoodsPrice) {
		this.newGoodsPrice = newGoodsPrice;
	}

	public Integer getQuantityAbnormal() { return quantityAbnormal;}

	public void setQuantityAbnormal(Integer quantityAbnormal) { this.quantityAbnormal = quantityAbnormal; }

	public Double getGoodsPriceAbnormal() { return goodsPriceAbnormal; }

	public void setGoodsPriceAbnormal(Double goodsPriceAbnormal) { this.goodsPriceAbnormal = goodsPriceAbnormal; }

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}


	public String getMergeOrderSn() {
		return mergeOrderSn;
	}

	public void setMergeOrderSn(String mergeOrderSn) {
		this.mergeOrderSn = mergeOrderSn;
	}

	public String getRejectedSn() {
		return rejectedSn;
	}

	public void setRejectedSn(String rejectedSn) {
		this.rejectedSn = rejectedSn;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getEndFlag() {
		return endFlag;
	}

	public void setEndFlag(String endFlag) {
		this.endFlag = endFlag;
	}

	public Integer getZhongChouSumQuantity() {
		return zhongChouSumQuantity;
	}

	public void setZhongChouSumQuantity(Integer zhongChouSumQuantity) {
		this.zhongChouSumQuantity = zhongChouSumQuantity;
	}

	public Double getDefaultDeliveryFee() {
		return defaultDeliveryFee;
	}

	public void setDefaultDeliveryFee(Double defaultDeliveryFee) {
		this.defaultDeliveryFee = defaultDeliveryFee;
	}

	public Double getRejectedMoney() {
		return rejectedMoney;
	}

	public void setRejectedMoney(Double rejectedMoney) {
		this.rejectedMoney = rejectedMoney;
	}

	public String getAllowRefund() {
		return allowRefund;
	}

	public void setAllowRefund(String allowRefund) {
		this.allowRefund = allowRefund;
	}

	public Double getDepositMoney() {
		return depositMoney;
	}

	public void setDepositMoney(Double depositMoney) {
		this.depositMoney = depositMoney;
	}
}