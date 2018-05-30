<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${parent.name} - ${catelog.name}</title>
<meta name="description" content="${parent.name},${catelog.name}">
<meta name="Keywords" content="${parent.name},${catelog.name}">
<link href="${base}/static/mall/jp/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/jp/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/css/list2.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"list-${catelog.id}"
};
</script>
</head>
<body>
<#include "mall/jp/shortcut.ftl"/>
<#include "mall/jp/header.ftl"/>
<!--面包屑导航-->
<style>
.breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
.breadcrumb span {font-family: "\5b8b\4f53"}
</style>
<div class="content">
	<div class="breadcrumb">
		<h1><a href="${base}/list/${parent.id}.html">${parent.name}</a></h1>
		<span>&nbsp;&gt;&nbsp;<a href="${base}/list/${parent.id}-${catelog.id}.html">${catelog.name}</a></span>
	</div><!--breadcrumb end -->
	<div class="clr"></div>
</div>

<style>
.left {float: left;width: 210px;margin-right: 10px;}
.middle {float: left;width: 550px;}
.right {float: right;width: 210px;}

.widepage .middle, .list #slide, .list #slide .slide-items ul, .list #slide .slide-items li {width: 770px;}
.widepage .right {width: 210px;}

/*sortlist*/
#sortlist{width:206px;border:1px solid #ddd;border-top: 2px solid #999}
#sortlist .mc{width:206px}
#sortlist,#sortlist .mc{overflow:visible;}
*html #sortlist .mc{overflow:hidden;}
#sortlist .item{position:relative;z-index:2;zoom:1;background:#fff;}
#sortlist .item:after,#sortlist .con:after,#sortlist ul:after{content:'\20';display:block;clear:both;}
#sortlist h3 .i1 {background-position: 0 0;}
#sortlist h3 s {position: absolute;left: 10px;top: 8px;width: 16px;height: 16px;font-size: 0;}

#sortlist h3 s {background: url(${catelog.pic}) no-repeat;}

#sortlist h3 {padding-top: 2px;position:relative;z-index:6;clear:both;height:25px;padding-left:35px;line-height:25px;background:#fff;font-size:14px;font-weight:bold;color:#333;overflow:visible;}
#sortlist h3 a{color:#333;}
#sortlist h3 a {text-decoration: none;color: #da5a58;}

#sortlist .con{width:185px;position:relative;*zoom:1;background:#fff;line-height:22px;padding:0 0 5px 13px;overflow:hidden;border-top:1px dotted #ccc;margin:0 8px;}
#sortlist .con a{float:left;overflow:hidden;width:56px;height:20px;padding-left:0;margin-right:8px;line-height:20px;color:#666;}

