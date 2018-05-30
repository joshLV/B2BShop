<#escape x as x?html>
	<#include "bec/ghdj/header.ftl"/>
<div id="container" class="f-cb">
	<#include "bec/ghdj/top.ftl"/>
	<#if shop.status gt 0>
        <div class="content">
            <div class="breadcrumb">
                <strong><a href="${base}/index.html">首页</a></strong>
		<span>&nbsp;&gt;&nbsp;
		<a href="${base}/shop/${(shop.urlAddress)!}">${(shop.name)!}，欢迎您的到来！</a>
		<#--<a href="${base}/shopExtend/detail/${(shop.urlAddress)!}.html">${(shop.name)!}，欢迎您的到来！</a>-->
	    </span>
            </div>
            <div class="clr"></div>
        </div>
		<#include "bec/ghdj/shop/default/header.ftl"/>/
		<#include "bec/ghdj/shop/default/middle.ftl"/>
	<#else>
        <div class="content">
            <div style="width:100%; height: 400px; line-height: 400px; text-align: center; font-size: 20px; font-weight: bold;">对不起！您查看的店铺已关闭，您可以<a href="${base}/index" style="color: #0000cc;">去首页</a>选择其他商家的产品！</div>
        </div>
	</#if>
</div>
	<#include "bec/ghdj/service.ftl"/>
	<#include "bec/ghdj/foot.ftl"/>
</#escape>