<#escape x as x?html>
<style>
    .shopInfo{border:1px solid #ddd;}
    .shopInfo .mt{width:100%;text-align:center;}
    .shopInfo .mt h2{ line-height: 43px; height:45px; font-size: 15px; color: #444; margin-bottom:15px;background:url("${base}/static/bec/project/gdnz/images/dp_bg.gif") left top repeat-x; overflow: hidden;}
    .shopInfo .mc{padding:10px 10px 0px 10px;}
    .shopInfo .mc ul {width:190px;}
    .shopInfo .mc ul li{overflow: hidden;padding: 6px 0 0 6px;}
    .shopInfo .mc .address{overflow:hidden;margin-bottom:10px;line-height: 1.7;}
    .dp_info li{ line-height: 1.6;}
    .dp_info li span{ color: #333; }
    .dp_info li span.red{ color: #E4393C;}
    .dp_info li label{ font-size: 14px; color: #777;}
    .photo img{ width: 159px; height: 159px; border:1px solid #E2E2E2;box-shadow: 0 0 5px #dfdfdf;
        -webkit-border-radius: 50%;
        -moz-border-radius: 50%;
        border-radius: 50%;
    }
    .catelog{border:1px solid #ddd; margin-top: 10px;}
    .catelog a, .catelog a:hover, .catelog a:visited, .catelog a:link{outline: 0;text-decoration: none;}
    .catelog .mc .oneLevel {font-size: 14px;height: 40px;line-height: 40px;overflow: hidden;background: #f7f7f7; color: #444;}
    .catelog .mc .oneLevel a {display: block;text-align: center;}
    .catelog .mc .oneLevelarea {border-top: solid 1px #ddd;}
    .catelog .mc .twoLevel, .catelog .mc .noChild {font-size: 14px;height:40px;line-height: 40px;overflow: hidden;clear: both;background: #f7f7f7;cursor: default;}
    .catelog .mc .iconArrow {width: 16px;height: 16px;cursor: pointer;float: left;margin: 7px 0 0 20px;}
    /*.catelog .mc .iconArrow {background: url(${base}/static/mall/img/icon-2.gif) no-repeat;}*/
    .catelog .mc .twoLevel a, .catelog .mc .noChild a {display: block;margin-left: 46px;}
    .catelog .mc .twoLevel a:hover{color: #db0000;}
    .catelog .mc .threeLevel {background: #ffffff;overflow: hidden;_height: 100%;}
    .catelog .mc .threeLevel li {height:40px;line-height: 40px;overflow: hidden;}
    .catelog .mc .threeLevel li:hover{border-left: 4px solid #db0000;}
    .catelog .mc .threeLevel a {display: block;padding: 0 10px 0 46px;}
    .catelog .mc .threeLevel a:hover{background: #f7f7f7; color: #db0000;}
    #code img{ width: 180px;height: 180px; }
</style>
<div class="shopInfo">
	<div class="mt">
		<h2>${(shop.shortName)!}</h2>
		<div class="photo">
			<img src="${(shopLogo)!"${base}/static/mall/img/default_shop_logo.gif"}" width="160" height="160">
		</div>
	</div>
	<div class="mc">
		<ul class="dp_info">
		    <li><label>店铺名称：</label><span>${(shop.shortName)!}</span></li>
		    <li><label>开店时间：</label><span>${(shop.createDate?string("yyyy-MM-dd"))!}</span></li>
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
    .catelog{border:1px solid #ddd;}
    .catelog a, .catelog a:hover, .catelog a:visited, .catelog a:link{outline: 0;text-decoration: none;}
    .catelog .mc .oneLevel {font-size: 14px;height: 40px;line-height: 40px;overflow: hidden;background: #f7f7f7; color: #444;}
    .catelog .mc .oneLevel a {display: block;text-align: center;}
    .catelog .mc .oneLevelarea {border-top: solid 1px #ddd;}
    .catelog .mc .twoLevel, .catelog .mc .noChild {font-size: 14px;height:40px;line-height: 40px;overflow: hidden;clear: both;background: #f7f7f7;cursor: default;}
    .catelog .mc .iconArrow {width: 16px;height: 16px;cursor: pointer;float: left;margin: 7px 0 0 20px;}
    .catelog .mc .twoLevel a, .catelog .mc .noChild a {display: block;margin-left: 46px;}
    .catelog .mc .twoLevel a:hover{color: #db0000;}
    .catelog .mc .threeLevel {background: #ffffff;overflow: hidden;_height: 100%;}
    .catelog .mc .threeLevel li {height:40px;line-height: 40px;overflow: hidden;}
    .catelog .mc .threeLevel li:hover{border-left: 4px solid #db0000;}
    .catelog .mc .threeLevel a {display: block;padding: 0 10px 0 46px;}
    .catelog .mc .threeLevel a:hover{background: #f7f7f7; color: #db0000;}
</style>
<div class="catelog">
	<div class="mc">
		<div class="oneLevel" style="text-align: center;">
            <a title="查看店内所有商品" href="${base}/shop/goodsShop.html?shopId=${shop.id}&catlogId=${child.id}&pageSize=20">查看店内所有商品</a>
		</div>

        <#list parentCatelogList as parent>
            <div class="oneLevelarea menu_list" id="firstpane">
                <div class="twoLevel menu_head current" data-num="0" >
                    <span class="iconArrow"></span>
                    <a title="${(parent.name)!}" href="javascript:void(0);">${(parent.name)!}</a>
                </div>
                <div class="threeLevel menu_body" style="display:none;">
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
<script type=text/javascript>
    $(document).ready(function(){
        $("#firstpane .menu_body:eq(0)").show();
        $("#firstpane div.menu_head").click(function(){
            $(".menu_list .menu_body").slideUp("slow");
            $(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
            $(this).siblings().removeClass("current");
        });
    });
</script>
</#escape>