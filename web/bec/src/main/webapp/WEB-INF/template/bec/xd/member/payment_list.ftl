<#escape x as x?html>
	<#include "bec/xd/header.ftl"/>
	<#include "bec/xd/top2.ftl"/>

<div class="content  header clearfix">

    <div class="progress clearfix">
        <ul class="progress-1">
            <li class="step-1"><b></b>1.选择支付方式</li>
            <li class="step-2">2.核对支付信息</li>
            <li class="step-3">3.支付信息结果</li>
        </ul>
    </div>
    <div class="clr"></div>
</div>


<div class="content">
	<div class="orderbody">
		<div class="mc">
			<s class="icon-succ04"></s>
			<div style="width: 1100px; float: left;">
				<h3 class="orderinfo">订单提交成功，请您尽快付款！</h3>
				<div class="pay-total">总支付金额：<strong class="ftx-01" >￥${total?number?string("##0.00")}</strong>元<br></div>
            </div>
            <ul class="list-orderinfo">
                <li>订单号：${order.orderSn}</li>
                <li class="li-last">订单金额：<strong class="ftx-01">￥${order.totalAmount?string("##0.00")}</strong> 元</li>
            </ul>
			<#-- 屏蔽为实现的多次支付   TianYu 2016-2-29 10:30:11 OLD
			<#list orders as order>
				<ul class="list-orderinfo">
					<li>订单号：${order.orderSn}</li>
					<li class="li-last">应付金额：<strong class="ftx-01">￥${order.totalAmount}</strong> 元</li>
				</ul>
			</#list>-->
			<p class="mb-tip">请您在提交订单后<span class="ftx-04">24小时</span>内完成支付，否则订单会自动取消。</p>
		</div>
	</div><!--orderbody end-->
	<div class="banking">
		<h4 class="tit-sub">
			<strong>支付方式</strong>
			<span class="ftx-03">付款时需跳转至各个支付方式对应的支付平台支付</span>
        </h4><!--tit-sub end-->
		<ul class="list-pay">
			<#list payTypeList as payType>
			<li index="${payType_index}" class="<#if payType_index==0>fisrt</#if>">
				<div class="item">
                	<input type="radio" value="${payType["sign"]}" class="radio" name="payType">
                    <label><img width="125" height="28" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
				</div>
			</li>
			</#list>
		</ul><!--list-pay end-->
		<div class="clr"></div>
		<div class="btns">
			<form id="paymentInfo" method="POST" action="${base}/payment/show">
				<input id="orderSn" name="orderSn" type="hidden" value="${orderSn}" >
                <input id="payType" name="payType" type="hidden" value="${payType["sign"]}">
				<input id="onlinePayAmount" name="onlinePayAmount" type="hidden" value="${order.totalAmount?string("##0.00")}">
			</form>
			<b id="btnNext" class="btn-next" href="javascript:void(0);" >下一步</b>
		</div><!--btns end-->
	</div><!--banking end-->
	<div class="clr"></div>
</div>
	<#include "bec/xd/service.ftl"/>
	<#include "bec/xd/foot.ftl"/>
<script type="text/javascript">
/*宽屏设置*/
//pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");

$(function(){
	$(".list-pay>li").click(function (){
		$this=$(this);
		$this.addClass("select");
		$this.siblings().removeClass("select");
		
		var index = $this.attr('index');
		var payType=$("input[name='payType']:eq("+index+")").val();
		$("#payType").val(payType);
		
		$("input[name='payType']").each(function(idx,ele){
			$(this).prop("checked",(index==idx));		
		});
		
	});
	
	$(".list-pay>li").eq(0).click();
	
	$("#btnNext").click(function (){
		$("#paymentInfo").submit();
	});
	
});
</script>
</#escape>