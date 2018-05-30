<#escape x as x?html>
	<#include "mall/gwq/top.ftl"/>
	<#include "mall/gwq/header_new.ftl"/>
<link href="${base}/static/mall/css/menumember.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"home"
};
</script>
	<#include "mall/gwq/help_center.ftl">

<script type="text/javascript">
$().ready( function(){
	$(".sidebar").click(function (){
		$sondiv = $("#"+$(this).attr("sonid"));
		$b_icon = $("#b_"+$(this).attr("sonid"));
		if($sondiv.is(":hidden")){
			$sondiv.show();
			$(this).removeClass("current");
			$b_icon.removeClass("icon_hidden").addClass("icon_show");
		}else{
			$sondiv.hide();
			$(this).addClass("current");
			$("#b_"+$(this).attr("sonid")).removeClass("icon_show").addClass("icon_hidden");
		}
	});
});
</script>
	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>
</#escape>