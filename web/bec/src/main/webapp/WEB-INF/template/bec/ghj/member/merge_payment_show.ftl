<#escape x as x?html>
	<#include "bec/ghj/header.ftl"/>
<#include "bec/ghj/top5.ftl"/>
<link href="${base}/static/bec/project/ghj/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<style>
    .banking {/*border: 1px solid #f3e4bc;background-color: #FBFAF2;*/  border-bottom:0; padding: 10px 20px 20px 20px;margin:0px;}
    .list-pay{height: auto; overflow: hidden;}
    .orderbody .mc{ border-bottom: 0;}
    .tit-sub {margin-bottom: 15px;}
    .tit-sub strong {font: normal 18px "microsoft yahei";margin-right: 6px;}
    .ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}

    .payTypeLogo {width:200px;/*height:68px;*/padding-left:30px;}
    .btns {margin-top:15px;}
    .btn-confirm-pay {margin-right: 10px;cursor: pointer;}
    .btn-confirm-pay:hover {background-position: 0 -38px;}
    .btn-confirm-pay {background:#db0000;width: 166px;height: 38px;display: none;line-height:38px;font-size:16px;overflow: hidden;display: inline-block;border: none;vertical-align: middle;}
    .pay-total{font-size: 16px;}
    .payTypeLogo img{ border:1px solid #e73047; padding: 10px 20px; background: #fff;}
    .payment-xz{ margin-top: 0;}
    .payTypeLogo{ margin-top: 20px;}
    .banking .f-fl{ width: 450px; height: 228px;border: 1px dashed #e2e2e2;}
</style>


<div class="main f-cb">
    <h1 class="order_tit">核对订单支付信息</h1>
    <div class="order_info">
	<div class="orderbody">
		<div class="mc">
			<s class="icon-succ04"></s>
			<div style="width: 1100px; float: left;">
				<h3 class="orderinfo">订单提交成功，请您尽快付款！</h3>
				<div class="pay-total">总支付金额：<strong class="ftx-01">￥${total}</strong>元</div>
            </div>
			<#list orders as order>
				<ul class="list-orderinfo">
                    <li>订单号：${order.orderSn}</li>
                    <li class="li-last">订单总额：<strong class="ftx-01">￥${order.totalAmount}</strong> 元</li>
				</ul>
			</#list>
			<p class="mb-tip">请您在提交订单后<span class="ftx-04">24小时</span>内完成支付，否则订单会自动取消。</p>
		</div>
	</div><!--orderbody end-->
	<div class="banking f-cb">
        <h4 class="tit-sub">
            <strong>${payType["name"]}</strong>
            <span class="ftx-03">付款时需跳转至${payType["name"]}平台完成支付</span>
        </h4>
		<div class="f-fl">
		<div class="payTypeLogo">
			<label><img width="125" height="28" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
			<div class="btns">
				<form target="_blank" id="paymentConfirm" method="POST" action="${base}/payment/merge/confirm">
					<input id="orderSn" name="orderSns" type="hidden" value="${orderSns}" >
					<input id="orderType" name="orderType" type="hidden" value="${orderType}" >
					<input id="payType" name="payType" type="hidden" value="${payType["sign"]}">
				</form>
				<b id="btnConfirmPay" class="btn-confirm-pay" href="javascript:void(0);" >确认支付</b>
				<a href="${base}/payment/popupconfirm" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单支付" id="orderpay"></a>
			</div><!--btns end-->
		</div>
        </div>
		<div class="f-fr" id="shuakatishi">
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
		</div>
	</div><!--banking end-->
	<div class="clr"></div>
</div>
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
            $("#paymentConfirm").submit();

            $("#orderpay").trigger("click");

        });


        //控制显示提示
        if( $("#payType").val() == 'unionpay' || $("#payType").val() == 'icbcb2c' ){
			$("#shuakatishi").show();
        }else{
            $("#shuakatishi").hide();
        }

    });

    function backToPaymentList(){
        $("#orderpay").colorbox.close();
        window.location.href = "${base}/payment/merge/payList?orderSns=${orderSns}&r"+Math.random();
    }

    function paysuccess(){
        $("#orderpay").colorbox.close();
        if($("#payType").val() == 'unionpay'){
            $.ajax({
                type: "post",
                url: "${base}/payment/merge/unionpayQuery",
                data: {orderSns: $("#orderSn").val()},
                success: function(data) {
                    window.location.href = "${base}/order/list?orderType_="+ $("#orderType").val() +"&r"+Math.random();
                }
            });
        }else {
            window.location.href = "${base}/order/list?orderType_="+ $("#orderType").val() +"&r"+Math.random();
        }
    }

    function payerror(){
        $("#orderpay").colorbox.close();
        window.location.href = "${base}/payment/merge/payList?orderSns=${orderSns}&r"+Math.random();
    }

</script>
</#escape>