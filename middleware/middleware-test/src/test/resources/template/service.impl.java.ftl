package ${basePackage}.service<#if sign != "shared">.${sign}</#if>.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ${basePackage}.dao<#if sign != "shared">.${sign}</#if>.BaseDao;
import ${basePackage}.dao<#if sign != "shared">.${sign}</#if>.${scode}Dao;
import ${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode};
import ${basePackage}.service<#if sign != "shared">.${sign}</#if>.${scode}Service;

@Service(${signPackage}.SIGN+"${scode}ServiceImpl")
public class ${scode}ServiceImpl extends BaseServiceImpl<${scode}, String> implements ${scode}Service{

	@Resource(name=${signPackage}.SIGN+"${scode}DaoImpl")
	private ${scode}Dao ${scode?uncap_first}Dao;
	
	@Override
	public BaseDao<${scode}, String> getBaseDao() {
		return this.${scode?uncap_first}Dao;
	}
	
}

