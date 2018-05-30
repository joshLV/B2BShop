<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单支付-请选择支付方式</title>
<link href="${base}/static/mall/gdnz/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/gdnz/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"paymentlist"
};
</script>
</head>
<body>
<#if '${status}'=='failed'>
<script type="text/javascript">
alert("${message}");
/*window.location.href="${base}/order/list";*/
window.opener=null;
window.open('','_self');
window.close();
</script>
<#else >
<#include "mall/gdnz/shortcut.ftl"/>
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
.orderbody .mc {padding: 19px 20px 18px; line-height: 24px; border: 1px solid #7abd54; border-top: none; overflow: hidden;}
.orderbody .mc {padding-left: 46px;position: relative;}
.icon-succ04, .icon-quer04, .icon-error05 {display: inline-block;width: 16px;height: 16px;vertical-align: middle; margin-top: 5px;}
.icon-succ04 {background-image: url(${base}/static/mall/img/icon-succ.png);}
.orderbody .icon-succ04, .orderbody .icon-error05 {margin-left: -26px;float: left;}
.orderinfo {float: left;color: #7ABD54;margin-right: 15px; font-size: 18px; /*width: 990px;*/ margin-bottom: 15px;}
.list-orderinfo, .list-orderinfo01 {overflow: hidden; float: left; width: 990px;}
.list-orderinfo li, .list-orderinfo01 li {float: left;border-right: 1px solid #CCCCCC;margin-right: 7px;padding-right: 7px;}
.list-orderinfo .li-last, .list-orderinfo01 .li-last {border-right: none;}
.list-orderinfo strong.ftx-01 {font-size: 12px;}
.list-orderinfo .ftx-01 {font-size: 16px;}
.ftx-01, a.flk-01:link, a.flk-01:visited, .flk-01 a:link, .flk-01 a:visited {color: #ea5313;}
.mb-tip, .mb-tip01 {color: #999999;margin-top: 4px; float: left;}
.ftx-04, a.flk-04:link, a.flk-04:visited, .flk-04 a:link, .flk-04 a:visited {color: #ff6600;}


</style>

<style>

</style>
    
<div class="content m header clearfix">
	<div id="logo">
		<a href="${base}"><img src="${base}/static/mall/gdnz/img/logo.png" title="返回商城首页" alt="返回商城首页"></a>
	</div><!--logo end-->
	<div class="progress clearfix">
		<ul class="progress-1">
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

.list-pay{height:68px;}
.list-pay li {height:60px;width: 168px;float:left;border-bottom: 1px solid #FBE7B3;background-color: #ffffff;margin-right: 20px;padding-left: 20px;padding-right: 20px;zoom: 1;cursor: pointer;}
.list-pay li:hover, .list-pay .select {-webkit-box-shadow: 2px 0 3px 0 rgba(0,0,0,.15);-moz-box-shadow: 2px 0 3px 0 rgba(0,0,0,.15);box-shadow: 2px 0 3px 0 rgba(0,0,0,.15);position: relative;}
.list-pay li .item {margin-right: 10px;float: left;padding-top: 16px;padding-bottom: 16px;}
.list-pay li .item .radio {position: relative;top: 7px;margin-right: 5px;}
.list-pay li .item label {margin-right: 5px;}

.list-pay .select {
border: 2px solid #db0000;
padding-left: 17px;
padding-right: 17px;
z-index: 1;
}

.btns {margin-top:10px;}
.btn-next {margin-right: 10px;cursor: pointer;}
/*.btn-next:hover {background-position: 0 -38px;}*/
.btn-next {background:#db0000;width: 134px;height: 37px;font-size:16px; text-align:center; line-height: 37px; border-radius: 3px; overflow: hidden;display: inline-block;border: none;vertical-align: middle; color: #ffffff;}
.btn-next:hover{background: #ed4548;}
.pay-total{font-size: 16px; float: right;}
</style>

<div class="content">
	<div class="m orderbody">
		<div class="mc">
			<div style="width: 990px; float: left;overflow: hidden;">
				<div style="float: left;">
					<s class="icon-succ04"></s>
					<h3 class="orderinfo">订单提交成功，请您尽快付款！</h3>
                </div>
				<div class="pay-total" style="float: right;">总支付金额：<strong class="ftx-01" >￥${total?number?string('##0.00')}</strong>元</div>
            </div>
			<#list orders as order>
				<ul class="list-orderinfo">
					<li>订单号：${order.orderSn}</li>
					<li class="li-last">应付金额：<strong class="ftx-01">￥${order.totalAmount?string('##0.00')}</strong> 元</li>
				</ul>
			</#list>
			<p class="mb-tip">请您在提交订单后<span class="ftx-04">24小时</span>内完成支付，否则订单会自动取消。</p>
		</div>
	</div><!--orderbody end-->
	<div class="m banking">
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
				<input id="payType" name="payType" type="hidden" value="">
			</form>
			<b id="btnNext" class="btn-next" href="javascript:void(0);" >下一步</b>
		</div><!--btns end-->
	</div><!--banking end-->
	<div class="clr"></div>
</div>

<#include "mall/gdnz/service.ftl"/>
<#include "mall/gdnz/footer.ftl"/>
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
</#if>
</body>
</html>