<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/ghj/head.ftl">
    <style>
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
        /*top*/
        header{
            position: fixed;
            top: 0px;
            right: 0;
            left: 0;
            padding:8px 0;
            font-size:17px;
            height:30px;
            line-height:30px;
            z-index:10;text-align:center;
            background: #fff;border-bottom: 1px solid #ddd;box-shadow: 0 0 6px #ccc;}
        .logo{ position:absolute;left:10px;float:left;}
        .logo a{ color:#666;}
        .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
        .user{ position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
        .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/ghj/images/user.png) no-repeat;background-size: 20px
        20px;}
        .mtit{color:#444;}
        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghj/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:5px;}
        .mui-input-group .mui-input-row:after{ background:none;}
        .mui-btn-primary{ border-radius: 20px;font-size: 16px;}

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
        <button id='sendSMS' class="mui-btn mui-btn-block mui-btn-primary" type="button">提 交</button>
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
                                    //询问框
                                    layer.open({
                                        content: '重置成功,跳转到登陆页面'
                                        ,btn: ['确定']
                                        ,yes: function(index){
                                            layer.close(index);
                                            jumpto(hosturl + "/member/index?whichclient=whichapp", event);
                                        }
                                    });

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