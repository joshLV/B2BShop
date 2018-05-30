<#escape x as x?html>
<style>
#shopMiddle{margin-top: 10px;}
.shop-left {float: left;width: 210px;margin-right: 10px;}
.shop-right {float: right;width: 980px;}
.widepage .shop-right {width: 990px;}
</style>
<div id="shopMiddle" class="content">
	<div class="shop-left">
		<#include "bec/gdnz/shop/default/left.ftl"/>
	</div><!--left end-->
	<div class="shop-right">
		<#include "bec/gdnz/shop/default/right_result.ftl"/>
	</div><!--right end-->
	<div class="clr"></div>
</div>
</#escape>