<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<#include "app/gwq/head.ftl">
<style>
    .tools2 {
        margin-top: 13px;
        padding-right: 15px;
        text-align: right;
        font-size: 14px;
        color: #444;
    }
</style>

</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        我的订单
    </div>
</header>
<div class="mui-content" id="content" style="padding-bottom:50px;">
    <div class="myorder" style="margin-top: 16px;">
<#--新做订单列表-->


    <div class="viewport" id="tabs" style=" padding-left: 0!important; padding-right:0!important; width: 100%!important;">
        <ul class="order-filter">
            <li><a name="all" class="mui-control-item <#if ! currStatus?exists>current</#if>" href="#">全部</a></li>
            <li><a name="wait_buyer_pay" class="mui-control-item <#if currStatus=="wait_buyer_pay">current</#if>" href="#">待付款<em>${orderFuKuanCount}</em></a></li>
            <li><a name="wait_seller_send_goods" class="mui-control-item <#if currStatus=="wait_seller_send_goods">current</#if>" href="#">待发货<em>${orderFaHuoCount}</em></a></li>
            <li><a name="wait_buyer_confirm_goods" class="mui-control-item <#if currStatus=="wait_buyer_confirm_goods">current</#if>" href="#">待收货<em>${orderConfirmCount}</em></a></li>
            <li><a name="trade_finished" class="mui-control-item <#if currStatus=="trade_finished">current</#if>" href="#">已收货<em>${orderOverCount}</em></a></li>
        </ul>
        <div id="order01" class="order_list01">

        <#list orderList as order>
        <dl title="${order.orderStatus}">
            <div class="bh">
                <div style="float:left;">订单编号：<a href="${base}/order/view/${order.id}?whichclient=whichapp">${order.orderSn}</a></div>
                <div style="float:right; padding-right:15px; color:#999;">
                    <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                        <strong style="font-weight: normal;">${orderStatusMapping['${order.orderStatus}']}</strong>
                    <#else>
                        ${orderStatusMapping['${order.orderStatus}']}
                    </#if>
                </div>

            </div>
            <dt>
            <div class="order-state"><span>收货人：${order.shipName}</span></div>
            <div class="order-time"> ${order.createDate?string("yyyy-MM-dd")}&nbsp;${order.createDate?string("HH:mm:ss")}</div>
            </dt>
            <dd>
                <#assign goodsCount = 0>
                <#list orderItemList as orderitem>
                    <#if order.orderSn == orderitem.orderSn>
                    <#assign goodsCount = goodsCount + orderitem.quantity>
                        <div class="order-goods">
                            <div class="face"><a href="${base}/order/view/${order.id}?whichclient=whichapp"><img src="${orderitem.pic}_150x150.png"></a></div>
                            <div class="info"> <a href="${base}/order/view/${order.id}?whichclient=whichapp">${orderitem.goodsName}</a>
                                <h4>￥${orderitem.goodsPrice?string('##0.00')}</h4>
                                <p>x${orderitem.quantity}</p>
                            </div>
                        </div>
                    </#if>
                </#list>
                <div class="tools2"><span>总计：</span><font style="color: #E4393C;">￥${order.totalAmount?string('##0.00')}</font>&nbsp;&nbsp;<span style="color: #888;">(运费：<font style="color: #E4393C;">￥${order.deliveryFee?string( '##0.00' )}</font>)</span>&nbsp;&nbsp;共<font style="color: #E4393C; padding: 0 2px;">${goodsCount}</font>件</div>
                <div class="tools">
                    <#if '${order.isRefund }'== 'N'>
                        <#if '${order.orderStatus}' == 'order_item_exception'>
                            <span style="color:#fc9836;">订单项异常，请重新购买</span>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_pay'>
                            <a class="JS_order_btn pay"
                            <a href="javascript:void(0)" onclick="pay('${order.orderSn}', '${order.totalAmount}', '${order.id}')" class="JS_order_btn ">付&nbsp;款</a>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                            <a href="javascript:void(0)" onclick="confirmGoods('${order.id}')" class="JS_order_btn ">确认收货</a>
                        <#elseif '${order.orderStatus}' == 'trade_finished'>
                            <#if '${order.isReview}' == '0'>
                                <a href="javascript:void(0)" onclick="reviewOrder('${order.orderSn}', '${order.id}')" class="JS_order_btn ">评&nbsp;价</a>
                            <#else >
                                <label>已评价</label>
                            </#if>
                        <#elseif '${order.orderStatus}' == 'unconfirm'>

                            <a href="javascript:void(0)" onclick="cancelOrder('${order.id}')" class="JS_order_btn ">取消订单</a>
                            <#--a href="${base}/order/popupcancel/${order.id}&whichclient=whichapp" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" class="JS_order_btn ">取消订单</a-->
                        </#if>

                        <a href="javascript:void(0)" onclick="viewOrderDetail('${order.id}')" class="JS_order_btn ">查&nbsp;看</a>
                        <#if (order.paymentMethodName == '在线支付' && order.orderStatus == 'wait_buyer_pay') || (order.paymentMethodName == '货到付款' && order.orderStatus == 'wait_seller_send_goods')>
                            <a href="javascript:void(0)" onclick="cancelOrder('${order.id}')" class="JS_order_btn ">取消订单</a>
                        </#if>
                        <#if '${order.paymentStatus}'== 'paid'>
                            <a href="javascript:void(0)" onclick="checkurl('${order.orderSn}');" class="JS_order_btn ">退&nbsp;款</a>
                        </#if>
                        <#if '${order.paymentStatus}'== 'refunding'>
                            <a href="javascript:void(0)" id="${order.orderSn}"  onclick="confirmReceivables('${order.orderSn}');" class="JS_order_btn ">确认收款</a>
                        </#if>
                        <#--<#if '${order.paymentStatus}'== 'refunded'>
                            <a href="javascript:void(0)" >退款完成</a>
                        </#if>-->
                        <#--<#if ('${order.orderStatus}' == 'wait_buyer_confirm_goods' || '${order.orderStatus}' == 'trade_finished') && order.paymentMethodName == '在线支付'>
                            <a href="javascript:;" onclick="showExpressLog('${order.id}');" class="JS_order_btn ">物流信息</a>
                        </#if>-->
                    </#if>
                    <#--<#if '${order.isRefund }'== 'Y'>
                        <#if '${order.orderRefund.status}'== 'refunded'>
                            <a href="javascript:void(0)" id="${order.orderSn}"  onclick="confirmReceivables('${order.orderSn}');" class="JS_order_btn ">确认收款</a>
                        <#else>
                            <a href="javascript:void(0)" onclick="refundList('${order.orderSn}');" class="JS_order_btn ">退款单</a>
                        </#if>
                    </#if>-->
                    <!-- 20151210 退款单处理 -->
                    <#if '${order.isRefund }'== 'Y'>
                    <#--${order.currRefundId}-${order.refundCount}-${order.orderStatus}-->
                        <#if order.orderRefund.status== 'refunded'>
                            <a href="javascript:void(0)"  onclick="confirmReceivables('${order.orderSn}');" class="JS_order_btn ">确认收款</a>
                        <#else>
                            <#--<#if (order.refundCount &gt; 1 || order.refundCount == 1 ) && order.refundCount&lt;3 && order.currRefundId?? >
                                <a href="javascript:void(0)" onclick="nextRefund('${order.orderSn}');" class="JS_order_btn ">申请退款</a>
                            </#if>-->
                        <#--<#if order.refundCount == 3 && !(order.currRefundId??)>-->
                            <#if order.refundCount == 3>
                                <#if order.orderStatus == 'wait_buyer_confirm_goods'>
                                    <a href="javascript:void(0)" onclick="confirmGoods('${order.id}')" class="JS_order_btn ">确认收货</a>
                                <#elseif order.orderStatus == 'trade_finished'>
                                    <#if order.isReview == '0'>
                                        <a href="javascript:void(0)" onclick="reviewOrder('${order.orderSn}', '${order.id}')" class="JS_order_btn ">评&nbsp;价</a>
                                    <#else >
                                        <label>已评价</label>
                                    </#if>
                                </#if>
                            </#if>
                            <a href="javascript:void(0)" onclick="refundList('${order.orderSn}');" class="JS_order_btn ">退款单</a>
                        </#if>
                    </#if>
                </div>

            </dd>
        </dl>
        </#list>
        </div>
    </div>

