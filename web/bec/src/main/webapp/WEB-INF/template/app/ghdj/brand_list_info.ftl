<!DOCTYPE html>
<html>

<head>
<#include "app/ghdj/head.ftl">
<#--世界名品列表样式-->
    <style>
        .brand_list {
            padding: 0 .125rem;
            margin-top: 48px;
            overflow: hidden;
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
            overflow: hidden;
            background: #fff;
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
            padding-bottom: 3px;
            text-align: center;
            margin-bottom: 0 !important;
        }

        .brand_list_info {
            width: 100%;
            overflow: hidden;
            margin-top: 40px;
            overflow: hidden;
        }

        .brand_list_info_pic {
            width: 100%;
            position: relative;
            z-index: -1;
        }

        .brand_list_info_pic h2 {
            font-size: 16px;
            text-align: center;
            height: 40px;
            line-height: 40px;
            background: #fff;
            position: absolute;
            width: 100%;
            padding-left: 8px;
            color: #333;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            margin: 0 !important;
            box-sizing: border-box;
            z-index: 999;
            background: rgba(255, 255, 255, 0.5);
            left: 0;
            bottom: 0px;
        }

        .brand_list_info_pic h3 {
            width: 100%;
            position: relative;
            top: 0;
            z-index: 10;
            margin-top: 0 !important;
            margin-bottom: 0 !important;
        }

        .brand_list_info_pic h3 img {
            width: 100%;
            position: relative;
            top: 0;
        }

        .brand_list_info_con {
            padding: 10px 8px;
            background: #fff;
            overflow: hidden;
            width: 100%;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            height: 100%;
            border-top: solid 1px #d8d8d8;
            border-bottom: solid 1px #d8d8d8;
            margin-bottom: 10px;
        }

        .brand_list_info_con p {
            width: 100%;
            font-size: 15px;
            line-height: 1.8;
            margin-bottom: 0 !important;
        }

        .brand_list_info_con p span {
            color: #555;
            padding-left: 5px;
        }

        .brand_list_info_pro1 {
            background: #fff;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            padding: .625rem;
            width: 100%;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            overflow: hidden;
        }

        .brand_list_info_pro1 ul li {
            padding: 0 .1875rem;
            display: block;
            width: 50%;
            margin-bottom: 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            float: left;
        }

        .brand_list_info_pro1 ul li a {
            position: relative;
            display: block;
            color: #333;
        }

        .brand_list_info_pro1 ul li .p-img {
            text-align: center;
            background: #f1f1f1;
        }

        .brand_list_info_pro1 ul li .p-img img {
            width: 100%;
        }

        .brand_list_info_pro1 ul li .info {
            position: absolute;
            left: 0;
            bottom: 0;
            width: 100%;
            background: rgba(255, 255, 255, 0.8);
            padding: .25rem 0 .25rem .375rem;
        }

        .brand_list_info_pro1 ul li .info .p-info {
            font-size: .813rem;
            line-height: 1.6rem;
            height: 1.6rem;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }

        .brand_list_info_pro1 .info .price {
            float: left;
            font-size: .938rem;
            line-height: 1.063rem;
            height: 1.063rem;
            color: #E4393C;
        }

        .brand_list_info_tit {
            width: 100%;
            margin-bottom: 10px;
            margin-top: 13px;
            overflow: hidden;
        }

        .brand_list_info_tit h2 {
            height: 16px;
            font-weight: normal;
            border-left: 3px solid #E4393C;
            font-size: 16px;
            line-height: 16px;
            padding-left: 6px;
            margin-left: 5px;
            margin-top: 0 !important;
            margin-bottom: 0 !important;
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
        世界名品旗舰店
    </div>
</header>
<div class="mui-content" id="content">
<#--世界名品店铺-->
<#if (shop.status?exists) && (shop.status gt 0)>
<div class="brand_list_info" id="top">
    <div class="brand_list_info_pic">
        <h2>${(shop.shortName)!}</h2>
        <h3><img src="<#if (shopLogo?exists)>${shopLogo}@300h.png<#else >${base}/static/mall/img/default_shop_logo.gif</#if>"></h3>
    </div>
    <div class="brand_list_info_con">
        <p>店铺名称： <span>${(shop.shortName)!}</span></p>

        <p>开店时间： <span>${(shop.createDate?string("yyyy-MM-dd"))!}</span></p>

        <p>联系电话： <span>${(shop.telphone)!}</span></p>

        <p>所在地区： <span>${(shop.areaPath)!}</span></p>

        <p>详细地址：<span>${(shop.address)!}</span></p>
    </div>
    <div class="brand_list_info_tit">
        <h2>掌柜推荐</h2>
    </div>
    <div class="brand_list_info_pro1">
        <ul>
            <#list recommendGoodsList as goods>
                <#if (goods_index > 5)><#break ></#if>
                <li><a href="${base}/item/whichapp/${goods.id}.html">
                    <div class="p-img"><img attr='lazyload' src="${picloading}" data-original="<#if (goods.pic?exists)>${goods.pic}@400w_300h.png}<#else >${picloading}</#if>"
                                            alt="${(goods.fullName)!}"></div>
                    <div class="info">
                        <div class="p-info">${(goods.fullName)!} </div>
                        <div class="flag">
                        <#if priceHide=='hide'>
                            <span class="price">仅会员可见！</span>
                        <#else>
                            <span class="price">
                            <#if (goods.price?exists)>￥${goods.price?string?string('##0.00')} <#else >￥0.00</#if>
                            </span>
                        </#if>
                        </div>
                    </div>
                </a></li>
            </#list>
        </ul>
    </div>
    <div class="brand_list_info_tit">
        <h2>商品列表</h2>
    </div>
    <div class="brand_list_info_pro1">
        <ul>
            <#list pager.list as goods>
                <li class="goods"><a href="${base}/item/whichapp/${goods.id}.html">
                    <div class="p-img"><img src="${picloading}" data-original="<#if (goods.pic?exists)>${goods.pic}@400w_300h.png}<#else >${picloading}</#if>"
                                            attr='lazyload'  alt="${(goods.fullName)!}"></div>
                    <div class="info">
                        <div class="p-info">${(goods.fullName)!}</div>
                        <div class="flag">
                            <span class="nologin"><span style="color: red;font-size: 14px;">仅会员可见！</span></span>
                            <span class="login" style="display: none">
                                <span class="price">
                                <#if (goods.price?exists)>￥${goods.price?string('##0.00')}<#else >￥0.00</#if>
                                </span>
                            </span>
                            </div>
                    </div>
                </a></li>
            </#list>
        </ul>
    </div>
    <div class="checkout_btn">
        <a id="loadmore" class="gray_btn" class="mui-control-item" href="#buttom">加载更多</a>
      <#--  <br>
        <a id="backToTop" class="gray_btn mui-control-item"href="#top">回到顶部</a>-->
    </div>
    <div id="buttom"></div>
</div>
</div>
<div class="return">
    <a id="backToTop" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>


<#else>
<div style="width: 100%;
    height: 400px;
    line-height: 50px;
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    margin-top: 30%;">对不起！您查看的店铺已关闭!<br/>您可以<a href="${base}/app_index" style="color: #0000cc;">去首页</a>选择其他商家的产品！
</div>


</#if>
<input type="hidden" id="shapId" value="${shop.id}"/>
<input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
<input type="hidden" id="pageCount" value="${pager.pageCount}"/>
<input type="hidden" id="pageSize" value="${pager.pageSize}"/>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<#include "app/ghdj/tools.ftl">
<script>
    (function (mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });

        jQuery("img[attr='lazyload']").lazyload({
            threshold: 20,
            effect: "fadeIn"
        });
        fmoney=function (s, n)
        {
            if(!jQuery.isNumeric(s)){
                return "0.00";
            }
            n = n > 0 && n <= 20 ? n : 2;
            s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
            return s;
            /*
            var l = s.split(".")[0].split("").reverse();
            var r = s.split(".")[1];
            t = "";
            for(i = 0; i < l.length; i ++ )
            {
                t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
            }
            return t.split("").reverse().join("") + "." + r;
            */
        };
        var loadop=true;
        loadData = function(){
            jQuery("#loadmore").html("<img src='${base}/static/app/jp/images/loading.gif'>");
            var shapId = jQuery("#shapId").val();
            var pageNumber = parseInt(jQuery("#pageNumber").val());
            var pageCount = parseInt(jQuery("#pageCount").val());
            var pageSize = parseInt(jQuery("#pageSize").val());

            pageNumber = pageNumber + 1;
            var url = fullpath + "/shop/goods/loadmore";
            jQuery.ajax({
                type: "post",
                url: url,
                data: {'pageNumber': pageNumber,'pageSize': pageSize,'shopId':shapId},
                datatype: 'json',
                success: function(data) {

                    if(data.status == 'success'){
                        if(typeof (data.data) == 'undefined' || data.data.length == 0){
                            jQuery("#loadmore").attr("style","background-color:#ddd")
                            jQuery("#loadmore").html("没有更多了");
                            loadop=false;
                            return;
                        }
                        jQuery("#loadmore").html("加载更多");
                        jQuery("#pageNumber").val(data.pager.pageNumber);
                        jQuery("#pageCount").val(data.pager.pageCount);
                        jQuery.each(data.data, function(index, goods){
                            var lastGoods = jQuery(".goods").last();
                            var domShop = lastGoods.clone();
                            jQuery(domShop).find("a").prop('href', fullpath + "/item/whichapp/" + goods.id+".html?whichclient=whichapp");
                            var imgSrc = fullpath + "/static/app/ghdj/images/picloading.png";
                            if(goods.pic != "" && typeof(goods.pic) != "undefined"){
                                imgSrc =  goods.pic + "@400w_300h.png";
                            }
                            jQuery(domShop).find("img").prop('src', imgSrc);
                            jQuery(domShop).find(".p-info").html(goods.fullName);
                            jQuery(domShop).find(".price").html('￥'+fmoney(goods.price,2));
                            lastGoods.after(domShop);
                        });
                        loginShowView();
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
            jQuery('html,body').animate({scrollTop: '0px'}, 800);
        });
    }(mui, document));
    $(function(){
        loginShowView()
    });
</script>
</body>
</html>
