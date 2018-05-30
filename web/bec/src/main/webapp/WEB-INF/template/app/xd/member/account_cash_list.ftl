
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/xd/head.ftl">
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
            background:#e12f45;
            padding:8px 0;
            font-size:18px;
            height:30px;
            line-height:30px;
            box-shadow: 0px 3px 6px #999;
            z-index:10;text-align:center;
        }
        .logo{ position:absolute;left:10px;float:left;}
        .logo a{ color:#fff;}
        .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
        .user { position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
        .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/xd/images/user.png) no-repeat; background-size: 20px
        20px;}

        .mtit{color:#fff;}
        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/xd/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:5px;}

        /*保证金列表 1-5*/
        .order-list {
            margin-top:48px;
        }
        .order-list dl {
            background: #fff;
            border-top: solid 1px #d8d8d8;
            border-bottom: solid 1px #d8d8d8;
            background: #fff;
            padding: 0 0 0px 15px;
            margin-bottom: 10px;
        }

        .order-list dl dt {
            height: 42px;
            line-height: 42px;
            display: -webkit-box;

            padding-right: 15px;
            border-bottom: dotted 1px #d8d8d8;
            color: #777;
            font-size: 14px;
        }
        .order-list dl dt div {
            width: 50%;
        }
        .order-list dl dt .order-state span {
            color: #333;
        }
        .order-list dl dt .order-time {
            text-align: right; font-size:13px;
        }
        .order-list dl dd {
            margin-top: 15px;
        }
        .order-list .bh{
            border-bottom:dotted 1px #d8d8d8; padding-top:10px; font-size:14px; padding-bottom:10px; overflow:hidden;

        }
        .order-list .bh a{ padding-left:3px; color:#E4393C;}
        .order-list dl.dl_bg{ background:;}

    </style>
</head>

<body>
<header>
    <div class="logo"><a href="javascript:jumpto(fullpath + '/account/indexAccount?whichclient=whichapp');" class="ltext">返回</a></div>
    <div class="mtit">账户提现记录</div>
    <div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a></div>
</header>




<#--<div class="bzj_list">
<#list accountCashList as accountcash>
    <dl>
        <dt>
            <!-- 状态(0:未审核 1.审核通过 2.未审核通过 3转账中 4.已转账)&ndash;&gt;
        <h2>
            提现
            <#if accountcash.status==0>[未审核]</#if>
            <#if accountcash.status==1>[审核通过]</#if>
            <#if accountcash.status==2>[未审核通过]</#if>
            <#if accountcash.status==3>[转账中]</#if>
            <#if accountcash.status==4>[已转账]</#if>
        </h2>
        <p>${accountcash.createDate?string("yyyy-MM-dd HH:mm:ss")}</p>
        </dt>
        <dd>-${accountcash.cashAccount}</dd>
    </dl>
</#list>
</div>-->
<#--
<div class="checkout_btn">
    <a id="loadmore" class="gray_btn mui-control-item" href="#buttom" style="background-color:#ddd">没有更多订单了</a>
</div>-->


<div class="order-list">
<#list accountCashList as accountcash>

    <dl>
        <div class="bh">
            <div style="float:left;">提现金额：<a href="javascript:;">${accountcash.cashAccount}</a></div>
            <div style="float:right; padding-right:15px; color:#e12f45;">
            <#if accountcash.status==0>[未审核]</#if>
            <#if accountcash.status==1>[审核通过]</#if>
            <#if accountcash.status==2>[未审核通过]</#if>
            <#if accountcash.status==3>[转账中]</#if>
            <#if accountcash.status==4>[已转账]</#if>
            </div>
        </div>
        <dt>
        <div class="order-state"><span>提现姓名：</span>${accountcash.cashName}</div>
        <div class="order-time">${accountcash.createDate?string("yyyy-MM-dd HH:mm:ss")}</div>
        </dt>
        <dt>
        <div class="order-state" ><span>提现方式：</span>
            <#if accountcash.cashType==0>支付宝</#if>
            <#if accountcash.cashType==1>银行卡</#if>
        </div>
        <#if accountcash.cashType==1>
        <div class="order-state" style="text-align: right;"><span>提现银行：</span>${accountcash.bankName}</div>
        </#if>
        </dt>
        <dt>

        <div class="order-state" style="width:100%;"><span><#if accountcash.cashType==0>支付宝</#if><#if accountcash.cashType==1>银行卡</#if>号：</span>
    ${accountcash.cashNo}</div>
        </dt>

        <dt style="border-bottom:0;">
        <div class="order-state" style="width:100%;"><span>手机号码：</span>${accountcash.cashPhone}</div>

        </dt>

    </dl>
</#list>

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