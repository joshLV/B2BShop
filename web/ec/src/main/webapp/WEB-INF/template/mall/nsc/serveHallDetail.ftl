<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/> - <@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="viewport" content="width=device-width"/>
    <link href="${base}/static/mall/nsc/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/mall/nsc/img/touchicon.png" rel="apple-touch-icon" />

    <link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js" type="text/javascript" ></script>
    <script src="${base}/static/mall/nsc/js/jquery.kinMaxShow-1.1.min.js"></script>
    <script src="${base}/static/mall/nsc/js/kefu.js"></script>
    <script type="text/javascript">
        $(window).load(function(e) {
            $(".u-category").hide();
            /*二级页面*/
            $(".m-category").hover(function(e){
                $(".u-category").show();
            },function(e){
                $(".u-category").hide();
            });
            $(".p_box_int").idTabs("!mouseover");
        });
    </script>
    <style type="text/css">
        .nch-breadcrumb-layout { text-align: center;}
        .nch-breadcrumb { font-size: 0; *word-spacing:-1px/*IE6銆�7*/; text-align: left; height: 20px; padding: 10px 0; margin: 0 auto;}
        .nch-breadcrumb span { font-size: 12px; line-height: 20px; color: #999; letter-spacing: normal; word-spacing: normal; display: inline-block; *display: inline/* IE6,7*/; height: 20px; zoom: 1;}
        .nch-breadcrumb i { font-size: 14px; color: #AAA; margin-right: 4px;}
        .nch-breadcrumb span.arrow { font-family: "宋体"; line-height: 20px; color: #AAA; margin: 0 6px;}
        .nch-breadcrumb a { color: #777; display: block; }
        .nch-breadcrumb a:hover { color: #2E970F;}
        .nch-article-con{width: 930px;}
        .wrapper { width: 1200px; margin: auto;}

        .nch-container { width: 1200px; margin: 0 auto;}
        .nch-container .left { width: 208px; float: left; }
        .nch-container .right { width: 980px; float: right; }
        .nch-container .left2 { width: 780px; float: left; }
        .nch-container .right2 { width: 208px; float: right; }
    </style>
</head>
<body>
<#assign path="mall/nsc">
<div class="g-doc">
<#--页眉-->
    <div class="g-hd">
    <#--加入收藏-->
		<#include "${path}/shortcut.ftl"/>
		<#--头部-->
		<#include "${path}/header.ftl"/>
    </div>
<#--页面中间-->
    <div class="g-bd">
        <div class="nch-breadcrumb-layout">
            <div class="nch-breadcrumb wrapper"><i class="icon-home"></i>
                <span><a href="${base}">首页</a></span><span class="arrow">></span>
                <span>
                <#if article??>
                    <a href="${base}/serveHall/list/${category.id}">
                </#if>
                ${category.pagetitle}
                <#if article??>
                </a>
                </#if>
                </span>
                <#if article??>
                    <span class="arrow">></span>
                    <span>${article.title}</span>
                </#if>
            </div>
        </div>
        <div class="nch-container wrapper">
            <div class="left">
                <#include "${path}/serveHallDetailLeft.ftl" />
            </div>
            <div class="right">
                <#include "${path}/serveHallDetailCenter.ftl" />
            </div>
        </div>
    </div>
    <div class="g-bd2">
    <#include "${path}/service.ftl">
    </div>
<#--页脚-->
<#include "${path}/footer.ftl">
</body>
</html>