<#--加载更多订单-->

    <div class="checkout_btn">
        <a id="loadmore" class="gray_btn mui-control-item"href="#buttom" style="background-color:#F4F4F4;">上拉加载更多</a>
    </div>
    <div id="buttom"></div>

    <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
    <input type="hidden" id="pageCount" value="${pager.pageCount}"/>
    <input type="hidden" id="pageSize" value="${pager.pageSize}"/>
    <input type="hidden" id="orderBy" value="${pager.orderBy}"/>
    <input type="hidden" id="orderType" value="${pager.orderType}"/>
    <input type="hidden" id="currStatus" value="${currStatus}" />
    <div id="template" style="display:none">
        <dl>
            <div class="bh">
                <div style="float:left;">订单编号：<a href="#">5110358063443378</a></div>
                <div style="float:right; padding-right:15px; color:#999;">待付款</div>
            </div>
            <dt>
            <div class="order-state"><span>收货人：</span>张三</div>
            <div class="order-time">2015-11-04 11:50:18</div>
            </dt>
            <dd>
                <#-- 商品DIV
                  <div class="order-goods">
                    <div class="face"><a href="${base}/order/view/${order.id}?whichclient=whichapp"><img src="http://192.168.1.9:80/ec/M00/00/49/wKgBCVXtNDKAEaOHAAQapDtmhLE820.jpg"></a></div>
                    <div class="info"> <a href="${base}/order/view/${order.id}?whichclient=whichapp">东芝导航K310(黑色)汽车车载GPS导航仪测速一体机 正版地图三年免费不限次数升级</a>
                        <h4>¥6710</h4>
                        <p>共3件</p>
                    </div>
                </div> -->

                <div class="tools2"><span>总计：</span>¥6710 共3件</div>
                <div class="tools">
                    <#--
                    <a href="javascript:;" class="JS_order_btn pay" data-orderid="1620033">付款</a>
                    <a href="javascript:;" class="JS_order_btn " data-orderid="1620033">取消订单</a>
                    <a href="javascript:;" class="JS_order_btn " data-orderid="1620033">查看订单</a>-->
                </div>
            </dd>
        </dl>
        <#-- 商品DIV -->
        <div class="order-goods">
            <div class="face"><a href="#"><img src="${picloading}"></a></div>
            <div class="info"> <a href="#">东芝导航</a>
                <h4>¥6710</h4>
                <p>共3件</p>
            </div>
        </div>
    </div>
