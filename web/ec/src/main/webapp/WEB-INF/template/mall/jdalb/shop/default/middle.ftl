<#escape x as x?html>
<style>
#shopMiddle{margin-top: 10px;}
.left {float: left;width: 210px;margin-right: 10px;}
.right {float: right;width: 770px;}
.widepage .right {width: 990px;}
</style>
<div id="shopMiddle" class="content">
	<div class="left">
		<#include "mall/jd/shop/default/left.ftl"/>
	</div><!--left end-->
	<div class="right">
		<#include "mall/jd/shop/default/right.ftl"/>
	</div><!--right end-->
	<div class="clr"></div>
</div>
</#escape>