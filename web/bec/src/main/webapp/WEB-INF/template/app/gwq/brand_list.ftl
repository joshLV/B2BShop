<!DOCTYPE html>
<html>
    <head>
    <#include "app/gwq/head.ftl">
        <#--世界名品列表样式-->
        <style>
            .brand_list
            {  padding: 0 .125rem; margin-top: 48px;  overflow: hidden;
            }
            .brand_list li {
                width: 50%;
                margin-bottom: .5rem;
                padding-left: .185rem;
                padding-right: .185rem;
                float: left;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                -ms-box-sizing: border-box;
                box-sizing: border-box;
            }
            .brand_list li .face {
                overflow: hidden; background:#fff;
            }
            .brand_list li .face img {
                width: 100%;
                webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                -ms-box-sizing: border-box;
                box-sizing: border-box;
            }
            .brand_list li .info {
                padding: 8px 5px 8px 5px;
                background: #fff;
            }
            .brand_list li .info p {
                font-size: 14px;
                color: #666;
                height: 20px;
                line-height: 20px;
                overflow: hidden;
                padding-bottom: 3px; text-align:center; margin-bottom:0!important;
            }
        </style>
</head>
	<!--页眉-->
<body style="padding-bottom:55px;">
    <header class="mui-bar mui-bar-nav">
            <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
                <span class="mui-icon mui-icon-left-nav"></span>
            </button>
            <div class="mui-center mui-title ">
                世界名品列表
            </div>
        </header>
    <div class="mui-content" id="content">
<#--世界名品列表-->
    <ul class="brand_list" id="top" style="margin-top: 45px;">
        <#list indexShopList as indexShop>
        <li>
            <div class="face">
                <#--jp 适用<a href="${base}/shop/${indexShop.urlAddress}.html?whichclient=whichapp">-->
                <a href="${base}/search/sa?keyword=${indexShop.name}&from=brand_list">
                    <img src="<#if indexShop.pic ? exists>${indexShop.pic}_400x300.png<#else >${picloading}</#if>" alt="${indexShop.name}">
                </a>
            </div>
            <div class="info">
                <p><a href="${base}/search/sa?keyword=${indexShop.name}">${indexShop.name}</a></p>
                <#--<p><a href="${base}/shop/${indexShop.urlAddress}.html?whichclient=whichapp">${indexShop.name}</a></p>-->
            </div>
        </li>
        </#list>
    </ul>

    <div class="checkout_btn">
        <a id="loadmore" class="gray_btn" class="mui-control-item" href="#buttom" style="background-color:#F4F4F4;">上拉加载更多</a>
    </div>
    <div id="buttom"></div>
    <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
    <input type="hidden" id="pageCount" value="${pager.pageCount}"/>
    <input type="hidden" id="pageSize" value="${pager.pageSize}"/>
    </div>
    <div class="return">
        <a id="backToTop" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
    </div>


    <#include "app/gwq/tools.ftl">
<script>
    (function (mui, doc) {
        mui.back = function(){
            jumpto(fullpath + "/app_index");
        };
        mui.init({
            statusBarBackground: '#f4f4f4',
            swipeBack: true
        });
        var loadop=true;
        loadData = function(){
            jQuery("#loadmore").html("<img src='${base}/static/app/jp/images/loading.gif'>");

            var pageNumber = parseInt(jQuery("#pageNumber").val());
            var pageCount = parseInt(jQuery("#pageCount").val());
            var pageSize = parseInt(jQuery("#pageSize").val());

            pageNumber = pageNumber + 1;
            var url = fullpath + "/shop/brandShop/loadmore";
            jQuery.ajax({
                type: "post",
                url: url,
                data: {'pageNumber': pageNumber,'pageSize': pageSize},
                datatype: 'json',
                success: function(data) {
                    if(data.status == 'success'){
                        if(typeof (data.data) == 'undefined' || data.data.length == 0){
                            jQuery("#loadmore").attr("style","background-color:#ddd")
                            jQuery("#loadmore").html("没有更多商品了");
                            loadop=false;
                            return;
                        }

                        jQuery("#pageNumber").val(data.pager.pageNumber);
                        jQuery("#pageCount").val(data.pager.pageCount);
                        jQuery.each(data.data, function(index, shop){
                            var lastDomShop = jQuery("ul li").last();
                            var domShop = lastDomShop.clone();
                            jQuery(domShop).find("a").prop('href', fullpath + "/search/sa?keyword=" + shop.name);
                            <#--jp 适用jQuery(domShop).find("a").prop('href', fullpath + "/shop/" + shop.urlAddress+ ".html?whichclient=whichapp");-->
                            jQuery(domShop).find("img").prop('src', shop.pic + "_400x300.png");
                            jQuery(domShop).find("img").prop('alt', shop.name);
                            jQuery(domShop).find("a").last().html(shop.name);
                            lastDomShop.after(domShop);

                        });
                        loadop=true;
                    }else{
                        jQuery("#loadmore").attr("style","background-color:#ddd")
                        jQuery("#loadmore").html("加载失败，稍后再试");
                    }
                },
                error:function(data){
                    jQuery("#loadmore").attr("style","background-color:#ddd")
                    jQuery("#loadmore").html("加载失败，稍后再试");
                }
            });
        };


        var screenheight = window.screen.availHeight; //获取屏幕高
        jQuery(window).scroll(function(){
            if (jQuery(window).scrollTop()>100){
                jQuery("#backToTop").fadeIn(500);
            }else{
                jQuery("#backToTop").fadeOut(500);
            }
            var scr = jQuery(window).scrollTop();
            var conH=document.getElementById("content").offsetHeight;//获取内如高度
            if(screenheight+scr>conH-100){
                if(loadop){
                    loadData();
                }
            }
        });
        jQuery('#backToTop').bind("tap", function(){
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });
    }(mui, document));

</script>
</body>
</html>
