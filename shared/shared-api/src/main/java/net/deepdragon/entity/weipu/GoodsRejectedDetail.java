package net.deepdragon.entity.weipu;

import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：wp_goods_rejected_detail
 * 表代码：wp_goods_rejected_detail
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"GoodsRejectedDetail")
public class GoodsRejectedDetail extends BaseEntity {

	private static final long serialVersionUID = 1723737650431141155L;

	/**
	 *租户Id信息
	 */
	private String tenantId;

	/**
	*退货单号
	*/
	private String rejectedSn;
	
	/**
	*需退货订单明细Id
	*/
	private String orderItemId;
	
	/**
	*退货商品信息Id
	*/
	private String goodsId;
	
	/**
	*退货商品数量
	*/
	private Integer goodsQuantity;
	
	/**
	*退款金额
	*/
	private Double rejectedMoney;
	
	/**
	*退货原因
	*/
	private String rejectedReason;
	
	/**
	*备注信息
	*/
	private String remark;

	public String getTenantId() {
		return tenantId;
	}

	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	/**
	* 字段名称 :退货单号
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getRejectedSn() {
		return this.rejectedSn;
	}

	/**
	* 字段名称 :退货单号
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setRejectedSn(String rejectedSn) {
		 this.rejectedSn = rejectedSn;
    }
    
	/**
	* 字段名称 :需退货订单明细Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getOrderItemId() {
		return this.orderItemId;
	}

	/**
	* 字段名称 :需退货订单明细Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setOrderItemId(String orderItemId) {
		 this.orderItemId = orderItemId;
    }
    
	/**
	* 字段名称 :退货商品信息Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getGoodsId() {
		return this.goodsId;
	}

	/**
	* 字段名称 :退货商品信息Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setGoodsId(String goodsId) {
		 this.goodsId = goodsId;
    }
    
	/**
	* 字段名称 :退货商品数量
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getGoodsQuantity() {
		return this.goodsQuantity;
	}

	/**
	* 字段名称 :退货商品数量
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setGoodsQuantity(Integer goodsQuantity) {
		 this.goodsQuantity = goodsQuantity;
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
    
}