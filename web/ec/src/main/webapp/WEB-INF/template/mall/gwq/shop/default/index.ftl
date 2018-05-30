<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${(shop.name)!} - <@spring.message "project_description"/></title>
<meta name="description" content="${(shop.name)!}">
<meta name="Keywords" content="${(shop.name)!},${(shop.shortName)!}">
<link href="${base}/static/mall/gwq/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"shopDefaultIndex"
};
</script>
</head>
<body>
<#include "mall/gwq/shortcut.ftl"/>
<#include "mall/gwq/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
.breadcrumb span {font-family: "\5b8b\4f53"}
</style>
<#if shop.status gt 0>
<div class="content">
	<div class="breadcrumb">
		<strong><a href="${base}/index.html">首页</a></strong>
		<span>&nbsp;&gt;&nbsp;
		<a href="${base}/shop/${(shop.urlAddress)!}">${(shop.name)!}，欢迎您的到来！</a>
		<#--<a href="${base}/shop/extend/${(shop.urlAddress)!}.html">${(shop.name)!}，欢迎您的到来！</a>-->
	    </span>
	</div>
	<div class="clr"></div>
</div>
<#include "mall/gwq/shop/default/header.ftl"/>
<#include "mall/gwq/shop/default/middle.ftl"/>
<#else >
<div class="content">
	<div style="width:100%; height: 400px; line-height: 400px; text-align: center; font-size: 20px; font-weight: bold;">对不起！您查看的店铺已关闭，您可以<a href="${base}/index" style="color: #0000cc;">去首页</a>选择其他商家的产品！</div>
</div>
</#if>
<#include "mall/gwq/service.ftl"/>
<#include "mall/gwq/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
/*宽屏设置*/
pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].classsName = "widepage");
$(function () {

});
</script>
</html>