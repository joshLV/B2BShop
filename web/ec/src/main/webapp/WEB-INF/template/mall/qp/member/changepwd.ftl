<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>修改密码</title>
<meta name="description" content="修改密码">
<meta name="Keywords" content="修改密码">
<link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"changepwd"
};
</script>
</head>
<body>
<#include "mall/qp/shortcut.ftl"/>
<#include "mall/qp/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 150px;margin-right: 10px;}
.right {float: right;width: 820px;}

.widepage .right {width: 980px;}

.right a:link, .right a:visited {color: #005ea7;}
.right a:link, .right a:visited {color: #005ea7;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}
.right {
	float: right;
	font-family: Verdana;
	border: 1px solid #EDD28B;
	background: #FFFDEE;
}
.right .mc {
	padding: 25px 0 22px 40px;
	overflow: hidden;
	zoom: 1;
}
.form .item {
	margin-bottom: 20px;
}
.label {
	line-height: 25px;
	margin-right: 8px;
	float: left;
	font-size: 12px;
	color: #666666;
	text-align: right;
}
.form em {
	color: #ff6600;
	margin-right: 3px;
}
.fl {
	float: left;
}
.form .text {
	width: 175px;
	margin-right: 5px;
	padding: 4px;
	border: 1px solid;
	border-color: #aaa #ddd #ddd #aaa;
	margin-top: 0;
	margin-bottom: 0;
}
.msg-error {
	color: #cc0000;
	line-height: 25px;
}
.btn-entry {
	width: 68px;
	height: 25px;
	line-height: 25px;
	background: url(${base}/static/mall/img/bg-btn-entry.jpg) no-repeat;
	font-weight: bold;
	margin-left: 100px;
}
</style>

<style>
.ftx-04 {color: #ff6600;}

/**pagin**/
.pagin a,.pagin span {float: left;height: 20px;padding: 3px 10px;border: 1px solid #ccc;margin-left: 2px;font-family: arial;line-height: 20px;font-size: 14px;overflow: hidden;-moz-border-radius: 5px;-webkit-border-radius: 5px;}
.pagin .text,.pagin .current {border: 0;padding: 4px 11px;}
.pagin a:link,.pagin a:visited {color: #005aa0;}
.pagin a:hover,.pagin a:active {background: #005aa0;color: #fff;text-decoration: none;}
.pagin .current,.pagin .current:link,.pagin .current:visited {color: #f60;font-weight: 700;}
.pagin b {display: block;position: absolute;top: 9px;width: 5px;height: 9px;background-image: url(${base}/static/mall/img/bg5.gif);background-repeat: no-repeat;overflow: hidden;}
.pagin .prev,.pagin .next,.pagin .prev-disabled,.pagin .next-disabled {position: relative;padding-top: 5px;height: 18px;line-height: 18px;}
.pagin .prev-disabled,.pagin .next-disabled {color: #ccc;cursor: default;}
.pagin .prev,.pagin .prev-disabled {padding-left: 12px;}
.pagin .prev b {left: 3px;background-position: -68px -608px;}
.pagin .prev-disabled b {left: 3px;background-position: -80px -608px;}
.pagin .next,.pagin .next-disabled {padding-right: 12px;}
.pagin .next b {right: 3px;background-position: -62px -608px;}
.pagin .next-disabled b {right: 3px;background-position: -74px -608px;}
.pagin-m a,.pagin-m span {height: 14px;line-height: 14px;font-size: 12px;}
.pagin-m b {top: 5px;}
.pagin-m .prev,.pagin-m .next,.pagin-m .prev-disabled,.pagin-m .next-disabled {padding-top: 3px;height: 14px;line-height: 14px;*line-height: 16px;}
</style>

<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;邮件订阅<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
	<div class="left">
		<#include "mall/qp/member/menu.ftl"/>
	</div><!--left end-->
	<div class="right">
		<div class="mc" id="main">
			<div class="form">
				<div class="item" id="pa">
					<span class="label">　　<em>*</em>旧密码：</span>
					<div class="fl">
						<input type="password" class="text" id="oldpwd" tabindex="1" name="password" onblur="passwordOnblur();" onfocus="passwordOnfocus();">
						<div class="clr"></div>
						<div class="" id="password_message" style="display: none;">输入旧密码</div>
						<div class="clr"></div>
						<div id="password_error" class="msg-error" style="display: none;">旧密码不正确</div>
						<div class="clr"></div>
					</div>
					<div class="clr"></div>
				</div>
				
				<div class="item" id="pb">
					<span class="label">　　<em>*</em>新密码：</span>
					<div class="fl">
						<input type="password" id="newpwd" class="text" tabindex="2" onfocus="newpwdOnfocus();" onblur="newpwdOnblur();">
						<div class="clr"></div>
						<div class="" id="newpwd_message" style="display: none;">由字母加数字或符号至少两种以上字符组成的6-20位半角字符，区分大小写</div>
						<div class="clr"></div>
						<div id="newpwd_error" class="msg-error" style="display: none;">密码过于简单</div>
						<div class="clr"></div>
					</div>
					<div class="clr"></div>
				</div>
				<div class="item" id="pc">
					<span class="label"><em>*</em>确认新密码：</span>
					<div class="fl">
						<input type="password" id="rnewpwd" class="text" tabindex="2" onblur="isSamePassword();">
						<div class="clr"></div>
						<div id="rnewpwd_error" class="msg-error" style="display: none;">两次输入的密码不一致</div>
						<div class="clr"></div>
					</div>
					<div class="clr"></div>
				</div>
				<div class="item" id="pd">
					<span class="label">&nbsp;</span>
					<div class="fl">
						<input type="button" tabindex="4" value="确定" onclick="onsub();" id="findPwdSubmit" class="btn-img btn-entry">
						<div class="clr"></div>
					</div>
				</div>
				<div class="item" id="pe">
					<span class="label">&nbsp;</span>
					<div class="msg-error">修改失败</div>
					<div class="clr"></div>
				</div>
				<div class="item" id="pf">
					<span class="label">&nbsp;</span>
					<div class="msg-error">修改成功</div>
					<div class="clr"></div>
				</div>
				
			</div>
		</div>
    	<div class="clr"></div>
	</div><!--right end-->
</div>
<#include "mall/qp/service.ftl"/>
<#include "mall/qp/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
    //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {

        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });
        $("#pe").hide();
        $("#pf").hide();

    });
    function passwordOnblur(){
    	var password = $("#oldpwd").val();
    	if(password.length>0){
			$("#password_message").hide();
    		$.ajax({
		        type: "get",
		        url: "${base}/member/changepwd/ajaxCheckPwd",
		        data: {"password":password},
		        success: function(data) {
		        	if(data.status=='success'){
		        		
			        }else{
    					$("#password_error").show();
			        }
		        }
	   		});
    	}
    }
    function passwordOnfocus(){
    	$("#password_message").show();
    	$("#password_error").hide();
    }
    function newpwdOnfocus(){
    	$("#newpwd_message").show();
    	$("#newpwd_error").hide();
    }
    function newpwdOnblur(){
    	var password = $("#newpwd").val();
    	if(password.length<6||isDigit(password)){
    		$("#newpwd_message").hide();
    		$("#newpwd_error").show();
    	}else{
    		$("#newpwd_message").hide();
    		$("#newpwd_error").hide();
    	}
    }
    function isDigit(s){  
      	var patrn=/^[0-9]{1,20}$/;  
      	if (!patrn.test(s)){
      		return false;  
      	}else{
      		return true;  
      	}
    }
    function isSamePassword(){
    	var newpwd = $("#newpwd").val();
    	var rnewpwd = $("#rnewpwd").val();
    	if(newpwd!=rnewpwd){
    		$("#rnewpwd_error").show();
    	}else{
    		$("#rnewpwd_error").hide();
    	}
    }   
    function onsub(){
    	var oldpwd = $("#oldpwd").val();
    	var newpwd = $("#newpwd").val();
    	var rnewpwd = $("#rnewpwd").val();
    	if(oldpwd.length==0){
    		$("#password_message").show();
    		$("#password_error").hide();
    		return false;
    	}
    	if(newpwd.length==0){
    		$("#newpwd_message").show();
    		$("#newpwd_error").hide();
    		return false;
    	}
    	if(newpwd!=rnewpwd){
    		$("#rnewpwd_error").show();
    		return false;
    	}
    	if(oldpwd.length>0&& newpwd.length>0 && newpwd==rnewpwd){
    		$.ajax({
		        type: "get",
		        url: "${base}/member/changepwd/ajaxchangePwd",
		        data: "newpwd="+newpwd+"&oldpwd="+oldpwd,
		        success: function(data) {
		        	if(data.status=='success'){
		        		$("#pa").hide();
		        		$("#pb").hide();
		        		$("#pc").hide();
		        		$("#pd").hide();
        				$("#pf").show();
			        }else{
			        	$("#pa").hide();
		        		$("#pb").hide();
		        		$("#pc").hide();
		        		$("#pd").hide();
			        	$("#pe").show();
			        }
		        }
	   		});
    	}
    }
</script>
</body>
</html>