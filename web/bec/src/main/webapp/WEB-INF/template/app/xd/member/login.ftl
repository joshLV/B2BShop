<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/xd/head.ftl">
    <link href="${path}/theme/red/reset.css" rel="stylesheet" />
    <link href="${path}/theme/red/register.css" rel="stylesheet" />
    <style>
        header {
            position: fixed;
            top: 0px;
            right: 0;
            left: 0;
            background:#e12f45;
            padding:8px 0;
            font-size:18px;
            height:30px;
            line-height:30px;
            /*box-shadow: 0px 3px 6px #d32137;*/
            z-index:10;text-align:center;
        }
        .logo{ position:absolute;left:10px;float:left;}
        .logo a{ color:#fff;}
        .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
        .user { position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
        .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/xd/images/user.png) no-repeat; background-size: 20px
        20px;}

        .mtit{color:#fff;}

        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/xd/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:5px;}


        .login-tel{margin-top: 44px;filter:alpha(opacity=100 finishopacity=50 style=1 startx=0,starty=0,finishx=0,finishy=150) progid:DXImageTransform.Microsoft.gradient(startcolorstr=#aa0202,endcolorstr=#fea1a3,gradientType=0);
    </style>
</head>

<body>
<header>
    <#--<div class="logo"><a href="javascript:jumpto(fullpath + '/zcgoods/list');" class="ltext">返回</a></div>-->
        <div class="logo"><a href="javascript:jumpto(fullpath + '/app_index');" class="ltext">返回</a></div>
    <div class="mtit">登录</div>
</header>


<div class="login" style="padding-top: 20px;">
    <form id='login-form' >
        <ul>
            <li class="login-tel"><div class="mui-input-row"><input id='userName' type="tel" pattern="[0-9]*" placeholder="手机号：请输入手机号" class="login-inputs mui-input-clear"></div></li>
            <li class="login-pwd"><div class="mui-input-row"><input id='password' type="password" placeholder="密码：请输入密码" class="login-inputs mui-input-clear"></div></li>
            <!--<li class="reg-numb"><a href="#" onclick="gotoRegiste();">注册账号</a>&nbsp;|&nbsp;<a href="#" onclick="findpwd();">忘记密码</a></li>-->
	    <li class="reg-numb"><a href="#" onclick="findpwd();">忘记密码</a></li>
        </ul>
    </form>
</div>
<div class="reg-btn login-btn">
    <button id='login' type="button" class="submits-btn">登录</button>
</div>
<div>
<ul>
<li class="reg-numb" style="line-height: 22px;font-size: 12px;">喜都交易平台微信端支持下单订货、确认验收货等功能，暂不支持手机端付款，请您留意。</li>
</ul>
</div>
<script>
    var base="${base}";
    (function(mui, doc){
        mui.init({

        });
        mui.back = function(){
            jumpto(fullpath + '/zcgoods/list');
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
        mui.enterfocus('#login-form input', function() {
            mui.trigger(loginButton, 'click');
        });

        /***
         * 登录
         */
        jQuery("#login").bind('click', function() {
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
                        popAlert(result.message);
//                        jQuery("#pwd_error").html(result.message);
//                        jQuery("#pwd_error").addClass("error");
//                        jQuery("#pwd_error").show();
                    }else if("regRep"==result.status){
                        var layer_confrim = layer.open({
                            title:'提示：',
                            content:'您还未上传资质信息，不能登录！</br>确定要继续上传吗?',
                            btn: ['确认', '取消'],
                            shadeClose: false,
                            yes: function(){
                                layer.close(layer_confrim);
                                jumpto(fullpath + '/member/registerForward?whichclient=whichapp&buyerId='+result.buyerId);
                            },
                            no: function(){
                                closeWaiting();
                            }
                        });
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