package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：退款记录
 * 表代码：wp_order_refund_log
*/
@Alias(Weipu.SIGN+"OrderRefundLog")
public class OrderRefundLog extends BaseEntity {

	private static final long serialVersionUID = 1076069096664061531L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*退单单ID
	*/
	private String refundId;
	
	/**
	*操作类型
	*/
	private OrderRefund.RefundStatus type;
	
	/**
	*操作员
	*/
	private String operator;
	
	/**
	*日志信息
	*/
	private String info;
	
	private String orderSn;//订单编号
	private String cardNo;//退款连赢通卡号

	/**
	 *所属平台
	 */
	private String platform;

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
	* 字段名称 :退单单ID
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getRefundId() {
		return this.refundId;
	}

	/**
	* 字段名称 :退单单ID
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setRefundId(String refundId) {
		 this.refundId = refundId;
    }
    
	/**
	* 字段名称 :操作类型
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public OrderRefund.RefundStatus getType() {
		return this.type;
	}

	/**
	* 字段名称 :操作类型
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setType(OrderRefund.RefundStatus type) {
		 this.type = type;
    }
    
	/**
	* 字段名称 :操作员
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public String getOperator() {
		return this.operator;
	}

	/**
	* 字段名称 :操作员
	* 数据类型 :varchar(64)
	* 是否必填 :true
	*/
	public void setOperator(String operator) {
		 this.operator = operator;
    }
    
	/**
	* 字段名称 :日志信息
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getInfo() {
		return this.info;
	}

	/**
	* 字段名称 :日志信息
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setInfo(String info) {
		 this.info = info;
    }

	public String getOrderSn() {
		return orderSn;
	}

	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
    
	
}