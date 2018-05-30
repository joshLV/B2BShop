
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/ghj/head.ftl">
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

        .login_box{padding:10px 10px 0 10px;}
        .input_style{width:100%;height:38px; line-height:38px;font-size:16px;border:none;outline:0;background:#e12f45;color:#fff;margin-top:10px;-moz-border-radius:5px;-webkit-border-radius:5px;border-radius:5px;font-size:15px; letter-spacing:1px;font-family:"微软雅黑";}
        .input_style:hover{ background:#ce293e;}
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
            background: #fff;border-bottom: 1px solid #ddd;box-shadow: 0 0 6px #ccc;
        }
        .logo{ position:absolute;left:10px;float:left;}
        .logo a{ color:#666;}
        .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
        .user { position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
        .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/ghj/images/user.png) no-repeat; background-size: 20px
        20px;}

        .mtit{color:#444;}
        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghj/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:5px;}


    </style>
</head>

<body>
<header>
    <div class="logo"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');" class="ltext">返回</a></div>
    <div class="mtit">账户信息</div>
    <div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a></div>
</header>
<div class="mui-content" style="padding-bottom: 10px; margin-top: 48px;">
    <div style="background: #fff;">
    <form class="mui-input-group" id="baseInfoFrm">
        <div class="mui-input-row">
            <label>采购商名称:</label>
            <input id='companyName' type="text" class="mui-input" value="${member.companyName}" readonly="readonly" >
        </div>
        <!--<div class="mui-input-row">
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
        </div>-->
        <div class="mui-input-row">
            <label>采购商地址:</label>
            <textarea id='fullAreaName' type="text" class="mui-textarea" value="${fullAreaName}" readonly="readonly">${fullAreaName}</textarea>
        </div>
        <div class="mui-input-row">
            <label>账户资金:</label>
            <input id='linkMan' type="text" class="mui-input" value="${account.accountTotal?string(priceCurrencyFormat)}" readonly="readonly">
        </div>
        <div class="mui-input-row">
            <label>冻结资金:</label>
            <input id='linkMan' type="text" class="mui-input" value="${account.accountBlock?string(priceCurrencyFormat)}" readonly="readonly">
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
    <div class="login_box mt0">
        <div>
            <input id='exit' type="submit" class="input_style" id="reg_btn"  value="退出当前账户">
        </div>
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
    //退出操作******************
    jQuery("#exit").bind("tap", function () {
        logout();
    });
    function logout() {
        jumpto(hosturl + '/member/logout?whichclient=whichapp');
    }
</script>
</body>

</html>