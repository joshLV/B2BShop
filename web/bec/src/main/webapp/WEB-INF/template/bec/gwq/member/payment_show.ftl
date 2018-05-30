<#escape x as x?html>
	<#include "bec/gwq/header.ftl"/>
<#include "bec/gwq/top2.ftl"/>
<link href="${base}/static/bec/project/gwq/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>


    
<div class="content  header clearfix">

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

.payTypeLogo {width:200px;/*height:68px;*/padding-left:80px;}

.btns {margin-top:10px;}
.btn-confirm-pay {margin-right: 10px;cursor: pointer;}
.btn-confirm-pay:hover {background-position: 0 -38px;}
.btn-confirm-pay {background:#db0000;width: 134px;height: 37px;display: none;line-height:37px;font-size:16px;overflow: hidden;display: inline-block;border: none;vertical-align: middle;}
.pay-total{font-size: 16px;}
</style>

<div class="content">
	<div class="orderbody">
		<div class="mc">
			<s class="icon-succ04"></s>
			<div style="width: 1100px; float: left;">
				<h3 class="orderinfo">订单提交成功，请您尽快付款！</h3>
				<div class="pay-total">总支付金额：<strong class="ftx-01">￥${total}</strong>元<br></div>
            </div>
			<#list orders as order>
				<ul class="list-orderinfo">
					<li>订单号：${order.orderSn}</li>
					<li class="li-last">应付金额：<strong class="ftx-01">￥${order.totalAmount}</strong> 元</li>
				</ul>
			</#list>
			<p class="mb-tip">请您在提交订单后<span class="ftx-04">24小时</span>内完成支付，否则订单会自动取消。</p>
		</div>
	</div><!--orderbody end-->
	<div class="banking">
		<h4 class="tit-sub">
			<strong>${payType["name"]}</strong>
			<span class="ftx-03">付款时需跳转至${payType["name"]}平台完成支付</span>
        </h4><!--tit-sub end-->
		<div class="payTypeLogo">
			<label><img width="125" height="28" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
			<div class="btns">
				<form target="_blank" id="paymentConfirm" method="POST" action="${base}/payment/confirm">
					<input id="orderSn" name="orderSn" type="hidden" value="${orderSn}" >
					<input id="payType" name="payType" type="hidden" value="${payType["sign"]}">
				</form>
				<b id="btnConfirmPay" class="btn-confirm-pay" href="javascript:void(0);" >确认支付</b>
				<a href="${base}/payment/popupconfirm" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单支付" id="orderpay"></a>
			</div><!--btns end-->
		</div>
	</div><!--banking end-->
	<div class="clr"></div>
</div>
	<#include "bec/gwq/service.ftl"/>
	<#include "bec/gwq/foot.ftl"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
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
        window.location.href = "${base}/payment?orderSn=${orderSn},&total=${order.totalAmount}&key=${orderIds}&r"+Math.random();
    }

    function paysuccess(){
        $("#orderpay").colorbox.close();
        var ids = '${orderIds}';
        if( ids.indexOf(",")>0){
            window.location.href = "${base}/order/list";
        }else{
            window.location.href = "${base}/order/view/${orderIds}?orderSn=${orderSn}&total=${total}&key=${orderIds}&r"+Math.random();
        }
    }

    function payerror(){
        var ids = '${orderIds}';
        if( ids.indexOf(",")>0){
            window.location.href = "${base}/order/list";
        }else{
            window.location.href = "${base}/order/view/${orderIds}?orderSn=${orderSn}&total=${total}&key=${orderIds}&r"+Math.random();
        }
    }

//    layer.open({
//        type: 2,
//        title: '',
//        shadeClose: true,
//        shade: 0.8,
//        area: ['380px', '90%'],
//        content: 'http://layer.layui.com/mobile/' //iframe的url
//    });

</script>
</#escape>