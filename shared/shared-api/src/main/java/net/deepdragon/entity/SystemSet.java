package net.deepdragon.entity;

import net.deepdragon.constant.Shared;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：系统设置 表代码：shared_system_set
 */
@Alias(Shared.SIGN + "SystemSet")
public class SystemSet extends BaseEntity {

	private static final long serialVersionUID = 1438360637235575686L;

	/**
	 * 租户ID
	 */
	private String tenantId;

	/**
	 * 键名
	 */
	private String setvalue;

	/**
	 * 键值
	 */
	private String setkey;

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
	 * 字段名称 :键名 数据类型 :varchar(256) 是否必填 :true
	 */
	public String getSetvalue() {
		return this.setvalue;
	}

	/**
	 * 字段名称 :键名 数据类型 :varchar(256) 是否必填 :true
	 */
	public void setSetvalue(String setvalue) {
		this.setvalue = setvalue;
	}

	/**
	 * 字段名称 :键值 数据类型 :varchar(64) 是否必填 :false
	 */
	public String getSetkey() {
		return this.setkey;
	}

	/**
	 * 字段名称 :键值 数据类型 :varchar(64) 是否必填 :false
	 */
	public void setSetkey(String setkey) {
		this.setkey = setkey;
	}

}