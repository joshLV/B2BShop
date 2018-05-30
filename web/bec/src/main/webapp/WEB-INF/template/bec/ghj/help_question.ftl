
	<#include "bec/ghj/header.ftl"/>
<div id="container">
	<#include "bec/ghj/top.ftl"/>
	<div class="help-content">
		<div class="breadcrumb">
			<!--${base}/help-->
			<strong><a href="#">帮助中心</a></strong><span>&nbsp;&gt;&nbsp;<a href="${base}/help/question/${articles.id}.html" target="_self">${(articles.title)!}</a><span></span></span>
		</div><!--breadcrumb end-->
	</div>
	<div class="help-content">
		<div class="help_l">
			<#include "bec/ghj/help_menu.ftl"/>
		</div><!--left end-->
		<div class="help_r">
			${(articles.content)!}
		</div><!--right end-->
		<span class="clr"></span>
	</div>
</div>
<script type="text/javascript">
$(function () {
	//左侧菜单折叠操作
	$("#leftMenu dt").click(function(){
		$parent=$(this).parent();
		if($parent.hasClass("close")){
			$parent.removeClass("close");
		}else {
            $parent.addClass("close");
        }
	});
});
</script>
	<#include "bec/ghj/service.ftl"/>
	<#include "bec/ghj/foot.ftl"/>