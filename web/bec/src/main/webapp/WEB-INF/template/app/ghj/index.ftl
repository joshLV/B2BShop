<!DOCTYPE html>
<html>
<head>
    <#include "app/ghj/head.ftl">
        <script src="${path}/js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="${path}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
        <link  type="text/css" href="${path_skin}/swiper.min.css" rel="stylesheet">
        <link  type="text/css" href="${path_skin}/bootstrap.min.css" rel="stylesheet">

        <link type="text/css" href="${path_skin}/previewimage.css" rel="stylesheet" />
   <style>

       .guess-you-like header .header-position .header-more{position: absolute; right:10px; height:45px; padding-left:8px; padding-right:30px; top:-15px;/* background:#f4f4f4; */font-size:14px; background:url("${path}/images/more_bg.png") no-repeat; padding-top: 35px;  }
       .guess-you-like header .header-position .header-more span.arrow{width:7px; position:absolute; right:0;
           height: 7px;
           overflow: hidden;
           border-right: solid 2px #ffffff;
           border-top: solid 2px #ffffff;
           margin-right: 22px;
           transform: rotate(45deg);
           -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
           -o-transform: rotate(45deg);
           -ms-transform: rotate(45deg);
           margin-top:6px;
       }
       .guess-you-like header .header-position .header-more a { color:#fff; margin-left: 18px;}

	.seckill-item-img, .seckill-item-price {
	    padding: 0 5%;
	 }

      .ico-link div {
	    width: 33.3%;
	    text-align: center;
	}
       .mui-bar-nav {
           top: 0;
            background: #fff; border-bottom: 1px solid #ddd;
           box-shadow: 0 0 6px #ccc;
       }


       .mui-zoom-scroller{
           display: block;
       }
       .mui-slider .mui-slider-group .mui-slider-item img{
           width: 100% !important;
       }


   </style>
        <link rel="stylesheet" type="text/css" href="${path_skin}/cssnew.css">

</head>
<body>

<header class="mui-bar mui-bar-nav" >
<#--
    <div class="mui-pull-left fonts logo-font" style="width: 80px;" >
    &lt;#&ndash;<@spring.message "project_short_name"/>&ndash;&gt;&nbsp;&nbsp;&nbsp;
        <img src="${path}/images/zlogo_03.png"  style=" display:block; margin-top: -42px; width: 75px; height: 40px;">
    </div>-->

    <#--<div class="mui-title" style="left:100px;">
        <div class="mui-input-row">
            <input id="search" style=" min-width: 100px;text-align:left; padding-left: 35px;" type="search" onkeydown="javascript:if(event.keyCode==13){ s(document.getElementById('search').value);return false;}" class="mui-input-clear" placeholder="请输入商品名称">
            <button class="iconfont am-icon-search" type="submit"></button>
            <div style="position: absolute; left: 8px; top: 0;"><img src="${path}/images/ss.png" width="22" height="22"> </div>
        </div>
    </div>-->

    <div class="logo-center">
        <img src="${path}/images/zlogo_03.png"  >
    </div>
    <div class="mui-pull-right"> <a id="setting" class="mui-icon mui-icon-bars" onclick="jumpto('${base}/allSort?whichclient=whichapp')"></a> </div>
</header>
 <div class="mui-content" id="topbar">
     <div id="slider" class="mui-slider" style="margin-top: 14px">
        <div class="mui-slider-group mui-slider-loop">
        <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
            <#assign lastImg = adslides?last>
            <div class="mui-slider-item mui-slider-item-duplicate">
                <a onclick="jumpto('${lastImg.appUrl}')"><img src="${lastImg.mobilepic}@370w_200h_2e.png" alt="${lastImg.description}"></a>
            </div>
            <#list adslides as slideitem>
                <div class="mui-slider-item mui-slider-item-duplicate">
                    <a onclick="jumpto('${slideitem.appUrl}')" > <img src="${slideitem.mobilepic}@370w_200h_2e.png" alt="${slideitem.description}"></a>
                </div>
            </#list>
            <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
            <div class="mui-slider-item mui-slider-item-duplicate">
            <#assign firstImg = adslides?first>
                 <a onclick="jumpto('${lastImg.appUrl}')"><img src="${firstImg.mobilepic}@370w_200h_2e.png" alt=""></a>
            </div>
        </div>
        <!-- 轮播图片下面的小点 -->
        <div class="mui-slider-indicator">
            <#list adslides as slideitem>
                <#if slideitem_index == 0>
                    <div class="mui-active mui-indicator"></div>
                <#else><div class="mui-indicator"></div>
                </#if>
            </#list>
        </div>
    </div>
    <#--导航-->
    <#--<div class="f-cb ico-link fonts">
        <div class="f-fl"> <a href="javascript:go('/allSort?whichclient=whichapp')"><img src="${path}/images/spfl_icon.png"><br>
            商品分类</a> </div>
        <!--<div class="f-fl"> <a href="javascript:go('/join/whichapp')"><img src="${path}/images/zsrz_icon.png"><br>
            招商入驻</a> </div>&ndash;&gt;
        <div class="f-fl"> <a href="javascript:go('/cart/list?whichclient=whichapp&isLogin=${isLogin}')"><img src="${path}/images/gwc_icon.png"><br>
            购物车</a> </div>
        <div class="f-fl"> <a href="javascript:go('/member/index?whichclient=whichapp')"><img src="${path}/images/gywm_ico.png"><br>
            个人中心</a></div>
    </div>-->
<!--ULife头条-->
<#--<div id="topNews" style="background: #fff;padding: 5px 5px;height: 50px;border-bottom:1px dotted #dfdfdf;margin-top: -10px; ">
    <div id="topNews_Img" style="float:left; width:50px; height: 50px;"><img style="width: 100%; height: 100%;" src="${path}/images/topNews.png" ></div>
    <div id="topNews_scrollDiv" style="float:right; width:83%; height:50px;font-size: 12px;line-height:25px;overflow:hidden;">
        <ul>
        <#list topNewsList as topNews>
            <li style="height:25px;padding-left:10px;overflow:hidden;background: url(${path}/images/dian.gif) 4px 10px no-repeat; background-size:5px; ">
                <a href="${base}/play/${topNews.id}.html?whichclient=whichapp" style="margin-left: 2px;">${topNews.title}</a>
            </li>
        </#list>
        </ul>
    </div>
</div>-->


     <!--搜索-->
     <div class="newSer">
             <div class="goods_search">
                 <input type="search" name="keyword" id="search" value="" placeholder="请输入商品名称">
                 <button id="searchBtn" onclick="s(document.getElementById('search').value)"></button>
             </div>
     </div>

     <!--广货街公告-->
     <div class="topNews">
         <ul id="news">
         </ul>
     </div>
     <!--广货街公告js-->
     <script type="text/javascript">
         function autoScroll(obj){
             $(obj).find("ul").animate({
                 marginTop : "-40px"
             },500,function(){
                 $(this).css({marginTop : "0px"}).find("li:first").appendTo(this);
             })
         }
         $(function(){
             setInterval('autoScroll(".topNews")',5000);
         })

     </script>






 <#--<div class="gg">-->
    <#--<#list typeList as child>-->
        <#--<#if (child_index > 2) > <#break> </#if>-->
        <#--<a class="gg_item" href="${child['floor_left_'+'${child_index+1}'+'_1'].link}?whichclient=whichapp" target="_blank">-->
            <#--<img attr="lazyload" src="${picloading}" data-original="${child['floor_left_'+'${child_index+1}'+'_1'].pic}<#if (child_index % 3) == 0>_160x160.png<#else>_160x80.png </#if>"></a>-->
    <#--</#list>-->
    <#--</div>-->

<div class="speOff">
    <div class="sTit">
        <h2>本周特价</h2>
        <div class="speOff_time"><em class="fz1">剩余时间</em><font class="endtime" value="604800">6：13：00：06</font></div>
    </div>
    <div id="speOff_div" class="swiper-container">
      <div class="swiper-wrapper speOff_con">
            <#list tagGoodsList as tagGoodsMap>
                <#if (tagGoodsMap_index > 0)><#break ></#if>
                <#list tagGoodsMap["goodsList"] as goods>
                    <div class="swiper-slide" >
                        <a href="" class="ablock">
                            <div class="seckill-item-img">
                                <a <#--href="${base}/item/whichapp/${goods.id}.html"--> title="${goods.fullName}" class="seckill-link J_ping">
                                    <img width="100%" alt="${goods.fullName}" src="${goods.pic}@450w_400h.png" border="0" class="seckill-photo" title="${goods.fullName}" goodid="${goods.id}" scj="<#if goods.enableBatchPrice == '1'>￥${goods.batchPrice}<#else>${goods.price?string("currency")}</#if>" hyj="￥${(goods.price * (1-goods.defaultPrice/100))?string(',##0.00')}" data-preview-src="" data-preview-group="1">
                                </a>
                            </div>
                            <div class="seckill-item-price">
                                <p class="par">${goods.fullName}</p>

                                <span class="nologin"><span class="seckill-new-price" >仅会员可见！</span></span>
                                <span class="login" style="display: none">
                                    <p style="font-size: 12px;">
                                        <i>商城价</i>
                                        <span>
                                            <#if goods.enableBatchPrice == '1'>
                                                ￥${goods.batchPrice}
                                            <#else>
                                            ${goods.price?string("currency")}
                                            </#if>
                                                    </span><br/>
                                        <i>会员价</i>
                                        <span class="red login_price">￥${(goods.price * (1-goods.defaultPrice/100))?string(',##0.00')}</span>
                                    </p>

                                    <!--<span class="seckill-new-price">
                                        <#if (goods.price?exists)>${goods.price?string(priceCurrencyFormat)} <#else >￥0.00</#if>
                                    </span>
                                    <span class="seckill-original-price">
                                        <#if (goods.marketPrice?exists)>${goods.marketPrice?string(priceCurrencyFormat)} <#else >￥0.00</#if>
                                    </span>-->
                                </span>
                            </div>
                        </a>
                    </div>

                </#list>

            </#list>

      </div>
    </div>
</div>
     <#--本周特价 js-->
     <script>
         var swiper = new Swiper('#speOff_div.swiper-container', {
             slidesPerView: 2.5,
             paginationClickable: true,
             spaceBetween: 0,
             freeMode: true
         });
     </script>
     <#--新品推荐-->
<div class="newPro">
    <h2><img src="${path}/images/newPro.png"></h2>
    <div class="newPro_con">
        <a onclick="jumpto('${base}/newArrivals/list_app')"  href="javascript:void(0)"  class="newPro_img1"><img src="${path}/images/newPro1.jpg"></a>


<#list tagGoodsList as tagGoodsMap>
    <#if (tagGoodsMap_index == 1)>
        <#list tagGoodsMap["goodsList"] as goods>
            <#if (goods_index ==0)>
                <a onclick="jumpto('${base}/item/whichapp/${goods.id}.html')"  href="javascript:void(0)" title="${goods.fullName}"  class="newPro_img2">
                    <img alt="${goods.fullName}" src="${goods.pic}@200w_200h.png">
                    <p>${goods.fullName}</p>
                </a>
            </#if>
            <#if (goods_index ==1)>
                <a  onclick="jumpto('${base}/item/whichapp/${goods.id}.html')"  href="javascript:void(0)" title="${goods.fullName}"  class="newPro_img3">
                    <img alt="${goods.fullName}" src="${goods.pic}@200w_200h.png">
                    <p>${goods.fullName}</p>
                </a>
            </#if>

        </#list>
    </#if>


</#list>
<#--
        <a href="" class="newPro_img2">
            <img src="${path}/images/newPro2.jpg">
            <p>新品推荐产品名称</p>
        </a>
        <a href="" class="newPro_img3">
            <img src="${path}/images/newPro3.jpg">
            <p>新品推荐产品名称新品推荐产品名称</p>
        </a>-->
    </div>
</div>
     <#--产品分类-->
<#list typeList as child>
    <div class="proCla">
        <h2>
            <a onclick="jumpto('${base}/list/whichapp/${child["catelog"].id}.html?orderBy=sales&orderType=desc')"  href="javascript:void(0)" >
                <span class="txt ico_${child["catelog"].id}" catelogid="${child["catelog"].id}">${child["catelog"].name}</span>
                <span class="bg"></span>
            </a>
        </h2>
        <div class="adv">
            <a onclick="jumpto('${base}/list/whichapp/${child["catelog"].id}.html?orderBy=sales&orderType=desc')"  href="javascript:void(0)">
                <img src="${path}/images/pro_${child["catelog"].id}.jpg">
            </a>
            <i class="triangle"></i>
        </div>
        <ul class="proCon">
            <#list child["goodschildList"] as goodschild><#if (goodschild_index > 1) > <#break> </#if>
                <li>
                    <a onclick="jumpto('${base}/item/whichapp/${goodschild.id}.html')"  href="javascript:void(0)" title="${goodschild.fullName}">
                        <p class="par-img"><img attr="lazyload" src="${picloading}" data-original="${goodschild.pic}@200w_150h.png" alt="${goodschild.fullName}"></p>
                        <p class="par-txt"> ${goodschild.name}</p>
                        <p class="par-num">
                            <span class="sales">销量：<#if goodschild.sales??>${goodschild.sales}<#else>0</#if></em></span>
                            <span>评价：<#if goodschild.scoreCount??>${goodschild.scoreCount}<#else>0</#if></em></span>
                        </p>
                        <div class="proPrice">
                           <#-- <p><span>商城价：<font><em>￥</em>138.0</font></span></p>
                            <p><span>会员价：<font><em>￥</em>136.5</font></span></p>-->

                            <strong class="nologin">仅会员可见！</strong>
                            <div class="login" style="display: none;text-decoration: blink;">
                                <p style="font-size: 12px;">
                                    <span style="text-decoration: blink;">商城价：</span>
                                <span style="text-decoration: blink;">
                                    <#if goodschild.enableBatchPrice == '1'>
                                        ￥${goodschild.batchPrice}
                                    <#else>
                                    ${goodschild.price?string("currency")}
                                    </#if>
                                </span><br/>
                                    <span style="text-decoration: blink;">会员价：</span>
                                    <span class="red login_price" style="text-decoration: blink;">￥${(goodschild.price * (1-goodschild.defaultPrice/100))?string(',##0.00')}</span>
                                </p>
                            </div>


                        </div>


                    </a>

                </li>
            </#list>
        </ul>

    </div>
</#list>

    <#-- <div class="proCla">
         <h2>
             <span class="txt ico_15" catelogid="15">酒水饮料</span>
             <span class="bg"></span>
         </h2>
         <div class="adv">
             <a href="">
                 <img src="${path}/images/pro1.jpg">
             </a>
             <i class="triangle"></i>
         </div>
         <ul class="proCon">
             <li>
                 <a href="#">
                     <p class="par-img"><img src="http://file.ghj168.cn//1608061025133613487.jpg@200w_150h.png"></p>
                     <p class="par-txt">日本ROCKET玫瑰香衣物浓缩柔顺剂600ml</p>
                     <p class="par-num">
                         <span class="sales">销量：189</em></span>
                         <span>评价：25</em></span>
                     </p>
                     <div class="proPrice">
                         <p><span>商城价：<font><em>￥</em>138.0</font></span></p>
                         <p><span>会员价：<font><em>￥</em>136.5</font></span></p>
                     </div>


                 </a>

             </li>
             <li>
                 <a href="#">
                     <p class="par-img"><img src="http://file.ghj168.cn//1607111410003157169.jpg@200w_150h.png"></p>
                     <p class="par-txt">红岛特级初榨橄榄油1L</p>
                     <p class="par-num">
                         <span>销量：68</em></span>
                         <span>评价：35</em></span>
                     </p>
                     <div class="proPrice">
                         <p><span>商城价：<font><em>￥</em>244.0</font></span></p>
                         <p><span>会员价：<font><em>￥</em>243.5</font></span></p>
                     </div>


                 </a>

             </li>
         </ul>



     </div>-->



<#--导航栏目-->
<#--<div id="segmentedControl" class="mui-segmented-control fonts">
    <a name="owlNavTab" class="mui-control-item  mui-active" href="#item1mobile">本周特价<font class="endtime" value="604800" style="font-size: 12px;">6天13时00分06秒</font></a>
    <a name="owlNavTab" class="mui-control-item  " href="#item2mobile">新品推荐</a>
</div>
导航栏目结束
    热卖商品等等
    <#list tagGoodsList as tagGoodsMap>
    <div id="item${tagGoodsMap_index+1}mobile" class="tabs" style="display:<#if tagGoodsMap_index==0>block<#else>none</#if>">
        <ul id="seckillul" class="seckill-new-list">
        <#list tagGoodsMap["goodsList"] as goods>
            <#if (goods_index > 2) > <#break> </#if>
            <li class="seckill-new-item">
                <div class="seckill-item-img">
                    <a href="${base}/item/whichapp/${goods.id}.html" title="${goods.fullName}" class="seckill-link J_ping">
                        <#if tagGoodsMap_index == 0>
                            <img width="100%" alt="${goods.fullName}" src= "${goods.pic}@200w_150h.png"  border="0" class="seckill-photo">
                        <#else >
                            <img width="100%" attr="lazyload" alt="${goods.name}" src="${picloading}" data-original="${goods.pic}@200w_150h.png"  border="0" class="seckill-photo">
                        </#if>
                    </a>
                </div>
                <div class="seckill-item-price">
                    <span class="nologin"><span class="seckill-new-price" >仅会员可见！</span></span>
                    <span class="login" style="display: none">
                        <p style="font-size: 12px;">
                            <i>商城价：</i>
                            <span>
                                           <#if goods.enableBatchPrice == '1'>
                              ￥${goods.batchPrice}
                                           <#else>
                              ${goods.price?string("currency")}
                                           </#if>
                                        </span><br/>
                            <i>会员价：</i>
                            <span class="red login_price">￥${(goods.price * (1-goods.defaultPrice/100))?string(',##0.00')}</span>
                        </p>

                        <!--<span class="seckill-new-price">
                            <#if (goods.price?exists)>${goods.price?string(priceCurrencyFormat)} <#else >￥0.00</#if>
                        </span>
                        <span class="seckill-original-price">
                            <#if (goods.marketPrice?exists)>${goods.marketPrice?string(priceCurrencyFormat)} <#else >￥0.00</#if>
                        </span>&ndash;&gt;
                    </span>
                </div>
            </li>
        </#list>
        </ul>
    </div>
    </#list>-->
     <#--热卖商品等等结束-->
    <#--产品列表-->
    <#--<#list typeList as child>
    <div class="guess-you-like">
        <header>
        <div class="header-position i_${child["catelog"].id}" catelogId="${child["catelog"].id}">
                <div class="header-line"></div>
            <div class="header-text" catelogId="${child["catelog"].id}"><span class="text" catelogId="${child["catelog"].id}"> ${child["catelog"].name}</div>
                <div class="header-more">
                <a href="${base}/list/whichapp/${child["catelog"].id}.html?orderBy=sales&orderType=desc">更多<span class="arrow"></span></a>
                </div>
            </div>
        </header>
    <ul class="clearfix" id="ul_${child["catelog"].id}">
            <#list child["goodschildList"] as goodschild><#if (goodschild_index > 5) > <#break> </#if>
            <li>
                <div class="face">
                    <a href="${base}/item/whichapp/${goodschild.id}.html">
                        <img attr="lazyload" src="${picloading}" data-original="${goodschild.pic}@200w_150h.png" alt="${goodschild.fullName}">
                    </a>
                </div>
                <div class="info">
                    <p><a href="${base}/item/whichapp/${goodschild.id}.html"> ${goodschild.name}</a></p>
                    <div class="extra">
                        <span style="text-decoration:inherit;margin-left:5px;">销量:<#if goodschild.sales??>${goodschild.sales}<#else>0</#if></span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="text-decoration:inherit">评论:<#if goodschild.scoreCount??>${goodschild.scoreCount}<#else>0</#if></span><br>
                            <strong class="nologin">仅会员可见！</strong>
                            <div class="login" style="display: none;text-decoration: blink;margin-left:5px;">
                            <p style="font-size: 12px;">
                                <span style="text-decoration: blink;">商城价：</span>
                                <span style="text-decoration: blink;">
                                   <#if goodschild.enableBatchPrice == '1'>
                                  ￥${goodschild.batchPrice}
                                   <#else>
                                  ${goodschild.price?string("currency")}
                                   </#if>
                                </span><br/>
                                <span style="text-decoration: blink;">会员价：</span>
                                <span class="red login_price" style="text-decoration: blink;">￥${(goodschild.price * (1-goodschild.defaultPrice/100))?string(',##0.00')}</span>
                            </p>
                            </div>
			    <!--
                            <strong class="login" style="display: none">
			    ￥${goodschild.price?string('##0.00')}</strong></br>
                            <span class="login" style="display: none">
                                <#if (goodschild.marketPrice?exists) >￥${goodschild.marketPrice?string('##0.00')} <#else >￥0.00</#if>
                            </span>&ndash;&gt;
                    </div>
                </div>
            </li>
            </#list>
        </ul>
    </div>
    </#list>-->
     <#--产品列表结束-->
    <#--尾部信息-->
    <div class="foot">
        <div class="mll-footer-link"><div class="viewport">
            <ul>
                <li><a id="JS_footer_login" onclick="jumpto('${base}/member/login?whichclient=whichapp')"  href="javascript:void(0)" >登录</a></li>
                <li><a onclick="jumpto('${base}/introduce/whichapp')" href="javascript:void(0)">关于我们</a></li>
                <li><a id="backToTop" onclick="window.location.href='#silder'" href="javascript:void(0)" class="mui-control-item">返回顶部</a></li>
            </ul>
        </div></div>
        <div class="mll-footer-icp">Copyright © 2015-2016 广货街有限责任公司</div>
    </div>
</div>
<div class="return" style="z-index: 2">
    <a id="backToTop2" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>
<#--footer-->
<div>
    <#include "app/ghj/tools.ftl">
</div>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script src="${path}/js/owlcarousel/owl.carousel.js?v=beta.1.8"></script>

<script src="${path}/js/mui.zoom.js"></script>
<script src="${path}/js/mui.previewimage2.js"></script>
<script>
    mui.previewImage();
</script>
<script>
    function s(key) {
        if (key != undefined && key != "" && key != "请输入您要找的商品名称") {
            jumpto(hosturl+"/search/s/"+encodeURI(encodeURI(key.replace("/",""))) + "?whichclient=whichapp&orderBy=sales&order=desc");
        }else{
            popAlert("请输入检索关键字！")
        }
    }
    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack:true
        });
        var slider = mui("#slider").slider({interval: 3000});
