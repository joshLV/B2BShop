
<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/gdnz/head.ftl">
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
            color: #ea5313;
            background-size: 17px;
        }
    </style>
    <style>
        .f-fr2 {
            padding-left: 5px;
        }

        .pay-result {
            width: 45%;
            font-weight: bold;
        }

        .layer-div {
            margin: 50% 2% 0 2%;
        ;
            border: 1px solid #A9A9A9;
            height: 200px;
            width: 96%;
            background-color: #F8F8F8;
            position: absolute;
        }

        .layer-title {
            height: 30px;
            background-color: #FE0000;
            padding: 5px 0 0 5px;
            color: #fff;
            font-weight: bold;
        }

        .layer-div p {
            text-align: center;
            margin-top: 20px;
            color: #333;
            font-weight: bold;
        }

        .mui-bar .mui-title {
            font-size: 18px;
            color: #FFFFFF;
            font-family: "微软雅黑";
            left: 40px;
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
            <li class="mui-table-view-cell" index="${order_index + 1}"  >
                <div class="mui-collapse-content">
                    <p><span style="margin-left: 25px">订单：</span>${order.orderSn}<span class="f-fr2">￥${order.totalAmount}元</span></p>
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
                <input class="mui-btn mui-btn-block " style="color: #FFF;  border: 1px solid #ea5313; background-color: #ea5313;width: 90%;margin-left: 5%;margin-bottom: 20px;" id = "payBtn" type="button" value="确认支付"/>
                <!--<input class="mui-btn mui-btn-block " style="color: #FFF;  border: 1px solid #85C226; background-color: #85C226;width: 90%;margin-left: 5%;margin-bottom: 20px;" id = "payBtn" type="button" value="确认支付"/>-->
                <button class="mui-btn mui-btn-positive mui-btn-block mui-btn-primary" style="display: none" onclick="payApp('${orderSn}','${payType["sign"]}')" id="payBtn_app">确认支付</button>

            </li>
        </ul>

    <#--<form id="paymentConfirmData">-->
        <#--<input type="hidden" id="whichclient" name="whichclient" value="whichapp" /><!--用于判断是移动端支付&ndash;&gt;-->
        <#--<input type="hidden" id="orderId" name="orderId" value="${order.id}" />-->
        <#--<input type="hidden" id="orderSn" name="orderSn" value="${orderSn}" />-->
        <#--<input type="hidden" id="payType" name="payType" value="${payType["sign"]}" />-->
        <#--<input type="hidden" id="total" name="total" value="${total}"/>-->
    <#--</form>-->
    <form id="paymentConfirm" method="POST" action="${base}/payment/confirm?whichclient=whichapp" style="display: none">
        <input id="whichclient" name="whichclient" type="text" value="whichapp" /><br><!--用于判断是移动端支付-->
        <input id="orderId" name="orderId" type="text" value="${order.id}" /><br>
        <input id="orderSn" name="orderSn" type="text" value="${orderSn}" /><br>
        <input id="payType" name="payType" type="text" value="${payType["sign"]}" />
        <input type="hidden" id="total" name="total" value="${total}"/>
    </form>
</div>
<div id="layerHtml" style="display: none;">
    <div class="layer-div">
        <div class="layer-title">付款提示</div>
        <p>请您在新打开的支付页面完成付款！<br>付款完成前不要关闭此窗口，<br>完成付款后请根据您的情况点击下面的按钮：</p>
        <div class="mui-content-padded">
            <button class="mui-btn mui-btn-block mui-btn-primary f-fl pay-result" type="button" onclick="window.location.href ='${base}/order/view/${order.id}?whichclient=whichapp'">支付成功</button>
            <button class="mui-btn mui-btn-block mui-btn-primary f-fr pay-result" type="button" onclick="window.location.href ='${base}/order/view/${order.id}?whichclient=whichapp'">支付失败</button>
        </div>
    </div>
</div>
<#include "app/gdnz/tools.ftl">
<script>



    var path='${path}';
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
        if (!isWeiXin()) {
//            popAlert('当前环境不支持微信支付,请在微信浏览器中支付!');
            jQuery("#payBtn").hide();
            loadJsFile('${path}/js/pay/pay_base.js')
            jQuery("#payBtn_app").show();
        }
        function loadJsFile(path){
            var oHead = document.getElementsByTagName('HEAD').item(0);
            var oScript= document.createElement("script");
            oScript.type = "text/javascript";
            oScript.src=path;
            oHead.appendChild(oScript);
        }
        jQuery("#payBtn").bind("click",function(){
            showWaiting();

            jQuery("#paymentConfirm").attr("action",jQuery("#paymentConfirm").attr("action") + "&" + jQuery("#paymentConfirmData").serialize());
            jQuery("#paymentConfirm").submit();

            setTimeout(function(){
                closeWaiting();
            }, 200);
        });
    }(mui, document));
</script>
</body>
</html>