<#escape x as x?html>
    <#include "mall/gwq/top.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<style>
    /*register*/
    /*.register-line{width: 100%; height: auto; border-top: 2px solid #86c226; overflow: hidden; margin-top: 30px;}*/
    #register {margin-bottom: 10px;width: 990px;padding: 0;margin: 0 auto;zoom: 1; border-top: 2px solid #86c226;margin-top: 30px;}
    #register .mt,#register .mt h2,#register .mt span{height:45px;line-height:45px;}
    #register .mt{padding-right:10px;position:relative;overflow:visible; /*margin-bottom:-1px;border-bottom:1px solid #dddddd;*/}
    #register .mt h2{float:left;padding-left:15px;}
    #register .mt span{float:right;text-align:right;}
    #register .mt b{display:none;}
    #register .mt .extra{position:absolute;right:20px;top:5px;}
    /*下箭头*/
    .arrow-down{width:0;  height:0; border-left:100px solid transparent;  border-right:100px solid transparent;  border-top:20px solid #86c226; margin-left: 390px;margin-bottom: 30px;}
    #register .mc{padding:0 0 20px;border:solid #dddddd;border-width:0px 1px 1px; background: #ffffff; margin-bottom: 20px; }
    #register .tab{height:45px;padding-left: 390px;}
    #register .tab li{margin-right:5px;margin-top:3px;font-size:16px;width:200px;height:28px;text-align:center;line-height:28px;color:#F79100;}
    #register .tab .new{height:31px;line-height:31px;margin-top:0;}
    #register .tab .curr{position:relative;color:#ffffff;background:#86c226;height:45px;line-height:45px;font-weight:bold;margin-top:0;/*-moz-box-shadow:2px 0 2px #DDDDDD; -webkit-box-shadow:2px 0 2px #DDDDDD;box-shadow:2px 0 2px #DDDDDD;border-bottom: none;*/}
    #register .tab li{background:#f7f7f7;/*border:1px solid #dddddd;*/}
    #register .tab li.fore{width:224px;}
    #register .tab li a{display:block;width:100px;height:34px;}
    #register .tab .fore a{width:224px;}
    #register .tab li a:hover,#register .tab li a:active{color: #333;text-decoration: none;}
    #register .item{padding-top:9px;height:60px;line-height:34px;position:relative;z-index:1;}
    #register .label {width: 347px;text-align: right;font-size: 14px;color: #999;padding-right: 10px; float: left;}
    #register .label b {font-family: "????";margin-right: 5px;font-weight: normal;}
    #register .item .item-ifo {position: relative;width: 270px;}
    #register .text {width: 238px;height: 16px;padding: 10px 25px 10px 5px;border: 1px solid #cccccc;float: none;font-size: 14px;font-family: arial,"宋体";color: #999;}
    #register .text-1 {width: 100px;float: left;}
    #register .item-ifo i {position: absolute;right: 8px;}
    #register .item-ifo .i-name {background: url(${base}/static/mall/img/user.jpg) no-repeat scroll 0 0 transparent;height: 16px;top: 9px;width: 16px;}
    #register .item-ifo .i-pass {background: url(${base}/static/mall/img/pwd.jpg) no-repeat scroll 0 0 transparent;height: 19px;top: 11px;width: 14px;}
    #register #authcode.text {color: #333;float: left;}
    #register .blank{width:16px;height:16px;position:absolute;right:4px;top:9px;padding:3px;float:none;}
    #register #authcodeDiv .img{margin-left:2px; float: left;}
    #register #authcodeDiv .item-ifo {width: 326px;}
    #register .succeed{background:url(${base}/static/mall/img/sucess.png) no-repeat #ffffff;}
    #register .highlight1{border:1px solid #7ABD54;color: #333;}
    #register .highlight2{border:1px solid #FF0000;color:#f00;}
    #register .pwdbg{background:#FFF8EB;}
    #register .ajax-check{position:absolute;margin-left:-21px;padding-left:21px;right:-70px;top:5px;}
    /*
    #register .focus,#register .error{color:#e4393c;line-height:36px;height:36px;position:absolute;top:0px;right:-275px;width:260px;padding:0 5px;background:#FFEBEB;border:1px solid #ffbdbe;}
    */
    #register .focus{color:#e4393c;line-height:36px;height:36px;position:absolute;top:0px;right:-275px;width:260px;padding:0 5px;background: none;}
    #register .error{color:#e4393c;line-height:36px;height:36px;position:absolute;top:0px;right:-275px;width:230px;padding:0 5px;background:url(${base}/static/mall/gwq/img/register-tsbg.png) no-repeat; padding-left: 30px;}
    #register .null{background:none;border:none;background:none;}
    #register .error span,.focus span{padding:5px 0;line-height:13px;display:block;}
    /*#register .focus{color:#666;line-height:36px;background:#f7f7f7;border:1px solid #dddddd;}*/
    #register .focus{}
    .register-ts{width: 990px; text-align: center; margin-bottom: 20px; color: #f00; font-size: 16px; background: #f7f7f7; height:50px; line-height: 50px;}
    #register .null,#regist .error{color:#f00;}
    #register .checkbox{margin-top:8px;*margin-top:5px;_margin-top:6px;}
    @media all and (-webkit-min-device-pixel-ratio:0) { #register .checkbox {margin-top:10px;} }
    #register .item-new {padding-top: 0;height: 36px;}
    #register a.blue:link, #register a.blue:visited {color: #005AA0;}
    .ftx04, .flk04 a:link, .flk04 a:visited, a.flk04:link, a.flk04:visited {color: #F00;}
    .ftx13, .flk13 a:link, .flk13 a:visited, a.flk13:link, a.flk13:visited {color: #005AA0;}
    #register .btn-regist {display: inline-block;border: 0 none;font-size: 14px;font-weight: bold;text-align: center;color: #fff;}
    #register .btn-regist {width: 270px;height: 36px;color: #FFF;font-family: "微软雅黑";font-size: 16px;/*text-indent: -9999px;*/font-weight: 800;overflow: hidden;background:#86c226; border-radius: 3px;}
    #register .hover-btn {background:#86c226;}
    #register .wait-btn{background:url(${base}/static/mall/img/wait-btn.jpg) no-repeat;}
    #register #userName_error{margin-top:0;float:none;cursor:pointer;}
</style>
    <#include "mall/gwq/header_new.ftl"/>


<div id="register">
    <div class="mc">
        <div class="mt">
            <ul class="tab">
                <li class="curr">会员注册</li>
            </ul>
        </div>
        <div class="arrow-down"></div>
        <#--<div class="register-ts">真实姓名与身份证号必须来自同一个身份证，否则无法参加海外购!</div>-->
        <form id="memberRegForm" method="POST" onsubmit="return false;">
            <div class="form">
                <div class="item" id="select-regName">
                    <span class="label"><b class="ftx04">*</b>登录名：</span>
                    <div class="fl item-ifo">
                        <input type="text" id="userName" name="userName" class="text" tabindex="1"  value="手机号" onfocus="if(this.value=='手机号') this.value='';this.style.color='#333'" onblur="if(this.value=='') {this.value='手机号';this.style.color='#999999'}"/>
                        <i class="i-name"></i>
                        <label id="userName_succeed" class="blank"></label>
                        <label id="userName_error"></label>
                    </div>
                </div>
                <div class="item" id="select-reallName">
                    <span class="label"><b class="ftx04">*</b>真实姓名：</span>
                    <div class="fl item-ifo">
                        <input type="text" id="nickName" name="nickName" class="text" tabindex="1"  value="真实姓名" onfocus="if(this.value=='真实姓名') this.value='';this.style.color='#333'" onblur="if(this.value=='') {this.value='真实姓名';this.style.color='#999999'}"/>
                        <i class="i-name"></i>
                        <label id="nickName_succeed" class="blank"></label>
                        <label id="nickName_error"></label>
                    </div>
                </div>
                <#--<div class="item" id="select-iDcode">-->
                    <#--<span class="label"><b class="ftx04">*</b>身份证号：</span>-->
                    <#--<div class="fl item-ifo">-->
                        <#--<input type="text" id="iDcode" name="iDcode" class="text" tabindex="1"  value="身份证号" onfocus="if(this.value=='身份证号') this.value='';this.style.color='#333'" onblur="if(this.value=='') {this.value='身份证号';this.style.color='#999999'}"/>-->
                        <#--<i class="i-name"></i>-->
                        <#--<label id="iDcode_succeed" class="blank"></label>-->
                        <#--<label id="iDcode_error"></label>-->
                    <#--</div>-->
                <#--</div>-->
                <div class="item">
                    <span class="label"><b class="ftx04">*</b>登录密码：</span>
                    <div class="fl item-ifo">
                        <input type="password" id="password" name="password" class="text" tabindex="2" onpaste="return  false">
                        <i class="i-pass"></i>
                        <label id="password_succeed" class="blank"></label>
                        <label id="password_error" class="null"></label>
                        <span class="clr"></span>
                    </div>
                </div>
                <div class="item">
                    <span class="label"><b class="ftx04">*</b>确认密码：</span>
                    <div class="fl item-ifo">
                        <input type="password" id="repassword" name="repassword" class="text" tabindex="3" onpaste="return  false" autocomplete="off">
                        <i class="i-pass"></i>
                        <label id="repassword_succeed" class="blank"></label>
                        <label id="repassword_error" class="null"></label>
                    </div>
                </div>
                <div class="item" id="authcodeDiv">
                    <span class="label"><b class="ftx04">*</b>验证码：</span>
                    <div class="fl item-ifo">
                        <input type="text" id="authcode" style="ime-mode:disabled" name="authcode" class="text text-1" tabindex="6" autocomplete="off" maxlength="6">
                        <label class="img"><img id="captchaImage" style="cursor:pointer;width:100px;height:38px;display:block;" alt="验证码" src="${base}/captcha.jpg?yys=+new Date().getTime()" onclick="this.src='${base}/captcha.jpg?yys='+new Date().getTime()"></label>
                        <label class="ftx23">&nbsp;看不清？<a href="javascript:void(0)" id="getCaptcha" onclick="document.getElementById('captchaImage').src='${base}/captcha.jpg?yys='+new Date().getTime()" class="flk13">换一张</a></label>
                        <label id="authcode_succeed" class="blank invisible"></label>
                        <label id="authcode_error"></label>
                    </div>
                </div>
                <div class="item item-new">
                    <span class="label">&nbsp;</span>
                    <div class="fl item-ifo">
                        <input type="checkbox" class="checkbox" checked="checked" id="readme" onclick="agreeonProtocol();">
                        <label for="protocol">我已阅读并同意<a href="${base}/html/protocol.html" class="blue" id="protocol">《会员注册协议》</a></label>
                        <span class="clr"></span>
                        <label id="protocol_error" class="error hide">请同意会员注册协议</label>
                    </div>
                </div>
                <div class="item">
                    <span class="label">&nbsp;</span>
                    <input type="button" class="btn-img btn-regist" id="registersubmit" value="立即注册" tabindex="8">
                </div>
            </div>
            <span class="clr"></span>
        </form>
    </div>
</div>

<script src="${base}/static/js/jquery.form.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jdValidate.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $.extend(validateFunction, {
            regValidate: function () {
                $("#userName").jdValidate(validatePrompt.regName, validateFunction.regName, true);
                $("#nickName").jdValidate(validatePrompt.reallName, validateFunction.reallName, true);
//                $("#iDcode").jdValidate(validatePrompt.iDcode, validateFunction.iDcode, true);
                $("#password").jdValidate(validatePrompt.pwd, validateFunction.pwd, true);
                $("#repassword").jdValidate(validatePrompt.pwdRepeat, validateFunction.pwdRepeat, true);
                $("#authcode").jdValidate(validatePrompt.authCode, validateFunction.authCode, true);
                return validateFunction.FORM_submit(["#userName","#nickName", "#password", "#repassword", "#authcode"]);
            }
        });
        $("#userName").jdValidate(validatePrompt.regName, validateFunction.regName);
        $("#nickName").jdValidate(validatePrompt.reallName, validateFunction.reallName);
//        $("#iDcode").jdValidate(validatePrompt.iDcode, validateFunction.iDcode);
        $("#password").jdValidate(validatePrompt.pwd, validateFunction.pwd);
        $("#repassword").jdValidate(validatePrompt.pwdRepeat, validateFunction.pwdRepeat);
        $("#authcode").jdValidate(validatePrompt.authCode, validateFunction.authCode);

        $registersubmit=$("#registersubmit");
        $registersubmit.hover(function () {
            $(this).addClass("hover-btn");
        }, function () {
            $(this).removeClass("hover-btn");
        });

        var isSubmit = false;
        $registersubmit.click(function () {
            if (isSubmit) {
                return;
            }
            isSubmit = true;

            if(!agreeonProtocol()){
                isSubmit = false;
                return;
            }

            //用户名不输入时，输入框内容置空
            var regName = $("#userName").val();
            if (regName == '手机号') {
                $("#userName").val("");
            }

            var nickName = $("#nickName").val();
            if (nickName == '真实姓名') {
                $("#nickName").val("");
            }

//            var iDcode = $("#iDcode").val();
//            if (iDcode == '身份证号') {
//                $("#iDcode").val("");
//            }

            var agreeProtocol = agreeonProtocol();
            var passed = validateFunction.regValidate() && agreeProtocol;
            if (passed) {
                var str=$('#memberRegForm').formSerialize(); // registerForm为form id
                $("#registsubmit").attr({ "disabled": "disabled" }).removeClass().addClass("btn-img btn-regist wait-btn");
                $.ajax({
                    type: "POST",
                    url: "${base}/member/save?r=" + Math.random(),
                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                    data: $("#memberRegForm").formSerialize(),
                    success: function (data) {
                        if(data.status=='success'){
                            window.location="${base}/member/index";
                        }else{
                            alert(data.message);
                            $("#registsubmit").removeAttr("disabled").removeClass().addClass("btn-img btn-regist");
                            isSubmit = false;
                        }
                    }
                });

            } else {
                $("#registsubmit").removeAttr("disabled").removeClass().addClass("btn-img btn-regist");
                isSubmit = false;
            }

        });

        $("#protocol").colorbox({title:"会员注册协议", iframe:true, innerWidth:600, innerHeight:500, opacity: 0.15});

    });

    function agreeonProtocol(){
        if ($("#readme").prop("checked") == true) {
            $("#protocol_error").removeClass().addClass("error hide");
            return true;
        }else{
            $("#protocol_error").removeClass().addClass("error");
            return false;
        }
    }
</script>
    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>
</#escape>