//        jQuery("#search").blur(function(){
//            s(jQuery(this).val());
//        });
        setTimeout(function() {
            if(ismobile && typeof(plus)!='undefined'){
                plus.navigator.closeSplashscreen();
            }
        }, 600);
        //添加当语音输入完成后执行搜索事件
        document.getElementById("search").addEventListener('recognized',function(e){
            s(jQuery(this).val());
        })
        mui.back = function () {

        };
//        var backButtonPress = 0;
//        mui.back = function(event) {
//            backButtonPress++;
//            if (backButtonPress > 1) {
//                plus.runtime.quit();
//            } else {
//                popAlert('再按一次退出应用');
//            }
//            setTimeout(function() {
//                backButtonPress = 0;
//            }, 1000);
//            return false;
//        }
        jQuery.each(jQuery("a[name='owlNavTab']"), function (i, tab) {
            if (i != 0) {
                var href = tab.href;
                var tabId = '#' + href.split('#')[1];

                jQuery(tabId + ' img').lazyload({
                    effect: "fadeIn",
                    event: "sporty"
                });
            }
        });


        jQuery("a[name='owlNavTab']").bind("tap", function (e) {
            jQuery(".tabs").hide();
            var href = $(this).attr("href");
            var tabId = '#' + href.split('#')[1];
            jQuery(tabId + ' img').trigger("sporty");
            jQuery(tabId).show();
        });

        jQuery("img[attr='lazyload']").lazyload({
            threshold: 20,
            effect: "fadeIn"
        });

