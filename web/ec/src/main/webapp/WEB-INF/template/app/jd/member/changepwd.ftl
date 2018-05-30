<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/jd/head.ftl">
    <style>
        .area {
            margin: 20px auto 0px auto;
        }
        .mui-input-group:first-child {
            margin-top: 20px;
        }
        .mui-input-group label {
            width: 25%;
        }
        .mui-input-row label~input,
        .mui-input-row label~select,
        .mui-input-row label~textarea {
            width: 75%;
        }
        .mui-checkbox input[type=checkbox],
        .mui-radio input[type=radio] {
            top: 6px;
        }
        .mui-content-padded {
            margin-top: 25px;
        }
        .mui-btn {
            padding: 10px;
        }
        .mui-input-row label~input, .mui-input-row label~select, .mui-input-row label~textarea{
            margin-top: 1px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" >
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">找回密码</h1>
</header>
<div class="mui-content">
    <form class="mui-input-group">

        <div class="mui-input-row">
            <label>手机号</label>
            <input id='email' type="email" class="mui-input-clear mui-input" placeholder="请输入注册手机号">
        </div>
    </form>
    <div class="mui-content-padded">
        <button id='sendMail' class="mui-btn mui-btn-block mui-btn-primary">提交</button>
    </div>
</div>
<script>
    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }
    }(mui, document));
</script>
</body>
</html>