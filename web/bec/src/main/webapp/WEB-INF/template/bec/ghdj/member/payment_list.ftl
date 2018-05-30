<#escape x as x?html>
	<#include "bec/ghdj/header.ftl"/>
	<#include "bec/ghdj/top4.ftl"/>





<div class="content" style="background: #fff; width: 1120px; margin:15px auto 15px auto;  padding: 40px; border-top:4px solid #cee3c2; ">
	<div class="orderbody">
		<div class="mc">
			<s class="icon-succ04"></s>
			<div style="width: 1000px; float: left;">
				<h3 class="orderinfo">订单提交成功，请您尽快付款！</h3>
				<div class="pay-total">总支付金额：<strong class="ftx-01" >￥${total}</strong>元<br></div>
            </div>
            <ul class="list-orderinfo">
                <li>订单号：${order.orderSn}</li>
                <li >订单金额：<strong class="ftx-01">￥${order.totalAmount}</strong> 元</li>
                <li >已付金额：<strong class="ftx-01" id="paidAmountTotal_span">￥${paidAmountTotal}</strong> 元</li>
                <li>剩余应付金额：<strong class="ftx-01" id="unpaidAmountTotal_span">￥${unpaidAmountTotal}</strong> 元</li>
                <li>红包可支付金额：<strong class="ftx-01" id="RunpaidAmountTotal_span">￥${RunpaidAmountTotal}</strong> 元</li>
                <li class="li-last">本次支付金额：<strong class="ftx-01" id="paidAmount">0</strong> 元</li>
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

    <form id="paymentInfo" method="POST" action="${base}/payment/show">
        <input id="orderId" name="orderId" type="hidden" value="${order.id}" >
        <input id="orderSn" name="orderSn" type="hidden" value="${orderSn}" >
        <input id="payType" name="payType" type="hidden" value="">
        <input id="unpaidAmountTotal" name="unpaidAmountTotal" type="hidden" value="${unpaidAmountTotal}"><!-- 剩余应支付 -->
        <input id="RunpaidAmountTotal" name="RunpaidAmountTotal" type="hidden" value="${RunpaidAmountTotal}"><!-- 剩余红包可支付金额 -->

	<!-- 账户  TianYu 2016-2-29 11:15:40 Start   -->
	<div class="banking">
		<h4 class="tit-sub">
			<strong><input type="checkbox" id="checkbox_a1" class="chk_1"  onchange="payTypeisChecked('checkbox_a1','account_ul')"/><label for="checkbox_a1"></label>账户余额支付</strong>
			<span class="ftx-03">可使用账户余额进行订单支付</span>
        </h4><!--tit-sub end-->
        <ul class="list-pay-account" id="account_ul" style="display: none;">
                <li>
                    <div class="item">
                        <span class="label">账户总额：</span>
                        <span class="money" id="mpr_account_accountTotal"></span>
                        <span class="unit">&nbsp;元</span>
                    </div>
                </li>
				<li>
                    <div class="item">
                        <span class="label">可用余额：</span><span class="money"  id="mpr_account_amountAvailable_span"></span><span class="unit">&nbsp;元</span>
                    </div>
                </li>
				<li>
                    <div class="item">
                        <span class="label">本次使用：</span>
						<span class="money">
                            <input class="pay_input" type="text" name="account.thisUsedAmount" id="mpr_account_thisUsedAmount"
                                   onblur="changeAccount()"
                                   onkeyup="this.value = floatFormat( this.value, 2 );"
                                   onafterpaste="this.value = floatFormat(this.value, 2  );"
                                   value="0" >
                            <input type="hidden" name="account.id" id="mpr_account_id" >
                            <input type="hidden" name="account.amountAvailable" id="mpr_account_amountAvailable" value="0">
                        </span>
						<span class="unit">&nbsp;元</span>
                    </div>
                </li>
        </ul><!--list-pay end-->
		<div class="clr"></div>
	</div><!--banking end-->
	<div class="clr"></div>
	<!-- 账户  TianYu 2016-2-29 11:15:40 End   -->

	<!-- 授信  TianYu 2016-2-29 11:15:40 Start   -->
	<!-- 隐藏授信显示 dzz 20160509   -->
    <div class="banking" style="display: none;">
        <h4 class="tit-sub" style="display: none;">
            <strong>
                <input type="checkbox" id="checkbox_a2" class="chk_1" onchange="payTypeisChecked('checkbox_a2','credit_ul')" />
                <label for="checkbox_a2"></label>银行授信支付
            </strong>
            <span class="ftx-03">使用银行授信进行订单支付&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <span class="ftx-03" id="credit_empty" style="color: red;display: none;">暂无可用银行授信</span>
        </h4><!--tit-sub end-->
        <ul class="list-pay-credit" id="credit_ul" style="display: none;">
                <#--<li index="" class="">
                    <div class="credit">
                        <span class="title">XXX银行</span><br>
                        <span class="label">授信额度：</span><span class="money">￥1111</span><span class="unit">元</span>
                        <span class="label">已使用：</span><span class="money">￥1111</span><span class="unit">元</span>
                        <span class="label">本次可用：</span><span class="money">￥1111</span><span class="unit">元</span>
                        <span class="label">本次使用：</span><span class="text"><input type="text" name="mpr.creditReplyList.thisUsedAmount[0]"></span><span class="unit">元</span>
                    </div>
                </li>&ndash;&gt;
        </ul><!--list-pay end-->
        <div class="clr"></div>
    </div><!--banking end-->
    <div class="clr"></div>
    <!-- 授信  TianYu 2016-2-29 11:15:40 End   -->

    <!-- 红包  TianYu 2016-2-29 11:15:40 Start   -->
    <div class="banking">
        <h4 class="tit-sub">
            <strong>
                <input type="checkbox" id="checkbox_a3" class="chk_1" onchange="payTypeisChecked('checkbox_a3','pr_ul')" />
                <label for="checkbox_a3"></label>平台红包
            </strong>
            <span class="ftx-03">使用平台发放的红包进行订单支付</span>
            <span class="ftx-03" id="pr_empty" style="color: red;display: none;">暂无可用平台发放的红包</span>
        </h4><!--tit-sub end-->
        <ul class="list-pay-credit" id="pr_ul" style="display: none; padding: 20px 10px 0 30px;font-size: 15px;"">
            <#--<li index="" class="">
                <div class="credit">
                    <span class="title">红包XXX</span>
                    <span class="label">红包金额：</span><span class="money">￥1111</span><span class="unit">元</span>
                    <span class="label">限制：</span><span class="money">￥1111</span><span class="unit">元</span>
                    <span class="label">本次可用：</span><span class="money">￥1111</span><span class="unit">元</span>
                    <span class="label">本次使用：</span><span class="text"><input type="text" name="mpr.creditReplyList.thisUsedAmount[0]"></span><span class="unit">元</span>
                </div>
            </li>-->
        </ul><!--list-pay end-->
        <div class="clr"></div>
    </div><!--banking end-->
    <div class="clr"></div>

    <div class="banking">
        <h4 class="tit-sub">
            <strong>
                <input type="checkbox" id="checkbox_a4" class="chk_1" onchange="payTypeisChecked('checkbox_a4','mr_ul')" />
                <label for="checkbox_a4"></label>供应商红包
            </strong>
            <span class="ftx-03">使用供应商发放的红包进行订单支付</span>
            <span class="ftx-03" id="mr_empty" style="color: red;display: none;">暂无可用供应商发放的红包</span>
        </h4><!--tit-sub end-->
        <ul class="list-pay-credit" id="mr_ul" style="display: none; padding: 20px 10px 0 30px;font-size: 15px;">
            <#--<li index="" class="">
                <div class="credit">
                    <span class="title">红包XXX</span>
                    <span class="label">红包金额：</span><span class="money">￥1111</span><span class="unit">元</span>
                    <span class="label">限制：</span><span class="money">￥1111</span><span class="unit">元</span>
                    <span class="label">本次可用：</span><span class="money">￥1111</span><span class="unit">元</span>
                    <span class="label">本次使用：</span><span class="text"><input type="text" name="mpr.creditReplyList.thisUsedAmount[0]" value="0"></span><span class="unit">元</span>
                </div>
            </li>-->
        </ul><!--list-pay end-->
        <div class="clr"></div>
    </div><!--banking end-->
    <div class="clr"></div>
    <!-- 红包  TianYu 2016-2-29 11:15:40 End   -->



    <div class="banking">
        <h4 class="tit-sub">
            <strong>
                <#--<input type="checkbox" id="checkbox_a5" class="chk_1" onchange="payTypeisChecked('checkbox_a5','third_party_platform_info_id','payment_amount_info_id','pay_check_id')" />-->
                <#--<label for="checkbox_a5"></label>-->第三方支付平台
            </strong>
            <span class="ftx-03">付款时需跳转至各个支付方式对应的支付平台支付</span>
        </h4><!--tit-sub end-->
        <ul class="list-pay">
			<#list payTypeList as payType>
                <li index="${payType_index}" class="<#if payType_index==0>fisrt</#if>">
                    <div class="item">
                        <input type="radio" value="${payType["sign"]}" class="radio" name="payType_radio" payTypeName="${payType["name"]}">
                        <label><img width="125" height="28" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
                    </div>
                </li>
			</#list>
        </ul><!--list-pay end-->
        <div class="clr"></div>
		<div class="online_pay_amount" >
			<span class="label">支付金额：</span>
			<span class="money">
                <input class="float_input" type="text" name="onlinePayAmount" id="onlinePayAmount" value="${unpaidAmountTotal?string('##0.00')}"
                       onblur="changeOnlinePayAmount( );"
                       onkeyup="this.value = floatFormat( this.value, '2', '${unpaidAmountTotal?string('##0.00')}' );"
                       onafterpaste="this.value = floatFormat(this.value, '2' ,'${unpaidAmountTotal?string('##0.00')}'  );"
                       >
            </span>
			<span class="unit">元</span>
		</div>
        <div class="clr"></div>

        <div class="btns">


            <b id="btnNext" class="btn-next" href="javascript:void(0);" >下一步</b>
            <b id="btnNext_disable" class="btn-next" href="javascript:void(0);" style="display: none;">正在验证...</b>
        </div><!--btns end-->
    </div><!--banking end-->
    <div class="clr"></div>

    </form>
