<#escape x as x?html>
<style>
#recommendArticle {margin-top: 10px;margin-bottom: 10px;background: #FFF;overflow: hidden;height: auto;}
#recommendArticle dl {float: left;width: 217px;border: 1px solid #e2e2e2;margin-right: 11px;padding: 8px 10px 20px 10px;height: auto; border-top: 2px solid #DB0000;}
#recommendArticle dt {position: relative;zoom: 1;border-bottom: 1px solid #e2e2e2; padding-bottom: 8px;}
#recommendArticle dt strong {font: 16px "microsoft yahei";float: left; color: #c00000;}
#recommendArticle dt .extra {float: right;}
#recommendArticle dd {padding-left: 0px;margin-left: 0px;}
#recommendArticle dd li{list-style: none;border-bottom:#c8c8c8 dashed 1px;height: 32px;line-height:32px;text-align:left;overflow: hidden;background: url(${base}/static/mall/img/point.gif) no-repeat left 12px;}
#recommendArticle dd .last{border-bottom:0px;}
#recommendArticle dl.fore4 {margin-right: 0px;float: right;}

.widepage #recommendArticle {padding-left: 0px;padding-right: 0px}
.widepage #recommendArticle dl {width: 272px;}

</style>
<div class="content">
	<div id="recommendArticle">
    <#list articleComn as service>
		<dl class="fore${service_index+1}">
			<dt>
				<strong>${service["category"].name}</strong>
				<div class="extra">
					<a href="${base}/comn/${service["category"].id}.html" target="_blank">更多&nbsp;&gt;</a>
				</div>
				<span class="clr"></span>
			</dt>
			<dd>
            <#list service["articles"] as article>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${base}/play/${article.id}.html" target="_blank" rel="nofollow">${article.title}</a></li>
                <#if article_index==4><#break></#if>
            </#list>
            </dd>
		</dl>

		</#list>

		<span class="clr"></span>
	</div>
</div>
</#escape>