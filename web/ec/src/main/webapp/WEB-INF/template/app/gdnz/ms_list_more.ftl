<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/gdnz/head.ftl">
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

            background: #fff;
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
<header class="mui-bar mui-bar-nav bg_color_${grandCatelog.id}">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>首页
    </button>
    <h1 class="mui-title">限时秒杀</h1>
    <button type="button" id="jxgw" onclick="showRigthPanel()" class="mui-btn  mui-btn-link mui-btn-nav mui-pull-right" style="margin-right:0px; padding-left: 6px;">
        <span class="mui-icon mui-icon-right-nav"></span>商品分类
    </button>
</header>
<div class="mui-content" id="content" style="padding-bottom:58px; padding-top:50px;">
    <ul class="category-toolbar" style="z-index:1;">
        <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=sales&orderType=desc" <#if pager.orderBy=='sales' || pager.orderBy==''>style="color: red;"</#if>>销量</a></li>
        <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=scoreCount&orderType=desc" <#if pager.orderBy=='scoreCount'>style="color: red;"</#if>>人气</a></li>
        <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=price&orderType=<#if pager.orderBy=='createDate' || pager.orderType='asc'>desc<#else>asc</#if>"<#if pager.orderBy=='price'>style="color: red;"</#if>>价格<#if pager.orderBy=='price'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>
    </ul>
    <div class="ms_list">
        <ul>
            <li>
                <div class="face">
                    <a href="#"><img src="http://115.29.168.153/gwq/M00/01/6B/cx2omVcCM76ANlnWAAHec9u570o684.png@205w_224h.png"></a>
                    <div class="time-item">
                        <i></i>
                        <span class="day_show">0天</span>
                        <strong class="hour_show">0时</strong>
                        <strong class="minute_show">0分</strong>
                        <strong class="second_show">0秒</strong>
                    </div>


                </div>
                <div class="info">
                    <p><a href="#"> 【1罐】 PLATINUM A2白金系列高端婴幼儿牛奶粉 一段  900g</a></p>
                    <div class="extra">¥<span>330.00</span> </div>

                    <div class="pms_btn">
                        <a href="#" target="_blank">
                            <img src="${base}/static/app/gdnz/images/ms.png" alt="立即抢购" title="立即抢购">
                        </a>
                    </div>
                </div>
            </li>
            <li>
                <div class="face"><a href="#"><img src="http://115.29.168.153/gwq/M00/00/CC/cx2omVbnxneAIUIdAAOHoaHeDSA590.jpg@205w_224h.png"></a>
                    <div class="time-item">
                        <i></i>
                        <span class="day_show">0天</span>
                        <strong class="hour_show">0时</strong>
                        <strong class="minute_show">0分</strong>
                        <strong class="second_show">0秒</strong>
                    </div>

                </div>
                <div class="info">
                    <p><a href="#">  可莱斯NMF水库面膜</a></p>
                    <div class="extra">¥<span>72.00</span> </div>

                    <div class="pms_btn">
                        <a href="#" target="_blank">
                            <img src="${base}/static/app/gdnz/images/ms_2.png" alt="即将开始" title="即将开始">
                        </a>
                    </div>
                </div>
            </li>
            <li>
                <div class="face">
                    <a href="#"><img src="http://115.29.168.153/gwq/M00/01/6B/cx2omVcCM76ANlnWAAHec9u570o684.png@205w_224h.png"></a>
                    <div class="time-item">
                        <i></i>
                        <span class="day_show">0天</span>
                        <strong class="hour_show">0时</strong>
                        <strong class="minute_show">0分</strong>
                        <strong class="second_show">0秒</strong>
                    </div>


                </div>
                <div class="info">
                    <p><a href="#"> 【1罐】 PLATINUM A2白金系列高端婴幼儿牛奶粉 一段  900g</a></p>
                    <div class="extra">¥<span>330.00</span> </div>

                    <div class="pms_btn">
                        <a href="#" target="_blank">
                            <img src="${base}/static/app/gdnz/images/ms.png" alt="立即抢购" title="立即抢购">
                        </a>
                    </div>
                </div>
            </li>
            <li>
                <div class="face"><a href="#"><img src="http://115.29.168.153/gwq/M00/00/CC/cx2omVbnxneAIUIdAAOHoaHeDSA590.jpg@205w_224h.png"></a>
                    <div class="time-item">
                        <i></i>
                        <span class="day_show">0天</span>
                        <strong class="hour_show">0时</strong>
                        <strong class="minute_show">0分</strong>
                        <strong class="second_show">0秒</strong>
                    </div>

                </div>
                <div class="info">
                    <p><a href="#">  可莱斯NMF水库面膜</a></p>
                    <div class="extra">¥<span>72.00</span> </div>

                    <div class="pms_btn">
                        <a href="#" target="_blank">
                            <img src="${base}/static/app/gdnz/images/ms_2.png" alt="即将开始" title="即将开始">
                        </a>
                    </div>
                </div>
            </li>
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