</div>
<script type="text/javascript" src="${base}/static/bec/project/ghdj/js/payment_list.js"></script>
<script type="text/javascript">
/*宽屏设置*/
//pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");

//剩余应支付金额
var unpaidAmountTotal = ${unpaidAmountTotal};
var baseP = '${base}';


$(function(){
    //默认隐藏各种支付的详细信息，当勾选后 显示出来
    $("#account_balance_info_id").hide();
    $("#credit_ul").hide();
    $("#pr_ul").hide();
    $("#mr_ul").hide();

	$(".list-pay>li").click(function (){
		$this=$(this);
		$this.addClass("select");
		$this.siblings().removeClass("select");

		var index = $this.attr('index');
		var payType=$("input[name='payType_radio']:eq("+index+")").val();
		$("#payType").val(payType);

		$("input[name='payType_radio']").each(function(idx,ele){
			$(this).prop("checked",(index==idx));
		});
	});

	$(".list-pay>li").eq(0).click();

	$("#btnNext").click(function (){

        var html = '<h2>本次支付情况：</h2><br><ul>';
        if( parseFloat($('#mpr_account_thisUsedAmount').val()) != 0 ){
            html += '<li>账户余额支付：<strong class="ftx-01">' + parseFloat($('#mpr_account_thisUsedAmount').val()).formatMoney(2,"￥");
        }else{
            html += '<li>账户余额支付：<strong class="ftx-01">￥ 0.00';
        }
        html += '</strong> <span>元</span></li>';


        /*if($(".credit_pay").length > 0){
            var creditPay = 0;
            $(".credit_pay").each(function(){
                creditPay += parseFloat($(this).val());
            });

            if(creditPay != 0){
                html += '<li>银行授信支付：<strong class="ftx-01">' + creditPay.formatMoney(2,"￥");
            }else{
                html += '<li>银行授信支付：<strong class="ftx-01">￥ 0.00';
            }
        }else{
            html += '<li>银行授信支付：<strong class="ftx-01">￥ 0.00';
        }
        html += '</strong> 元</li>';*/

        if($(".pr_pay").length > 0){
            var prPay = 0;
            $(".pr_pay").each(function(){
                prPay += parseFloat($(this).val());
            });

            if(prPay != 0){
                html += '<li>平台红包支付：<strong class="ftx-01">' + prPay.formatMoney(2,"￥");
            }else{
                html += '<li>平台红包支付：<strong class="ftx-01">￥ 0.00';
            }
        }else{
            html += '<li>平台红包支付：<strong class="ftx-01">￥ 0.00';
        }
        html += '</strong> 元</li>';

        if($(".mr_pay").length > 0){
            var mrPay = 0;
            $(".mr_pay").each(function(){
                mrPay += parseFloat($(this).val());
            });

            if(mrPay != 0){
                html += '<li>供应商红包支付：<strong class="ftx-01">' + mrPay.formatMoney(2,"￥") + '</strong> 元</li>';
            }else{
                html += '<li>供应商红包支付：<strong class="ftx-01">￥ 0.00</strong> 元</li>';
            }
        }else{
            html += '<li>供应商红包支付：<strong class="ftx-01">￥ 0.00</strong> 元</li>';
        }

        $("input[name='payType_radio']").each(function(){
            if($(this).prop("checked")){
                html += '<li>' + $(this).attr("payTypeName") + '：';
            }
        });
        if( parseFloat($('#onlinePayAmount').val()) != 0 ){
            html += '<strong class="ftx-01">' + (parseFloat($('#onlinePayAmount').val()).formatMoney(2,"￥"));
        }else{
            html += '<strong class="ftx-01">￥ 0.00';
        }
        html += '</strong> 元</li>';



        html += '</ul>';
        html += '<br>您确认要完成本次支付？';

        layer.confirm(html, {icon: 7, title:'支付确认',area: '400px'}, function(index){
            $("#paymentInfo").submit();
            layer.close(index);
        });

	});

    //获取剩余应付等
    getOrderAmount();

    //获取账户金额
    getAccount();

    //银行授信
    getCredit();

    //平台红包
    getPR();

});

    /**
     * DESC:勾选不同支付方式显示或隐藏支付方式的详细内容
     * AUTH:zhangqiang
     * Time:2016-03-28 10:52:35
     * @param:
     *         payTypeId 支付方式ID
     *         payInfoId 支付详细信息ID
     *         othersId  其它显示内容ID
     *         buttonCheckId  第三方支付确认按钮ID
     */
    function payTypeisChecked(payTypeId,payInfoId){
        if($("#"+payTypeId).prop("checked")){
            $("#"+payInfoId).show();
        }else{
            $("#"+payInfoId).hide();
        }
    }



</script>
	<#include "bec/ghdj/service.ftl"/>
	<#include "bec/ghdj/foot.ftl"/>
</#escape>
