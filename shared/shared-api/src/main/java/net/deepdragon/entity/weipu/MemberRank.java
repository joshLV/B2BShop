package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：会员等级
 * 表代码：wp_member_rank
*/
@Alias(Weipu.SIGN+"MemberRank")
public class MemberRank extends BaseEntity {

	private static final long serialVersionUID = 1297366078283688774L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*等级名称
	*/
	private String name;
	
	/**
	*等级标识
	*/
	private String sign;
	
	/**
	*优惠比例
	*/
	private Double scale;
	
	/**
	*消费金额
	*/
	private Double amount;
	
	/**
	*是否默认
	*/
	private Integer isDefault;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	
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
	* 字段名称 :等级名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :等级名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :等级标识
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getSign() {
		return this.sign;
	}

	/**
	* 字段名称 :等级标识
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setSign(String sign) {
		 this.sign = sign;
    }
    
	/**
	* 字段名称 :优惠比例
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getScale() {
		return this.scale;
	}

	/**
	* 字段名称 :优惠比例
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setScale(Double scale) {
		 this.scale = scale;
    }
    
	/**
	* 字段名称 :消费金额
	* 数据类型 :decimal(24,2)
	* 是否必填 :true
	*/
	public Double getAmount() {
		return this.amount;
	}

	/**
	* 字段名称 :消费金额
	* 数据类型 :decimal(24,2)
	* 是否必填 :true
	*/
	public void setAmount(Double amount) {
		 this.amount = amount;
    }
    
	/**
	* 字段名称 :是否默认
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getIsDefault() {
		return this.isDefault;
	}

	/**
	* 字段名称 :是否默认
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setIsDefault(Integer isDefault) {
		 this.isDefault = isDefault;
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
    
}