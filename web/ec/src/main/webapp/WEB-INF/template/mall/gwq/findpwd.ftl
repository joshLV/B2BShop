<#escape x as x?html>
	<#include "mall/gwq/top.ftl"/>
	<#include "mall/gwq/header_new.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/js/jquery.form.js" type="text/javascript"></script>
<script type="text/javascript">
    window.pageConfig={
        compatible:true,
        navId:"findpwd"
    };
</script>
<style>
    /*findpwd*/
    #findpwd{
        width: 990px;
        margin: 0 auto;
        background: #ffffff;
        margin-top: 20px;
    }
    .mt {
        height: 40px;
        /*background: url(${base}/static/mall/img/bg-tit.jpg) #D1D1D1 repeat-x 0 -34px;*/
        border: 1px solid #D1D1D1;
        border-top: 2px solid #86c226;
    }
    .mt h2 {
        float: left;
        height: 40px;
        /*padding-left: 15px;
background: url(${base}/static/mall/img/bg-tit.jpg) no-repeat 0 0;*/
        line-height: 40px;
        width: 990px;
        text-align: center;
    }
    .mt b {
        float: right;
        width: 10px;
        height: 33px;
        /*background: url(${base}/static/mall/img/bg-tit.jpg) no-repeat 0 -68px;*/
    }
    .processNav .extra {
        BACKGROUND: url(${base}/static/mall/gwq/img/cartscbgv.png) no-repeat 0px 0px
    }
    .processNav {
        MARGIN: 0px 0px 0px; BACKGROUND: #fff; FLOAT: left; COLOR: #404040; FONT-WEIGHT: 700;margin-bottom: 30px
    }
    .processNav LI {
        POSITION: relative; TEXT-ALIGN: center; LINE-HEIGHT: 26px; BACKGROUND: #e4e4e4; FLOAT: left; HEIGHT: 26px; FONT-SIZE: 14px
    }
    .processNav .step1 {
        Z-INDEX: 3; WIDTH: 280px
    }
    .processNav .step2 {
        Z-INDEX: 2; WIDTH: 280px
    }
    .processNav .step3 {
        Z-INDEX: 1; WIDTH: 280px
    }
    .processNav .on {
        BACKGROUND: #86c226; COLOR: #fff
    }
    .processNav .extra {
        POSITION: absolute; WIDTH: 18px; HEIGHT: 26px; TOP: 0px; RIGHT: -15px
    }
    .processNav .on .extra {
        BACKGROUND-POSITION: 0px -30px
    }
    #findpwd .mc {
        padding: 20px 40px 20px 40px;
        border: solid #D1D1D1;
        border-width: 0 1px 1px;
    }
    #findpwd .form {
        width: 582px;
        overflow: hidden;
        margin: 0 auto;
        padding-left: 100px;
    }
    #findpwd .item {
        padding-top: 5px;
        height: 55px;
        line-height: 26px;
    }
    #findpwd .label {
        width: 140px;
        text-align: right;
        font-size: 14px;
        float: left;
    }
    #findpwd .text {
        width: 240px;
        height: 16px;
        padding: 4px 3px;
        border: 1px solid #bbb;
        font-size: 14px;
        font-family: arial,"宋体";
    }
    #findpwd .msg-error {color: #cc0000;}
    #findpwd .text-1 {
        width: 100px;
    }
    #findpwd .msg-text{color:#999999;}
    #findpwd .msg-error{color:#cc0000;}
    #findpwd .text-color {
        color: #999999;
        font-size: 12px;
    }
    #findpwd .btn-entry {
        width: 100px;
        height: 30px;
        line-height: 30px;
        /*background: url(${base}/static/mall/img/bg-btn-entry.jpg) no-repeat;*/
        background: #86c226;
        color: #ffffff;
        border-radius: 3px;;
        font-size: 14px;
        font-weight: bold;
    }
    #findpwd .rpwd {
        width: 300px;
        text-align: right;
        font-size: 16px;
        float: left;
    }
</style>

