package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：规格定义表
 * 表代码：wp_specification
*/
@Alias(Weipu.SIGN+"Specification")
public class Specification extends BaseEntity {

	private static final long serialVersionUID = 1815269887797839903L;
	
	/**
	*租户ID
	*/
	private String tenantId;
	
	/**
	*规格名称
	*/
	private String name;
	
	/**
	*规格类型
	*/
	private Integer type;
	
	/**
	*显示序号
	*/
	private Integer orderNo;
	
	/**
	*是否启用
	*/
	private Integer enabled;
	
	/**
	*规格描述
	*/
	private String description;

    /**
     * 如果是图片格式，则pic字段有值，为图片的全路径
     */
    private String pic;
	
	
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
	* 字段名称 :规格名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public String getName() {
		return this.name;
	}

	/**
	* 字段名称 :规格名称
	* 数据类型 :varchar(32)
	* 是否必填 :true
	*/
	public void setName(String name) {
		 this.name = name;
    }
    
	/**
	* 字段名称 :规格类型
	* 数据类型 :int
	* 是否必填 :true
	*/
	public Integer getType() {
		return this.type;
	}

	/**
	* 字段名称 :规格类型
	* 数据类型 :int
	* 是否必填 :true
	*/
	public void setType(Integer type) {
		 this.type = type;
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
	* 字段名称 :规格描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public String getDescription() {
		return this.description;
	}

	/**
	* 字段名称 :规格描述
	* 数据类型 :varchar(128)
	* 是否必填 :false
	*/
	public void setDescription(String description) {
		 this.description = description;
    }

    public String getPic() {
        return pic;
    }public void setPic(String pic) {
    this.pic = pic;
}}