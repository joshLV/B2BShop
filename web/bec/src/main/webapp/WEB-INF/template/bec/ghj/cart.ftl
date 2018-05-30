<#escape x as x?html>
	<#include "bec/ghj/header.ftl"/>
<div id="container">
	<#include "bec/ghj/top.ftl"/>
<div class="cart-content">
	<div class="left">
		<#if message=="success">
		<div class="" id="succeed">
			<div class="success">
                <div class="success-b">
                    <h3>商品已成功加入购物车！</h3>
                    <span id="flashBuy" style="display:none">商品数量有限，请您尽快下单并付款！</span>
                </div>
            	<span><a id="GotoShoppingCart" href="${base}/cart/list?backurl=${backurl}" class="btn-pay">去结算</a><a href="${backurl}" class="btn-continue">继续购物</a></span>
            </div>
		</div>
		<#else>
		<div class="" id="succeed">
			<div class="success">
                <div class="success-b">
                    <h3>${message}</h3>
                </div>
            	<span><a id="GotoShoppingCart" href="${base}/cart/list?backurl=${backurl}" class="btn-pay">去结算</a><a href="${backurl}" class="btn-continue">继续购物</a></span>
            </div>
		</div>
		</#if>
		
	</div><!--left end-->
	<div class="right">
		<!--我的购物车 暂不显示-->
	</div><!--right end-->
	<div class="clr"></div>
</div>
</div>
<#include "bec/ghj/service.ftl"/>
<#include "bec/ghj/foot.ftl"/>
</#escape>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
$(function () {
	
});
</script>
