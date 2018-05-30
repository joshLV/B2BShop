package ${basePackage}.dao<#if sign != "shared">.${sign}</#if>.impl;

import ${basePackage}.dao<#if sign != "shared">.${sign}</#if>.${scode}Dao;
import ${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode};

import org.springframework.stereotype.Repository;

/**
 * ${name}数据接口实现
*/
@Repository(${signPackage}.SIGN + "${scode}DaoImpl")
public class ${scode}DaoImpl extends BaseDaoImpl<${scode}, String> implements
		${scode}Dao {

}
