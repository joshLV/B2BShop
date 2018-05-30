
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

    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" >
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">注册</h1>
</header>
<div class="mui-content">
    <form class="mui-input-group">
        <div class="mui-input-row">
            <label>手机号</label>
            <input id='account' type="text" class="mui-input-clear mui-input" placeholder="请输入账号">
        </div>
        <div class="mui-input-row">
            <label>密码</label>
            <input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入密码">
        </div>
        <div class="mui-input-row">
            <label>确认</label>
            <input id='password_confirm' type="password" class="mui-input-clear mui-input" placeholder="请确认密码">
        </div>
    </form>
    <div class="mui-content-padded">
        <button id='reg' class="mui-btn mui-btn-block mui-btn-primary">注册</button>
    </div>
    <div class="mui-content-padded">
        <p>注册真实可用，注册成功后的用户可用于登录。</p>
    </div>
</div>

<script>
    (function($, doc) {
        $.init();
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }
            var regButton = doc.getElementById('reg');
            var accountBox = doc.getElementById('account');
            var passwordBox = doc.getElementById('password');
            var passwordConfirmBox = doc.getElementById('password_confirm');
            regButton.addEventListener('tap', function(event) {
                var regInfo = {
                    account: accountBox.value,
                    password: passwordBox.value,
                };
                var passwordConfirm = passwordConfirmBox.value;
                if (passwordConfirm != regInfo.password) {
                    plus.nativeUI.toast('密码两次输入不一致');
                    return;
                }
                app.reg(regInfo, function(err) {
                    if (err) {
                        plus.nativeUI.toast(err);
                        return;
                    }
                    plus.nativeUI.toast('注册成功');
                    $.openWindow({
                        url:  base+"member/index?whichclient=whichapp",
                        id: 'index',
                        show: {
                            aniShow: 'pop-in'
                        }
                    });
                });
            });
    }(mui, document));
</script>
</body>

</html>