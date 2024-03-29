<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><@spring.message "project_name"/></title>
<meta name="description" content="<@spring.message "project_name"/>">
<meta name="Keywords" content="<@spring.message "project_name"/>">
<link href="${base}/static/mall/xd/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/menumember.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/xd/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"home"
};
</script>
</head>
<body>
<#include "mall/xd/shortcut.ftl"/>
<#include "mall/xd/header.ftl"/>
<#include "mall/xd/help_center.ftl">
<#include "mall/xd/service.ftl"/>
<#include "mall/xd/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/index.js" type="text/javascript"></script>
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

</body>
</html>