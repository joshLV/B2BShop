<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>我的店铺</title>
<meta name="description" content="我的店铺">
<meta name="Keywords" content="我的店铺">
<link href="${base}/static/mall/gwq/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/css/list2.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"shop-店铺ID"
};
</script>
</head>
<body>
<#include "bec/ghdj/shortcut.ftl"/>
<#include "bec/ghdj/header.ftl"/>
<#if !shop??>
<div id="refresh" class="content">
    <style type="text/css">#refresh{background-color:#ebebeb;text-align:center;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px;margin-bottom:10px;padding:100px 0;font-size:18px;}</style>
    不好意思 :(&nbsp;&nbsp;&nbsp;&nbsp;该店铺已经关闭......
</div>
<#else>
<!--面包屑导航-->
<style>
.breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
.breadcrumb span {font-family: "\5b8b\4f53"}
</style>
<div class="content">
	<div class="breadcrumb">
		<h1><a href="${base}/shop/${parent.id}.html">店铺</a></h1>&nbsp;&gt;&nbsp;
		<span>【${shop.shortName}】，欢迎您的到来！</span>
	</div>
	<div class="clr"></div>
</div>

<style>
    .left {float: left;width: 210px;margin-right: 10px;}
    .middle {float: left;width: 550px;}
    .right {float: right;width: 210px;}

    .widepage .middle, .list #slide, .list #slide .slide-items ul, .list #slide .slide-items li {width: 770px;}
    .widepage .right {width: 210px;}
    /*rank*/
    .rank{border:1px solid #ddd;}
    .rank .mt{height:30px;background:#f7f7f7;}
    .rank .mt h2{height:30px;padding-left:10px;font:normal 15px/31px \5fae\8f6f\96c5\9ed1;color:#333}
    .rank .mc ul{padding:0 5px;zoom:1;}
    .rank .mc li{overflow:hidden;float:left;width:197px;padding:7px 0px 7px;height:56px;border-top:1px dotted #ddd;}
    .rank .mc span{float:left;overflow:hidden;width:18px;height:18px;margin:2px 5px 0 0;background:url(http://misc.360buyimg.com/product/skin/2013/i/20130330B.png) no-repeat -25px -50px;line-height:19px;text-align:center;color:#ccc;}
    .rank .mc .fore1 span,
    .rank .mc .fore2 span,
    .rank .mc .fore3 span{background-position:0 -50px;color:#E4393C;}
    .rank .mc .p-img{float:left;margin-right:5px}
    .rank .mc .p-name{float:left;width:119px;height:3em;line-height:1.5em;overflow:hidden}
    .rank .mc .p-price{float:left;height:18px;margin-top:2px;line-height:18px}
    .rank .mc .p-price strong{font-size:12px;}
    .rank .mc .fore{border-top:0}

    /*plist*/
    .plist{border:1px solid #ddd;}
    .plist .mt{height:30px;background:#f7f7f7;}
    .plist h2{float:left;height:30px;padding:0 10px;font:normal 15px/30px \5fae\8f6f\96c5\9ed1;color:#333;}
    .plist .mt .extra{float:right;}
    .plist .mc li{float:left;width:170px;padding:0 5px 10px;overflow:hidden;text-align:left}
    .plist .p-img{height:100px;text-align:center;}
    .plist .p-name{margin-bottom:5px}
    .plist .p-img{position:relative}
    .plist .p-price strong{font-weight:normal;font-size:12px;}
    .plist .evaluate{color:#005aa0}
    .plist .evaluate a:link,.plist .evaluate a:visited{color:#005aa0}
    .plist .reputation{color:#1a8705}

    .widepage .plist .mc li {width: 215px;padding: 0 15px 10px;}

    .mb {margin-bottom: 7px;}

    .pi{right:10px;text-align:center}.pix1{background-position:0 -100px}.pi{position:absolute;margin-top:-10px;width:52px;height:40px;padding:12px 0 0;background-image:url(/web-admin/static/img/tag.png);background-repeat:no-repeat;font-family:"microsoft yahei";color:#fff;line-height:31px;overflow:hidden;zoom:.8;z-index:1000;left:98px;font-size:16px}
    .other{padding: 10px 20px;margin-bottom: 20px;background: #FFF;border-top: 1px solid #DDD;border-bottom: 1px solid #F1F1F1}

</style>
<div class="content" style="margin-bottom: 10px;">
    <a href="${base}/item/${hotSaleGoodsList?first.id}.html" target="_blank">
        <img src="${base}/static/mall/img/shop-top-01.jpg" alt="" width="100%" height="300px"/>
    </a>
</div>
<div class="content">
	<div class="left">
        <div class="m rank">
            <div class="mt">
                <h2>本周排行商品</h2>
            </div>
            <div class="mc">
                <ul>
                <#list currWeekGoodsList as goods>
                    <#if goods_index &lt; 3>
                    <li class="fore fore1">
                    <#else>
                    <li class="fore">
                    </#if>
                    <span>${goods_index + 1}</span>
                    <div class="p-img"><a title="${goods.fullName}" href="${base}/item/${goods.id}.html" target="_blank">
                        <img width="50" height="50" src="${goods.pic}" class="err-product"></a></div>
                    <div class="p-name"><a target="_blank" href="${base}/item/${goods.id}.html" title="${goods.description}">${goods.fullName}</a></div>
                    <div class="p-price" sku="${goods.id}"><strong>￥${goods.price}</strong></div>
                </li>
                </#list>
                </ul>
            </div>
        </div>
	</div>
	<div class="middle">
        <div class="m plist" id="hotpros">
            <div class="mt mb">
                <h2>店长推荐</h2>
                <div class="extra"></div>
            </div>
            <div class="mc list-h">
                <ul>
                <#list recommendGoodsList as goods>
                    <li style="text-align: center">
                        <div class="p-img"><a title="${goods.fullName}" href="${base}/item/${goods.id}.html" target="_blank"><img width="100" height="100" alt="${goods.fullName}" src="${goods.pic}" class="err-product"></a></div>
                        <div class="p-name"><a target="_blank" href="${base}/item/${goods.id}.html" title="${goods.fullName}">${goods.fullName}</a></div>
                        <div class="p-price" sku="391653">商城价：
                            <strong class="p-price">￥${goods.price}</strong>
                        </div>
                    </li>
                </#list>
                </ul>
            </div>
        </div>
        <div class="m plist" id="hotSale">
            <div class="mt mb">
                <div style="position: absolute">
                    <h2>热销商品</h2>
                    <div class="pi pix1">热卖</div>
                </div>
            </div>
            <div class="mc list-h">
            <#list hotSaleGoodsList as goods>
                <#if goods_index &lt; 3>
                    <ul class="tabcon" style="display: block;">
                        <li style="text-align: center">
                            <div class="p-img"><a title="${goods.fullName}" href="${base}/item/${goods.id}.html" target="_self"><img width="100" height="100" src="${goods.pic}" class="err-product"></a></div>
                            <div class="p-name"><a target="_self" href="${base}/item/${goods.id}.html" title="${goods.fullName}">${goods.fullName}</a></div>
                            <div class="p-price" sku="${goods.sn}">商城价：<strong class="p-price">￥${goods.price}</strong></div>
                        </li>
                    </ul>
                <#else>
                    <ul class="tabcon  hide" style="display: none;">
                        <li style="text-align: center">
                            <div class="p-img"><a title="${goods.fullName}" href="${base}/item/${goods.id}.html" target="_self"><img width="100" height="100" src="${goods.pic}" class="err-product"></a></div>
                            <div class="p-name"><a target="_self" href="${base}/item/${goods.id}.html" title="${goods.fullName}">${goods.fullName}</a></div>
                            <div class="p-price" sku="${goods.sn}">商城价：<strong class="p-price">￥${goods.price}</strong></div>
                        </li>
                    </ul>
                </#if>
            </#list>
            </div>
        </div>
	</div>
	<div class="right">
        <div class="m rank">
            <div class="mt">
                <h2>新品上架</h2>
            </div>
            <div class="mc">
                <ul>
                <#list newGoodsList as goods>
                    <li class="fore fore1">
                        <span>${goods_index + 1}</span>
                        <div class="p-img"><a title="${goods.fullName}" href="${base}/item/${goods.id}.html" target="_blank">
                            <img width="50" height="50" src="${goods.pic}" class="err-product"></a></div>
                        <div class="p-name"><a target="_blank" href="${base}/item/${goods.id}.html" title="${goods.description}">${goods.fullName}</a></div>
                        <div class="p-price" sku="${goods.id}"><strong>￥${goods.price}</strong></div>
                    </li>
                </#list>
                </ul>
            </div>
        </div>
	</div>
	<div class="clr"></div>
</div>
<div class="content">
    <div class="m rank">
        <div class="mt">
            <h2>其它商品</h2>
        </div>
        <div class="mc">
            <ul>
            <#list otherGoodsList as goods>
                <li class="fore fore1">
                    <div class="p-img"><a title="${goods.fullName}" href="${base}/item/${goods.id}.html" target="_blank">
                        <img width="50" height="50" src="${goods.pic}" class="err-product"></a></div>
                    <div class="p-name"><a target="_blank" href="${base}/item/${goods.id}.html" title="${goods.description}">${goods.fullName}</a></div>
                    <div class="p-price" sku="${goods.id}"><strong>￥${goods.price}</strong></div>
                </li>
            </#list>
            </ul>
        </div>
    </div>
</div>
</#if>
<#include "bec/ghdj/service.ftl"/>
<#include "bec/ghdj/footer.ftl"/>
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