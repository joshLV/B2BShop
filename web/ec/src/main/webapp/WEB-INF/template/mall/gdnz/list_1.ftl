<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${catelog.name}</title>
<meta name="description" content="${catelog.name}">
<meta name="Keywords" content="${catelog.name}">
<link href="${base}/static/mall/gdnz/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/gdnz/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/css/list1.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"list-${catelog.id}"
};
</script>
</head>
<body>
<#include "mall/gdnz/shortcut.ftl"/>
<#include "mall/gdnz/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 210px;margin-right: 10px;}
.middle {float: left;width: 550px;}
.right {float: right;width: 210px;}

.widepage .middle, .list #slide, .list #slide .slide-items ul, .list #slide .slide-items li {width: 720px;}
.widepage .right {width: 260px;}

/*sortlist*/
#sortlist{width:206px;height:196px;border:2px solid #98bc1b;}
#sortlist .mc{width:206px;height:198px;}
#sortlist,#sortlist .mc{overflow:visible;}
*html #sortlist .mc{overflow:hidden;}
#sortlist .item{position:relative;z-index:2;zoom:1;background:#fff;}
#sortlist ul{display:none;position:absolute;left:206px;top:0px;z-index:3;zoom:1;width:392px;border:solid #98bc1b;border-width:2px 2px 2px 2px;background:#fbf9f6;}
#sortlist .item:after,#sortlist .con:after,#sortlist ul:after{content:'\20';display:block;clear:both;}
#sortlist h3{width:190px;padding-top: 2px;position:relative;z-index:6;clear:both;height:25px;padding-left:13px;line-height:25px;background:#fff;font-size:12px;font-weight:bold;color:#333;overflow:visible;}
#sortlist h3 a{color:#333;}
#sortlist b{position:absolute;left:186px;top:2px;width:10px;height:32px;font:bold 16px/24px \5b8b\4f53;color:#98bc1b;}
#sortlist .con{width:185px;position:relative;*zoom:1;background:#fff;line-height:22px;padding:0 0 5px 13px;overflow:hidden;border-bottom:1px dotted #ccc;margin:0 8px;}
#sortlist .fore1 .con,#sortlist .fore2 .con{height: 62px;}
#sortlist .con a,#sortlist li a,#sortlist .item li span{float:left;overflow:hidden;width:56px;height:20px;padding-left:0;margin-right:8px;line-height:20px;color:#666;}
#sortlist .item li a{float:left;overflow:hidden;width:78px;height:22px;padding-left:10px;line-height:22px;border-bottom:1px solid #fbf9f6;color:#666;}
#sortlist .con a:hover,#sortlist .item li a:hover{color:#c00;}
#sortlist .fore2 .con{border-bottom:none;}
#sortlist .item li .whole{width:372px;height:26px;line-height:26px;background:#fff;font-weight:bold;cursor:default;padding-left:10px;}
#sortlist .item li .whole:hover{color:#666; text-decoration:none;}
#sortlist .hover{z-index:5;margin:-2px 0 -2px -2px;border:solid #98bc1b;border-width:2px 0 2px 2px;background:#ffffff;}
#sortlist .hover h3{z-index:6;width:196px;}
#sortlist .hover .con{z-index:5;width:188px;border-bottom:1px solid #FCF9FD;margin-right:0;background:#fff;}
#sortlist .hover ul{display:block;z-index:4;top:-2px;background:#fff;}
#sortlist .hover li{zoom:1;min-height:99px;*min-height:96px;}
*html #sortlist .hover li{height:96px;}

