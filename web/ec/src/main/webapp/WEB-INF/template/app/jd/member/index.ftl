﻿
<!DOCTYPE html>
<html>

<head>
<#include "app/jd/head.ftl">
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
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" style="height: 44px;">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">个人中心</h1>
</header>
    <div class="mui-content">
                <ul class="mui-table-view mui-table-view-chevron" style="border-bottom:1px solid #CCC">
                    <li class="mui-table-view-cell">
                        <a href="${base}/order/list?whichclient=whichapp" class="mui-navigate-right" >我的订单</a>
                    </li>
                    <li class="mui-table-view-cell">
                        <a href="${base}/cart/list?whichclient=whichapp&isLogin=1" class="mui-navigate-right" >我的购物车</a>
                    </li>
                    <li class="mui-table-view-cell">
                        <a href="${base}/member/changepwd/list?whichclient=whichapp" class="mui-navigate-right" id="forget_password">重置登陆密码</a>
                    </li>
                    <li class="mui-table-view-cell">
                        <a href="${base}/member/receiver?whichclient=whichapp" class="mui-navigate-right" id="tel">收货地址</a>
                    </li>
                    <li class="mui-table-view-cell">
                        <a href="${base}/member/update_tel?whichclient=whichapp" class="mui-navigate-right">修改手机号</a>
                    </li>
                    <li class="mui-table-view-cell">
                        <a id="tel3" >客服电话：029-12345678</a>
                    </li>
                  <!--  <li class="mui-table-view-cell">
                        <span class="themes">主题设置：</span><span class="green-box"></span>  <span class="blue-box"></span> <span class="red-box"></span>
                    </li> -->
                </ul>
                <div class="mui-content-padded">
                    <button id='exit' class="mui-btn mui-btn-block mui-btn-primary">退出</button>
                </div>
    </div>
<#include "app/jd/tools.ftl">
</body>
<script>
    function s() {
        jumpto(hosturl + '/member/logout?whichclient=whichapp');
    }
    //客服电话
    document.getElementById("tel3").addEventListener('tap', function() {
        plus.device.dial("02912345678");
    });
    //退出操作******************
    jQuery("#exit").bind("tap click",function(){
        s();
    });
</script>
</html>