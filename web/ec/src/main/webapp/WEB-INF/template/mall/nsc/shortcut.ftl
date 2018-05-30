<#escape x as x?html>
<script type="text/javascript">
    // 设置为主页
    function SetHome(obj,vrl){
        try{
            obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
        } catch(e){
            if(window.netscape) {
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                }catch (e) {
                    alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
                }
                var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
                prefs.setCharPref('browser.startup.homepage',vrl);
            }else{
                alert("您的浏览器不支持，请按照下面步骤操作：1.打开浏览器设置。2.点击设置网页。3.输入："+vrl+"点击确定。");
            }
        }
    }
    // 加入收藏 兼容360和IE6
    function shoucang(sTitle,sURL){
        try{
            window.external.addFavorite(sURL, sTitle);
        }catch (e){
            try{
                window.sidebar.addPanel(sTitle, sURL, "");
            }catch (e){
                alert("加入收藏失败，请使用Ctrl+D进行添加");
            }
        }
    }
</script>
<div class="m-top-text">
	<div class="u-top-text f-cb">
		<div class="f-fl" id="offline">您好<span id="useroff"></span>！欢迎来到<@spring.message "project_name"/>！ 请 <span>[<a href="javascript:login();">登录</a>]</span> | <span>[<a href="javascript:regist();">注册</a>]</span></div>
		<div class="f-fl" id="online" style="display:none;">您好<span id="userline"></span>！欢迎来到<@spring.message "project_name"/>！ <span><a href="${base}/member/logout">[退出]</a></span></div>

		<div class="f-fr"><a href="javascript:void(0);" onclick="SetHome(this,window.location);">设为首页</a> | <a href="javascript:void(0);" onclick="shoucang(document.title,window.location)">加入收藏</a></div>
	</div>
</div>
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