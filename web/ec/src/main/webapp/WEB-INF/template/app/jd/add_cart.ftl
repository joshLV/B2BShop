<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/jd/head.ftl">
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">添加购物车</h1>
</header>
<div class="mui-content" style="margin-top:20px;">
    <div class="mui-content">
        <ul class="mui-table-view">
            <#if message=="success">
                <li class="mui-table-view-cell"><img src="${path}/images/cart.png" style="width:24px; margin-right:5px; float:left;">商品已成功加入购物车！ </li>
            <#else >
                <h3>${message}</h3>
            </#if>
                <li style="margin-left:10px" class="mui-table-view-cell">
                <button class="mui-btn-primary" style="margin-right:20px; background:#F90; border:#F90">
                    <a href="${backurl}">继续购物</a>
                </button>
                <button class="mui-btn-primary" style="margin-right:20px;">
                    <a href="${base}/cart/list?whichclient=whichapp">去购物车结算</a>
                </button>
            </li>
        </ul>
    </div>

</div>
<#include "app/jd/tools.ftl"/>
</body>
</html>