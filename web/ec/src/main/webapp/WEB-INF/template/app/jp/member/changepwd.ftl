<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/jp/head.ftl">
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
            padding: 10px;
        }
        .mui-input-row label~input, .mui-input-row label~select, .mui-input-row label~textarea{
            margin-top: 1px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" >
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">修改登录密码</h1>
</header>
<div class="mui-content">
    <form class="mui-input-group">

        <div class="mui-input-row">
            <label>旧密码</label>
            <input id='oldPwd' type="password" class="mui-input-clear mui-input" placeholder="请输入原始密码">
        </div>
        <div class="mui-input-row">
            <label>新密码</label>
            <input id='newPwd' type="password" class="mui-input-clear mui-input" placeholder="请输入新密码">
        </div>
        <div class="mui-input-row" style="background-color:transparent;">
            <label>确认密码</label>
            <input id='repeatPwd' type="password" class="mui-input-clear mui-input" placeholder="请再次输入密码">
        </div>
        <div id="showInfo" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; margin-top: 10px;"></div>
    </form>
    <div class="mui-content-padded">
        <button id='sendMail' class="mui-btn mui-btn-block mui-btn-primary">提交</button>
    </div>
</div>
<script>
    (function(mui, doc) {
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
        jQuery("#sendMail").bind("tap",function(e){
            var oldPwd=jQuery("#oldPwd").val();
            var newPwd=jQuery("#newPwd").val();
            var repeatPwd=jQuery("#repeatPwd").val();

            if(oldPwd == ""){
                popAlert('旧密码不能为空!');
                return false;
            }
            if(newPwd == ""){
                popAlert('新密码不能为空!');
                return false;
            }
            if(newPwd.length<6 || newPwd.length>20){
                popAlert('新密码由字母加数字或符号至少两种以上字符组成的6-20位半角字符，区分大小写!');
                return false;
            }
            if(newPwd != repeatPwd){
                popAlert('两次输入密码不一致!');
                return false;
            }

            var patrn=/^[0-9]{1,20}$/;
            if(patrn.test(newPwd)){
                popAlert("密码过于简单!");
                return false;
            }
            showWaiting();
            jQuery.ajax({
                type:"get",
                url:"${base}/member/changepwd/ajaxCheckPwd",
                data:{"password":oldPwd},
                success:function(data){
                    jQuery("#showInfo").html();
                    if(data.status=="success"){
                        jQuery.ajax({
                            type:"get",
                            url:"${base}/member/changepwd/ajaxchangePwd",
                            data:"newpwd="+newPwd+"&oldpwd="+oldPwd,
                            success:function(data){

                                if(data.status=="success"){
                                    closeWaiting();
                                    jQuery("button").prop({disabled: true});
                                    jQuery("#showInfo").html("密码修改成功!");
                                    jQuery("#showInfo").addClass("error");
                                    jQuery("#showInfo").show();
                                    var secend = 3;
                                    var interval = window.setInterval(function(){
                                        jQuery("#showInfo").html("密码修改成功!即将自动退出!" + secend + "s");
                                        jQuery("#showInfo").addClass("error");
                                        jQuery("#showInfo").show();
                                        secend = secend - 1;
                                        if( secend == -1){
                                            window.clearInterval(interval);
                                            jumpto(hosturl + '/member/logout?whichclient=whichapp', e);
                                        }
                                    },1000);

                                }else{
                                    closeWaiting();
                                    popAlert("密码修改失败!");
                                }

                            }
                        });
                    }else{
                        closeWaiting();
                        popAlert("旧密码不正确!");
                        return false;
                    }
                }
            });
        });
    }(mui, document));
</script>
</body>
</html>