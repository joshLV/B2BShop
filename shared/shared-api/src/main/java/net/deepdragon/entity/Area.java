package net.deepdragon.entity;

import net.deepdragon.constant.Shared;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：地区信息表
 * 表代码：shared_area
*/
@Alias(Shared.SIGN+"Area")
public class Area extends BaseEntity {

	private static final long serialVersionUID = 1016072526431090463L;
	
	/**
	*地区名称
	*/
	private String name;
	
	/**
	*地区全称
	*/
	private String fullName;
	
	/**
	*上级地区
	*/
	private String parentId;
	
	/**
	*地区路径
	*/
	private String path;
	
	/**
	*经度
	*/
	private Double lng;
	
	/**
	*纬度
	*/
	private Double lat;
	
	
	/**
	* 字段名称 :地区名称
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :地区名称
	* 数据类型 :varchar(16)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :地区全称
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getFullName() {
		return this.fullName;
	}

	/**
	* 字段名称 :地区全称
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setFullName(String fullName) {
		 this.fullName = fullName;
    }
    
	/**
	* 字段名称 :上级地区
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getParentId() {
		return this.parentId;
	}

	/**
	* 字段名称 :上级地区
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setParentId(String parentId) {
		 this.parentId = parentId;
    }
    
	/**
	* 字段名称 :地区路径
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getPath() {
		return this.path;
	}

	/**
	* 字段名称 :地区路径
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setPath(String path) {
		 this.path = path;
    }
    
	/**
	* 字段名称 :经度
	* 数据类型 :decimal(24,8)
	* 是否必填 :false
	*/
	public Double getLng() {
		return this.lng;
	}

	/**
	* 字段名称 :经度
	* 数据类型 :decimal(24,8)
	* 是否必填 :false
	*/
	public void setLng(Double lng) {
		 this.lng = lng;
    }
    
	/**
	* 字段名称 :纬度
	* 数据类型 :decimal(24,8)
	* 是否必填 :false
	*/
	public Double getLat() {
		return this.lat;
	}

	/**
	* 字段名称 :纬度
	* 数据类型 :decimal(24,8)
	* 是否必填 :false
	*/
	public void setLat(Double lat) {
		 this.lat = lat;
    }
    
}