<#escape x as x?html>
<#if enableHeadAd=="true">
<style>
#shopHeader{height:200px;}
#shopHeader img{width:100%;height:200px;}
</style>
<div id="shopHeader" class="content m">
    <a href="${(headAd.url)!}" target="_blank">
        <img src="${(headAd.pic)!}" alt=""/>
    </a>
</div>
</#if>
</#escape>