<#escape x as x?html>
<div class="services">
    <div class="ensure">
        <ul>
            <li>
                <i class="icon-e01"><img src="${base}/static/bec/project/ghj/img/e01.png"></i>
                <h4>一站式采购</h4>
                <p>万余种商品，满足您的采购需求</p>
            </li>

            <li>
                <i class="icon-e01"><img src="${base}/static/bec/project/ghj/img/e02.png"></i>
                <h4>正品保障</h4>
                <p>全场正品，假一赔十</p>
            </li>
            <li>
                <i class="icon-e01"><img src="${base}/static/bec/project/ghj/img/e03.png"></i>
                <h4>专业配送</h4>
                <p>与时俱进，专业物流</p>
            </li>
            <li>
                <i class="icon-e01"><img src="${base}/static/bec/project/ghj/img/e04.png"></i>
                <h4>方便支付</h4>
                <p>便捷支付，多种途径</p>
            </li>
            <li>
                <i class="icon-e01"><img src="${base}/static/bec/project/ghj/img/e05.png"></i>
                <h4>贴心服务</h4>
                <p>7x24小时，优质服务</p>
            </li>
        </ul>

    </div>




    <div class="main f-cb">
    <#list services as service>
        <dl>
            <dt>${service["category"].name}</dt>
            <#list service["articles"] as article>
                <dd class="textoverflow"><a href="${base}/help/question/${article.id}.html" target="_blank" title="${article.title}">${article.title}</a></dd>
                <#if (article_index==4)><#break ></#if>
            </#list>
        </dl>
        <#if service_index == 4 ><#break ></#if>
    </#list>
        <div class="f-fl">
            <dt>食品区&nbsp;业务电话</dt>
            <dd>157 1929 1085</dd>
            <dt class="mt3">非食品区&nbsp;业务电话</dt>
            <dd>157 1929 1093</dd>
        </div>
        <div class="f-fl wx">
            <img src="${base}/static/bec/project/ghj/img/weixin1.jpg" width="84" height="84" alt="扫一扫联系客服"><br>扫一扫联系客服 </div>
    </div>
</div><#-- services end -->
</#escape>