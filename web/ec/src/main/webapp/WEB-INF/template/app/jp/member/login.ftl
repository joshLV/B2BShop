<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/jp/head.ftl">
    <style>
        .mui-input-group:first-child {
            margin-top: 20px;
        }
        .mui-input-group label {
            width: 30%;
        }
        .mui-input-row label~input,
        .mui-input-row label~select,
        .mui-input-row label~textarea {
            width: 70%;
        }
        .mui-checkbox input[type=checkbox],
        .mui-radio input[type=radio] {
            top: 6px;
        }
        .mui-content-padded {
            margin-top: 25px;
        }
        .mui-btn {
            padding:8px 10px;
        }
        .mui-input-row label~input, .mui-input-row label~select, .mui-input-row label~textarea{
            margin-top: 1px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
   <#-- <button type="button" id="back" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>返回
    </button>-->
    <h1 class="mui-title">登录</h1>
</header>
<div class="mui-content">
    <div style=" background: #fff;">
    <form id='login-form' class="mui-input-group">
        <div class="mui-input-row">
            <label>手机号</label>
            <input id='userName' type="tel" class="mui-input-clear mui-input" placeholder="请输入手机号">
        </div>
        <div class="mui-input-row">
            <label>密码</label>
            <input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入密码">
        </div>
    </form>
    <div id="pwd_error" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; margin-top: 10px;"></div>
        <#--
    <form class="mui-input-group">
        <ul class="mui-table-view mui-table-view-chevron">
            <li class="mui-table-view-cell">
                自动登录
                <div id="autoLogin" class="mui-switch">
                    <div class="mui-switch-handle"></div>
                </div>
            </li>
        </ul>
    </form>-->
    </div>
    <div class="mui-content-padded3">
        <button id='login' class="mui-btn mui-btn-block mui-btn-primary">登录</button>
        <div class="link-area">
            <a id='reg' href="#" onclick="gotoRegiste();">注册账号</a> <span class="spliter">|</span>
            <a id='forgetPasswd' href="#" onclick="findpwd();">忘记密码</a>
        </div>
    </div>

</div>
<#include "app/jp/tools.ftl">
<script>
    layer.open({type: 2});
    //检测是不是微信浏览器，如果是微信浏览器就做微信自动登录
    if(isWeiXin()){
        jumpto(weixinLoginUrl);
    }else{
        $(".layermbox").remove();
    }


    var base="${base}";
    (function(mui, doc){
        mui.init({
            statusBarBackground: '#ffffff'
        });

        mui.back = function(){
            jumpto(fullpath + "/app_index");
        }
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }


            var loginButton = doc.getElementById('login');
           // var autoLoginButton = doc.getElementById("autoLogin");
            mui.enterfocus('#login-form input', function() {
                mui.trigger(loginButton, 'click');
            });
        /*
            autoLoginButton.addEventListener('toggle', function(event) {
                setTimeout(function() {
                    var isActive = event.detail.isActive;
                    settings.autoLogin = isActive;
                    app.setSettings(settings);
                }, 50);
            }, false);
            */

        /***
         * 登录
         */
        jQuery("#login").bind('click', function() {
            var userName=jQuery("#userName").val();
            var password=jQuery("#password").val();
            if(userName==''){
                popAlert("请填写手机号！");
                return;
            }
            if(password==''){
                popAlert("请输入密码！");
                return;
            }


            jQuery(this).attr({ "disabled": "disabled" });
            var urls="${base}/member/check?whichclient=whichapp";
            urls+="&type=${type!''}";
            showWaiting();
            jQuery.ajax({
                type: "post",
                url: urls,
                data:{'userName':jQuery("#userName").val(),'password':jQuery("#password").val()},
                datatype: 'json',
                error: function () {
                    closeWaiting();
                    popAlert(data.message);
                    jQuery("#login").removeAttr("disabled");
                },
                success: function(result) {
                    jQuery("#login").removeAttr("disabled");
                    if("error"==result.status){
                        jQuery("#pwd_error").html(result.message);
                        jQuery("#pwd_error").addClass("error");
                        jQuery("#pwd_error").show();
                    }else{
                        var url=hosturl + result.url;
                        jumpto(url);
                    }
                    closeWaiting();
                }
            });
        });
    }(mui, document));


    function gotoRegiste(){
        jumpto(fullpath + "/member/register?whichclient=whichapp");
    }
    function findpwd(){
        jumpto(fullpath + "/findPwdAPP?whichclient=whichapp");
    }
</script>
</body>

</html>