//        jQuery("a[name='owlNavTab']").bind("tap", function (e) {
//            var href = e.target.href;
//            var tabId = '#' + href.split('#')[1];
//            jQuery(tabId + ' img').trigger("sporty");
//        });

        jQuery('#backToTop').bind("tap", function () {
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });
        jQuery('#backToTop2').bind("tap", function () {
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });

        jQuery.each(jQuery('.owl-carousel'), function (index, owl) {
            owl2 = jQuery(owl);
            owl2.owlCarousel({
                items: 3,
                loop: false,
                margin: 10,
                autoplayHoverPause: true
            });
        });
    }(mui, document));
    function go(url){
        jumpto(fullpath +url);
    }
    $(window).scroll(function(){
        if ($(window).scrollTop()>100){
            $("#backToTop2").fadeIn(500);
        }else{
            $("#backToTop2").fadeOut(500);
        }
    });

    jQuery(".header-position").on('click',function(event){
        if(!jQuery(event.target).is("a")){
            var catelogid = jQuery(event.target).attr("catelogid");
            console.log(catelogid);
            jQuery("#ul_"+catelogid).toggle();
        }

    });
</script>
<script>
    (function($){
        $.fn.extend({
            Scroll:function(opt,callback){
                //参数初始化
                if(!opt) var opt={};
                var _this=this.eq(0).find("ul:first");
                var lineH=_this.find("li:first").height(), //获取行高
                        line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10), //每次滚动的行数，默认为一屏，即父容器高度
                        speed=opt.speed?parseInt(opt.speed,10):500, //卷动速度，数值越大，速度越慢（毫秒）
                        timer=opt.timer?parseInt(opt.timer,10):3000; //滚动的时间间隔（毫秒）
                var lineCount = _this.children("li").length;
                if(line==0) line=1;
                var upHeight=0-line*lineH;
                //滚动函数
                scrollUp=function(){
                    _this.animate({
                        marginTop:upHeight
                    },speed,function(){
                        for(i=1;i<=line;i++){
                            _this.find("li:first").appendTo(_this);
                        }
                        _this.css({marginTop:0});
                    });
                }
                //鼠标事件绑定
                _this.hover(function(){
                    clearInterval(timerID);
                },function(){
                    if(line>lineCount*lineH){
                        timerID=setInterval("scrollUp()",timer);
                    }
                }).mouseout();
            }
        });
    })(jQuery);

    $(document).ready(function(){
        $("#topNews_scrollDiv").Scroll({line:2,speed:300,timer:3500});
    });
