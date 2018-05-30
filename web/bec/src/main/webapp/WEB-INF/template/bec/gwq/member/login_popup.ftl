<#escape x as x?html>
    <#include "bec/gwq/header.ftl"/>
<div id="container">
<form id="formlogin" method="post" onsubmit="return false;">
<div id="login_popup">
    <div class="form">
    	<div class="item" style="z-index: 10;">
            <span>邮箱/用户名</span>
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
        </div>
    </div>
</div>
</form>
</div>
</#escape>
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
			valid=false;
			$("#userName").addClass("highlight_error");
			$("#userName_error").html("请输入邮箱/用户名");
            $("#userName_error").addClass("error");
            $("#userName_error").show();
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
</script>
