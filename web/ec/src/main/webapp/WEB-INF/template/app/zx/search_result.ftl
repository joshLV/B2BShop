<!DOCTYPE html>
<html>
<head>
<#include "app/zx/head.ftl">
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

        /*商品列表头部样式*/
        .category-toolbar { margin-top: -5px;
            height: 38px;

            background: #f7f7f7;
            border-bottom: solid 1px #d8d8d8;
            border-top: solid 1px #d8d8d8;
            display: -webkit-box;
            display: -moz-box;
            display: -o-box;
            display: -ms-box;
            position: relative;
        }
        .category-toolbar li {
            width: 25%;
            height: 38px;
            text-align: center;
            font-weight: bold;
        }
        .category-toolbar li img{ opacity: .4;}
        .category-toolbar li a {
            display: block;
            height: 38px;
            line-height: 38px;
            color: #666; font-size:14px;
        }
        .category-toolbar .current a {
            color: #da0000;
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
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">商品列表</h1>
</header>
<div class="mui-content" id="content" style="padding-bottom:58px; padding-top:50px;">

        <ul class="category-toolbar" style="z-index:1;">
            <li><a href="${base}/search/sa?keyword=${keyword}"<#if pager.orderBy=='createDate' || pager.orderBy==''>style="color: red;" </#if>>默认</a></li>
            <li><a <#if pager.orderBy=="sales">style="color: red;" </#if> href="${base}/search/sa?keyword=${keyword}&orderBy=sales&pageNumber=${pager.pageNumber}&orderType=<#if pager.orderBy=='' || pager.orderType='desc'>asc<#else>desc</#if>"<#if pager.orderBy=='price'>style="color: red;"</#if>">销量<#if pager.orderBy=='sales'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>
            <li><a <#if pager.orderBy=="scoreCount">style="color: red;" </#if> href="${base}/search/sa?keyword=${keyword}&orderBy=scoreCount&pageNumber=${pager.pageNumber}&orderType=<#if pager.orderBy=='' || pager.orderType='desc'>asc<#else>desc</#if>"<#if pager.orderBy=='price'>style="color: red;"</#if>">人气<#if pager.orderBy=='scoreCount'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>
            <li><a <#if pager.orderBy=="price">style="color: red;" </#if> href="${base}/search/sa?keyword=${keyword}&orderBy=price&pageNumber=${pager.pageNumber}&orderType=<#if pager.orderBy=='' || pager.orderType='desc'>asc<#else>desc</#if>"<#if pager.orderBy=='price'>style="color: red;"</#if>">价格<#if pager.orderBy=='price'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>
        </ul>

        <div class="guess-you-like" style="margin-top: 6px;">
            <ul id="JS_guess_you_like_list" class="clearfix">
            <#list list as gl>
                <li>
                    <div class="face">
                        <a href="${base}/item/whichapp/${gl.id}.html" title="${gl.fullName}">
                            <img attr="lazyload" src="${picloading}" data-original="${gl.pic}_200x150.png" alt="${gl.name}" >
                        </a>
                    </div>
                    <div class="info">
                        <p><a  href="${base}/item/whichapp/${gl.id}.html"> ${gl.name}</a></p>
                        <div class="extra"><font style="padding-right:26px;">销量:<#if gl.sales??>${gl.sales}<#else>0</#if></font><font>评论:<#if gl.scoreCount??>${gl.scoreCount}<#else>0</#if></font></div>
                        <div class="extra"><strong>${gl.price?string(priceCurrencyFormat)}</strong> <span>${gl.marketPrice?string(priceCurrencyFormat)}</span></div>
                    </div>
                </li>
            </#list>
            </ul>
        </div>

        <div class="checkout_btn">
            <a id="loadmore" class="gray_btn" class="mui-control-item" href="javascript:;" style="background-color:#ffffff;">点击加载更多</a>
        </div>
        <div id="buttom"></div>
        <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>

<#--        <div class="pages">
            &lt;#&ndash;下一页&ndash;&gt;
            <a href="${base}/search/sa?key=${keyword}&pageNumber=${pager.pageNumber + 1}&orderBy=${orderBy}&orderType=${orderType}"
               class="<#if pager.pageNumber == pager.pageCount>next-disabled<#else>pagesdown</#if>">>>
            </a>

            &lt;#&ndash;上一页&ndash;&gt;
            <a href="${base}/search/sa?key=${keyword}&pageNumber=${pager.pageNumber - 1}&orderBy=${orderBy}&orderType=${orderType}"
               class="<#if pager.pageNumber - 1 <= 0>next-disabled <#else> pagesup </#if>"><<
            </a>
        </div>-->
    <#--<div class="mui-content floors" style="background-color:#fff; ">
        <div class="floor-content">
            <ul class="f-cb">
                <#list goodslist as gl>
                    <li class="f-fl">
                        <div class="li-line">
                            <div class="goods-pic li-line">
                                <a href="${base}/item/whichapp/${gl.id}.html">
                                    <img class="lazy" src="${base}/static/mall/img/error-img.gif" data-original="${gl.pic}_128x114.png" alt="${gl.fullName}">
                                </a>
                            </div>
                            <div class="goods-name">
                                <a href="${base}/item/whichapp/${gl.id}.html">
                                    <#if gl.name?length gt 7>
                                        ${gl.name[0..6]}
                                    <#else >
                                        ${gl.name}
                                    </#if>
                                </a>
                            </div>
                            <div class="goods-price1">${gl.price?string(priceCurrencyFormat)}</div>
                            <div class="goods-price3">${gl.marketPrice?string(priceCurrencyFormat)}</div>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>
    </div>-->
    <div class="return" >
        <a id="backToTop" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
    </div>
</div>
<#include "app/zx/tools.ftl">
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    (function (mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        mui.back = function(){
            jumpto(fullpath + "/app_index");
        }
        //图片延时加载
        lazyload();
        //返回顶部
        jQuery('#backToTop').bind("tap", function(){
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });
    }(mui, document));

    function lazyload(){
        jQuery("img[attr='lazyload']").lazyload({
            threshold : 20,
            effect: "fadeIn",
            failure_limit : 1
        });
    }

    var loadop=true;
    var screenheight = window.screen.availHeight; //获取屏幕高
    $(window).scroll(function(){
    if ($(window).scrollTop()>100){
        $("#backToTop").fadeIn(500);
    }else{
        $("#backToTop").fadeOut(500);
    }
    var scr = $(window).scrollTop();
    var conH=document.getElementById("content").offsetHeight;//获取内如高度
    if(screenheight+scr>conH-100){
        if(loadop){
            loadData()
        }
    }
});
function loadData(){
    loadop=false;
    jQuery("#loadmore").html("<img src='${base}/static/app/zx/images/loading.gif'>");
    var pageNumber = parseInt(jQuery("#pageNumber").val())+1;
    var url ="${base}/search/getPageDateForJson?key=${keyword}&pageNumber="+pageNumber+"&orderBy=<#if pager.orderBy=='createDate' || pager.orderBy==''>createDate<#else>${pager.orderBy}</#if>&orderType=desc";
    jQuery.ajax({
        type: "post",
        url: url,
        data: {},
        datatype: 'json',
        success: function(data) {
            jQuery("#pageNumber").val(pageNumber)
            if(data.status == 'success'){
                if(typeof (data.data) == 'undefined' || data.data.length == 0){
                    jQuery("#loadmore").attr("style","background-color:#ddd")
                    jQuery("#loadmore").html("没有更多了");
                    loadop=false;
                    return;
                }
                jQuery("#pageNumber").val(data.pager.pageNumber);
                jQuery.each(data.data, function(index, goods){
                    var item='<li>'+
                            '<div class="face">'+
                            '<a href="${base}/item/whichapp/'+goods.id+'.html" title="'+goods.fullName+'">'+
                            '<img attr="lazyload" src="${picloading}" data-original="'+goods.pic+'_200x150.png" alt="'+goods.name+'" >'+
                            '</a>'+
                            '</div>'+
                            '<div class="info">'+
                            '<p><a  href="${base}/item/whichapp/'+goods.id+'.html"> '+goods.name+'</a></p>'+
                            '<div class="extra"><strong>'+goods.price+'</strong> <span>'+goods.marketPrice+'</span></div>'+
                            '</div>'+
                            '</li>';
                    $("#JS_guess_you_like_list").append(item);
                });
                //重新绑定图片延时加载
                lazyload();
                loadop=true;
            }else{
                jQuery("#loadmore").attr("style","background-color:#ddd")
                jQuery("#loadmore").html("加载失败，稍后再试");
            }
        },
        error:function(data){
            jQuery("#loadmore").attr("style","background-color:#ddd")
            jQuery("#loadmore").html("加载失败，稍后再试");
        }
    });
}


</script>
</body>
</html>