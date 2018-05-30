<#escape x as x?html>
	<#include "bec/ghj/header.ftl"/>
<#include "bec/ghj/top5.ftl"/>
<link href="${base}/static/bec/project/ghj/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>


    



<style>
.banking {/*border: 1px solid #EDD28B;*/background-color: #ffffff;padding: 18px;/* border-top: 2px solid #EDD28B*/}
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

<div class="content" style="background: #fff; width: 1120px; margin:15px auto 15px auto;  padding: 40px; border-top:4px solid #cee3c2; ">
	<div class="orderbody">
		<div class="mc">
			<s class="icon-succ04"></s>
			<div style="width: 1100px; float: left;">
				<h3 class="orderinfo">订单提交成功，请您尽快付款！</h3>
				<div class="pay-total">总支付金额：<strong class="ftx-01">￥${total}</strong>元</div>
				<div class="pay-total">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本次支付金额：<strong class="ftx-01" id="payAmount_span">￥${onlinePayAmount}</strong>元<br></div>
            </div>
			<#--<#list orders as order>-->
				<ul class="list-orderinfo">
                    <li>订单号：${order.orderSn}</li>
                    <li>订单总额：<strong class="ftx-01">￥${order.totalAmount}</strong> 元</li>
                    <li>已付金额：<strong class="ftx-01" id="paidAmountTotal_span">￥${paidAmountTotal}</strong> 元</li>
                    <li>剩余应付金额：<strong class="ftx-01" id="unpaidAmountTotal_span">￥${unpaidAmountTotal}</strong> 元</li>
                    <li class="li-last">本次支付后剩余金额：<strong class="ftx-01">￥<span id="remainingUnpaid">${remainingUnpaid}</span></strong> 元</li>
				</ul>
			<#--</#list>-->
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
					<input id="payAmountType" name="payAmountType" type="hidden" value="${payAmountType}">
					<input id="payAmount" name="payAmount" type="hidden" value="${onlinePayAmount}">
				</form>
				<b id="btnConfirmPay" class="btn-confirm-pay" href="javascript:void(0);" >确认支付</b>
				<a href="${base}/payment/popupconfirm" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单支付" id="orderpay"></a>
			</div><!--btns end-->
		</div>
	</div><!--banking end-->
	<div class="clr"></div>
</div>
	<#include "bec/ghj/service.ftl"/>
	<#include "bec/ghj/foot.ftl"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script type="text/javascript">
    /*宽屏设置*/
    //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");

    $(function(){
        $("#orderpay").colorbox({iframe:true, innerWidth:480, innerHeight:148, opacity: 0.15});

        $("#btnConfirmPay").click(function (){

			if(parseFloat($("#payAmount").val()) == 0){
				layer.msg('第三方支付金额不能为0',{icon:2,time:2000});
				return;
			}else{
				$("#paymentConfirm").submit();

				$("#orderpay").trigger("click");
			}

        });
        getOrderAmount();
    });

    /**
     * 获取账户数据
     */
    function getOrderAmount(){
        $.ajax({
            type: "post",
            url: baseP + "/payment/ajaxGetOrderAmount",
            data: {orderSn: $("#orderSn").val()},
            success: function(data) {
                if (data.status == 'success') {
                    $("#paidAmountTotal_span").text(data.paidAmountTotal.formatMoney(2,"￥"));
                    $("#unpaidAmountTotal_span").text(data.unpaidAmountTotal.formatMoney(2,"￥"));

					if( parseFloat($("#payAmount").val()) + parseFloat($("#remainingUnpaid").text()) != parseFloat(data.unpaidAmountTotal) ){
                        $("#payAmount").val(0);
                        $("#remainingUnpaid").text('0');
					}
                }
            }
        });
    }


    function backToPaymentList(){
        $("#orderpay").colorbox.close();
        window.location.href = "${base}/payment?orderSn=${orderSn},&total=${order.totalAmount}&key=${orderIds}&r"+Math.random();
    }

    function paysuccess(){
        $("#orderpay").colorbox.close();
        var ids = '${orderIds}';
        if($("#payType").val() == 'unionpay'){
            $.ajax({
                type: "post",
                url: "${base}/payment/unionpayQuery",
                data: {orderSn: $("#orderSn").val()},
                success: function(data) {
                    window.location.href = "${base}/order/view/${orderIds}?orderSn=${orderSn}&total=${total}&key=${orderIds}&r"+Math.random();
                }
            });
        }else {
            if (ids.indexOf(",") > 0) {
                window.location.href = "${base}/order/list";
            } else {
                window.location.href = "${base}/order/view/${orderIds}?orderSn=${orderSn}&total=${total}&key=${orderIds}&r" + Math.random();
            }
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