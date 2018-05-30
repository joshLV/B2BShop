package ${basePackage}.dao<#if sign != "shared">.${sign}</#if>;

import ${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode};

public interface ${scode}Dao extends BaseDao<${scode}, String> {

}
