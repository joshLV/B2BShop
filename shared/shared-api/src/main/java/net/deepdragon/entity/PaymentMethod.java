package net.deepdragon.entity;

import net.deepdragon.constant.Shared;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：支付方式
 * 表代码：shared_payment_method
*/
@Alias(Shared.SIGN+"PaymentMethod")
public class PaymentMethod extends BaseEntity {

	private static final long serialVersionUID = 1262146499894966562L;
	
	/**
	*名称
	*/
	private String name;
	
	/**
	*类型
	*/
	private String type;
	
	/**
	*是否启用
	*/
	private Integer enabled;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	/**
	*描述
	*/
	private String description;

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
	* 字段名称 :名称
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :名称
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :类型
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getType() {
		return this.type;
	}

	/**
	* 字段名称 :类型
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setType(String type) {
		 this.type = type;
    }
    
	/**
	* 字段名称 :是否启用
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getEnabled() {
		return this.enabled;
	}

	/**
	* 字段名称 :是否启用
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setEnabled(Integer enabled) {
		 this.enabled = enabled;
    }
    
	/**
	* 字段名称 :显示序号
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	* 字段名称 :显示序号
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setOrderNo(Integer orderNo) {
		 this.orderNo = orderNo;
    }
    
	/**
	* 字段名称 :描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }
    
}