<!DOCTYPE html>
<html>
<head>
<#include "app/xd/head.ftl">
    <link href="${path}/theme/red/reset.css" rel="stylesheet" />
    <link href="${path}/theme/red/register.css" rel="stylesheet" />
    <style>
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
           /* box-shadow: 0px 3px 6px #999;*/
            z-index:10;text-align:center;}
        .logo{ position:absolute;left:10px;float:left;}
        .logo a{ color:#fff;}
        .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
        .user{ position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
        .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/xd/images/user.png) no-repeat; background-size: 20px
        20px;}

        .mtit{color:#fff;}

        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/xd/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:5px;}



    </style>
</head>
<body>
<#--<header class="top-bar-nav">
    <div class="top-btn-left">
        <span class="top-back"></span>
    </div>
    <h1 class="top-bar-title">供应商注册</h1>
</header>-->

<#--
<header class="mui-bar mui-bar-nav" style="background-color:#E12F45;">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">供应商注册</div>
</header>
-->


<header>
    <#--<div class="logo"><a href="javascript:jumpto(fullpath + '/zcgoods/list?whichclient=whichapp');" class="ltext">返回</a></div>-->
        <div class="logo"><a href="javascript:jumpto(fullpath + '/app_index');" class="ltext">返回</a></div>
    <div class="mtit">供应商注册</div>
    <div class="user"><a href="${base}/member/index?whichclient=whichapp">用户</a></div>

</header>


<div class="content" style="margin-top: 68px;">
    <form id="joinForm">

    <ul>
        <li class="con-li2"><span><em>*</em><label>商家名称：</label></span>
            <input type="text" name="name" id="name" datatype="*6-20"
                   placeholder="请输入商家名称(6-20个字符)" class="reg-inputs">
        </li>
        <li class="con-li2"><span><em>*</em><label>详细地址：</label></span>
            <textarea type="text" name="address" id="address"  datatype="*10-50" rows="4"
                   placeholder="请输入您的详细地址(10-20个字符)" class="reg-inputs"></textarea>
        </li>
        <li class="con-li2"><span><em>*</em><label>负责人：</label></span>
            <input type="text" name="head" id="head" datatype="zh2-4"
                   placeholder="请输入负责人姓名(2-4个汉字)" class="reg-inputs">
        </li>
        <li class="con-li2"><span><em>*</em><label>联系手机号：</label></span>
            <input type="tel" name="mobile" id="mobile"  datatype="m"
                   placeholder="请输入手机号" class="reg-inputs">
        </li>
        <li class="con-li2"><span><em>*</em><label>联系固定电话：</label></span>
            <input type="text" name="telphone" id="telphone"  datatype="tel"
                   placeholder="请输入固定电话号码" class="reg-inputs">
        </li>
        <li class="con-li2"><span><em>*</em><label>营业执照编码：</label></span>
            <input type="text" name="businessLicenseCode" id="businessLicenseCode"  datatype="*"
                   placeholder="请输入营业执照编码" class="reg-inputs">
        </li>
    </ul>

    </form>
    <div id="outLine" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; font-size: 12px"></div>

</div>
<div class="reg-btn" style="margin-bottom: 40px;">
    <button id="submits" type="button" class="submits-btn">提交注册</button>
</div>

<script src="${path}/js/validform_sample.js"></script>
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
                plus.webview.currentWebview().show();
            });
        }
        checkFormItemEx = function(id, callback, msg){
            return checkFormItem(id,
                    function(){
                        jQuery('#'+id).focus();
                    },
                    function (msg) {
                        layer.open({
                            content: msg,
                            style: 'background-color:#888; color:#fff; border:none; margin: 80% auto 0px auto;',
                            time:2
                        });
                    });
        };

        jQuery("#submits").on('tap', function() {
            showWaiting();
            if(!checkFormItem('name')){return};
            if(!checkFormItem('address')){return};
            if(!checkFormItem('head')){return};
            if(!checkFormItem('mobile')){return};
            if(!checkFormItem('telphone')){return};
            if(!checkFormItem('businessLicenseCode')){return};
            jQuery.ajax({
                type: "POST",
                url: '${base}/join/save/whichapp',
                data: jQuery('#joinForm').serialize(),
                dataType: 'json',
                cache: false,
                async:false,
                success: function(result){
                    closeWaiting();
                    popAlert(result.message);
                    setTimeout(function(){jumpto(fullpath + '/join/whichapp');}, 2000);
                    return;
                },
                error:function(result){
                    closeWaiting();
                    popAlert(result.message);
                    return;
                }
            });
        });
    }(mui, document));
</script>
</body>

</html>