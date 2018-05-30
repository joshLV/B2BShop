<!DOCTYPE html>
<html>
<head>
<#include "app/ghj/head.ftl">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style>
        .mui-margin {
            margin: 20px 10px 0px 10px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">订单信息异常</h1>
</header>
<div class="mui-content mui-margin">
    <div class="mui-content">
        <div class="mui-collapse-content">
            <p>订单信息异常，获取订单【${orderSn}】信息失败！请联系客服人员，协助处理。</p>
            <h5>订单号：${orderSn}</h5>
        </div>
        <ul class="mui-table-view mui-table-view-chevron">
            <li class="mui-table-view-cell">
                <a href="${base}/order/list?whichclient=whichapp" class="mui-navigate-right" >我的订单</a>
            </li>
        </ul>
    </div>
</div>
<#include "app/ghj/tools.ftl">

</body>
</html>