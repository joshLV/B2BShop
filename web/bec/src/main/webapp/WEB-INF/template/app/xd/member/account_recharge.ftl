
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

        /*保证金 1-4*/
        .mcenter{ text-align:center; width:100%; padding-bottom:20px;overflow: hidden;}
        .qian{ width:75px; height:75px; margin:0 auto; margin-top:100px;}
        .qian img{width:65px; height:65px; margin:0 auto;}
        .login_box{ margin-bottom:10px;}
        .login_box div{ margin-top:4px;}
        .login_box input.on,.login_box input.on:hover{background:#e12f45; font-size:16px;}
        .login_box input.no-on,.login_box input.no-on:hover{background:#fafafa;height:38px; color:#444; line-height:38px; border:1px solid #dfdfdf;font-size:16px;}
        .mui-btn, button, input[type=button], input[type=reset], input[type=submit]{padding:0!important;}
        .lg{ width: 100%; }
        .lg p{ font-size:14px;margin-bottom: 0; color: #555;line-height: 20px; height: 20px;}
        .lg p em{font-size:16px; font-style: normal; color: #555;}
        .lg .fl{ float: left; width: 50%; text-align: right;}
        .lg .fr{ float: right; width: 50%; text-align: left;}

    </style>
</head>

<body>
<header>
    <div class="logo"><a href="javascript:jumpto(fullpath + '/account/indexAccount?whichclient=whichapp');" class="ltext">返回</a></div>
    <div class="mtit">账户充值</div>
    <div class="user">
       <#-- <button type="button" id="jxgw" onclick="javascript:jumpto(fullpath + '/account/rechargeList?whichclient=whichapp');" class="mui-btn  mui-btn-link mui-btn-nav mui-pull-right" style="margin-right:0px; padding-left: 6px; color: #fff; margin-top:0; font-size: 15px;">
            <span class="mui-icon mui-icon-right-nav"></span>充值记录
        </button>-->
      <a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a>
    </div>
</header>


<div class="mcenter">
    <div class="qian"><img src="${path}/images/qian.png"></div>
    <div class="lg">
        <p class="fl">账户金额：</p>
        <p class="fr"><em>${account.accountTotal?string(priceCurrencyFormat)}</em></p>
    </div>
    <div class="lg">
        <p class="fl">已冻结资金：</p>
        <p class="fr"><em>${account.accountBlock?string(priceCurrencyFormat)}</em></p>
    </div>
</div>
<div class="login_box mt0">
    <div>
        <input type="submit" onclick="jumpto(fullpath + '/account/rechargeCheck?whichclient=whichapp');" class="input_style on" id="reg_btn"  value="充值">
    </div>
    <div>
        <input type="submit" onclick="jumpto(fullpath + '/account/cashCheck?whichclient=whichapp');" class="input_style no-on" id="reg_btn"  value="提现">
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