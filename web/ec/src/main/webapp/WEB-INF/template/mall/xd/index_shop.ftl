<#escape x as x?html>
<style>
/*brandlist*/
.brandlist{width:1190px !important; background: #fff3f3; padding:5px 10px 0 10px; margin-top: 10px; margin-bottom: 10px; overflow: hidden;}
.brandlist .mt{position:relative;height:40px;}
.brandlist .mt h2{width:1180px;height:40px;line-height:40px;font-size:20px;font-weight:normal; color: #DB0000; text-align: center; float: left; padding-left: 10px;}
.brandlist .mt h2 a{float: right; font-size: 14px; color: #5b5b5b; margin-right: 25px;font-weight: normal;}
.brandlist .mc{/*height:230px;*/padding: 15px 0 5px 15px; margin-bottom: 10px; background: #ffffff;}
.brandlist .mc ul{position:relative;overflow:hidden;/*height:230px;*/}
.brandlist .mc li{float:left;overflow:hidden;width:188px;height:110px;margin:0 5px 5px 0;}
.brandlist .mc li img{width:118px;height:58px;}

.widepage .brandlist{width:1210px;}
.widepage .brandlist .mc li{width:118px;height:58px;margin:0 10px 11px 0; border: 1px solid #dfdfdf;}
.widepage .brandlist .mc li img{width:118px;height:58px;}
</style>
<div class="content">
    <div class="brandlist">
        <div class="mt">
            <h2>世界名品<a href="${base}/brandFlagshipStore.html" target="_blank">更多&gt;</a></h2>
        </div>
        <div class="mc" style="display: block;">
			<ul>
				<#list indexShopList as indexShop>
				<li class="fore${brand_index}">
                    <a href="${base}/shop/${indexShop.urlAddress}.html" title="${indexShop.name}" target="_blank"><img src="${indexShop.pic}" alt="${indexShop.name}@225w_100h.png"></a>
                </li>
                <#if indexShop_index==26><#break></#if>
				</#list>
			</ul>
        </div>
    </div><!--brandlist end-->
    <div class="clr"></div>
</div>
</#escape>
