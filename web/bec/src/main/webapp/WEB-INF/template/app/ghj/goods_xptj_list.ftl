<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/ghj/head.ftl">
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
            width: 33.3%;
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
        .mui-bar .mui-btn{position: absolute;}
        .mui-title{ font-size: 17px; color: #444;}
    </style>
    <style type="text/css">
        .prev-disabled, .next-disabled {
            pointer-events:none;
            color:#afafaf;
            cursor:default
        }
        .mui-icon-back:before, .mui-icon-left-nav:before{ color: #666;}
    </style>
    <link rel="stylesheet" type="text/css" href="${path_skin}/cssnew.css">
</head>

<body>
<header class="mui-bar mui-bar-nav bg_color_${grandCatelog.id}">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>首页
    </button>
    <h1 class="mui-title"><#if catelog.id??>${catelog.name}<#elseif parentCatelog.id??>${parentCatelog.name}<#else>${grandCatelog.name}</#if></h1>
    <button type="button" id="jxgw" onclick="location.href='${base}/allSort?whichclient=whichapp'" class="mui-btn  mui-btn-link mui-btn-nav mui-pull-right" style="margin-right:0px; padding-left: 6px;">
        <span class="mui-icon mui-icon-right-nav"></span>商品分类
    </button>
</header>
<div class="mui-content" id="content" style="padding-bottom:58px; padding-top:44px;">
    <#--原先代码-->
    <#--<ul class="category-toolbar" style="z-index:1;">
           <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=sales&orderType=desc" <#if pager.orderBy=='sales' || pager.orderBy==''>style="color: red;"</#if>>销量</a></li>
           <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=scoreCount&orderType=desc" <#if pager.orderBy=='scoreCount'>style="color: red;"</#if>>人气</a></li>
           <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=price&orderType=<#if pager.orderBy=='createDate' || pager.orderType='asc'>desc<#else>asc</#if>"<#if pager.orderBy=='price'>style="color: red;"</#if>>价格<#if pager.orderBy=='price'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>
       </ul>
    <input type="hidden" value="${base}" id="basePath">
    <input type="hidden" value="${isLogin}" id="isLogin">
    <input type="hidden" value="${priceHide}" id="priceHide">
    <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
    <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
    <input type="hidden" value="${catelogPath}" id="catelogPath">
    <input type="hidden" value="${priceFlag}" id="priceFlag">
    <input type="hidden" value="${brandFlag}" id="brandFlag">
    <input type="hidden" name="orderBy" id="cur_orderBy" value="${pager.orderBy}"/>
    <input type="hidden" name="pageSize" id="cur_pageSize" value="${pager.pageSize}"/>
    <div class="guess-you-like" style="margin-top: 6px;">
        <ul id="JS_guess_you_like_list" class="clearfix">
        <#if goodslist?size==0>
            <li style="width: 100%;font-size: 14px;text-align: center">该分类没有商品，请查看其它分类！</li>
        </#if>
        <#list goodslist as gl>
            <li>
                <div class="face">
                    <a href="${base}/item/whichapp/${gl.id}.html" title="${gl.fullName}">
                        <img attr="lazyload" src="${picloading}" data-original="${gl.pic}@200x150.png" alt="${gl.name}" >
                    </a>
                </div>
                <div class="info">
                    <p style="position: relative;"><a  href="${base}/item/whichapp/${gl.id}.html" style="width: calc(100% - 31px);"> ${gl.name}</a>
                        <!--<a href="#" style="padding-right: 0 !important;" class="add-gwc"><img src="${path}/images/add_gwc.png" style="width: 25px;  display: inline;"></a>&ndash;&gt;
                    </p>
                    <div class="extra"><font style="padding-right:26px;">销量:<#if gl.sales??>${gl.sales}<#else>0</#if></font><font>评论:<#if gl.scoreCount??>${gl.scoreCount}<#else>0</#if></font></div>
                    <div class="extra">
                            <strong class="nologin">仅会员可见！</strong>
                            <strong class="login" style="display: none">￥${gl.price?string('##0.00')}</strong> <span>￥${gl.marketPrice?string('##0.00')}</span>
                    </div>
                </div>
            </li>
        </#list>
        </ul>
    </div>-->
<#--新品推荐列表  2016年11月23日 zyf-->
        <div class="newPro_list">
            <input type="hidden" value="${base}" id="basePath">
            <input type="hidden" value="${isLogin}" id="isLogin">
            <input type="hidden" value="${priceHide}" id="priceHide">
            <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
            <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
            <input type="hidden" value="${catelogPath}" id="catelogPath">
            <input type="hidden" value="${priceFlag}" id="priceFlag">
            <input type="hidden" value="${brandFlag}" id="brandFlag">
            <input type="hidden" name="orderBy" id="cur_orderBy" value="${pager.orderBy}"/>
            <input type="hidden" name="pageSize" id="cur_pageSize" value="${pager.pageSize}"/>
            <ul id="JS_guess_you_like_list">
                <#list goodslist as gl>
                    <li>
                        <p class="par_img">
                            <a  href="${base}/item/whichapp/${gl.id}.html" title="${gl.fullName}"><img attr="lazyload" src="${picloading}" data-original="${gl.pic}@200x150.png" alt="${gl.name}"></a>
                        </p>
                        <div class="newPro_list_txt">
                            <p class="par_txt">${gl.name}</p>
                            <div class="nologin">
                                <p class="par_price">
                                    <span class="par_price_l">商城价：<em>仅会员可见！</em></span>
                                    <span class="par_price_r">会员价：<em>仅会员可见！</em></span>
                                </p>
                            </div>
                            <div class="login" style="display: none">
                                <p class="par_price">
                                    <span class="par_price_l">商城价：<em>
                                        <#if gl.enableBatchPrice == '1'>￥${gl.batchPrice}
                                        <#else >
                                        ${gl.price?string("currency")}
                                        </#if>
                                    </em></span>
                                    <span class="par_price_r">会员价：<em>￥${gl.price?string('##0.00')}</em></span>
                                </p>
                            </div>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>









    <div class="checkout_btn">
        <a id="loadmore" class="gray_btn mui-control-item" href="javascript:;" style="background-color:#F4F4F4;">点击加载更多</a>
    </div>
    <div id="buttom"></div>
    <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>

       <div class="return" >
           <a id="backToTop" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
       </div>
</div>
<#include "app/ghj/tools.ftl">
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    (function (mui, doc) {
        jQuery(".face,.info").on('click',"a",function(){
            loadop=true;
            jQuery("#pageNumber").val(1);
        });
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
    var conH=document.getElementById("content").offsetHeight
    if(screenheight+scr> conH-100){
        if(loadop){
            loadData();
        }
    }
});
function fmoney (s, n) {
    if (!jQuery.isNumeric(s)) {
        return "0.00";
    }
    n = n > 0 && n <= 20 ? n : 2;
    s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
    var l = s.split(".")[0].split("").reverse();
    var r = s.split(".")[1];
    t = "";
    for(i = 0; i < l.length; i ++ )
    {
        t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
    }
    return t.split("").reverse().join("") + "." + r;
};
function loadData(){
    loadop=false;
    jQuery("#loadmore").html("<img src='${base}/static/app/gwq/images/loading.gif'>");
    var pageNumber = parseInt(jQuery("#pageNumber").val())+1;
    var url = "${base}/newArrivals/list_app_ajax";
    var data={
        cat:$("#catelogPath").val(),
        price:$("#priceFlag").val(),
        brand:$("#brandFlag").val(),
        goodsShortName:$("#goodsShortName").val(),
        shopName:$("#shopName").val(),
        pageNumber:pageNumber,
        pageSize:$("#cur_pageSize").val(),
        orderBy:$("#cur_orderBy").val(),
        orderType:$("#cur_orderType").val()
    };

    jQuery.ajax({
        type: "post",
        url: url,
        data: data,
        datatype: 'json',
        success: function(data) {
            jQuery("#pageNumber").val(pageNumber);
            if(data.status == 'success'){
                if(typeof (data.pager.list) == 'undefined' || data.pager.list.length == 0){
                    jQuery("#loadmore").attr("style","background-color:#ddd")
                    jQuery("#loadmore").html("没有更多了");
                    loadop=false;
                    return;
                }
                //jQuery("#loadmore").html("点击加载更多");
                jQuery("#pageNumber").val(data.pager.pageNumber);
                jQuery.each(data.pager.list, function(index, goods){
                    var priceH='<span class="par_price_l">商城价：<em>仅会员可见！</em></span><span class="par_price_r">会员价：<em>仅会员可见！</em></span></p>';
                    if('${priceHide}'!='hide'){
                        var scj=fmoney(goods.price);
                        if(goods.enableBatchPrice == '1'){
                            scj=fmoney(goods.batchPrice);
                        }

                        priceH='<p class="par_price"><span class="par_price_l">商城价：<em>'+scj+'</em></span><span class="par_price_r">会员价：<em>'+fmoney(goods.price)+'</em></span></p>'

                    }
                    var item='<li>'+
                                '<p class="par_img">'+
                                    '<a href=""><img attr="lazyload" src="${picloading}" data-original="'+goods.pic+'@200x150.png" alt="'+goods.name+'"></a>'+
                                '</p>'+
                                '<div class="newPro_list_txt">'+
                                    '<p class="par_txt">'+goods.name+'</p>'+
                                    '<div class="nologin">'+
                                        '<p class="par_price">'+
                                            '<span class="par_price_l">商城价：<em>仅会员可见！</em></span>'+
                                            '<span class="par_price_r">会员价：<em>仅会员可见！</em></span>'+
                                        '</p>'+
                                    '</div>'+
                                    '<div class="login" style="display:none">'+
                                        priceH
                                    '</div>'+
                                '</div>'+
                             '</li>';


                    $("#JS_guess_you_like_list").append(item);
                });
                //重新绑定图片延时加载
                lazyload();
                loginShowView()
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
$(function(){
    loginShowView()
});
</script>

</body>
</html>