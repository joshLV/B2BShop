<!DOCTYPE html>
<html>

<head>
<#include "app/xd/head.ftl">
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

            /*border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;*/
            /*padding: .625rem;*/
            width: 100%;
            margin: 0 auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            overflow: hidden;
        }

        .brand_list_info_pro1 ul li {
            padding:10px 10px 5px 10px;
            display: block;
            width: 100%;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            float: left;
             background: #fff;
            border-bottom: 1px solid #dfdfdf;
            margin-bottom: 10px;
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

        .right_panel{
            color: #fff;
            background: #333;
            position:fixed;
            z-index: 1001;
            top:0;
            bottom:0;
            width:70%;
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
            transform:translate(43%, 0px);
            -webkit-transform:translate(43%, 0px);
            -ms-transform:translate(43%, 0px);
            -moz-transform:translate(43%, 0px);
            -o-transform:translate(43%, 0px);
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

        .m-left{ float:left;padding-left: 18px;background:url(${base}/static/app/xd/images/m-range.png) left 1px no-repeat; background-size: 17px 17px; font-size: 13px; }
        .m-right{float:right;padding-left: 18px; background:url(${base}/static/app/xd/images/m-time.png) left 2px no-repeat; background-size: 15px 15px; font-size: 13px;}
        a.a-right{font-size: 12px;display: block;;padding: 1px 8px;background-color: #e12f45;color: #fff!important;float: right;
            -webkit-border-radius:  3px;
            -moz-border-radius: 3px;
            border-radius: 3px;}
        .a-left{ float: left; font-size: 13px; color: #777;}
        .a-left em{ font-style: normal; color: #e12f45;}
        .shop-img{ width: 100%; -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;}
    </style>
</head>
<!--页眉-->
<body style="padding-bottom:55px;">
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        附近商家
    </div>
    <button type="button" class="mui-left mui-btn  mui-btn-link mui-btn-nav mui-pull-right" onclick="showRigthPanel()">
        筛选
    </button>
</header>
<div class="mui-content" id="content">
    <div class="brand_list_info" id="top" style="margin-top:14px;">
        <div class="brand_list_info_pro1">
            <ul class="shoplist">
                <#list pager.list as shop>
                    <li>
                        <div style="width:30%;float: left;padding-right:10px;">
                            <#if shop.pic?exists>
                                <a href="${shop.url}?whichclient=whichapp"><img src="${shop.pic}" style="width: 100%;"></a>
                            <#else>
                                <a href="${shop.url}?whichclient=whichapp"><img src="${path}/images/shop.png" class="shop-img"></a>
                            </#if>
                        </div>
                        <div style="width: 65%;float: right">
                            <h5 style="text-indent:0px;border: none;background-color: inherit;padding: 0"><a href="${shop.url}?whichclient=whichapp" style="width: 100%;height: 17px;overflow:hidden;text-overflow:ellipsis;-o-text-overflow:ellipsis;white-space:nowrap;font-size: 17px;">${shop.name}</a></h5>
                            <h6 style="font-size: 14px;line-height: 22px;"><a style="width: 100%;height: 22px;overflow:hidden;text-overflow:ellipsis;-o-text-overflow:ellipsis;white-space:nowrap;font-size: 14px;">地址:${shop.areaPath}${shop.address}</a></h6>
                            <h6 style="font-size: 14px;line-height: 22px;overflow: hidden;"><span class="m-left">${shop.km}km</span><span class="m-right">${(shop.km?number*6.5)}min</span> </h6>
                            <h6 style="font-size: 14px;line-height: 22px;overflow: hidden;">
                                <span class="a-left">销量：<em>1245</em>单</span>
                                <a class="a-right" href="${base}/shopExtend/list4MobMap?atitude=${shop.atitude}&&longitude=${shop.longitude}&&address=${shop.areaPath}${shop.address}">获取路线</a>
                            </h6>
                        </div>
                    </li>
                </#list>
            </ul>
        </div>
        <div class="checkout_btn">
            <a id="loadmore" class="gray_btn" class="mui-control-item" href="#buttom">加载更多</a>
        </div>
    </div>
</div>

<div class="return">
    <a id="backToTop" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>


<div class="right_panel">
    <div style="right: 0;top: 0; position:absolute" onclick="hideRigthPanel()"><span class="mui-icon mui-icon-close"></span></div>
    <div  style="margin-bottom: 25px; color:#FFF;margin: 35px 15px 10px">
        <span class="mui-icon" style="font-size:20px; color:#FFF;margin-left: 0;padding-right:10px;"><span class="mui-icon mui-icon-search"></span>条件筛选</span>
    </div>
    <ul class="mui-table-view mui-table-view-chevron mui-table-view-inverted" style="background-color: #333;height: 100%;overflow: auto">
        <li  class="mui-table-view-cell">
            <span style="color: #fff;font-size: 16px;margin-right: 10px;border-radius:3px;display: block;float: left">距离：</span>

            <span style="color: #fff;font-size: 14px;background-color: #e12f45;padding:1px 8px;margin-right: 10px;border-radius:3px;width: 75px;display: block;float: left;overflow: hidden;margin-bottom:8px;" onclick="queryD('km','km_LT','5','')">小于5千米</span>
            <span style="color: #fff;font-size: 14px;background-color: #e12f45;padding:1px 8px;margin-right: 10px;border-radius:3px;width: 75px;display: block;float: left;overflow: hidden;margin-bottom:8px;" onclick="queryD('km','GT_LT','5','10')">5-10千米</span>
            <span style="color: #fff;font-size: 14px;background-color: #e12f45;padding:1px 8px;margin-right: 10px;border-radius:3px;width: 75px;display: block;float: left;overflow: hidden;margin-bottom:8px;" onclick="queryD('km','GT_LT','10','20')">10-20千米</span>
            <span style="color: #fff;font-size: 14px;background-color: #e12f45;padding:1px 8px;margin-right: 10px;border-radius:3px;width: 75px;display: block;float: left;overflow: hidden;margin-bottom:8px;" onclick="queryD('km','GT_LT','20','40')">20-40千米</span>
            <span style="color: #fff;font-size: 14px;background-color: #e12f45;padding:1px 8px;margin-right: 10px;border-radius:3px;width: 75px;display: block;float: left;overflow: hidden;margin-bottom:8px;" onclick="queryD('km','km_GT','40','')">大于40千米</span>

        </li>
        <li  class="mui-table-view-cell">
            <span style="color: #fff;font-size: 16px;margin-right: 10px;border-radius:3px;display: block;float: left">销量：</span>

            <span style="color: #fff;font-size: 14px;background-color: #e12f45;padding:1px 8px;margin-right: 10px;border-radius:3px;width: 75px;display: block;float: left;overflow: hidden;margin-bottom:8px;" onclick="queryD('sile','sile_LT','50','')">小于50单</span>
            <span style="color: #fff;font-size: 14px;background-color: #e12f45;padding:1px 8px;margin-right: 10px;border-radius:3px;width: 75px;display: block;float: left;overflow: hidden;margin-bottom:8px;;" onclick="queryD('sile','GT_LT','5.','10.')">50-100单</span>
            <span style="color: #fff;font-size: 14px;background-color: #e12f45;padding:1px 8px;margin-right: 10px;border-radius:3px;width: 75px;display: block;float: left;overflow: hidden;margin-bottom:8px;" onclick="queryD('sile','GT_LT','100','200')">100-200单</span>
            <span style="color: #fff;font-size: 14px;background-color: #e12f45;padding:1px 8px;margin-right: 10px;border-radius:3px;width: 75px;display: block;float: left;overflow: hidden;margin-bottom:8px;" onclick="queryD('sile','GT_LT','200','400')">200-400单</span>
            <span style="color: #fff;font-size: 14px;background-color: #e12f45;padding:1px 8px;margin-right: 10px;border-radius:3px;width: 75px;display: block;float: left;overflow: hidden;margin-bottom:8px;" onclick="queryD('sile','sile_GT','400','')">大于400</span>
        </li>
    </ul>
</div>


<input type="hidden" id="km_GT"  value="${km_GT}"/>
<input type="hidden" id="km_LT" value="${km_LT}"/>
<input type="hidden" id="sile_GT" value="${sile_GT}"/>
<input type="hidden" id="sile_LT" value="${sile_LT}"/>
<input type="hidden" id="filterType" value="${filterType}"/>

<input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
<input type="hidden" id="pageCount" value="${pager.pageCount}"/>
<input type="hidden" id="pageSize" value="${pager.pageSize}"/>

<script src="${path}/js/jquery.lazyload.min.js"></script>
<#include "app/xd/tools.ftl">
<script>

    function queryD(t,n,s,e){

        $("#km_GT").val("")
        $("#km_LT").val("")
        $("#sile_GT").val("")
        $("#sile_LT").val("")
        $("#filterType").val("")

        if(t=='km'){
            $("#filterType").val("km")
            if(n=='km_LT'){
                $("#km_LT").val(s);
            }
            if(n=='GT_LT'){
                $("#km_LT").val(e);
                $("#km_GT").val(s);
            }
            if(n=='km_GT'){
                $("#km_GT").val(s);
            }
        }
        if(t=='sile'){
            $("#filterType").val("sile")
            if(n=='sile_LT'){
                $("#sile_LT").val(s);
            }
            if(n=='GT_LT'){
                $("#sile_LT").val(e);
                $("#sile_GT").val(s);
            }
            if(n=='sile_GT'){
                $("#sile_GT").val(s);
            }
        }

        var km_GT=$("#km_GT").val()
        var km_LT=$("#km_LT").val()
        var sile_GT= $("#sile_GT").val()
        var sile_LT=$("#sile_LT").val()
        var filterType=$("#filterType").val()

        var atitude=plus.storage.getItem("defaule_atitude")//"34.23244406047252";//
        var longitude=plus.storage.getItem("defaule_longitude")//"108.8804946441841";//
        jumpto(fullpath+"/shopExtend/list4Mob?whichclient=whichapp&atitude="+atitude+"&longitude="+longitude+"&km_GT="+km_GT+"&km_LT="+km_LT+"&sile_GT="+sile_GT+"&sile_LT="+sile_LT+"&filterType="+filterType)

    }



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


    (function (mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        mui.back = function(){
            jumpto(fullpath + "/app_index");
        }

        jQuery("img[attr='lazyload']").lazyload({
            threshold: 20,
            effect: "fadeIn"
        });
        fmoney=function (s, n){
            if(!jQuery.isNumeric(s)){
                return "0.00";
            }
            n = n > 0 && n <= 20 ? n : 2;
            s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
            return s;
        };



        var loadop=true;
        loadData = function(){
            loadop=false;
            jQuery("#loadmore").html("<img src='${base}/static/app/xd/images/loading.gif'>");
            var shapId = jQuery("#shapId").val();
            var pageNumber = parseInt(jQuery("#pageNumber").val());
            var pageCount = parseInt(jQuery("#pageCount").val());
            var pageSize = parseInt(jQuery("#pageSize").val());

            var km_GT=$("#km_GT").val()
            var km_LT=$("#km_LT").val()
            var sile_GT= $("#sile_GT").val()
            var sile_LT=$("#sile_LT").val()
            var filterType=$("#filterType").val()



            var km = jQuery("#km").val();
            if(km==''){km=10}
            var atitude=plus.storage.getItem("defaule_atitude")//"34.23244406047252";//
            var longitude=plus.storage.getItem("defaule_longitude")//"108.8804946441841";//

            pageNumber = pageNumber + 1;
            var url = fullpath + "/shopExtend/list4Mob?__getModel__=true";
            jQuery.ajax({
                type: "post",
                url: url,
                data: {'pageNumber': pageNumber,'pageSize': pageSize,'km': km,'atitude': atitude,'longitude':longitude,'km_GT':km_GT,'km_LT':km_LT,'sile_GT':sile_GT,'sile_LT':sile_LT,'filterType':filterType},
                datatype: 'json',
                success: function(data) {

                    if(data.pager.list.length>0){
                        jQuery("#loadmore").html("加载更多");
                        jQuery("#pageNumber").val(data.pager.pageNumber);
                        jQuery("#pageCount").val(data.pager.pageCount);
                        jQuery.each(data.pager.list, function(index, shop){
                            var shop_pic=typeof (shop.pic)=='undefined'?'${path}/images/shop.png':shop.pic;

                            var areaPath=typeof (shop.areaPath)=='undefined'?'':shop.areaPath
                            var address=typeof (shop.address)=='undefined'?'':shop.address

                            var baseTemp='<li class="shop">'+
                                          '  <div style="width:30%;float: left;padding-right:10px;">'+
                                                '<a href="'+shop.url+'?whichclient=whichapp"><img src="'+shop_pic+'" style="width: 100%;"></a>'+
                                            '</div>'+
                                            '<div style="width: 65%;float: right">'+
                                                '<h5 style="text-indent:0px;border: none;background-color: inherit;padding: 0"><a href="'+shop.url+'?whichclient=whichapp" style="width: 100%;height: 17px;overflow:hidden;text-overflow:ellipsis;-o-text-overflow:ellipsis;white-space:nowrap;font-size: 17px;">'+shop.name+'</a></h5>'+
                                                '<h6 style="font-size: 14px;line-height: 22px;"><a style="width: 100%;height: 22px;overflow:hidden;text-overflow:ellipsis;-o-text-overflow:ellipsis;white-space:nowrap;font-size: 14px;">地址:'+areaPath+address+'</a></h6>'+
                                                '<h6 style="font-size: 14px;line-height: 22px;overflow:hidden;"><span class="m-left">'+shop.km+'km</span><span class="m-right">'+shop.km+'min</span></h6>'+
                                                '<h6 style="font-size: 14px;line-height: 22px;overflow: hidden;">'+
                                                    '<span class="a-left">销量：<em>1245</em>单</span>'+
                                                    '<a class="a-right" href="${base}/shopExtend/list4MobMap?atitude='+shop.atitude+'&&longitude='+shop.longitude+'&&address='+areaPath+address+'">获取路线</a>'+
                                                '</h6>'+
                                            '</div>'+
                                        '</li>';
                            $(".shoplist").append(baseTemp);
                        });
                        loadop=true;
                    }else{
                        jQuery("#loadmore").attr("style","background-color:#ddd")
                        jQuery("#loadmore").html("没有更多了");
                        loadop=false;
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
</script>
</body>
</html>
