package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品分类属性
 * 表代码：wp_goods_attribute
*/
@Alias(Weipu.SIGN+"GoodsAttribute")
public class GoodsAttribute extends BaseEntity {

	private static final long serialVersionUID = 1659535802242882362L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*商品分类
	*/
	private String categoryId;
	
	/**
	*属性名称
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
     * 分类名称
     */
	private String categoryName;
    /**
     * 可选项
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
	* 字段名称 :属性名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :属性名称
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}