
<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/ghj/head.ftl">
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
        /*top*/
        header{
            position: fixed;
            position: fixed;
            top: 0px;
            right: 0;
            left: 0;
            padding:8px 0;
            font-size:17px;
            height:30px;
            line-height:30px;
            z-index:10;text-align:center;
            background: #fff;border-bottom: 1px solid #ddd;box-shadow: 0 0 6px #ccc;}
        .logo{ position:absolute;left:10px;float:left;}
        .logo a{ color:#666;}
        .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
        .user{ position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
        .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/ghj/images/user.png) no-repeat; background-size: 20px
        20px;}

        .mtit{color:#444;}
        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghj/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:5px;}



    </style>
</head>

<body>

<header>
    <div class="logo"><a href="javascript:jumpto(fullpath + '/order/list?whichclient=whichapp');" class="ltext">返回</a></div>
    <div class="mtit">核对支付信息</div>
    <div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a></div>

</header>



<div class="mui-content" style="margin-top:48px;">
        <ul class="mui-table-view" >
            <li class="mui-table-view-cell mui-collapse">
                总支付金额:<span class="f-fr2"  style="color:#F00">￥${total}元</span>
            </li>
            <li class="mui-table-view-cell mui-collapse">
                本次支付金额:<span class="f-fr2"  style="color:#F00">￥${onlinePayAmount}元</span>
            </li>
            <#list orders as order>
            <li class="mui-table-view-cell" index="${order_index + 1}" >
                <div class="mui-collapse-content">
                    <p><span>订单${order_index + 1}：</span>${order.orderSn}<span class="f-fr2" style="color: #f00;">￥${order.totalAmount}元</span></p>
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
            <li class="mui-table-view-cell">请支付 <span class="f-fr2" style="color:#E4393C; font-weight: bold;">￥${onlinePayAmount}元</span></li>

            <a href="${base}/payment/popupconfirm?whichclient=whichapp" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单支付" id="orderpay"></a>
        </ul>

    <div class="mui-content-padded">
        <button class="mui-btn mui-btn-positive mui-btn-block mui-btn-primary" id = "payBtn">确认支付</button>
    </div>

    <form id="paymentConfirm" method="POST" action="${base}/payment/confirm?whichclient=whichapp" style="display: none">
    </form>

    <form id="paymentConfirmData">
        <input type="hidden" id="whichclient" name="whichclient" value="whichapp" /><!--用于判断是移动端支付-->
        <input type="hidden" id="orderId" name="orderId" value="${order.id}" />
        <input type="hidden" id="orderSn" name="orderSn" value="${orderSn}" />
        <input type="hidden" id="payType" name="payType" value="${payType["sign"]}" />
        <input type="hidden" id="total" name="total" value="${total}"/>
        <input type="hidden" id="payAmount" name="payAmount" value="${onlinePayAmount}"/>
        <input id="payAmountType" name="payAmountType" type="hidden" value="${payAmountType}">
    </form>
</div>
<#include "app/ghj/tools.ftl">
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