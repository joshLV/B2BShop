<!DOCTYPE html>
<html>
<head>
    <#include "app/xd/head.ftl">
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




   </style>


</head>
<body>

<header class="mui-bar mui-bar-nav" >
    <div class="mui-pull-left fonts logo-font" style="width: 80px;" >
    <#--<@spring.message "project_short_name"/>-->&nbsp;&nbsp;&nbsp;
        <img src="${path}/images/zlogo_03.png"  style=" display:block; margin-top: -42px; width: 75px; height: 40px;">


    </div>
    <div class="mui-title" style="left:100px;">
        <div class="mui-input-row">
            <input id="search" style=" min-width: 100px;text-align:left; padding-left: 35px;" type="search" onkeydown="javascript:if(event.keyCode==13){ s(document.getElementById('search').value);return false;}" class="mui-input-clear" placeholder="请输入商品名称">
            <button class="iconfont am-icon-search" type="submit"></button>
            <div style="position: absolute; left: 8px; top: 0;"><img src="${path}/images/ss.png" width="22" height="22"> </div>
        </div>
    </div>
    <div class="mui-pull-right"> <a id="setting" class="mui-icon mui-icon-bars" href="${base}/allSort?whichclient=whichapp"></a> </div>
</header>
 <div class="mui-content" id="topbar">
     <div id="slider" class="mui-slider" style="margin-top: 14px">
        <div class="mui-slider-group mui-slider-loop">
        <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
            <#assign lastImg = adslides?last>
            <div class="mui-slider-item mui-slider-item-duplicate">
                <img src="${lastImg.mobilepic}@370w_200h_2e.png" alt="${lastImg.description}">
            </div>
            <#list adslides as slideitem>
                <div class="mui-slider-item mui-slider-item-duplicate">
                     <img src="${slideitem.mobilepic}@370w_200h_2e.png" alt="${slideitem.description}">
                </div>
            </#list>
            <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
            <div class="mui-slider-item mui-slider-item-duplicate">
            <#assign firstImg = adslides?first>
                 <img src="${firstImg.mobilepic}@370w_200h_2e.png" alt="">
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

     <!--定位地址-->
     <input type="hidden" value="" id="atitude"><!--纬度-->
     <input type="hidden" value="" id="longitude"><!--经度-->
<#--    <div style="text-align: center;height: 65px;">
        <h6><span class="mui-icon mui-icon-location"></span></h6>
        <span style="font-size: 14px;background-color: #d3d3d3;border-radius:10px;height: 20px;color: #3c3c3c;padding: 1px 10px;" ><font id="defauleAddress">正在获取地理位置信息...</font><span style="font-size: 16px;" class="mui-icon mui-icon-arrowdown" onclick="showRigthPanel()"></span></span>

    </div>-->
    <#--导航-->
    <div class="f-cb ico-link fonts">
        <div class="f-fl"> <a href="javascript:go('/allSort?whichclient=whichapp')"><img src="${path}/images/spfl_icon.png"><br>
            商品分类</a> </div>
       <div class="f-fl"> <a href="javascript:go('/join/whichapp')"><img src="${path}/images/zsrz_icon.png"><br>
            招商入驻</a> </div>
      <#--  <div class="f-fl"> <a href="javascript:gofujinsj()"><img src="${path}/images/zsrz_icon.png"><br>
            附近商家</a> </div>-->
        <div class="f-fl"> <a href="javascript:go('/cart/list?whichclient=whichapp&isLogin=${isLogin}')"><img src="${path}/images/gwc_icon.png"><br>
            购物车</a> </div>
        <div class="f-fl"> <a href="javascript:go('/member/index?whichclient=whichapp')"><img src="${path}/images/gywm_ico.png"><br>
            个人中心</a></div>
    </div>
