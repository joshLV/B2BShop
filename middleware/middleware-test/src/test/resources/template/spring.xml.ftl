<#macro mapperEl value>${r"#{"}${value}}</#macro>
<#macro jspEl value>${r"${"}${value}}</#macro>
<!--服务暴露部分开始-->
<#list tableList as table>
<!-- ${table.name}服务 -->
<dubbo:service interface="net.deepdragon.service<#if table.sign != "shared">.${table.sign}</#if>.${table.scode}Service"
	ref="${table.sign}${table.scode}ServiceImpl" version="<@jspEl '${table.sign}.service.version'/>"
	group="<@jspEl '${table.sign}.service.group'/>" timeout="<@jspEl '${table.sign}.service.timeout'/>"
	retries="<@jspEl '${table.sign}.service.retries'/>" />
	
</#list>

<!--服务暴露部分结束-->

<!--服务引用部分开始-->
<#list tableList as table>
<!-- ${table.name}服务 -->
<dubbo:reference id="${table.sign}${table.scode}Service" interface="net.deepdragon.service<#if table.sign != "shared">.${table.sign}</#if>.${table.scode}Service"
	version="<@jspEl '${table.sign}.reference.version'/>"
	group="<@jspEl '${table.sign}.reference.group'/>" timeout="<@jspEl '${table.sign}.reference.timeout'/>"
	retries="<@jspEl '${table.sign}.reference.retries'/>" />

</#list>

<!--服务引用部分结束-->