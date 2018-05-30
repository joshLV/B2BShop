<#escape x as x?html>
<style>
#shortcut,#shortcut .content {height: 30px;background: #F7F7F7}
#shortcut .fl b,#shortcut .fr b {background-image: url(${base}/static/mall/img/shortcut_bg.png);background-repeat: no-repeat}
#shortcut {width: 100%;border-bottom: 1px solid #eee;line-height: 30px}
#shortcut li {height: 30px;padding: 0 11px 0 12px}
#shortcut li s {top: 9px;left: 0;width: 0;height: 12px;border-left: 1px solid #DDD;overflow: hidden}
#shortcut b {transition: transform .2s ease-in 0s;-webkit-transition: -webkit-transform .2s ease-in 0s}
#shortcut .lh {overflow: hidden;zoom: 1}
#shortcut .lh li,#shortcut .lh dl,#shortcut .lh .item {float: left}
#shortcut .ld {position: relative;zoom: 1}
#shortcut .ld s,#shortcut .ld b,#shortcut .ld .block {position: absolute;overflow: hidden}
#shortcut .fl {overflow: visible}
#shortcut .fl .favorite {padding-left: 16px;z-index: 13}
#shortcut .fl b {top: 8px;left: 0;width: 13px;height: 13px;background: url(${base}/static/mall/img/favorite.png) no-repeat 0 0;cursor: pointer}
#shortcut .fl li:hover b {transform: rotate(720deg);-webkit-transform: rotate(720deg)}
#shortcut .fr {/*height: 30px;*/overflow: visible}
#shortcut .fr b {top: 13px;right: 8px;width: 7px;height: 4px;background-position: -95px -55px}
#shortcut .menu {width: 60px;z-index: 12}
#shortcut .dd {display: none}
#shortcut .hover .outline,#shortcut .hover .dd {position: absolute;border: 1px solid #DDD;background: #fff;-moz-box-shadow: 0 0 10px rgba(0,0,0,.12);-webkit-box-shadow: 0 0 10px rgba(0,0,0,.12);box-shadow: 0 0 10px rgba(0,0,0,.12)}
#shortcut .hover .outline {z-index: -1;left: 5px;top: 3px;width: 73px;height: 28px}
#shortcut .hover .blank {position: absolute;z-index: 1;top: 23px;left: 6px;width: 73px;height: 8px;overflow: hidden;background: #fff}
#shortcut .hover .dd {display: block;top: 30px}
#shortcut .fr .hover b {transform: rotate(180deg);-webkit-transform: rotate(180deg);filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=2)}
#khfw.hover .dd {left: 5px;width: 73px}
#khfw.hover .dd div {padding-left: 6px;line-height: 22px}
</style>
<div id="shortcut">
	<div class="content">
		<ul class="fl lh">
			<li class="favorite ld" ><b></b><a href="javascript:addToFavorite()">收藏<@spring.message "project_short_name"/></a></li>
		</ul>
		<ul class="fr lh">
			<li id="offline"><span id="welcome">您好</span><!--<span id="useroff">--></span>！欢迎来到<@spring.message "project_name"/>！<a href="javascript:login();">[登录]</a>&nbsp;<a href="javascript:regist();">[免费注册]</a></li>
			<li id="online" style="display:none;"><span id="welcome">您好</span><span id="userline"></span>！欢迎来到<@spring.message "project_name"/>！</span><a href="${base}/member/logout">[退出]</a></li>
			<li class="ld">
				<s></s>
				<a href="${base}/order/list">我的订单</a>
			</li>
			<li class="ld menu" id="khfw" data-widget="dropdown">
				<s></s>
				<span class="outline"></span>
				<span class="blank"></span>
				客户服务
				<b></b>
				<div class="dd">
					<div><a href="#help/index" target="_blank">帮助中心</a></div>
				</div>
			</li>
		</ul>
		<span class="clr"></span>
	</div>
</div><!--shortcut end-->
<script type="text/javascript" src="${base}/static/js/jquery.cookies.js"></script>
<script type="text/javascript">
$(function () {
	var userNameCookie = $.cookies.get("memberUsername");
	var rememberMeCookie = $.cookies.get("rememberMe4Member");
	var nicknameCookie = $.cookies.get("memberNickname");
	if (userNameCookie != null && userNameCookie != "" && rememberMeCookie != null && rememberMeCookie !="") {
		$("#offline").hide();
		$("#online").show();
		if(nicknameCookie!=null && nicknameCookie!=""){
			$("#userline").html('，'+nicknameCookie)
		}else{
			if(userNameCookie!=null && userNameCookie!=""){
				$("#userline").html('，'+userNameCookie)
			}
		}
	}else{
		$("#online").hide();
		$("#offline").show();
		if(nicknameCookie!=null && nicknameCookie!=""){
			$("#useroff").html('，'+nicknameCookie)
		}else{
			if(userNameCookie!=null && userNameCookie!=""){
				$("#useroff").html('，'+userNameCookie)
			}
		}
	}
	
});
</script>
</#escape>