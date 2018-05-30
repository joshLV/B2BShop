
	<#include "bec/ghdj/header.ftl"/>
<div id="container">
	<#include "bec/ghdj/top.ftl"/>
	<div class="help-content">
		<div class="breadcrumb">
			<!--${base}/help-->
			<strong><a href="${base}/help/marketLandscape">市场实景</a></strong>
		</div><!--breadcrumb end-->
	</div>
	<div class="help-content">
			${(articles.content)!}
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
	<#include "bec/ghdj/service.ftl"/>
	<#include "bec/ghdj/foot.ftl"/>