<!--ULife头条-->
<div id="topNews" style="background: #fff;padding: 5px 5px;height: 50px;border-bottom:1px dotted #dfdfdf;margin-top: -10px; display:none">
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
</div>
    <#--<div class="gg">-->
    <#--<#list typeList as child>-->
        <#--<#if (child_index > 2) > <#break> </#if>-->
        <#--<a class="gg_item" href="${child['floor_left_'+'${child_index+1}'+'_1'].link}?whichclient=whichapp" target="_blank">-->
            <#--<img attr="lazyload" src="${picloading}" data-original="${child['floor_left_'+'${child_index+1}'+'_1'].pic}<#if (child_index % 3) == 0>_160x160.png<#else>_160x80.png </#if>"></a>-->
    <#--</#list>-->
    <#--</div>-->

<#--导航栏目-->
<div id="segmentedControl" class="mui-segmented-control fonts">
    <a name="owlNavTab" class="mui-control-item  mui-active" href="#item1mobile">本周特价<font class="endtime" value="604800" style="font-size: 12px;">6天13时00分06秒</font></a>
    <a name="owlNavTab" class="mui-control-item  " href="#item2mobile">新品推荐</a>
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
                            <img width="100%" alt="${goods.fullName}" src= "${goods.pic}@300w_250h.png"  border="0" class="seckill-photo">
                        <#else >
                            <img width="100%" attr="lazyload" alt="${goods.name}" src="${picloading}" data-original="${goods.pic}@300w_250h.png"  border="0" class="seckill-photo">
                        </#if>
                    </a>
                </div>
                <div class="seckill-item-price">
                    <span class="nologin"><span class="seckill-new-price" >仅会员可见！</span></span>
                    <span class="login" style="display: none">
                        <span class="seckill-new-price">
                            <#if (goods.price?exists)>${goods.price?string(priceCurrencyFormat)} <#else >￥0.00</#if>
                        </span>
                        <span class="seckill-original-price">
                            <#if (goods.marketPrice?exists)>${goods.marketPrice?string(priceCurrencyFormat)} <#else >￥0.00</#if>
                        </span>
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
                        <img attr="lazyload" src="${picloading}" data-original="${goodschild.pic}@300w_300h.png" alt="${goodschild.fullName}">
                    </a>
                </div>
                <div class="info">
                    <p><a href="${base}/item/whichapp/${goodschild.id}.html"> ${goodschild.name}</a></p>
                    <div class="extra">
                        <span style="text-decoration:inherit;margin-left:5px;">销量:<#if goodschild.sales??>${goodschild.sales}<#else>0</#if></span>&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="text-decoration:inherit">评论:<#if goodschild.scoreCount??>${goodschild.scoreCount}<#else>0</#if></span><br>
                            <strong class="nologin">仅会员可见！</strong>
                            <strong class="login" style="display: none">￥${goodschild.price?string('##0.00')}</strong></br>
                            <span class="login" style="display: none">
                                <#if (goodschild.marketPrice?exists) >￥${goodschild.marketPrice?string('##0.00')} <#else >￥0.00</#if>
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
        <div class="mll-footer-icp">Copyright © 2015-2016 喜都有限责任公司</div>
    </div>
</div>
<div class="return" >
    <a id="backToTop2" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>
<#--footer-->
<div>
    <#include "app/xd/tools.ftl">
</div>





<style>
    .right_panel{
        color: #fff;
        background: #333;
        position:fixed;
        z-index: 1001;
        top:0;
        bottom:0;
        width:100%;
        min-height:100%;
        visibility:visible;
        transform:translate(150%, 0px);
        -webkit-transform:translate(150%, 0px);
        -ms-transform:translate(150%, 0px);
        -moz-transform:translate(150%, 0px);
        -o-transform:translate(150%, 0px);
        transition:transform 200ms ease;

    }
    .right_panel_into{
        transform:translate(0%, 0px);
        -webkit-transform:translate(0%, 0px);
        -ms-transform:translate(0%, 0px);
        -moz-transform:translate(.%, 0px);
        -o-transform:translate(0%, 0px);
        transition:transform 200ms ease;
    }

    .mask{
        position:fixed;
        left:0;
        top:0;
        z-index:1000;
        height:100%;
        width:100%;
        background:black;
        opacity:0.4;
        filter:alpha(opacity=40)
    }

    .span_{
        line-height: 21px;
        width: 100%;
        height: 40px;
        margin-bottom: 15px;
        padding: 10px 15px;
        -webkit-user-select: text;
        border: 1px solid rgba(0,0,0,.2);
        border-radius: 3px;
        outline: 0;
        background-color: #fff;
        -webkit-appearance: none;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }
    #r-result{width:100%;}
    .tangram-suggestion{
        z-index: 989999;
    }
