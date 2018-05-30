<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<#include "app/ghdj/head.ftl">
    <style>
        .tools2 {
            margin-top: 13px;
            padding-right: 15px;
            text-align: right;
            font-size: 14px;
            color: #444;
        }

        .score {
            float: right;
            padding-right: 15px;
            color: red;
            font-size: 17px;
            font-weight: bold;
        }
        .mui-icon-back:before, .mui-icon-left-nav:before{ color: #666;}
    </style>

</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        积分记录
    </div>
</header>
<div class="mui-content" id="content" style="padding-bottom:50px;">
    <div class="myorder" style="margin-top: 16px;">
    <#--新做订单列表-->

        <div class="viewport" id="tabs"
             style=" padding-left: 0!important; padding-right:0!important; width: 100%!important;">
            <div id="order01" class="order_list01">
            <#list vantagesList as list>
                <dl>
                    <div class="bh">
                        <div style="float:left;color:#555;">订单：<a
                                href="${base}/order/view/${list.orderId}.html?whichclient=whichapp"
                                style="color:#555;">${(list.orderSn)!}</a></div>
                        <div class="score"><#if list.score &gt; 0>+</#if>${(list.score)!}</div>
                    </div>
                    <dd>
                        <div class="tools" style="float:left;margin-top: -3px;">
                            <a href="javascript:;" class="JS_order_btn ">${(list.flag==1)?string('购买商品送积分','退款扣积分')}</a>
                        </div>
                        <div class="tools2"><span>${(list.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</span></div>
                    </dd>
                </dl>
            </#list>
            </div>
        </div>

    <#--加载更多订单-->

        <div class="checkout_btn">
            <a id="loadmore" class="gray_btn mui-control-item" href="#buttom"  style="background-color:#F4F4F4;">加载更多</a>
        </div>
        <div id="buttom"></div>

        <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
        <input type="hidden" id="pageCount" value="${pager.pageCount}"/>
        <input type="hidden" id="pageSize" value="${pager.pageSize}"/>
        <input type="hidden" id="orderBy" value="${pager.orderBy}"/>
        <input type="hidden" id="orderType" value="${pager.orderType}"/>
        <input type="hidden" id="currStatus" value="${currStatus}"/>

        <div id="template" style="display:none">
            <dl>
                <div class="bh">
                    <div style="float:left;color:#555;">订单：<a href="#" style="color:#555;">5110358063443378</a>
                    </div>
                    <div class="score">+490</div>
                </div>
                <dd>
                    <div class="tools" style="float:left;margin-top: -3px;">
                        <a href="javascript:;" class="JS_order_btn ">查看订单</a>
                    </div>
                    <div class="tools2"><span style="color:#888;">2015-10-10 10:10:10</span></div>
                </dd>
            </dl>
        </div>
    </div>


    <div class="return">
        <a id="backToTop" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
    </div>

<#include "app/ghdj/tools.ftl">
    <script>
        (function (mui, doc) {
            mui.back = function () {
                jumpto(fullpath + "/member/index?whichclient=whichapp");
            };
            mui.init({
                statusBarBackground: '#ffffff'
            });
            if (ismobile) {
                mui.plusReady(function () {
                    //关闭等待框
                    plus.nativeUI.closeWaiting();
                    //显示当前页面
                    plus.webview.currentWebview().show();
                });
            }
            fmoney = function (s, n) {
                if (!jQuery.isNumeric(s)) {
                    return "0.00";
                }
                n = n > 0 && n <= 20 ? n : 2;
                s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
                return s;
            };
            decodeScoreRecordStatus = function (flag) {
                if (parseInt(flag) == 1) {
                    return "购买商品送积分";
                }
                else {
                    return "退款扣积分"
                }
            };
            leftPad = function (tbl) {
                return function (num, n) {
                    return (0 >= (n = n - num.toString().length)) ? num : (tbl[n] || (tbl[n] = Array(n + 1).join(0))) + num;
                }
            }([]);
            dateFormat = function (now) {
                var date = new Date(now)
                var year = date.getFullYear();
                var month = date.getMonth() + 1;
                var day = date.getDate();
                var hour = date.getHours();
                var minute = date.getMinutes();
                var second = date.getSeconds();
                return year + "-"
                        + leftPad(month, 2) + "-"
                        + leftPad(day, 2) + " "
                        + leftPad(hour, 2) + ":"
                        + leftPad(minute, 2) + ":"
                        + leftPad(second, 2);
            };

            decodeScore = function (score) {
                if (parseInt(score) > 0) {
                    return '+' + score;
                } else {
                    return score;
                }
            };




            jQuery('#backToTop').bind("tap", function () {
                jQuery('html,body').animate({scrollTop: '0px'}, 100);
            });
        }(mui, document));
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
        function loadData(){
            loadop=false;
            jQuery("#loadmore").html("<img src='${base}/static/app/gwq/images/loading.gif'>");
            var pageNumber = parseInt(jQuery("#pageNumber").val());
            var pageCount = parseInt(jQuery("#pageCount").val());
            var pageSize = parseInt(jQuery("#pageSize").val());
            var orderBy = parseInt(jQuery("#orderBy").val());
            var orderType = parseInt(jQuery("#orderType").val());
            var currStatus = jQuery("#currStatus").val();

            pageNumber = pageNumber + 1;
            var url = fullpath + "/member/vantages/ajax/loadmore";
            jQuery.ajax({
                type: "post",
                url: url,
                data: {
                    'pageNumber': pageNumber,
                    'pageSize': pageSize,
                    'orderBy': orderBy,
                    'orderType': orderType,
                    'status': currStatus
                },
                datatype: 'json',
                success: function (data) {

                    if (data.status == 'success') {
                        if (typeof(data.list) == 'undefined' || data.list.length == 0) {
                            jQuery("#loadmore").attr("style","background-color:#ddd")
                            jQuery("#loadmore").html("没有更多的积分记录了");
                            loadop=false;
                            return;
                        }

                        jQuery("#pageNumber").val(data.pager.pageNumber);
                        jQuery("#pageCount").val(data.pager.pageCount);
                        jQuery("#pageSize").val(data.pager.pageSize);
                        jQuery("#orderBy").val(data.pager.orderBy);
                        jQuery("#orderType").val(data.pager.orderType);

                        jQuery.each(data.list, function (index, scoreRecord) {
                            // -----create templatedl-----
                            var templatedl = jQuery("#template > dl").clone();
                            jQuery(templatedl).find(".bh").find("A").prop('href', fullpath + '/order/view/' + scoreRecord.orderId + '.html?whichclient=whichapp')
                                    .prop('innerText', scoreRecord.orderSn);
                            jQuery(templatedl).find(".score").prop('innerText', decodeScore(scoreRecord.score));
                            jQuery(templatedl).find(".tools").find('A').prop('innerText', decodeScoreRecordStatus(scoreRecord.flag));
                            jQuery(templatedl).find(".tools2").find("SPAN").prop('innerText', dateFormat(scoreRecord.createDate));
                            if( jQuery("#order01 > dl").size() <= 0 ){
                                jQuery("#order01").append(templatedl);
                            }
                            jQuery("#order01 > dl").last().after(templatedl);
                        });
                        loadop=true;
                        jQuery("#loadmore").attr("style","background-color:#F4F4F4")
                        jQuery("#loadmore").html("上拉加载更多");
                    } else {
                        jQuery("#loadmore").attr("style","background-color:#ddd")
                        jQuery("#loadmore").html("加载失败，稍后再试");
                    }
                },
                error: function (data) {
                    jQuery("#loadmore").attr("style","background-color:#ddd")
                    jQuery("#loadmore").html("加载失败，稍后再试");
                }
            });
        }
    </script>
</body>
</html>