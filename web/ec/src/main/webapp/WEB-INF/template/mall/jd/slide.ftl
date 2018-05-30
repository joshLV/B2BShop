<#escape x as x?html>
<style>
.slide-center {float: left;overflow: hidden;padding-left: 220px;}
.slide {width: 550px;height: 270px;background-color: #F5F5F5;}
.slide {float:left;overflow:hidden;position:relative;font-size:0;line-height:0;}
.slide-items-wrap {position:absolute;top:0;left:0;width:100%;}
.slide-item {overflow:hidden;position:relative;height:270px;}
.slide-item .brick {position:absolute;}
.slide-nav-bg {position:absolute;bottom:0;left:0;width:100%;height:30px;filter:alpha(opacity=30);-moz-opacity:.3;opacity:.3;}
.slide-nav {position:absolute;bottom:5px;right:7px;}
.slide-nav li {float:left;display:inline;width:18px;height:18px;margin:0 3px;background:#FFF;border:1px solid #e6e6e6;font-size:12px;line-height:18px;text-align:center;cursor:default;}
.slide-nav .cur {background:#404040;border-color:#404040;color:#FFF;font-weight:700;}

.widepage .slide {width: 740px;}

.slide-right {float: right;width: 210px;}
.widepage .slide-right{width: 238px;}

/**********************hot-region**********************/
.hot-region{width: 550px;}
.hot-region{clear:both;overflow:hidden;}
.hot-region-hd{overflow:hidden;border-right:1px solid #e6e6e6}
.hot-region-nav{width:550px;}
.hot-region-nav{background:#fefcf6;font-family:"Microsoft YaHei";font-size:14px}
.hot-region-nav li{width:182px;height:29px;}
.hot-region-nav li{float:left;padding:1px 0 0;border:1px solid #e6e6e6;border-right:0 none;line-height:29px;font-weight:700;text-align:center;cursor:default}
.hot-region-nav li.cur{border-top:2px solid #AAA;border-bottom:0 none;padding:0;background:#fff;}
.hot-region-bd{height: 231px;background: #fff;overflow:hidden;border:1px solid #DEDEDE;border-top:0 none;position:relative}
.products{height: 226px;}
.products li{width:182px;float:left;display:inline;}
.products .pic{overflow:hidden;position:relative;text-align:center;width:160px;height:160px;margin:2px auto 2px}
.products .pic img{width:160px;height:160px}
.products .name{padding:0px 5px 0px 5px;overflow:hidden;height: 36px;margin-bottom:2px;word-break:break-all;word-wrap:break-word;}
.products .price{padding:0px 5px 0px 5px;color: #999;height: 18px;overflow: hidden;}
.products .price strong {display: inline-block;font-family: verdana;font-size: 12px;margin-right: 5px;line-height: 18px;overflow: hidden;vertical-align: middle;color: #e4393c;}

.widepage .hot-region{width: 740px;}
.widepage .hot-region-nav{width:740px;}
.widepage .hot-region-nav li{width:184px;}

/**********************news**********************/
.news{width: 208px;height:358px;margin:0 0 8px;border:1px solid #e6e6e6;background:#FFFFFF;float:right;overflow:hidden;position:relative;}
.news-hd{height:30px;padding:0 10px;background:#f8f8f8;line-height:30px;border-bottom: 1px solid #e6e6e6;}
.news-hd h2{float:left}
.news-hd .extra {float:right;}
.news-hd .extra a:link,.news-hd .extra a:visited,.news-hd .extra a:link,.news-hd .extra a:visited {color: #005EA7;}
.news-list{overflow:hidden;height:358px;margin:0 10px;padding:5px 0 0;}
.news-list li{overflow:hidden;height:22px;padding:0 0 0 10px;line-height:22px;}

.widepage .news{width: 236px;}

/**********************car-file**********************/
.car-file {width:210px;height:228px;float:right;overflow:hidden;position:relative;}
.car-file .mt{height:22px;font-size:16px;color:#333;}
.car-file .mt h2{float:left;height:20px;line-height:20px;font-size:16px;font-weight:normal;color:#333;}
.car-file .mc{overflow:hidden;height:196px;padding:0 15px;border-width:2px 1px 1px;border-style:solid;border-color:#52668D #DEDEDE #DEDEDE;}
.car-file .mc .prompt{position:relative;overflow:hidden;width:208px;height:50px;padding:4px 0 7px;background:url(${base}/static/mall/img/acda-bg.jpg) no-repeat 0 -49px;}
.car-file .mc .select{width:178px;height:24px;padding:0;margin-bottom:10px;line-height:20px;font-family:verdana;color:#666;}

.car-file .mc .btn-find{display:block;overflow:hidden;width:70px;height:25px;background:url(${base}/static/mall/img/btn7.png) 0 -55px no-repeat;text-align:center;font:bold 12px/25px \5b8b\4f53;color:#333;}
.car-file .mc .btn-find-disable{ background:url(${base}/static/mall/img/btn6.png) no-repeat;color:#ccc;font:normal 12px/25px \5b8b\4f53; cursor:default;}
.car-file .mc .btn-find:hover{text-decoration:none;}

.widepage .car-file{width:238px;}
.widepage .car-file .mc .prompt{width:206px;left:0;background-position:0 4px;}
.widepage .car-file .mc .select{width:206px;}
/**********************car-file end**********************/

/**********************jrbk**********************/
.jrbk {width:210px;float:right;overflow:hidden;position:relative;}
.jrbk .mt{height:22px;font-size:16px;color:#333;}
.jrbk .mt h2{float:left;height:20px;line-height:20px;font-size:16px;font-weight:normal;color:#333;}
.jrbk .mc{position:relative; padding-left: 140px;overflow:hidden;height:151px;border-width:2px 1px 1px;border-style:solid;border-color:#52668D #DEDEDE #DEDEDE;}
.jrbk .p-img{position: absolute; width:130px; height: 130px; left: 5px; top: 5px;}
.jrbk .p-name{overflow:hidden; padding-top: 15px;width:65px;height:90px;line-height: 18px; margin-bottom: 10px;}
.jrbk .p-price{}

.widepage .jrbk{width:238px;}
.widepage .jrbk .mc{padding-left: 150px;}
.widepage .jrbk .p-img{left: 10px;}
.widepage .jrbk .p-name{width: 75px;}
/**********************jrbk end**********************/

</style>
<div class="content m">
	<div class="slide-center">
		<div class="slide m" id="adslide">
			<div class="slide-items-wrap" style="top: 0px;"> 
				<ul class="slide-items" id="J-slide-items">
					<#list adslides as slideitem>
					<li class="slide-item">
						<a class="brick" href="${slideitem.url}" style="top:0px;left:0px;" target="_blank">
							<img alt="${slideitem.description}" title="${slideitem.description}" src="${slideitem.pic}"/>
						</a>
					</li>
					</#list>
				</ul>
			</div>
		</div>
		<div class="hot-region" id="hot-region">
			<div class="hot-region-hd">
				<ul id="hot-region-nav" class="hot-region-nav clearfix">
					<#list tagList as tag>
					<li class="<#if tag_index==0>cur<#elseif tag_index==3>hide</#if>">${tag["name"]}</li><!--${tag["sign"]}-->
					</#list>
				</ul>
			</div>
			<div class="hot-region-bd" >
				<#list tagGoodsList as tagGoodsMap>
				<ul class="products" style="display: <#if tagGoodsMap_index==0>block<#else>none</#if>;">
					<#list tagGoodsMap["goodsList"] as goods>
					<li class="fore${goods_index} <#if goods_index==3>hide</#if>">
						<p class="pic">
							<a href="${base}/item/${goods.id}.html" target="_blank"><img alt="${goods.fullName}" src="${goods.pic}"></a>
						</p>
						<p class="name"><a href="${base}/item/${goods.id}.html" target="_blank" title="${goods.fullName}">${goods.name}</a></p>
						<p class="price">商城价:<strong>${goods.price?string('currency')}</strong></p>
					</li>
					</#list>
				</ul>
				</#list>
			</div>
		</div><!--hot-region end-->
	</div><!--slide-center end-->
	<div class="slide-right">
		<div class="news">
			<div class="news-hd">
				<h2>站内公告</h2>
				<div class="extra">
					<a href="${base}/notice/list" target="_blank">更多&nbsp;&gt;</a>
				</div>
			</div>
			<ul class="news-list">
		    <#list notices as notice>
			<li><a href="${base}/play/${notice.id}.html" target="_blank"><strong><span <#if notice.isTop==1>style="color:red;"</#if>><b>${notice.title}</b></span></strong></a></li>
		    </#list>
		    <#--<#list notices as notice>
			<li><a href="${base}/play/${notice.id}.html" target="_blank"><strong><span <#if notice.isTop==1>style="color:red;"</#if>><b>${notice.title}</b></span></strong></a></li>
		    </#list>-->
			</ul>
		</div><!--news end-->
		<#--<div class="car-file">
			<div class="mt">
				<h2>爱车档案</h2>
			</div>
			<div class="mc">
	            <div class="prompt"></div>
	            <select id="carbrandId" class="select" onChange="getSeries()">
	            	<option value="请选择">选择品牌</option>
                    <#list carbrandList as carbrand>
                        <option  value="${carbrand.id}">${carbrand.name}</option>
                    </#list>
	            </select>
	            <select id="carSeriesId" class="select" onChange="getCartype()">
	                <option value="选择车系">选择车系</option>
                    <#list carSeriesList as Series>
                        <option  value="${Series.id}">${Series.name}</option>
                    </#list>
	            </select>
	            <select id="carTypeId" class="select" onChange="getGoods()">
	                <option value="选择车型">选择车型</option>
                    <#list cartypeList as cartype>
                        <option  value="${cartype.id}">${cartype.name}</option>
                    </#list>
	            </select>
	            <a class="btn-find btn-find-disable" id="btn" href="javascript:void(0);" title="查看配件">查看配件</a>
	        </div>
		</div>--><!--car-file end-->
		<div class="jrbk">
			<div class="mt">
				<h2>今日爆款</h2>
			</div>
			<div class="mc">
				<div class="p-img">
					<a target="_blank" title="${tcGoods.fullName}" href="${base}/item/${tcGoods.id}.html">
						<img width="130" height="130" alt="${tcGoods.fullName}" data-img="1" src="${tcGoods.pic}" class="err-product">
					</a>
				</div>
				<div class="p-name">
					<a target="_blank" title="${tcGoods.fullName}" href="${base}/item/${tcGoods.id}.html">${tcGoods.fullName}</a>
				</div>
				<div class="p-price">
					<strong>￥${tcGoods.price}</strong>
				</div>
			</div>
		</div><!--jrbk end-->
	</div><!--slide-right end-->
</div>
</#escape>