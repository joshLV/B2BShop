<#escape x as x?html>
<div class="g-ft">
    <div class="m-ft-textlink">
    <#list bottomnavigationList as bottomnavigation>
        <a href="${bottomnavigation.url}" target="${(bottomnavigation.isBlankTarget==1)?string("_blank","")}" >${bottomnavigation.name}</a>
        <#if bottomnavigation_has_next > | </#if>
    </#list>
	</div>
    <div class="m-ft-main">
        <div class="u-ft-co">版权所有 西安文昌农商场 地址：西安市北三环西段六村保物流园东侧 陕ICP备14004842号<br>
            招商热线：029-63608111 029-63379111  技术支持：陕西深龙信息技术有限公司</div>
        <div class="u-ft-imgs"> <a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/002.jpg" alt=""></a><a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/003.jpg" alt=""></a> <a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/004.jpg" alt=""></a> <a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/005.jpg" alt=""></a> <a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/006.jpg" alt=""></a> <a href="#" target="_blank"><img src="${base}/static/mall/nsc/img/007.jpg" alt=""></a> </div>
    </div>
</div>
</#escape>