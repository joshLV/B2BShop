
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/jd/head.ftl">
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" id="back" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>返回
    </button>
    <h1 class="mui-title">登录</h1>
</header>
<div class="mui-content">
    <form id='login-form' class="mui-input-group">
        <div class="mui-input-row">
            <label>账号</label>
            <input id='userName' type="text" class="mui-input-clear mui-input" placeholder="请输入账号" value="admin">
        </div>
        <div class="mui-input-row">
            <label>密码</label>
            <input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入密码" value="admin123">
        </div>
    </form>
    <div id="pwd_error" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; margin-top: 10px;"></div>
    <form class="mui-input-group">
        <ul class="mui-table-view mui-table-view-chevron">
            <li class="mui-table-view-cell">
                自动登录
                <div id="autoLogin" class="mui-switch">
                    <div class="mui-switch-handle"></div>
                </div>
            </li>
        </ul>
    </form>
    <div class="mui-content-padded3">
        <button id='login' class="mui-btn mui-btn-block mui-btn-primary">登录</button>
        <div class="link-area">
            <a id='reg' href="${base}/member/register?whichclient=whichapp">注册账号</a> <span class="spliter">|</span>
            <a id='forgetPasswd' href="${base}/findPwdAPP?whichclient=whichapp">忘记密码</a>
        </div>
    </div>
</div>
<script>
    var base="${base}";
    (function(mui, doc){
        mui.init({
            statusBarBackground: '#ffffff'
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }


            var loginButton = doc.getElementById('login');
            var autoLoginButton = doc.getElementById("autoLogin");
            mui.enterfocus('#login-form input', function() {
                mui.trigger(loginButton, 'tap');
            });
            autoLoginButton.addEventListener('toggle', function(event) {
                setTimeout(function() {
                    var isActive = event.detail.isActive;
                    settings.autoLogin = isActive;
                    app.setSettings(settings);
                }, 50);
            }, false);
            jQuery(".mui-action-back").on('tap click',function(e){
                var url=fullpath + '/app_index';
                jumpto(url);
            });
    }(mui, document));



    /***
     * 登录
      */
    jQuery("#login").bind('tap click', function() {
        jQuery(this).attr({ "disabled": "disabled" });
        var urls="${base}/member/check?whichclient=whichapp";
        urls+="&type=${type!''}";
        jQuery.ajax({
            type: "post",
            url: urls,
            data:{'userName':$("#userName").val(),'password':$("#password").val()},
            datatype: 'json',
            error: function () {
                jQuery("#login").removeAttr("disabled");
            },
            success: function(result) {
                jQuery("#login").removeAttr("disabled");
                if("error"==result.status){
                    $("#pwd_error").html(result.message);
                    $("#pwd_error").addClass("error");
                    $("#pwd_error").show();
                }else{
                    var url=hosturl + result.url;
                    jumpto(url);
                }
            }
        });
    });
</script>
</body>

</html>