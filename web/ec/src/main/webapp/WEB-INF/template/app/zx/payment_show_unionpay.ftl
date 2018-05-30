
<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/zx/head.ftl">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style>
        .mui-card {
            overflow: hidden;
            margin: 0 0 0 0px;
            border: 1px solid #ddd;
            border-radius: 0px;
            background-color: #fff;
            background-clip: padding-box
        }
        .f-fr2 {
            padding-left: 20px;
            color: #E4393C;
            background-size: 17px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">核对支付信息</h1>
</header>
<div class="mui-content" style="margin-top:20px;">
        <ul class="mui-table-view" >
            <li class="mui-table-view-cell mui-collapse">
                总支付金额:<span class="f-fr2"  style="color:#F00">￥${total}元</span>
            </li>
            <#list orders as order>
            <li class="mui-table-view-cell" index="${order_index + 1}" >
                <div class="mui-collapse-content">
                    <p><span style="margin-left: 25px">订单${order_index + 1}：</span>${order.orderSn}<span class="f-fr2">￥${order.totalAmount}元</span></p>
                </div>
            </li>
            </#list>
            <li class="mui-table-view-cell"  >
                <div class="mui-collapse-content">
                    <p>付款时需跳转至${payType["name"]}平台完成支付</p>
                </div>
            </li>
            <li class="mui-table-view-cell"  >
                <div class="mui-collapse-content">
                    <label><img width="125" height="28" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
                </div>
            </li>
            <li class="mui-table-view-cell">请支付 <span class="f-fr2" style="color:#F00">￥${total}元</span></li>
            <li>
                <input class="mui-btn mui-btn-block " style="color: #FFF;  border: 1px solid #E4393C; background-color: #E4393C;width: 90%;margin-left: 5%;margin-bottom: 20px;" id = "payBtn" type="button" value="确认支付"/>
            </li>
        </ul>
    <form id="paymentConfirm" method="POST" action="${base}/payment/confirm?whichclient=whichapp" style="display: none">
        <input type="hidden" id="whichclient" name="whichclient" value="whichapp" /><!--用于判断是移动端支付-->
        <input type="hidden" id="orderId" name="orderId" value="${order.id}" />
        <input type="hidden" id="orderSn" name="orderSn" value="${orderSn}" />
        <input type="hidden" id="payType" name="payType" value="${payType["sign"]}" />
        <input type="hidden" id="total" name="total" value="${total}"/>
    </form>
</div>
<#include "app/zx/tools.ftl">
<script>
    (function(mui, doc) {
        mui.init();
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }

        jQuery("#payBtn").bind("click",function(){
            showWaiting();
            jQuery("#paymentConfirm").submit();

            setTimeout(function(){
                closeWaiting();
            }, 200);
        });
    }(mui, document));

</script>
</body>
</html>