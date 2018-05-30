<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${(shop.name)!} - <@spring.message "project_description"/></title>
<meta name="description" content="${(shop.name)!}">
<meta name="Keywords" content="${(shop.name)!},${(shop.shortName)!}">
<link href="${base}/static/mall/gdnz/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/gdnz/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"shopDefaultIndex"
};
</script>
    <style>
      .banner{ width: 1210px!important; margin:0 auto; height: 380px!important;}
      #kinMaxShow .KMSPrefix_kinMaxShow_image_box .KMSPrefix_kinMaxShow_image_item,#kinMaxShow .KMSPrefix_kinMaxShow_image_box{    width: 100%; height:380px!important;}

    </style>
</head>
<body>
<#include "mall/gdnz/shortcut.ftl"/>
<#include "mall/gdnz/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
.breadcrumb span {font-family: "\5b8b\4f53"}
</style>
<#--自适应banner-->
<script type="text/javascript" src="${base}/static/js/jquery.kinMaxShow-1.1.min.js"></script>

<#if shop.status gt 0>
<#--<div class="content">
	<div class="breadcrumb">
		<strong><a href="${base}/index.html">首页</a></strong>
		<span>&nbsp;&gt;&nbsp;&ndash;&gt;
		<a href="${base}/shop/${(shop.urlAddress)!}">${(shop.name)!}，欢迎您的到来！</a>
	<a href="${base}/shop/extend/${(shop.urlAddress)!}.html">${(shop.name)!}，欢迎您的到来！</a>&ndash;&gt;
	</span>
	</div>
	<div class="clr"></div>
</div>-->
<#--自适应banner-->
<div class="banner" id="kinMaxShow">
	<#list imglist as slideitem>
        <div><img alt="${shop.name}" src="${headAd.pic}/${slideitem}@1210w_380h_2e.png"></div>
	</#list>
</div>
<#include "mall/gdnz/shop/default/header.ftl"/>
<#include "mall/gdnz/shop/default/middle.ftl"/>
<#else >
<div class="content">
	<div style="width:100%; height: 400px; line-height: 400px; text-align: center; font-size: 20px; font-weight: bold;">对不起！您查看的店铺已关闭，您可以<a href="${base}/index" style="color: #0000cc;">去首页</a>选择其他商家的产品！</div>
</div>
</#if>
<#include "mall/gdnz/service.ftl"/>
<#include "mall/gdnz/footer.ftl"/>
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
<script type="text/javascript">
    pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    setTimeout(function () {if (!$("#userName").val()) {$("#userName").get(0).focus();}}, 0);
    $(function () {
        /*自适应banner*/
        $("#kinMaxShow").kinMaxShow({
            height:'500',
            button:{
                showIndex:false,
                normal:{background:'url('+base+'/static/img/button.png) no-repeat -14px 0', width:'14px', height:'14px',marginRight:'9px',border:'0',right:'45%',bottom:'30px'},
                focus:{background:'url('+base+'/static/img/button.png) no-repeat 0 0',border:'0'}
            },
        });
    });
</script>


</html>