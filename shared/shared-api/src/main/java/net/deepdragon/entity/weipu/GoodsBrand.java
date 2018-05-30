package net.deepdragon.entity.weipu;

import net.deepdragon.constant.weipu.Weipu;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：商品品牌表 表代码：wp_goods_brand
 */
@Alias(Weipu.SIGN + "GoodsBrand")
public class GoodsBrand extends BaseEntity {

	private static final long serialVersionUID = 1287763567019092726L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 品牌名称
	 */
	private String name;

	/**
	 * 品牌标识
	 */
	private String sign;

	/**
	 * 品牌Logo
	 */
	private String logo;

	/**
	 * 组名
	 */
	private String groupName;

	/**
	 * 显示序号
	 */
	private Integer orderNo;

	/**
	 * 是否启用
	 */
	private Integer enabled;

	/**
	 * 品牌描述
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
	 * 字段名称 :品牌名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :品牌名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :品牌标识 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getSign() {
		return this.sign;
	}

	/**
	 * 字段名称 :品牌标识 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	 * 字段名称 :品牌Logo 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getLogo() {
		return this.logo;
	}

	/**
	 * 字段名称 :品牌Logo 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setLogo(String logo) {
		this.logo = logo;
	}

	/**
	 * 字段名称 :组名 数据类型 :varchar(16) 是否必填 :false
	 */
	public String getGroupName() {
		return this.groupName;
	}

	/**
	 * 字段名称 :组名 数据类型 :varchar(16) 是否必填 :false
	 */
	public void setGroupName(String groupName) {
		this.groupName = groupName;
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
	 * 字段名称 :品牌描述 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getDescription() {
		return this.description;
	}

	/**
	 * 字段名称 :品牌描述 数据类型 :varchar(128) 是否必填 :false
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