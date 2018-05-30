<!DOCTYPE html>
<html>

<head>
<#include "app/jd/head.ftl">
</head>
<!--页眉-->
<body style="background:#ffffe0;">

<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        购物车
    </div>
    <div id="slider" class="mui-slider" style="font-size:12px; color:#ffffe0; margin-top:30px;">
        <#if message=="success">
            <h3>商品已成功加入购物车！</h3>
            <span id="flashBuy" style="display:none">商品数量有限，请您尽快下单并付款！</span>
            <span><a id="GotoShoppingCart" href="${base}/cart/list?backurl=${backurl}&whichapp=whichapp" class="btn-pay">去结算</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${backurl}" class="btn-continue">继续购物</a></span>
        <#else>
             <h3>${message}</h3>
             <h3>添加失败</h3>
             <span><a id="GotoShoppingCart" href="${base}/cart/list?backurl=${backurl}&whichapp=whichapp" class="btn-pay">去结算</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${backurl}" class="btn-continue">继续购物</a></span>
        </#if>
    </div>
</header>