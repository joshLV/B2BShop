<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<#include "app/ghj/head.ftl">
    <link href="${path}/theme/red/ghj_style.css" rel="stylesheet"/>
    <style>
        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghj/images/arr.png) no-repeat; background-size:13px 21px;margin-top:5px;}
        .sh_info {padding-top: 14px;padding-bottom: 14px;  border-bottom: solid 0px #d8d8d8;}
	.ftx-01 {color: #e4393c;}
    </style>
</head>
<body>
<header>
    <div class="logo"><a class="ltext" href="javascript:jumpto(fullpath + '/order/list?orderBy=a.createDate&orderType=desc&status=wait_buyer_pay&whichclient=whichapp&paymentStatus=unpaid#wait_buyer_pay');">返回</a></div>
    <div class="mtit">支付凭证</div>
</header>
<div class="mui-content wrap" style="margin-top:60px;">
    <p class="border-bottom usr-name" style="height: 35px;"><b> ${MESSAGE}</b></p>
    <ul class="order-list">
        <li>
            <div class="order-box" style="padding-bottom: 0;">
                <div class="order-width">
                    <div class="sh_info">
                        <div class="key">总支付金额:</div>
                        <div class="val"><strong class="ftx-01">￥${order.totalAmount?number?string("##0.00")}</strong></div>
                    </div>
                    <div class="sh_info">
                        <div class="key">订单号:</div>
                        <div class="val">${order.orderSn}</div>
                    </div>
                    <div class="sh_info">
                        <div class="key">应付金额:</div>
                        <div class="val"><strong class="ftx-01">￥${order.totalAmount?number?string("##0.00")}</strong></div>
                    </div>
                    <!--<div class="sh_info" style="border-bottom: 0;">
                        <div >请您在提交订单后<strong class="ftx-01">72小时</strong>内完成支付，否则订单会自动取消。</div>
                    </div>-->
                </div>
            </div>
        </li>
    </ul>
</div>
<#include "app/ghj/tools.ftl">
<script src="${path}/js/mui.min.js"></script>
<script>
 (function(mui, doc) {
    mui.init();
    mui.ready(function () {
       //代码...
    })
    mui.back = function(){
	window.location.href="${base}/order/list?orderBy=a.createDate&orderType=desc&status=wait_buyer_pay&whichclient=whichapp&paymentStatus=unpaid#wait_buyer_pay";
    }

 }(mui, document));
</script>
</body>
</html>