<!DOCTYPE html>
<html>
<head>
    <#include "app/jp/head.ftl">
   <style>
       .mui-input-row label{width: 30%}
       .mui-input-row span{padding:10px 15px;font-size: 14px;color: #ff0000;}
        #yam{width: 35%;float:left}
        #getyzm{width: 30%;float:left;margin: 0;padding: 8px 0}
       .mui-input-row .mui-input-clear~.mui-icon-clear, .mui-input-row .mui-input-speech~.mui-icon-speech{line-height: 10px;}
   </style>


</head>
<body>

<header class="mui-bar mui-bar-nav" >
    <div class="mui-pull-left"> <img src="${path}/images/zlogo_simple.png" style=" display:block; margin-top: 5px; "> </div>
    <div class="mui-title" style="left:80px;">
        <span><@spring.message "project_name"/></span>
    </div>
</header>

<div class="mui-content" id="topbar" style="margin-top: 45px;">
    <div class="mui-input-row">
        <span>提示：您已通过微信授权，请绑定您的手机号!</span>
    </div>
    <div id="segmentedControl" class="mui-segmented-control fonts" style="margin-top:20px;">
        <a name="owlNavTab" class="mui-control-item mui-active" href="#item1owl" > 新账号绑定 </a>
        <a name="owlNavTab" class="mui-control-item" href="#item2owl" > 已有账号绑定 </a>
    </div>
    <div id="item1owl" class="tabs owltabs"  style=" background: #fff;">
            <div class="mui-input-row" style="margin-top:25px;">
                <label>手机号码:</label>
                <input id='zc_username' type="tel" style="width: 70%" class="mui-input-clear mui-input" placeholder="请输入手机号用于登录">
            </div>
            <div class="mui-input-row" >
                <label>输入密码:</label>
                <input id='zc_password' type="password" style="width: 70%" class="mui-input-clear mui-input" placeholder="请输入密码">
            </div>
            <div class="mui-input-row" >
                <label>确认密码:</label>
                <input id='zc_password2' type="password" style="width: 70%" class="mui-input-clear mui-input" placeholder="请确认密码">
            </div>
<#--            <div class="mui-input-row">
                <label>验&nbsp;&nbsp;证&nbsp;码:</label>
                <input id='yam' type="tel" class="mui-input-clear mui-input" placeholder="请输入验证码">
                <button id='getyzm' class="mui-btn mui-btn-block mui-btn-primary">获取验证码</button>
            </div>-->
        <div class="mui-content-padded3">
            <button id='toIndex' class="mui-btn mui-btn-block mui-btn-primary" style="width: 48%;float: left;margin-right: 4%;border:1px solid #bbb;background-color:#bbb">暂不绑定</button>
            <button id='zc_login' class="mui-btn mui-btn-block mui-btn-primary" style="width: 48%;float: right">确认绑定</button>
        </div>
        <div class="link-area" style="margin-top:80px;">
            <a id='reg' style="color:#E4393C;" href="javascript:void(0)" onclick="gotoRegiste();">注册账号</a> <span class="spliter">|</span>
            <a id='forgetPasswd' style="color:#E4393C;" href="javascript:void(0)" onclick="findpwd();">忘记密码</a>
        </div>
    </div>
    <div id="item2owl" class="tabs owltabs" style=" background: #fff;display: none">
            <div class="mui-input-row" style="margin-top:25px;">
                <label>手机号码:</label>
                <input id='lg_username' type="tel" style="width: 70%" class="mui-input-clear mui-input" placeholder="请输入手机号用于登录">
            </div>
            <div class="mui-input-row" >
                <label>输入密码:</label>
                <input id='lg_password' type="password" style="width: 70%" class="mui-input-clear mui-input" placeholder="请输入密码">
            </div>
        <div class="mui-content-padded3">
            <button id='toIndex' class="mui-btn mui-btn-block mui-btn-primary" style="width: 48%;float: left;margin-right: 4%;border:1px solid #bbb;background-color:#bbb">暂不绑定</button>
            <button id='login' class="mui-btn mui-btn-block mui-btn-primary" style="width: 48%;float: right">确认绑定</button>
        </div>
        <div class="link-area" style="margin-top:80px;">
            <a id='reg' style="color:#E4393C;" href="javascript:void(0)" onclick="gotoRegiste();">注册账号</a> <span class="spliter">|</span>
            <a id='forgetPasswd' style="color:#E4393C;" href="javascript:void(0)" onclick="findpwd();">忘记密码</a>
        </div>
    </div>

</div>



<script>

    jQuery("a[name='owlNavTab']").bind("tap", function (e) {
        jQuery(".owltabs").hide();
        var href = e.target.href;
        var tabId = '#' + href.split('#')[1];
        jQuery(tabId + ' img').trigger("sporty");
        jQuery(tabId).show();
    });

    jQuery("#zc_login").bind('click', function() {
        var username=$("#zc_username").val();
        if(username==''){
            popAlert("请填写手机号！");
            return;
        }

        var isMobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
        if( jQuery.trim(username) =='' || !isMobile.test(username) || username.length != 11){
            popAlert("请填写正确的手机号！");
            return;
        }

        var zc_password=$("#zc_password").val();
        if (zc_password.length < 6) {
            popAlert('密码最短需要 6 个字符');
            return;
        }
        var zc_password2=$("#zc_password2").val();
        if (zc_password2 != zc_password) {
            popAlert('密码两次输入不一致');
            return;
        }

        jQuery("#zc_login").attr({ "disabled": "disabled" });
        var urls="${base}/member/zg_bandUsername?whichclient=whichapp";
        urls+="&username="+username+"&password="+zc_password;
        showWaiting();
        jQuery.ajax({
            type: "post",
            url: urls,
            datatype: 'json',
            error: function (data) {
                closeWaiting();
                popAlert(data.message);
                jQuery("#zc_login").removeAttr("disabled");
            },
            success: function(data) {
                closeWaiting();
                jQuery("#zc_login").removeAttr("disabled");
                if(data.status=="success"){
                    layer.open({
                        content: '您已绑定成功!',
                        btn: ['确认'],
                        shadeClose: false,
                        yes: function(){
                            jumpto(fullpath + "/member/index?whichclient=whichapp");
                        }
                    });
                }else{
                    layer.open({
                        content: data.message,
                        btn: ['确认'],
                        shadeClose: true
                    });
                }
            }
        });
    });

    jQuery("#login").bind('click', function() {
        var username=$("#lg_username").val();
        if(username==''){
            popAlert("请填写手机号！");
            return;
        }
        var lg_password=$("#lg_password").val();
        if(lg_password==''){
            popAlert("请填写密码！");
            return;
        }
        jQuery("#login").attr({ "disabled": "disabled" });
        var urls="${base}/member/check?whichclient=whichapp";
        urls+="&userName="+username+"&password="+lg_password;
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
                    closeWaiting();
                    popAlert(result.message);
                    jQuery("#login").removeAttr("disabled");
                }else{
                    jQuery.ajax({
                        type: "post",
                        url: "${base}/member/lg_bandUsername?whichclient=whichapp&username="+username+"",
                        datatype: 'json',
                        error: function (data) {
                            closeWaiting();
                            popAlert(data.message);
                            jQuery("#zc_login").removeAttr("disabled");
                        },
                        success: function(data) {
                            closeWaiting();
                            layer.open({
                                content: '您已绑定成功',
                                btn: ['确认'],
                                shadeClose: false,
                                yes: function(){
                                    jumpto(fullpath + "/member/index?whichclient=whichapp");
                                }
                            });
                        }
                    });
                }
            }
        });
    })
    function gotoRegiste(){
        jumpto(fullpath + "/member/register?whichclient=whichapp");
    }
    function findpwd(){
        jumpto(fullpath + "/findPwdAPP?whichclient=whichapp");
    }

    jQuery("#toIndex").bind('click', function() {
        jumpto(fullpath + "/app_index");
    })
</script>
</head>
</body>
</html>
