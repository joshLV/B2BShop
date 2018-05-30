<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/ghdj/head.ftl">
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
    <div class="logo"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');" class="ltext">返回</a></div>
    <div class="mtit">找回密码</div>
    <div class="user"><a href="${base}/member/index?whichclient=whichapp">用户</a></div>

</header>


<div class="mui-content" style="margin-top: 48px;">
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
        mui.back = function(){
            jumpto(fullpath + '/member/index?whichclient=whichapp');
        };
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
                                    jumpto(hosturl + "/member/index?whichclient=whichapp", event);
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