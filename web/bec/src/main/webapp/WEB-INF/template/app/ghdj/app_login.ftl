<!DOCTYPE html>
<html>
<head>
<#include "app/ghdj/head.ftl">
    <link href="${path}/theme/red/reset.css" rel="stylesheet" />
    <link href="${path}/theme/red/register.css" rel="stylesheet" />

    <style>

        /*top*/
        header{
            position: fixed;
            top: 0px;
            right: 0;
            left: 0;
            background:#e12f45;
            padding:8px 0;
            font-size:18px;
            height:30px;
            line-height:30px;
            box-shadow: 0px 3px 6px #999;
            z-index:10;text-align:center;}
        .logo{ position:absolute;left:10px;float:left;}
        .logo a{ color:#fff;}
        .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
        .user{ position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
        .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/ghdj/images/user.png) no-repeat; background-size: 20px
        20px;}

        .mtit{color:#fff;}


        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghdj/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:5px;}


    </style>
</head>
<body>
<header>
    <div class="logo"><a href="javascript:window.history.back(-1);" class="ltext">返回</a></div>
    <div class="mtit">登录</div>
 <#--   <div class="user"><a href="${base}/member/index?whichclient=whichapp">用户</a></div>-->

</header>

<div class="login" style="margin-top: 48px;">
    <ul>
        <li class="login-tel"><input type="text" placeholder="手机号：请输入手机号" class="login-inputs"></li>
        <li class="login-pwd"><input type="text" placeholder="密码：请输入密码" class="login-inputs"></li>
        <li class="reg-numb"><a href="register.html">注册账号</a>&nbsp;|&nbsp;<a href="#">忘记密码</a></li>
    </ul>
</div>
<div class="reg-btn login-btn">
    <button id="submits" type="button" class="submits-btn">登录</button>
</div>
</body>
</html>