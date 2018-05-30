<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/jp/head.ftl">
    <style>
        .mui-input-group:first-child {
            margin-top: 20px;
        }
        .mui-input-group label {
            width: 30%;
        }
        .mui-input-row label~input,
        .mui-input-row label~select,
        .mui-input-row label~textarea {
            width: 70%;
        }
        .mui-checkbox input[type=checkbox],
        .mui-radio input[type=radio] {
            top: 6px;
        }
        .mui-content-padded {
            margin-top: 25px;
        }
        .mui-btn {
            padding: 10px;
        }
        .mui-input-row label~input, .mui-input-row label~select, .mui-input-row label~textarea{
            margin-top: 1px;
        }
        .mui-content img{
            margin-top:30px;
            width: 100%;
            height: auto;
        }
        .mui-content button{
            width: 45%;
            margin: 0 0 5px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">交易成功</h1>
</header>
<div class="mui-content">

    <img src="${path}/images/trade_success.png">

    <div class="mui-content-padded">
        <button id='viewOrderdetail' class="mui-btn mui-btn-block mui-btn-primary f-fl" type="button">订单详情</button>
        <button id='reviewOrder' class="mui-btn mui-btn-block mui-btn-primary f-fr" type="button">立即评价</button>
    </div>
</div>
<script>
    (function(mui, doc) {
        mui.back = function(){
          jumpto("${base}/order/list?whichclient=whichapp");
        };
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }

        jQuery("#viewOrderdetail").bind("tap", function(){
            jumpto(fullpath + "/order/view/${order.id}?whichclient=whichapp");
        });
        jQuery("#reviewOrder").bind("tap", function(){
            jumpto(fullpath + "/order/review.html?sn=${order.orderSn}&orderId=${order.id}&whichclient=whichapp");
        });

    }(mui, document));
</script>
</body>
</html>