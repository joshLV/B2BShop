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
            padding: 10px;
        }
        .mui-input-row label~input, .mui-input-row label~select, .mui-input-row label~textarea{
            margin-top: 1px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">找回密码</h1>
</header>
<div class="mui-content">
    <form class="mui-input-group">

        <div class="mui-input-row" style="display: none">
            <label>帐号</label>
            <input id='account' type="text" class="mui-input-clear mui-input" placeholder="请输入帐号">
        </div>
        <div class="mui-input-row">
            <label>手机号</label>
            <input id='phone' type="tel" class="mui-input-clear mui-input" placeholder="请输入注册手机号">
        </div>
    </form>
    <div id="outLine" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; margin-top: 10px; font-size: 12px"></div>
    <div class="mui-content-padded">
        <button id='sendSMS' class="mui-btn mui-btn-block mui-btn-primary" type="button">提交</button>
    </div>
</div>
<script>
    (function(mui, doc) {
//        mui.back = function(){
//            jumpto(fullpath + '/member/index?whichclient=whichapp');
//        };
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

        jQuery("#sendSMS").bind('tap', function(event){
            showWaiting( );
            var accountBox = doc.getElementById('account');
            var phoneBox = doc.getElementById('phone');
            accountBox.value = phoneBox.value;
            var phoneInfo = {
                account : phoneBox.value,
                mobile : phoneBox.value
            };

            if (phoneInfo.mobile.length < 11) {
                outSet('手机号码格式不正确1');
                closeWaiting();
                return;
            }



            jQuery.ajax({
                type: "post",
                url: fullpath + "/ajaxCheckUser?whichclient=whichapp",
                data:{'username': phoneInfo.account},
                datatype: 'json',
                success: function(data) {
                    if(data.status == 'success'){
                        jQuery.ajax({
                            type: "post",
                            url: fullpath + "/ajaxSendSMS?whichclient=whichapp",
                            data: {'username':  phoneInfo.account, 'mobile': phoneInfo.mobile},
                            datatype: 'json',
                            success: function (data) {
                                if (data.status == 'success') {
                                    closeWaiting();
                                    outSet('重置成功,跳转到登陆页面...');
                                    if(isWeiXin()){
                                        jumpto(weixinLoginUrl);//如果是在微信浏览器找回密码的话跳转到微信自动登录地址重新获取openId,防止openId已经过期
                                    }else{
                                        jumpto(hosturl + "/member/index?whichclient=whichapp", event);
                                    }
                                } else {
                                    closeWaiting();
                                    outSet(data.message);
                                    return;
                                }
                            }
                        });
                    }
                    else
                    {
                        outSet('用户不存在!');
                        closeWaiting();
                        return;
                    }

                }
            });

        });
    }(mui, document));
</script>
</body>
</html>