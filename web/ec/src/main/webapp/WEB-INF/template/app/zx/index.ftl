<!DOCTYPE html>
<html>
<head>
    <#include "app/zx/head.ftl">
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
       .guess-you-like header .header-position .header-more a { color:#666;}
       .mui-bar .mui-input-row .mui-input-clear~.mui-icon-clear, .mui-bar .mui-input-row .mui-input-speech~.mui-icon-speech {
           top: 4px;!important;
           right: 0px;!important;
       }



   </style>


</head>
<body>

<header class="mui-bar mui-bar-nav" >
    <#--<div class="mui-pull-left fonts logo-font" style="width: 80px;" >
    &lt;#&ndash;<@spring.message "project_short_name"/>&ndash;&gt;&nbsp;&nbsp;&nbsp;

    </div>-->
    <div class="mui-pull-left"> <img src="${path}/images/zlogo.png" style=" display:block; margin-top: 5px; "> </div>
    <div class="mui-title" style="left:80px;">
        <div class="mui-input-row">
            <form action="#" id="searchForm" method="post">
            <input id="search" name="keyword" style="min-width: 100px;text-align:left" type="search" onkeydown="javascript:if(event.keyCode==13){ s(document.getElementById('search').value);return false;}" class="mui-input-speech mui-input-clear" placeholder="请输入商品名称">
            </form>
        </div>
    </div>
    <div class="mui-pull-right">
        <#--<a id="setting" class="mui-icon mui-icon-bars" href="${base}/allSort?whichclient=whichapp"></a>-->
            <a id="setting" class="mui-icon mui-icon-contact" href="${base}/member/index?whichclient=whichapp"></a>
    </div>
</header>
 <div class="mui-content" id="topbar">
     <div id="slider" class="mui-slider" style="margin-top: 14px">
        <div class="mui-slider-group mui-slider-loop">
        <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
            <#assign lastImg = adslides?last>
            <div class="mui-slider-item mui-slider-item-duplicate">
                <img src="${lastImg.pic}@370w_155h_db.png" alt="${lastImg.description}">
            </div>
            <#list adslides as slideitem>
                <div class="mui-slider-item mui-slider-item-duplicate">
                     <img src="${slideitem.pic}@370w_155h_db.png" alt="${slideitem.description}">
                </div>
            </#list>
            <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
            <div class="mui-slider-item mui-slider-item-duplicate">
            <#assign firstImg = adslides?first>
                 <img src="${firstImg.pic}@370w_155h_db.png" alt="${firstImg.description}">
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
    <div class="f-cb ico-link fonts">
        <div class="f-fl"> <a href="javascript:go('/allSort?whichclient=whichapp')"><img src="${path}/images/spfl_icon.png"><br>
            商品分类</a> </div>
        <div class="f-fl"> <a href="javascript:go('/shop/brandShop?pageSize=8&')"><img src="${path}/images/zsrz_icon.png"><br>
            世界名品</a> </div>
        <div class="f-fl"> <a href="javascript:go('/cart/list?whichclient=whichapp&isLogin=${isLogin}')"><img src="${path}/images/gwc_icon.png"><br>
            购物车</a> </div>
        <div class="f-fl"> <a href="javascript:go('/member/index?whichclient=whichapp')"><img src="${path}/images/gywm_ico.png"><br>
            个人中心</a></div>
    </div>
    <#--<div class="gg">
    <#list typeList as child>
        <#if (child_index > 2) > <#break> </#if>
        <a class="gg_item" href="${child['floor_left_'+'${child_index+1}'+'_1'].link}?whichclient=whichapp" target="_blank">
            <img attr="lazyload" src="${picloading}" data-original="${child['floor_left_'+'${child_index+1}'+'_1'].pic}<#if (child_index % 3) == 0>_160x160.png<#else>_160x80.png </#if>"></a>
    </#list>
    </div>-->

    <#--导航栏目-->
    <div id="segmentedControl" class="mui-segmented-control fonts">
        <#list tagList as tagListMap>
            <a name="navTab" class="mui-control-item <#if tagListMap_index==0> mui-active</#if> " href="#item${tagListMap_index+1}mobile"> ${tagListMap["name"]} </a>
        </#list>
    </div>
     <#--导航栏目结束-->


    <#--热卖商品等等-->
    <#list tagGoodsList as tagGoodsMap>
    <div id="item${tagGoodsMap_index+1}mobile" class="tabs" style="display:<#if tagGoodsMap_index==0>block<#else>none</#if>">
        <ul id="seckillul" class="seckill-new-list">
        <#list tagGoodsMap["goodsList"] as goods>
            <#if (goods_index > 2) > <#break> </#if>
            <li class="seckill-new-item">
                <div class="seckill-item-img">
                    <a href="${base}/item/whichapp/${goods.id}.html" title="${goods.fullName}" class="seckill-link J_ping">
                        <#if tagGoodsMap_index == 0>
                            <img width="100%" alt="${goods.fullName}" src= "${goods.pic}_200x150.png"  border="0" class="seckill-photo">
                        <#else >
                            <img width="100%" attr="lazyload" alt="${goods.name}" src="${picloading}" data-original="${goods.pic}_200x150.png"  border="0" class="seckill-photo">
                        </#if>
                    </a>
                </div>
                <div class="seckill-item-price">
                    <span class="seckill-new-price">
                        <#if (goods.price?exists)>￥${goods.price?string('##0.00')} <#else >￥0.00</#if>
                    </span>
                    <span class="seckill-original-price">
                        <#if (goods.marketPrice?exists) && goods.marketPrice != "0" && goods.marketPrice != "0.00">
                        <#if (goods.marketPrice?exists)>￥${goods.marketPrice?string('##0.00')} <#else >￥0.00</#if></#if>
                    </span>
                </div>
            </li>
        </#list>
        </ul>
    </div>
    </#list>
     <#--热卖商品等等结束-->
    <#--产品列表-->
    <#list typeList as child>
    <div class="guess-you-like">
        <header>
            <div class="header-position">
                <div class="header-line"></div>
                <div class="header-text"><span class="text">${child["catelog"].name}</div>
                <div class="header-more">
                    <a href="${base}/list/whichapp/${child["catelog"].id}.html">更多<span class="arrow"></span></a>
                </div>
            </div>
        </header>
        <ul id="JS_guess_you_like_list" class="clearfix">
            <#list child["goodschildList"] as goodschild><#if (goodschild_index > 5) > <#break> </#if>
            <li>
                <div class="face">
                    <a href="${base}/item/whichapp/${goodschild.id}.html">
                        <img attr="lazyload" src="${picloading}" data-original="${goodschild.pic}_200x150.png" alt="${goodschild.fullName}">
                    </a>
                </div>
                <div class="info">
                    <p><a href="${base}/item/whichapp/${goodschild.id}.html"> ${goodschild.name}</a></p>
                    <div class="extra">
                        <strong>￥${goodschild.price?string('##0.00')}</strong><br>
                        <span>
                            <#if (goodschild.marketPrice?exists) > ￥${goodschild.marketPrice?string('##0.00')} <#else >￥0.00</#if>
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
        <div class="mll-footer-link"><div class="viewport">
            <ul>
                <li><a id="JS_footer_login" href="${base}/member/login?whichclient=whichapp">登录</a></li>
                <li><a href="${base}/introduce/whichapp">关于我们</a></li>
                <li><a id="backToTop" href="#silder" class="mui-control-item">返回顶部</a></li>
            </ul>
        </div></div>
        <div class="mll-footer-icp">众信百货电子商务平台</div>
    </div>
</div>
<div class="return" >
    <a id="backToTop2" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>
<#--footer-->
<div>
    <#include "app/zx/tools.ftl">
</div>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    function s(key) {
        if (key != undefined && key != "" && key != "请输入您要找的商品名称") {
          /*jumpto(hosturl+"/search/sa?keyword=" + encodeURI(encodeURI(key.replace("/",""))));*/
            $("#searchForm").attr("action",hosturl+"/search/sa");
            $("#searchForm").submit();
        }else{
            if(ismobile) {
                plus.nativeUI.toast("请输入您要找的商品名称！");
            }else{
                alert("请输入您要找的商品名称！")
            }
        }
    }
    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack:true
        });
        var slider = mui("#slider").slider({interval: 1500});
        jQuery("#search").blur(function(){
            s(jQuery(this).val());
        });
        setTimeout(function() {
            if(ismobile && typeof(plus)!='undefined'){
                plus.navigator.closeSplashscreen();
            }
        }, 600);
        //添加当语音输入完成后执行搜索事件
        document.getElementById("search").addEventListener('recognized',function(e){
            s(jQuery(this).val());
        })

        var backButtonPress = 0;
        mui.back = function(event) {
            backButtonPress++;
            if (backButtonPress > 1) {
                plus.runtime.quit();
            } else {
                popAlert('再按一次退出应用');
            }
            setTimeout(function() {
                backButtonPress = 0;
            }, 1000);
            return false;
        }
        jQuery.each(jQuery("a[name='navTab']"), function(i, tab){
            if(i != 0){
                var href = tab.href;
                var tabId = '#' + href.split('#')[1];

                jQuery(tabId + ' img').lazyload({
                    effect: "fadeIn",
                    event : "sporty"
                });
            }
        });

        jQuery("a[name='navTab']").bind("tap", function(e){
            jQuery("div .tabs").hide();
            var href = e.target.href;
            var tabId = '#' + href.split('#')[1];
            jQuery(tabId).show();
        });

       jQuery("img[attr='lazyload']").lazyload({
            threshold : 20,
            effect: "fadeIn"
        });

        jQuery("a[name='navTab']").bind("tap", function(e){
            var href = e.target.href;
            var tabId = '#' + href.split('#')[1];
            jQuery(tabId + ' img').trigger("sporty");
        });

        jQuery('#backToTop').bind("tap", function(){
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });
        jQuery('#backToTop2').bind("tap", function(){
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
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
</script>
</head>
</body>
</html>