</div>

    <div class="return" >
        <a id="backToTop" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
    </div>

<#include "app/gwq/tools.ftl">
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
            var l = s.split(".")[0].split("").reverse();
            var r = s.split(".")[1];
            t = "";
            for(i = 0; i < l.length; i ++ )
            {
                t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
            }
            return t.split("").reverse().join("") + "." + r;
        };
        decodeOrderStatus = function (orderStatus) {
            if (orderStatus == "unconfirm")  return "未确认";
            if (orderStatus == "cancel")  return "已取消";
            if (orderStatus == "invalid")  return "已作废";
            if (orderStatus == "wait_buyer_pay")  return "等待付款";
            if (orderStatus == "wait_seller_send_goods")  return "等待发货";
            if (orderStatus == "wait_buyer_confirm_goods")  return "等待收货";
            if (orderStatus == "trade_finished")  return "交易完成";
            if (orderStatus == "refund_part")  return "部分退款";
            if (orderStatus == "refund_success")  return "全额退款";
            if (orderStatus == "reship_part")  return "部分退货";
            if (orderStatus == "reship_success")  return "已退货";
            if (orderStatus == "deleted")  return "已删除";
            if (orderStatus == "refunding")  return "退款中";
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
        }

        jQuery(".order-filter a").bind("tap", function (e) {
            showWaiting();

            var pageNumber = parseInt(jQuery("#pageNumber").val());
            var pageCount = parseInt(jQuery("#pageCount").val());
            var pageSize = parseInt(jQuery("#pageSize").val());
            var orderBy = parseInt(jQuery("#orderBy").val());
            var orderType = parseInt(jQuery("#orderType").val());


            var e_target = e.target;
            if (typeof(e_target) == 'undefined') {
                closeWaiting();
                return;
            }
            if (!jQuery(e_target).is("a")) {
                if (jQuery(e_target).parent().is("a")) {
                    e_target = jQuery(e_target).parent();
                } else {
                    closeWaiting();
                    return;
                }
            }


            if (jQuery(e_target).hasClass("current")) {
                closeWaiting();
                return;
            }
            jQuery.each(jQuery(".order-filter a"), function (index, filter) {
                jQuery(filter).removeClass("current");
                jQuery(filter).removeClass("mui-action");
            });
            jQuery(e_target).addClass("current");
            var e_target_name = jQuery(e_target).attr('name');
            if (e_target_name == 'all') {
                jumpto(fullpath + "/order/list?whichclient=whichapp");
                /*
                jQuery("#order01 > dl").show();
                */
            } else {
                jumpto(fullpath + "/order/list?status=" + e_target_name + "&whichclient=whichapp");
                /*
                jQuery("#order01 > dl[title!='" + e_target_name + "']").hide();
                jQuery("#order01 > dl[title='" + e_target_name + "']").show();
                */
            }

        });

        jQuery('#backToTop').bind("tap", function(){
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
        var conH=document.getElementById("content").offsetHeight;//获取内如高度
        if(screenheight+scr>conH-100){
            var orderCount = jQuery("#order01").find("dl").length;
            var pageNumber = parseInt(jQuery("#pageNumber").val());
            var pageCount = parseInt(jQuery("#pageCount").val());
            var pageSize = parseInt(jQuery("#pageSize").val());
            console.log("---------------------------", loadop);
            console.log("orderCount", orderCount);
            console.log("pageNumber", pageNumber);
            console.log("pageCount", pageCount);
            console.log("pageSize", pageSize);

            var num = new Number((orderCount + pageSize/2 - 1)/pageSize);
            console.log("num", num.toFixed(0));
            if(  num.toFixed(0) != pageNumber ){
                jQuery("#pageNumber").val(num);
                loadop = true;
            }
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
            var orderBy = jQuery("#orderBy").val();
            var orderType = jQuery("#orderType").val();
            var currStatus = jQuery("#currStatus").val();
            pageNumber = pageNumber + 1;
            var url = fullpath + "/order/ajax/loadmore";
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
                        if (typeof(data.pager) == 'undefined' || typeof(data.pager.list) == 'undefined') {
                            jQuery("#loadmore").attr("style","background-color:#ddd")
                            jQuery("#loadmore").html("没有更多订单了");
                            loadop=false;
                            return;
                        }
                        jQuery("#pageNumber").val(data.pager.pageNumber);
                        jQuery("#pageCount").val(data.pager.pageCount);
                        jQuery("#pageSize").val(data.pager.pageSize);
                        jQuery("#orderBy").val(data.pager.orderBy);
                        jQuery("#orderType").val(data.pager.orderType);


                        jQuery.each(data.pager.list, function (index, order) {
                            // -----create templatedl-----
                            var templatedl = jQuery("#template > dl").clone();
                            jQuery(templatedl).prop("title", order.orderStatus);
                            jQuery(templatedl).find("a").first().html(order.orderSn);
                            if (order.orderStatus == 'wait_buyer_pay') {
                                jQuery(templatedl).find(".bh > div").last().html("<strong>" + decodeOrderStatus(order.orderStatus) + "</strong>");
                            } else {
                                jQuery(templatedl).find(".bh > div").last().html(decodeOrderStatus(order.orderStatus));
                            }
                            jQuery(templatedl).find(".order-state").html("<span>收货人：</span>" + order.shipName);
                            jQuery(templatedl).find(".order-time").html(dateFormat(order.createDate));
                            jQuery(templatedl).find("a").prop('href', fullpath + "/order/view/" + order.id + ".html?whichclient=whichapp");

                            var lasttools = jQuery(templatedl).find(".tools").last();


                            if (order.isRefund == 'N') {
                                if (order.orderStatus == 'order_item_exception') {
                                    jQuery("<span/>").css("color", "#fc9836")
                                            .html("订单项异常，请重新购买")
                                            .appendTo(jQuery(lasttools));
                                } else if (order.orderStatus == 'wait_buyer_pay') {

                                    jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("付&nbsp;款")
                                            .bind('tap', function () {
                                                pay(order.orderSn, order.totalAmount, order.id);
                                            })
                                            .appendTo(jQuery(lasttools));

                                } else if (order.orderStatus == 'wait_buyer_confirm_goods') {
                                    jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("确认收货")
                                            .bind('tap', function () {
                                                confirmGoods(order.id);
                                            })
                                            .appendTo(jQuery(lasttools));
                                } else if (order.orderStatus == 'trade_finished') {
                                    if (order.isReview == '0') {
                                        jQuery("<a />").addClass("JS_order_btn")
                                                .addClass("mui-control-item")
                                                .prop("href", "javascript:void(0)")
                                                .html("评&nbsp;价")
                                                .bind('tap', function () {
                                                    reviewOrder(order.orderSn, order.id);
                                                })
                                                .appendTo(jQuery(lasttools));
                                    } else {
                                        jQuery("<label />").html("已评价")
                                                .appendTo(jQuery(lasttools));
                                    }
                                } else if (order.orderStatus == 'unconfirm') {
                                    jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("取消订单")
                                            .bind('tap', function () {
                                                cancelOrder(order.id);
                                            })
                                            .appendTo(jQuery(lasttools));
                                }
                                jQuery("<a />").addClass("JS_order_btn")
                                        .addClass("mui-control-item")
                                        .prop("href", "javascript:void(0)")
                                        .html("查&nbsp;看")
                                        .bind('tap', function () {
                                            viewOrderDetail(order.id);
                                        })
                                        .appendTo(jQuery(lasttools));

                                if ((order.paymentMethodName == '在线支付' && order.orderStatus == 'wait_buyer_pay')
                                        || (order.paymentMethodName == '货到付款' && order.orderStatus == 'wait_seller_send_goods')) {
                                    jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("取消订单")
                                            .bind('tap', function () {
                                                cancelOrder(order.id);
                                            })
                                            .appendTo(jQuery(lasttools));
                                }
                                if (order.paymentStatus == 'paid') {
                                    jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("退&nbsp;款")
                                            .bind('tap', function () {
                                                checkurl(order.orderSn);
                                            })
                                            .appendTo(jQuery(lasttools));
                                } else if (order.paymentStatus == 'refunding') {
                                    jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("确认收款")
                                            .bind('tap', function () {
                                                confirmReceivables(order.orderSn);
                                            })
                                            .appendTo(jQuery(lasttools));
                                } else if ((order.orderStatus == 'wait_buyer_confirm_goods' || order.orderStatus == 'trade_finished')
                                        && order.paymentMethodName == '在线支付') {
                                    /*jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("物流信息")
                                            .bind('tap', function(){showExpressLog(order.id);})
                                            .appendTo(jQuery(lasttools));*/
                                }

                            } else if (order.isRefund == 'Y') {

                            if (order.orderRefund.status == 'refunded'){
                                jQuery("<a />").addClass("JS_order_btn")
                                        .addClass("mui-control-item")
                                        .prop("href", "javascript:void(0)")
                                        .html("确认收款")
                                        .bind('tap', function(){confirmReceivables(order.orderSn);})
                                        .appendTo(jQuery(lasttools));
                            }else{
                                if( (order.refundCount > 1 || order.refundCount == 1 )
                                        && order.refundCount < 3
                                        && order.currRefundId != ''){
                                    jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("申请退款")
                                            .bind('tap', function(){nextRefund(order.orderSn);})
                                            .appendTo(jQuery(lasttools));
                                }
                                if(order.refundCount == 3){
                                    if (order.orderStatus == 'wait_buyer_confirm_goods'){
                                        jQuery("<a />").addClass("JS_order_btn")
                                                .addClass("mui-control-item")
                                                .prop("href", "javascript:void(0)")
                                                .html("确认收货")
                                                .bind('tap', function(){confirmGoods(order.id);})
                                                .appendTo(jQuery(lasttools));
                                    }else if(order.orderStatus == 'trade_finished'){
                                        if (order.isReview == '0'){
                                            jQuery("<a />").addClass("JS_order_btn")
                                                    .addClass("mui-control-item")
                                                    .prop("href", "javascript:void(0)")
                                                    .html("评&nbsp;价")
                                                    .bind('tap', function(){reviewOrder(order.orderSn, order.id);})
                                                    .appendTo(jQuery(lasttools));
                                        }else{
                                            jQuery("<label />").html("已评价")
                                                    .appendTo(jQuery(lasttools));
                                        }
                                    }
                                }
                                jQuery("<a />").addClass("JS_order_btn")
                                        .addClass("mui-control-item")
                                        .prop("href", "javascript:void(0)")
                                        .html("退款单")
                                        .bind('tap', function(){refundList (order.orderSn);})
                                        .appendTo(jQuery(lasttools));
                                }
                            }
                            //jQuery(templatedl).find(".tools").last().append(a_btn);
                            var goodsCount = 0;
                            jQuery.each(data.orderItemList, function (index, orderitem) {
                                if (order.orderSn == orderitem.orderSn) {
                                    goodsCount = goodsCount + orderitem.quantity;
                                    // -----create templateGoodsDiv-----
                                    var templateGoodsDiv = jQuery("#template > .order-goods").clone();
                                    jQuery(templateGoodsDiv).find("img").prop('src', orderitem.pic + '_75x75.png');
                                    jQuery(templateGoodsDiv).find("a").prop('href', fullpath + "/order/view/" + order.id + ".html?whichclient=whichapp");
                                    jQuery(templateGoodsDiv).find("a").last().html(orderitem.goodsName);
                                    jQuery(templateGoodsDiv).find("h4").html('￥' + fmoney(orderitem.goodsPrice, 2));
                                    jQuery(templateGoodsDiv).find("p").html('x' + orderitem.quantity);
                                    // ------install templateGoodsDiv to templatedl--------
                                    jQuery(templatedl).find(".tools2").first().before(templateGoodsDiv);
                                    return;
                                }
                            });
                            jQuery(templatedl).find(".tools2").first().html("<span>总计:</span><font style='color: #e4393c;'>￥"
                                    + fmoney(order.totalAmount, 2)
                                    + "</font>&nbsp;&nbsp;<span style='color:#888;'>(运费：￥<font style='color: #e4393c;'>"
                                    + fmoney(order.deliveryFee, 2) + ")</font></span>&nbsp;&nbsp;共" + goodsCount + "件");
                            // ------install templatedl to page--------
                            jQuery("#order01 > dl").last().after(templatedl);
                        });
                        var current = jQuery(".order-filter a.current");
                        var current_name = jQuery(current).attr('name');
                        if (current_name == 'all') {
                            jQuery("#order01 > dl").show();
                            //jQuery("#loadmore").show();
                        } else {
                            //jQuery("#loadmore").hide();
                            jQuery("#order01 > dl[title!='" + current_name + "']").hide();
                            jQuery("#order01 > dl[title='" + current_name + "']").show();
                        }
                    loadop=true;
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

    /**
     * 确认收货
     * @param orderId 订单Id
     */
    function confirmGoods(orderId) {
        var layer_confrim = layer.open({
            title:'提示：',
            content:'确认收到了货物?',
            btn: ['确认', '取消'],
            shadeClose: false,
            yes: function(){
                layer.close(layer_confrim);
                showWaiting();
                jQuery.ajax({
                    type: 'post',
                    url: '${base}/order/confirmGoods/' + orderId,
                    success: function (data) {
                        if (data.status == 'success') {
                            jumpto(fullpath + "/order/tradingsuccess/" + orderId + "?whichclient=whichapp");
                        }
                        closeWaiting();
                    },
                    error:function(data){
                        popAlert(data.message);
                        closeWaiting();
                    }
                });
            },
            no: function(){
                closeWaiting();
            }
        });
    }

    /**
     * 取消订单
     * @param orderId 订单Id
     */
    function cancelOrder(orderId) {
        var cancelReason = "";
        var layer_confrim = layer.open({
            title:'确认取消该订单?',
            content: '<textarea class="mui-textarea mui-btn-block" class="text" id="layer_cancelReason" name="layer_cancelReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; margin: -20px 0px -15px 0px;padding: 10px 20px 10px 20px;" placeholder="请输入取消原因"></textarea> ',
            btn: ['确认', '取消'],
            shadeClose: false,
            yes: function(){
                cancelReason = jQuery('#layer_cancelReason').val();<#--必须在close之前获取-->
                if(cancelReason == ''){
                    cancelReason = '用户主动取消';
                }else if( cancelReason.length < 6 ){
                    popAlert("取消原因写的太少了，多写几个吧");
                    return false;
                }else if( cancelReason.length > 100){
                    popAlert("取消原因写的太多了，少写几个吧");
                    return false;
                }
                layer.close(layer_confrim);
                showWaiting();
                jQuery.ajax({
                    type: 'post',
                    url: fullpath + '/order/cancle/' + orderId + '/' + encodeURI(encodeURI(cancelReason)),
                    success: function (data) {
                        if (data.status == 'success') {
                            jumpto(fullpath + "/order/list?whichclient=whichapp");
                        } else {
                            jumpto(fullpath + "/order/list?whichclient=whichapp");
                        }
                        closeWaiting();
                    },
                    error:function(data){
                        closeWaiting();
                        popAlert(data.message);
                    }
                });
            },
            no: function(){
                closeWaiting();
            }
        });
    }

    /**
     * 删除订单
     * @param orderId
     */
    function deleteOrder(orderId) {
        var layer_confrim = layer.open({
            title:'提示：',
            content:'确认要删除该订单?',
            btn: ['确认', '取消'],
            shadeClose: false,
            yes: function(){
                layer.close(layer_confrim);
                showWaiting();
                jQuery.ajax({
                    type: 'post',
                    url: '${base}/order/delete/' + encodeURI(orderId),
                    success: function (data) {

                        if (data.status == 'success') {
                            if(ismobile){
                                jumpto(fullpath + "/order/list?whichclient=whichapp");
                            }else{
                                window.location.reload();
                            }
                        }
                        closeWaiting();
                    },
                    error:function(data){

                        popAlert(data.message);
                        closeWaiting();
                    }
                });
            },
            no: function(){
                closeWaiting();
            }
        });

    }

    function checkurl(orderSn){
        showWaiting();
        jQuery.ajax({
            type: "POST",
            url: "${base}/member/refund/refundurl/"+orderSn + "?whichclient=whichapp",
            datatype: 'json',
            success: function(data) {
                var t=data.status;
                var s=data.refundstatus;
                var type=data.type;
                var refundId=data.refundId;
                if (t == "success") {
                    //plus.nativeUI.alert("success" , function(e){},"nativeUI","好");
                    if(type="unreceived"){
                        if(s == 'commit' || s == 'confirmed'||s == 'unrefund' || s == 'returned'){
                            jumpto(fullpath+"/member/refund/applyfillwl/" + orderSn+ ".html?whichclient=whichapp");
                        } else {
                            jumpto(fullpath+"/member/refund/apply/" + orderSn + ".html?whichclient=whichapp");
                        }
                    }
                    if(type="received"){
                        if(s == 'commit' ||s == 'returned'){
                            jumpto(fullpath+"/member/refund/applyfillwl/" + orderSn+ ".html?whichclient=whichapp");
                        } else {
                            jumpto(fullpath+"/member/refund/refundsuccess/" + orderSn + ".html?whichclient=whichapp");
                        }
                    }
                }else{
                    jumpto(fullpath+"/member/refund/apply/" + orderSn + ".html?whichclient=whichapp");
                }
                closeWaiting();
            },
            error:function(data){
                popAlert(data.message);
                closeWaiting();
            }
        });
    }
    /**
     * 买家确认收到退款
     * @param {string} orderId 订单Id
     */
    var clickAllow = "true";
    function confirmReceivables(orderSn) {
        if(clickAllow=="true"){
            clickAllow = "false";

            var layer_confrim = layer.open({
                title:'提示：',
                content:'确认收到了商家的退款?',
                btn: ['确认', '取消'],
                shadeClose: false,
                yes: function(){
                    layer.close(layer_confrim);
                    showWaiting();
                    jQuery.ajax({
                        type: 'post',
                        url: '${base}/member/refund/receivableupdate/' + orderSn + '.html?whichclient=whichapp',
                        success: function (data) {
                            clickAllow = "false";
                            if (data.status == 'success') {
                                jumpto(fullpath + "/order/list?whichclient=whichapp");
                            }
                        },
                        error:function(data){
                            clickAllow = "false";
                            popAlert(data.message);
                            closeWaiting();
                        }
                    });
                },
                no: function(){
                    clickAllow = "false";
                    closeWaiting();
                }
            });
        }
    }

    function refundList(orderSn) {
        jumpto(fullpath + "/member/refund/applyfillwl/" + orderSn + "?whichclient=whichapp");
    }

    function reviewOrder(orderSn, orderId) {
        jumpto(fullpath + "/order/review.html?sn=" + orderSn + "&orderId=" + orderId + "&whichclient=whichapp");
    }

    function viewOrderDetail(orderId) {
        jumpto(fullpath + "/order/view/" + orderId + ".html?whichclient=whichapp");
    }
    function pay(orderSn, totalAmount, orderId) {
        jumpto(fullpath + "/payment?orderSn=" + orderSn
                + "&total=" + totalAmount
                + "&key=" + orderId
                + "&whichclient=whichapp");
    }

    /**
     * 退款单驳回
     * @param orderSn 退款单号
     */
    function nextRefund(orderSn){
        showWaiting();
        jQuery.ajax({
            type: "POST",
            url: "${base}/member/refund/refundurl/"+orderSn,
            datatype: 'json',
            success: function(data) {
                var size = data.size;
                if(size>=3){
                    popAlert('驳回三次，不能进行此操作');
                    return false;
                }else{
                    jumpto(fullpath + "/member/refund/apply/"+ orderSn +".html?whichclient=whichapp");
                }
                closeWaiting();
            },
            error:function(data){
                popAlert(data.message);
                closeWaiting();
            }
        });
    }
</script>
</body>
</html>