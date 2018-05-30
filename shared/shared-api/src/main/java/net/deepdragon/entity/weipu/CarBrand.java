package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：汽车品牌表
 * 表代码：wp_car_brand
*/
@Alias(Weipu.SIGN+"CarBrand")
public class CarBrand extends BaseEntity {

	private static final long serialVersionUID = 1587757517264756165L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*名称
	*/
	private String name;
	
	/**
	*简介
	*/
	private String introduction;
	
	
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
	* 字段名称 :名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :简介
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getIntroduction() {
		return this.introduction;
	}

	/**
	* 字段名称 :简介
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setIntroduction(String introduction) {
		 this.introduction = introduction;
    }
    
}