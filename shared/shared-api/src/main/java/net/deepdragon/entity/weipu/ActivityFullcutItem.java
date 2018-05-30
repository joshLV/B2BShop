package net.deepdragon.entity.weipu;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：参与活动商品表
 * 表代码：cx_activity_fullcut_item
*/
@Alias(net.deepdragon.constant.weipu.Weipu.SIGN+"ActivityFullcutItem")
public class ActivityFullcutItem extends BaseEntity {

	private static final long serialVersionUID = 1110405685250256351L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*满减活动ID
	*/
	private String fullCutId;
	
	/**
	*活动商品id(目前保存商品id)
	*/
	private String itemId;
	
	/**
	*类别id（默认值goods，扩展：merchant，category）
	*/
	private String itemType;
	
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
	* 字段名称 :满减活动ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public String getFullCutId() {
		return this.fullCutId;
	}

	/**
	* 字段名称 :满减活动ID
	* 数据类型 :bigint(20)
	* 是否必填 :false
	*/
	public void setFullCutId(String fullCutId) {
		 this.fullCutId = fullCutId;
    }
    
	/**
	* 字段名称 :活动商品id(目前保存商品id)
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getItemId() {
		return this.itemId;
	}

	/**
	* 字段名称 :活动商品id(目前保存商品id)
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setItemId(String itemId) {
		 this.itemId = itemId;
    }
    
	/**
	* 字段名称 :类别id（默认值goods，扩展：merchant，category）
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public String getItemType() {
		return this.itemType;
	}

	/**
	* 字段名称 :类别id（默认值goods，扩展：merchant，category）
	* 数据类型 :varchar(32)
	* 是否必填 :false
	*/
	public void setItemType(String itemType) {
		 this.itemType = itemType;
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