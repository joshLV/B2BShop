
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/jd/head.ftl">
    <style>
        h5{
            padding-top: 8px;
            padding-bottom: 8px;
            text-indent: 12px;
        }

        .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body{
            font-size: 15px;
            margin-top:8px;
            color: #333;
        }

    </style>
    <style type="text/css">
        .prev-disabled, .next-disabled {
            pointer-events:none;
            color:#afafaf;
            cursor:default
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">商品列表</h1>
</header>
<div class="mui-content" style="padding-bottom:50px; padding-top:50px; background:#FFF;">
    <div class="r_pxfs"> <span>排序方式:</span>
        <div class="r_px"> <a href="#">默认</a> <a href="#">销量<img src="${path}/images/px_jt.jpg"></a> <a href="#">人气<img src="${path}/images/px_jt.jpg"></a> <a href="#">价格<img src="${path}/images/px_jt.jpg"></a> </div>
        <div class="pages">
            <#--下一页-->
            <a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber + 1}"
               class="<#if pager.pageNumber == pager.pageCount>next-disabled<#else>pagesdown</#if>"> &raquo;
            </a>

            <#--上一页-->
            <a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??> -${catelog.id}</#if>.html?pageNumber=${pager.pageNumber - 1}"
               class="<#if pager.pageNumber - 1 <= 0>next-disabled<#else>pagesup</#if>">&laquo;
            </a>

        </div>
    </div>
    <div class="mui-content floors" style="background-color:#fff; ">
        <div class="floor-content">
            <ul class="f-cb">
                <#list goodslist as gl>
                <li class="f-fl">
                    <div class="li-line">
                        <div class="goods-pic li-line"><a href="${base}/item/whichapp/${gl.id}.html"><img src="${gl.pic}_128x114.png" alt=""></a></div>
                        <div class="goods-name"><a href="${base}/item/whichapp/${gl.id}.html">${gl.fullName}</a></div>
                        <div class="goods-price1">${gl.price?string(priceCurrencyFormat)}</div>
                        <div class="goods-price3">${gl.marketPrice?string(priceCurrencyFormat)}</div>
                    </div>
                </li>
                </#list>
            </ul>
        </div>
    </div>
</div>
<#include "app/jd/tools.ftl">
</body>
</html>