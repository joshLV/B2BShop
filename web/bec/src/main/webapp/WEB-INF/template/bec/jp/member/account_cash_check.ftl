<#escape x as x?html>
    <#include "bec/gwq/header.ftl"/>
<div id="container">
    <#include "bec/gwq/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/account/recharge">账户管理</a></strong><span>&nbsp;&gt;&nbsp;提现<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/jp/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="account_cashList"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list">
            <h1>提现</h1>

                <form class="" id="paymentInfo" method="POST" action="${base}/account/cashInto">
                    <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td> 账户金额：</td>
                        <td style="height: 36px">    <input readonly  type="text" value="${account.accountTotal?string(priceCurrencyFormat)}" ></td>
                    </tr>
                    <tr style="width: auto;margin: 10 10 10 10">
                        <td>冻结金额：</td>
                        <td style="height: 36px"> <input readonly type="text" value="${account.accountBlock?string(priceCurrencyFormat)}"  ></td>
                    </tr>
                    <tr>
                        <td>可用金额：</td>
                        <td style="height: 36px"> <input readonly type="text" value="${(account.accountTotal?number -account.accountBlock?number)?string(priceCurrencyFormat)}"  ></td>
                    </tr>
                    <tr>
                        <td>提现方式：</td>
                        <td style="height: 100px">
                            <div class="list-pay">
                                <#list payTypeList as payType>
                                    <li index="${payType_index}"  class="con-li" style="line-height: 40px;">
                                    <input type="radio"  style="margin-left: 15px;" value="${payType['sign']}" class="radio" name="payTypeS" <#if payType_index==0>checked</#if>>
                                    <label style="width: 120px; float: none; padding: 0; padding-left: 3px;"><img width="110" height="25" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
                                    </li>
                                </#list>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td style="height: 36px"><label>提现姓名：</label></td>
                        <td style="height: 36px"> <input  id='cashName' name='cashName' type="text" placeholder="请输入提现姓名" ></td>
                    </tr>
                    <tr>
                        <td id="txzh" style="height: 36px">支付宝号：</td>
                        <td style="height: 36px"> <input  id='cashNo' name='cashNo' type="text" placeholder="请输入提现账户" ></td>
                    </tr>
                    <tr  id="showBankNamePickerLi">
                        <td style="height: 36px">提现银行：</td>
                        <td style="height: 36px">  </td>
                    </tr>
                    <tr>
                        <td>手机号码：</td>
                        <td style="height: 36px"><label> ${account.userName}</label> <input id='cashPhone' name='cashPhone'  type="hidden" value="${account.userName}" readonly="readonly" placeholder="请输入手机号码"></td>
                    </tr>
                    <tr>
                        <td>提现金额：</td>
                        <td style="height: 36px"><input id='czje'  name='cashAccount' type="text" placeholder="请输入提现金额" class="inp_text"></td>
                    </tr>
                    <tr>
                        <td style="height: 56px"><input id='SMSVerificationCode' name='SMSVerificationCode' type="text" placeholder="短信验证码" class="reg-inputs mui-input-clear" style="width:120px;height:36px;border:1px solid #E4E3E6;margin-left: 20px;border-radius: 3px;"></td>
                        <td style="height: 86px"> <input type="button" id="getSMSVerificationCode" value="获取验证码" style="background: #e12f45;color: #FFF; border:1px solid #e12f45;font-family: '微软雅黑';border-radius: 3px;margin-top: 3px;width:120px;height:36px;"></td>
                    </tr>
                </table>
                </form>
                <input  type="hidden" id="accountTotal" value="${account.accountTotal}">
                <input  type="hidden" id="accountBlock" value="${account.accountBlock}">

        </div>
        <labe style="padding:10px 15px;color: #ff0000;font-size: 12px;">温馨提示：账户提现申请提交后将会冻结可用资金</labe>
        <div class="login_box mt0">
            <div>
                <input type="submit"  class="input_style on" id="btnNext"  value="确认提现">
            </div>
        </div>
    </div>
</div>
    <#include "bec/gwq/service.ftl"/>
    <#include "bec/gwq/foot.ftl"/>
<script>
    //选择银行
    var expressBankData=[
        {value:"中国银行",text:"中国银行"},
        {value:"建设银行",text:"建设银行"},
        {value:"农业银行",text:"农业银行"},
        {value:"工商银行",text:"工商银行"},
        {value:"民生银行",text:"民生银行"},
        {value:"光大银行",text:"光大银行"},
        {value:"招商银行",text:"招商银行"},
        {value:"招商银行",text:"招商银行"},
        {value:"北京银行",text:"北京银行"},
        {value:"交通银行",text:"交通银行"},
        {value:"中信银行",text:"中信银行"},
        {value:"西安银行",text:"西安银行"}
    ];
    var jsonStr = JSON.stringify(expressBankData);
    var select = "<select>";
    $.each(expressBankData,function(index, item) {
        select += "<option value ='" + item.value + ">" + item.text + "</option>";
    });
    select += "</select>";
    $("#showBankNamePickerLi > td:last").html(select);
    $(".list-pay>li").click(function (){
        $this=$(this);
        $this.addClass("select");
        $this.siblings().removeClass("select");
    });
    $(".list-pay>li").eq(0).click();


    $(".con-li").click(function(){
        $(':input',this)[0].checked = true;
    })


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
                    alert("获取短信验证码失败，请稍后再试!");
                }

            },
            error:function(){
                jQuery("#getSMSVerificationCode").prop("disabled", false);
                alert("获取短信验证码失败，请稍后再试!");
            }
        });



    });
    $("#btnNext").click(function (){

        //showWaiting();
        var SMSVerificationCode=$("#SMSVerificationCode").val();
        if(SMSVerificationCode == ''){
            //closeWaiting();
            alert("请输入短信验证码！");return;
        }
        if(SMSVerificationCode.length != 6){
           // closeWaiting();
            alert("短信验证码长度为6位！");return;
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
                            //closeWaiting();
                            alert("请输入提现金额");
                            return;
                        }else{
                            if(accountTotal*1-accountBlock*1<czje*1){
                               // closeWaiting();
                                alert("提现金额不能大于可用金额！");return;
                            }
                        }
                    }else{
                       // closeWaiting();
                        alert("请输入正确的提现金额");return;
                    }

                    if(cashName==''){
                        //closeWaiting();
                        alert("请输入提现姓名");return;
                    }
                    if(cashNo==''){
                        //closeWaiting();
                        alert("请输入提现账户");return;
                    }

                    if(payType=='unionpay' && bankName==''){
                        //closeWaiting();
                        alert("请选择提现银行");return;
                    }

                    $("#paymentInfo").submit();
                }else{
                    //closeWaiting();
                    alert(data.message);
                }

            },
            error:function(){
                //closeWaiting();
                alert("校验短信验证码失败，请稍后再试!");
            }
        });
    });
    function checkPrice(price){
        return (/^(([1-9]\d*)|\d)(\.\d{1,2})?$/).test(price.toString());
    }
</script>
</#escape>