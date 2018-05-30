
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

        /*保证金列表 1-5*/
        .bzj_list{ width:100%; overflow:hidden; padding-bottom:20px; margin-top: 48px;}
        .bzj_list dl{ width:100%; padding:10px 15px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box; border-bottom:1px solid #dfdfdf; background:#fff; overflow:hidden;}
        .bzj_list dl dt{ width:70%; float:left; height:44px;}
        .bzj_list dl dt h2{ font-size:15px; color:#333; height:26px; line-height:26px; margin: 0!important;font-weight: normal;}
        .bzj_list dl dt p{ font-size:13px; color:#999; margin-bottom:0; height:18px; line-height:18px; margin-bottom: 0!important;}
        .bzj_list dl dd{ width:30%; float:left; height:44px; line-height:44px; font-size:17px;color:#e12f45; text-align:right;}
        /*1-7*/
        .mui-input-group label { width:30%;float: left;}
        .mui-input-row label{ padding-right:5px!important;}
        .bzj_info{padding: 10px; padding-left: 0px; float: left;font-size: 15px; color: #777;}
        .mui-input-row .cl{ font-style: normal; color: #e12f45;}

    </style>
</head>

<body>
<header>
    <div class="logo"><a href="javascript:jumpto(fullpath + '/account/indexAccount?whichclient=whichapp');" class="ltext">返回</a></div>
    <div class="mtit">账户充值记录</div>
    <div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a></div>
</header>

<div class="bzj_list">
<#list accountLogList as accountLog>
    <dl>
        <dt>
        <!-- 交易类型(0:充值 1:冻结 2：解冻 3：提现)-->
        <h2>
        <#if accountLog.payMethod==0>充值</#if>
        <#if accountLog.payMethod==1>冻结</#if>
        <#if accountLog.payMethod==2>解冻</#if>
        <#if accountLog.payMethod==3>提现</#if>
        <#if accountLog.status==0><font color="#e12f45">[失败]</font></#if>
        <#if accountLog.status==1><font color="green">[成功]</font></#if>
        </h2>
        <p>${accountLog.createDate?string("yyyy-MM-dd HH:mm:ss")}</p>
        </dt>
        <dd>+${accountLog.account}</dd>
    </dl>
</#list>

<#--<div class="checkout_btn">
    <a id="loadmore" class="gray_btn mui-control-item" href="#buttom" style="background-color:#ddd">没有更多订单了</a>
</div>-->










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