<#escape x as x?html>
<style>
 /*recommend*/
.recommend{border:1px solid #ddd;}
.recommend .mt{height:30px;background:#f7f7f7;border-bottom:1px dotted #ddd;}
.recommend .mt h2{height:30px;padding-left:10px;font:normal 15px/31px \5fae\8f6f\96c5\9ed1;color:#333}
.recommend .mc{/*background: #F7F7F7;*/color: #666;/*height:327px;*/}
.recommend .mc a, .recommend .mc a:hover, .recommend .mc a:visited, .recommend .mc a:link{outline: 0;text-decoration: none;}
.recommend .mc ul{overflow: hidden;padding: 5px 11px 5px 11px;}
.recommend .mc li{border: 1px solid #FFFFFF;background: none repeat scroll 0 0 #FFFFFF;float: left;overflow: hidden;padding: 10px;margin-left:10px;z-index: 1;}
.recommend .mc li:hover{border:solid 1px #ddd;box-shadow: 0 0 8px #ddd;}
.recommend .mc li:hover .title a:hover {color: #000;}
.recommend .mc .fore0{margin-left:12px;}
.recommend .mc .fore3{display: none;}

 .recommend .mc .item{width: 209px;height:260px;}
 .recommend .mc .item .pic {overflow: hidden;position: relative;height:208px;background: rgba(0, 0, 0, 0) url("${base}/static/bec/project/jp/images/default_logo.jpg") no-repeat scroll 50% 50%;}
 .recommend .mc .item .pic img{width:208px;height:208px;}
 .recommend .mc .item .title {padding: 5px;}
 .recommend .mc .item .title a {display: block;height: 20px;line-height: 20px;overflow: hidden;}
 .recommend .mc .item .goodsInfo {text-align: left;}
 .recommend .mc .item .goodsInfo .price, .recommend .mc .item .goodsInfo .buynow {color: #FFFFFF;display: inline-block;height: 20px;line-height: 20px;padding: 1px 7px;vertical-align: top;}
 .recommend .mc .item .goodsInfo .price {color: #e4393c; font-weight: bold;}
 .recommend .mc .item .goodsInfo .buynow {background: #DB0000; border-radius: 3px;}
 .recommend .mc .item .goodsInfo .rmb {font-family: verdana;font-style: normal;color: #e4393c; font-size: 14px; }
 .recommend .mc .item .goodsInfo .num {font-size: 14px;}


.widepage .recommend .mc .fore0{margin-left:0px;}
.widepage .recommend .mc .fore3{display: block;}
</style>
<div class="recommend m">
    <div class="mt">
        <h2>掌柜推荐</h2>
    </div>
    <div class="mc">
        <ul>
        	<#list recommendGoodsList as goods>
			<li class="fore${goods_index}">
				<div class="item">
					<div class="pic">
						<a target="_blank" href="${base}/item/${goods.id}.html" title="${(goods.fullName)!}">
							<img src="${(goods.pic)!}" class="" alt="${(goods.fullName)!}">
						</a>
					</div><!--pic end-->
					<div class="title">
						<a target="_blank" href="${base}/item/${goods.id}.html">${(goods.fullName)!}</a>
					</div><!--title end-->
					<div class="goodsInfo">
						<span class="price">
							<em class="rmb">￥</em>
							<span class="num">${goods.price?string(priceFormat)}</span>
						</span>
						<a class="buynow" target="_blank" href="${base}/item/${goods.id}.html" title="${(goods.fullName)!}">立即购买</a>
					</div><!--goodsInfo end-->
				</div><!--item end-->
			</li>
			</#list>
		</ul>
    </div>
</div>

<style>
 /*goodsList*/
.goodsList{}
.goodsList .mt{height:30px;background:#f7f7f7;}
.goodsList .mt h2{height:30px;padding-left:10px;font:normal 15px/31px \5fae\8f6f\96c5\9ed1;color:#333}
.goodsList .mc{color: #666;height:307px;border-top:1px dotted #ddd;}
.goodsList .mc a, .goodsList .mc a:hover, .goodsList .mc a:visited, .goodsList .mc a:link{outline: 0;text-decoration: none;}
.goodsList .mc ul{overflow: hidden;padding: 5px 11px 5px 11px;}
.goodsList .mc li{border: 1px solid #FFFFFF;background: none repeat scroll 0 0 #FFFFFF;float: left;overflow: hidden;padding: 10px;margin-left:10px;z-index: 1;}
.goodsList .mc li:hover{border:solid 1px #ddd;box-shadow: 0 0 8px #ddd;}
.goodsList .mc .title a:hover {color: #000;}
.goodsList .mc .fore0{margin-left:12px;}
.goodsList .mc .fore3{display: none;}
.goodsList .mc .item{width: 212px;height:275px;}
.goodsList .mc .item .pic {overflow: hidden;position: relative;}
.goodsList .mc .item .pic img{width:212px;height:212px;}
.goodsList .mc .item .title {padding: 10px 5px;}
.goodsList .mc .item .title a {display: block;height: 32px;line-height: 16px;overflow: hidden;}
.goodsList .mc .item .goodsInfo {padding-right: 10px;text-align: left;}
.goodsList .mc .item .goodsInfo .price {}
.goodsList .mc .item .goodsInfo .price {font-size: 14px;font-weight: bold;color: #E4393C;}
.goodsList .mc .item .goodsInfo .rmb {font-family: verdana;}
.goodsList .mc .item .goodsInfo .num {font-size: 13px;}


.widepage .goodsList .mc .fore3{display: block;}
</style>

<style>
.pagin .prev, .pagin .prev-disabled {padding-left: 12px;}
.pagin .prev-disabled, .pagin .next-disabled {color: #ccc; cursor: default;}
.pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {position: relative;padding-top: 5px;height: 18px;line-height: 18px;}
.pagin a, .pagin span {float: left;height: 20px;padding: 3px 10px;border: 1px solid #ccc;margin-left: 2px;font-family: arial;line-height: 20px;font-size: 14px;overflow: hidden;-moz-border-radius: 5px;-webkit-border-radius: 5px;}
.pagin .prev-disabled, .pagin .next-disabled {color: #ccc;cursor: default;}
.pagin .prev-disabled, .pagin .next-disabled {position: relative;padding-top: 5px;height: 18px;line-height: 18px;}
.pagin .current, .pagin .current:link, .pagin .current:visited {color: #f60;font-weight: 700;}
.pagin .text, .pagin .current {border: 0;padding: 4px 11px;}
.pagin .text, .pagin .current {font-family: verdana;}
.pagin a, .pagin span {border-radius: 3px;}
.pagin a, .pagin span {float: left;height: 20px;padding: 3px 10px;border: 1px solid #ccc;margin-left: 2px;font-family: arial;line-height: 20px;font-size: 14px;overflow: hidden;-moz-border-radius: 5px;-webkit-border-radius: 5px;}
.pagin .next, .pagin .next-disabled {padding-right: 12px;}
.pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {position: relative;padding-top: 5px;height: 18px;line-height: 18px;}
</style>
<div class="goodsList m">
    <div class="mt">
        <h2>商品列表</h2>
    </div>
	<div class="mc">
    	<ul>
    		<#list pager.list as goods>
    		<li class="fore${goods_index}">
				<div class="item">
					<div class="pic">
						<a target="_blank" href="${base}/item/${goods.id}.html" title="${(goods.fullName)!}">
							<img src="${(goods.pic)!}" class="" alt="${(goods.fullName)!}">
						</a>
					</div><!--pic end-->
					<div class="title">
						<a target="_blank" href="${base}/item/${goods.id}.html">${(goods.fullName)!}</a>
					</div><!--title end-->
					<div class="goodsInfo">
						<span class="price">
							<em class="rmb">￥</em>
							<span class="num">${goods.price?string(priceFormat)}</span>
						</span>
					</div><!--goodsInfo end-->
				</div><!--item end-->
			</li>
			<#if goods_index==3><#break></#if>
			</#list>
        </ul>
    </div>
	<#if pager.list?size gt 4>
	<div class="mc">
    	<ul>
    		<#list pager.list as goods>
    		<#if goods_index gt 3>
    		<li class="fore${goods_index}">
				<div class="item">
					<div class="pic">
						<a target="_blank" href="${base}/item/${goods.id}.html" title="${(goods.fullName)!}">
							<img src="${(goods.pic)!}" class="" alt="${(goods.fullName)!}">
						</a>
					</div><!--pic end-->
					<div class="title">
						<a target="_blank" href="${base}/item/${goods.id}.html">${(goods.fullName)!}</a>
					</div><!--title end-->
					<div class="goodsInfo">
						<span class="price">
							<em class="rmb">￥</em>
							<span class="num">${goods.price?string(priceFormat)}</span>
						</span>
					</div><!--goodsInfo end-->
				</div><!--item end-->
			</li>
			</#if>
			</#list>
        </ul>
    </div>
	</#if>
	
	<!--分页-->
	<div class="m clearfix">
	    <div class="pagin fr">
 			<#if (pager.list?size > 0)>
 				<#import "mall/jd/pager.ftl" as p>
 				<@p.pager pager = pager baseUrl = "/shop/${(shop.urlAddress)!}.html" />
 			<#else>
			<div class="noRecord">
				掌柜尚未发布任何商品信息!
			</div>
			</#if>
		</div>
	</div>
</div>
</#escape>