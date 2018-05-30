
<!DOCTYPE html>
<html class="ui-page-login">

<head>
    <#assign path="${base}/static/app/nsc"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title></title>
    <link href="${base}/static/app/nsc/theme/red/mui.min.css" rel="stylesheet" />
        <link href="${base}/static/app/nsc/theme/red/my.css" rel="stylesheet" />
    <link href="${base}/static/app/nsc/theme/red/style.css" rel="stylesheet" />
        <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js"></script>
        <script src="${base}/static/mall/nsc/js/base.js" type="text/javascript"></script>



</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" id="back" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>返回
    </button>
    <h1 class="mui-title">登录</h1>
</header>
<div class="mui-content">
    <form id='login-form' class="mui-input-group">
        <div class="mui-input-row">
            <label>账号</label>
            <input id='userName' type="text" class="mui-input-clear mui-input" placeholder="请输入账号">
        </div>
        <div class="mui-input-row">
            <label>密码</label>
            <input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入密码">
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
            <a id='reg' href="javascript:registAPP();">注册账号</a> <span class="spliter">|</span>
            <a id='forgetPasswd' href="${base}/findPwdAPP?whichclient=whichapp">忘记密码</a>
        </div>
    </div>

    <div class="mui-content-padded oauth-area">

    </div>
</div>
<script src="${base}/static/app/nsc/js/mui.min.js"></script>
<script src="${base}/static/app/nsc/js/mui.enterfocus.js"></script>
<script src="${base}/static/app/nsc/js/app.js"></script>
<script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js"></script>
<script>

    var base="${base}";
    var fullpath = "";
    function getWebRootPath() {
        var webroot=document.location.href;
        var header = webroot.substring(0, webroot.indexOf('//')+2);
        webroot=webroot.substring(webroot.indexOf('//')+2,webroot.length);
        var serverName = webroot.substring(0, webroot.indexOf('/')+1);
        webroot=webroot.substring(webroot.indexOf('/')+1,webroot.length);
        webroot=webroot.substring(0,webroot.indexOf('/'));
        var rootpath="/"+webroot;
        fullpath = header  + serverName + webroot;
        return header  + serverName;
    }
    var hosturl = getWebRootPath();
    var ismobile=true;
    if(typeof(mui.os.android)=='undefined' && typeof(mui.os.ios)=='undefined'){
        ismobile=false;
    }
    if(typeof(mui.os.plus)=='undefined'){
        ismobile=false;
    }
    function forgetPasswordAPP() {
        return location.href ="${base}/findPwdAPP?whichclient=whichapp";
    }
    function registAPP() {
        return location.href = "${base}/member/register?whichclient=whichapp";
    }
    (function(mui, doc){
        mui.init({
            statusBarBackground: '#f7f7f7'
        });
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
                if(ismobile){
                    mui.openWindow({
                        url: url,
                        id:'home'
                    });
                }else {
                    window.location.href = url;
                }
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
                    var url=fullpath +result.url;
                    if(ismobile){
                        mui.openWindow({
                            url: url
                        });
                    }else {
                        window.location.href = url;
                    }
                }
            }
        });
    });
</script>
</body>

</html>