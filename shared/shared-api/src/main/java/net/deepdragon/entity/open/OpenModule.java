package net.deepdragon.entity.open;

import net.deepdragon.constant.weipu.Open;
import net.deepdragon.entity.weipu.BaseEntity;
import org.apache.ibatis.type.Alias;

/**
 * 表名称：开放平台模块 表代码：wop_module
 */
@Alias(Open.SIGN + "OpenModule")
public class OpenModule extends BaseEntity {

	private static final long serialVersionUID = 1656631825138935495L;

	/**
	 * 模块名称
	 */
	private String name;

	/**
	 * 模块URL
	 */
	private String url;

	/**
	 * 模块图标
	 */
	private String icon;

	/**
	 * 父模块
	 */
	private String parentId;

	/**
	 * 模块标识
	 */
	private String sign;

	/**
	 * 左值
	 */
	private Integer leftValue;

	/**
	 * 右值
	 */
	private Integer rightValue;

	/**
	 * 深度
	 */
	private Integer level;

	/**
	 * 显示序号
	 */
	private Integer orderNo;

	/**
	 * 备注说明
	 */
	private String description;

	/**
	 * 字段名称 :模块名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * 字段名称 :模块名称 数据类型 :varchar(32) 是否必填 :true
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * 字段名称 :模块URL 数据类型 :varchar(256) 是否必填 :false
	 */
	public String getUrl() {
		return this.url;
	}

	/**
	 * 字段名称 :模块URL 数据类型 :varchar(256) 是否必填 :false
	 */
	public void setUrl(String url) {
		this.url = url;
	}

	/**
	 * 字段名称 :模块图标 数据类型 :varchar(128) 是否必填 :false
	 */
	public String getIcon() {
		return this.icon;
	}

	/**
	 * 字段名称 :模块图标 数据类型 :varchar(128) 是否必填 :false
	 */
	public void setIcon(String icon) {
		this.icon = icon;
	}

	/**
	 * 字段名称 :父模块 数据类型 :bigint 是否必填 :false
	 */
	public String getParentId() {
		return this.parentId;
	}

	/**
	 * 字段名称 :父模块 数据类型 :bigint 是否必填 :false
	 */
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	/**
	 * 字段名称 :模块标识 数据类型 :varchar(32) 是否必填 :false
	 */
	public String getSign() {
		return this.sign;
	}

	/**
	 * 字段名称 :模块标识 数据类型 :varchar(32) 是否必填 :false
	 */
	public void setSign(String sign) {
		this.sign = sign;
	}

	/**
	 * 字段名称 :左值 数据类型 :int 是否必填 :true
	 */
	public Integer getLeftValue() {
		return this.leftValue;
	}

	/**
	 * 字段名称 :左值 数据类型 :int 是否必填 :true
	 */
	public void setLeftValue(Integer leftValue) {
		this.leftValue = leftValue;
	}

	/**
	 * 字段名称 :右值 数据类型 :int 是否必填 :true
	 */
	public Integer getRightValue() {
		return this.rightValue;
	}

	/**
	 * 字段名称 :右值 数据类型 :int 是否必填 :true
	 */
	public void setRightValue(Integer rightValue) {
		this.rightValue = rightValue;
	}

	/**
	 * 字段名称 :深度 数据类型 :int 是否必填 :true
	 */
	public Integer getLevel() {
		return this.level;
	}

	/**
	 * 字段名称 :深度 数据类型 :int 是否必填 :true
	 */
	public void setLevel(Integer level) {
		this.level = level;
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

}
