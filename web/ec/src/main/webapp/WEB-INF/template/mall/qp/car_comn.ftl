<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><@spring.message "project_name"/> - <@spring.message "project_description"/></title>
<meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
<meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
<link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/css/index.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"carcomn"
};
</script>
</head>
<body>
<#include "mall/qp/shortcut.ftl"/>
<#include "mall/qp/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
.breadcrumb span {font-family: "\5b8b\4f53"}
</style>
<div class="content">
	<div class="breadcrumb">
		<h1><a href="${base}/index">首页</a></h1>
		<span>&nbsp;&gt;&nbsp;<a href="${base}/comn/${articlesCategory.id}.html">${articlesCategory.name}</a></span>
	</div><!--breadcrumb end -->
	<div class="clr"></div>
</div>

<style>
#carcomn .fl{width: 228px;border: 1px solid #EBEBEB;margin-bottom: 10px;margin-right: 10px;}
#carcomn .fr{width: 748px;border: 1px solid #EBEBEB;margin-bottom: 10px;}
div.hotArticleCategory .title {height: 30px;line-height: 30px;padding-left: 10px;
color: #d31c31;font-size: 14px;font-weight: bold;font-family: "Microsoft YaHei";background-color: #f1f1f1;}
div.hotArticleCategory dl {width: 216px;line-height: 30px;float: left;_float: none;margin: 0px 6px;border-bottom: solid 1px #f1f1f1;}
.hotArticleCategory .last{border-bottom: 0px;}
div.hotArticleCategory dt a {font-family: "Microsoft YaHei";color: #2c64b1;font-size: 14px;}

#carcomn .result {padding: 10px;}
#carcomn .result li {border-bottom: 1px solid #f1f1f1;}
#carcomn .result a {line-height: 40px;color: #204e7d;font-size: 14px;font-weight: bold;}
#carcomn .result li span { float:right; width:100px; color:#787878; font-size:12px; text-align:center; overflow:hidden;}
#carcomn .result p {line-height: 30px;color: #787878;}

.pagin {width: 746px;}
.pagin {float: right;height: 30px;padding: 2px 0;border-left: 1px solid #fff;}
.pagin-m .prev, .pagin-m .next, .pagin-m .prev-disabled, .pagin-m .next-disabled {border-radius: 3px;background: #fff;padding-top: 3px;height: 14px;line-height: 14px;}
.pagin .prev, .pagin .prev-disabled {padding-left: 12px;}
.pagin .prev-disabled, .pagin .next-disabled {color: #ccc;cursor: default;}
.pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {position: relative;padding-top: 5px;height: 18px;line-height: 18px;}
.pagin-m a, .pagin-m span {height: 14px;line-height: 14px;font-size: 12px;}
.pagin a, .pagin span {float: right;height: 20px;padding: 3px 10px;border: 1px solid #ccc;margin-left: 2px;font-family: arial;line-height: 20px;font-size: 14px;overflow: hidden;-moz-border-radius: 5px;-webkit-border-radius: 5px;}
.pagin .noRecord{text-align:center;}

.widepage #carcomn .fr{width: 948px;}
.widepage .pagin {width: 946px;}
</style>
<div class="content">
	<div id="carcomn">
		<div class="fl">
			<div class="hotArticleCategory">
				<div class="title">热门分类</div>
				<#list parentList as hotCategory>
				<dl <#if hotCategory_index+1==parentList?size>class="last"</#if>>
					<dt>
						<a href="${base}/comn/${hotCategory.id}.html">${hotCategory.name}</a>
					</dt>
				</dl>
				</#list>
			</div>	
		</div><!--fl end-->
		<div class="fr">
			<div class="result">
				<ul>
					<#list pager.list as article>
					<li>
						<a href="${base}/play/${article.id}.html" title="${article.title}">${article.title}</a>
                        <span title="${article.createDate?string("yyyy-MM-dd HH:mm:ss")}">${article.createDate?string("yyyy-MM-dd")}</span>
		<#--				<#if (article.content?length < 200)>
	    					<p>${article.content}</p>
	    				<#else>
	    					<p>${article.content[0..196]}...</p>
	    				</#if>	-->
					</li>
					</#list>
				</ul>
			</div>
		    <div class="pagin">
	 			<#if (pager.list?size > 0)>
	 				<#import "mall/qp/pager.ftl" as p>
	 				<@p.pager pager = pager baseUrl = "/comn/${id}" />
	 			<#else>
				<div class="noRecord">
					尚未发布任何信息!
				</div>
				</#if>
			</div>
		</div><!--fr end-->
		<span class="clr"></span>
	</div>
</div>

<#include "mall/qp/service.ftl"/>
<#include "mall/qp/footer.ftl"/>

<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
/*宽屏设置*/
pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
$(function(){
		
});
</script>
</body>
</html>