<#escape x as x?html>
	<#include "bec/jp/header.ftl"/>
<link type="text/css" href="${base}/static/bec/project/jp/css/login.css" rel="stylesheet">
<div id="container">
	<#include "bec/jp/top2.ftl"/>
    <div class="reg-box">
	<form id="formlogin" method="post" onsubmit="return false;">
<div id="login">
	<div class="mc">
		<div id="bg" style="width: 511px; height: 355px; position: absolute; border-right: 1px solid #E8E8E8;">
	    	<img width="511" height="355" src="${base}/static/bec/project/jp/images/member/member_login.jpg">
	    </div>
	    <div class="form">
	    	<div class="title">
	    		<strong>采购商登录</strong>
	    	</div>
	    	<div class="items" style="z-index: 10;">
	            <span>手机号</span>
	            <div class="item-ifo">
	            	<input type="text" id="userName" name="userName" tabindex="1" class="text" autocomplete="off">
	                <div class="i-name ico"></div>
	                <label id="userName_succeed" class="blank invisible"></label>
	                <label id="userName_error" class="hide"></label>
	            </div>
	        </div>
	        <div class="items" style="z-index: 8;">
                <span>密码</span>
                <div class="item-ifo">
                    <input type="password" id="password" name="password" class="text" tabindex="2" autocomplete="off" sta="0">
                    <div class="i-pass ico"></div>
                    <label id="pwd_succeed" class="blank invisible"></label>
                    <label id="pwd_error" class="hide"></label>
                </div>
            </div>
			<div class="items hide" id="authcodeDiv">
	            <span>验证码</span>
	            <div class="item-ifo">
	                <input type="text" id="authcode" class="text text-1" name="authcode" tabindex="3" style="ime-mode:disabled">
	                <label class="img">
	                    <img style="cursor:pointer;width:100px;height:33px;display:block;" id="JD_Verification1">
					</label>
	                <label class="ftx23 hline">看不清？<br><a href="javascript:void(0)" class="flk13">换一张</a></label>
	                <label id="authcode_succeed" class="blank invisible"></label>
	                <label id="authcode_error" class="hide"></label>
	            </div>
	        </div>
			<div class="items" id="autoentry">
				<div class="item-ifo">
                    <input type="checkbox" class="checkbox" onclick="savePaws()" id="saveid" name="saveid">
					<label class="mar">自动登录</label>
					<label><a href="${base}/findPwd" class="forget-password">忘记密码?</a></label>
					<div class="clr"></div>
				</div>
			</div>
			<div class="items login-btn">
                <input type="button" class="btn-img btn-entry" id="loginsubmit" value="登录" tabindex="4">
            </div>
	    </div>
    </div>
</div>
</form>
		</div>
<script type="text/javascript" src="${base}/static/bec/base/js/jquery.cookie.js"></script>
<script type="text/javascript">

$(function () {
    jQuery(function() {
        var userName = $.cookie('userName');
        var password = $.cookie('password');
        if (typeof(userName) != "undefined"
                && typeof(password) != "undefined") {
            $("#userName").val(userName);
            $("#password").val(password);
            $("#saveid").attr("checked", true);
        }
    });

    if (!$("#userName").val()) {
		$("#userName").get(0).focus();
    }
	var validate = function(){
		var userName=$("#userName").val();
		var password=$("#password").val();
		var valid=true;
		if(validateRules.isNull(userName)){
			valid=false;
			$("#userName").addClass("highlight_error");
			$("#userName_error").html("请输入手机号");
            $("#userName_error").addClass("error");
            $("#userName_error").show();
		}else{
            if(!validateRules.isMobile(userName)){
                valid=false;
                $("#userName").addClass("highlight_error");
                $("#userName_error").html("手机号格式有误");
                $("#userName_error").addClass("error");
                $("#userName_error").show();
            }
		}
		if(validateRules.isNull(password)){
			valid=false;
			$("#password").addClass("highlight_error");
			$("#pwd_error").html("请输入您的登录密码");
            $("#pwd_error").addClass("error");
            $("#pwd_error").show();
		}

		return valid;
	};
		
	$("#userName").bind("focus", function () {
        $("#userName").removeClass("highlight_error");
        $("#userName").addClass("highlight_success");
		$("#userName_error").html("");
        $("#userName_error").removeClass("error");
        $("#userName_error").hide();
    }).bind("blur", function () {
    	$("#userName").removeClass("highlight_success");
    });

    $("#password").bind("focus", function () {
        $("#password").removeClass("highlight_error");
        $("#password").addClass("highlight_success");
		$("#pwd_error").html("");
        $("#pwd_error").removeClass("error");
        $("#pwd_error").hide();
    }).bind("blur", function () {
    	$("#password").removeClass("highlight_success");
    });
    
	$("#loginsubmit").click(function () {
        if(!validate()){
        	return;
        }
        $this=$(this);
        $this.attr({ "disabled": "disabled" });
        $.ajax({
            type: "post",
            url: ${base}/+"member/check",
            data:{'userName':$("#userName").val(),'password':$("#password").val()},
            datatype: 'json',
            error: function () {
				$("#loginsubmit").removeAttr("disabled");
                $this.removeAttr("disabled");
            },
            success: function(result) {
            	$this.removeAttr("disabled");
                if("error"==result.status){
                	$("#pwd_error").html(result.message);
                	$("#pwd_error").addClass("error");
                    $("#pwd_error").show();
                }else if("false"==result.status){
					layer.alert(result.message,{icon:2},function(){
                        window.location=${base}/+"member/registerForward?buyerId="+result.buyerId;
					});
				}else if("regRep"==result.status){
                    window.location=${base}/+"member/registerForward?buyerId="+result.buyerId;
				}else{
                    saveCookie();
                    window.location.href=${base}/+result.url;
                }
            }
        });
	});
	
	$("#userName,#password, #authcode").bind('keyup', function (event) {
		if (event.keyCode == 13) {
			$("#loginsubmit").click();
		}
	});
	
});

function savePaws() {
    if (!$("#saveid").prop("checked")) {
        $.cookie('userName', '', {
            expires : -1
        });
        $.cookie('password', '', {
            expires : -1
        });
        $("#userName").val('');
        $("#password").val('');
    }
}

function saveCookie() {
    if ($("#saveid").prop("checked")) {
        $.cookie('userName', $("#userName").val(), {
            expires : 7
        });
        $.cookie('password', $("#password").val(), {
            expires : 7
        });
    }
}
</script>
    <#--<div class="foot_info">
        <p>地址：西安市西安国际港务区港务大道六号&nbsp;&nbsp;邮编：710026&nbsp;&nbsp;E-mail:xitlp@yahoo.com.cn</p>
        <p>Copyright (C) 2013-2014&nbsp;&nbsp;通联支付网络服务股份有限公司&nbsp;&nbsp;版权所有 </p>
    </div>-->
</div>
<!--foot_info-->
    <#include "bec/jp/foot.ftl"/>
</#escape>