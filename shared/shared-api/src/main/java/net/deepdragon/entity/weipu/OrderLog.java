package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：订单日志
 * 表代码：wp_order_log
*/
@Alias(Weipu.SIGN+"OrderLog")
public class OrderLog extends BaseEntity {

	private static final long serialVersionUID = 1221808801167287557L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*订单编号
	*/
	private String orderSn;
	
	/**
	*日志类型
	*/
	private String type;
	
	/**
	*操作员
	*/
	private String operator;
	
	/**
	*日志信息
	*/
	private String info;

	/**
	 * 前一个订单状态
	 */
	private String oldType;

	/**
	 * 状态对应的字段：订单状态_order,支付状态_payment,发货状态_shipping
	 */
	private String statusType;


	public enum StatusType {
		order,payment,shipping
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
	* 字段名称 :日志类型
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getType() {
		return this.type;
	}

	/**
	* 字段名称 :日志类型
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setType(String type) {
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

	public String getOldType() {
		return oldType;
	}

	public void setOldType(String oldType) {
		this.oldType = oldType;
	}

	public String getStatusType() {
		return statusType;
	}

	public void setStatusType(String statusType) {
		this.statusType = statusType;
	}
}