<div id="findpwd">
    <div class="mt">
        <h2>重置密码</h2>
        <b></b>
    </div>
    <div class="mc">
        <ol class="processNav">
            <li id="one" class="step1 on">1、输入手机号<b class="extra"></b></li>
            <li id="two" class="step2">2、确认身份<b class="extra"></b></li>
            <li id="three" class="step3">3、完成<b class="extra"></b></li>
        </ol>
        <span class="clr"></span>
        <div class="form" id="a">
            <div class="item">
                <span class="label">手机号：</span>
                <div class="fl">
                    <!-- text_error -->
                    <input type="text" onfocus="changeUserName();" tabindex="1" class="text"  id="username" name="username">
                    <span id="u_null" class="msg-error">输入您的登录手机</span>
                    <span id="u_format" class="msg-error">手机号格式错误</span>
                    <span id="u_notnull" class="msg-error">此手机号绑定账户不存在!</span>
                </div>
            </div>
            <div class="item">
                <span class="label">&nbsp;</span>
                <input type="button" tabindex="4" value="下一步" onclick="onNext();" id="findPwdSubmit" class="btn-img btn-entry">
            </div>
        </div>
        <div class="form" id="b">
            <div class="item">
                <div class="fl">
                    <input type="hidden" name="mobile" id="mobile" value="">
                    <span id="msg"></span>
                </div>
            </div>
            <div class="item">
                <span class="label">&nbsp;</span>
                <input type="button" tabindex="4" value="下一步" onclick="onNextTwo();" id="findPwdSubmit" class="btn-img btn-entry">
            </div>
        </div>
        <div class="form" id="c">
            <div class="item">
                <span id="msgs">重置后的密码已发送到您绑定的手机,请注意查收!</span>
            </div>
        </div>
    </div>
    <span class="clr"></span>
</div>
<div class="m"></div>
<script type="text/javascript">
    pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {
        $("#a").show();
        $("#b").hide();
        $("#c").hide();

        $("#u_null").hide();
        $("#u_format").hide();
        $("#u_notnull").hide();
    });
    function changeUserName(){
        $("#u_null").hide();
        $("#u_format").hide();
        $("#u_notnull").hide();
    }
    function onNext(){
        var errorFlag = true;
        var checkMob = /^0?(13|15|17|18|14)[0-9]{9}$/;
        var username = $("#username").val();

        if(isEmpty(username)){
            errorFlag = false;
            $("#u_null").show();
            return errorFlag;
        }
        if(!checkMob.test(username)){
            errorFlag = false;
            $("#u_null").hide();
            $("#u_format").show();
            return errorFlag;
        }

        $("#u_null").hide();
        $("#u_format").hide();
        $("#u_notnull").hide();

        $.ajax({
            type: "get",
            url: "${base}/fossick/ajaxCheckUser",
            data: "username="+username,
            success: function(data) {
                if(data.status=='success'){
                    if(data.data==true){
                        $("#one").removeClass('on');
                        $("#two").addClass('on');
                        $("#a").hide();
                        $("#b").show();

                        $("#mobile").val(data.mob);
                        var message = "您确定此"+data.mob+"号码接收重置后的账号密码?";

                        $("#msg").html(message);
                    }else{
                        $("#u_notnull").show();
                    }
                }else{
                    $("#u_notnull").show();
                }
            }
        });
    }
    function onNextTwo(){
        var mobe = $("#mobile").val();
        $.ajax({
            type: "get",
            url: "${base}/fossick/ajaxSendSms",
            data: "mobileo="+mobe,
            success: function(data) {
                $("#two").removeClass('on');
                $("#three").addClass('on');
                $("#b").hide();
                $("#c").show();


                if(data.status!='success'){
                    var messages = "重置失败请稍后重试!";

                    $("#msgs").html(messages);
                }
            }
        });


    }
    /**
     * 判断是否是空
     * @param value
     */
    function isEmpty(value){
        if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
            return true;
        }
        else{
            value = (value+"").replace(/\s/g,'');
            if(value == ""){
                return true;
            }
            return false;
        }
    }
</script>


	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>
</#escape>