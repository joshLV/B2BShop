<#escape x as x?html>
<!--foot_nav-->
<div class="foot_navi2">
    <div class="footnav f-cb">
        <#list services as service>
            <dl>
                <dt>${service["category"].name}</dt>
                <#list service["articles"] as article>
                    <dd><a href="${base}/help/question/${article.id}.html" target="_blank" rel="nofollow">${article.title}</a></dd>
                </#list>
            </dl>
        </#list>
        <#--<dl class="f_ewm">
            <dd class="f_weixin"><br></dd>
            <dd><a href="#" target="_blank">港务区官方微信</a></dd>
        </dl>-->
    </div>
</div>
</#escape>