<style>
    .right_panel{
        color: #fff;
        background: #333;
        position:fixed;
        z-index: 1001;
        top:0;
        bottom:0;
        width:70%;
        min-height:100%;
        visibility:visible;
        transform:translate(150%, 0px);
        -webkit-transform:translate(150%, 0px);
        -ms-transform:translate(150%, 0px);
        -moz-transform:translate(150%, 0px);
        -o-transform:translate(150%, 0px);
        transition:transform 200ms ease;

    }
    .right_panel_into{
        transform:translate(43%, 0px);
        -webkit-transform:translate(43%, 0px);
        -ms-transform:translate(43%, 0px);
        -moz-transform:translate(43%, 0px);
        -o-transform:translate(43%, 0px);
        transition:transform 200ms ease;
    }

    .mask{
        position:fixed;
        left:0;
        top:0;
        z-index:1000;
        height:100%;
        width:100%;
        background:black;
        opacity:0.4;
        filter:alpha(opacity=40)
    }
</style>

<div class="right_panel">
    <div style="right: 0;top: 0; position:absolute" onclick="hideRigthPanel()"><span class="mui-icon mui-icon-close"></span></div>
    <div  style="margin-bottom: 25px; color:#FFF;margin: 35px 15px 10px">
        <span class="mui-icon mui-icon-home" style="font-size:24px; color:#FFF;margin-left: 0;padding-right:10px;"> <a href="/ec/app_index" style="color:#FFF;font-family: 微软雅黑; font-size: 18px;">首页</a></span>
    </div>
    <ul class="mui-table-view mui-table-view-chevron mui-table-view-inverted" style="background-color: #333;height: 100%;overflow: auto">
    <#if refCatelogList?? && refCatelogList?size &gt; 0>
        <#list refCatelogList as cat>
            <#if cat.cateTypeFlage == 2>

                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right" style="color: #d8d8d8!important;"
                       href="${base}/list/whichapp/${cat.grandfather}-${cat.parentId}-${cat.id}.html?orderBy=sales&orderType=desc" title="${cat.name}">${cat.name}
                    </a>
                </li>

            <#elseif cat.cateTypeFlage ==1 >
                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right" style="color: #d8d8d8!important;"
                       href="${base}/list/whichapp/${cat.parentId}-${cat.id}.html?orderBy=sales&orderType=desc" title="${cat.name}">${cat.name}
                    </a>
                </li>
            <#else >
                <li class="mui-table-view-cell">
                    <a class="mui-navigate-right" style="color: #d8d8d8!important;"
                       href="${base}/list/whichapp/${cat.id}.html" title="${cat.name}?orderBy=sales&orderType=desc">${cat.name}
                    </a>
                </li>
            </#if>
        </#list>
    </#if>
    </ul>
</div>
<div class="mask" style="display: none" id="mask"></div>
<script>
    function showRigthPanel(){
        $(".mask").fadeIn();
        $(".right_panel").addClass("right_panel_into")
        $(document).bind('touchmove',function(e){
            e.preventDefault();
        });
    }
    function hideRigthPanel(){
        $(".mask").fadeOut(80);
        $(".right_panel").removeClass("right_panel_into");
        $(document).unbind()
    }
</script>
<#include "app/gdnz/tools.ftl">
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
        jQuery("#loadmore").html("<img src='${base}/static/app/gdnz/images/loading.gif'>");
        var pageNumber = parseInt(jQuery("#pageNumber").val())+1;
        //var url = "${base}/list/getPageDateForJson?catelogPath=8,804&pageNumber="+pageNumber;
        var url ="${base}/list/getPageDateForJson?whichclient=whichapp&catelogPath=${grandCatelog.id}<#if parentCatelog??>,${parentCatelog.id}</#if><#if catelog??>,${catelog.id}</#if><#if pager.orderBy??>&orderBy=${pager.orderBy}</#if>&pageNumber="+pageNumber;
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
                    //jQuery("#loadmore").html("点击加载更多");
                    jQuery("#pageNumber").val(data.pager.pageNumber);
                    jQuery.each(data.data, function(index, goods){
                        var item='<li>'+
                                '<div class="face">'+
                                '<a href="${base}/item/whichapp/'+goods.id+'.html" title="'+goods.fullName+'">'+
                                '<img attr="lazyload" src="${picloading}" data-original="'+goods.pic+'_200x150.png" alt="'+goods.name+'" >'+
                                '</a>'+
                                '</div>'+
                                '<div class="info">'+
                                '<p style="position: relative;">' +
                                '   <a  href="${base}/item/whichapp/'+goods.id+'.html"> '+goods.name+'</a>' +
                                '   <a href="#" style="padding-right: 0 !important;" class="add-gwc" goodsId="'+ goods.id + '"> <img src="${path}/images/add_gwc.png" style="width: 25px;  display: inline;"></a>' +
                                '</p>'+
                                '<div class="extra"><font style="padding-right:26px;">销量:'+ goods.sales+'</font><font>评论:' + goods.scoreCount + '</font></div>' +
                                '<div class="extra"><strong>￥'+fmoney(goods.price)+'</strong> <span>￥'+fmoney(goods.marketPrice)+'</span></div>'+
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

<script type="text/javascript">

    var intDiff = parseInt(60);//倒计时总秒数量

    function timer(intDiff){
        window.setInterval(function(){
            var day=0,
                    hour=0,
                    minute=0,
                    second=0;//时间默认值
            if(intDiff > 0){
                day = Math.floor(intDiff / (60 * 60 * 24));
                hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            $('.day_show').html(day+"天");
            $('.hour_show').html('<s id="h"></s>'+hour+'时');
            $('.minute_show').html('<s></s>'+minute+'分');
            $('.second_show').html('<s></s>'+second+'秒');
            intDiff--;
        }, 1000);
    }
    $(function(){
        timer(intDiff);
    });
</script>
<#include "app/gdnz/panel.ftl">
</body>
</html>