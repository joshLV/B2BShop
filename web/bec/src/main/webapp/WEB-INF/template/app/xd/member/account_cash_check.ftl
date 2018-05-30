
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
            width: 35%;
            float: left;
        }
        .mui-input-row label~input,
        .mui-input-row label~select,
        .mui-input-row label~textarea {
            width: 65%;
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
        .mcenter{ text-align:center; width:100%;  background: #fff;}
        .mcenter p{ width:100%; line-height:1.3; font-size:14px;}
        .mcenter p em{ font-weight:bold; font-size:18px;}
        .qian{ width:80px; height:80px; margin:0 auto; margin-top:80px;}
        .qian img{width:70px; height:70px; margin:0 auto;}
        .login_box{ margin-bottom:10px;}
        .login_box div{ margin-top:4px;}
        .login_box input.on,.login_box input.on:hover{background:#e12f45; font-size:16px;}
        .login_box input.no-on,.login_box input.no-on:hover{background:#fafafa;height:38px; color:#444; border:1px solid #dfdfdf;font-size:16px;}


        /*1-7*/
     /*   .con-li{ background: #fff; padding: 2px 0; padding-left: 15px; }
        .mui-input-row{border-bottom: 1px solid #dfdfdf;  }
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
    <div class="mtit">账户提现</div>
    <div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a></div>
</header>


<#--<div class="mcenter" style="margin-top: 50px;">
    <form id="paymentInfo" method="POST" action="${base}/account/cashInto">
        <ul>

            <li class="con-li">
                <div class="mui-input-row">
                    <label>冻结资金：</label>
                    <input readonly type="text" value="${account.accountBlock?string(priceCurrencyFormat)}"  class="reg-inputs">
                </div>
            </li>
            <li class="con-li">
                <div class="mui-input-row " style="border-bottom: 0;">
                    <label >提现方式：</label>
                        <div class="list-pay">
                            <#list payTypeList as payType>
                                <li index="${payType_index}" class="con-li" style="line-height: 40px;>
                                    <div class="item">
                                        <input type="radio" value="${payType["sign"]}" class="radio" name="payTypeS" <#if payType_index==0>checked</#if>>
                                        <label><img width="125" height="28" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
                                    </div>
                                </li>
                            </#list>
                        </div>
                </div>
            </li>
            <li class="con-li">
                <div class="mui-input-row">
                    <label>提现姓名：</label>
                    <input id='cashName' name='cashName' type="text" placeholder="请输入提现姓名" class="reg-inputs mui-input-clear">
                </div>
            </li>
            <li class="con-li">
                <div class="mui-input-row"><!--银行卡号/支付宝账号&ndash;&gt;
                    <label id="txzh">支付宝号：</label>
                    <input id='cashNo' name='cashNo' type="text" placeholder="请输入提现账户" class="reg-inputs mui-input-clear">
                </div>
            </li>
            <li class="con-li" id="showBankNamePickerLi" style="display: none">
                <div class="mui-input-row"><!--银行卡号/支付宝账号&ndash;&gt;
                    <label id="txzh">提现银行：</label>
                    <a href="javascript:choseCLog()"  id='showBankNamePicker' class="choose-city">请选择所属银行</a> <input type="hidden" id='bankName' name="bankName" placeholder="请选择所属银行">
                </div>
            </li>
            <li class="con-li">
                <div class="mui-input-row">
                    <label>手机号码：</label>
                    <input id='cashPhone' name='cashPhone' type="text"  placeholder="请输入手机号码" class="reg-inputs mui-input-clear">
                </div>
            </li>
            <li class="con-li">
                <div class="mui-input-row">
                    <label>提现金额：</label>
                    <input id='czje' name='cashAccount' type="text" placeholder="请输入提现金额" class="reg-inputs mui-input-clear">
                </div>
            </li>
        </ul>
        <input name='whichclient' type="hidden" value="whichapp">
    </form>
    <input  type="hidden" id="accountTotal" value="${account.accountTotal}">

</div>-->


<div class="mui-content" style="padding-bottom: 10px; overflow: hidden; margin-top:32px;">
    <div style="background: #fff; overflow: hidden;">
        <form class="mui-input-group" id="paymentInfo" method="POST" action="${base}/account/cashInto">

            <div class="mui-input-row">
                <label>账户金额：</label>
                <span class="bzj_info">    <input readonly  type="text" value="${account.accountTotal?string(priceCurrencyFormat)}"  class="reg-inputs"></span>
            </div>
            <div class="mui-input-row">
                <label>冻结金额：</label>
                <span class="bzj_info"> <input readonly type="text" value="${account.accountBlock?string(priceCurrencyFormat)}"  class="reg-inputs"></span>
            </div>
            <div class="mui-input-row">
                <label>可用金额：</label>
                <span class="bzj_info"> <input readonly type="text" value="${(account.accountTotal?number -account.accountBlock?number)?string(priceCurrencyFormat)}"  class="reg-inputs"></span>
            </div>
            <div class="mui-input-row">
                <label>提现方式：</label>
                <span class="bzj_info">
                <div class="list-pay">
                <#list payTypeList as payType>
                    <li index="${payType_index}" class="con-li" style="line-height: 40px;>
                                    <div class="item">
                    <input type="radio" style="margin-left: 15px;" value="${payType["sign"]}" class="radio" name="payTypeS" <#if payType_index==0>checked</#if>>
                    <label style="width: 120px; float: none; padding: 0; padding-left: 3px;"><img width="110" height="25" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
                </#list>
                </div>
                    </span>


            </div>

             <div class="mui-input-row">
                <label>提现姓名：</label>
                <span class="bzj_info"> <input id='cashName' name='cashName' type="text" placeholder="请输入提现姓名" class="reg-inputs mui-input-clear"></span>
             </div>
            <div class="mui-input-row">
                <label id="txzh">支付宝号：</label>
                <span class="bzj_info"> <input id='cashNo' name='cashNo' type="text" placeholder="请输入提现账户" class="reg-inputs mui-input-clear"></span>
            </div>
            <div class="mui-input-row" id="showBankNamePickerLi" style="display: none">
                <label>提现银行：</label>
                <span class="bzj_info cl mt10">  <a href="javascript:choseCLog()"  id='showBankNamePicker' class="choose-city">请选择所属银行</a> <input type="hidden" id='bankName' name="bankName" placeholder="请选择所属银行"></span>
            </div>
            <div class="mui-input-row">
                <label>手机号码：</label>
                <span class="bzj_info cl"><label> ${account.userName}</label> <input id='cashPhone' name='cashPhone' type="hidden" value="${account.userName}" readonly="readonly" placeholder="请输入手机号码" class="reg-inputs"></span>
            </div>
            <div class="mui-input-row">
                <label>提现金额：</label>
                <span class="bzj_info cl"><input id='czje' name='cashAccount' type="text" placeholder="请输入提现金额" class="reg-inputs mui-input-clear"></span>
            </div>
            <div class="mui-input-row">
                <input id='SMSVerificationCode' name='SMSVerificationCode' type="text" placeholder="短信验证码" class="reg-inputs mui-input-clear" style="width:120px;border:1px solid #E4E3E6;margin-left: 20px;border-radius: 3px;">
                <input type="button"  id="getSMSVerificationCode" value="获取验证码" style="background: #e12f45;color: #FFF; border:1px solid #e12f45;font-family: '微软雅黑';border-radius: 3px;margin-top: 3px;"></span>
            </div>

            <input name='whichclient' type="hidden" value="whichapp">

    </form>
        <input  type="hidden" id="accountTotal" value="${account.accountTotal}">
        <input  type="hidden" id="accountBlock" value="${account.accountBlock}">
    </div>

</div>

<labe style="padding:10px 15px;color: #ff0000;font-size: 12px;">温馨提示：账户提现申请提交后将会冻结可用资金</labe>
<div class="login_box mt0">
    <div>
        <input type="submit"  class="input_style on" id="btnNext"  value="确认提现">
    </div>
</div>
<script src="${path}/js/bank.data.js"></script>
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

    //选择银行
    function choseCLog(){
        var catelogPicker = new mui.PopPicker({
            layer: 1
        });
        catelogPicker.setData(expressBankData);
        catelogPicker.show(function (items) {
            var value = "";
            var id = "";
            if( items[0] != null && typeof(items[0].text) != 'undefined'  ){
                value = items[0].value;

            }
            $("#showBankNamePicker").html(value);
            $("#bankName").val(value);
        });
    }

    $(".list-pay>li").click(function (){
        $this=$(this);
        $this.addClass("select");
        $this.siblings().removeClass("select");
    });
    $(".list-pay>li").eq(0).click();

    $(".radio").click(function (){
        if($(this).val()=='alipay'){
            $("#txzh").html("支付宝号")
            $("#showBankNamePickerLi").hide();
        }else{
            $("#txzh").html("银行卡号")
            $("#showBankNamePickerLi").show();
        }
    });

    jQuery("#getSMSVerificationCode").click(function(){
        jQuery("#getSMSVerificationCode").prop("disabled", true);

        jQuery.ajax({
            type:"get",
            url:"${base}/account/sendSMSVerificationCode",
            data:"acctId=${account.id}",
            success:function(data){
                if(data.status=="success"){
                    var secend = 30;
                    var interval = window.setInterval(function(){
                        secend = secend - 1;
                        jQuery("#getSMSVerificationCode").val(secend + 's后重新获取');
                        if(secend == 0){
                            window.clearInterval(interval);
                            jQuery("#getSMSVerificationCode").val('获取验证码');
                            jQuery("#getSMSVerificationCode").prop("disabled", false);
                        }
                    },1000);

                }else{
                    jQuery("#getSMSVerificationCode").prop("disabled", false);
                    popAlert("获取短信验证码失败，请稍后再试!");
                }

            },
            error:function(){
                jQuery("#getSMSVerificationCode").prop("disabled", false);
                popAlert("获取短信验证码失败，请稍后再试!");
            }
        });



    });
    $("#btnNext").click(function (){

        showWaiting();
        var SMSVerificationCode=$("#SMSVerificationCode").val();
        if(SMSVerificationCode == ''){
            closeWaiting();
            popAlert("请输入短信验证码！");return;
        }
        if(SMSVerificationCode.length != 6){
            closeWaiting();
            popAlert("短信验证码长度为6位！");return;
        }

        jQuery.ajax({
            type:"get",
            url:"${base}/account/checkSMSVerificationCode",
            data:"SMSVerificationCode=" + SMSVerificationCode,
            success:function(data){
                if(data.status=="success"){
                    var czje=$("#czje").val();
                    var accountTotal=$("#accountTotal").val();
                    var accountBlock=$("#accountBlock").val();
                    var cashName=$("#cashName").val();
                    var cashNo=$("#cashNo").val();
                    var cashPhone=$("#cashPhone").val();
                    var payType=$("input[name='payType']:checked ").val();
                    var bankName=$("#bankName").val();

                    if(checkPrice(czje)){
                        if(czje<=0){
                            closeWaiting();
                            popAlert("请输入提现金额");
                            return;
                        }else{
                            if(accountTotal*1-accountBlock*1<czje*1){
                                closeWaiting();
                                popAlert("提现金额不能大于可用金额！");return;
                            }
                        }
                    }else{
                        closeWaiting();
                        popAlert("请输入正确的提现金额");return;
                    }

                    if(cashName==''){
                        closeWaiting();
                        popAlert("请输入提现姓名");return;
                    }
                    if(cashNo==''){
                        closeWaiting();
                        popAlert("请输入提现账户");return;
                    }

                    if(payType=='unionpay' && bankName==''){
                        closeWaiting();
                        popAlert("请选择提现银行");return;
                    }

                    $("#paymentInfo").submit();
                }else{
                    closeWaiting();
                    popAlert(data.message);
                }

            },
            error:function(){
                closeWaiting();
                popAlert("校验短信验证码失败，请稍后再试!");
            }
        });




    });
    function checkPrice(price){
        return (/^(([1-9]\d*)|\d)(\.\d{1,2})?$/).test(price.toString());
    }
</script>
</body>

</html>