<!DOCTYPE html>
<html>
<head>
<#include "app/jp/head.ftl">
    <link href="${path}/js/owlcarousel/owl.carousel.css" rel="stylesheet"></link>
    <link href="${path}/js/owlcarousel/owl.theme.css" rel="stylesheet"></link>


    <style>
                .mui-login{color: #ffffff; line-height: 44px;}
       .guess-you-like header .header-position .header-more{position: absolute; right:0; padding-left:8px; padding-right:25px; top:0px; background:#f4f4f4; font-size:14px;}
       .guess-you-like header .header-position .header-more span.arrow{width:7px; position:absolute; right:0;
           height: 7px;
           overflow: hidden;
           border-right: solid 2px #E4393C;
           border-top: solid 2px #E4393C;
           margin-right: 15px;
           transform: rotate(45deg);
           -webkit-transform: rotate(45deg);
           -moz-transform: rotate(45deg);
           -o-transform: rotate(45deg);
           -ms-transform: rotate(45deg);
           margin-top:6px;
       }
       .mui-icon-search{float: right; padding-right: 10px; padding-top: 8px;}
       .guess-you-like header .header-position .header-more a { color:#666;}
       .mui-bar .mui-input-row .mui-input-clear~.mui-icon-clear, .mui-bar .mui-input-row .mui-input-speech~.mui-icon-speech {
           top: 4px;!important;
           right: 0px;!important;
       }
                .mui-bar{ padding-right: 5px!important; padding-left: 5px!important;}
        .kf{ float: right; font-size: 14px; color: #666; line-height: 34px; padding: 5px 0;}
        .kf a{ color: #E4393C;}
      .ico-link div{ padding-bottom: 10px; padding-top: 10px; width: 33%;border-right: 1px dotted #dfdfdf;border-top: 1px dotted #dfdfdf;  }
        .ico-link div img{ width: 56px; height: 56px;}
        .ico-link{ padding-bottom: 0px;}
        .ico-link div:nth-child(3n){border-right:none;}
        .ico-link div:nth-child(4),.ico-link div:nth-child(5){ padding-bottom: 20px;}


        .content-padded {
             padding: 10px; padding-bottom: 5px; background:#fff; height: 44px;
        }
        .control-group {
            position: relative; margin-top: 10px;
        }

        .control-group.search .icon-search {
            position: absolute;
            top: 11px;
            left: 12px;
            display: inline-block;
            width: 20px;
            height: 20px;
            line-height: 20px;
            color: #999;
        }
        .control-group.search input[type=search] {
            margin-bottom: 0;
            padding-left: 40px;
            border-radius: 22px; border:1px solid #dfdfdf;
            position: absolute;
            top: 0;
            left: 0;
        }
        input[type=search] {
            padding: 0 10px;
            font-size: 15px;
            border-radius: 20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box; background: none;
            height:40px; text-align: left; color: #999;


        .mui-icon{ right: 0px; position: absolute; top:0px; color: #999;}



        .owltabs {
        }

        .mui-input-row.mui-search .mui-icon-clear {
             top: 4px;
        }
        .mui-search .mui-placeholder .mui-icon {
            font-size: 28px;
            color: #ABABAB;
        }
        .mui-search.mui-active:before {

            font-size: 28px;
            color: #ABABAB;
            top: 32px;
            right: auto;
            left: 7px;
            display: block;
            margin-right: 0
        }
        .mui-search .mui-placeholder {
            font-size: 15px;
            line-height: 34px;
            position: absolute;
            z-index: 1;
            top: 8px;
            right: 0;
            bottom: 0;
            left: 0;
            display: inline-block;
            height: 38px;
            text-align: left !important;
            padding-left: 15px;
            color: #999;
            border: 0;
            border-radius: 6px;
            background: 0 0;
        }


    </style>
    <style>
        .input_div{position: relative; width: 80%; float: left;}
        .mui-input-row.mui-search .mui-icon-clear { top:5px;}
        .but_style{font-size: 15px; text-align: center;;
            padding: 8px 12px;
            margin-top: 6px;
            width: 18%;
            float: right;
            -webkit-text-stroke-width: 0;
            font-family: "微软雅黑", "宋体"!important;
            background: #f15353;
            color: #fff;
            border: 0;
        }
        .mui-search .mui-placeholder{ font-size: 15px;}
        .mui-input-clear{ color: #666!important;}
    </style>

</head>
<body>

<header class="mui-bar mui-bar-nav" style="background: #fff!important;">
    <#--<div class="mui-pull-left fonts logo-font" style="width: 80px;" >
    &lt;#&ndash;<@spring.message "project_short_name"/>&ndash;&gt;&nbsp;&nbsp;&nbsp;

    </div>-->
    <div class="mui-pull-left"> <img src="${path}/images/zlogo.png" style="display:block; padding: 5px 0; height: 27px; margin-top: 4px;"> </div>
    <#--<div class="mui-title" style="left:80px;">
        <div class="mui-input-row">
            <form action="#" id="searchForm" method="post">
            <input id="search" name="keyword" style="min-width: 100px;text-align:left" type="search" onkeydown="javascript:if(event.keyCode==13){ s(document.getElementById('search').value);return false;}" class="mui-input-clear" placeholder="请输入商品名称">
            </form>
        </div>
    </div>-->
    <div class="mui-pull-right">
        <#--<a id="setting" class="mui-icon mui-icon-bars" href="${base}/allSort?whichclient=whichapp"></a>-->
           <#-- <a id="setting" class="mui-icon mui-icon-contact" href="${base}/member/index?whichclient=whichapp"></a>-->
        <span class="kf" style="font-size: 13px;">客服：<a href="TEL:029-89601695">029-89601695</a></span>
    </div>
</header>
 <div class="mui-content" id="topbar" style="padding-bottom:0;">
     <div id="slider" class="mui-slider" style="margin-top: 14px">
        <div class="mui-slider-group mui-slider-loop">
        <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
	<#assign lastImg = adslides?last>
        <div class="mui-slider-item mui-slider-item-duplicate">
            <a href="${base}/${lastImg.appUrl}"><img src="${lastImg.pic}@370w_155h_db.png" alt="${lastImg.description}"></a>
        </div>
	<#list adslides as slideitem>
        <div class="mui-slider-item mui-slider-item-duplicate">
            <a href="${base}/${slideitem.appUrl}"><img src="${slideitem.pic}@370w_155h_db.png" alt="${slideitem.description}"></a>
        </div>
	</#list>
        <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
        <div class="mui-slider-item mui-slider-item-duplicate">
		<#assign firstImg = adslides?first>
            <a href="${base}/${firstImg.appUrl}"><img src="${firstImg.pic}@370w_155h_db.png" alt="${firstImg.description}"></a>
        </div>
    </div>

    <!-- 轮播图片下面的小点 -->
    <div class="mui-slider-indicator">
	<#list adslides as slideitem>
		<#if slideitem_index == 0>
            <div class="mui-active mui-indicator"></div>
		<#else>
            <div class="mui-indicator"></div>
		</#if>
	</#list>
    </div>
</div>
 <#--搜索-->
     <div class="mui-content-padded" style="margin: 0px 5px 0px 5px; padding-top: 10px;">
         <div class="mui-input-row mui-search" style="width: 100%;">
             <div class="mui-input-row mui-search input_div" >

                 <input id="search"
                        style="min-width: 100px;text-align: left;margin: 5px 0px;border: 1px solid #dfdfdf;border-radius: 3px;"
                        type="search"
                        onkeydown="javascript:if(event.keyCode==13){ searchSj_SP(document.getElementById('search').value);return false;}"
                        class="mui-input-clear" placeholder="商品搜索：请输入商品关键字"/>
             </div>
             <button class="iconfont am-icon-search but_style" onclick="searchSj_SP(document.getElementById('search').value);">搜索</button>

         </div>
     </div>
 </div>
<#--搜索结束-->
<#--导航-->
<div class="f-cb ico-link fonts">
    <div class="f-fl"> <a href="javascript:go('/list/whichapp/1.html?orderBy=sales&orderType=desc')"><img src="${path}/images/fl_1.png"><br>厨房设备</a> </div>
    <div class="f-fl"> <a href="javascript:go('/list/whichapp/2.html?orderBy=sales&orderType=desc')"><img src="${path}/images/fl_2.png"><br>餐饮用品</a></div>
    <div class="f-fl"> <a href="javascript:go('/list/whichapp/3.html?orderBy=sales&orderType=desc')"><img src="${path}/images/fl_3.png"><br>客房用品</a> </div>
    <div class="f-fl"> <a href="javascript:go('/list/whichapp/4.html?orderBy=sales&orderType=desc')"><img src="${path}/images/fl_4.png"><br>一次性用品</a> </div>
    <div class="f-fl"> <a href="javascript:go('/list/whichapp/5.html?orderBy=sales&orderType=desc')"><img src="${path}/images/fl_5.png"><br>大堂用品</a> </div>
    <div class="f-fl"> <a href="javascript:go('/allSort?whichclient=whichapp')"><img src="${path}/images/fl_6.jpg"><br> 商品分类</a> </div>
</div>
<!--ULife头条-->
<#--<div id="topNews" style="background: #fff;padding: 5px 5px;height: 50px;border-bottom:1px dotted #dfdfdf;margin-top: -10px;">
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
<#--    <div class="gg">
    <#list typeList as child>
        <#if (child_index > 2) > <#break> </#if>
        <a class="gg_item" href="${child['floor_left_'+'${child_index+1}'+'_1'].link}?whichclient=whichapp" target="_blank">
            <img attr="lazyload" src="${picloading}" data-original="${child['floor_left_'+'${child_index+1}'+'_1'].pic}<#if (child_index % 3) == 0>_160x160.png<#else>_160x80.png </#if>"></a>
    </#list>
    </div>-->

     <#--秒杀和团购-->
<#--<style>
    .ms-tg{ width: 100%; display: -webkit-box; padding: 7px 0; overflow: hidden; background: #fff;}
    .ms-tg li{ width: 50%; padding: 0.3em;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -ms-box-sizing: border-box;
        box-sizing: border-box;
    }
    .ms-tg li img{ width: 100%;}
</style>

<ul class="ms-tg">
    <li><a href="${base}/promotions/ms?whichclient=whichapp"><img src="<#if msImge??>${msImge}<#else>${base}/static/app/jp/images/ms2.jpg</#if>"></a></li>
    <li><a href="${base}/promotions/tg?whichclient=whichapp"><img src="<#if tgImge??>${tgImge}<#else>${base}/static/app/jp/images/tg2.jpg</#if>"></a></li>
</ul>-->

<#--导航栏目-->
<div id="segmentedControl" class="mui-segmented-control fonts">
<#list tagList as tagListMap>
    <a name="owlNavTab" class="mui-control-item <#if tagListMap_index==0> mui-active</#if> "
       href="#item${tagListMap_index+1}owl"> ${tagListMap["name"]} </a>
</#list>
</div>
<#--导航栏目结束-->
<#--热卖商品等等-->
<#list tagGoodsList as tagGoodsMap>
<div id="item${tagGoodsMap_index+1}owl" class="tabs owltabs"
     style="display:<#if tagGoodsMap_index==0>block<#else>none</#if>">
    <div class="owl-carousel seckill-new-list">
		<#list tagGoodsMap["goodsList"] as goods>
            <div>
                <div class="seckill-item-img" style="padding:0">
                    <a href="${base}/item/whichapp/${goods.id}.html" title="${goods.fullName}"
                       class="seckill-link J_ping">
						<#if tagGoodsMap_index == 0>
                            <img width="100%" alt="${goods.fullName}" src="${goods.pic}_200x150.png" border="0"
                                 class="seckill-photo">
						<#else >
                            <img width="100%" attr="lazyload" alt="${goods.name}" src="${picloading}"
                                 data-original="${goods.pic}_200x150.png" border="0" class="seckill-photo">
						</#if>
                    </a>
                </div>
                <div class="seckill-item-price" style="padding:0">
                    <div style="border-bottom:1px dotted #dfdfdf">
                        <p style="margin-left:12px;font-size: 13px;color: #999; position: relative; margin-bottom:0;padding-bottom:5px; max-height:40px;overflow: hidden;">
                            <em style="float: left; width: calc(100% - 29px); font-style: normal;">${goods.fullName}</em>
                            <a style="padding-right: 0 !important;" goodsId="${goods.id}" shopId="${goods.shopId}" categoryId="${goods.categoryId}">
                                <img src="${path}/images/add_gwc.png" style="  width: 25px; display: inline;margin-top: 2px;" class="add-gwc">
                            </a>
                        </p>
                    </div>
                    <span style="text-decoration:inherit;margin-left:12px;font-size: 13px;color: #999;">销量:<#if goods.sales??>${goods.sales}<#else>0</#if></span>
                    <span style="text-decoration:inherit;margin-left:5px;font-size: 13px;color: #999;">评论:<#if goods.scoreCount??>${goods.scoreCount}<#else>0</#if></span><br>
                    <span class="seckill-new-price" style="display:initial;margin-left:10px;">
						<#if (goods.price?exists)>￥${goods.price?string('##0.00')} <#else >￥0.00</#if>
                    </span>
                    <span class="seckill-original-price" style="display:initial;margin-left:10px;">
						<#if (goods.marketPrice?exists)>￥${goods.marketPrice?string('##0.00')} <#else >￥0.00</#if>
                    </span>
                </div>
            </div>
		</#list>
    </div>
</div>
</#list>
<#--热卖商品等等结束-->

<#--产品列表-->
<#list typeList as child>
<div class="guess-you-like">
    <header>
        <div class="header-position i_${child["catelog"].id}" catelogId="${child["catelog"].id}">
            <div class="header-line"></div>
            <div class="header-text" catelogId="${child["catelog"].id}"><span class="text" catelogId="${child["catelog"].id}">${child["catelog"].name}</div>
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
                        <img attr="lazyload" src="${picloading}" data-original="${goodschild.pic}_200x150.png"
                             alt="${goodschild.fullName}">
                    </a>
                </div>
                <div class="info">
                    <p style="position: relative;"><a href="${base}/item/whichapp/${goodschild.id}.html" style="width: calc(100% - 31px);
"> ${goodschild.name}</a>
                        <a style="padding-right: 0 !important;" class="add-gwc" goodsId="${goodschild.id}" shopId="${goodschild.shopId}" categoryId="${goodschild.categoryId}">
                            <img src="${path}/images/add_gwc.png" style="width: 25px;  display: inline;"></a>
                        </p>

                    <div class="extra">
                        <span style="text-decoration:inherit;margin-left:5px;">销量:<#if goodschild.sales??>${goodschild.sales}<#else>0</#if></span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="text-decoration:inherit">评论:<#if goodschild.scoreCount??>${goodschild.scoreCount}<#else>0</#if></span><br>
                        <strong>￥${goodschild.price?string('##0.00')}</strong></br>
                        <span>
							<#if (goodschild.marketPrice?exists) >
                                ￥${goodschild.marketPrice?string('##0.00')} <#else >￥0.00</#if>
                        </span>
                    </div>
                </div>
            </li>
		</#list>
    </ul>
</div>
</#list>
<#--产品列表结束-->
<#--尾部信息-->
<div class="foot">
    <div class="mll-footer-link">
        <div class="viewport">
            <ul>
                <li><a id="JS_footer_login" href="${base}/member/login?whichclient=whichapp">登录</a></li>
                <li><a href="${base}/introduce/whichapp">关于我们</a></li>
                <li><a id="backToTop" href="#silder" class="mui-control-item">返回顶部</a></li>
            </ul>
        </div>
    </div>
    <div class="mll-footer-icp">西安港进出口商品交易中心电子商务平台</div>
</div>
</div>
<div class="return">
    <a id="backToTop2" style="display: none;" href="#silder" class="mui-control-item"><img
            src="${path}/images/return.png"></a>
</div>
<#--footer-->
<div>
<#include "app/jp/tools.ftl">
</div>


<script src="${path}/js/jquery.lazyload.min.js"></script>
<script src="${path}/js/owlcarousel/owl.carousel.js?v=beta.1.8"></script>
<script>
    function s(key) {
        if (key != undefined && key != "" && key != "请输入您要找的商品名称") {
            jumpto(hosturl+"/search/s/"+encodeURI(encodeURI(key.replace("/",""))) + "?whichclient=whichapp&orderBy=sales&order=desc&from=app_index");
        }
    }
    (function (mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        var slider = mui("#slider").slider({interval: 15000});
        jQuery("#search").blur(function () {
            s(jQuery(this).val());
        });
        setTimeout(function () {
            if (ismobile && typeof(plus) != 'undefined') {
                plus.navigator.closeSplashscreen();
            }
        }, 600);
        //添加当语音输入完成后执行搜索事件
        document.getElementById("search").addEventListener('recognized', function (e) {
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
            jQuery(".owltabs").hide();
            var href = e.target.href;
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
    function go(url) {
        window.location.href = fullpath + url;
//        alert(fullpath + url)
//        jumpto(fullpath + url);
    }
    $(window).scroll(function () {
        if ($(window).scrollTop() > 100) {
            $("#backToTop2").fadeIn(500);
        } else {
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
<#include "app/jp/panel.ftl">

</head>
</body>
</html>
