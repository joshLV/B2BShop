<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>找回密码</title>
<meta name="description" content="找回密码">
<meta name="Keywords" content="找回密码">
<link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
<link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
<link href="${base}/static/mall/nsc/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js"></script>
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
	width: 100%;
	margin: 20px auto;
}
.mt {
	height: 33px;
	background: url(${base}/static/mall/nsc/img/bg-tit.jpg) #D1D1D1 repeat-x 0 -34px;
}
.mt h2 {
	float: left;
	height: 33px;
	padding-left: 15px;
	background: url(${base}/static/mall/img/bg-tit.jpg) no-repeat 0 0;
	line-height: 33px;
}
.mt b {
	float: right;
	width: 10px;
	height: 33px;
	background: url(${base}/static/mall/img/bg-tit.jpg) no-repeat 0 -68px;
}
.processNav .extra {
	BACKGROUND: url(${base}/static/mall/img/cartscbgv.png) no-repeat 0px 0px
}
.processNav {
	MARGIN: 0 110px; BACKGROUND: #fff; FLOAT: left; COLOR: #404040; FONT-WEIGHT: 700;margin-bottom: 30px
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
	BACKGROUND: #3b7cd0; COLOR: #fff
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
	width: 68px;
	height: 25px;
	line-height: 25px;
	background: url(${base}/static/mall/img/bg-btn-entry.jpg) no-repeat;
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
</head>
<body>
<#assign path="mall/nsc" />
<div class="g-doc">
    <div class="g-hd">
		<#include "${path}/shortcut.ftl"/>
        <#include "${path}/header.ftl"/>
    </div>
<div class="g-bd">
<div id="findpwd">
	<div class="mt">
		<h2>找回密码</h2>
		<b></b>
	</div>
	<div class="mc">
		<ol class="processNav">
			<li id="one" class="step1 on">1、填写用户名<b class="extra"></b></li>
			<li id="two" class="step2">2、验证身份<b class="extra"></b></li>
			<li id="three" class="step3">3、完成<b class="extra"></b></li>
		</ol>
		<span class="clr"></span>
		<div class="form" id="a">
			<div class="item">
				<span class="label">用户名：</span>
				<div class="fl">
					<!-- text_error -->
					<input type="text" tabindex="1" class="text"  id="username" name="username">
					<span class="clr"></span>
					<label id="username_normal" class="">您输入您的用户名/邮箱/已验证手机</label>
					<label id="username_error" class="msg-error">您输入的账户名不存在，请核对后重新输入。</label>
				</div>
			</div>
			<div class="item">
				<span class="label">&nbsp;</span>
				<input type="button" tabindex="4" value="下一步" onclick="onNext();" id="findPwdSubmit" class="btn-img btn-entry">
			</div>
		</div>
		<div class="form" id="b">
			<div class="item">
				<span class="label">绑定邮箱：</span>
				<div class="fl">
					<!-- text_error -->
					<input type="text" tabindex="1" class="text"  id="mail" name="mail">
					<span class="clr"></span>
					<label id="mail_normal" class="">您输入您绑定的邮箱</label>
					<label id="mail_error" class="msg-error">您输入的邮箱地址不匹配</label>
				</div>
			</div>
			<div class="item">
				<span class="label">&nbsp;</span>
				<input type="button" tabindex="4" value="下一步" onclick="onNextTwo();" id="findPwdSubmit" class="btn-img btn-entry">
			</div>
		</div>
		<div class="form" id="c">
			<div class="item">
                <span class="rpwd">重置后的密码已发送到您的邮箱!请查收</span>
             </div>
		</div>
	</div>
	<span class="clr"></span>
</div>
</div>
<#include "${path}/service.ftl"/>
<#include "${path}/footer.ftl"/>
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
pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
$(function () {
	$("#username_error").hide();
	$("#username_normal").show();
	$("#a").show();
	$("#b").hide();
	$("#c").hide();
    $(".u-category").hide();
});
function onNext(){
	var username = $("#username").val();
	$.ajax({
        type: "get",
        url: "${base}/ajaxCheckUser",
        data: "username="+username,
        success: function(data) {
        	if(data.status=='success'){
        		if(data.data==true){
	        		$("#one").removeClass('on');
	        		$("#two").addClass('on');
		        	$("#a").hide();
					$("#b").show();
					$("#mail_error").hide();
					$("#mail_normal").show();
        		}else{
	        		$("#username_error").show();
		        	$("#username_normal").hide();
        		}
	        }else{
	        	$("#username_error").show();
	        	$("#username_normal").hide();
	        }
        }
    });
}
function onNextTwo(){
	var username = $("#username").val();
	var mail = $("#mail").val();
	$.ajax({
        type: "get",
        url: "${base}/ajaxCheckUserMail",
        data: "username="+username+"&email="+mail,
        success: function(data) {
        	if(data.status=='success'){
        		if(data.data==true){
        			//发送邮件
        			$.ajax({
				        type: "get",
				        url: "${base}/ajaxSendMail",
				        data: "username="+username+"&email="+mail,
				        success: function(data) {
				        	if(data.status=='success'){
				        		$("#two").removeClass('on');
				        		$("#three").addClass('on');
					        	$("#b").hide();
								$("#c").show();
					        }
				        }
				    });
        		}else{
	        		$("#mail_error").show();
					$("#mail_normal").hide();
        		}
	        }else{
	        	$("#mail_error").show();
				$("#mail_normal").hide();
	        }
        }
    });
}
</script>
</html>