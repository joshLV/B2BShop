package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：订单优惠表
 * 表代码：wp_order_onsale
*/
@Alias(Weipu.SIGN+"OrderOnsale")
public class OrderOnsale extends BaseEntity {

	private static final long serialVersionUID = 1934699614654470847L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*订单编号
	*/
	private String orderSn;
	
	/**
	*优惠金额
	*/
	private Double onSalePrice;
	
	/**
	*备注
	*/
	private String info;
	
	
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
	* 字段名称 :优惠金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public Double getOnSalePrice() {
		return this.onSalePrice;
	}

	/**
	* 字段名称 :优惠金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :false
	*/
	public void setOnSalePrice(Double onSalePrice) {
		 this.onSalePrice = onSalePrice;
    }
    
	/**
	* 字段名称 :备注
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getInfo() {
		return this.info;
	}

	/**
	* 字段名称 :备注
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setInfo(String info) {
		 this.info = info;
    }
    
}