<#escape x as x?html>
<style>
/*brandlist*/
.brandlist{width:990px;}
.brandlist .mt{position:relative;height:32px;}
.brandlist .mt h2{width:150px;height:32px;line-height:32px;font-size:16px;font-weight:normal;}
.brandlist .mc{height:230px;padding:10px;border-style:solid;border-color:#AAA #DEDEDE #DEDEDE;border-width:2px 1px 1px;}
.brandlist .mc ul{position:relative;overflow:hidden;height:230px;}
.brandlist .mc li{float:left;overflow:hidden;width:188px;height:110px;margin:0 5px 5px 0;}
.brandlist .mc li img{width:188px;height:110px;}

.widepage .brandlist{width:1210px;}
.widepage .brandlist .mc li{width:225px;margin:0 10px 10px 0;}
.widepage .brandlist .mc li img{width:225px;height:110px;}
</style>
<div class="content">
    <div class="brandlist">
        <div class="mt">
			<h2>品牌旗舰店</h2>
        </div>
        <div class="mc" style="display: block;">
			<ul>
				<#list indexShopList as indexShop>
				<li class="fore${brand_index}">
                    <a href="${base}/shop/${indexShop.urlAddress}.html" title="${indexShop.name}" target="_blank"><img src="${indexShop.pic}" alt="${indexShop.name}"></a>
                </li>
                <#if indexShop_index==9><#break></#if>
				</#list>
			</ul>
        </div>
    </div><!--brandlist end-->
    <div class="clr"></div>
</div>
</#escape>
