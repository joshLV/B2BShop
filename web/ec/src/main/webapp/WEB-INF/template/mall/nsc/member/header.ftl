<#escape x as x?html>
<style>
#header {height: 60px;padding: 15px 0;width:1198px; margin: 0 auto;}
#logo {float: left;width: 330px;}
#logo a:link b,#logo a:visited b {top: 12px;left: 168px;width: 100px;height: 38px;cursor: pointer}
#logo b {position: absolute;top: 18px;left: 180px;width: 111px;height: 46px;}
.widepage #logo {padding-left:120px;}
</style>
<div id="headerDiv">
	<div class="content" id="header">
		<div id="logo" class="ld">
			<a href="${base}"><b></b><img src="${base}/static/mall/nsc/img/logo.png" alt="<@spring.message "project_name"/>"></a>
        </div><!--logo end-->
	</div><!--header end-->
</div>
</#escape>