</script>
<script>
    $(function(){
        loginShowView()
        getNews();
    });

    $(function(){

        var now = new Date(); //当前日期
        var nowDayOfWeek = now.getDay() == 0 ? 7 : now.getDay(); //今天本周的第几天
        var nowHour = now.getHours();
        var nowMinute = now.getMinutes();
        var nowSecond = now.getSeconds();
        var cha = parseInt($(".endtime").attr('value')) - ((nowDayOfWeek - 1)*24*60*60 +  nowHour*60*60 + nowMinute*60 + nowSecond);
        timer(cha);
    });

    function timer(intDiff){
        window.setInterval(function(){
            var day=0,
                    hour=0,
                    minute=0,
                    second=0;//时间默认值
            if(intDiff > 0){
                day = Math.floor(intDiff / (60 * 60 * 24));
                hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
            }
            if (minute <= 9) minute = '0' + minute;
            if (second <= 9) second = '0' + second;
            var time = "<span class='t-border'>"+day+"</span>：";
            time += "<span class='t-border'>"+hour+'</span>：';
            time += "<span class='t-border'>"+minute+'</span>：';
            time += "<span class='t-border'>"+second+'</span>';
            $('.endtime').html(time);
            intDiff--;
        }, 1000);
    }


    function getNews(){
        $.ajax({
            type: "post",
            url: "${base}/ajaxGetNews",
            data: {pageNumber: 1, pageSize: 4},
            success: function(data) {
                if (data.status == 'success') {
                    if( data.data ){
                        var html = '';
                        $.each(data.articlesList,function(k,v){
                            html += '<li>';
                            html += '<a href="${base}/play/'+v.id+'.html?whichclient=whichapp" title="'+ v.title +'">'+v.title+'</a>';
                            html += '</li>';
                        });

                        $("#news").html(html);
                    }
                }
            }
        });
    }

    /**
     * Desc:关注商品
     * Auth:liuxiaobing
     * Time:2015-12-7 10:50:35
     */
    function addGoodsAttention(goodsId) {
        showWaiting();
        jQuery.ajax({
            type: "get",
            url: "${base}/goods/addToGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='success'){
                    popAlert('已成功关注该商品!');
                    $(".atam").attr("href","javascript:void(0)")
                    $(".atam").find("i").addClass("gz_icon_on");
                }else if(data.status=='warn'){
                    popAlert(data.message);
                }else if(data.status=='NOLOGIN'){
                    popAlert('登录后才可关注商品');
                }else{
                    popAlert(data.message);
                }
                closeWaiting();
            },
            error:function(data){
                closeWaiting();
                popAlert(data.message);
            }
        });
    }
    function jumpd(goodsId){
        jumpto('${base}/item/whichapp/'+goodsId+'.html')
    }
</script>
<#--<#include "app/ghj/panel.ftl">-->
</head>
</body>
</html>
