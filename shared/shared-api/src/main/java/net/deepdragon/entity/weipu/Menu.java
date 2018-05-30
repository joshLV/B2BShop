package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：会员菜单
 * 表代码：wp_menu
*/
@Alias(Weipu.SIGN+"Menu")
public class Menu extends BaseEntity {

	private static final long serialVersionUID = 1595976593051971862L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*父菜单
	*/
	private String parentId;
	
	/**
	*菜单类型
	*/
	private Integer type;
	
	/**
	*是否新功能
	*/
	private Integer isnew;
	
	/**
	*菜单名称
	*/
	private String name;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	/**
	*链接地址
	*/
	private String link;
	
	/**
	*备注说明
	*/
	private String description;
	
	
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
	* 字段名称 :父菜单
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getParentId() {
		return this.parentId;
	}

	/**
	* 字段名称 :父菜单
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setParentId(String parentId) {
		 this.parentId = parentId;
    }
    
	/**
	* 字段名称 :菜单类型
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getType() {
		return this.type;
	}

	/**
	* 字段名称 :菜单类型
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setType(Integer type) {
		 this.type = type;
    }
    
	/**
	* 字段名称 :是否新功能
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getIsnew() {
		return this.isnew;
	}

	/**
	* 字段名称 :是否新功能
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setIsnew(Integer isnew) {
		 this.isnew = isnew;
    }
    
	/**
	* 字段名称 :菜单名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :菜单名称
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
    
	/**
	* 字段名称 :链接地址
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getLink() {
		return this.link;
	}

	/**
	* 字段名称 :链接地址
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setLink(String link) {
		 this.link = link;
    }
    
	/**
	* 字段名称 :备注说明
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :备注说明
	* 数据类型 :varchar(256)
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }
    
}