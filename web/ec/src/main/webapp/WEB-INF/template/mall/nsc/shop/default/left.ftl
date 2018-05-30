<#escape x as x?html>

<div class="dp_box">
	<div class="dp_img"><img src="${(shopLogo)!"${base}/static/mall/img/default_shop_logo.gif"}"></div>
	<div class="dp_name">
		<p>店铺名称：<a href="#">${shop.name}</a></p>
		<p>开店时间：${(shop.createDate?string("yyyy-MM-dd"))!}</p>
		<p>联系电话：<#if shop.mobile??>
						${shop.mobile}
					 <#else>
					 	${shop.telphone!'商家没有留下联系电话'}
					 </#if>
		</p>
		<#--<#if (shop.mobile)??> ${shop.mobile}<#else ><#if (shop.telphone)??>${shop.telphone}<#else >未找到联系方式</#if></#if>-->
        <p>所在地区：${shop.areaPath}</p>
		<p>详细地址：${shop.address}</p>
	</div>
</div>
<div class="dp_ck"><a href="javascript:void(0);">查看店内所有商品</a></div>
<div class="dp_fl">
	<#list parentCatelogList as parent>
    	<ul>
            <h3><a title="${(parent.name)!}" href="javascript:void(0);">${(parent.name)!}</a></h3>
				<#list childCatelogMap["${(parent.id)!}"] as child>
					<li><a title="${(child.name)!}" href="${base}/shop/goodsShop.html?shopId=${shop.id}&&catlogId=${child.id}">${(child.name)!}</a></li>
				</#list>
		</ul>
	</#list>
</div>
</#escape>