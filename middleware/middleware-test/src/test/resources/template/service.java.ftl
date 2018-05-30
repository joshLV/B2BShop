package ${basePackage}.service<#if sign != "shared">.${sign}</#if>;

import ${basePackage}.entity<#if sign != "shared">.${sign}</#if>.${scode};

/**
 * ${name}数据接口
*/
public interface ${scode}Service extends BaseService<${scode}, String> {

}
