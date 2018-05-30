package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：订单(购物)明细
 * 表代码：wp_order_item
*/
@Alias(Weipu.SIGN+"OrderItem")
public class OrderItem extends BaseEntity {

	private static final long serialVersionUID = 1305394021540526838L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*订单编号
	*/
	private String orderSn;
	
	/**
	*商品ID
	*/
	private String goodsId;
	
	/**
	*商品名称
	*/
	private String goodsName;
	
	/**
	*购买价格
	*/
	private Double goodsPrice;
	
	/**
	*购买数量
	*/
	private Integer quantity;
	
	/**
	 * 状态 0正常  ；1取消
	 */
	private Integer status;

	/**
	 * 规格
	 */
	private String specification;
	/**
	 * 备注
	 */
	private String ps;

	private String pic;//商品图片
	
	private String barcode;//商品条码
	private String sn;//商品编号
	private String fullName;//商品全名

	/**
	 * 是否已经对商品进行评价 0否  ；1是
	 */
	private Integer isReview ;

	/**
	 * 单位
	 */
	private String units;
	/**
	 * 含税
	 */
	private Integer containTax;
	/**
	 * 运费
	 */
	private Double freight;
	/**
	 * 商品价格小计
	 */
	private Double goodsPriceCount;

	/**
	 * 商品类型：0_普通商品，1_众筹商品
	 */
	private Integer goodsType;

	/**
	 * 未读评价数量
	 */
	private Integer unreadReviewCount;

	/**
	 *活动ID
	 * */
	private String tablePkId;

	/**
	 *活动表名称
	 * */
	private String tableName;

	/**
	 *优惠金额
	 * */
	private Double preferentialMoney;


	/*关联部分退货表(wp_goods_rejected)*/
	/*等待商家审批:waitBusinessApprove, 等待商城审批:waitMallApprove, 等待会员发货:waitMemberSendGoods, 等待商家确认收货:waitBusinessConfirmReceipt, 等待商城退款:waitMallRefund, 退货退款完成refundFinished, 商家审批失败businessApproveFail:, 商城审批失败:mallApproveFail*/
	private String rejectedStatus;

	/*退货商品数量*/
	private Integer rejectedGoodsQuantity;

	/*退货单号*/
	private String rejectedSn;

	public String getUnits() {
		return units;
	}

	public void setUnits(String units) {
		this.units = units;
	}

	public Integer getContainTax() {
		return containTax;
	}

	public void setContainTax(Integer containTax) {
		this.containTax = containTax;
	}

	public Double getFreight() {
		return freight;
	}

	public void setFreight(Double freight) {
		this.freight = freight;
	}

	public Double getGoodsPriceCount() {
		return goodsPriceCount;
	}

	public void setGoodsPriceCount(Double goodsPriceCount) {
		this.goodsPriceCount = goodsPriceCount;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :订单编号
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getOrderSn() {
		return this.orderSn;
	}

	/**
	* 字段名称 :订单编号
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setOrderSn(String orderSn) {
		 this.orderSn = orderSn;
    }
    
	/**
	* 字段名称 :商品ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getGoodsId() {
		return this.goodsId;
	}

	/**
	* 字段名称 :商品ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setGoodsId(String goodsId) {
		 this.goodsId = goodsId;
    }
    
	/**
	* 字段名称 :商品名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getGoodsName() {
		return this.goodsName;
	}

	/**
	* 字段名称 :商品名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setGoodsName(String goodsName) {
		 this.goodsName = goodsName;
    }
    
	/**
	* 字段名称 :购买价格
	* 数据类型 :decimal(24,4)
	* 是否必填 :true
	*/
	public Double getGoodsPrice() {
		return this.goodsPrice;
	}

	/**
	* 字段名称 :购买价格
	* 数据类型 :decimal(24,4)
	* 是否必填 :true
	*/
	public void setGoodsPrice(Double goodsPrice) {
		 this.goodsPrice = goodsPrice;
    }
    
	/**
	* 字段名称 :购买数量
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getQuantity() {
		return this.quantity;
	}

	/**
	* 字段名称 :购买数量
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setQuantity(Integer quantity) {
		 this.quantity = quantity;
    }

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getSpecification() {
		return specification;
	}

	public void setSpecification(String specification) {
		this.specification = specification;
	}

	public String getPs() {
		return ps;
	}

	public void setPs(String ps) {
		this.ps = ps;
	}

	public Integer getIsReview() {
		return isReview;
	}

	public void setIsReview(Integer isReview) {
		this.isReview = isReview;
	}

    public Integer getGoodsType() { return this.goodsType; }

    public void setGoodsType(Integer goodsType) { this.goodsType = goodsType; }

	public Integer getUnreadReviewCount() {
		return unreadReviewCount;
	}

	public void setUnreadReviewCount(Integer unreadReviewCount) {
		this.unreadReviewCount = unreadReviewCount;
	}

	public String getTablePkId() {
		return tablePkId;
	}

	public void setTablePkId(String tablePkId) {
		this.tablePkId = tablePkId;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public Double getPreferentialMoney() {
		return preferentialMoney;
	}

	public void setPreferentialMoney(Double preferentialMoney) {
		this.preferentialMoney = preferentialMoney;
	}

	public String getRejectedStatus() {
		return rejectedStatus;
	}

	public void setRejectedStatus(String rejectedStatus) {
		this.rejectedStatus = rejectedStatus;
	}

	public Integer getRejectedGoodsQuantity() {
		return rejectedGoodsQuantity;
	}

	public void setRejectedGoodsQuantity(Integer rejectedGoodsQuantity) {
		this.rejectedGoodsQuantity = rejectedGoodsQuantity;
	}

	public String getRejectedSn() {
		return rejectedSn;
	}

	public void setRejectedSn(String rejectedSn) {
		this.rejectedSn = rejectedSn;
	}
}