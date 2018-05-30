<#escape x as x?html>
	<#include "mall/gwq/top.ftl"/>
	<#include "mall/gwq/header_new.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"noticelist"
};
</script>
<style>
.breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
.breadcrumb span {font-family: "\5b8b\4f53"}
</style>
<div class="content">
	<div class="breadcrumb">
		<h1><a href="${base}/index">首页</a></h1>
		<span>&nbsp;&gt;&nbsp;<a href="${base}/notice/list">商城快报</a></span>
	</div><!--breadcrumb end -->
	<div class="clr"></div>
</div>

<style>
#noticelist .fl{width: 228px;border: 1px solid #EBEBEB;margin-bottom: 10px;margin-right: 10px;}
#noticelist .fr{width: 748px;border: 1px solid #EBEBEB;margin-bottom: 10px;}
div.hotArticleCategory .title {height: 30px;line-height: 30px;padding-left: 10px;
color: #d31c31;font-size: 14px;font-weight: bold;font-family: "Microsoft YaHei";background-color: #f1f1f1;}
div.hotArticleCategory dl {width: 216px;line-height: 30px;float: left;_float: none;margin: 0px 6px;border-bottom: solid 1px #f1f1f1;}
.hotArticleCategory .last{border-bottom: 0px;}
div.hotArticleCategory dt a {font-family: "Microsoft YaHei";color: #2c64b1;font-size: 14px;}

#noticelist .result {padding: 10px;}
#noticelist .result li {border-bottom: 1px solid #f1f1f1;}
#noticelist .result a {line-height: 40px;color: #204e7d;font-size: 14px;font-weight: bold;}
#noticelist .result li span { float:right; width:100px; color:#787878; font-size:12px; text-align:center; overflow:hidden;}
#noticelist .result p {line-height: 30px;color: #787878;}

.pagin {width: 746px;}
.pagin {float: right;height: 30px;padding: 2px 0;border-left: 1px solid #fff;}
.pagin-m .prev, .pagin-m .next, .pagin-m .prev-disabled, .pagin-m .next-disabled {border-radius: 3px;background: #fff;padding-top: 3px;height: 14px;line-height: 14px;}
.pagin .prev, .pagin .prev-disabled {padding-left: 12px;}
.pagin .prev-disabled, .pagin .next-disabled {color: #ccc;cursor: default;}
.pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {position: relative;padding-top: 5px;height: 18px;line-height: 18px;}
.pagin-m a, .pagin-m span {height: 14px;line-height: 14px;font-size: 12px;}
.pagin a, .pagin span {float: right;height: 20px;padding: 3px 10px;border: 1px solid #ccc;margin-left: 2px;font-family: arial;line-height: 20px;font-size: 14px;overflow: hidden;-moz-border-radius: 5px;-webkit-border-radius: 5px;}
.pagin .noRecord{text-align:center;}

.widepage #noticelist .fr{width: 948px;}
.widepage .pagin {width: 946px;}
</style>
<div class="content">
	<div id="noticelist">
		<div class="fl">
			<div class="hotArticleCategory">
				<div class="title">热点分类</div>
				<#list hotArticleCategoryList as hotCategory>
				<dl <#if hotCategory_index+1==hotArticleCategoryList?size>class="last"</#if>>
					<dt>
						<#if "notice"==hotCategory.sign>
						<a href="${base}/notice/list">${hotCategory.name}</a>
						<#else>
						<a href="${base}/comn/${hotCategory.id}.html">${hotCategory.name}</a>
						</#if>
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
                    <#--	<#if (article.content?length < 200)>
                            <p>${article.content}</p>
                        <#else>
                            <p>${article.content[0..196]}...</p>
                        </#if>-->
                    </li>
                    </#list>
                </ul>
            </div>
            <div class="pagin">
                 <#if (pager.list?size > 0)>
                     <#import "mall/gwq/pager.ftl" as p>
                     <@p.pager pager = pager baseUrl = "/notice/list" />
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

<script type="text/javascript">
/*宽屏设置*/
pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
$(function(){
		
});
</script>
	<#include "mall/gwq/service_new.ftl"/>
	<#include "mall/gwq/footer_new.ftl"/>
</#escape>