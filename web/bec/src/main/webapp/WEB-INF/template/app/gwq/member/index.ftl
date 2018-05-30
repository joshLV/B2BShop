﻿
<!DOCTYPE html>
<html>

<head>
<#include "app/gwq/head.ftl">
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
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left"
            style="height: 44px;">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">个人中心</h1>
</header>
<div class="mui-content">
    <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-collapse">
            <a class="mui-navigate-right" href="#">订单中心</a>
            <ul class="mui-table-view  mui-table-view-chevron">
                <li class="mui-table-view-cell">
                    <a href="javascript:go('/order/list?whichclient=whichapp')" class="mui-navigate-right">我的订单</a>
                </li>
                <li class="mui-table-view-cell">
                    <a href="javascript:go('/cart/list?whichclient=whichapp&isLogin=1')" class="mui-navigate-right">我的购物车</a>
                </li>
            </ul>
        </li>
        <li class="mui-table-view-cell mui-collapse mui-active">
            <a class="mui-navigate-right" href="#">询价单</a>
            <ul class="mui-table-view  mui-table-view-chevron">
                <li class="mui-table-view-cell">
                    <a href="javascript:go('/enquiry/publish?whichclient=whichapp')" class="mui-navigate-right">发布询价单</a>
                </li>
                <li class="mui-table-view-cell">
                    <a href="javascript:go('/enquiry/list?whichclient=whichapp')" class="mui-navigate-right">所有询价单</a>
                </li>
            </ul>
        </li>
        <li class="mui-table-view-cell mui-collapse">
            <a class="mui-navigate-right" href="#">账户中心</a>
            <ul class="mui-table-view  mui-table-view-chevron">
                <li class="mui-table-view-cell">
                    <a href="javascript:go('/member/info?whichclient=whichapp')" class="mui-navigate-right">账户信息</a>
                </li>
                <li class="mui-table-view-cell">
                    <a href="javascript:go('/member/changepwd/list?whichclient=whichapp')" class="mui-navigate-right">修改登陆密码</a>
                </li>
                <li class="mui-table-view-cell">
                    <a href="javascript:go('/member/vantages/list?whichclient=whichapp')" class="mui-navigate-right">积分信息</a>
                </li>
                <li class="mui-table-view-cell">
                    <a href="javascript:go('/member/receiver?whichclient=whichapp')" class="mui-navigate-right">收货地址</a>
                </li>
                <li class="mui-table-view-cell">
                    <a href="javascript:go('/member/goodsattention/list?whichclient=whichapp')"
                       class="mui-navigate-right">我的关注</a>
                </li>
                <li class="mui-table-view-cell">
                    <a href="javascript:go('/member/history/list?whichclient=whichapp')"
                       class="mui-navigate-right">历史浏览</a>
                </li>
            </ul>
        </li>
        <!--  <li class="mui-table-view-cell">
              <span class="themes">主题设置：</span><span class="green-box"></span>  <span class="blue-box"></span> <span class="red-box"></span>
          </li> -->
    </ul>
    <div class="mui-content-padded">
        <button id='exit' class="mui-btn mui-btn-block mui-btn-primary">退出</button>
    </div>
</div>
<#include "app/gwq/tools.ftl">
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
    function logout() {
        jumpto(hosturl + '/member/logout?whichclient=whichapp');
    }

    //退出操作******************
    jQuery("#exit").bind("tap", function () {
        logout();
    });
    function go(url) {
        jumpto(fullpath + url);
    }

</script>
</html>