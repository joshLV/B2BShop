<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<#include "app/ghdj/head.ftl">
    <link href="${path}/theme/red/ghj_style.css" rel="stylesheet"/>
<style>
    .tools2 {
        margin-top: 13px;
        padding-right: 15px;
        text-align: right;
        font-size: 14px;
        color: #444;
    }

    /*新加样式  12-31*/
    .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghdj/images/arr.png) no-repeat; background-size:13px
    21px;margin-top:5px;}
    @-webkit-keyframes fadeInOut {
        0% {
            opacity:1;
        }
        25% {
            opacity:0;
        }
        50% {
            opacity: 0;
        }
        75% {
            opacity:1;
        }
    }
    .arrow {
        -webkit-animation-name: fadeInOut;
        -webkit-animation-timing-function: ease-in-out;
        -webkit-animation-iteration-count: infinite;
        -webkit-animation-duration: 1.5s;
        -webkit-animation-direction: alternate;
    }
</style>

</head>
<body>
<header>
<div class="logo"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');" class="ltext">返回</a></div>
<div class="mtit">我的订单</div>
<div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a></div>
</header>


<div class="mui-content" id="content" style="padding-bottom:50px; margin-top: 48px;">
    <div class="myorder" style="margin-top: 16px;">
<#--新做订单列表-->


    <div class="viewport" id="tabs" style=" padding-left: 0!important; padding-right:0!important; width: 100%!important;">
        <ul class="order-filter" style="width:100%;overflow: auto;height: 40px;" >
            <li id="arrowleft" class="arrow" style="width: 20px;position:fixed;left: 0;display: none;"><span class="mui-icon mui-icon-arrowleft" style="margin-top: 9px;font-size: 20px;"></span></li>
            <li id="all"><a name="all" class="mui-control-item <#if ! orderStates?exists>current</#if>" href="javascript:;">全部</a></li>
            <li id="wait_buyer_pay"><a name="wait_buyer_pay" class="mui-control-item <#if orderStates=="wait_buyer_pay">current</#if>" href="javascript:;">待付款<em>(${orderFuKuanCount})</em></a></li>
            <li id="wait_seller_send_goods"><a name="wait_seller_send_goods" class="mui-control-item <#if orderStates=="wait_seller_send_goods">current</#if>" href="javascript:;">待发货<em>(${orderFaHuoCount})</em></a></li>
            <li id="wait_buyer_confirm_goods"><a name="wait_buyer_confirm_goods" class="mui-control-item <#if orderStates=="wait_buyer_confirm_goods">current</#if>" href="javascript:;">待收货<em>(${orderConfirmCount})</em></a></li>
            <li id="wait_buyer_validate_goods"><a name="wait_buyer_validate_goods" class="mui-control-item <#if orderStates=="wait_buyer_validate_goods">current</#if>" href="javascript:;">待验货<em>(${orderValidateCount})</em></a></li>

            <li id="arrowright" class="arrow" style="width: 20px;position:fixed;right: 0;display: none;"><span class="mui-icon mui-icon-arrowright" style="margin-top: 9px;font-size: 20px;"></span></li>
        </ul>
        <div id="order01" class="order_list01">

        <#list orderList as order>
        <dl title="${order.orderStatus}">
            <div class="bh">
                <div style="float:left;">
                    <label><#if order.orderType == 1>众筹订单:<#else>普通订单:</#if></label>
                    <a href="${base}/order/view/${order.id}?whichclient=whichapp">${order.orderSn}</a></div>
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
                            <div class="face"><a href="${base}/order/view/${order.id}?whichclient=whichapp"><img src="${orderitem.pic}@150w_150h.png"></a></div>
                            <div class="info"> <a href="${base}/order/view/${order.id}?whichclient=whichapp">${orderitem.goodsName}</a>
                                <h4>${orderitem.goodsPrice?string(priceCurrencyFormat)}</h4>
                                <p>x${orderitem.quantity}</p>
                            </div>
                        </div>
                    </#if>
                </#list>
                <div class="tools2"><span>总计：</span><font style="color: #E4393C;">${order.totalAmount?string(priceCurrencyFormat)}</font>&nbsp;&nbsp;<span style="color: #888;">(运费：<font style="color: #E4393C;">${order.deliveryFee?string( priceCurrencyFormat )}</font>)</span>&nbsp;&nbsp;共<font style="color: #E4393C; padding: 0 2px;">${goodsCount}</font>件</div>
                <div class="tools">
                    <#if '${order.isRefund }'== 'N'>
                        <#if '${order.orderStatus}' == 'order_item_exception'>
                            <span style="color:#fc9836;">订单项异常，请重新购买</span>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_pay'>
                            <a class="JS_order_btn pay"
                            <a href="javascript:void(0)" onclick="pay('${order.orderSn}', '${order.totalAmount}', '${order.id}', '${order.orderType}')" class="JS_order_btn ">付&nbsp;款</a>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                            <a href="javascript:void(0)" onclick="confirmGoods('${order.id}')" class="JS_order_btn ">确认到货</a>
                        <#elseif '${order.orderStatus}' == 'wait_buyer_validate_goods'>
                            <a href="javascript:void(0)" onclick="validateGoods('${order.id}','${order.handleResultStatu}')" class="JS_order_btn ">确认验货</a>

                            <#if '${order.orderType}'!= '1'>
				<#if '${order.handleResultStatu}' == '0'>
				   <a href="javascript:void(0)" onclick="complainGoods('${order.orderSn}')" class="JS_order_btn " id="complainGoods">申诉</a>
				</#if>
			    </#if>
                            <#if '${order.handleResultStatu}' != '0'> <a href="javascript:void(0)" onclick="viewComplain('${order.orderSn}')" class="JS_order_btn ">查看申诉</a></#if>

                        <#elseif '${order.orderStatus}' == 'trade_finished'>
                            <#if '${order.isReview}' == '0'>
				<#if '${order.orderType}'!= '1'>
                                <a href="javascript:void(0)" onclick="reviewOrder('${order.orderSn}', '${order.id}')" class="JS_order_btn ">评&nbsp;价</a>
				</#if>
                            <#else >
                                <label>已评价</label>
                            </#if>
                        <#elseif '${order.orderStatus}' == 'unconfirm'>
                            <#if '${order.orderType}' != '1'>
                            <a href="javascript:void(0)" onclick="cancelOrder('${order.id}', '${order.orderType}')" class="JS_order_btn ">取消订单</a>
                            </#if>
                            <#--a href="${base}/order/popupcancel/${order.id}&whichclient=whichapp" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" class="JS_order_btn ">取消订单</a-->
                        </#if>

                        <a href="javascript:void(0)" onclick="viewOrderDetail('${order.id}')" class="JS_order_btn ">查&nbsp;看</a>
                        <#if (order.paymentMethodName == '在线支付' && order.orderStatus == 'wait_buyer_pay') || (order.paymentMethodName == '货到付款' && order.orderStatus == 'wait_seller_send_goods')>
                            <#if '${order.orderType}' != '1'>
                            <a href="javascript:void(0)" onclick="cancelOrder('${order.id}', '${order.orderType}')" class="JS_order_btn ">取消订单</a>
                            </#if>
                        </#if>
                        <#if '${order.paymentStatus}'== 'paid'>
                            <#--<a href="javascript:void(0)" onclick="checkurl('${order.orderSn}','${order.id}', '${order.orderType}');" class="JS_order_btn ">退&nbsp;款</a>-->
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

    <!--<div class="checkout_btn">
        <a id="loadmore" class="gray_btn mui-control-item"href="#buttom" style="background-color:#e42020;"><#if !orderList?exists || orderList?size == 0>目前没有[${orderStatusMapping['${orderStates}']}]订单<#else>${orderStates}上拉加载更多${orderList?size}</#if></a>
    </div>-->
    <div class="checkout_btn">
        <a id="loadmore" class="gray_btn mui-control-item"href="#buttom" style="background-color:#ddd;">没有更多订单了</a>
    </div>
    <div id="buttom"></div>

    <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
    <input type="hidden" id="pageCount" value="${pager.pageCount}"/>
    <input type="hidden" id="pageSize" value="${pager.pageSize}"/>
    <input type="hidden" id="orderBy" value="${pager.orderBy}"/>
    <input type="hidden" id="orderType_" value="${pager.orderType_}"/>
    <input type="hidden" id="currStatus" value="${currStatus}" />
    <div id="template" style="display:none">
        <dl>
            <div class="bh">
                <div style="float:left;"><label>订单编号：</label><a href="#">5110358063443378</a></div>
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
        decodeOrderStatus = function (orderStatus) {
            if (orderStatus == "unconfirm")  return "未确认";
            if (orderStatus == "cancel")  return "已取消";
            if (orderStatus == "invalid")  return "已作废";
            if (orderStatus == "wait_buyer_pay")  return "等待付款";
            if (orderStatus == "wait_seller_send_goods")  return "等待发货";
            if (orderStatus == "wait_buyer_confirm_goods")  return "等待收货";
            if (orderStatus == "wait_buyer_validate_goods") return "等待验货";
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
            var pageNumber = 1;//parseInt(jQuery("#pageNumber").val());
            var pageCount = parseInt(jQuery("#pageCount").val());
            var pageSize = parseInt(jQuery("#pageSize").val());
            var orderBy = parseInt(jQuery("#orderBy").val());
           //var orderType_ = parseInt(jQuery("#orderType_").val());


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

	
            var url="pageNumber="+pageNumber+"&pageSize="+pageSize+"&orderBy=a.createDate&orderType=desc";
		
            if(e_target_name == 'all') {
		//全部
            }else if(e_target_name == 'wait_buyer_pay'){  
		//待付款
		url+="&paymentStatus=unpaid&shippingStatus=unshipped&status="+e_target_name;
            }else if(e_target_name == 'wait_seller_send_goods'){
		//待发货
		url+="&paymentStatus=paid&shippingStatus=unshipped&status="+e_target_name;
	    }else if(e_target_name == 'wait_buyer_confirm_goods'){
		//待收货
		url+="&paymentStatus=paid&shippingStatus=shipped&status="+e_target_name;
	    }else if(e_target_name == 'wait_buyer_validate_goods'){
		//待验货
		url+="&paymentStatus=paid&shippingStatus=takeover&status="+e_target_name;
	    }
	    jumpto(fullpath + "/order/list?whichclient=whichapp&"+url);

        });

        jQuery('#backToTop').bind("tap", function(){
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });

	
    }(mui, document));

    
	var ofc=$(".order-filter").width();
        if($(".order-filter").scrollLeft() <ofc/2) {
           $("#arrowright").fadeIn(50);
           $("#arrowleft").fadeOut(50);
        }
        if($(".order-filter").scrollLeft() >ofc/2) {
           $("#arrowleft").fadeIn(50);
           $("#arrowright").fadeOut(50);
        }
        $(".order-filter").scroll(function() {
           if($(".order-filter").scrollLeft() <ofc/2) {
              $("#arrowright").fadeIn(50);
              $("#arrowleft").fadeOut(50);
           }
           if($(".order-filter").scrollLeft() >ofc/2) {
	      $("#arrowleft").fadeIn(50);
              $("#arrowright").fadeOut(50);
           }
         });

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
                loadData();
            }
        }
    });
    function loadData(){
        loadop=false;
        jQuery("#loadmore").html("<img style='width: 60px;' src='${base}/static/app/gwq/images/loading.gif'>");
            var pageNumber = parseInt(jQuery("#pageNumber").val());
            var pageCount = parseInt(jQuery("#pageCount").val());
            var pageSize = parseInt(jQuery("#pageSize").val());
            var orderBy = parseInt(jQuery("#orderBy").val());
            //var orderType_ = 1;
            var currStatus = jQuery("#currStatus").val();
            pageNumber = pageNumber + 1;
            var url = fullpath + "/order/ajax/loadmore";

	    var shippingStatus=null;
	    var paymentStatus=null;
	
	    //待付款
	    if(currStatus=="wait_buyer_pay"){
		paymentStatus="unpaid";
		shippingStatus="unshipped";
	    }
	    //待发货
	    if(currStatus=="wait_seller_send_goods"){
	        shippingStatus="unshipped";
	        paymentStatus="paid";
	    }
	    //待收货
	    if(currStatus=="wait_buyer_confirm_goods"){
	        shippingStatus="shipped";
		paymentStatus="paid";
	    }
		
	    //待验货
	    if(currStatus=="wait_buyer_validate_goods"){
		shippingStatus="takeover";
		paymentStatus="paid";
	    }
		

	    var data= {
                    'pageNumber': pageNumber,
                    'pageSize': pageSize,
                    'orderBy': orderBy,
                    'status': currStatus,
		    'shippingStatus':shippingStatus,
		    'paymentStatus':paymentStatus
             }
	
	    if(currStatus=='all'){
		delete data.status;
		delete data.shippingStatus;
		delete data.paymentStatus;
	    }
		

            jQuery.ajax({
                type: "post",
                url: url,
                data:data,
                datatype: 'json',
                success: function (data) {

                    if (data.status == 'success') {
                        if (typeof(data.orderList) == 'undefined') {
                            jQuery("#loadmore").attr("style","background-color:#ddd")
                            jQuery("#loadmore").html("没有更多订单了");
                            loadop=false;
                            return;
                        }
                        jQuery("#pageNumber").val(data.pager.pageNumber);
                        jQuery("#pageCount").val(data.pager.pageCount);
                        jQuery("#pageSize").val(data.pager.pageSize);
                        jQuery("#orderBy").val(data.pager.orderBy);
                        //jQuery("#orderType_").val(data.pager.orderType_);
			

                        jQuery.each(data.orderList, function (index, order) {
                            // -----create templatedl-----
                            var templatedl = jQuery("#template > dl").clone();
                            jQuery(templatedl).prop("title", order.orderStatus);
                            if(order.orderType == 1){
                                jQuery(templatedl).find("label").first().html("众筹订单");
                            }else{
                                jQuery(templatedl).find("label").first().html("普通订单");
                            }

                            jQuery(templatedl).find("a").first().html(order.id);
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
                                                pay(order.orderSn, order.totalAmount, order.id, order.orderType);
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
                                } else if (order.orderStatus == 'wait_buyer_validate_goods') {
                                    jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("确认验货")
                                            .bind('tap', function () {
                                                validateGoods(order.id,order.handleResultStatu);
                                            })
                                            .appendTo(jQuery(lasttools));
                                    jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("申诉")
                                            .bind('tap', function () {
                                                complainGoods(order.orderSn);
                                            })
                                            .appendTo(jQuery(lasttools));
                                    if(order.handleResultStatu != 0 ){
                                        jQuery("<a />").addClass("JS_order_btn")
                                                .addClass("mui-control-item")
                                                .prop("href", "javascript:void(0)")
                                                .html("查看申诉")
                                                .bind('tap', function () {
                                                    viewComplain(order.orderSn);
                                                })
                                                .appendTo(jQuery(lasttools));
                                    }

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
                                } else if (order.orderStatus == 'unconfirm' && order.orderType != '1') {
                                    jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("取消订单")
                                            .bind('tap', function () {
                                                cancelOrder(order.id, order.orderType);
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
                                    if( order.orderType != '1'){
                                        jQuery("<a />").addClass("JS_order_btn")
                                                .addClass("mui-control-item")
                                                .prop("href", "javascript:void(0)")
                                                .html("取消订单")
                                                .bind('tap', function () {
                                                    cancelOrder(order.id, order.orderType);
                                                })
                                                .appendTo(jQuery(lasttools));
                                    }

                                }
                                if (order.paymentStatus == 'paid') {
                                    /*jQuery("<a />").addClass("JS_order_btn")
                                            .addClass("mui-control-item")
                                            .prop("href", "javascript:void(0)")
                                            .html("退&nbsp;款")
                                            .bind('tap', function () {
                                                checkurl(order.orderSn,order.id, order.orderType);
                                            })
                                            .appendTo(jQuery(lasttools));*/
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
                                    jQuery(templateGoodsDiv).find("img").prop('src', orderitem.pic + '@150w_150h.png');
                                    jQuery(templateGoodsDiv).find("a").prop('href', fullpath + "/order/view/" + order.id + ".html?whichclient=whichapp");
                                    jQuery(templateGoodsDiv).find("a").last().html(orderitem.goodsName);
                                    jQuery(templateGoodsDiv).find("h4").html('￥' + fmoney(orderitem.goodsPrice, 2));
                                    jQuery(templateGoodsDiv).find("p").html('x' + orderitem.quantity);
                                    // ------install templateGoodsDiv to templatedl--------
                                    jQuery(templatedl).find(".tools2").first().before(templateGoodsDiv);
                                    return;
                                }
                            });
                            jQuery(templatedl).find(".tools2").first().html("￥" + fmoney(order.totalAmount, 2) + "(运费：￥" + fmoney(order.deliveryFee, 2) + ")&nbsp;共" + goodsCount + "件");
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
     *  验货
     * @param orderId
     */
    function validateGoods(orderId,handleResultStatu){
        console.log(orderId);
        if(handleResultStatu=="untreated"){
            popAlert("申诉还未处理，不能确认验货！");
            return;
        }

        var layer_confrim = layer.open({
            title: '提示：',
            content: '确认验货无误?',
            btn: ['确认', '取消'],
            shadeClose: false,
            yes: function() {
                layer.close(layer_confrim);
                showWaiting();
                jQuery.ajax({
                    type: 'post',
                    url: base + 'order/confirmGoods/' + orderId,
                    success: function(data) {
                        if (data.status == 'success') {

                            jumpto(fullpath + "/order/tradingsuccess/" + orderId + "?whichclient=whichapp");

                        }
                        closeWaiting();
                    },
                    error: function(data) {
                        popAlert(data.message);
                        closeWaiting();
                    }
                });
            },
            no: function() {
                closeWaiting();
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
                    url: '${base}/order/validateGoods/' + orderId,
                    success: function (data) {
                        if (data.status == 'success') {
                            jumpto(fullpath + "/order/list?whichclient=whichapp");

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
     *  申述
     * @param orderSn
     */
    function complainGoods(orderSn) {
        console.log(orderSn);
        var complainReason = "";
        var layer_confrim = layer.open({
            title: '订单申诉：',
            content: '<textarea class="mui-textarea mui-btn-block" class="text" id="layer_complainReason" name="layer_complainReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; margin: -20px 0px -15px 0px;padding: 10px 20px 10px 20px;" placeholder="请输入申诉原因"></textarea><br/><span style="color: red;font-size: 12px;" id="layer_complainReason_msg"></span>',
            btn: ['确认', '取消'],
            shadeClose: false,
            yes: function() {
                complainReason = jQuery('#layer_complainReason').val(); //必须在close之前获取
                console.log(complainReason);
                if(complainReason==''){
                    jQuery('#layer_complainReason_msg').html('请填写申诉原因！')
                    return false;
                }else if (complainReason.length < 6) {
                    jQuery('#layer_complainReason_msg').html('申诉原因写的太少了，多写几个吧！')
                    return false;
                } else if (complainReason.length > 100) {
                    jQuery('#layer_complainReason_msg').html('申诉原因写的太多了，少写几个吧！')
                    return false;
                }else{
                    layer.close(layer_confrim);
                    showWaiting();
                    jQuery.ajax({
                        type: 'post',
                        url: base + '/order/complaint/' + orderSn + '/' + encodeURI(encodeURI(complainReason)),
                        success: function(data) {
                            closeWaiting();
                            if (data.status == 'success') {
                                popAlert('提交申诉成功，我们会尽快处理您的申诉，请耐心等待!');
				//隐藏申诉按钮
				setTimeout(function(){
				   $("#complainGoods").hide();
				   $("#complainGoods").after('<a href="javascript:void(0)" onclick="viewComplain('+orderSn+')" class="JS_order_btn ">查看申诉</a>');
				}, 3000);
				
                            }
                        },
                        error: function(data) {
                            popAlert(data.message);
                            closeWaiting();
                        }
                    });
                }
            },
            no: function() {
                closeWaiting();
            }
        });
        $("#layer_complainReason").parent().parent().parent().css("vertical-align","top");
        $("#layer_complainReason").parent().parent().css("margin-top","10%");
    }
    /**
     *  查看申述
     * @param orderSn
     */
    function viewComplain(orderSn){
        showWaiting();
        $.ajax({
            type: "POST",
            dataType: "json",
            url: base + "order/viewComplaint/" + orderSn,
            cache: false,
            success: function(data) {
                if (data.status == 'success') {
                    var html = '<div>';
                    html += '<b>申诉内容：</b>' + data.complaint.content + '<br/>';
                    if (data.complaint.handleResultStatu == 'untreated') {
                        html += '<b>申诉状态：</b>未处理<br/>';
                    } else if (data.complaint.handleResultStatu == 'processed') {
                        html += '<b>申诉状态：</b>已处理<br/>';
                    }

                    if (data.complaint.handleResultStatu == 'processed') {
                        html += '<b>处理结果：</b>' + data.complaint.handleResult + '<br/>';
                    }
                    html += '</div>';
                    closeWaiting();
                    layer.open({
                        title: '申述信息',
                        content: html
                    });

                } else {
                    closeWaiting();
                    layer.open({
                        title: '错误',
                        content: data.message
                    });
                }
            }
        });
    }
    /**
     * 取消订单
     * @param orderId 订单Id
     */
     function cancelOrder(orderId, orderType) {
        var cancelReason = "";
        var layer_confrim = layer.open({
		title:'确认取消该订单?',
		content: '<textarea class="mui-textarea mui-btn-block" class="text" id="layer_cancelReason" name="layer_cancelReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; margin: -20px 0px -15px 0px;padding: 10px 20px 10px 20px;" placeholder="请输入取消原因"></textarea><br/><span style="color: red;font-size: 12px;" id="layer_cancelOrder_msg"></span> ',
		btn: ['确认', '取消'],
		shadeClose: false,
		yes: function(){
		cancelReason = jQuery('#layer_cancelReason').val();<#--必须在close之前获取-->
		
		if(cancelReason == ''){
		   $("#layer_cancelOrder_msg").html("请填写取消原因！");
		   return false;
		}else if( cancelReason.length < 6 ){
		  $("#layer_cancelOrder_msg").html("取消原因写的太少了，多写几个吧");
		   return false;
		 }else if( cancelReason.length > 100){
		   $("#layer_cancelOrder_msg").html("取消原因写的太多了，少写几个吧");
		   return false;
		 }    
		 layer.close(layer_confrim);
		 showWaiting();
		 jQuery.ajax({
			type: 'post',
			url: '${base}/order/cancle/' + orderId + '/' + encodeURI(encodeURI(cancelReason)),
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
	      
        })
    }
    /**
     * 取消订单
     * @param orderId 订单Id
     */
    /*function cancelOrder(orderId, orderType) {
        var showConfirm = true;
        if( orderType == 0 ){
            showWaiting();
            jQuery.ajax({
                type: "POST",
                url: "${base}/zcorder/checkZCGoodsStatus/?orderId="+orderId,
                datatype: 'json',
                success: function(data) {
                    if(data.data != 3){ 
                        closeWaiting();
                        var statusZh=new Array("Null", "待发布", "进行中", "成功", "失败", "作废");
                        var text;
                        if( data.data < 3 ){
                            text = "该众筹活动还在【" +statusZh[parseInt(data.data)]+ "】阶段,不能支付!";
                        }else{
                            text = "该众筹活动已" +statusZh[parseInt(data.data)]+ ",不能支付!";
                        }

                        popAlert(text);     
                    }else{  
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
                                }else if( canelReason.length > 100){
                                    popAlert("取消原因写的太多了，少写几个吧");
                                    return false;  
                                }
                                layer.close(layer_confrim);
                                showWaiting();  
                                jQuery.ajax({    
                                    type: 'post',
                                    url: '${base}/order/cancle/' + orderId + '/' + encodeURI(encodeURI(cancelReason)),
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
                },
                error:function(data){
                    popAlert(data.message);
                    showConfirm = false;
                    closeWaiting();
                }
            });
        }


    }*/

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

    function checkurl(orderSn, orderId, orderType){
        var showConfirm = true;
        if( orderType == 1 ){
            showWaiting();
            jQuery.ajax({
                type: "POST",
                url: "${base}/zcorder/checkZCGoodsStatus/?orderId="+orderId,
                datatype: 'json',
                success: function(data) {
                    if(data.data != 3){
                        closeWaiting();
                        var text;

                        var statusZh=new Array("Null", "待发布", "进行中", "成功", "失败", "作废");
                        var text;
                        if( data.data < 3 ){
                            text = "该众筹活动还在【" +statusZh[parseInt(data.data)]+ "】阶段,不能支付!";
                        }else{
                            text = "该众筹活动已" +statusZh[parseInt(data.data)]+ ",不能支付!";
                        }

                        popAlert(text);
                    }else{

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
                },
                error:function(data){
                    popAlert(data.message);
                    showConfirm = false;
                    closeWaiting();
                }
            });
        }

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
    function pay(orderSn, totalAmount, orderId, orderType) {
        if(orderType == 0){
            jumpto(fullpath + "/payment?orderSn=" + orderSn
                    + "&total=" + totalAmount
                    + "&key=" + orderId
                    + "&whichclient=whichapp");
        }else if(orderType == 1){

            showWaiting();
            jQuery.ajax({
                type: "POST",
                url: "${base}/zcorder/checkZCGoodsStatus/?orderId="+orderId,
                datatype: 'json',
                success: function(data) {
		    if(data.status=="error"){
			 popAlert(data.message);
			 closeWaiting();
		    }else if(data.status=="success"){
			if(data.data == 3&&data.message=="after"){
			    jumpto(fullpath + "/payment?orderSn=" + orderSn
                                + "&total=" + totalAmount
                                + "&key=" + orderId
                                + "&whichclient=whichapp");
				closeWaiting();	
			}else if(data.data == 3&&data.message=="before"){
				popAlert("众筹活动尚未结束，不能支付!");
				closeWaiting();	
			}else if(data.data == 4){
				popAlert("该众筹活动已失败，不能支付!");
				closeWaiting();	
			}else if(data.data == 5){
				popAlert("该众筹活动已作废，不能支付!");
				closeWaiting(); 
			}else if(data.data == 1){
				popAlert("该众筹活动还在【待发布】阶段，不能支付!");
				closeWaiting();
			}else if(data.data == 2){
				popAlert("该众筹活动还在【进行中】阶段，不能支付!");
				closeWaiting();
			}
		    }
		    


		    /* if(data.status=="error"){
			 popAlert(data.message);
			 closeWaiting();
			 return;
		     }
                    if(data.data == 3){
                        jumpto(fullpath + "/payment?orderSn=" + orderSn
                                + "&total=" + totalAmount
                                + "&key=" + orderId
                                + "&whichclient=whichapp");
                        closeWaiting();
                    }else{
                        closeWaiting();
                       // 1_待发布，2_进行中，3_成功，4失败，5_作废
                        var statusZh=new Array("Null", "待发布", "进行中", "成功", "失败", "作废");
                        var text;
                        if( data.data < 3 ){
                            text = "该众筹活动还在【" +statusZh[parseInt(data.data)]+ "】阶段,不能支付!";
                        }else{
                            text = "该众筹活动已" +statusZh[parseInt(data.data)]+ ",不能支付!";
                        }

                        popAlert(text);
                    }*/
                },
                error:function(data){
                    popAlert(data.message);
                    closeWaiting();
                }
            });
        }

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