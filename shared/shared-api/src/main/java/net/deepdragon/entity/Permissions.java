package net.deepdragon.entity;

import net.deepdragon.constant.Shared;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：权限表
 * 表代码：shared_permissions
*/
@Alias(Shared.SIGN+"Permissions")
public class Permissions extends BaseEntity {

	private static final long serialVersionUID = 1974765025608300571L;
	
	/**
	*角色ID
	*/
	private String roleId;
	
	/**
	*模块ID
	*/
	private String moduleId;
	
	/**
	*权限字符串
	*/
	private String permissions;
	
	/**
	*功能项
	*/
	private String functionIds;
	
	
	/**
	* 字段名称 :角色ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getRoleId() {
		return this.roleId;
	}

	/**
	* 字段名称 :角色ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setRoleId(String roleId) {
		 this.roleId = roleId;
    }
    
	/**
	* 字段名称 :模块ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public String getModuleId() {
		return this.moduleId;
	}

	/**
	* 字段名称 :模块ID
	* 数据类型 :bigint
	* 是否必填 :true
	*/
	public void setModuleId(String moduleId) {
		 this.moduleId = moduleId;
    }
    
	/**
	* 字段名称 :权限字符串
	* 数据类型 :text
	* 是否必填 :false
	*/
	public String getPermissions() {
		return this.permissions;
	}

	/**
	* 字段名称 :权限字符串
	* 数据类型 :text
	* 是否必填 :false
	*/
	public void setPermissions(String permissions) {
		 this.permissions = permissions;
    }
    
	/**
	* 字段名称 :功能项
	* 数据类型 :text
	* 是否必填 :false
	*/
	public String getFunctionIds() {
		return this.functionIds;
	}

	/**
	* 字段名称 :功能项
	* 数据类型 :text
	* 是否必填 :false
	*/
	public void setFunctionIds(String functionIds) {
		 this.functionIds = functionIds;
    }
    
}