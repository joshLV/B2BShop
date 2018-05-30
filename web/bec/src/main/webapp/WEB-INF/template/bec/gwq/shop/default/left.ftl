<#escape x as x?html>
<style>
.shopInfo{border:1px solid #ddd;}
.shopInfo .mt{width:100%;padding-top:15px;text-align:center;}
.shopInfo .mt h2{margin-bottom:15px;}
.shopInfo .mc{padding:10px 10px 0px 10px;}
.shopInfo .mc ul {width:190px;}
.shopInfo .mc ul li{overflow: hidden;padding: 6px 0 0 6px;}
.shopInfo .mc .address{height:36px;overflow:hidden;margin-bottom:6px;}

.catelog{border:1px solid #ddd;}
.catelog a, .catelog a:hover, .catelog a:visited, .catelog a:link{outline: 0;text-decoration: none;}
.catelog .mc .oneLevel {font-size: 14px;height: 30px;line-height: 30px;overflow: hidden;background: #f7f7f7;}
.catelog .mc .oneLevel a {display: block;text-align: center;}
.catelog .mc .oneLevelarea {border-top: solid 1px #ddd;}
.catelog .mc .twoLevel, .catelog .mc .noChild {font-size: 14px;height:40px;line-height: 40px;overflow: hidden;clear: both;border-bottom: solid 1px #ddd;background: #f7f7f7;cursor: default;}
.catelog .mc .iconArrow {width: 16px;height: 16px;cursor: pointer;float: left;margin: 7px 0 0 20px;}
/*.catelog .mc .iconArrow {background: url(${base}/static/mall/img/icon-2.gif) no-repeat;}*/
.catelog .mc .twoLevel a, .catelog .mc .noChild a {display: block;margin-left: 46px;}
.catelog .mc .twoLevel a:hover{color: #db0000;}
.catelog .mc .threeLevel {background: #ffffff;overflow: hidden;_height: 100%;}
.catelog .mc .threeLevel li {height: 34px;line-height: 34px;overflow: hidden;}
.catelog .mc .threeLevel li:hover{border-left: 4px solid #db0000;}
.catelog .mc .threeLevel a {display: block;padding: 0 10px 0 46px;}
.catelog .mc .threeLevel a:hover{background: #f7f7f7; color: #db0000;}
</style>
<div class="shopInfo">
	<div class="mt">
		<h2>${(shop.shortName)!}</h2>
		<div class="photo">
			<img src="${(shopLogo)!"${base}/static/mall/img/default_shop_logo.gif"}" width="160" height="160">
		</div>
	</div>
	<div class="mc">
		<ul>
		    <li><label>店铺名称: </label><span>${(shop.shortName)!}</span></li>
		    <li><label>开店时间: </label><span>${(shop.createDate?string("yyyy-MM-dd"))!}</span></li>
		    <li><label>联系电话: </label><span>${(shop.telphone)!}</span></li>
			<li><label>所在地区: </label><span>${(shop.areaPath)!}</span></li>
			<li class="address"><label>详细地址: </label><span>${(shop.address)!}</span></li>
			<#if shop.qqKeFu??>
                <li style="border-top: 1px dashed #dfdfdf; padding:8px 0;">
					<#list shop.qqKeFuList as qq>
						<#if qq_index % 2 == 0>
                            <div style="height: 20px;padding: 4px 0;float: left;width: 80px;padding-left: 10px;">

                                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${qq}&site=qq&menu=yes" >
                                    <img src="http://wpa.qq.com/pa?p=2:${qq}:4" alt="客服QQ" align="客服${qq_index + 1}" />客服${qq_index + 1}
                                </a>
                            </div>
						<#else>
                            <div style="height: 20px;padding: 4px 0;float: right;width: 80px;">
                                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${qq}&site=qq&menu=yes" >
                                    <img src="http://wpa.qq.com/pa?p=2:${qq}:4" alt="客服QQ" align="客服${qq_index + 1}" />客服${qq_index + 1}
                                </a>
                            </div>
						</#if>
					</#list>
                </li>
			</#if>
		</ul>
	</div>
</div>


<div class="catelog">
	<div class="mc">
		<div class="oneLevel" style="text-align: center;">
            <a title="查看店内所有商品" href="${base}/shop/goodsShop.html?shopId=${shop.id}&catlogId=${child.id}">查看店内所有商品</a>
		</div>
		
		<#list parentCatelogList as parent>
		<div class="oneLevelarea">
			<div class="twoLevel" data-num="0">
				<span class="iconArrow"></span>
				<a title="${(parent.name)!}" href="javascript:void(0);">${(parent.name)!}</a>
			</div>
			<div class="threeLevel">
				<ul>
					<#list childCatelogMap["${(parent.id)!}"] as child>
					<li><a title="${(child.name)!}" href="${base}/shop/goodsShop.html?shopId=${shop.id}&&catlogId=${child.id}">${(child.name)!}</a></li>
					</#list>
				</ul>
			</div>
		</div>
		</#list>
					
	</div>
</div>
</#escape>