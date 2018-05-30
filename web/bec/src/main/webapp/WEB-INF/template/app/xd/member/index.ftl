<!DOCTYPE html>
<html>

<head>
<#include "app/xd/head.ftl">
    <link href="${path_skin}/xd_style.css" rel="stylesheet"/>
    <style>
        html,
        body {
            background-color: #efeff4;
        }

        .mui-views,
        .mui-view,
        .mui-pages,
        .mui-page,
        .mui-page-content {
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
            width: 100%;
            height: 100%;
            background-color: #efeff4;
        }

        .mui-pages {
            top: 46px;
            height: auto;
        }

        .mui-scroll-wrapper,
        .mui-scroll {
            background-color: #efeff4;
        }

        .mui-page.mui-transitioning {
            -webkit-transition: -webkit-transform 200ms ease;
            transition: transform 200ms ease;
        }

        .mui-page-left {
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }

        .mui-ios .mui-page-left {
            -webkit-transform: translate3d(-20%, 0, 0);
            transform: translate3d(-20%, 0, 0);
        }

        .mui-navbar {
            position: fixed;
            right: 0;
            left: 0;
            z-index: 10;
            height: 44px;
            background-color: #f7f7f8;
        }

        .mui-navbar .mui-bar {
            position: absolute;
            background: transparent;
            text-align: center;
        }

        .mui-android .mui-navbar-inner.mui-navbar-left {
            opacity: 0;
        }

        .mui-ios .mui-navbar-left .mui-left,
        .mui-ios .mui-navbar-left .mui-center,
        .mui-ios .mui-navbar-left .mui-right {
            opacity: 0;
        }

        .mui-navbar .mui-btn-nav {
            -webkit-transition: none;
            transition: none;
            -webkit-transition-duration: .0s;
            transition-duration: .0s;
        }

        .mui-navbar .mui-bar .mui-title {
            display: inline-block;
            position: static;
            width: auto;
        }

        .mui-page-shadow {
            position: absolute;
            right: 100%;
            top: 0;
            width: 16px;
            height: 100%;
            z-index: -1;
            content: '';
        }

        .mui-page-shadow {
            background: -webkit-linear-gradient(left, rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, 0) 10%, rgba(0, 0, 0, .01) 50%, rgba(0, 0, 0, .2) 100%);
            background: linear-gradient(to right, rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, 0) 10%, rgba(0, 0, 0, .01) 50%, rgba(0, 0, 0, .2) 100%);
        }

        .mui-navbar-inner.mui-transitioning,
        .mui-navbar-inner .mui-transitioning {
            -webkit-transition: opacity 200ms ease, -webkit-transform 200ms ease;
            transition: opacity 200ms ease, transform 200ms ease;
        }

        .mui-page {
            display: none;
        }

        .mui-pages .mui-page {
            display: block;
        }

        .mui-page .mui-table-view:first-child {
            margin-top: 15px;
        }

        .mui-page .mui-table-view:last-child {
            margin-bottom: 30px;
        }

        .mui-table-view {
            margin-top: 20px;
        }

        .mui-table-view:after {
            height: 0;
        }

        .mui-table-view span.mui-pull-right {
            color: #999;
        }

        .mui-table-view-divider {
            background-color: #efeff4;
            font-size: 14px;
        }

        .mui-table-view-divider:before,
        .mui-table-view-divider:after {
            height: 0;
        }

        .mui-content-padded {
            margin: 10px 0px;
        }

        .mui-locker {
            margin: 35px auto;
            display: none;
        }

        .input_style{width:100%;height:40px; line-height:40px;font-size:16px;border:none;outline:0;background:#e12f45;color:#fff;margin-top:10px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;font-size:15px; letter-spacing:1px;font-family:"微软雅黑";}
        .input_style:hover{ background:#ce293e;}
        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/xd/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:5px;}
/*        .state_list li{
            width: 25%!important;
        }*/

    </style>
</head>

<body>
<header>
    <#--<div class="logo"><a href="${base}/zcgoods/list" class="ltext">返回</a></div>-->
        <div class="logo"><a href="${base}/app_index" class="ltext">返回</a></div>
    <div class="mtit">我的喜都</div>
    <#--<div class="user"><a href="${base}/member/index?whichclient=whichapp">用户</a></div>-->
</header>

<#--新做会员中心-->
<div class="user_pic" style="margin-top: 28px;" onclick="go('/member/info?whichclient=whichapp')">
    <img src="${path}/images/pic6.jpg">
    <span>${mb.userName}[${mb.realName}]</span>
</div>
<div class="ttl_div clearfix">
    <p>我的订单</p>
   
    <a href="javascript:go('/order/list?orderBy=a.createDate&orderType=desc&currentStatus=all&whichclient=whichapp')">查看全部订单</a>
</div>
<ul class="state_list clearfix">
	
    <li><a href="javascript:go('/order/list?orderBy=a.createDate&orderType=desc&status=wait_buyer_pay&whichclient=whichapp&paymentStatus=unpaid#wait_buyer_pay')"><span><img src="${path}/images/ico_12.png" alt=""></span>待付款</a></li>

    <li><a href="javascript:go('/order/list?orderBy=a.createDate&orderType=desc&status=wait_seller_send_goods&whichclient=whichapp&paymentStatus=paid&shippingStatus=unshipped#wait_seller_send_goods')"><span><img src="${path}/images/ico_13.png" alt=""></span>待发货</a></li>
    <li><a href="javascript:go('/order/list?orderBy=a.createDate&orderType=desc&status=wait_buyer_confirm_goods&whichclient=whichapp&paymentStatus=paid&shippingStatus=shipped#wait_buyer_confirm_goods')"><span><img src="${path}/images/ico_14.png" alt=""></span>待收货</a></li>
<#--
    <li><a href="javascript:go('/order/list?orderBy=a.createDate&orderType=desc&status=wait_buyer_validate_goods&whichclient=whichapp&paymentStatus=paid&shippingStatus=takeover#wait_buyer_validate_goods')"><span><img src="${path}/images/ico_15.png" alt=""></span>待验货</a></li>
-->
</ul>
<ul class="navi_list clearfix">
    <li><em><img src="${path}/images/u_bg1.png"></em><a href="javascript:go('/member/info?whichclient=whichapp')">个人信息</a></li>
<#--
    <li><em><img src="${path}/images/u_bg7.png"></em><a href="javascript:go('/account/indexAccount?whichclient=whichapp')">账户管理</a></li>
-->

    <li><em><img src="${path}/images/u_bg8.png"></em><a href="javascript:go('/cart/list?whichclient=whichapp')">我的购物车</a>

    <li><em><img src="${path}/images/u_bg2.png"></em><a href="javascript:go('/member/changepwd/list?whichclient=whichapp')">修改密码</a></li>
    <li><em><img src="${path}/images/u_bg7.png"></em><a href="javascript:go('/member/vantages/list?whichclient=whichapp')">积分信息</a></li>
    <li><em><img src="${path}/images/u_bg3.png"></em><a href="javascript:go('/member/receiver?whichclient=whichapp')">收货地址</a></li>
    <li><em><img src="${path}/images/u_bg10.png"></em><a href="javascript:go('/order/review?whichclient=whichapp')">我的评价</a>
        <#if unreadGoodsReviewCount gt 0>
        <span style="float: right;color:white;background-color: red; margin: -32px 180px 0 0; text-align: center;width: 25px;height: 20px;line-height: 20px;border-radius: 45%;">
        ${unreadGoodsReviewCount}
        </span>
        </#if>
    </li>
    <li><em><img src="${path}/images/u_bg4.png"></em><a href="javascript:go('/member/goodsattention/list?whichclient=whichapp')">我的关注</a></li>
    <li><em><img src="${path}/images/u_bg5.png"></em><a href="javascript:go('/member/history/list?whichclient=whichapp')">历史浏览</a></li>
</ul>

<div style="height: 60px;"></div>
<#include "app/xd/tools.ftl">
</body>
<script>
    (function (mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff'
        });

        mui.back = function () {
            jumpto(fullpath + "/app_index");
        }
        if (ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }
    }(mui, document));
    function go(url) {
        jumpto(fullpath + url);
    }

</script>
</html>