<#escape x as x?html>
	<#include "bec/ghj/header.ftl"/>
<div id="container">
	<#include "bec/ghj/top.ftl"/>
<div class="content m header clearfix">
	<div id="logo">
		<a href="${base}"><img src="${base}/static/mall/gwq/img/logo_index.png" title="返回商城首页" alt="返回商城首页"></a>
	</div><!--logo end-->
	<div class="clr"></div>
</div>
<div class="content">
	<div class="m orderbody">
		<div class="mc">
			<s class="icon-succ04"></s>
			<h3 class="orderinfo">订单信息异常，获取订单${orderSn}信息失败！请联系客服人员，协助处理。</h3>
			<ul class="list-orderinfo">
				<li>订单号：${orderSn}</li>
			</ul>
			<!--<p class="mb-tip">请您在提交订单后<span class="ftx-04">24小时</span>内完成支付，否则订单会自动取消。</p>-->
		</div>
	</div><!--orderbody end-->
	<div class="clr"></div>
</div>
</div>
	<#include "bec/ghj/foot.ftl"/>
</#escape>

