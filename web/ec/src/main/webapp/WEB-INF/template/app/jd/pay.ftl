
<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/jd/head.ftl">
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">在线支付</h1>
</header>
<div class="mui-content" style="margin-top:20px;">
    <div class="mui-content">
        <ul class="mui-table-view">
            <li class="mui-table-view-cell">请支付 <span class="f-fr" style="color:#F00">￥${order.totalAmount}</span></li>
            <li class="mui-table-view-cell">快捷支付</li>
            <li class="mui-table-view-cell">使用兴业银行信用卡(0102)<span class="f-fr"><a href="#">选择您的银行卡</a></span></li>
            <li class="mui-table-view-cell mui-input-row">安全码<input type="text" placeholder="卡背面三位数字" style="width:40%; border:none;"></li>
            <li><button class="mui-btn mui-btn-positive mui-btn-block mui-btn-primary">立即支付</button></li>
        </ul>
    </div>

</div>
<#include "app/jd/tools.ftl">
</body>
</html>