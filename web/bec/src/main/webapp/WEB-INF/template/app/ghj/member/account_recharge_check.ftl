
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
        /*保证金 1-4*/
        .mcenter{ text-align:center; width:100%; padding-bottom:8px; background: #fff; border-bottom: 1px solid #dfdfdf; overflow: hidden;}
        .mcenter p{ width:100%; line-height:1.3; font-size:14px;}
        .mcenter p em{ font-weight:bold; font-size:18px;}
        .qian{ width:80px; height:80px; margin:0 auto; margin-top:80px;}
        .qian img{width:70px; height:70px; margin:0 auto;}
        .login_box{ margin-bottom:10px;}
        .login_box div{ margin-top:4px;}
        .login_box input.on,.login_box input.on:hover{background:#e12f45; font-size:16px;}
        .login_box input.no-on,.login_box input.no-on:hover{background:#fafafa;height:38px; color:#444; border:1px solid #dfdfdf;font-size:16px;}

/*1-7*/
      /*  .mui-input-row label {
            font-family: "微软雅黑";
            float: left;
            width: 30%;
           padding: 5px 5px 2px 15px;

            font-size: 15px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            color: #444;
            text-align: right;
        }

        .con-li .item{width: 50%; float: left;}
        .mui-input-row .mui-input-clear~.mui-icon-clear, .mui-input-row .mui-input-speech~.mui-icon-speech {
            font-size: 30px;
            position: absolute;
            z-index: 1;
            top: 3px;
            right: 8px;
            width: 30px;
            height: 30px;
            text-align: center;
            color: #999;
        }
*/
        .mui-input-group label {
            width: 100px;
            float: left;
        }
        .bzj_info{ float: left;font-size: 15px; color: #777;}
        .mui-input-row .cl{ font-style: normal; color: #e12f45;}
        input[type=color], input[type=date], input[type=datetime-local], input[type=datetime], input[type=email], input[type=month], input[type=number], input[type=password], input[type=search], input[type=tel], input[type=text], input[type=time], input[type=url], input[type=week], select, textarea {
            line-height: 21px;
            width: 100%;
            height: 40px;
            margin-bottom: 0!important;
            padding: 10px 15px;
            -webkit-user-select: text;
            border: 0;
            border-radius:0;
            outline: 0;
            background-color: transparent;
            -webkit-appearance: none;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }
        .choose-city{ background: #e6e5e5; padding:6px 18px; font-style: 14px; color: #555;border-radius: 3px;}
        .mt10{ margin-top: 10px;}

    </style>
</head>

<body>
<header>
    <div class="logo"><a href="javascript:jumpto(fullpath + '/account/indexAccount?whichclient=whichapp');" class="ltext">返回</a></div>
    <div class="mtit">账户充值</div>
    <div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a></div>
</header>


<#--<div class="mcenter" style="margin-top: 55px;">
    <form id="paymentInfo" method="POST" action="${base}/account/rechargeInto">
        <ul>
            <li class="con-li">
                <div class="mui-input-row ">
                    <label>支付方式：</label>
                        <div class="list-pay">
                            <#list payTypeList as payType>
                                <li index="${payType_index}" class="con-li" style="line-height: 40px;">
                                    <div class="item">
                                        <input type="radio" value="${payType["sign"]}" class="radio" name="payType" <#if payType_index==0>checked</#if>>
                                        <label><img width="110" height="25" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
                                    </div>
                                </li>
                            </#list>
                        </div>
                </div>
            </li>
            <li class="con-li" style="background: #fff; border-bottom: 1px solid #dfdfdf; padding: 5px 0;">
                <div class="mui-input-row">
                    <label style="height: 40px; line-height:30px;">充值金额：</label>
                    <input id='czje' name='account' type="text" style="width:68%; padding: 5px 0; height:40px;" placeholder="请输入充值金额" class="reg-inputs mui-input-clear">
                </div>
            </li>
        </ul>
        <input name='whichclient' type="hidden" value="whichapp">
    </form>


</div>-->


<div class="mui-content" style="padding-bottom:0px; overflow: hidden; margin-top:32px;">
    <div style="background: #fff; overflow: hidden;">
        <form class="mui-input-group" id="paymentInfo" method="POST" action="${base}/account/rechargeInto">

            <div class="mui-input-row">
                <label>支付方式：</label>
                <span class="bzj_info">
                <div class="list-pay">
                <#list payTypeList as payType>
                    <li index="${payType_index}" class="con-li" style="line-height: 40px;>
                                    <div class="item">
                    <input type="radio" style="margin-left: 15px;" value="${payType["sign"]}" class="radio" name="payType" <#if payType_index==0>checked</#if>>
                    <label style="width: 120px; float: none; padding: 0; padding-left: 3px;"><img width="110" height="25" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
                </#list>
                </div>
                    </span>


            </div>

            <div class="mui-input-row">
                <label>充值金额：</label>
                <span class="bzj_info"> <input id='czje' name='account' value="${prepaymentFee}" type="text" style="width:68%; padding: 5px 0; height:40px;" placeholder="请输入充值金额" class="reg-inputs mui-input-clear"></span>
            </div>

            <input name='whichclient' type="hidden" value="whichapp">

        </form>

    </div>

</div>





<div class="login_box mt0">
    <div>
        <input type="submit"  class="input_style on" id="btnNext"  value="下一步">
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

    $(".list-pay>li").click(function (){
        $this=$(this);
        $this.addClass("select");
        $this.siblings().removeClass("select");

        var index = $this.attr('index');
        var payType=$("input[name='payType']:eq("+index+")").val();
        $("#payType").val(payType);

        $("input[name='payType']").each(function(idx,ele){
            $(this).prop("checked",(index==idx));
        });
    });
    $(".list-pay>li").eq(0).click();
    $("#btnNext").click(function (){
        var czje=$("#czje").val();
        if(checkPrice(czje)){
            if(czje<=0){
                popAlert("请输入充值金额")
            }else{
                $("#paymentInfo").submit();
            }
        }else{
            popAlert("请输入正确的充值金额");
        }
    });
    function checkPrice(price){
        return (/^(([1-9]\d*)|\d)(\.\d{1,2})?$/).test(price.toString());
    }
</script>
</body>

</html>