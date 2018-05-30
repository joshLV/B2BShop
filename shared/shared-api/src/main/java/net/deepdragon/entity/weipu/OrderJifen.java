package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：订单积分信息
 * 表代码：wp_order_jifen
*/
@Alias(Weipu.SIGN+"OrderJifen")
public class OrderJifen extends BaseEntity {

	private static final long serialVersionUID = 1217726406540954833L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*订单编号
	*/
	private String orderSn;
	
	/**
	*支付金额
	*/
	private Double payAmount;
	
	/**
	*本次积分
	*/
	private Double point;
	
	/**
	*积分卡号
	*/
	private String pointCardNo;
	
	/**
	*支付卡号
	*/
	private String cardNo;
	
	
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
	* 字段名称 :支付金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :true
	*/
	public Double getPayAmount() {
		return this.payAmount;
	}

	/**
	* 字段名称 :支付金额
	* 数据类型 :decimal(24,4)
	* 是否必填 :true
	*/
	public void setPayAmount(Double payAmount) {
		 this.payAmount = payAmount;
    }
    
	/**
	* 字段名称 :本次积分
	* 数据类型 :decimal(24,4)
	* 是否必填 :true
	*/
	public Double getPoint() {
		return this.point;
	}

	/**
	* 字段名称 :本次积分
	* 数据类型 :decimal(24,4)
	* 是否必填 :true
	*/
	public void setPoint(Double point) {
		 this.point = point;
    }
    
	/**
	* 字段名称 :积分卡号
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public String getPointCardNo() {
		return this.pointCardNo;
	}

	/**
	* 字段名称 :积分卡号
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public void setPointCardNo(String pointCardNo) {
		 this.pointCardNo = pointCardNo;
    }
    
	/**
	* 字段名称 :支付卡号
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public String getCardNo() {
		return this.cardNo;
	}

	/**
	* 字段名称 :支付卡号
	* 数据类型 :varchar(64)
	* 是否必填 :false
	*/
	public void setCardNo(String cardNo) {
		 this.cardNo = cardNo;
    }
    
}