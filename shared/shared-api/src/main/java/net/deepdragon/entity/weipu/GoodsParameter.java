package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品参数选项表
 * 表代码：wp_goods_parameter
*/
@Alias(Weipu.SIGN+"GoodsParameter")
public class GoodsParameter extends BaseEntity {

	private static final long serialVersionUID = 1958978596265751528L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*参数组
	*/
	private String groupId;
	
	/**
	*选项名称
	*/
	private String name;
	
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
	* 字段名称 :参数组
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getGroupId() {
		return this.groupId;
	}

	/**
	* 字段名称 :参数组
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setGroupId(String groupId) {
		 this.groupId = groupId;
    }
    
	/**
	* 字段名称 :选项名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :选项名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :显示序号
	* 数据类型 :int
	* 是否必填 :false
	*/
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	* 字段名称 :显示序号
	* 数据类型 :int
	* 是否必填 :false
	*/
	public void setOrderNo(Integer orderNo) {
		 this.orderNo = orderNo;
    }
    
}