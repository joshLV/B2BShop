<#escape x as x?html>
	<#assign path="mall/nsc" />
    <div class="sjjs">
        <div class="dp_left">
			<#include "${path}/shop/default/left.ftl"/>
		</div><!--left end-->
		<#if type == "shop">
			<#include "${path}/shop/default/goodsList.ftl"/>
		<#elseif type == "result">
			<#include "${path}/shop/default/goodsResult.ftl"/>
		<#else>
			<#include "${path}/shop/default/detail.ftl"/>
		</#if>
		<!--right end-->
	</div>

</#escape>