</style>
<div class="right_panel">
    <div id="l-map"></div>
    <div style="left: 12px;top: 12px; position:absolute" onclick="hideRigthPanel()"><span class="mui-icon mui-icon-arrowleft"></span></div>
    <div  style="margin-bottom: 25px; color:#FFF;margin: 35px 15px 10px;text-align: center">
        <span class="mui-icon mui-icon-location" style="font-size:24px; color:#FFF;margin-left: 0;padding-right:10px;"> <a href="/ec/app_index" style="color:#FFF;font-family: 微软雅黑; font-size: 18px;"><font>西安市</font><span style="font-size: 16px;" class="mui-icon mui-icon-arrowdown" onclick=""></span></a></span>
    </div>
    <ul class="mui-table-view mui-table-view-chevron mui-table-view-inverted" style="background-color: #333;height: 100%;overflow: auto">

        <li class="mui-table-view-cell">
            <span id="r-result"><input type="text" value="" id="suggestId" placeholder="小区、写字楼、学校" ></span>
            <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;z-index: 999999"></div>
        </li>
        <li class="mui-table-view-cell">
             <span class="mui-icon span_" onclick="acAddress(this)" style="font-size:20px; color:#FFF;margin-left: 0;" ><span style="font-size: 20px;" class="mui-icon mui-icon-navigate" ><font style="font-size: 16px;padding-left:5px;font-family:'Microsoft YaHei'" >定位到当前位置</font></span></span>
        </li>

    </ul>
</div>





