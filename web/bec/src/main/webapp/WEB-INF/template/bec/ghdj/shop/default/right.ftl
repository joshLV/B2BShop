<#escape x as x?html>
<style>
 /*recommend*/
.recommend{border:1px solid #E6E6E6;}
.recommend .mt{height:40px;background:#ffffff; border-bottom: 1px solid #E6E6E6;}
.recommend .mt h2{height:40px;padding-left:10px;font:normal 15px/40px \5fae\8f6f\96c5\9ed1;}
.recommend .mt h2 em{color: #e9314a; font-weight: normal; border-bottom: 2px solid #e9314a; height: 38px; padding-left: 10px; padding-right: 10px;}
.recommend .mc{/*background: #F7F7F7;*/color: #666;/*height:327px;*/ background: #ffffff;}
.recommend .mc a, .recommend .mc a:hover, .recommend .mc a:visited, .recommend .mc a:link{outline: 0;text-decoration: none;}
.recommend .mc ul{overflow: hidden;padding: 5px 11px 5px 11px;}
.recommend .mc li{border: 1px solid #FFFFFF;background: none repeat scroll 0 0 #FFFFFF;float: left;overflow: hidden;padding: 10px;margin-left:10px;z-index: 1;}
.recommend .mc li:hover{border:solid 1px #ddd;box-shadow: 0 0 8px #ddd;}
.recommend .mc li:hover .title a:hover {color: #000;}
.recommend .mc .fore0{margin-left:12px;}
/*.recommend .mc .fore3{display: none;}*/

.recommend .mc .item{width:205px;height:295px;}
.recommend .mc .item .pic {overflow:hidden;position: relative;}
.recommend .mc .item .pic img{width:205px;height:212px;}
.recommend .mc .item .title {padding:10px 5px;}
.recommend .mc .item .title a {display: block;height: 32px;line-height: 16px;overflow: hidden;}
.recommend .mc .item .goodsInfo {padding-right: 10px;text-align: center;}
.recommend .mc .item .goodsInfo .price, .recommend .mc .item .goodsInfo .buynow {color: #FFFFFF;display: inline-block;height: 20px;line-height: 20px;padding: 1px 7px;vertical-align: top;}
 .recommend .mc .item .goodsInfo .buynow-disable {color: #FFFFFF;display: inline-block;height: 20px;line-height: 20px;padding: 1px 7px;vertical-align: top;}
.recommend .mc .item .goodsInfo .price {background: none repeat scroll 0 0 #b20000;}
.recommend .mc .item .goodsInfo .buynow {background: #b20000;}
.recommend .mc .item .goodsInfo .buynow-disable {background: #b2b2b2;}
.recommend .mc .item .goodsInfo .rmb {font-family: verdana;font-style: normal;font-weight: 500;}
.recommend .mc .item .goodsInfo .num {font-size: 13px;}
.num p i{float: left;}

.widepage .recommend .mc .fore0{margin-left:0px;}
.widepage .recommend .mc .fore3{display: block;}

.cart_btn{
     float: right;
     font-size: 12px;
     width:20px !important;
 }
.cart_btn_img{
     width: 18px;
     height: 18px;
     background: url(${base}/static/bec/project/ghdj/images/search.ele.png) no-repeat 0 -273px;
 }
</style>
<div class="recommend">
    <div class="mt">
        <h2><em>掌柜推荐</em></h2>
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
						<span class="goodsprice">
							<#--<em class="rmb">￥</em>-->
							<span class="num">
								<#if priceHide =="hide" >
                                    仅会员可见！
								<#else >
								<p>
                                    <i>商城价：</i>
                                <span>
									<#if goods.enableBatchPrice == '1'>
                                        ￥${goods.batchPrice}
									<#else >
									<#--${goodschild.price?string("currency")}-->
										<#if !goods.price?? || goods.price == '0' || goods.price == '0.00'>
											<#assign isGoBuy=false>
										</#if>
									${goods.price?string(priceFormat)}
									</#if>
								</span>
								</p>
                                    <p><i>会员价：</i><span class="red">￥${(goods.price*(1-goods.defaultPrice/100))?string(priceFormat)}</span></p>
								</#if>
							</span>
						</span>
				<#if priceHide !="hide" >
						<a class="cart_btn" href="javascript:void(0)" onclick="addCart('${goods.id}','1');" title="加入购物车">
                            <em class="cart_btn_img"></em>
						</a>
				</#if>
					</div><!--goodsInfo end-->
				</div><!--item end-->
			</li>
			</#list>
		</ul>
    </div>
</div>

<style>
 /*goodsList*/
.goodsList{border: 1px solid #E6E6E6; margin-top: 10px;}
.goodsList .mt{height:40px;background:#ffffff; border-bottom: 1px solid #E6E6E6;}
.goodsList .mt h2{height:40px;padding-left:10px;font:normal 15px/40px \5fae\8f6f\96c5\9ed1;color:#0171bc; }
 .goodsList .mt h2 em{color: #e9314a; font-weight: normal; border-bottom: 2px solid #e9314a; height: 38px; padding-left: 10px; padding-right: 10px;}
.goodsList .mc{color: #666;height:auto;/*border-top:2px solid #0171bc;*/background: #ffffff; padding-top: 20px; padding-bottom: 10px;}
.goodsList .mc a, .goodsList .mc a:hover, .goodsList .mc a:visited, .goodsList .mc a:link{outline: 0;text-decoration: none;}
.goodsList .mc ul{overflow: hidden;padding: 5px 11px 5px 11px;}
.goodsList .mc li{border: 1px solid #FFFFFF;background: none repeat scroll 0 0 #FFFFFF;float: left;overflow: hidden;padding: 10px;margin-left:10px;z-index: 1;border:solid 1px #ddd;}
.goodsList .mc li:hover{border:solid 1px #ddd;box-shadow: 0 0 8px #ddd;}
.goodsList .mc .title a:hover {color: #000;}
.goodsList .mc .fore0{margin-left:12px;}
/*.goodsList .mc .fore3{display: none;}*/
.goodsList .mc .item{width: 205px;height:275px;}
.goodsList .mc .item .pic {overflow: hidden;position: relative;}
.goodsList .mc .item .pic img{width:205px;height:212px;}
.goodsList .mc .item .title {padding: 10px 5px;}
.goodsList .mc .item .title a {display: block;height: 32px;line-height: 16px;overflow: hidden;}
.goodsList .mc .item .goodsInfo {padding-right: 10px;text-align: left;}
.goodsList .mc .item .goodsInfo .price {}
.goodsList .mc .item .goodsInfo .price {font-size: 14px;/*font-weight: bold;*/color: #999999;}
.goodsList .mc .item .goodsInfo .rmb {font-family: verdana;}
.goodsList .mc .item .goodsInfo .num {font-size: 13px;}
 .goodsList .mc .item .goodsInfo .price .red{font-size: 16px; color: #e12f45;}
 .goodsList .mc .item .goodsInfo .num span{font-size: 16px; color: #555555;}
.widepage .goodsList .mc .fore3{display: block;}

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
<div class="goodsList">
    <div class="mt">
        <h2><em>商品列表</em></h2>
    </div>
	<div class="mc">
    	<ul>
    		<#list pager.list as goods>
    		<li class="fore${goods_index}">
				<div class="item">
					<div class="goodspic">
						<a target="_blank" href="${base}/item/${goods.id}.html" title="${(goods.fullName)!}">
							<img src="${(goods.pic)!}" class="" alt="${(goods.fullName)!}">
						</a>
					</div><!--pic end-->
					<div class="goodstitle">
						<a target="_blank" href="${base}/item/${goods.id}.html">${(goods.fullName)!}</a>
					</div><!--title end-->
					<div class="goodsInfo">
						<span class="price">

							<span class="num">
							<#if priceHide =="hide" >
                                仅会员可见！
							<#else >
                           		 <p>
									 <i>商城价：</i>
									 <span>
										<#if goods.enableBatchPrice == '1'>
                                            ￥${goods.batchPrice}
										<#else >
                                            ￥${goods.price?string("##0.00")}
										<#--${goodschild.price?string("currency")}-->
										</#if>
                                 	</span>
								 </p>
                                <p><i>会员价：</i><span class="red">￥${(goods.price*(1-goods.defaultPrice/100))?string(priceFormat)}</span></p>
							</#if>

							</span>
						</span>
						<#if priceHide !="hide" >
                            <a class="cart_btn" href="javascript:void(0)" onclick="addCart('${goods.id}','1');" title="加入购物车">
                                <em class="cart_btn_img"></em>
                            </a>
						</#if>
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
							<#--<em class="rmb">￥</em>-->
							<span class="num">
							<#if priceHide =="hide" >
                                仅会员可见！
							<#else >
								<#if goods.enableBatchPrice == '1'>
                                    ${goods.batchPrice}
								<#else >
								<#--${goodschild.price?string("currency")}-->
								<#--${goods.price?string("##0.00")}-->

                                    <p>
                                        <i>商城价：</i>
									 <span>
										 <#if goods.enableBatchPrice == '1'>
                                             ￥${goods.batchPrice}
										 <#else >
                                             ￥${goods.price?string("##0.00")}
										 <#--${goodschild.price?string("currency")}-->
										 </#if>
                                     </span>
                                    </p>
                                <p><i>会员价：</i><span class="red">￥${(goods.price*(1-goods.defaultPrice/100))?string(priceFormat)}</span></p>
								</#if>
							</#if>
							</span>
						</span>
						<#if priceHide !="hide" >
                            <a class="cart_btn" href="javascript:void(0)" onclick="addCart('${goods.id}','1');" title="加入购物车">
                                <em class="cart_btn_img"></em>
                            </a>
						</#if>
					</div><!--goodsInfo end-->
				</div><!--item end-->
			</li>
			</#if>
			</#list>
        </ul>
    </div>
	</#if>
	
	<!--分页-->
	<div class="clearfix" style="background: #ffffff; padding-right: 20px; padding-bottom: 15px;">
	    <div class="pagin fr">
 			<#if (pager.list?size > 0)>
 				<#import "bec/ghdj/pager.ftl" as p>
 				<@p.pager pager = pager baseUrl = "/shop/${(shop.urlAddress)!}.html" />
 			<#else>
			<div class="noRecord">
				掌柜尚未发布任何商品信息!
			</div>
			</#if>
		</div>
	</div>
</div>
<script type="text/javascript">
    function addCart(goodsId, cnt) {
        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
    }
</script>
</#escape>