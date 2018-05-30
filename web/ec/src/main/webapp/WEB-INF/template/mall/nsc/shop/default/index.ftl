<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>${(shop.name)!} - <@spring.message "project_description"/></title>
    <meta name="description" content="${(shop.name)!}">
    <meta name="Keywords" content="${(shop.name)!},${(shop.shortName)!}">
    <meta name="viewport" content="width=device-width"/>
    <link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />

    <link rel="stylesheet" href="${base}/static/mall/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>
    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>

	<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"/>
    <script type="text/javascript">

        $(window).load(function(e) {
            $(".u-category").css("display","none");
            $(".u-cates-li:even").css("background-color","#fafafa");
            $(".m-category").hover(function(e){
                $(".u-category").show();
            },function(e){
                $(".u-category").hide();
            });
        });
    </script>
</head>
<body>
<#assign path="mall/nsc" />
<div class="g-doc">
    <div class="u-top-ad"></div>
    <#--页眉-->
    <div class="g-hd">
        <#--加入收藏-->
		<#include "${path}/shortcut.ftl"/>
		<#--头部-->
		<#include "${path}/header.ftl"/>
	</div>
    <#--页面中间-->
    <div class="g-bd">
        <div class="g-main">
            <#include "${path}/shop/default/middle.ftl"/>
        </div>
    <#--底部-->
        <#include "${path}/service.ftl"/> <!--商品指南-->
    </div>
    <#--页脚-->
    <#include "${path}/footer.ftl"/>
</div>
<#--客服DIV-->
<#--<#include "mall/jd/nsc/customer_service.ftl"/>-->

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
    pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {

    });
</script>
</html>
<script type="text/javascript">
    $(".u-category").css("display","none");
</script>