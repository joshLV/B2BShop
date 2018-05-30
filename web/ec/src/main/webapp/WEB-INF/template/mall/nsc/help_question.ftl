<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>帮助中心 - ${(articles.title)!}</title>
<meta name="description" content="${(articles.title)!}">
<meta name="Keywords" content="${(articles.title)!}">
<link href="${base}/static/mall/nsc/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/mall/nsc/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/nsc/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/nsc/css/reset.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/mall/nsc/css/function.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js" type="text/javascript"></script>
<script src="${base}/static/mall/nsc/js/jquery.kinMaxShow-1.1.min.js" type="text/javascript"></script>
<script src="${base}/static/mall/nsc/js/jquery.kinMaxShow-1.1.min.js" type="text/javascript"></script>
<script src="${base}/static/mall/nsc/js/Jlazyload.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/Jdropdown.js" type="text/javascript"></script>
<script type="text/javascript">
$(window).load(function(e) {
    $(".u-category").css("display", "none");
    /*二级页面*/
    $(".m-category").hover(function (e) {
        $(".u-category").show();
    }, function (e) {
        $(".u-category").hide();
    });

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
    <style>
        .breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
        .breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

        .left {float: left;width: 150px;margin-right: 10px;}
        .right {float: right;width: 830px;}

        .widepage .right {width: 980px;}
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
        .mod-main .mt .extra-l li a:hover {color: #e4393c;}
        .mod-main .mt .extra-l li a:hover em {color: #e4393c}
        .mod-main .mt .extra-l li a.curr {padding-bottom: 0;color: #e4393c;border-bottom: 2px solid #e4393c;font-weight: 700;cursor: default;text-decoration: none}
        .mod-main .mt .extra-l li.fore-last {border-right: 0}
        .mod-main .mt .extra-l em {margin-left: 5px}
        .mod-main .mc {overflow: visible;}
        .ftx01,.ftx-01 {color: #e4393c}
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
</head>
<body>
<#assign path="mall/nsc"/>
<div class="g-doc">
    <div class="g-hd">
		<#include "${path}/shortcut.ftl"/>
		<#include "${path}/header.ftl"/>
    </div>
    <div class="g-bd">
        <div class="breadcrumb">
            <!--${base}/help-->
            <strong><a href="#">${helpName}</a></strong><span>&nbsp;&gt;&nbsp;<a href="${base}/help/question/${articles.id}.html" target="_self">${(articles.title)!}</a><span></span></span>
        </div><!--breadcrumb end-->
        <div class="left">
		<#include "${path}/help_menu.ftl"/>
        </div><!--left end-->
        <div class="right">
		${(articles.content)!}
        </div><!--right end-->
        <span class="clr"></span>
    </div>
	<#include "${path}/service.ftl"/>
	<#include "${path}/footer.ftl"/>
</div>


</body>
</html>