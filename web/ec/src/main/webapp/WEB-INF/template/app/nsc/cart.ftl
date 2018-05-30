<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <#assign path="${base}/static/app/nsc"/>
    <title>${goods.fullName} - <@spring.message "project_name"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <script src="${path}/js/mui.min.js" type="text/javascript"></script>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>

    <!--标准mui.css-->
    <link rel="stylesheet" href="${path}/theme/blue/mui.min.css">
    <link href="${path}/theme/red/my2.css" rel="stylesheet" />
    <link rel="stylesheet" href="${base}/static/mall/nsc/theme/red/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/theme/red/function.css"/>

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