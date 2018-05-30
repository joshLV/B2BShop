package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品参数分组表
 * 表代码：wp_goods_parameter_group
*/
@Alias(Weipu.SIGN+"GoodsParameterGroup")
public class GoodsParameterGroup extends BaseEntity {

	private static final long serialVersionUID = 1014750562549053358L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*商品分类
	*/
	private String categoryId;
	
	/**
	*参数名称
	*/
	private String name;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	/**
	*是否启用
	*/
	private Integer enabled;
	
	
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
	* 字段名称 :商品分类
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getCategoryId() {
		return this.categoryId;
	}

	/**
	* 字段名称 :商品分类
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setCategoryId(String categoryId) {
		 this.categoryId = categoryId;
    }
    
	/**
	* 字段名称 :参数名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :参数名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
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
	* 字段名称 :是否启用
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getEnabled() {
		return this.enabled;
	}

	/**
	* 字段名称 :是否启用
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setEnabled(Integer enabled) {
		 this.enabled = enabled;
    }
    
}