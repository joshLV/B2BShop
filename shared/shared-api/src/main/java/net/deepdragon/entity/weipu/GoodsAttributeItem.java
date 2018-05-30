package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品分类属性项
 * 表代码：wp_goods_attribute_item
*/
@Alias(Weipu.SIGN+"GoodsAttributeItem")
public class GoodsAttributeItem extends BaseEntity {

	private static final long serialVersionUID = 1156301943380630048L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*分类属性
	*/
	private String attributeId;
	
	/**
	*属性项
	*/
	private String options;
	
	/**
	*序号
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
	* 字段名称 :分类属性
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getAttributeId() {
		return this.attributeId;
	}

	/**
	* 字段名称 :分类属性
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setAttributeId(String attributeId) {
		 this.attributeId = attributeId;
    }
    
	/**
	* 字段名称 :属性项
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getOptions() {
		return this.options;
	}

	/**
	* 字段名称 :属性项
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setOptions(String options) {
		 this.options = options;
    }
    
	/**
	* 字段名称 :序号
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	* 字段名称 :序号
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setOrderNo(Integer orderNo) {
		 this.orderNo = orderNo;
    }
    
}