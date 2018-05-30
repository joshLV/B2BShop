<#escape x as x?html>
    <#include "bec/gwq/header.ftl"/>
<div id="container">
    <#include "bec/gwq/top.ftl"/>
    <div class="links-content">
        <h3 class="link_tit">友情链接</h3>
        <ul  class="link_list">
            <#list friendlyLinkList as friend>
                <li><a href="${friend.url}" target="_blank">${friend.name}</a></li>
            </#list>
        </ul>
    </div>
</div>
    <#include "bec/gwq/foot.ftl"/>
</#escape>