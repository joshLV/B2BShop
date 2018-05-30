<#escape x as x?html>
<div class="g-aq f-cb">
	<#list services as service>
	<div class="f-fl">
    	<ul class="m-aq">
        <div class="icons"><img src="${base}/static/mall/nsc/img/004.png" alt="" width="13" height="19"></div>
    	<li class="u-aq-title">${service["category"].name}</li>
		<#list service["articles"] as article>
            <li><a href="${base}/serveHall/detail/${article.id}.html" target="_blank" rel="nofollow">${article.title}</a></li>
		</#list>
        </ul>
    </div>
	</#list>
    <div class="f-fr m-zs">
        <div><img src="${base}/static/mall/nsc/img/001.png" width="177" height="34" alt=""></div>
        <div>
            <div class="f-fl u-zs-tel"><img src="${base}/static/mall/nsc/img/tel.png" width="49" height="49" alt=""></div>
            <div class="f-fr">
                <div><img src="${base}/static/mall/nsc/img/010.png" width="111" height="24" alt=""></div>
                <div>029-63608111  029-63379111</div>
            </div>
        </div>
    </div>
</div>
</#escape>