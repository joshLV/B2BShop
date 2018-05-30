<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单支付-核对支付信息</title>
<link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"paymentshow"
};
</script>
</head>
<body>
<#include "mall/qp/shortcut.ftl"/>
<style>
.header {padding: 20px 0 10px;}
#logo {padding-left: 5px;float: left}
.progress {padding-top: 6px;}
.progress .progress-1{background:url(${base}/static/mall/img/step1.png) no-repeat;width:481px;padding-top:23px;overflow:hidden;height:23px;}
.progress .progress-2 {background: url(${base}/static/mall/img/step2.png) no-repeat;width: 481px;padding-top: 23px;overflow: hidden;height: 23px;}
.progress ul {width:481px; float:right;}
.progress li {width:160px; height:23px; float:left; color:#bce8a3; line-height:23px; text-align:center;}
.progress li b {width:22px; height:25px; display:none; }
.progress li.step-1{color:#7abd54;}
.progress li.step-2{color:#aaaaaa;width:161px;}
.progress li.step-3{color:#aaaaaa;}
.progress li.complete b {background-position:0 -50px;}

.orderbody {border-top: 2px solid #7ABD54;background-color: #F3FDED;}
.orderbody .mc {padding: 19px 20px 18px;}
.orderbody .mc {padding-left: 46px;position: relative;}
.icon-succ04, .icon-quer04, .icon-error05 {display: inline-block;width: 16px;height: 16px;vertical-align: middle;}
.icon-succ04 {background-image: url(${base}/static/mall/img/icon-succ.png);}
.orderbody .icon-succ04, .orderbody .icon-error05 {margin-left: -26px;float: left;}
.orderinfo {float: left;color: #7ABD54;margin-right: 15px;}
.list-orderinfo, .list-orderinfo01 {overflow: hidden;}
.list-orderinfo li, .list-orderinfo01 li {float: left;border-right: 1px solid #CCCCCC;margin-right: 7px;padding-right: 7px;}
.list-orderinfo .li-last, .list-orderinfo01 .li-last {border-right: none;}
.list-orderinfo strong.ftx-01 {font-size: 12px;}
.list-orderinfo .ftx-01 {font-size: 16px;}
.ftx-01, a.flk-01:link, a.flk-01:visited, .flk-01 a:link, .flk-01 a:visited {color: #E4393C;}
.mb-tip, .mb-tip01 {color: #999999;margin-top: 4px;}
.ftx-04, a.flk-04:link, a.flk-04:visited, .flk-04 a:link, .flk-04 a:visited {color: #ff6600;}


</style>

<style>

</style>
    
<div class="content m header clearfix">
	<div id="logo">
		<a href="${base}"><img src="${base}/static/mall/img/logo_index.png" title="返回商城首页" alt="返回商城首页"></a>
	</div><!--logo end-->
	<div class="progress clearfix">
		<ul class="progress-2">
			<li class="step-1"><b></b>1.选择支付方式</li>
			<li class="step-2">2.核对支付信息</li>
			<li class="step-3">3.支付信息结果</li>
		</ul>
	</div>
	<div class="clr"></div>
</div>


<style>
.banking {border: 3px solid #EDD28B;background-color: #FFFDEE;padding: 18px;}
.tit-sub {margin-bottom: 10px;}
.tit-sub strong {font: normal 18px "microsoft yahei";margin-right: 6px;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}

.payTypeLogo {width:200px;height:68px;padding-left:80px;}

.btns {margin-top:10px;}
.btn-confirm-pay {margin-right: 10px;cursor: pointer;}
.btn-confirm-pay:hover {background-position: 0 -38px;}
.btn-confirm-pay {background: url(${base}/static/mall/img/btn-confirm-pay.png) no-repeat;width: 134px;height: 37px;display: none;line-height: 100px;font-size: 0;overflow: hidden;display: inline-block;border: none;vertical-align: middle;}

</style>

<div class="content">
	<div class="m orderbody">
		<div class="mc">
			<s class="icon-succ04"></s>
			<h3 class="orderinfo">订单提交成功，请您尽快付款！</h3>
			<ul class="list-orderinfo">
				<li>订单号：${order.orderSn}</li>
				<li class="li-last">应付金额：<strong class="ftx-01">${order.totalAmount}</strong> 元</li>
			</ul>
			<p class="mb-tip">请您在提交订单后<span class="ftx-04">24小时</span>内完成支付，否则订单会自动取消。</p>
		</div>
	</div><!--orderbody end-->
	<div class="m banking">
		<h4 class="tit-sub">
			<strong>${payType["name"]}</strong>
			<span class="ftx-03">付款时需跳转至${payType["name"]}平台完成支付</span>
        </h4><!--tit-sub end-->
		<div class="payTypeLogo">
			<label><img width="125" height="28" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
			<div class="btns">
				<form target="_blank" id="paymentConfirm" method="POST" action="${base}/payment/confirm">
					<input id="orderSn" name="orderSn" type="hidden" value="${order.orderSn}" >
					<input id="payType" name="payType" type="hidden" value="${payType["sign"]}">
				</form>
				<b id="btnConfirmPay" class="btn-confirm-pay" href="javascript:void(0);" >确认支付</b>
				<a href="${base}/payment/popupconfirm" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单支付" id="orderpay"></a>
			</div><!--btns end-->
		</div>
	</div><!--banking end-->
	<div class="clr"></div>
</div>

<#include "mall/qp/service.ftl"/>
<#include "mall/qp/footer.ftl"/>
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
/*宽屏设置*/
//pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");

$(function(){
		
	$("#orderpay").colorbox({iframe:true, innerWidth:480, innerHeight:148, opacity: 0.15});
	
	$("#btnConfirmPay").click(function (){
		$("#paymentConfirm").submit();
		
		$("#orderpay").trigger("click");
		
	});
	
});

function backToPaymentList(){
	$("#orderpay").colorbox.close();
	window.location.href = "${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}&r"+Math.random();
}

function paysuccess(){
	$("#orderpay").colorbox.close();
	window.location.href = "${base}/order/view/${order.id}?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}&r"+Math.random();
}

function payerror(){
	$("#orderpay").colorbox.close();
	window.location.href = "${base}/order/view/${order.id}?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}&r"+Math.random();
}

</script>
</body>
</html>