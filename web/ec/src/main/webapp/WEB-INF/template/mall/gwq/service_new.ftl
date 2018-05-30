<#escape x as x?html>

<!-- mian  end -->
</div>

<div style="clear: both;float: none;"></div>

<div class="services">
    <div class="content">
        <ul class="f-cb">
		<#list services as service>
            <li>
                <dl>
                    <dt><a href="javascript:;">${service["category"].name}</a></dt>
					<#list service["articles"] as article>
                    <dd><a href="${base}/help/question/${article.id}.html" target="_blank" >${article.title}</a></dd>
					</#list>
                </dl>
            </li>
		</#list>
            <li class="phone">
                <dl>
                    <#--<dt><a href="#">咨询订购</a></dt>
                    <dd>400-716-2828</dd>-->
                    <dt><a href="javascript:;">客户服务</a></dt>
                    <dd>400-829-8366</dd>
                </dl>
            </li>
            <li class="last">
                <span>扫一扫关注我们</span>
                <img src="${base}/static/mall/gwq/img/weixin.jpg" width="84" height="84">
            </li>
        </ul>
    </div>
</div>
</#escape>