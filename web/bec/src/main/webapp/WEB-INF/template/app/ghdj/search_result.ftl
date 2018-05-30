<!DOCTYPE html>
<html>
<head>
<#include "app/ghdj/head.ftl">
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
            width: 33%;
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
            <li><a <#if pager.orderBy=="sales">style="color: red;" </#if>
                    href="${base}/search/s/${keyword}?whichclient=whichapp&orderBy=sales&pageNumber=${pager.pageNumber}&order=<#if pager.orderBy=='' || pager.orderType='desc'>asc<#else>desc</#if>">销量<#if pager.orderBy=='sales'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>

            <li><a <#if pager.orderBy=="price">style="color: red;" </#if>
                    href="${base}/search/s/${keyword}?whichclient=whichapp&orderBy=price&pageNumber=${pager.pageNumber}&order=<#if pager.orderBy=='' || pager.orderType='desc'>asc<#else>desc</#if>">价格<#if pager.orderBy=='price'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>

            <li><a <#if pager.orderBy=="scoreCount">style="color: red;" </#if>
                    href="${base}/search/s/${keyword}?whichclient=whichapp&orderBy=becScoreCount&pageNumber=${pager.pageNumber}&order=<#if pager.orderBy=='' || pager.orderType='desc'>asc<#else>desc</#if>">评价<#if pager.orderBy=='becScoreCount'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>

        </ul>

        <div class="guess-you-like" style="margin-top: 6px;">
            <ul id="JS_guess_you_like_list" class="clearfix">
            <#if list?size==0>
                <li style="width: 100%;font-size: 14px;text-align: center">没有找到符合的商品！</li>
            </#if>
            <#list list as gl>
                <li>
                    <div class="face">
                        <a href="${base}/item/whichapp/${gl.id}.html" title="${gl.fullName}">
                            <img attr="lazyload" src="${picloading}" data-original="${gl.pic}@220w_220h.png" alt="${gl.name}" >
                        </a>
                    </div>
                    <div class="info">
                        <p style="position: relative;"><a  href="${base}/item/whichapp/${gl.id}.html" style="width:calc(100% - 31px);"> ${gl.name}</a>
                            <!--<a href="#" style="padding-right: 0 !important;" goodsId="${gl.id}" class="add-gwc"> <img src="${path}/images/add_gwc.png" style="width: 25px;  display: inline;"></a>-->
                        </p>
                        <div class="extra"><font style="padding-right:26px;">销量:<#if gl.sales??>${gl.sales}<#else>0</#if></font><font>评论:<#if gl.scoreCount??>${gl.scoreCount}<#else>0</#if></font></div>
                        <div class="extra">
                                <strong class="nologin">仅会员可见！</strong>
                                <strong class="login" style="display: none">￥${gl.price?string('##0.00')}</strong> <span class="login" style="display: none">￥${gl.marketPrice?string('##0.00')}</span>
                        </div>
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
        <input type="hidden" id="orderBy" value="${pager.orderBy}"/>
        <input type="hidden" id="order" value="${pager.orderType}"/>
        <input type="hidden" id="orderType" value="${pager.orderType}"/>
    <div class="return" >
        <a id="backToTop" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
    </div>
</div>
<#include "app/ghdj/tools.ftl">
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    (function (mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        mui.back = function(){
            if("${from}" === "default"){
                jumpto(fullpath + "/app_index");
            }else if("${from}" === "brand_list"){
                jumpto(fullpath + '/shop/brandShop?pageSize=8&');
            }


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
    console.log("pageNumber-------------->"+pageNumber)
    var url ="${base}/search/getPageDateForJson?key=${keyword}&pageNumber="+pageNumber+"&orderBy=<#if pager.orderBy=='createDate' || pager.orderBy==''>createDate<#else>${pager.orderBy}</#if>&orderType=${pager.orderType}";
    jQuery.ajax({
        type: "post",
        url: url,
        data: {},
        datatype: 'json',
        success: function(data) {
            jQuery("#pageNumber").val(pageNumber);
            if(data.status == 'success'){
                if(typeof (data.data) == 'undefined' || data.data.length == 0){
                    jQuery("#loadmore").attr("style","background-color:#ddd")
                    jQuery("#loadmore").html("没有更多了");
                    loadop=false;
                    return;
                }
                jQuery("#pageNumber").val(data.pager.pageNumber);
                jQuery.each(data.data, function(index, goods){
                    var priceH='<div class="extra"><strong class="nologin">仅会员可见！</strong></div>';
                        priceH+='<div class="extra"><strong class="login" style="display: none">￥'+fmoney(goods.price)+'</strong> <span class="login" style="display: none">￥'+fmoney(goods.marketPrice)+'</span></div>';
                    var scoreCount=0;
                    if(typeof (goods.scoreCount)!='undefined'){
                        scoreCount=goods.scoreCount;
                    }
                    var item='<li>'+
                            '<div class="face">'+
                            '<a href="${base}/item/whichapp/'+goods.id+'.html" title="'+goods.fullName+'">'+
                            '<img attr="lazyload" src="${picloading}" data-original="'+goods.pic+'@200w_150h.png" alt="'+goods.name+'" >'+
                            '</a>'+
                            '</div>'+
                            '<div class="info">'+
                            '<p style="position: relative;">' +
                            '   <a  href="${base}/item/whichapp/'+goods.id+'.html"> '+goods.name+'</a>' +
                            //'   <a href="#" style="padding-right: 0 !important;" class="add-gwc" goodsId="'+ goods.id + '"> <img src="${path}/images/add_gwc.png" style="width: 25px;  display: inline;"></a>' +
                            '</p>'+
                            '<div class="extra"><font style="padding-right:26px;">销量:'+ goods.sales+'</font><font>评论:' + scoreCount + '</font></div>' +
                            priceH+
                            '</div>'+
                            '</li>';
                    $("#JS_guess_you_like_list").append(item);
                });
                //重新绑定图片延时加载
                lazyload();
                loginShowView();
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