/*slide*/
.slide {width:550px;height:200px;float:left;overflow:hidden;position:relative;background-color: #F5F5F5;font-size:0;line-height:0}
.slide-items-wrap {position:absolute;top:0;left:0;width:100%}
.slide-item {overflow:hidden;position:relative;height:200px}
.slide-item .brick {position:absolute}
.slide-nav-bg {position:absolute;bottom:0;left:0;width:100%;height:30px;filter:alpha(opacity=30);-moz-opacity:.3;opacity:.3}
.slide-nav {position:absolute;bottom:5px;right:7px}
.slide-nav li {float:left;display:inline;width:18px;height:18px;margin:0 3px;background:#FFF;border:1px solid #e6e6e6;font-size:12px;line-height:18px;text-align:center;cursor:default}
.slide-nav .cur {background:#404040;border-color:#404040;color:#FFF;font-weight:700}

.widepage .slide {width:770px;}

/*information*/
#information {height: 198px;border: 1px solid #ddd}
#information .mt {height: 28px;padding-left: 10px}
#information h2 {height: 28px;font: 700 14px/28px '5b8b/4f53';color: #333}
#information li {overflow: hidden;height: 25px;padding-left: 7px;line-height: 25px;font-family: '5b8b/4f53'}
#information li a {font-family: verdana}

</style>

<style>
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

</style>
<div class="content">
	<div class="left">
		<div class="m" id="sortlist">
			<div class="mc">
				<div class="item">
					<h3>
						<s class="i1"></s>
						<a title="${catelog.name}" href="${base}/list/${parent.id}-${catelog.id}.html">${catelog.name}</a>
					</h3>
					<div class="con">
					<#list childList as child>
					<a title="${child.name}" href="${base}/list/${parent.id}-${catelog.id}-${child.id}.html">${child.name}</a>
					</#list>
					</div>
				</div>
			</div><!--mc end-->
		</div><!--sortlist end-->
		<div class="m rank">
			<div class="mt">
			    <h2>最新降价商品</h2>
		    </div>
		    <div class="mc">
				<ul>
                    <#list leftGoodsList as goods>
                        <#if goods_index &lt; 3>
                        <li class="fore fore1">
                        <#else>
                        <li class="fore">
                        </#if>
                            <span>${goods_index + 1}</span>
                            <div class="p-img"><a title="${goods.fullName}" href="${base}/item/${goods.id}.html" target="_blank">
                                <img width="50" height="50" src="${goods.imageList?first.pic}" class="err-product"></a></div>
                            <div class="p-name"><a target="_blank" href="${base}/item/${goods.id}.html" title="${goods.description}">${goods.fullName}</a></div>
                            <div class="p-price" sku="${goods.id}"><strong>￥${goods.price}</strong></div>
                        </li>
                    </#list>
				</ul>
		    </div>
		</div><!--rank end-->
        <div id="adtips_left_13">
            <#list leftAdImages as leftImg>
                <#if leftImg_index < 2>
                    <div class="m da211x90" title="${leftImg.name}"><a href="" target="_blank"><img width="211" height="90" src="${leftImg.pic}"></a></div>
                </#if>
            </#list>
        </div>
	</div>
	<div class="middle">
		<div class="m slide" id="slide">
			<div class="slide-items-wrap" style="top: 0px;"> 
				<ul class="slide-items" id="J-slide-items">
                <#list adslides as slideitem>
                    <li class="slide-item">
                        <a class="brick" href="${slideitem.url}" style="top:0px;left:0px;" target="_blank">
                            <img alt="${slideitem.description}" title="${slideitem.description}" src="${slideitem.pic}"/>
                        </a>
                    </li>
                    <#if slideitem_index==6><#break></#if>
                </#list>
				</ul>
				<script type="text/javascript">
				$(function () {
					var item = {width: 770,height: 200,widthB: 550,heightB: 200};
					item = pageConfig.FN_GetCompatibleData(item);
					$("#slide .slide-items-wrap .slide-items .slide-item").find("img").css("width", item.width).css("height", item.height);
				});
				</script>
			</div>
		</div><!--slide end-->

        <div class="m plist" id="specialPrice">
            <div class="mt">
                <h2>${tag.name}</h2>
            </div>
            <div class="mc list-h">
                <#list specialPriceGoodsList as goods>
                    <#if goods_index &lt; 3>
                    <ul class="tabcon" style="display: block;">
                        <li>
                            <div class="p-img"><a title="${goods.fullName}" href="${base}/item/${goods.id}.html" target="_self"><img width="100" height="100" src="${goods.image}" class="err-product"></a></div>
                            <div class="p-name"><a target="_self" href="${base}/item/${goods.id}.html" title="${goods.fullName}">${goods.fullName}</a></div>
                            <div class="p-price" sku="${goods.sn}">商城价：<strong class="p-price">￥${goods.price}</strong></div>
                        </li>
                    </ul>
                    <ul class="tabcon  hide" style="display: none;">
                        <li>
                            <div class="p-img"><a title="${goods.fullName}" href="${base}/item/${goods.id}.html" target="_self"><img width="100" height="100" src="<#if goods.imageList??>${goods.imageList?first.pic}</#if>" class="err-product"></a></div>
                            <div class="p-name"><a target="_self" href="${base}/item/${goods.id}.html" title="${goods.fullName}">${goods.fullName}</a></div>
                            <div class="p-price" sku="${goods.sn}">商城价：<strong class="p-price">￥${goods.price}</strong></div>
                        </li>
                    </ul>
                    </#if>
                </#list>
            </div>
        </div>


		<div class="m plist" id="hotpros">
			<div class="mt">
				<h2>${tagRecommend.name}</h2>
				<div class="extra"></div>
			</div>
			<div class="mc list-h">
				<ul>
                    <#list goodsRecommendList as goods>
					<li>
						<div class="p-img"><a title="${goods.fullName}" href="${base}/item/${goods.id}.html" target="_blank"><img width="100" height="100" alt="${goods.fullName}" src="${goods.image}" class="err-product"></a></div>
						<div class="p-name"><a target="_blank" href="${base}/item/${goods.id}.html" title="${goods.fullName}">${goods.fullName}<font color="#ff6600" class="sku391653">请“<a href="${base}/item/${goods.id}.html">点击抢购</a>”</font></a></div>
						<div class="p-price" sku="391653">商城价：
						<strong class="p-price">￥${goods.price}</strong>
						</div>
					</li>
                    </#list>
				</ul>
			</div>
		</div><!--hotpros end-->
	</div>
	<div class="right">
		<div id="information" class="m">
			<div class="mt">
				<h2>${articlesCategory.name}</h2>
			</div>
			<div class="mc">
				<ul>
				<#list articlesList as article>
                    <li>&#183;<a href="${base}/play/${article.id}.html" title="${article.title}" target="_blank">${article.title}</a></li>
                </#list>
				</ul>
			</div>
		</div><!--information end-->
		<div id="adtips_right_12">
            <#list rightAdImages as rightImg>
                <#if rightImg_index < 3>
			        <div class="m da211x90" title="${rightImg.name}"><a href="" target="_blank"><img width="211" height="90" src="${rightImg.pic}"></a></div>
                </#if>
            </#list>
		</div><!--adtips_right_12 end-->
	</div>
	<div class="clr"></div>
</div>
<#include "mall/jp/service.ftl"/>
<#include "mall/jp/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/list2.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
	//轮播广告
	$("#slide").Slider();
});
</script>
</html>