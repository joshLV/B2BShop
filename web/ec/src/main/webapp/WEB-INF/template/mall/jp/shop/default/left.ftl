<#escape x as x?html>
<style>
.shopInfo{border:1px solid #ddd;}
.shopInfo .mt{width:100%;text-align:center;}
.shopInfo .mt h2{ line-height: 43px; height:45px; font-size: 15px; color: #444; margin-bottom:15px;background:url("${base}/static/mall/jp/img/dp_bg.gif") left top repeat-x; overflow: hidden;}
.shopInfo .mc{padding:10px 10px 0px 10px;}
.shopInfo .mc ul {width:190px;}
.shopInfo .mc ul li{overflow: hidden;padding: 6px 0 0 6px;word-wrap: break-word; word-break: break-all;}
.shopInfo .mc .address{overflow:hidden;margin-bottom:10px;line-height: 1.7;}
.dp_info li span{ color: #333; }
.dp_info li span.red{ color: #E4393C;}
.dp_info li label{ font-size: 14px; color: #777;/*white-space: pre;*/}
	.photo img{ width: 159px; height: 159px; border:1px solid #E2E2E2;box-shadow: 0 0 5px #dfdfdf;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
	}
#code img{ width: 180px;height: 180px; }
</style>
<div class="shopInfo m">
	<div class="mt">
		<h2>${(shop.shortName)!}</h2>
		<div class="photo">
			<img src="${(shopLogo)!"${base}/static/mall/img/default_shop_logo.gif"}" width="160" height="160">
		</div>
	</div>
	<div class="mc">
		<ul class="dp_info">
		    <li><label>店铺名称：</label><span class="red">${(shop.shortName)!}</span></li>
		    <#--<li><label>开店时间：</label><span>${(shop.createDate?string("yyyy-MM-dd"))!}</span></li>-->
			<#if shop.website?? && shop.website != null>
				<li><label>官方网站：</label><span><a href="${shop.website}" target="_blank">${(shop.website)!}</a></span></li></#if>
		    <li><label>联系电话：</label><span>${(shop.telphone)!}</span></li>
			<li><label>所在地区：</label><span>${(shop.areaPath)!}</span></li>
			<li class="address"><label>详细地址：</label><span>${(shop.address)!}</span></li>
			<#if shop.weixinImg??>
                <li id="code">
                    <img src="${shop.weixinImg}" alt="微信二维码" align="微信二维码" />
				</li>
			</#if>
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
<style>
    .catelog{border:1px solid #ddd; margin-top: 10px;}
    .catelog a, .catelog a:hover, .catelog a:visited, .catelog a:link{outline: 0;text-decoration: none;}
    .catelog .mc .oneLevel {font-size: 14px;height: 40px;line-height: 40px;overflow: hidden;background: #f7f7f7; color: #444;}
    .catelog .mc .oneLevel a {display: block;text-align: center;}
    .catelog .mc .oneLevelarea {border-top: solid 1px #ddd;}
    .catelog .mc .twoLevel, .catelog .mc .noChild {font-size: 14px;height:40px;line-height: 40px;overflow: hidden;clear: both;background: #f7f7f7;cursor: default;}
    .catelog .mc .twoLevel a{background:url(${base}/static/mall/jp/img/arr_1.png) 0px -17px no-repeat;padding: 0 10px 0 15px; margin-left: 31px;}
    .catelog .mc .current a{background:url(${base}/static/mall/jp/img/arr_1.png) 0px 8px no-repeat;}
    .catelog .mc .noChild a {display: block;margin-left: 46px;}
    .catelog .mc .threeLevel {background: #ffffff;overflow: hidden;_height: 100%;}
    .catelog .mc .threeLevel li {height:35px;line-height: 35px;overflow: hidden;}
    .catelog .mc .threeLevel li a{background:url(${base}/static/mall/jp/img/dian.png) left -25px no-repeat;padding: 0 10px 0 12px; margin-left: 34px;}
    .catelog .mc .threeLevel li a.a-selected,.catelog .mc .threeLevel li a:hover{color: #db0000; font-weight: bold;background:url(${base}/static/mall/jp/img/dian.png) left 6px no-repeat;}
.mtitle {
    border: 1px solid #dfdfdf;
    border-bottom: none;
    border-top: 2px solid #E4393C;
	height: 35px;
    line-height: 35px;
    background: url(${base}/static/mall/jp/img/left_tit.png) no-repeat !important;
}
.mtitle h2 {
    padding: 0 8px; font-size: 15px; color: #333;
}
.shophptlist{ border: 1px solid #dfdfdf;border-top: 0; padding-bottom: 10px;}
.shophptlist ul{ width: 192px; padding: 0 8px;}
.shophptlist ul li{ padding-top: 10px;}
.shophptlist ul li img{ margin-bottom: 5px;}
.shophptlist ul li .title{ height: 20px; line-height: 20px; overflow: hidden;  padding: 0 3px;}
.shophptlist ul li .title a:hover{ color: #E4393C; text-decoration: none;}
.shophptlist ul li .price{ color: #E4393C; font-size: 14px; font-weight:bold; padding: 0 3px;}
.shophptlist ul li .price .rmb{ font-size: 16px; margin-right: -3px;}
</style>
<div class="catelog m">
	<div class="mc">
		<div class="oneLevel" style="text-align: center;">
            <a title="查看店内所有商品" href="${base}/shop/goodsShop.html?shopId=${shop.id}&pageSize=20&catlogId=${child.id}">查看店内所有商品</a>
		</div>
		
		<#list parentCatelogList as parent>
		<div class="oneLevelarea menu_list firstpane" id="firstpane_${parent_index}">
			<div class="twoLevel menu_head" data-num="0"  firstLevelId="firstpane_${parent_index}">
				<a title="${(parent.name)!}" href="javascript:void(0);">${(parent.name)!}</a>
			</div>
			<div class="threeLevel menu_body" style="display:none;">
				<ul>
					<#list childCatelogMap["${(parent.id)!}"] as child>
					<li><a title="${(child.name)!}" href="${base}/shop/goodsShop.html?shopId=${shop.id}&&catlogId=${child.id}" firstLevelId="firstpane_${parent_index}" <#if child.id == catlogId>class="a-selected"</#if>>${(child.name)!}</a></li>
					</#list>
				</ul>
			</div>
		</div>
		</#list>

					
	</div>
</div>
    <div class="mtitle">
        <h2>店铺热销</h2>
    </div>
<div class="shophptlist">
    <ul>
		<#list shophotGoodsList as goods>
            <li>
                <div class="item">
                    <div class="pic">
                        <a target="_blank" href="${base}/item/${goods.id}.html" title="${(goods.fullName)!}">
                            <img src="${(goods.pic)!}@190w_150h.png" class="" alt="${(goods.fullName)!}" style=" border: 1px solid #eaeaea;">
                        </a>
                    </div><!--pic end-->
                    <div class="title">
                        <a target="_blank" href="${base}/item/${goods.id}.html">${(goods.fullName)!}</a>
                    </div><!--title end-->
                    <div class="goodsInfo">
						<span class="price">
							<em class="rmb">￥</em>
							<span class="num">
								<#if !goods.price?? || goods.price == '0' || goods.price == '0.00'>
                                    价格面议
								<#else>
								${goods.price?string(priceFormat)}
								</#if>
							</span>
						</span>
                    </div>
                </div><!--item end-->
            </li>

		</#list>
    </ul>
</div>

<script type=text/javascript>
    $(document).ready(function(){
        var $currentOpen = $(".firstpane div.menu_head:eq(0)");
        if($(".a-selected").length > 0){
            $("#" + $(".a-selected").attr('firstLevelId') + " .menu_body:eq(0)").show();
            $currentOpen = $("#" + $(".a-selected").attr('firstLevelId') + " .menu_head");
        }else{
            $(".firstpane div.menu_body:eq(0)").show();
        }
        $currentOpen.addClass("current");
        $(".firstpane div.menu_head").click(function(){
            if( $(this).hasClass('current') == false){
                //删除原来的所有选中样式
                $('.current').removeClass("current");

                $(".menu_list .menu_body").slideUp("slow");
                $(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
                $(this).siblings().removeClass("current");
            }
        });
    });
</script>
</#escape>