package ${basePackage}.entity<#if sign != "shared">.${sign}</#if>;

import java.util.Date;
import org.apache.ibatis.type.Alias;

//Generated from PowerDesigner file ,Written by 张莹.

/**
 * 表名称：${name}
 * 表代码：${code}
*/
@Alias(${signPackage}.SIGN+"${scode}")
public class ${scode} extends BaseEntity {

	private static final long serialVersionUID = ${serialVersionUID}L;
	
	<#assign ignore = ["id", "createUser", "createDate", "modifyUser", "modifyDate"]> 
	<#list columns as column>
	<#if ignore?seq_contains(column.scode)==false>
	/**
	*${column.name}
	*/
	private ${column.javaType} ${column.scode};
	
	</#if>
	</#list>
	
	<#list columns as column>
	<#if ignore?seq_contains(column.scode)==false>
	/**
	* 字段名称 :${column.name}
	* 数据类型 :${column.type}
	* 是否必填 :${column.nullFlag?string('true','false')}
	*/
	public ${column.javaType} get${column.scode?cap_first}() {
		return this.${column.scode};
	}

	/**
	* 字段名称 :${column.name}
	* 数据类型 :${column.type}
	* 是否必填 :${column.nullFlag?string('true','false')}
	*/
	public void set${column.scode?cap_first}(${column.javaType} ${column.scode}) {
		 this.${column.scode} = ${column.scode};
    }
    
    </#if>
	</#list>
}