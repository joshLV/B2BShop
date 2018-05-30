
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/gwq/head.ftl">
    <style>
        .area {
            margin: 20px auto 0px auto;
        }
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
    <div style="background: #fff;">
    <form class="mui-input-group">
        <div class="mui-input-row">
            <label><span style="color:red">*</span>手机号</label>
            <input id='account' type="tel" class="mui-input-clear mui-input" placeholder="请输入手机号">
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>真实姓名</label>
            <input id='nickName' type="text" class="mui-input-clear mui-input" placeholder="请输入真实姓名">
        </div>
        <#--<div class="mui-input-row">-->
            <#--<label><span style="color:red">*</span>身份证号</label>-->
            <#--<input id='idCode' type="number" class="mui-input-clear mui-input" placeholder="请输入身份证号">-->
        <#--</div>-->
        <div class="mui-input-row">
            <label><span style="color:red">*</span>密码</label>
            <input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入密码">
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>确认</label>
            <input id='password_confirm' type="password" class="mui-input-clear mui-input" placeholder="请确认密码">
        </div>
    </form>
    </div>
    <div class="mui-content-padded">
        <button id='reg' class="mui-btn mui-btn-block mui-btn-primary">注册</button>
    </div>
    <div class="mui-content-padded" style="margin-top: 15px; text-align:center ">
        <p style="font-size: 15px;">注册真实可用，注册成功后的用户可用于登录。</p>
    </div>
</div>

<script>
    (function(mui, doc) {
        mui.init();
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }
            var accountBox = doc.getElementById('account');
            var nickNameBox = doc.getElementById('nickName');
//            var idCodeBox = doc.getElementById('idCode');
            var passwordBox = doc.getElementById('password');
            var passwordConfirmBox = doc.getElementById('password_confirm');
            jQuery("#reg").bind('click', function() {
                var regInfo = {
                    account: accountBox.value,
                    password: passwordBox.value,
                    nickName: nickNameBox.value
                };
                var tel=accountBox.value;
                var telReg = !!tel.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/);
                //如果手机号码不能通过验证
                if(telReg == false){
                    popAlert('请输入正确的手机号码');
                    return;
                }
//                if (regInfo.idcode.length != 18) {
//                    popAlert('请输入正确的身份证');
//                    return;
//                }
                if (regInfo.nickName.length <= 1 || regInfo.nickName.length >= 20) {
                    popAlert('真实姓名长度只能在2-20位字符之间');
                    return;
                }
                if (regInfo.password.length < 6) {
                    popAlert('密码最短需要 6 个字符');
                    return;
                }
                var passwordConfirm = passwordConfirmBox.value;
                if (passwordConfirm != regInfo.password) {
                    popAlert('密码两次输入不一致');
                    return;
                }
                showWaiting();
                jQuery.ajax({
                    type: "post",
                    url: fullpath + "/member/username/check?whichclient=whichapp",
                    data:{'property':'userName','userName': regInfo.account},
                    datatype: 'json',
                    success: function(data) {

                        if(data == true){
                            jQuery.ajax({
                                type: "post",
                                url: fullpath + "/member/save?whichclient=whichapp",
                                data: {'userName': regInfo.account, 'password': regInfo.password, 'nickName':regInfo.nickName, 'sex':2},
                                datatype: 'json',
                                success: function (data) {
                                    if (data.status == 'success') {
                                        closeWaiting();
                                        popAlert('注册成功');
                                        setTimeout(function(){jumpto(hosturl + "/member/index?whichclient=whichapp");}, 2000);
                                    } else {
                                        popAlert(data.message);
                                        closeWaiting();
                                    }
                                },
                                error:function(data){
                                    popAlert(data.message);
                                    closeWaiting();
                                }
                            });
                        }else{
                            closeWaiting();
                            popAlert('用户名已存在');
                        }

                    }
                });
            });
    }(mui, document));
</script>
</body>

</html>