package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：采购商积分表(采购商消费所产生的积分)
 * 表代码：b2b_buyer_score
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"BuyerScore")
public class BuyerScore extends BaseEntity {

	private static final long serialVersionUID = 1960545942794126574L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*订单编号
	*/
	private String orderSn;
	
	/**
	*采购商Id
	*/
	private String buyerId;
	
	/**
	*积分数
	*/
	private Integer score;
	
	/**
	*积分产生标识(1 购买商品 2退款)
	*/
	private Integer flag;
	
	/**
	*说明
	*/
	private String description;
	
	/**
	*使用类型
	*/
	private Integer type;
	
	/**
	*规则
	*/
	private String rules;
	
	/**
	*有效期
	*/
	private Date useLimitDate;
	
	/**
	*备注
	*/
	private String remark;
	
	/**
	*删除标识
	*/
	private Integer isDelete;

	/**
	 *订单编号
	 */
	private String orderId;

	/**
	 * 字段名称 :订单编号
	 * 数据类型 :String(20)
	 * 是否必填 :false
	 */
	public String getOrderId() {
		return this.orderId;
	}

	/**
	 * 字段名称 :订单编号
	 * 数据类型 :String(20)
	 * 是否必填 :false
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	
	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	* 字段名称 :租户ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setTenantId(String tenantId) {
		 this.tenantId = tenantId;
    }
    
	/**
	* 字段名称 :订单编号
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getOrderSn() {
		return this.orderSn;
	}

	/**
	* 字段名称 :订单编号
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setOrderSn(String orderSn) {
		 this.orderSn = orderSn;
    }
    
	/**
	* 字段名称 :采购商Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getBuyerId() {
		return this.buyerId;
	}

	/**
	* 字段名称 :采购商Id
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setBuyerId(String buyerId) {
		 this.buyerId = buyerId;
    }
    
	/**
	* 字段名称 :积分数
	* 数据类型 :int(100)
	* 是否必填 :false
	*/
	public Integer getScore() {
		return this.score;
	}

	/**
	* 字段名称 :积分数
	* 数据类型 :int(100)
	* 是否必填 :false
	*/
	public void setScore(Integer score) {
		 this.score = score;
    }
    
	/**
	* 字段名称 :积分产生标识(1 购买商品 2退款)
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getFlag() {
		return this.flag;
	}

	/**
	* 字段名称 :积分产生标识(1 购买商品 2退款)
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setFlag(Integer flag) {
		 this.flag = flag;
    }
    
	/**
	* 字段名称 :说明
	* 数据类型 :varchar(225)
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :说明
	* 数据类型 :varchar(225)
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }
    
	/**
	* 字段名称 :使用类型
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getType() {
		return this.type;
	}

	/**
	* 字段名称 :使用类型
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setType(Integer type) {
		 this.type = type;
    }
    
	/**
	* 字段名称 :规则
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public String getRules() {
		return this.rules;
	}

	/**
	* 字段名称 :规则
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public void setRules(String rules) {
		 this.rules = rules;
    }
    
	/**
	* 字段名称 :有效期
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public Date getUseLimitDate() {
		return this.useLimitDate;
	}

	/**
	* 字段名称 :有效期
	* 数据类型 :datetime
	* 是否必填 :false
	*/
	public void setUseLimitDate(Date useLimitDate) {
		 this.useLimitDate = useLimitDate;
    }
    
	/**
	* 字段名称 :备注
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public String getRemark() {
		return this.remark;
	}

	/**
	* 字段名称 :备注
	* 数据类型 :varchar(255)
	* 是否必填 :false
	*/
	public void setRemark(String remark) {
		 this.remark = remark;
    }
    
	/**
	* 字段名称 :删除标识
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public Integer getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :删除标识
	* 数据类型 :int(11)
	* 是否必填 :false
	*/
	public void setIsDelete(Integer isDelete) {
		 this.isDelete = isDelete;
    }
    
}