<#escape x as x?html>
<style>
#recommendArticle {margin-top: 15px;margin-bottom: 10px;background: #FFF;overflow: hidden;height: auto;}
#recommendArticle dl {float: left;width: 290px;border: 1px solid #e2e2e2;margin-right: 14px;height: auto;}
#recommendArticle dt {position: relative;zoom: 1; padding: 10px; border-bottom: 1px solid #dfdfdf; background: #f5f5f5;}
#recommendArticle dt strong {font: 16px "microsoft yahei";float: left; color: #DC0E0E;}
#recommendArticle dt .extra {float: right;}
#recommendArticle dd { padding: 5px 10px;}
#recommendArticle dd li{list-style: none;height: 28px;line-height:28px;text-align:left;overflow: hidden;background: url(${base}/static/mall/img/point.gif) no-repeat left 10px;}
#recommendArticle dd .last{border-bottom:0px;}
#recommendArticle dl.fore4 {margin-right: 0px;float: right;}

.widepage #recommendArticle {padding-left: 0px;padding-right: 0px}


</style>
<div class="content">
	<div id="recommendArticle">
    <#list articleComn as service>
		<dl class="fore${service_index+1}">
			<dt>
				<strong>${service["category"].name}</strong>
				<div class="extra">
					<a href="${base}/comn/${service["category"].id}.html" target="_blank">更多&nbsp;&gt;&gt;</a>
				</div>
				<span class="clr"></span>
			</dt>
			<dd>
            <#list service["articles"] as article>
				<li>&nbsp;&nbsp;&nbsp;<a href="${base}/play/${article.id}.html" target="_blank" rel="nofollow">${article.title}</a></li>
                <#if article_index==4><#break></#if>
            </#list>
            </dd>
		</dl>
		
		</#list>
		
		<span class="clr"></span>
	</div>
</div>
</#escape>