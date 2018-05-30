package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：标签管理表 表代码：wp_tag
 */
@Alias(Weipu.SIGN + "Tag")
public class Tag extends BaseEntity {

	private static final long serialVersionUID = 1559278055235216813L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 标签名称
	 */
	private String name;

	/**
	 * 标签类型
	 */
	private Integer type;

	/**
	 * 标签标识
	 */
	private String sign;

	/**
	 * 图标组名
	 */
	private String groupName;

	/**
	 * 标签图标
	 */
	private String icon;

	/**
	 * 显示序号
	 */
	private Integer orderNo;

	/**
	 * 备注说明
	 */
	private String description;
	private String pic;

	/**
	 *所属平台
	 */
	private String platform;

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public String getPlatform() {
		return this.platform;
	}

	/**
	 * 字段名称 :所属平台
	 * 数据类型 :bigint
	 * 是否必填 :true
	 */
	public void setPlatform(String platform) {
		this.platform = platform;
	}

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
	 * 字段名称 :标签名称 数据类型 :varchar(16) 是否必填 :false
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :标签名称 数据类型 :varchar(16) 是否必填 :false
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :标签类型 数据类型 :int 是否必填 :false
	 */
	public Integer getType() {
		return this.type;
	}

	/**
	 * 字段名称 :标签类型 数据类型 :int 是否必填 :false
	 */
	public void setType(Integer type) {
		this.type = type;
	}

	/**
	 * 字段名称 :标签标识 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getSign() {
		return this.sign;
	}

	/**
	 * 字段名称 :标签标识 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	 * 字段名称 :图标组名 数据类型 :varchar(64) 是否必填 :false
	 */
	public String getGroupName() {
		return this.groupName;
	}

	/**
	 * 字段名称 :图标组名 数据类型 :varchar(64) 是否必填 :false
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	/**
	 * 字段名称 :标签图标 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getIcon() {
		return this.icon;
	}

	/**
	 * 字段名称 :标签图标 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setIcon(String icon) {
		this.icon = icon;
	}

	/**
	 * 字段名称 :显示序号 数据类型 :int 是否必填 :false
	 */
	public Integer getOrderNo() {
		return this.orderNo;
	}

	/**
	 * 字段名称 :显示序号 数据类型 :int 是否必填 :false
	 */
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * 字段名称 :备注说明 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getDescription() {
		return this.description;
	}

	/**
	 * 字段名称 :备注说明 数据类型 :varchar(128) 是否必填 :false
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