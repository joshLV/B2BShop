package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品分类表
 * 表代码：wp_goods_category
*/
@Alias(Weipu.SIGN+"GoodsCategory")
public class GoodsCategory extends BaseEntity {

	private static final long serialVersionUID = 1597967682306814955L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*父分类
	*/
	private String parentId;
	
	/**
	*分类名称
	*/
	private String name;
	
	/**
	*分类标识
	*/
	private String sign;
	
	/**
	*分类路径
	*/
	private String path;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	/**
	*是否启用
	*/
	private Integer enabled;
	
	/**
	*分类描述
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
	* 字段名称 :父分类
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public String getParentId() {
		return this.parentId;
	}

	/**
	* 字段名称 :父分类
	* 数据类型 :bigint
	* 是否必填 :false
	*/
	public void setParentId(String parentId) {
		 this.parentId = parentId;
    }
    
	/**
	* 字段名称 :分类名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :分类名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :分类标识
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getSign() {
		return this.sign;
	}

	/**
	* 字段名称 :分类标识
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setSign(String sign) {
		 this.sign = sign;
    }
    
	/**
	* 字段名称 :分类路径
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public String getPath() {
		return this.path;
	}

	/**
	* 字段名称 :分类路径
	* 数据类型 :varchar(256)
	* 是否必填 :true
	*/
	public void setPath(String path) {
		 this.path = path;
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
    
	/**
	* 字段名称 :分类描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :分类描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }
    
}