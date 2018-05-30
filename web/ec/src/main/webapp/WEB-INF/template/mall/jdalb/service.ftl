<#escape x as x?html>
<style>
#service dl b {background-image: url(${base}/static/mall/img/shortcut_bg.png);background-repeat: no-repeat}
#service {padding: 10px 20px;margin-bottom: 20px;background: #FFF;border-top: 1px solid #DDD;border-bottom: 1px solid #F1F1F1}
#service dl {float: left;width: 196px}
#service dt {position: relative;padding: 6px 0 6px 44px;font: 14px "microsoft yahei";zoom: 1}
#service dd {min-height: 120px;padding-left: 24px;margin-left: 20px;line-height: 20px}
#service dt b {position: absolute;top: 5px;left: 0;width: 40px;height: 40px}
#service dl.fore1 b {background-position: 0 -55px}
#service dl.fore2 b {background-position: -50px -55px}
#service dl.fore3 b {background-position: 0 -102px}
#service dl.fore4 b {background-position: -50px -102px}
#service dl.fore5 b {background-position: 0 -149px}
#service dl.fore5 {width: 160px}
#service .fr {display: none}
*html #service dd {height: 120px}
#service {padding-left: 10px;padding-right: 10px}
#service dl {width: 150px}
#service .fr {display: block}
#service dl.fore1 {padding-left: 120px;}
#service dl.fore5 {width: 160px}

.widepage #service {padding-left: 20px;padding-right: 20px}
.widepage #service dl {width: 200px}

</style>
<div class="content">
	<div id="service">
		<#list services as service>
		<dl class="fore${service_index+1}">
			<dt><b></b><strong>${service["category"].name}</strong></dt>
			<dd>
				<#list service["articles"] as article>
				<div><a href="${base}/help/question/${article.id}.html" target="_blank" rel="nofollow">${article.title}</a></div>
				</#list>
			</dd>
		</dl>
		</#list>
		<span class="clr"></span>
	</div>
</div>
</#escape>