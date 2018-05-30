
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/gwq/head.ftl">
    <link href="${path}/theme/red/mui.picker.css" rel="stylesheet" />
    <link href="${path}/theme/red/mui.dtpicker.css" rel="stylesheet" />
    <style>
        .area {
            margin: 20px auto 0px auto;
        }
        .mui-input-group:first-child {
            margin-top: 20px;
        }
       
        .mui-input-group label {
            width: 30%;
            float: left;
        }
        .mui-input-row label~input,
        .mui-input-row label~select,
        .mui-input-row label~textarea {
            width: 70%;
        }
        .mui-input-row label~input[type=radio] {
            width: 5%;
            float: left;
            margin: 10px 0px 10px 0px;
        }
        .mui-input-row label~input[type=radio]~label {
            width: 60%;
            float: right;
            margin: 5px 10px 10px 0px;
            padding: 0px;

         }
        .mui-checkbox input[type=checkbox] {
            width: 65%;
            float: left;
            margin: 0px 0px 5px 0px;
        }
        .mui-checkbox input[type=checkbox]~label {
            width: 60%;
            float: right;
            margin: 7px 16px 0px 0px;
            padding: 0px;
        }
        .mui-content-padded {
            margin-top: 25px;
        }
        .mui-btn {
            padding:8px 10px;
        }
        .mui-btn-picker{
            width: 60%;
            margin-top: 5px;
            margin-right: 5px;
        }


    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" >
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">账户信息</h1>
</header>
<div class="mui-content">
    <div style="background: #fff;">
    <form class="mui-input-group" id="baseInfoFrm">
        <div class="mui-input-row">
            <label>公司名称:</label>
            <input id='companyName' type="text" class="mui-input" value="${member.companyName}" readonly="readonly" >
        </div>
        <div class="mui-input-row">
            <label>法人姓名:</label>
            <input id='realName' type="text" class="mui-input" value="${member.realName}" readonly="readonly" >
        </div>
        <div class="mui-input-row">
            <label>公司电话:</label>
            <input id='mobile' type="text" class="mui-input" value="${member.mobile}" readonly="readonly">
        </div>
        <div class="mui-input-row">
            <label>公司邮箱:</label>
            <input id='email' type="text" class="mui-input" value="${member.email}" readonly="readonly">
        </div>
        <div class="mui-input-row">
            <label>公司地址:</label>
            <textarea id='fullAreaName' type="text" class="mui-textarea" value="${fullAreaName}" readonly="readonly">${fullAreaName}</textarea>
        </div>
        <div class="mui-input-row">
            <label>联系人:</label>
            <input id='linkMan' type="text" class="mui-input" value="${member.linkMan}" readonly="readonly">
        </div>
        <div class="mui-input-row">
            <label>联系人手机:</label>
            <input id='likeManMobile' type="text" class="mui-input" value="${member.userName}" readonly="readonly">
        </div>
        <div class="mui-input-row">
            <label>联系人邮箱:</label>
            <input id='linkManEmail' type="text" class="mui-input" value="${member.linkManEmail}" readonly="readonly">
        </div>

    </form>
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

    }(mui, document));
</script>
</body>

</html>