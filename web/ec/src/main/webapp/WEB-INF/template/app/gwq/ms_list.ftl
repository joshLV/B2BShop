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
</header>
<div class="mui-content" id="content" style="padding-bottom:58px; padding-top:50px;">
        <div class="ms_list">
            <ul>
                <#list pager.list as p>
                <li id="${p.pgId}" >
                    <div class="face">
                        <a href="${base}/item/whichapp/${p.goodsId}.html?mt=m&promotionsId=${p.id}"><img src="<#if p.url??>${p.url}@205w_224h.png</#if>"></a>
                    </div>
                    <div class="info">
                        <div style="font-size: 14px;color: red">距离活动<#if p.status == 'ing'>结束<#elseif p.status == 'before'>开始</#if></div>
                        <div class="pms_time_interval" style="font-size: 14px;color: red" data-intervalEndTime="${p.intervalEndTime}"></div>
                        <p><a href="${base}/item/whichapp/${p.goodsId}.html?mt=m&promotionsId=${p.id}"> ${p.goodsFullName}</a></p>
                        <div class="extra">
                            <span style="font-size: 14px;">¥${p.promotionsPrice}</span>
                        </div>

                        <div class="pms_btn">
                            <a href="${base}/item/whichapp/${p.goodsId}.html?mt=m&promotionsId=${p.id}" >
                                <#if p.status == 'ing'>
                                    <img src="${base}/static/app/gwq/images/ms.png" alt="立即抢购" title="立即抢购">
                                <#elseif p.status == 'before'>
                                    <img src="${base}/static/app/gwq/images/ms_2.png" alt="即将开始" title="即将开始">
                                </#if>
                            </a>
                        </div>
                        <span style="font-size: 14px;color:#666;text-decoration:line-through;">¥${p.goodsPrice}</span>


                    </div>
                </li>
                    <script type="text/javascript">
                        $(function(){

                            <#if p.status == 'ing'>
                                timer(parseInt('${p.intervalEndTime}'),'#${p.pgId}');
                            <#elseif p.status == 'before'>
                                timer(parseInt('${p.intervalStartTime}'),'#${p.pgId}');
                            </#if>
                        });
                    </script>
                </#list>
            </ul>
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
</script>

<script type="text/javascript">
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
            $(obj+' .pms_time_interval').html(time);
            intDiff--;
            //秒杀开始时间到了就修改购买图标已经将时间换成距离秒杀结束多长时间
            if(intDiff<0){
                $(obj+' .pms_time_interval').parent().find("img").attr("src","${base}/static/app/gwq/images/ms.png");
                intDiff=$(obj+' .pms_time_interval').attr("data-intervalEndTime");
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
                $(obj+' .pms_time_interval').html(time);
                $(obj+' .pms_time_interval').prev().html("距离活动结束");
            }
        }, 1000);
    }
</script>
    <#include "app/gwq/panel.ftl">
</body>
</html>