<script src="${path}/js/jquery.lazyload.min.js"></script>
<script src="${path}/js/owlcarousel/owl.carousel.js?v=beta.1.8"></script>
<script src="${path}/js/immersed.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=HRu1UDXznqmu9izchG1Yl1Tv1PI2wfdu"></script>
<script>
    function s(key) {
        if (key != undefined && key != "" && key != "请输入您要找的商品名称") {
            jumpto(hosturl+"/search/s/"+encodeURI(encodeURI(key.replace("/",""))) + "?whichclient=whichapp&orderBy=sales&order=desc");
        }
    }
    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack:true
        });
        var slider = mui("#slider").slider({interval: 3000});
        jQuery("#search").blur(function(){
            s(jQuery(this).val());
        });
        setTimeout(function() {
            if(ismobile && typeof(plus)!='undefined'){
                plus.navigator.closeSplashscreen();
                getPosBaidu();
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


//------------------------------------------------------------------------------------------
    var watchId;
    function geoInf( position ) {
        var str = "";
        str += "地址："+position.addresses+"\n";//获取地址信息
        var timeflag = position.timestamp;//获取到地理位置信息的时间戳；一个毫秒数；
        str += "时间戳："+timeflag+"\n";
        var codns = position.coords;//获取地理坐标信息；
        var lat = codns.latitude;//获取到当前位置的纬度；
        str += "纬度："+lat+"\n";
        var longt = codns.longitude;//获取到当前位置的经度
        str += "经度："+longt+"\n";
        var alt = codns.altitude;//获取到当前位置的海拔信息；
        str += "海拔："+alt+"\n";
        var accu = codns.accuracy;//地理坐标信息精确度信息；
        str += "精确度："+accu+"\n";
        var altAcc = codns.altitudeAccuracy;//获取海拔信息的精确度；
        str += "海拔精确度："+altAcc+"\n";
        var head = codns.heading;//获取设备的移动方向；
        str += "移动方向："+head+"\n";
        var sped = codns.speed;//获取设备的移动速度；
        str += "移动速度："+sped;
        console.log(JSON.stringify(position));
        console.log(str);

        setChooseVal(position.addresses,lat,longt)

    }
    function getPos() {
        console.log( "获取位置信息:" );
        plus.geolocation.getCurrentPosition( geoInf, function ( e ) {
            console.log( "获取位置信息失败："+e.message );
        } );
    }
    function watchPos() {
        if ( watchId ) {
            return;
        }
        watchId = plus.geolocation.watchPosition( function ( p ) {
            console.log( "监听位置变化信息:" );
            console.log( p );
        }, function ( e ) {
            console.log( "监听位置变化信息失败："+e.message );
        } );
    }
    function clearWatch() {
        if ( watchId ) {
            console.log( "停止监听位置变化信息" );
            plus.geolocation.clearWatch( watchId );
            watchId = null;
        }
    }
    // 通过百度定位模块获取位置信息
    function getPosBaidu(){
        console.log( "获取百度定位位置信息:" );
        plus.geolocation.getCurrentPosition( geoInf, function ( e ) {
            console.log( "获取百度定位位置信息失败："+e.message );
        },{provider:'baidu'});
    }

    //打开手动选择地址的面板
    function showRigthPanel(){
        $(".mask").fadeIn();
        $(".right_panel").addClass("right_panel_into")
        $(document).bind('touchmove',function(e){
            e.preventDefault();
        });
    }
    function hideRigthPanel(){
        $(".mask").fadeOut(80);
        $(".right_panel").removeClass("right_panel_into");
        $(document).unbind()
    }


    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var map = new BMap.Map("l-map");
    map.centerAndZoom("陕西",12);                   // 初始化地图,设置城市和地图级别。

    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
            {"input" : "suggestId"
                ,"location" : map
            });

    ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

        $("#suggestId").blur();//防止选完地址后有弹出输入菜单

        setPlace();
        hideRigthPanel();
    });

    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果

            setChooseVal(myValue,pp.lat,pp.lng);//
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }

    function setChooseVal(value,lat,lng){
        $("#defauleAddress").html(value)
        $("#suggestId").val(value);

        $("#atitude").val(lat);
        $("#longitude").val(lng);

        plus.storage.removeItem("defaule_address");
        plus.storage.removeItem("defaule_atitude");
        plus.storage.removeItem("defaule_longitude");

        plus.storage.setItem("defaule_address",value);
        plus.storage.setItem("defaule_atitude",lat+"");
        plus.storage.setItem("defaule_longitude",lng+"");
        console.log("---------->"+plus.storage.getItem("defaule_address")+"-------"+plus.storage.getItem("defaule_atitude")+"----"+plus.storage.getItem("defaule_longitude"))

        hideRigthPanel();
    }



    var InterValObj; //timer变量，控制时间
    var count = 20; //间隔函数，1秒执行
    var curCount;//当前剩余秒数


    function acAddress(o) {
        curCount = count;
        //设置button效果，开始计时
        $(o).removeAttr("onclick")
        $(o).find("font").html("(" + curCount  + ")定位到当前位置...")
        InterValObj = window.setInterval(SetRemainTime(o), 1000); //启动计时器，1秒执行一次
        //获取位置
        getPosBaidu();
    }


    //timer处理函数
    function SetRemainTime(o) {
        if (curCount == 0) {
            window.clearInterval(InterValObj);//停止计时器
            $(o).attr("onclick","acAddress(this)");
            $(o).find("font").html("定位到当前位置")
        }
        else {
            curCount--;
            $(o).find("font").html("(" + curCount  + ")定位到当前位置...")
        }
    }

    //附近商家
    function gofujinsj(){
        //console.log("---------->"+plus.storage.getItem("defaule_address")+"-------"+plus.storage.getItem("defaule_atitude")+"----"+plus.storage.getItem("defaule_longitude"))
        //var defaule_atitude=plus.storage.getItem("defaule_atitude");
        //var defaule_longitude=plus.storage.getItem("defaule_longitude");
        go("/shopExtend/list4Mob?whichclient=whichapp&atitude=34.23244406047252&longitude=108.8804946441841")
    }



//-----------------------------------------------------------------------------



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
            var time = day+"天";
            time += hour+'时';
            time += minute+'分';
            time += second+'秒';
            $('.endtime').html(time);
            intDiff--;
        }, 1000);
    }


</script>

</head>
</body>
</html>
