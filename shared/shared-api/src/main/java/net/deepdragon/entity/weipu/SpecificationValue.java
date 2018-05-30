package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品规格项 表代码：wp_specification_value
 */
@Alias(Weipu.SIGN + "SpecificationValue")
public class SpecificationValue extends BaseEntity {

	private static final long serialVersionUID = 1184957410341014165L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 规格ID
	 */
	private String specificationId;

	/**
	 * 项目名称
	 */
	private String name;

	/**
	 * 组名
	 */
	private String groupName;

	/**
	 * 图片地址
	 */
	private String image;

	/**
	 * 显示序号
	 */
	private Integer orderNo;

	/**
	 * 是否启用
	 */
	private Integer enabled;

	/**
	 * 分类描述
	 */
	private String description;
	private String pic;

	/**
	 * 字段名称 :租户ID 数据类型 :bigint 是否必填 :true
	 */
	public String getTenantId() {
		return this.tenantId;
	}

	/**
	 * 字段名称 :租户ID 数据类型 :bigint 是否必填 :true
	 */
	public void setTenantId(String tenantId) {
		this.tenantId = tenantId;
	}

	/**
	 * 字段名称 :规格ID 数据类型 :bigint 是否必填 :true
	 */
	public String getSpecificationId() {
		return this.specificationId;
	}

	/**
	 * 字段名称 :规格ID 数据类型 :bigint 是否必填 :true
	 */
	public void setSpecificationId(String specificationId) {
		this.specificationId = specificationId;
	}

	/**
	 * 字段名称 :项目名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :项目名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :组名 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getGroupName() {
		return this.groupName;
	}

	/**
	 * 字段名称 :组名 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	/**
	 * 字段名称 :图片地址 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getImage() {
		return this.image;
	}

	/**
	 * 字段名称 :图片地址 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * 字段名称 :显示序号 数据类型 :int 是否必填 :true
	 */
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	 * 字段名称 :显示序号 数据类型 :int 是否必填 :true
	 */
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * 字段名称 :是否启用 数据类型 :int 是否必填 :false
	 */
	public Integer getEnabled() {
		return this.enabled;
	}

	/**
	 * 字段名称 :是否启用 数据类型 :int 是否必填 :false
	 */
	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

	/**
	 * 字段名称 :分类描述 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getDescription() {
		return this.description;
	}

	/**
	 * 字段名称 :分类描述 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

}