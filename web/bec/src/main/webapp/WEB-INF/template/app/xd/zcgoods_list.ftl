<!DOCTYPE html>
<html>
<head>
<#include "app/xd/head.ftl">
    <link href="${path}/theme/red/xd_style.css" rel="stylesheet"/>

    <style>

        .guess-you-like header .header-position .header-more {
            position: absolute;
            right: 0;
            padding-left: 8px;
            padding-right: 25px;
            top: 0px;
            background: #f4f4f4;
            font-size: 14px;
        }

        .guess-you-like header .header-position .header-more span.arrow {
            width: 7px;
            position: absolute;
            right: 0;
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
            margin-top: 6px;
        }

        .guess-you-like header .header-position .header-more a {
            color: #666;
        }

        .mui-content {
            padding-bottom: 0 !important;
        }
    </style>

</head>
<body>
<header>
    <div class="logo" style="text-align: center;position: initial;float:initial"><a href="javascript:jumpto(fullpath+'/zcgoods/list.html')">众筹商品</a></div>
    <div class="user"><a href="javascript:jumpto(fullpath+'/member/index?whichclient=whichapp')">用户</a></div>
</header>
<div id="content" style="margin-top: 48px;">
<#--<div class="mui-content" id="topbar">-->
    <#--<div id="slider" class="mui-slider">-->
        <#--<div class="mui-slider-group mui-slider-loop">-->
            <#--&lt;#&ndash; 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) &ndash;&gt;-->
            <#--<div class="mui-slider-item mui-slider-item-duplicate">-->
                <#--<#assign lastImg = adslides?last>-->
                <#--<img src="${lastImg.pic}@370w_165h_2e.png" alt="${lastImg.description}">-->
            <#--</div>-->
            <#--<#list adslides as slideitem>-->
            <#--<div class="mui-slider-item mui-slider-item-duplicate">-->
                <#--<img src="${slideitem.pic}@370w_165h_2e.png" alt="${slideitem.description}">-->
            <#--</div>-->
            <#--</#list>-->
            <#--&lt;#&ndash; 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) &ndash;&gt;-->
            <#--<div class="mui-slider-item mui-slider-item-duplicate">-->
            <#--<#assign firstImg = adslides?first>-->
                <#--<img src="${firstImg.pic}@370w_165h_2e.png" alt="">-->
            <#--</div>-->
        <#--</div>-->

        <#--&lt;#&ndash; 轮播图片下面的小点 &ndash;&gt;-->
        <#--<div class="mui-slider-indicator">-->
        <#--<#list adslides as slideitem>-->
            <#--<#if slideitem_index == 0>-->
                <#--<div class="mui-active mui-indicator"></div>-->
            <#--<#else>-->
                <#--<div class="mui-indicator"></div>-->
            <#--</#if>-->
        <#--</#list>-->
        <#--</div>-->
    <#--</div>-->

