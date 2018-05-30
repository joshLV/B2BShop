<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/gwq/head.ftl">
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
        .settime{
            background: inherit;
            border-radius: 3px;
            width: inherit;
            margin-left: 5px;
        }
    </style>
    <style type="text/css">
        .prev-disabled, .next-disabled {
            pointer-events:none;
            color:#afafaf;
            cursor:default
        }
    </style>
    <script language="javascript">
        function timer(intDiff,obj){
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
                var time = day+"天";
                time += hour+'时';
                time += minute+'分';
                time += second+'秒';
                $(obj+' .settime').html(time);
                intDiff--;
            }, 1000);
        }
    </script>
</head>

<body>
<header class="mui-bar mui-bar-nav bg_color_${grandCatelog.id}">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">团购商品</h1>
</header>
<div class="mui-content" id="content" style="padding-bottom:58px; padding-top:50px;">
    <#--团购-->
    <div style="overflow: hidden; " id="JS_guess_you_like_list">
            <div class="widget" style="line-height: 40px; height: 40px;" >
                <div class="clearfix widgets-hd">
                    <span class="pull-left text-title J_Top"><a href="${base}/promotions/tg.html?catelogId=${catelog.id}&whichclient=whichapp">${catelog.name}</a></span>
                </div>
            </div>
            <#list pager.list as p>
            <div class="widget" id="${p.pgId}">
                <a href="${base}/item/whichapp/${p.goodsId}.html?mt=t&promotionsId=${p.id}"  class="com-wgt">
                    <div class="com-wp">
                        <div class="clearfix com-cnt">
                            <div class="com-pic"><img  alt="" style="width:130px;height:90px" class="" src="<#if p.url??>${imageUrl}${p.url}_130x90.png</#if>">
                            </div>
                            <div class="com-info clearfix">
                                <div class="com-title"><span>${p.goodsFullName}</span></div>
                                <div class="com-times">
                                    <em>距离<#if p.status == 'ing'>结束<#elseif p.status == 'before'>开始</#if>：</em>
                                    <div class="settime" endTime=""></div>
                                    <script type="text/javascript">
                                        $(function(){
                                            <#if p.status == 'ing'>
                                                timer(parseInt('${p.intervalEndTime}'),'#${p.pgId}');
                                            <#elseif p.status == 'before'>
                                                timer(parseInt('${p.intervalStartTime}'),'#${p.pgId}');
                                            </#if>
                                        });
                                    </script>
                                </div>
                                <div style="float: left;">
                                    <div class="origin-price"><i>¥</i><i class="money">${p.promotionsPrice}</i></div>
                                    <del class="old-price"><i>¥</i><i class="money">${p.price}</i></del>
                                </div>
                                <span class="<#if p.status == 'ing'>sale-stat<#elseif p.status == 'before'>sale-grey</#if> sale-count" onclick="location.href='${base}/item/${p.goodsId}.html?mt=t&promotionsId=${p.id}&whichclient=whichapp'">立即<br>抢购</span>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            </#list>
    <#--团购 end -->
    <div class="checkout_btn">
        <a id="loadmore" class="gray_btn mui-control-item" href="javascript:;" style="background-color:#F4F4F4;">点击加载更多</a>
    </div>
    <div id="buttom"></div>
    <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>

       <div class="return" >
           <a id="backToTop" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
       </div>
</div>





<#include "app/gwq/tools.ftl">
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
    var url ="${base}/promotions/tg.html?catelogId=${catelog.id}&whichclient=whichapp&pageNumber="+pageNumber;
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
                jQuery.each(data.data, function(index, p){
                    var s=c='';
                    if(p.status == 'ing'){
                        s='结束';
                        c='sale-stat';
                    }else if(p.status == 'before'){
                        s='开始';
                        c='sale-grey'
                    }
                    var item='<div class="widget" id="'+p.pgId+'">'+
                                '<a href="${base}/item/'+p.goodsId+'.html?mt=t&promotionsId='+p.id+'"  class="com-wgt">'+
                                    '<div class="com-wp">'+
                                        '<div class="clearfix com-cnt">'+
                                            '<div class="com-pic"><img  alt="" style="width:130px;height:90px" class="" src="${imageUrl}'+p.url+'_130x90.png">'+
                                            '</div>'+
                                            '<div class="com-info clearfix">'+
                                                '<div class="com-title"><span>'+p.goodsFullName+'</span></div>'+
                                                '<div class="com-times">'+
                                                    '<em>距离'+s+'：</em>'+
                                                    '<div class="settime" endTime=""></div>'+

                                                '</div>'+
                                                '<div style="float: left;">'+
                                                    '<div class="origin-price"><i>¥</i><i class="money">'+p.promotionsPrice+'</i></div>'+
                                                    '<del class="old-price"><i>¥</i><i class="money">'+p.price+'</i></del>'+
                                                '</div>'+
                                                '<span class="'+c+' sale-count" onclick="location.href=\'${base}/item/'+p.goodsId+'.html?mt=t&promotionsId='+p.id+'&whichclient=whichapp\'">立即<br>抢购</span>'+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'+
                                '</a>'+
                            '</div>';

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

<#include "app/gwq/panel.ftl">
</body>
</html>