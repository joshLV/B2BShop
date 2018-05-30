
<!DOCTYPE html>
<html>
<head>
    <#assign path="${base}/static/app/nsc"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>文昌农商场</title>
    <link href="${path}/theme/red/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${path}/theme/red/function.css">
    <link href="${path}/theme/red/my.css" rel="stylesheet" />
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        全部订单
    </div>

</header>
<div class="mui-content" style="padding-bottom:50px;">
    <ul id="list" class="mui-table-view mui-table-view-chevron">
        <#list orderList as order>
        <li class="mui-table-view-cell mui-media">
            <a class="mui-navigate-right" href="orderdetails .html">
                <#list orderItemList as orderitem>
                    <#if order.orderSn == orderitem.orderSn>
                    <#--<#if orderitem_index gt 0>-->
                        <a href="${base}/item/${orderitem.goodsId}.html,1" >
                            <img class="mui-media-object mui-pull-left" src="${orderitem.pic}">
                        </a>
                    <#--</#if>-->
                    </#if>
                </#list>

                <div class="mui-media-body"><span class="mui-ellipsis-2">${order.shipName}</span>
                    <p class="mui-ellipsis" style="color:#F00;">￥${order.totalAmount}</p>
                    <p class="mui-ellipsis">${order.createDate?string("yyyy-MM-dd HH:mm:ss")}</p>
                    <button class="mui-btn mui-btn-primary">
                        订单跟踪
                    </button>
                    <button class="mui-btn mui-btn-primary">
                        退货/换货
                    </button>
                </div>
            </a>
        </li>
        </#list>


    </ul>
</div>
<#include "app/nsc/tools.ftl">
<script src="${path}js/mui.min.js"></script>
<script src="${path}js/mui.enterfocus.js"></script>
<script src="${path}js/mui.lazyload.js"></script>
<script src="${path}js/mui.lazyload.img.js"></script>
</body>
</html>