<#--</div>-->
<#--产品列表-->
<section>
    <ul class="pro_list" id="pro_list">
        <#if zcgoodsList?size==0>
            <li style="width: 100%;font-size: 14px;text-align: center">没有众筹商品！</li>
        </#if>
        <#list zcgoodsList as goods>
        <#assign zcgoods = goods["goods"]/>
        <li>
            <h2><em>原点</em><a href="${base}/zcgoods/detail/${zcgoods.id}.html">${zcgoods.fullName}</a></h2>
            <div class="pro_pic">
                <div><a href="${base}/zcgoods/detail/${zcgoods.id}.html">
                    <#if zcgoods.pic?exists>
                        <img src="${zcgoods.pic}@370w_200h.png">
                    <#else>
                        <img src="${path}/images/loaderror.png">
                    </#if>
                </a></div>
                <div class="pro_pic_bg">
                    <#if (zcgoods.zcStartTime?datetime gt now?datetime) >
                        <span class="fl state_ks">即将开始</span>
                        <span class="fr">开始日期:${zcgoods.zcStartTime?string("yyyy年MM月dd日")}</span>
                    <#elseif zcgoods.zcEndTime?datetime lt now?datetime>
                        <#assign  ycje=goods["ycje"]/>
                        <#assign  threshold=zcgoods.threshold/10000/>
                        <#if threshold gt ycje>
                            <span class="fl state state_sb">失败</span>
                        <#else>
                            <span class="fl state state_ok">已达成</span>
                        </#if>
                        <span class="fr">截止日期:${zcgoods.zcEndTime?string("yyyy年MM月dd日")}</span>
                    <#else>
                        <span class="fl state">众筹中</span>
                        <span class="fr">截止日期:${zcgoods.zcEndTime?string("yyyy年MM月dd日")}</span>
                    </#if>

                </div>
            </div>
            <!--<#assign  threshold=goods["threshold"]/10000/>
            <h3>目标金额：<font style="font-size: 16px; color: #e12f45; font-weight: bold;">${threshold?string(priceCurrencyFormat)}万元</font></h3>-->
	    <h3>目标金额：<font style="font-size: 16px; color: #e12f45; font-weight: bold;">${goods.mbje}万元</font></h3>
            <div class="jindu">
                <div class="progress_container">
                    <div class="progress_bar tip finished" progress="${goods["zcbfb"]}"
                    style='width:${goods["zcbfb_progress"]}%;'></div>
                </div>
                <ul>
                    <#--<li><span class="gotham zcrs">${goods["zcrs"]}</span><br>下单人数</li>-->
                    <li><span class="gotham zcrs"><#if goods["ycje"]?number&lt;1>${goods["ycjeY"]}元<#else>￥${goods["ycje"]}万元</#if> </span><br>已筹金额</li>
		    
                    <li><span class="gotham zcbfb">${goods["zcbfb"]}%</span><br>已达成比例</li>
                    <li><span class="syts"><#if 1== goods["syts"]>${goods["sysj"]}<#else>${goods["syts"]}</#if></span><br><label><#if 1== goods["syts"]>剩余时间<#else>剩余天数</#if></label></li>
                </ul>
            </div>
        </li>
        </#list>



    </ul>

</section>
<#--产品列表结束-->
<footer>
    <p>Copyright&nbsp;©&nbsp;2015&nbsp;&nbsp;喜都</p>
</footer>
<#include "app/xd/tools.ftl">
<div class="return">
    <a id="backToTop2" style="display: none;" href="#silder" class="mui-control-item"><img
            src="${path}/images/return.png"></a>
</div>

<input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
<input type="hidden" id="pageCount" value="${pager.pageCount}"/>
<input type="hidden" id="pageSize" value="${pager.pageSize}"/>
<input type="hidden" id="orderBy" value="${pager.orderBy}"/>
<input type="hidden" id="orderType" value="${pager.orderType}"/>
<div class="checkout_btn">
    <a id="loadmore" class="gray_btn mui-control-item"href="#buttom" style="background-color:#F4F4F4;">上拉加载更多</a>
</div>
</div>
<section  style="display: none;">
    <ul class="pro_list" id="template">
        <li>
            <h2><em>原点</em><a href="product_info.html">氧宝宝消毒机 钻石打造</a></h2>
            <div class="pro_pic">
                <div class="pro_pic_img"><a href="#"><img src="${path}/images/pic3.jpg"></a></div>
                <div class="pro_pic_bg">
                    <#--<span class="fl state state_ok">已达成</span>
                    <span class="fr">2015年12月27日</span>-->
                </div>
            </div>
            <h3 id="threshold">目标金额：￥102.7万</h3>
            <div class="jindu">
                <div class="progress_container">
                    <#--<div class="progress_bar" progress="100" style="width: 100%;"></div>-->
                </div>
                <ul>
                    <#--<li><span class="gotham zcrs">3193</span><br>下单人数</li>-->
                    <li><span class="gotham zcrs">3193</span><br>已筹金额</li>
			

                    <li><span class="gotham zcbfb">100%</span><br>已达成比例</li>
                    <li><span class="syts">2</span><br><label class="syts_label">剩余天数</label></li>
                </ul>
            </div>
        </li>
    </ul>