/*slide*/
.slide {width:550px;height:200px;float:left;overflow:hidden;position:relative;background-color: #F5F5F5;font-size:0;line-height:0}
.slide-items-wrap {position:absolute;top:0;left:0;width:100%}
.slide-item {overflow:hidden;position:relative;height:200px}
.slide-item .brick {position:absolute}
.slide-nav-bg {position:absolute;bottom:0;left:0;width:100%;height:30px;filter:alpha(opacity=30);-moz-opacity:.3;opacity:.3}
.slide-nav {position:absolute;bottom:5px;right:7px}
.slide-nav li {float:left;display:inline;width:18px;height:18px;margin:0 3px;background:#FFF;border:1px solid #e6e6e6;font-size:12px;line-height:18px;text-align:center;cursor:default}
.slide-nav .cur {background:#404040;border-color:#404040;color:#FFF;font-weight:700}

.widepage .slide {width:720px;}

/*information*/
#information {height: 198px;border: 1px solid #ddd}
#information .mt {height: 28px;padding-left: 10px}
#information h2 {height: 28px;font: 700 14px/28px '5b8b/4f53';color: #333}
#information li {overflow: hidden;width: 291px;height: 25px;padding-left: 7px;line-height: 25px;font-family: '5b8b/4f53'}
#information li a {font-family: verdana}

</style>
<div class="content">
    <div class="breadcrumb">
        <h1>
            <a href="${base}/list/${catelog.id}.html">${catelog.name}</a>
        </h1>
    </div><!--breadcrumb end-->
</div>
<div class="content">
	<div class="left">
		<div class="m" id="sortlist">
			<div class="mc">
				<#list childList as child>
				<div class="item fore1">
					<h3>
						<b>&gt;</b>
						<a title="${child.name}" href="${base}/list/${catelog.id}-${child.id}.html">${child.name}</a>
					</h3>
					<div class="con">
						<#list grandsonMap[child.id] as grandson>
						<a title="${grandson.name}" href="${base}/list/${catelog.id}-${child.id}-${grandson.id}.html">${grandson.name}</a>
						<#if grandson_index==5><#break></#if>
						</#list>
					</div>
					<ul>
						<li>
							<span class="whole">全部分类</span>
							<#list grandsonMap[child.id] as grandson>
								<#if (grandsonMap[child.id]?size gt 6)>
									<#if grandson_index gt 5>
									<a title="${grandson.name}" href="${base}/list/${catelog.id}-${child.id}-${grandson.id}.html">${grandson.name}</a>
									</#if>
								<#else>
								<a title="${grandson.name}" href="${base}/list/${catelog.id}-${child.id}-${grandson.id}.html">${grandson.name}</a>
								</#if>
							</#list>
						</li>
					</ul>
				</div>
				<#if child_index==1><#break></#if>
				</#list>
			</div><!--mc end-->
		</div><!--sortlist end-->
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
					var item = {width: 720,height: 200,widthB: 550,heightB: 200};
					item = pageConfig.FN_GetCompatibleData(item);
					$("#slide .slide-items-wrap .slide-items .slide-item").find("img").css("width", item.width).css("height", item.height);
				});
				</script>
			</div>
		</div><!--slide end-->
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
	</div>
	<div class="clr"></div>
</div>

<style>
/*brandlist*/
.brandlist{width:990px;margin-bottom: 10px;}
.brandlist .mt{position:relative;height:32px;}
.brandlist .tab{position:absolute;right:0;bottom:0;height:22px;width:135px;_width:136px;}
.brandlist .tab li{float:left;width:26px;margin-left:1px;height:22px;border-radius:3px 3px 0 0;line-height:22px;text-align:center;filter:Alpha(Opacity=100);opacity:1;background:url(${base}/static/mall/img/bg3.png) no-repeat -26px 0;color:#fff;}
.brandlist .tab li.curr{background:url(${base}/static/mall/img/bg3.png) no-repeat 0 0;color:#333;}
.brandlist h2{width:150px;height:32px;line-height:32px;font-size:16px;font-weight:normal;}
.brandlist .mc{height:230px;padding:10px;border-style:solid;border-color:#b08d6d #dedede #dedede;border-width:2px 1px 1px;}
.brandlist .mc ul{position:relative;overflow:hidden;height:230px;}
.brandlist .mc li{position:absolute;float:left;overflow:hidden;width:240px;overflow:hidden;}
.brandlist .mc .fore0,.brandlist .mc .fore3,.brandlist .mc .fore6{width:230px;height:230px;}
.brandlist .mc .fore1,.brandlist .mc .fore2,.brandlist .mc .fore4,.brandlist .mc .fore5{height:110px;}
.brandlist .mc .fore0{left:0px;top:0px;}
.brandlist .mc .fore1{left:240px;top:0px;}
.brandlist .mc .fore2{left:240px;top:120px;}
.brandlist .mc .fore3{left:490px;top:0px;}
.brandlist .mc .fore4{left:730px;top:0;}
.brandlist .mc .fore5{left:730px;top:120px;}
.brandlist .mc .fore6{display:none;}
.brandlist a{display:block;}

.widepage .brandlist{width:1210px;}
.widepage .brandlist .mc li{width:230px;}
.widepage .brandlist .mc .fore0{left:0;top:0px;}
.widepage .brandlist .mc .fore1{left:240px;top:0px;}
.widepage .brandlist .mc .fore2{left:240px;top:120px;}
.widepage .brandlist .mc .fore3{left:480px;top:0px;}
.widepage .brandlist .mc .fore4{left:720px;top:0;}
.widepage .brandlist .mc .fore5{left:720px;top:120px;}
.widepage .brandlist .mc .fore6{left:960px;top:0;display:block;}
</style>
<div class="content" style=""><!--display: none-->
    <div class="brandlist">
        <div class="mt">
			<h2>品牌旗舰店</h2>
        </div>
        <div class="mc" style="display: block;">
			<ul>
				<#list categoryBrandList as cbl>
					<li class="fore${cbl_index}">
                        <a href="#" title="${cbl.name}" target="_blank"><img height="100" width="150" src="${cbl.pic}" alt="${cbl.name}" data-img="2"></a>
                    </li>
                    <#if cbl_index==6><#break></#if>
				</#list>
			</ul>
        </div>
    </div><!--brandlist end-->
    <div class="clr"></div>
</div>

<style>
.hot-region{clear:both;overflow:hidden;margin:0 0 10px}
.hot-region-hd{overflow:hidden;border-right:1px solid #e6e6e6}
.hot-region-nav{width:990px;}
.hot-region-nav{background:#fefcf6;font-family:"Microsoft YaHei";font-size:14px}
.hot-region-nav li{width:197px;height:29px;}
.hot-region-nav li{float:left;padding:1px 0 0;border:1px solid #e6e6e6;border-right:0 none;line-height:29px;font-weight:700;text-align:center;cursor:default}
.hot-region-nav li.cur{border-top:2px solid #f6bb9a;border-bottom:0 none;padding:0;background:#fff;color:#ea5504}
.hot-region-bd{overflow:hidden;border:1px solid #e6e6e6;border-top:0 none;position:relative}
.hot-region .products{width:990px;height: 220px;}
.hot-region .products{display:none;padding-left:2px;_padding:0;}
.hot-region .products li{width:177px;height:210px;padding:10px 11px 0 10px;/*border-right: 1px solid #e5e5e5;*/}
.hot-region .products .fore5{display:none;}

.widepage .hot-region-nav{width:1210px;}
.widepage .hot-region-nav li{width:241px;}
.widepage .hot-region .products{width:1210px;}
.widepage .hot-region .products li{width:180px;}
.widepage .hot-region .products li{padding:10px 11px 0 10px;}
.widepage .hot-region .products .fore5{display:block;}

.products:after{content:".";display:block;height:0;clear:both;visibility:hidden}
.products{*zoom:1}
.products li{float:left;display:inline}
.products .pic{overflow:hidden;position:relative;text-align:center;width:150px;height:150px;margin:0 auto 2px}
.products .pic img{width:150px;height:150px}
.products .name{overflow:hidden;height:3em;margin-bottom:2px;word-break:break-all;word-wrap:break-word;}
.products .price{color: #999;overflow: hidden;}
.products .price strong {display: inline-block;font-family: verdana;font-size: 12px;margin-right: 5px;height: 20px;line-height: 20px;overflow: hidden;vertical-align: middle;color: #ea5313;}
.products .price del {display: inline-block;font-family: verdana;height: 20px;line-height: 20px;overflow: hidden;vertical-align: middle;text-decoration: line-through;}
.products em{color:#ff6600;}

</style>
<div class="content" style=""><!--display: none-->
    <div class="hot-region" id="hot-region">
		<div class="hot-region-hd">
			<ul id="hot-region-nav" class="hot-region-nav clearfix">
                <#list tagGoodsList as tagGoods>
				<li class="<#if tagGoods_index==0>cur</#if>">${tagGoods["tag"].name}</li>
                </#list>
			</ul>
		</div>
		<div class="hot-region-bd" >
            <#list tagGoodsList as tagGoods>
			<!--${tagGoods["tag"].name}-->
			<ul class="products" style="display: <#if tagGoods_index==0>block<#else>none</#if>;">
                <#list tagGoods["tagGoodsList"] as goods>
				<li class="fore${goods_index}">
					<p class="pic">
						<a href="${base}/item/${goods.id}.html" target="_blank"><img alt="${goods.fullName}" src="${goods.image}"></a>
					</p>
					<p class="name"><a href="#" target="_blank" title="${goods.fullName}">${goods.fullName}<em>${goods.adwords}</em></a></p>
					<p class="price"><strong>￥${goods.price}</strong><del>￥${goods.marketPrice}</del></p>
				</li>
                </#list>
			</ul>
            </#list>
		</div>
	</div><!--hot-region end-->
	<div class="clr"></div>
</div>

<style>
#floorList{width: 990px;margin:0 0 10px;}
#floorList .floor .mt {border-bottom: 2px solid #69a3eb;color: #69a3eb;width: 100%;height: 32px;font: 700 22px/32px "microsoft yahei";}
#floorList .floor .mc {width: 100%;}
#floorList .floor .mc .catalogue {background-color: #69a3eb;}
#floorList .floor .mc .catalogue {width: 210px;height: 424px;float: left;position: relative;border-bottom: 1px solid #e2e2e2;}
#floorList .floor .mc .catalogue .ca-list {width: 190px;overflow: hidden;padding-left: 20px;padding-top: 15px;margin-bottom: 10px;}
#floorList .floor .mc .catalogue .ca-list ul li {float: left;width: 87px;padding-left: 8px;height: 24px;line-height: 24px;overflow: hidden;background: url(${base}/static/mall/img/bg_list_li.png) no-repeat 0 center;}
#floorList .floor .mc .catalogue .ca-list ul li a {color: #fff;}
#floorList .floor .mc .catalogue .ca-txt {background-color: #3b84d6;}
#floorList .floor .mc .catalogue .ca-txt {width: 161px;height: 25px;line-height: 25px;padding-left: 25px;overflow: hidden;}
#floorList .floor .mc .catalogue .ca-txt b {color: #fff;float: right;font: 14px/23px "microsoft yahei";margin-right: 7px;}
#floorList .floor .mc .catalogue .ca-txt a {color: #fff;font: 14px/23px "microsoft yahei";}
#floorList .floor .mc .catalogue .ca-ad {width: 210px;height: 210px;position: absolute;bottom: 0;left: 0;overflow: hidden;}
#floorList .floor .mc .con {width: 780px;}
#floorList .floor .mc .con .pro-show {width: 582px;height:424px;position: relative;float: left;overflow: hidden;border-bottom: 1px solid #e2e2e2;}
#floorList .floor .mc .con .pro-show ul {overflow: hidden;zoom: 1;padding:0 11px;}
#floorList .floor .mc .con .pro-show li {float:left;overflow:hidden;width:143px;height:206px;padding:0 22px 5px;text-align:left;margin-right:-1px;}
#floorList .floor .mc .con .pro-show li .p-name{overflow:hidden;width:143px;height:1.5em;}
#floorList .floor .mc .con .pro-show li .p-img{width: 143px;height: 143px;overflow: hidden;margin-bottom: 10px;}
#floorList .floor .mc .con .pro-show ul .line1{border-right:1px dotted #ccc;border-bottom:1px dotted #ccc;}
#floorList .floor .mc .con .pro-show ul .line2{border-right:1px dotted #ccc;border-bottom:0px dotted #ccc;}
#floorList .floor .mc .con .pro-show ul .last{border-right:0px;}
#floorList .floor .mc .con .pro-show ul .hide{display: none;}
#floorList .floor .mc .con .pro-list {width: 196px;height:424px;float: right;background-color: #fff;border-bottom: 1px solid #e2e2e2;border-left: 1px solid #e2e2e2;border-right: 1px solid #e2e2e2;}
#floorList .floor .mc .con .pro-list .pmt {width: 196px;height: 40px;overflow: hidden;border-bottom: 1px solid #f4f4f4;}
#floorList .floor .mc .con .pro-list .pmt ul {width: 200px;}
#floorList .floor .mc .con .pro-list .pmt ul li.curr {color: #69a3eb;}
#floorList .floor .mc .con .pro-list .pmt ul li.curr {font-weight: 700;background-color: #fff;border-bottom: 1px solid #fff;}
#floorList .floor .mc .con .pro-list .pmt ul li {width: 100%;height: 39px;border-right: 1px solid #e2e2e2;border-bottom: 1px solid #e2e2e2;float: left;background-color: #f5f5f5;font: 16px/39px "microsoft yahei";text-align: center;}
#floorList .floor .mc .con .pro-list .pmc {width: 196px;height: 360px;}
#floorList .floor .mc .con .pro-list .pmc ul.p-brands {width: 196px;height: 352px;overflow: hidden;display: none;}
#floorList .floor .mc .con .pro-list .pmc ul.p-brands li {padding: 10px 9px;width: 80px;height: 30px;float: left;border-bottom: 1px solid #f4f4f4;}

.p-img {padding: 5px 0;}
.p-img a:link, .p-img a:visited {text-decoration: none;}
.p-img,.p-name,.p-price,.p-market,.p-detail {overflow: hidden;}
.p-name,.p-detail {word-break: break-all;word-wrap: break-word;}
.p-price {color: #999;word-wrap: break-word; word-break: normal;}
.p-price strong,.p-market strong {color: #ea5313;}

.widepage #floorList{width: 1210px;}
.widepage #floorList .floor .mc .con {width: 1000px;}
.widepage #floorList .floor .mc .con .pro-show {width: 802px;}
.widepage #floorList .floor .mc .con .pro-show li {width:150px;}
.widepage #floorList .floor .mc .con .pro-show li .p-name{width:150px;}
.widepage #floorList .floor .mc .con .pro-show li .p-img{width: 150px;height: 150px;}
.widepage #floorList .floor .mc .con .pro-show ul .hide{display: block;}
</style>
<#list typeList as child>
<div class="content">
	<div id="floorList">
		<div class="floor">
			<div class="mt">${child["catelog"].name}</div>
			<div class="mc">
				<div class="catalogue fl">
                    <div class="ca-list">
                        <ul>
                        <#list child["categrandList"] as cate>
            	        <li><a target="_blank" href="${base}/list/${catelog.id}-${child["catelog"].id}-${cate.id}.html" title="${cate.name}">${cate.name}</a></li>
                            <#if cate_index==5><#break></#if>
                        </#list>
                        </ul>
                    </div>
                    <div class="ca-txt">
                    	<b>&gt;</b><a target="_blank" href="#/1134884.html">店庆爆款特价最后秒</a>                 
                    </div>
                    <div class="ca-ad">
                        <!-- 广告位 id= 2_733_4762-->
                        <a href="${child['catlog1_floor_left_'+'${child_index+1}'+'_1'].link}" target="_blank"><img alt="${child['catlog1_floor_left_'+'${child_index+1}'+'_1'].name}" src="${child['catlog1_floor_left_'+'${child_index+1}'+'_1'].pic}" width="238px" height="192px"></a>
                    </div>
                </div><!--catalogue end-->
                <div class="con fr">  
					<div class="pro-show">
						<ul>
							<#list child["goodschildList"] as goodschild>
							<li class="line<#if goodschild_index lt 4>1<#else>2</#if><#if (goodschild_index==2 || goodschild_index==6)> hide </#if><#if (goodschild_index==3 || goodschild_index==7)> last </#if>">
								<div class="p-img">
									<a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}"><img alt="${goodschild.fullName}" data-img="1" src="${goodschild.image}" class="err-product" /></a>
								</div> 
								<div class="p-name">
									<a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">${goodschild.fullName}</a>
								</div> 
								<div class="p-price">
									<strong>￥${goodschild.price}</strong>
									<del><#if (goodschild.marketPrice)?exists>￥</#if>${goodschild.marketPrice}</del>
								</div>
							</li>
                            </#list>
						</ul>
					</div><!--pro-show end-->
					<div class="pro-list">
						<div class="pmt">
                            <ul>
                                <li class=curr">品牌旗舰店</li>
                            </ul>
                        </div>
                        <div class="pmc">
	                        <ul class="p-brands" style="display: block;">
	                            <#list child["brandchildList"] as brandchild>
	                        	<li><a target="_blank" href="#"><img alt="" width="80" height="30" src="${brandchild.pic}"></a></li>
	                            </#list>
                            </ul>
                        </div>
					</div><!--pro-list end-->
				</div><!--con end-->
			</div>
		</div><!--floor end-->
	</div><!--floorList end-->
	<div class="clr"></div>
</div>
<#if child_index==1><#break></#if>
</#list>
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
<script src="${base}/static/mall/js/list1.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
	$("#sortlist .item").Jdropdown({delay: 150});
	//轮播广告
	$("#slide").Slider();
	
	$("#hot-region-nav li").mouseenter(function() {
		$(this).siblings().removeClass("cur");
		var index = $(this).addClass("cur").index();
		var _p = $("#hot-region .products").hide()
				.eq(index).show();
		var _pt = _p.find("textarea");
		if (_pt.length) {
			_p.html(_pt.val());
		}
	});
							
});
</script>
<script type="text/javascript">
$(function () {
	var item = {width: 150,height: 150,widthB: 143,heightB: 143};
	item = pageConfig.FN_GetCompatibleData(item);
	console.log(item);
	$("#floorList .floor .mc .con .pro-show li .p-img").find("img").attr("width", item.width).attr("height", item.height);
});
</script>
</body>
</html>