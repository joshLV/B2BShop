<#escape x as x?html>
<#if enableHeadAd=="true">
<style>
#shopHeader{height:200px;}
#shopHeader img{width:100%;height:200px;}
</style>
<div id="shopHeader" class="content m">
    <a href="${(headAd.url)!"${base}/shop/${shop.urlAddress}"}" target="_blank">
        <img id="shopHeaderImg" src="${(headAd.pic)!"${base}/static/mall/img/shop-top-01.jpg"}" alt=""/>
    </a>
</div>
</#if>
</#escape>