</section>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    (function (mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });

        var backButtonPress = 0;
        mui.back = function (event) {
            backButtonPress++;
            if (backButtonPress > 1) {
                plus.runtime.quit();
            } else {
                popAlert('再按一次退出应用');
            }
            setTimeout(function () {
                backButtonPress = 0;
            }, 1000);
            return false;
        };

        //var slider = mui("#slider").slider({interval: 1500});
        jQuery(".pro_list").lazyload({
            threshold : 20,
            effect: "fadeIn"
        });


        jQuery('#backToTop').bind("tap", function () {
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });
        jQuery('#backToTop2').bind("tap", function () {
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });
        fmoney = function (s, n) {
            if (!jQuery.isNumeric(s)) {
                return "0.00";
            }
            n = n > 0 && n <= 20 ? n : 2;
            s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
            return s;
        };

        leftPad = function (tbl) {
            return function (num, n) {
                return (0 >= (n = n - num.toString().length)) ? num : (tbl[n] || (tbl[n] = Array(n + 1).join(0))) + num;
            }
        }([]);
        dateFormat = function (now, type) {
            var date = new Date(now)
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();
            var hour = date.getHours();
            var minute = date.getMinutes();
            var second = date.getSeconds();
            if(type == 1 ){
                return year + "年"
                        + leftPad(month, 2) + "月"
                        + leftPad(day, 2) + "日";
            }else if( type == 2){
                return leftPad(hour, 2) + ":"
                        + leftPad(minute, 2);
            }else{
                return year + "-"
                        + leftPad(month, 2) + "-"
                        + leftPad(day, 2) + " "
                        + leftPad(hour, 2) + ":"
                        + leftPad(minute, 2) + ":"
                        + leftPad(second, 2);
            }

        };


    }(mui, document));
    function go(url) {
        jumpto(fullpath + url);
    }
    $(window).scroll(function () {
        if ($(window).scrollTop() > 100) {
            $("#backToTop2").fadeIn(500);
        } else {
            $("#backToTop2").fadeOut(500);
        }
    });

    var loadop=true;
    var screenheight = window.screen.availHeight; //获取屏幕高
    $(window).scroll(function(){
        if ($(window).scrollTop()>100){
            $("#backToTop").fadeIn(500);
        }else{
            $("#backToTop").fadeOut(500);
        }
        var scr = $(window).scrollTop();
        var conH=document.getElementById("content").offsetHeight;//获取内如高度
        if(screenheight+scr>conH-100){
            if(loadop){
                loadData();
            }
        }
    });


    function loadData(){
        loadop=false;

        var pageNumber = parseInt(jQuery("#pageNumber").val());
        var pageSize = parseInt(jQuery("#pageSize").val());

        var currStatus = jQuery("#currStatus").val();
        pageNumber = pageNumber + 1;
        var url = fullpath + "/zcgoods/ajax/loadmore";
        jQuery.ajax({
            type: "post",
            url: url,
            data: {
                'pageNumber': pageNumber,
                'pageSize': pageSize,
                'status': currStatus
            },
            datatype: 'json',
            success: function (data) {
                if (data.status == 'success') {
                    if (typeof(data.zcgoodsList) == 'undefined' || data.zcgoodsList.length == 0) {
                        jQuery("#loadmore").attr("style", "background-color:#ddd")
                        jQuery("#loadmore").html("没有更多商品了");
                        loadop = false;
                        return;
                    }
                    jQuery("#pageNumber").val(data.pageNumber);
                    jQuery("#pageCount").val(data.pageCount);
                    jQuery.each(data.zcgoodsList, function (index, zcgoods) {
                        // -----create templatedl-----
                        var templatedl = jQuery("#template > li").clone();
                        jQuery(templatedl).find("a").first().html(zcgoods.goods.fullName);
                        jQuery(templatedl).find("a").prop('href', fullpath + '/zcgoods/detail/' + zcgoods.goods.id + '.html');
                        if(typeof(zcgoods.goods.pic) == 'undefined'){
                            jQuery(templatedl).find("a").last().html('<img src="' + fullpath + '/static/app/xd/images/loaderror.png"/>');
                        }else{
                            jQuery(templatedl).find("a").last().html('<img src="' + zcgoods.goods.pic + '@370w_200h.png"/>');
                        }
                        if( dateFormat(zcgoods.goods.zcStartTime) > dateFormat(data.now)){
                            jQuery('<span/>').addClass('fl')
                                    .addClass('state_ks')
                                    .html('即将开始')
                                    .appendTo(jQuery(templatedl).find('.pro_pic_bg'));
                            jQuery('<span/>').addClass('fr')
                                    .html('开始日期:' + dateFormat(zcgoods.goods.zcStartTime, 1))
                                    .appendTo(jQuery(templatedl).find('.pro_pic_bg'));
                        }else if(dateFormat(zcgoods.goods.zcEndTime) < dateFormat(data.now)){
                            if( zcgoods.goods.threshold > ( zcgoods.ycje * 10000)){
                                jQuery('<span/>').addClass('fl')
                                        .addClass('state')
                                        .addClass('state_sb')
                                        .html('失败')
                                        .appendTo(jQuery(templatedl).find('.pro_pic_bg'));
                            }else{
                                jQuery('<span/>').addClass('fl')
                                        .addClass('state')
                                        .addClass('state_ok')
                                        .html('已达成')
                                        .appendTo(jQuery(templatedl).find('.pro_pic_bg'));
                            }
                            jQuery('<span/>').addClass('fr')
                                    .html('截止日期:' + dateFormat(zcgoods.goods.zcEndTime, 1))
                                    .appendTo(jQuery(templatedl).find('.pro_pic_bg'));
                        }else{
                            jQuery('<span/>').addClass('fl')
                                    .addClass('state')
                                    .html('众筹中')
                                    .appendTo(jQuery(templatedl).find('.pro_pic_bg'));
                            jQuery('<span/>').addClass('fr')
                                    .html('截止日期:' + dateFormat(zcgoods.goods.zcEndTime, 1))
                                    .appendTo(jQuery(templatedl).find('.pro_pic_bg'));
                        }

                        jQuery(templatedl).find('#threshold').html('目标金额：<font style="font-size: 16px; color: #e12f45; font-weight: bold;">￥' + fmoney(zcgoods.threshold/10000) + '万元</font>');

                        jQuery(templatedl).find('.progress_container')
                                .html('<div class="progress_bar" progress="'
                        + zcgoods.zcbfb
                        + '" style="width: ' + zcgoods.zcbfb_progress + '%;"></div>');

                        if(zcgoods.ycje*1<=0){
                            jQuery(templatedl).find('.zcrs').html('￥' + fmoney(zcgoods.ycjeY) +'元');
                        }else{
                            jQuery(templatedl).find('.zcrs').html('￥' + fmoney(zcgoods.ycje) +'万元');
                        }
                        jQuery(templatedl).find('.zcbfb').html(zcgoods.zcbfb_progress + '%');
                        if( 1 == zcgoods.syts){
                            jQuery(templatedl).find('.syts').html(zcgoods.sysj);
                            jQuery(templatedl).find('.syts_label').html('剩余时间');
                        }else{
                            jQuery(templatedl).find('.syts').html(zcgoods.syts);
                            jQuery(templatedl).find('.syts_label').html('剩余天数');
                        }

                        jQuery("#pro_list > li").last().after(templatedl);
                    });
                }else {
                    jQuery("#loadmore").attr("style","background-color:#ddd")
                    jQuery("#loadmore").html("加载失败，稍后再试");
                }
                loadop=true;
            },
            error: function (data) {
                jQuery("#loadmore").attr("style","background-color:#ddd")
                jQuery("#loadmore").html("加载失败，稍后再试");
            }
        });
    };
</script>

</body>
</html>
