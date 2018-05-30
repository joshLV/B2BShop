<#escape x as x?html>

<style>
    .buynow {background: #b20000;}
</style>
<div class="dp_tj">
	<div class="dp_tj_top"><h3>掌柜推荐</h3><a href="#">更多></a></div>
	<div class="dp_tj_con">
		<ul>
			<#list recommendGoodsList as goods>
			<li>
				<div class="dp_t_img">
					<a target="_blank" href="${base}/item/${goods.id}.html" title="${(goods.fullName)!}">
						<img src="${(goods.pic)!}" alt="${(goods.fullName)!}">
					</a>
				</div><!--pic end-->
				<div class="dp_t_name">
					<a target="_blank" href="${base}/item/${goods.id}.html">${(goods.fullName)!}</a>
				</div><!--title end-->
				<div class="dp_t_money">
					￥${goods.price?string(priceFormat)}
					<#--<a class="buynow" target="_blank" href="${base}/item/${goods.id}.html" title="${(goods.fullName)!}">立即购买</a>-->
				</div><!--goodsInfo end-->
			</li>
			</#list>
		</ul>
	</div>
    <!--是否为空-->
    <div class="m clearfix">
        <div class="pagin fr">
			<#if (pager.list?size <= 0)>
                <div class="noRecord">
                    掌柜尚未发布任何商品信息!
                </div>
			</#if>
        </div>
    </div>
</div>
<div class="dp_tj m_top">
    <div class="dp_tj_top"><h3>商品列表</h3><a href="#">更多></a></div>
    <div class="dp_tj_con">
    	<ul>
    		<#list pager.list as goods>
    		<li>
				<div class="dp_t_img">
					<a target="_blank" href="${base}/item/${goods.id}.html" title="${(goods.fullName)!}">
						<img src="${(goods.pic)!}"  alt="${(goods.fullName)!}">
					</a>
				</div><!--pic end-->
				<div class="dp_t_name">
					<a target="_blank" href="${base}/item/${goods.id}.html">${(goods.fullName)!}</a>
				</div><!--title end-->
				<div class="dp_t_money">
					￥${goods.price?string(priceFormat)}
				</div><!--goodsInfo end-->
			</li>
			<#if goods_index==3><#break></#if>
			</#list>
        </ul>
    </div>
    <!--是否为空-->
    <div class="m clearfix">
        <div class="pagin fr">
			<#if (pager.list?size <= 0)>
                <div class="noRecord">
                    掌柜尚未发布任何商品信息!
                </div>
			</#if>
        </div>
    </div>
</div>
</#escape>