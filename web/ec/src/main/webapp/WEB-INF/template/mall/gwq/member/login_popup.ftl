<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>会员登录 - <@spring.message "project_name"/>-<@spring.message "project_description"/></title>
<meta name="description" content="会员登录,<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
<meta name="Keywords" content="会员登录,<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
<link href="${base}/static/mall/gwq/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"memberpopuplogin"
};
</script>
<style>
#login {width: 380px;background: #e8e8e8;margin: 5px auto 5px;position: relative;}
.form {position: absolute;top: 18px;right: 32px;width: 320px;overflow: hidden;}
.form .item {height: 64px;line-height: 26px;overflow: visible;position: relative;width: 320px;z-index: 1;}
.form .item span {color: #999999;height: 20px;line-height: 20px;display: block;margin-top: 1px;}
.form .item .item-ifo {position: relative;width: 307px;}
.form .text {float: none;width: 282px;height: 24px;line-height: 24px;padding: 4px 20px 4px 3px;border: 1px solid #cccccc;font-size: 14px;font-family: arial,"宋体";}
#login .item-ifo .i-name {background: url(${base}/static/mall/img/login-all-bg.png) no-repeat -373px -111px #fff;width: 16px;height: 16px;top: 8px;}
#login .item-ifo .ico {position: absolute;right: 12px;z-index: 5;}
#login .blank {display: none;float: none;width: 16px;height: 16px;position: absolute;top: 9px;right: 8px;z-index: 10;padding: 2px;}
#login .succeed {background: url(${base}/static/mall/img/sucess.png) no-repeat #ffffff;}
#login .item-ifo .i-pass {background: url(${base}/static/mall/img/login-all-bg.png) no-repeat -346px -108px #fff;width: 14px;height: 19px;top: 8px;}
#login .text-1 {width: 100px;float: left;}
.form .hline {line-height: 16px;}
.ftx23, .flk23 a:link, .flk23 a:visited, a.flk23:link, a.flk23:visited {color: #999;}
#login #autoentry {height: 37px;margin-top: 8px;}
@media all and (-webkit-min-device-pixel-ratio:0) { #login .checkbox {margin-top:7px;vertical-align:middle;} }
.mb {margin-bottom: 24px;overflow: hidden;}
#login .mar {margin-right: 10px;}
#login .login-btn {height: 52px; }
#login .btn-entry:hover {background: #86c226; }
#login .btn-entry {width: 149px;height: 34px;font-family: "微软雅黑";line-height: 34px;/*text-indent: -9999px;*/background: #86c226;overflow: hidden; color: #ffffff; font-size: 16px; border-radius: 3px;}
#login .btn-register{width: 149px;height: 34px;font-family: "微软雅黑";line-height: 32px;/*text-indent: -9999px;*/background: #e7fec2;overflow: hidden; color: #86c226; font-size: 16px; border-radius: 3px; border: 1px solid #86c226; margin-left:10px;}
#login .btn-register:hover{background: #e7fec2;}
#login .null, #login .error, #userName_error.error, #pwd_error.error, #authcode_error.error {position: absolute;width: 302px;padding: 2px 0 2px 3px;left: 0px;top: 34px;border: 1px solid #ffbdbf;color: #e6393d;background: #ffebec;float: none;line-height: 16px;z-index: 100;}
#login .highlight_success{border:1px solid #7abd54;}
#login .highlight_error{border:1px solid #f00;color:#f00;}
</style>
</head>
<body>
<form id="formlogin" method="post" onsubmit="return false;">
<div id="login">
    <div class="form">
    	<div class="item" style="z-index: 10;">
            <span>手机号</span>
            <div class="item-ifo">
            	<input type="text" id="userName" name="userName" tabindex="1" class="text">
                <div class="i-name ico"></div>
                <label id="userName_succeed" class="blank invisible"></label>
                <label id="userName_error" class="hide"></label>
            </div>
        </div>
        <div class="item m" style="z-index: 8;">
            <span>密码</span>
            <div class="item-ifo">
                <input type="password" id="password" name="password" class="text" tabindex="2" autocomplete="off" sta="0">
                <div class="i-pass ico"></div>
                <label id="pwd_succeed" class="blank invisible"></label>
                <label id="pwd_error" class="hide"></label>
            </div>
        </div>
		<div class="item login-btn">
            <input type="button" class="btn-img btn-entry" id="loginsubmit" value="登录" tabindex="4">
            <input type="button" class="btn-img btn-register" id="register" onclick="registser();" value="免费注册" tabindex="4">
        </div>
    </div>
</div>
</form>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jdValidate.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
setTimeout(function () {if (!$("#userName").val()) {$("#userName").get(0).focus();}}, 0);
$(function () {
	var validate = function(){
		var userName=$("#userName").val();
		var password=$("#password").val();
		var valid=true;
		if(validateRules.isNull(userName)){
//			valid=false;
			$("#userName").addClass("highlight_error");
			$("#userName_error").html("请输入手机号");
            $("#userName_error").addClass("error");
            $("#userName_error").show();
            return false;
		}
        if(!validateRules.isMobile(userName)){
//            valid=false;
            $("#userName").addClass("highlight_error");
            $("#userName_error").html("手机号格式错误!");
            $("#userName_error").addClass("error");
            $("#userName_error").show();
            return false;
        }
		if(validateRules.isNull(password)){
//			valid=false;
			$("#password").addClass("highlight_error");
			$("#pwd_error").html("请输入您的登录密码");
            $("#pwd_error").addClass("error");
            $("#pwd_error").show();
            return false;
		}
        if(!validateRules.betweenLength(password,6,20)){
//            valid=false;
            $("#password").addClass("highlight_error");
            $("#pwd_error").html("登录密码长度在6~20范围内!");
            $("#pwd_error").addClass("error");
            $("#pwd_error").show();
            return false;
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
            url: "${base}/member/check",
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
                    
                    parent.setLogin(false);
                }else{
					parent.setLogin(true);
					parent.cartLoginClose();
					parent.goToOrder();
                }
            }
        });
	});
	
	$("#userName,#password").bind('keyup', function (event) {
		if (event.keyCode == 13) {
			$("#loginsubmit").click();
		}
	});
	
});

/**
 * 点击注册按钮调整到注册功能
 */
function registser(){
    var url = ${base}/+"member/register?ReturnUrl=" + escape(location.href).replace(/\//g, "%2F");
    window.open(url,"_blank");
    window.parent.close();
}
</script>
</body>
</html>