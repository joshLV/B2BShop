<#escape x as x?html>
	<#include "bec/ghdj/header.ftl"/>
	<#include "bec/ghdj/top4.ftl"/>
<style>
	/*body{background:white;}*/

	.list-pay{height: auto; overflow: hidden;}
    .orderbody .mc{ border-bottom: 0;}
	.banking{border-bottom: 0;margin: 0px 20px;}
</style>
<div class="main f-cb">
    <h1 class="order_tit">选择订单支付方式</h1>
<div class="order_info">


	<div class="orderbody">
		<div class="mc">
			<s class="icon-succ04"></s>
			<div style="width: 1100px; float: left;">
				<h3 class="orderinfo">订单提交成功，请您尽快付款！</h3>
				<div class="pay-total">总支付金额：<strong class="ftx-01" >￥${total?number?string("##0.00")}</strong>元<br></div>
            </div>
			<#list orders as order>
				<ul class="list-orderinfo">
					<li>订单号：${order.orderSn}</li>
					<li class="li-last">应付金额：<strong class="ftx-01">￥${order.totalAmount}</strong> 元</li>
				</ul>
			</#list>
			<p class="mb-tip">请您在提交订单后<span class="ftx-04">72小时</span>内完成支付，否则订单会自动取消。</p>
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
		<div class="payment-xz">
			<table cellpadding="0" cellspacing="0">
				<tr>
					<th width="10%">卡种</th>
                    <th width="15%">充值,支付</th>
                    <th width="22%">开通网银类型</th>
                    <th width="28%">是否需要开通短信认证</th>
                    <th width="25%">限额</th>
				</tr>
				<tr>
					<td width="10%">信用卡</td>
                    <td width="15%">支付</td>
                    <td width="22%">电子银行口令卡</td>
                    <td width="28%">需开通短信认证</td>
                    <td width="25%">单笔1000元<br>单日5000元</td>
				</tr>
                <tr>
                    <td width="10%">信用卡</td>
                    <td width="15%">支付</td>
                    <td width="22%">办理U盾</td>
                    <td width="28%">----</td>
                    <td width="25%">单笔1000元<br>单日信用卡本身透支额度</td>
                </tr>
                <tr>
                    <td width="10%">储蓄卡</td>
                    <td width="15%">充值,支付</td>
                    <td width="22%">电子银行口令卡</td>
                    <td width="28%">需开通短信认证</td>
                    <td width="25%">单笔2000元<br>单日5000元</td>
                </tr>
                <tr>
                    <td width="10%">储蓄卡</td>
                    <td width="15%">充值,支付</td>
                    <td width="22%">办理U盾</td>
                    <td width="28%">----</td>
                    <td width="25%">单笔100万元<br>单日100万元</td>
                </tr>
			</table>
		</div>
		<div class="clr"></div>
		<div class="btns">
			<form id="paymentInfo" method="POST" action="${base}/payment/merge/show">
				<input id="orderSns" name="orderSns" type="hidden" value="${orderSns}" >
                <input id="payType" name="payType" type="hidden" value="${payType["sign"]}">
			</form>
			<b id="btnNext" class="btn-next" href="javascript:void(0);" >下一步</b>
		</div><!--btns end-->
	</div><!--banking end-->
	<div class="clr"></div>

</div>
</div>
	<#include "bec/ghdj/service.ftl"/>
	<#include "bec/ghdj/foot.ftl"/>
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

		if(payType=='unionpay' || payType=='icbcb2c'){
			$(".payment-xz").slideDown();
		}else{
            $(".payment-xz").slideUp();
		}

		
	});
	
	$(".list-pay>li").eq(0).click();
	
	$("#btnNext").click(function (){
		$("#paymentInfo").submit();
	});


});
</script>
</#escape>