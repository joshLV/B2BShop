<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>帮助中心 - ${(articles.title)!}</title>
<meta name="description" content="${(articles.title)!}">
<meta name="Keywords" content="${(articles.title)!}">
<link href="${base}/static/mall/gdnz/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/gdnz/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"help-question-${articles.id}"
};
</script>
</head>
<body>
<#include "mall/gdnz/shortcut.ftl"/>
<#include "mall/gdnz/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline; font-weight: normal; line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 195px;margin-right: 10px;}
.right {float: right;width: 830px;}

.widepage .right {width:960px; border: 1px solid #E8E8E8; padding: 20px; line-height: 30px;}

/*user-info*/
#user-info {overflow: hidden;background-color: #fff;padding: 10px 10px;border: 1px solid #D0D0D0;border-radius: 3px;margin-top:10px;}
#user-info a {color: #005ea7}
#user-info a:hover {color: #ea5313;}
#user-info .u-pic {position: relative;z-index: 0;float: left;width: 104px;height: 104px;margin: 5px 10px 0 0;overflow: hidden;text-align: center;}
#user-info .u-pic .face-link {display: none;position: absolute;width: 100px;text-align: center;left: 0;bottom: 4px;height: 30px;line-height: 30px;overflow: hidden;color: #fff;z-index: 3;}
#user-info .u-pic .face-link-box {display: none;background: #000;z-index: 1;position: absolute;width: 100px;text-align: center;left: 0;bottom: 4px;height: 30px;opacity: .5;filter: alpha(opacity=50);}
#user-info .u-pic .mask {background: url(${base}/static/mall/img/bg4.png) 0 0;width: 104px;height: 104px;position: absolute;left: 0;top: 0;z-index: 2;}
#user-info .info-m {float: left;width: 210px;}
#user-info .info-m .u-name {font-size: 18px;font-family: "microsoft yahei";color: #333;line-height: 28px;margin-bottom: 5px;}
#user-info .info-m .u-name a {color: #000;}
#user-info .info-m .u-name a:hover {color: #ea5313;}
#user-info .info-m .u-signature {color: #999;margin-bottom: 15px;width: 100%;text-overflow: ellipsis;word-wrap: normal;white-space: nowrap;overflow: hidden;}
#user-info .info-m .u-level {margin-bottom: 10px;height: 18px;}
#user-info .info-m .u-level .rank {margin-right: 10px;display: inline-block;height: 17px;line-height: 17px;}
#user-info .info-m .u-level .rank s {background: url(${base}/static/mall/img/rank.gif) repeat 0 0;display: inline-block;height: 17px;margin-right: 5px;text-decoration: none;width: 17px;vertical-align: middle;}
#user-info .info-m .u-level .rank a {display: inline-block;vertical-align: middle;}
#user-info .info-m .u-level .rank.r2 s {background-position: 0 -17px;}
#user-info .info-m .u-level .rank.r3 s {background-position: 0 -34px;}
#user-info .info-m .u-level .rank.r4 s {background-position: 0 -51px;}
#user-info .info-m .u-level .rank.r5 s {background-position: 0 -68px;}
#user-info .info-m .u-level .rank.r6 s {background-position: 0 -85px;}
#user-info .info-m .u-safe {}
#user-info .info-m .u-safe .safe-rank01,#user-info .info-m .u-safe .safe-rank02,#user-info .info-m .u-safe .safe-rank03,#user-info .info-m .u-safe .safe-rank04,#user-info .info-m .u-safe .safe-rank05,#user-info .info-m .u-safe .safe-rank06 {background: url(${base}/static/mall/img/safe-rank.png) no-repeat 0 0;display: inline-block;font-size: 0;height: 14px;line-height: 0;margin-right: 10px;overflow: hidden;vertical-align: middle;width: 68px;}
#user-info .info-m .u-safe .safe-rank02 {background-position: 0 -15px;}
#user-info .info-m .u-safe .safe-rank03 {background-position: 0 -30px;}
#user-info .info-m .u-safe .safe-rank04 {background-position: 0 -45px;}
#user-info .info-m .u-safe .safe-rank05 {background-position: 0 -60px;}
#user-info .info-m .u-safe .safe-rank06 {background-position: 0 -75px;}
#user-info .info-m .u-safe .rank-text {font-weight: 400;margin-right: 5px;}
#user-info .info-m .u-safe .rank-text.ftx-01 {color: #f44e41;}
#user-info .info-m .u-safe .rank-text.ftx-02 {color: #fc9836;}
#user-info .info-m .u-safe .rank-text.ftx-03 {color: #71b247;}
#user-info .acco-info {border-left: 1px dotted #ddd;float: right;margin-top: 10px;}
#user-info .acco-info li {background-color: #fafafa;border-right: 1px dotted #ddd;float: left;padding: 20px 0;height: 56px;width: 80px;text-align: center;line-height: 28px;}
#user-info .acco-info li .total {font-size: 18px;}
#user-info .acco-info li .surplus a {color: #666;}
#user-info .acco-info li .surplus a:hover {color: #ea5313;}
#user-info .acco-info li.fore1 {width: 140px;}
#user-info .acco-info li.fore1 .surplus a {color: #e43c3e;}
#user-info .acco-info li.fore1 .surplus a:hover {color: #ea5313;}
#user-info .acco-info-2 {border-left: 1px dotted #ddd;float: left;}
#user-info .acco-info-2 li {background-color: #fafafa;border-right: 1px dotted #ddd;float: left;padding-top: 20px;height: 106px;width: 125px;text-align: left;line-height: 26px;}
#user-info .acco-info-2 li.fore1 {width: 140px;}
#user-info .acco-info-2 li.merge {line-height: 26px;padding-top: 8px;height: 118px;}
#user-info .acco-info-2 li label {display: inline-block;padding-left: 10px;text-align: right;}
#user-info .acco-info-2 li a {color: #666;}
#user-info .acco-info-2 li a:hover {color: #ea5313;}
</style>
<style>
/*order-list相关*/
.mod-main {padding: 10px;background: #fff;margin-bottom: 10px;}
.mod-main .mt {display: inline-block;display: block;padding: 10px;}
.mod-main .mt h3 {float: left;font-family: "microsoft yahei";font-size: 16px;color: #333;line-height: 20px;}
.mod-main .mt .extra-l {float: left;}
.mod-main .mt .extra-r {float: right;}
.mod-main .mt .extra-l li {float: left;padding-left: 20px;}
.mod-main .mt .extra-l li.fore-last {border-right: 0;}
.mod-main .mt .extra-l li a {display: inline-block;padding-bottom: 2px;color: #999;}
.mod-main .mt .extra-l li a:hover {color: #ea5313;}
.mod-main .mt .extra-l li a:hover em {color: #ea5313}
.mod-main .mt .extra-l li a.curr {padding-bottom: 0;color: #ea5313;border-bottom: 2px solid #ea5313;font-weight: 700;cursor: default;text-decoration: none}
.mod-main .mt .extra-l li.fore-last {border-right: 0}
.mod-main .mt .extra-l em {margin-left: 5px}
.mod-main .mc {overflow: visible;}
.ftx01,.ftx-01 {color: #ea5313}
.ftx03, .ftx-03 {color: #999;}
#order-list {border: 1px solid #D0D0D0;border-radius: 3px;}
#order-list .tb-order {height: 278px;}
#order-list .tb-order {margin-bottom: -10px;}
.tb-order {border-collapse: collapse;border-spacing: 0;text-align: center;}
table {border-collapse: collapse;}
.tb-order td {padding: 5px;height: 82px;border-bottom: 1px dotted #e6e6e6;}
.tb-order .img-list {overflow: hidden;text-align: left;}
#order-list .tb-order tbody.fore3 tr td {border-bottom: 0;}
.nocont-order {height: 280px;line-height: 280px;}
.nocont-box b.icon-order {width: 70px;height: 70px;background-position: 0 0;}
.nocont-box b {display: inline-block;vertical-align: middle;background: url(${base}/static/mall/img/nocont-icons.png) no-repeat;overflow: hidden;margin-right: 20px;}
</style>
<div class="content">
	<div class="breadcrumb">
		<!--${base}/help-->
		<strong><a href="#">帮助中心</a></strong><span>&nbsp;&gt;&nbsp;<a href="${base}/help/question/${articles.id}.html" target="_self">${(articles.title)!}</a><span></span></span>
	</div><!--breadcrumb end-->
</div>
<div class="content">
	<div class="left">
		<#include "mall/gdnz/help_menu.ftl"/>
	</div><!--left end-->
	<div class="right">
		${(articles.content)!}
	</div><!--right end-->
	<span class="clr"></span>
</div>
<#include "mall/gdnz/service.ftl"/>
<#include "mall/gdnz/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
	//左侧菜单折叠操作
	$("#leftMenu dt").click(function(){
		$parent=$(this).parent();
		if($parent.hasClass("close")){
			$parent.removeClass("close");
		}else{
			$parent.addClass("close");
		}
	});
});
</script>
</body>
</html>