<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>我的购物车</title>
<link href="${base}/static/mall/jd/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
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
<#include "mall/jd/shortcut.ftl"/>
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
.cart .cart-hd {height: 35px;}
.cart-hd {position: relative;}
.cart .cart-hd h2 {width: 100px;float: left; border-bottom: 2px solid #e4393c;}
.cart h2 {height: 20px;padding-bottom: 15px;line-height: 100px;overflow: hidden;background: url(${base}/static/mall/img/cart_title.png) no-repeat left top;}
.cart .cart-hd span, .cart .cart-hd a {float: left;}
.cart .cart-hd .fore {padding-left: 40px;line-height: 21px;}
.cart .cart-hd .btn-text {line-height: 21px;}

.cart-inner {border: 1px solid #ddd;border-top:2px solid #999;}
.cart-inner .cart-thead {height: 35px;background-color: #f7f7f7; width:1210px; text-align: left; }
.cart-inner .cart-tbody {border-bottom: 1px solid #ddd;}
.cart-empty {height: 98px;border: 1px solid #ddd;}
.cart-empty .message {height: 98px;padding-left: 341px;background: #f3f3f3 url(${base}/static/mall/img/cart-empty-bg.png) no-repeat 250px 22px;}
.cart-empty .message p {line-height: 98px;}
.cart-empty .message ul {padding-top: 23px;}
.cart-empty .message li {line-height: 26px;}
.cart-empty a,.cart-empty a:visited,.cart-empty a:hover {color: #005ea7;}

.cart-thead .column {width: 99px;height: 35px;border-right: 1px solid #f7f7f7;float: left;color: #666;line-height: 35px;text-align: center;}
.cart-thead .t-checkbox {line-height: normal;text-align: left;}
.cart-thead .t-checkbox input {margin: 11px 5px 0 19px;margin: 11px 5px 0 16px\9;*margin: 6px 2px 0 16px;display: inline;}
.cart-thead .t-checkbox label {line-height: 35px;}
.cart-thead .t-goods {width: 519px;}
.cart-thead .t-price {width: 128px;text-align: right;}
.cart-thead .t-promotion {width: 149px;}
.cart-thead .t-action {border-right: 0;}

input {margin: 0;padding: 0;}

.cart-tbody .item {border-top: 1px solid #ddd;padding: 10px 0;}
.cart-tbody .item,.cart-tbody .item-meet,.cart-tbody .suit {clear: left;}
.cart-tbody .item-first {border-top: 0;}
.cart-tbody .item_form {height: 52px;}
.cart-tbody .item_extra {padding: 5px 0 0 50px;clear: both;}

.item .p-gift .g-name {width: 739px;float: left;}
.item .p-gift .g-count {width: 100px;float: left;text-align: center;}
.cart-tbody .item_extra .g-number {width: 34px;height: 18px;margin: 0 auto;border: 1px solid #EDEDED;border-top-color: #ccc;border-left-color: #ccc;padding-top: 2px;overflow: hidden;text-align: center;line-height: 18px;display: block;background-color: #F7F7F8;color: #666;}
.cart-tbody .cell {float: left;min-height: 52px;height: auto!important;}
.cart-tbody .p-checkbox {width: 50px;height: 52px;}
.cart-tbody .p-checkbox input {margin: 20px 0 0 19px;margin: 17px 0 0 16px\9;*margin: 16px 0 0 16px;float: left;display: inline;}
.cart-tbody .p-goods {width: 369px;overflow:hidden;}
.cart-tbody .p-img {width: 50px;height: 50px;margin-right: 10px;border: 1px solid #ddd;padding: 0;float: left;background-color: #fff;}
.cart-tbody .p-img img {display: block;}
.cart-tbody .p-name {padding-right: 10px;line-height: 18px;}
.cart-tbody .p-name span {display: block;color: #999;line-height: 18px;}
.cart-tbody .p-sp {width: 200px;overflow:hidden;ext-align: left;}
.cart-tbody .p-price {width: 130px;text-align: right;line-height: 52px;}
.cart-tbody .price {/*padding-right: 10px; 20130701 shijianguo*/color: #333;font-family: Verdana,Arial;}
.cart-tbody .p-promotion {width: 150px;}
.cart-tbody .p-promotion span {height: 20px;margin: 16px 0 0 5px;border-radius: 3px;-moz-border-radius: 3px;-webkit-border-radius: 3px;display: block;overflow: hidden;color: #fff;line-height: 20px;text-align: center;}
.cart-tbody .p-promotion-special span {margin-top: 4px;}
.cart-tbody .p-promotion em {font-family: Verdana,Arial;}
.cart-tbody .p-promotion .return-now {background-color: #3b0;}
.cart-tbody .p-promotion .give-points {background-color: #f90;}
.cart-tbody .p-remove {width: 99px;color: #005ea7;}
.cart-tbody .p-name a,.cart-tbody .p-name a:visited,.cart-tbody .p-name a:hover,.cart-tbody .p-remove a,.cart-tbody .p-remove a:visited,.cart-tbody .p-remove a:hover {color: #005ea7;}
.cart-tbody .p-name a.edit,.cart-tbody .p-name a.edit:visited {text-decoration: underline;}
.cart-tbody .p-name a.edit:hover {text-decoration: none;}
.cart-tbody .p-inventory {color: #999;}
.cart-tbody .p-inventory,.cart-tbody .p-quantity {width: 100px;text-align: center;}
.cart-tbody .p-inventory,.cart-tbody .p-remove {line-height: 52px;text-align: center;}
.cart-tbody .p-quantity {line-height: 52px;}
.cart-tbody .p-quantity .quantity-form {width: 76px;height: 22px;margin: 0 auto;padding-top: 16px;overflow: hidden;text-align: left;}
.cart-tbody .p-quantity a {width: 13px;height: 13px;margin-top: 3px;float: left;display: block;overflow: hidden;line-height: 13px;background:#fff;border:1px solid #ccc;text-align:center;}
.cart-tbody .p-quantity a:hover{text-decoration:none;color:#333;border:1px solid #999;}
.p-quantity .quantity-form input {float: left;border:1px solid #ccc;}
.cart-tbody .p-quantity a.decrement {margin-right: 5px;}
.cart-tbody .p-quantity a.increment {float: right;}
.cart-tbody .p-quantity a.disabled {background-position: 0 -26px;}
.cart-tbody .quantity-text {width: 34px;height: 18px;border: 1px solid #ddd;border-top-color: #aaa;border-left-color: #aaa;padding-top: 2px;overflow: hidden;text-align: center;background-color: #fff;}
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
.cart-tbody .item_selected {background-color: #fffdee!important;}
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
.cart-tbody .p-checkbox {width: 50px;height: 52px;}
.cart-tbody .cell {float: left;min-height: 52px;height: auto!important;}
.cart-toolbar,.cart-total {clear: both;}
.cart-toolbar {padding: 5px 10px;line-height: 22px;}
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
.cart-button a.checkout {width: 135px;height: 36px;float: right;display: block;overflow: hidden;line-height: 100px;background: url(${base}/static/mall/img/btn-check-01.jpg) no-repeat #E43F45;font-family: "\5FAE\8F6F\96C5\9ED1";font-size: 18px;font-weight: bold;line-height: 32px;_line-height: 36px;text-indent: 33px;color:#fff;position: relative;}
.cart-button a.checkout:hover{background-position:0 -36px;box-shadow:0 1px 1px rgba(0,1,1,0.3);background-color:#ED4749;text-decoration: none;}
.cart-button a.checkout b{position: absolute;left: 0;top: 0;width: 100%;height: 100%;background: url(${base}/static/mall/img/btn-check.jpg) no-repeat;}
.cart-button a.checkout:hover b{background-position:0 -36px;}
.cart-button a.checkout-disabled {width: 135px;height: 36px;float: right;display: block;overflow: hidden;line-height: 100px;background: url(${base}/static/mall/img/btn-check-01.jpg) no-repeat #E43F45;font-family: "\5FAE\8F6F\96C5\9ED1";font-size: 18px;font-weight: bold;line-height: 32px;_line-height: 36px;text-indent: 33px;color:#fff;position: relative;}
.cart-button a.checkout-disabled:hover{background-position:0 -36px;box-shadow:0 1px 1px rgba(0,1,1,0.3);background-color:#ED4749;text-decoration: none;}
.cart-button a.checkout-disabled b{position: absolute;left: 0;top: 0;width: 100%;height: 100%;background: url(${base}/static/mall/img/btn-check-disabled.jpg) no-repeat;}
.cart-button a.checkout-disabled:hover b{background-position:0 -36px;}
.cart-button .checkout-state {width: 356px;height: 28px;border: 1px solid #edd28b;float: right;display: block;overflow: hidden;color: #f60;line-height: 28px;text-align: center;background-color: #fffdee;}
.cart-button .checkout-state b {width: 30px;height: 30px;margin: 2px 0 0 10px;float: left;display: inline;background: url(${base}/static/mall/img/loading.gif) no-repeat center center;}
	/* 商家名称 */
	.sj-name{height: 40px; line-height: 40px; margin: 0 auto; padding-left: 18px; font-size: 14px; font-weight: bold; border-top: 1px solid #dddddd;}

</style>
<div class="content m header clearfix">
	<div id="logo">
		<a href="${base}/index"><img src="${base}/static/mall/jd/img/logo_index.png" title="返回商城首页" alt="返回商城首页"></a>
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
		<h2>我的购物车</h2>
		<span class="fore"></span>
	</div><!--cart-hd end-->
	<div class="cart-empty" id="cartempty" style="display:none;">
			<div class="message">
                <ul>
	                <li>购物车内暂时没有商品 <a href="${base}/index">去首页</a>挑选喜欢的商品</li>
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
				<#list cartItemList as map>
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
					<div id="product_${cartItem.id}" data-bind="rowid:1" class="item item_selected ">
						<div class="item_form clearfix">
							<div class="cell p-checkbox"><input class="checkbox" type="checkbox" value="${cartItem.id}" onclick="countGoods('${cartItem.merchantId}');return true;" <#if cartItem.stock<=0> disabled="true" <#else> name="cartId" shopid="${cartItem.merchantId}" </#if>></div>
							<div class="cell p-goods">
							    <div class="p-img"><a href="${base}/item/${cartItem.goodsId}.html" target="_blank"><img src="${cartItem.pic}" alt="${cartItem.name}" height="50" width="50" ></a></div>    
							    <div class="p-name"><a href="${base}/item/${cartItem.goodsId}.html" target="_blank">${cartItem.name}</a></div>
							</div>
                            <div class="cell p-sp" id="sp_${cartItem.id}">${cartItem.specification}</div>
							<div class="cell p-price"><span class="price" >¥<span id="price_${cartItem.id}">${cartItem.price}</span></span></div>
							<div class="cell p-promotion">
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
			        <span class="delete"><b></b><a onclick="javascript:deleteChecked();" href="#" id="remove-batch">删除选中的商品</a></span>
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
		    <a class="checkout" id="toSettlement" style="display: none;">去结算<b></b></a>
		    <a class="checkout-disabled" id="toSettlement-disabled" >去结算<b></b></a>
		    <a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin"></a>
		</div><!--cart-button end-->
		
	</div><!--show end-->
	<div class="clr"></div>
</div>

<#include "mall/jd/service.ftl"/>
<#include "mall/jd/footer.ftl"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
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
});

/** 添加商家复选框 TianYu  2015年8月19日 Start */
function shopAllCheck(shopId){
    $("#product-list input[shopid='"+shopId+"']").prop("checked", $("#shopcheck_"+shopId).prop("checked"));

	countGoods('');
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
}
/** 1、计算商品总数及总价格 2、判断店铺是否全选 TianYu 2015-9-7  End */
var clickAllow = "true";
function deleteChecked(){
	clickAllow = "false";
	var cartIds = $("#product-list input[name='cartId']:checked");// ID复选框
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

    countGoods();
}

function reduce(cartItemid,cartItemPrice) {
	if(clickAllow=="true"){
	    var buyNum = $('#'+cartItemid);
//	    var buyCount = $('#selectedCount');
//	    var buyPrice1 = $('#totalPrice1');
//	    var buyPrice2 = $('#totalPrice2');
	    if(parseInt(buyNum.val()) > 1) {
	    	clickAllow = "false";
	        var total = parseInt(buyNum.val()) - 1;
	        $.ajax({
	        	type: "get",
		        url: "${base}/cart/ajaxUpdateCartId",
		        data: "id="+cartItemid+"&quantity="+total,
		        success: function(data) {
		        	if(data.status=='success'){
		        		buyNum.val(total);
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
	clickAllow = "false";
	var buyNum = $('#'+cartItemid);
//    var buyCount = $('#selectedCount');

	if($.trim(buyNum.val()) == ''){
        buyNum.val(1);
	}

    var total = parseInt(buyNum.val());
    $.ajax({
        type: "get",
        url: "${base}/cart/ajaxUpdateCartId",
        data: "id="+cartItemid+"&quantity="+total+"&r="+ new Date(),
        success: function(data) {
        	if(data.status=='success'){
        		//刷新本页面
        		location.replace("${base}/cart/list?backurl=${backurl}");
	        }else{
	        	clickAllow = "true";
	        }
        }
    });

    countGoods();
}

function add(cartItemid,cartItemPrice) {
	if(clickAllow=="true"){
	    clickAllow = "false";
	    var buyNum = $('#'+cartItemid);
//	    var buyCount = $('#selectedCount');
//	    var buyPrice1 = $('#totalPrice1');
//	    var buyPrice2 = $('#totalPrice2');
	    var total = parseInt(buyNum.val()) + 1;
	    $.ajax({
	        type: "get",
	        url: "${base}/cart/ajaxUpdateCartId",
	        data: "id="+cartItemid+"&quantity="+total+"&r="+ new Date(),
	        success: function(data) {
	        	if(data.status=='success'){
	        		buyNum.val(total);
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
    clickAllow = "false";
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
        		//刷新本页面
        		buyCount.html(total);
        		buyPrice1.html((Number(buyPrice1.html()) - Number(cartItemPrice)*parseInt(buyNum.val())).toFixed(2));
	        	buyPrice2.html((Number(buyPrice2.html()) - Number(cartItemPrice)*parseInt(buyNum.val())).toFixed(2));
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

		   var oid = '';
		   var i = 0;
           $(selected).each(function(){
			   if(i > 0){
				   oid += ',';
			   }
               oid += $(this).val();
			   i++;
           });

		   $("#o").val(oid);

			if(!isLogin()) {
				$("#cartLogin").trigger("click");
			} else {
                //添加库存校验 TianYu 2015-8-31
				$.post("${base}/member/stockJudge",{o:oid},function(d){
					if( d.success ){
                        $('#toSettlement').hide();
                        $('#toSettlement').after("<span class='checkout-state'>正在转向订单信息填写页面，请稍候！</span>");

//				window.setTimeout('window.location.href = orderInfoUrl+"?r="+Math.random()+"&o="+oid;',3000);
//				window.location.href = orderInfoUrl+"?rd="+Math.random()+"&o="+oid;
                        $("#cartListForm").attr("action",$("#cartListForm").attr("action") + "?r="+Math.random());
                        window.setTimeout('$("#cartListForm").submit()',3000);
                        $("#cartListForm").submit();
					}else{
                        alert( d.msg );
					}
				});
			}
		} catch (e) {
//			window.setTimeout('window.location.href = orderInfoUrl+"?r="+Math.random(),1000);
//			window.location.href = orderInfoUrl+"?rd="+Math.random();
		}
	}else{
		alert('请至少选中一件商品！');
	}
}
</script>
</body>
</html>