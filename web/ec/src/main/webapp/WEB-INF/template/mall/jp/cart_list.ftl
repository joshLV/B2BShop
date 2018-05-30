<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>我的购物车</title>
<link href="${base}/static/mall/jp/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/jp/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"cardlist"
};
</script>
</head>
<body>
<#include "mall/jp/shortcut.ftl"/>
<style>
.header {padding: 20px 0 10px;}
#logo {padding-left: 5px;float: left}
.progress {padding-top: 6px;}
.progress .progress-1{background:url(${base}/static/mall/img/step1.png) no-repeat;width:481px;padding-top:23px;overflow:hidden;height:23px;}
.progress ul {width:481px; float:right;}
.progress li {width:160px; height:23px; float:left; color:#bce8a3; line-height:23px; text-align:center;}
.progress li b {width:22px; height:25px; display:none; }
.progress li.step-1{color:#7abd54;}
.progress li.step-2{color:#aaaaaa;width:161px;}
.progress li.step-3{color:#aaaaaa;}
.progress li.complete b {background-position:0 -50px;}


.cart {padding-bottom: 20px;}
.cart .cart-hd {height: 28px; margin-top: 25px;}
.cart-hd {position: relative;}
.cart .cart-hd h2 {width: 100px;float: left; /*border-bottom: 2px solid #e4393c;*/ font-size: 16px; margin-top: 5px;  font-weight: normal;}
.cart h2 {height: 20px;padding-bottom:8px;overflow: hidden;/*background: url(${base}/static/mall/img/cart_title.png) no-repeat left top;*/}
.cart .cart-hd span, .cart .cart-hd a {float: left;}
.cart .cart-hd .fore {padding-left: 40px;line-height: 21px;}
.cart .cart-hd .btn-text {line-height: 21px;}
.cart-hd img{margin-right: 10px; float: left;}
.cart-inner {border: 1px solid #ddd;border-top:2px solid #E4393C;}
.cart-inner .cart-thead {height: 35px;background-color: #f7f7f7; width:1208px; text-align: left; overflow: hidden;}
.cart-inner .cart-tbody {border-bottom: 1px solid #ddd;}
.cart-empty {height: 98px;border: 1px solid #ddd;border-top: 2px solid #db0000;}
.cart-empty .message {height: 98px;padding-left: 341px;background: #f3f3f3 url(${base}/static/mall/img/cart-empty-bg.png) no-repeat 250px 22px;}
.cart-empty .message p {line-height: 98px;}
.cart-empty .message ul {padding-top: 23px;}
.cart-empty .message li {line-height: 26px;}
.cart-empty a,.cart-empty a:visited,.cart-empty a:hover {color: #005ea7;}

.cart-thead .column {width: 99px;height: 35px;border-right: 1px solid #f7f7f7;float: left;color: #666;line-height: 35px;text-align: left;}
.cart-thead .t-checkbox {line-height: normal;text-align: left;}
.cart-thead .t-checkbox input {margin: 11px 5px 0 19px;margin: 11px 5px 0 16px\9;*margin: 6px 2px 0 16px;display: inline;}
.cart-thead .t-checkbox label {line-height: 35px;}
.cart-thead .t-goods {width: 520px;}
.cart-thead .t-price {width: 128px;text-align: left;}
.cart-thead .t-promotion {width: 149px;}
.cart-thead .t-action {border-right: 0; margin-left: 30px;}

input {margin: 0;padding: 0;}

.cart-tbody .item {border-top: 1px solid #ddd;padding: 10px 0;}
.cart-tbody .item,.cart-tbody .item-meet,.cart-tbody .suit {clear: left;}
.cart-tbody .item-first {border-top: 0;}
.cart-tbody .item_form {height: 52px;}
.cart-tbody .item_extra {padding: 5px 0 0 50px;clear: both;}

.item .p-gift .g-name {width: 739px;float: left;}
.item .p-gift .g-count {width: 100px;float: left;text-align: center;}
.cart-tbody .item_extra .g-number {width: 34px;height: 18px;margin: 0 auto;border: 1px solid #EDEDED;border-top-color: #ccc;border-left-color: #ccc;padding-top: 2px;overflow: hidden;text-align: center;line-height: 18px;display: block;background-color: #F7F7F8;color: #666;}
.cart-tbody .cell {float: left;/*min-height: 52px;*/height: auto!important;}
.cart-tbody .p-checkbox {width: 50px;height: 52px;}
.cart-tbody .p-checkbox input {margin: 20px 0 0 19px;margin: 17px 0 0 16px\9;*margin: 16px 0 0 16px;float: left;display: inline;}
.cart-tbody .p-goods {width:520px;overflow:hidden;}
.cart-tbody .p-img {width: 50px;height: 50px;margin-right: 10px;border: 1px solid #ddd;padding: 0;float: left;background-color: #fff;}
.cart-tbody .p-img img {display: block;}
.cart-tbody .p-name {padding-right: 10px;line-height: 18px;}
.cart-tbody .p-name span {display: block;color: #999;line-height: 18px;}
.cart-tbody .p-sp {overflow:hidden;text-align: left;}
.cart-tbody .p-price {width: 130px;text-align: left;line-height: 52px;}
.cart-tbody .price {/*padding-right: 10px; 20130701 shijianguo*/color: #333;font-family: Verdana,Arial;}
.cart-tbody .p-promotion {width: 150px;}
.cart-tbody .p-promotion span {height: 20px;margin: 16px 0 0 5px;border-radius: 3px;-moz-border-radius: 3px;-webkit-border-radius: 3px;display: block;overflow: hidden;color: #fff;line-height: 20px;text-align: center;}
.cart-tbody .p-promotion-special span {margin-top: 4px;}
.cart-tbody .p-promotion em {font-family: Verdana,Arial;}
.cart-tbody .p-promotion .return-now {background-color: #3b0;}
.cart-tbody .p-promotion .give-points {background-color: #f90;}
.cart-tbody .p-remove {width: 89px;color: #005ea7; margin-left: 10px;}
.cart-tbody .p-name a,.cart-tbody .p-name a:visited,.cart-tbody .p-name a:hover,.cart-tbody .p-remove a,.cart-tbody .p-remove a:visited,.cart-tbody .p-remove a:hover {color: #005ea7;}
.cart-tbody .p-name a.edit,.cart-tbody .p-name a.edit:visited {text-decoration: underline;}
.cart-tbody .p-name a.edit:hover {text-decoration: none;}
.cart-tbody .p-inventory {color: #999;}
.cart-tbody .p-inventory,.cart-tbody .p-quantity {width: 100px;text-align: left;}
.cart-tbody .p-inventory,.cart-tbody .p-remove {line-height: 52px;text-align: left;}
.cart-tbody .p-quantity {line-height: 52px;}
.cart-tbody .p-quantity .quantity-form {width: 90px;height: 22px;padding-top: 16px;overflow: hidden;text-align: left;}
.cart-tbody .p-quantity a {width: 20px;height: 20px; float: left;display: block;overflow: hidden;line-height: 18px;background:#fff;border:1px solid #ccc;text-align:center;}
.cart-tbody .p-quantity a:hover{text-decoration:none;color:#333;border:1px solid #999;}
.p-quantity .quantity-form input {float: left;border:1px solid #ccc;}
.cart-tbody .p-quantity a.decrement {margin-right: 5px;}
.cart-tbody .p-quantity a.increment {float: right;}
.cart-tbody .p-quantity a.disabled {background-position: 0 -26px;}
.cart-tbody .quantity-text {width: 34px;height: 20px;border: 1px solid #ddd;border-top-color: #aaa;border-left-color: #aaa;overflow: hidden;text-align: center;background-color: #fff;}
.cart-tbody .extend-service-btn {line-height: 22px;margin-bottom:13px;}
.cart-tbody .extend-service-btn a,.cart-tbody .extend-service-btn a:visited {color: #c00;}
.cart-tbody  .item_extra  .sku-yanBao .cell{min-height: auto;line-height:18px;}
.cart-tbody .p-gift {color: #999;line-height: 22px;}
.cart-tbody .p-gift a,.cart-tbody .p-gift a:visited,.cart-tbody .p-gift a:hover {color: #005ea7;}
.cart-tbody .item_extra .cell {min-height: 22px;}
.cart-tbody .s-name {width: 389px;color: #999;line-height: 22px;}
.cart-tbody .s-name a,.cart-tbody .s-name a:visited,.cart-tbody .s-name a:hover {color: #005ea7;}
.cart-tbody .s-price {width: 130px;margin-right: 220px;text-align: right;}
.cart-tbody .s-quantity {width: 100px;}
.cart-tbody .s-remove {width: 99px;line-height: 22px;}
.cart-tbody .s-quantity,.cart-tbody .s-remove {text-align: center;}
.cart-tbody .s-remove a,.cart-tbody .s-remove a:visited,.cart-tbody .s-remove a:hover {color: #005ea7;}
.cart-tbody .suit {background-color: #eff8ff;}
.cart-tbody .item-meet {background-color: #f2f9ff;}
.cart-tbody .item_selected .item,.cart-tbody .item_selected .row {background-color: #fffdee;}
.cart-tbody .item_none {background-color: #ddd;}
.cart-tbody .item_selected {background-color: #fff6f6 !important;}
.cart-tbody .cut-price {line-height: normal;}
.cart-tbody .cut-price .cut-text {padding-right: 10px;color: #999;}
.cart-tbody .cut-price .cut-text em {font-family: Verdana,Arial;}
.cart-tbody .extend-service {color: #c00;line-height: 22px;}
.cart-tbody .extend-service a, .cart-tbody .extend-service a:visited, .cart-tbody .extend-service a:hover {color: #005ea7;}
.cart-tbody .p-gift {}
.cart-tbody .col-2{line-height: 26px;}
.cart-tbody .col-2 a{line-height: 26p;}
.cart-tbody .p-promotion .beans-info{border:1px solid #ebf7e4;padding:4px;text-align:center;line-height:20px;color:#7abd54;background:#fff;margin:0 5px;}
.cart-tbody .p-promotion .beans-info a{color:#005ea7;}
.cart-tbody .p-promotion .beans-info span.gray{color:#999;display:inline;height: 20px;margin:0;border-radius: none;-moz-border-radius: none;-webkit-border-radius: none;overflow: hidden;line-height: 20px;}
.cart-tbody .p-name .gift-info-color a{color:#000;}
.cart-tbody .p-name a.gift-info-color:link, .cart-tbody .p-name a.gift-info-color:visited{color:#000;}
.cart-tbody .item_form {height: 52px;}
.cart-tbody .p-checkbox {width:50px;height: 52px;margin-left: 50px; }
.cart-tbody .cell {float: left;/*min-height: 52px;*/height: auto!important;}
.cart-toolbar,.cart-total {clear: both;}
.cart-toolbar {padding: 15px 10px;line-height: 22px;}
.cart-toolbar .control span {height: 22px;float: left;}
.cart-toolbar .control b {margin-right: 4px;float: left;overflow: hidden;line-height: 0;font-size: 0;background: url(${base}/static/mall/img/icon-1.gif) no-repeat;}
.cart-toolbar .control .delete {margin-right: 12px;}
.cart-toolbar .control .delete b {width: 9px;height: 9px;margin-top: 6px;background-position: 0 0;}
.cart-toolbar .control .pool b {width: 14px;height: 12px;margin-top: 5px;background-position: 0 -9px;}
.cart-toolbar .control a,.cart-toolbar .control a:visited,.cart-toolbar .control a:hover {color: #005ea7;}
.cart-toolbar .amout {padding-right: 10px;}
.cart-toolbar .amout span {color: #e4393c;font-family: Verdana,Arial;}
.cart-toolbar .total {width: 180px;}
.cart-toolbar .total p {clear: both;}
.cart-toolbar .total span {float: right;font-family: Verdana,Arial;}
.cart-total {padding: 10px 10px;background-color: #f7f7f7;}
.cart-total a.btn:hover span {color: #333;}
.cart-total a.gray-btn .btn-icon {height: 12px;top: 4px;background: url(${base}/static/mall/img/btn-storage-icon.png) no-repeat;}
.cart-total a.gray-btn .btn-text {padding-left: 32px;}
.cart-total a.btn:hover {background-position: 100% -84px;}
.cart-total a.btn:hover .btn-text {background-position: 0 -21px;}
.cart-total a.btn-storage .btn-icon {width: 19px;left: 7px;background-position: 0 0;}
.cart-total a.btn-storage:hover .btn-icon {background-position: 0 -12px;}
.cart-total a.btn-takeout .btn-icon {width: 15px;left: 9px;background-position: -20px 0;}
.cart-total a.btn-takeout:hover .btn-icon {background-position: -20px -12px;}
.cart-total .delivery {width: 106px;height: 28px;border: 1px solid #edd28b;padding-left: 40px;color: #f60;line-height: 28px;background: #fffdee url(${base}/static/mall/img/delivery-icon-1.gif) no-repeat 10px 6px;}
.cart-total .total {width: 250px;margin-left: 10px;line-height: 30px;font-weight: 700;}
.cart-total .total span {float: right;color: #e4393c;font-size: 20px;font-weight: 400;font-family: Verdana,Arial;}
.t-quantity{text-align: center !important; width: 76px !important;}
a.btn:hover, a.btn:hover span {text-decoration: none;}
a.btn:visited, a.btn:hover {color: #333;}
a:hover {color: #E4393C;text-decoration: underline;}
.btn {float: left;display: block;overflow: hidden;position: relative;margin-right: 5px;padding-right: 10px;line-height: normal;font-size: 12px;background-position: 100% -63px;}
.cart-button {padding: 10px 0 0;}
.cart-button a.btn span {color: #333;}
.cart-button a.continue {padding-right: 16px;background-position: 100% -198px;}
.cart-button a#continue{background: url(${base}/static/mall/img/btn-proceed.png) no-repeat 0 0;width:94px;height:36px;line-height:36px;text-align:center;padding:0;} 
.cart-button a.continue:hover {background-position: 100% -234px;}
.cart-button a#continue:hover{background-position:0 -36px;box-shadow:0 1px 1px rgba(0,1,1,0.1);}
.cart-button a.continue .btn-text {height: 36px;padding: 0 0 0 16px;line-height: 36px;background-position: 0 -126px;}
.cart-button a#continue .btn-text{background:none;padding:0;text-align:center;width:94px;}
.cart-button a.continue:hover .btn-text {background-position: 0 -162px;}
.cart-button a#continue:hover .btn-text{background:none;}
.cart-button a.checkout {width: 135px;height: 36px;float: right;display: block;overflow: hidden; background: #db0000; border-radius: 3px; /*background: url(${base}/static/mall/img/btn-check-01.jpg) no-repeat #E43F45;*/font-family: "\5FAE\8F6F\96C5\9ED1";font-size: 18px; text-align: center; line-height: 32px;_line-height: 36px;color:#fff;position: relative;}
.cart-button a.checkout:hover{background-position:0 -36px;background-color:#ED4749;text-decoration: none; cursor:pointer}
.cart-button a.checkout b{position: absolute;left: 0;top: 0;width: 100%;height: 100%;/*background: url(${base}/static/mall/img/btn-check.jpg) no-repeat;*/ background: #db0000; border-radius: 3px; color: #ffffff;}
.cart-button a.checkout:hover b{background-position:0 -36px;}
.cart-button a.checkout-disabled {width: 135px;height: 36px;float: right;display: block;overflow: hidden;/*background: url(${base}/static/mall/img/btn-check-01.jpg) no-repeat #E43F45;*/background: #dddddd; border-radius: 3px; color: #ffffff;font-family: "\5FAE\8F6F\96C5\9ED1";font-size: 18px;line-height: 32px;_line-height: 36px; text-align: center; position: relative; }
.cart-button a.checkout-disabled:hover{background-position:0 -36px;background-color:#dddddd;text-decoration: none;}
.cart-button a.checkout-disabled b{position: absolute;left: 0;top: 0;width: 100%;height: 100%;/*background: url(${base}/static/mall/img/btn-check-disabled.jpg) no-repeat;*/background: #dddddd; border-radius: 3px; color: #ffffff;}
.cart-button a.checkout-disabled:hover b{background-position:0 -36px;}
.cart-button .checkout-state {width: 356px;height: 28px;border: 1px solid #edd28b;float: right;display: block;overflow: hidden;color: #f60;line-height: 28px;text-align: center;background-color: #fffdee;}
.cart-button .checkout-state b {width: 30px;height: 30px;margin: 2px 0 0 10px;float: left;display: inline;background: url(${base}/static/mall/img/loading.gif) no-repeat center center;}
	/* 商家名称 */
	.sj-name{height: 40px; line-height: 40px; margin: 0 auto; padding-left: 18px; font-size: 14px; font-weight: bold; border-top: 1px solid #dddddd;}
.sj-name label{margin-left: 10px;}
</style>
<div class="content m header clearfix">
	<div id="logo">
		<a href="${base}/index"><img src="${base}/static/mall/jp/img/logo.png" title="返回京东商城首页" alt="返回京东商城首页"></a>
	</div><!--logo end-->
	<div class="progress clearfix">
		<ul class="progress-1">
			<li class="step-1"><b></b>1.我的购物车</li>
			<li class="step-2">2.填写核对订单信息</li>
			<li class="step-3">3.成功提交订单</li>
		</ul>
	</div>
	<div class="clr"></div>
</div>
<div class="content cart">
	<div class="cart-hd">
		<img src="/ec/static/mall/jp/img/shop_cart.png"> <h2>我的购物车</h2>
		<span class="fore"></span>
	</div><!--cart-hd end-->
	<div class="cart-empty" id="cartempty" style="display:none;">
			<div class="message" >
                <ul>
	                <li style="margin-top: 15px;">购物车内暂时没有商品 <a href="${base}/index">去首页</a>挑选喜欢的商品</li>
                </ul>
		    </div>
	</div>
	<div id="show" style="display:none;">
		<input type="hidden" value="${isLogin}" id="isLogin">
		<div class="cart-inner" id ="cartinner">
		    <div class="cart-thead clearfix">
		        <div class="column t-checkbox form"><input class="checkbox" id="allcheck" type="checkbox"><label for="allcheck">全选</label></div>
		        <div class="column t-goods">商品</div>
		        <div class="column t-price">商城价</div>
		        <div class="column t-promotion">优惠</div>
		        <div class="column t-inventory">库存</div>
		        <div class="column t-quantity">数量</div>
		        <div class="column t-action">操作</div>
		    </div><!-- cart-thead end -->
		    
		    <div id="product-list" class="cart-tbody">
				<form id="cartListForm" action="${base}/member/ordercheck" method="POST">
					<input type="hidden" name="o" id="o" value=""/>
				<#assign osntotal = 0>
		    	<#--<#assign total = 0>
		    	<#assign totalPrice = 0>-->
				<#--<#list cartItemList as cartItem>-->
				<#-- 遍历商家 TianYu 2015-8-19  -->
				<#list cartItemList  as map>
						<#-- 添加商家名称 TianYu 2015-8-19  -->
					<div  class="sj-name" id="shop_div_${map.shopId}">
                        <input class="checkbox shopcheck" id="shopcheck_${map.shopId}" type="checkbox" onclick="shopAllCheck('${map.shopId}');">
						<label for="shopcheck"><a href="${base}/shop/${map.shopUrl}.html">${map.shopName}</a></label><br>
					</div>
					<#-- 遍历商品 TianYu 2015-8-19  -->
					<#list map.items as cartItem>
					<#assign osntotal = osntotal+1>
					<#--<#assign total = total+cartItem.quantity>
					<#assign price = (cartItem.price?number)*cartItem.quantity>
					<#assign totalPrice = totalPrice+price>-->
                        <input type="hidden" id="cart_${cartItem.id}" value="">
                        <input type="hidden" id="cartItemGoodsName_${cartItem.id}" value="${cartItem.shortName}">
					<div id="product_${cartItem.id}" data-bind="rowid:1" class="item item_selected ">
						<div class="item_form clearfix">
							<div class="cell p-checkbox"><input id="checkbox_${cartItem.id}" class="checkbox" type="checkbox" value="${cartItem.id}" onclick="countGoods('${cartItem.merchantId}');return true;" <#if cartItem.stock<=0> disabled="true" <#else> name="cartId" shopid="${cartItem.merchantId}" </#if>></div>
							<div class="cell p-goods">
							    <div class="p-img"><a href="${base}/item/${cartItem.goodsId}.html" target="_blank"><img src="${cartItem.pic}" alt="${cartItem.name}" height="50" width="50" ></a></div>
							    <div class="p-name"><a href="${base}/item/${cartItem.goodsId}.html" target="_blank">${cartItem.name}<br>${cartItem.shortName}</a></div>
                                <div class="cell p-sp" id="sp_${cartItem.id}" style="float: left;">${cartItem.specification}</div>
							</div>

							<div class="cell p-price"><span class="price" >¥<span id="price_${cartItem.id}">${cartItem.price}</span></span></div>
                            <div class="cell p-price">
								<#assign  flag = true>
								<#if cartItemListMj?? && cartItemListMj?size &gt; 0>
									<#list cartItemListMj as map>
										<#if cartItem.goodsId==map.goodsId>
                                            <span title="<#if map.activityFullCutPrice?? && map.activityFullCutPrice?size &gt; 0><#list map.activityFullCutPrice as price><#if price_index!=0>&#10;</#if>满${price.totalPrice}元减${price.decreaseAmount}元</#list></#if>" style="display: none1;font-size: 10px;background: #ff4401;color:#fff;width: auto;cursor: pointer;">&nbsp;${map.activityFullCut.mjName}&nbsp;</span>
											<#assign  flag = false>
											<#break >
										</#if>
									</#list>
								</#if>
								<#if flag==true>
                                    &nbsp;
								</#if>
							<#--${map.activityFullCut.mjName}-->
							<#--<div onclick="$('#less_btn').show();$('#more_btn').hide();$('#brand_more').show();" id="more_btn" class="list-more">-->
							<#--<a href="javascript:void(0)">更多</a><i></i>-->
							<#--</div>-->
							<#--<#if cartItemListMj??>-->
							<#--11111-->
							<#--<#else>-->
							<#--&nbsp;-->
							<#--</#if>-->
                            </div>
							<div class="cell p-inventory stock"><#if cartItem.stock<=0>无货<#else>有货</#if></div>
							<div class="cell p-quantity" for-stock="for-stock">
							    <div class="quantity-form" data-bind="">
							        <a onclick="javascript:reduce('${cartItem.id}','${cartItem.price}');" href="javascript:void(0);" class="decrement">-</a>
							        <input type="text" onblur="change('${cartItem.id}','${cartItem.price}')" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" class="quantity-text" value="${cartItem.quantity}" id="${cartItem.id}" onchange="change('${cartItem.id}','${cartItem.price}')";>
							        <a onclick="javascript:add('${cartItem.id}','${cartItem.price}');" href="javascript:void(0);" class="increment">+</a>
							    </div>
							</div>
							<div class="cell p-remove"><a id="remove-${cartItem.id}" data-name="${cartItem.name}" class="cart-remove" onclick="javascript:del('${cartItem.id}','${cartItem.price}','${cartItem.merchantId}');" href="javascript:void(0);">删除</a>
							</div>
						</div>
						<div class="item_extra">
			    		</div>
					</div><!-- product_${cartItem.id}-list end -->
				</#list>
				</#list>
                </form>
			</div><!-- product-list end -->
			
			<div class="cart-toolbar clearfix">
			    <div class="control fl">
                    <input type="hidden" name="allosn" id="allosn" value="${osntotal}"/>
			        <span class="delete"><b></b><a onclick="javascript:deleteChecked();" href="#" id="remove-batch">删除选中的商品</a></span><span id="showinfo" style="color: red;"></span>
			    </div>
			    <div class="total fr">
			        <p><span id="totalSkuPrice">¥<span id ="totalPrice1"><#--${totalPrice}-->0.00</span></span>总计：</p>
			        <p><span id="totalRePrice">- ¥0.00</span>折扣：</p>
			    </div>
		    	<div class="amout fr"><span id="selectedCount"><#--${total}-->0</span> 件商品</div>
		    </div><!-- cart-toolbar end --> 
		    <div class="cart-total clearfix">
		        <div class="total fr"><span id="finalPrice" data-bind="360.80">¥<span id ="totalPrice2"><#--${totalPrice}-->0.00</span></span>总计（不含运费）：</div>
		    </div><!-- cart-total end --> 
		</div><!-- cart-inner end --> 
		
		<div class="cart-button clearfix">
		    <a class="btn continue" href="${(backurl)!"${base}/index"}" id="continue"><span class="btn-text">继续购物</span></a>
		    <a class="checkout" id="toSettlement">去结算</a>
		    <a class="checkout-disabled" id="toSettlement-disabled"  >去结算</a>
		    <a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin"></a>
		</div><!--cart-button end-->
		
	</div><!--show end-->
	<div class="clr"></div>
</div>

<#include "mall/jp/service.ftl"/>
<#include "mall/jp/footer.ftl"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<!-- 弹出层窗口 layer插件 -->
<script src="${base}/static/mall/js/layer.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
    countGoods('');
	var $allcheck = $("#allcheck");// 全选复选框
	var $cartIds = $("#product-list input[name='cartId']");// ID复选框
	// 全选
	$allcheck.click( function() {
		var $this = $(this);
		$cartIds.prop("checked", $this.prop("checked"));
		$(".shopcheck").prop("checked", $this.prop("checked"));

		countGoods('');
	});


	<#if cartItemList?exists && cartItemList?size gt 0>
		$("#cartempty").hide();
		$("#show").show();
	<#else>
		$("#cartempty").show();
		$("#show").hide();
	</#if>
		
	$("#cartLogin").hide();
	$("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});
	
	$("#toSettlement").on('click', goToOrder);
	validGoodsNums();//验证商品初始化起购, 限购数量
});
    /**
     * 20160805 dzz
     * 验证商品初始化起购, 限购数量
     */
    function validGoodsNums() {
        var cartItems = $("input[name='cartId']"); //无差别处理
        var oid = '';
        var i = 0;
        $(cartItems).each(function(){
            if(i > 0){
                oid += ',';
            }
            oid += $(this).val();
            i++;
        });
        $("#o").val(oid);

        $.ajax({
            type: 'post',
            async: false,
            url: '${base}/cart/validGoodsNums',
            data: {"o":oid},
            success: function(data) {
                if( data.status == 'success' ){
                    $(data.resultList).each(function(i, n) {
                        //购物车Id_商品Id_商品起购_商品限购_商品价格_商品库存_已购商品数量
                        var info = n.cartItemId +"_"+ n.goodsId +"_"+ n.startNum +"_"+ n.limitNum + "_" + n.goodsPrice + "_" + n.stock + "_" + n.resultNum;
                        $("#cart_"+ n.cartItemId).val(info);
                    });
                }
            }
        });
    }

    /**
     * 20160808 dzz
     * 验证用户购物车选择商品数量合法正确性(合法取值范围)
     * cartItemId:      购物车明细Id
     * dealNum:         购买商品数量
     * type:            加减类型
     */
    function validDealNums(cartItemId, dealNum, type) {
        //购物车Id_商品Id_商品起购_商品限购_商品价格_商品库存
        var infos = ($("#cart_"+ cartItemId).val()).split("_");
        $.ajax({
            type: 'post',
            async: false,
            url: '${base}/cart/validGoodsNums',
            data: {"o":cartItemId},
            success: function(data) {
                if( data.status == 'success' ){
                    $(data.resultList).each(function(i, n) {
                        //购物车Id_商品Id_商品起购_商品限购_商品价格_商品库存_已购商品数量
                        var info = n.cartItemId +"_"+ n.goodsId +"_"+ n.startNum +"_"+ n.limitNum + "_" + n.goodsPrice + "_" + n.stock + "_" + n.resultNum;
                        $("#cart_"+ n.cartItemId).val(info);

                        if(cartItemId==n.cartItemId) {
                            var infoSplit = info.split("_");
                            infos = infoSplit;
                        }

                    });
                }
            }
        });

        var itemId = infos[0];                  //购物车明细Id
        var goodsId = parseInt(infos[1]);       //商品Id
        var startNum = parseInt(infos[2]);      //起购数量
        var limitNum = parseInt(infos[3]);      //限购数量
        var goodsPrice = infos[4];              //商品价格
        var stock = parseInt(infos[5]);         //商品库存
        var quantity = parseInt(infos[6]);      //已购商品数量(-1: 非促销活动, (0:未下单, !0:已下单))

        var cartItemGoodsName = $("#cartItemGoodsName_"+cartItemId).val();

        var dealNumInt = parseInt(dealNum); //购买商品数量转整
        var exeFlag = true;
        if(type=="reduce") {
            dealNumInt = dealNumInt - 1;
        } else if(type=="add") {
            dealNumInt = dealNumInt + 1;
        }

        if(stock<startNum) {
            var msg = "商品[" + cartItemGoodsName +"] 库存不足";
            layer.alert(msg, {icon:5});
            $("#"+cartItemId).val(1);
            $("#checkbox_"+cartItemId).attr("checked", false);
            $("#checkbox_"+cartItemId).removeAttrs("checked");
            exeFlag = false;
            return exeFlag;
        }

        if((dealNumInt>stock) && (dealNumInt>startNum)) {
            var msg = "";
            msg = "商品[" + cartItemGoodsName +"]库存不足, 还有[" +stock+ "]件存货";
            layer.alert(msg, {icon:5});
            $("#"+cartItemId).val(stock);
            exeFlag = false;
            return exeFlag;
        }

        if(quantity!=-1) {//限制模式(0:非限制模式, !0:限制模式)
            if(dealNumInt<startNum) {
                var msg = "您最少需购买"+ parseInt(startNum) +"件商品[" + cartItemGoodsName +"]";
                layer.alert(msg, {icon:5});
                $("#"+cartItemId).val(startNum);
                exeFlag = false;
                return exeFlag;
            }
        }

        if(quantity!=-1) {//限制模式(-1:非限制模式, !-1:限制模式)
            var beBuy = dealNumInt + quantity;
            if(parseInt(beBuy)>limitNum) {
                if((limitNum-quantity)<=0) {
                    var msg = "商品[" + cartItemGoodsName +"] 的购买总数量不能大于 "+limitNum;
                    $("#"+cartItemId).val(startNum);
                    if(type=="goToOrder") {
                        layer.alert(msg, {icon:5});
                        $("#checkbox_"+cartItemId).attr("checked", false);
                        $("#checkbox_"+cartItemId).removeAttrs("checked");
                    } else {
                        layer.alert(msg, {icon:5});
                    }
                    exeFlag = false;
                    return exeFlag;
                } else {
                    var msg = "商品[" + cartItemGoodsName +"] 最多可以购买"+ (limitNum-quantity) +"件";
                    layer.alert(msg, {icon:5});
                    $("#"+cartItemId).val(parseInt(limitNum-quantity));
                    exeFlag = false;
                    return exeFlag;
                }
            }
        }

        if(exeFlag) {
            $("#"+cartItemId).val(dealNumInt);
            updateCartItem(cartItemId);
            return exeFlag;
        }
    }

    function updateCartItem(cartItemId) {
        var cartItemQuantity = $("#"+cartItemId).val();
        $.ajax({
            type: "get",
            url: "${base}/cart/ajaxUpdateCartId",
            data: "id="+cartItemId+"&quantity="+cartItemQuantity+"&r="+ new Date(),
            success: function(data) {
                if(data.status=='success'){
                    var infos = ($("#cart_"+ cartItemId).val()).split("_");
                    var quantity = parseInt(infos[6]);      //已购商品数量(-1: 非促销活动, (0:未下单, !0:已下单))
                    if(quantity==(-1)) {
                        $("#"+cartItemId).val(cartItemQuantity);
                    }
                    $("#sp_"+cartItemId).html(data.sp);
                    countGoods();
                }
            },
            complete : function(XMLHttpRequest,status){
                clickAllow = "true";
            }
        });
    }



    //满减活动
    function showMjhdView(id){
        $("#mask").show();
        $("#mjViewContent").html($("#"+id).html());$("#mjView").slideDown();
    }


    /** 添加商家复选框 TianYu  2015年8月19日 Start */
    function shopAllCheck(shopId){
        $("#product-list input[shopid='"+shopId+"']").prop("checked", $("#shopcheck_"+shopId).prop("checked"));

        countGoods('');
        allChecked();
    }
    /** 添加商家复选框 TianYu  2015年8月19日 End */

    /** 1、计算商品总数及总价格 2、判断店铺是否全选 TianYu 2015-9-7  Start */
    function countGoods(shopId){
        if(shopId!=''){
            shopChecked( shopId );
        }

        var $cartIds = $("#product-list input[name='cartId']:checked");// ID复选框
        var total = 0;
        var totalPrice = 0.00;
        $cartIds.each(function(){
            var cartidtemId = $(this).val();
            var price = parseFloat($("#price_"+cartidtemId).text());
            var num = parseInt($("#"+cartidtemId).val());
            total = total + num;
            totalPrice = totalPrice + price*num;
        });
        $("#totalPrice1").text(totalPrice.toFixed(2));
        $("#totalPrice2").text(totalPrice.toFixed(2));
        $("#selectedCount").text(total);

        if( total == 0 ){
            $("#toSettlement").hide();
            $("#toSettlement-disabled").show();
        }else{
            $("#toSettlement-disabled").hide();
            $("#toSettlement").show();
        }
    }

    function shopChecked(shopId){
        var flag = true;
        $("#product-list input[shopid='"+shopId+"']").each(function(){
            if( !$(this).prop("checked") ){
                flag = false;
                return false;
            }
        });

        if(flag){
            $("#shopcheck_"+shopId).prop("checked", true);
        }else{
            $("#shopcheck_"+shopId).prop("checked", false);
        }
        allChecked();
    }

    /**
     * Desc:判断当所有商品选择时，全选CheckBox勾选
     * Auth:zhangqiang
     * Time:2015-11-10 18:06:32
     *  */
    function allChecked(){
        var flag = true;
        $("#product-list input[name='cartId']").each(function(){
            if(!$(this).prop("checked")) {
                flag = false;
                return false;
            }

        });

        if(flag){
            $("#allcheck").prop("checked", true);
        }else{
            $("#allcheck").prop("checked", false);
        }
        clickAllow = "true";
    }
    /** 1、计算商品总数及总价格 2、判断店铺是否全选 TianYu 2015-9-7  End */
    var clickAllow = "true";
    function deleteChecked(){
//        clickAllow = "false";
        var ids = '';
        var cartIds = $("#product-list input[name='cartId']:checked");// ID复选框
        /** 当checkbox有选择时才可以提交删除 Auth:zhangqiang Time:2015-09-21 18:20:35  Start */
        if(cartIds.length > 0){
            clickAllow = "true";
            layer.confirm('确认要删除这些商品吗?', {icon: 3, title:'温馨提示'}, function(index){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxDeleteCartIds",
                    data: cartIds.serialize(),
                    success: function(data) {
                        if(data.status=='success'){
                            //刷新本页面
                            location.replace("${base}/cart/list?backurl=${backurl}");
                        }else{
                            clickAllow = "true";
                        }
                    }
                });
                layer.close(index);
            });
        }else{
            $("#showinfo").html("未选择任何商品!");
            return;
        }
        /** 当checkbox有选择时才可以提交删除 Auth:zhangqiang Time:2015-09-21 18:20:35  End */
        countGoods();
    }

    function reduce(cartItemid,cartItemPrice) {
        if(clickAllow=="true"){
            var buyNum = $('#'+cartItemid);
//	    var buyCount = $('#selectedCount');
//	    var buyPrice1 = $('#totalPrice1');
//	    var buyPrice2 = $('#totalPrice2');
            var resultFlag = validDealNums(cartItemid, parseInt(buyNum.val()), "reduce");
            if(resultFlag==false) {
                return;
            }

            if(parseInt(buyNum.val()) > 1) {
//                clickAllow = "false";
                var total = parseInt(buyNum.val()) - 1;
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxUpdateCartId",
                    data: "id="+cartItemid+"&quantity="+total,
                    success: function(data) {
                        if(data.status=='success'){
                            var infos = ($("#cart_"+ cartItemid).val()).split("_");
                            var quantity = parseInt(infos[6]);      //已购商品数量(-1: 非促销活动, (0:未下单, !0:已下单))
                            if(quantity==(-1)) {
//                                buyNum.val(total);
                            }
                            $("#sp_"+cartItemid).html(data.sp);
//		        		buyCount.html(parseInt(buyCount.html()) - 1);
//		        		buyPrice1.html((Number(buyPrice1.html()) - Number(cartItemPrice)).toFixed(2));
//		        		buyPrice2.html((Number(buyPrice2.html()) - Number(cartItemPrice)).toFixed(2));
                            countGoods();
                        }
                    },
                    complete : function(XMLHttpRequest,status){
                        clickAllow = "true";
                    }
                });
            }
        }

    }

    function change(cartItemid,cartItemPrice){
        clickAllow = "true";
        var buyNum = $('#'+cartItemid);
//    var buyCount = $('#selectedCount');

        if($.trim(buyNum.val()) == ''){
            buyNum.val(1);
        }

        var resultFlag = validDealNums(cartItemid, parseInt(buyNum.val()), "change");

        if(resultFlag==false) {
            return;
        }

        var total = parseInt(buyNum.val());
        $.ajax({
            type: "get",
            url: "${base}/cart/ajaxUpdateCartId",
            data: "id="+cartItemid+"&quantity="+total+"&r="+ new Date(),
            success: function(data) {
                if(data.status=='success'){
                    //去掉刷新页面 刷新页面会导致选择的商品 不选中  Start
                    //刷新本页面
                    //location.replace("${base}/cart/list?backurl=${backurl}");
                    var infos = ($("#cart_"+ cartItemid).val()).split("_");
                    var quantity = parseInt(infos[6]);      //已购商品数量(-1: 非促销活动, (0:未下单, !0:已下单))
                    if(quantity==(-1)) {
//                        buyNum.val(total);
                    }
                    $("#sp_"+cartItemid).html(data.sp);
                    //去掉刷新页面 刷新页面会导致选择的商品 不选中  End
                }else{
//	        	clickAllow = "true";
                }
            }
        });

        countGoods();
    }

    function add(cartItemid,cartItemPrice) {
        if(clickAllow=="true"){
//            clickAllow = "false";
            var buyNum = $('#'+cartItemid);
//	    var buyCount = $('#selectedCount');
//	    var buyPrice1 = $('#totalPrice1');
//	    var buyPrice2 = $('#totalPrice2');

            var resultFlag = validDealNums(cartItemid, parseInt(buyNum.val()), "add");
            if(resultFlag==false) {
                return;
            }

            var total = parseInt(buyNum.val()) + 1;
            $.ajax({
                type: "get",
                url: "${base}/cart/ajaxUpdateCartId",
                data: "id="+cartItemid+"&quantity="+total+"&r="+ new Date(),
                success: function(data) {
                    if(data.status=='success'){
                        var infos = ($("#cart_"+ cartItemid).val()).split("_");
                        var quantity = parseInt(infos[6]);      //已购商品数量(-1: 非促销活动, (0:未下单, !0:已下单))
                        if(quantity==(-1)) {
//                            buyNum.val(total);
                        }
                        $("#sp_"+cartItemid).html(data.sp);
                        countGoods();
//	        		buyCount.html(parseInt(buyCount.html()) + 1);
//	        		buyPrice1.html((Number(buyPrice1.html()) + Number(cartItemPrice)).toFixed(2));
//		        	buyPrice2.html((Number(buyPrice2.html()) + Number(cartItemPrice)).toFixed(2));
                    }
                },
                complete : function(XMLHttpRequest,status){
                    clickAllow = "true";
                }
            });
        }
    }

    function del(cartItemid,cartItemPrice, shopId) {
        layer.confirm('确认要删除该商品吗?', {icon: 3, title:'温馨提示'}, function(index){
            var c_id = "product_"+cartItemid;
            var cartIds = $("#"+c_id+" input:checked");

//            clickAllow = "false";
            var buyNum = $('#'+cartItemid);
            var buyCount = $('#selectedCount');
            var buyPrice1 = $('#totalPrice1');
            var buyPrice2 = $('#totalPrice2');
            var total = parseInt(buyCount.html())-parseInt(buyNum.val());
            var osnTotal = parseInt($("#allosn").val());
            $.ajax({
                type: "get",
                url: "${base}/cart/ajaxDeleteCartId",
                data: "id="+cartItemid,
                success: function(data) {
                    if(data.status=='success'){
                        /**Desc:判断当删除的商品Checkbox未选择时，不进行总价计算
                         * Auth:zhangqiang
                         * Time:2015-12-01 16:24:25
                         * */
                        if(cartIds.length > 0){
                            //刷新本页面
                            buyCount.html(total);
                            buyPrice1.html((Number(buyPrice1.html()) - Number(cartItemPrice)*parseInt(buyNum.val())).toFixed(2));
                            buyPrice2.html((Number(buyPrice2.html()) - Number(cartItemPrice)*parseInt(buyNum.val())).toFixed(2));
                        }
                        //-------------------------------------------------------end
                        $("#product_"+cartItemid).remove();
                        $("#allosn").val(--osnTotal);

//				if(parseInt($('#selectedCount').html())==0){
                        if(osnTotal==0){
                            $("#show").hide();
                            $("#cartempty").show();
                        }else{
                            //删除商户
                            var i = 0;
                            $("#product-list input[shopid='"+shopId+"']").each(function(){
                                if(cartItemid != $(this).val()){
                                    i++;
                                }
                            });
                            if(i == 0){
                                $("#shop_div_"+shopId).remove();
                            }
                        }
                        clickAllow = "true";
                    }else{
                        clickAllow = "true";
                    }
                }
            });
            layer.close(index);
        });
    }

    /**
     * 判断是否登录
     * @returns {Boolean}
     */
    function isLogin(){
        var isLogin = $("#isLogin").val();
        if(isLogin == 1){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 设置登录标记
     * @param flag
     */
    function setLogin(flag){
        var isLogin = flag ? "1" : "0";
        $("#isLogin").val(isLogin);
    }

    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
    }

    /**
     * 跳转到订单页如未登录弹出登录弹窗
     */
    function goToOrder(){

        //var orderInfoUrl = "${base}/member/ordercheck";
//	var selected = $(".item_selected");
//	alert(selected);
        //判断是否存在选中的商品，如果无，不进入结算页面
        var selected = $("input[name='cartId']:checked");

        if(selected != 'undefined' && selected != null && selected.length != 0){
            try {
                var resultFlag = true;

                var oid = '';
                var i = 0;
                $(selected).each(function(){
                    if(i > 0){
                        oid += ',';
                    }

                    resultFlag = validDealNums($(this).val(), $("#"+$(this).val()).val(), "goToOrder");

                    if(e/batik/ext/awt/image/codec/util/ImageDecodeParam.classPK
    `N#8�*4/A  �  <           ���. org/apache/batik/ext/awt/image/codec/util/ImageDecoder.classPK
    `N#8X��  �  @           ��.0 org/apache/batik/ext/awt/image/codec/util/ImageDecoderImpl.classPK
    `N#8�t�#�     @           ���3 org/apache/batik/ext/awt/image/codec/util/ImageEncodeParam.classPK
    `N#81�֫     <           ���4 org/apache/batik/ext/awt/image/codec/util/ImageEncoder.classPK
    `N#8H��s�    @           ��6 org/apache/batik/ext/awt/image/codec/util/ImageEncoderImpl.classPK
    aN#8g?�4  �
  I           ���8 org/apache/batik/ext/awt/image/codec/util/MemoryCacheSeekableStream.classPK
    aN#8O8WE  �  <           ���? org/apache/batik/ext/awt/image/codec/util/PropertyUtil.classPK
    aN#8#�C�    D           ��7C org/apache/batik/ext/awt/image/codec/util/SeekableOutputStream.classPK
    `N#8%�ԦN
  �  >           ���F org/apache/batik/ext/awt/image/codec/util/SeekableStream.classPK
    `N#8��h@�  �  C           ��2Q org/apache/batik/ext/awt/image/codec/util/SimpleRenderedImage.classPK
    aN#8SR���  �  G           ��*] org/apache/batik/ext/awt/image/codec/util/SingleTileRenderedImage.classPK
     o\{7                      �Ap` META-INF/services/PK
    �u:7ҟZ8  F  @           ���` META-INF/services/org.apache.batik.ext.awt.image.spi.ImageWriterPK
    ��66Az�?  �  B           ��6c META-INF/services/org.apache.batik.ext.awt.image.spi.RegistryEntryPK
    mcp5           /           ���e org/apache/batik/ext/awt/image/codec/propertiesPK    P P Q   $f                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    