package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：满减活动优惠价格区间
 * 表代码：cx_activity_decreaseamount
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"ActivityDecreaseamount")
public class ActivityDecreaseamount extends BaseEntity {

	private static final long serialVersionUID = 1716810129870076312L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*活动itemid
	*/
	private String fullCutItemId;
	
	/**
	*满多少元
	*/
	private Double totalPrice;
	
	/**
	*减多少钱
	*/
	private Double decreaseAmount;
	
	/**
	*是否删除,1-未删除，0-已删除
	*/
	private Integer isDelete;
	
	
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
	* 字段名称 :活动itemid
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getFullCutItemId() {
		return this.fullCutItemId;
	}

	/**
	* 字段名称 :活动itemid
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setFullCutItemId(String fullCutItemId) {
		 this.fullCutItemId = fullCutItemId;
    }
    
	/**
	* 字段名称 :满多少元
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getTotalPrice() {
		return this.totalPrice;
	}

	/**
	* 字段名称 :满多少元
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setTotalPrice(Double totalPrice) {
		 this.totalPrice = totalPrice;
    }
    
	/**
	* 字段名称 :减多少钱
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public Double getDecreaseAmount() {
		return this.decreaseAmount;
	}

	/**
	* 字段名称 :减多少钱
	* 数据类型 :decimal(24,2)
	* 是否必填 :false
	*/
	public void setDecreaseAmount(Double decreaseAmount) {
		 this.decreaseAmount = decreaseAmount;
    }
    
	/**
	* 字段名称 :是否删除,1-未删除，0-已删除
	* 数据类型 :int(10)
	* 是否必填 :false
	*/
	public Integer getIsDelete() {
		return this.isDelete;
	}

	/**
	* 字段名称 :是否删除,1-未删除，0-已删除
	* 数据类型 :int(10)
	* 是否必填 :false
	*/
	public void setIsDelete(Integer isDelete) {
		 this.isDelete = isDelete;
    }
    
}