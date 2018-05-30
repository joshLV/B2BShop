<!DOCTYPE html>
<html>

<head>

    <#--<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">-->
    <#--<meta name="apple-mobile-web-app-capable" content="yes">-->
    <#--<meta name="apple-mobile-web-app-status-bar-style" content="black">-->

    <#include "app/gwq/head.ftl">
    <style>

        .mui-icon {
            font-size: 14px;
            color: #007aff;
            margin-left: -15px;
            padding-right: 10px;
        }
        .mui-off-canvas-right {
            color: #fff;
        }
        .title {
            margin: 35px 15px 10px;
        }


    </style>

    <style>
        h5{
            padding-top: 8px;
            padding-bottom: 8px;
            text-indent: 12px;
        }

        .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body{
            font-size: 15px;
            margin-top:8px;
            color: #333;
        }

        /*商品列表头部样式*/
        .category-toolbar { margin-top: -5px;
            height: 38px;

            background: #f7f7f7;
            border-bottom: solid 1px #d8d8d8;
            border-top: solid 1px #d8d8d8;
            display: -webkit-box;
            display: -moz-box;
            display: -o-box;
            display: -ms-box;
            position: relative;
        }
        .category-toolbar li {
            width: 33.3%;
            height: 38px;
            text-align: center;
            font-weight: bold;
        }
        .category-toolbar li img{ opacity: .4;}
        .category-toolbar li a {
            display: block;
            height: 38px;
            line-height: 38px;
            color: #666; font-size:14px;
        }
        .category-toolbar .current a {
            color: #da0000;
        }

    </style>
</head>

<body>
<!--侧滑菜单容器-->
<div id="offCanvasWrapper" class="mui-off-canvas-wrap mui-draggable">
    <!--菜单部分-->
    <aside id="offCanvasSide" class="mui-off-canvas-right">
        <div id="offCanvasSideScroll" class="mui-scroll-wrapper">
            <div class="mui-scroll">

                <div class="title" style="margin-bottom: 25px; color:#FFF;">
                   <span class="mui-icon mui-icon-home" style="font-size:24px; color:#FFF;margin-left: 0;"> <a href="${base}/app_index" style="color:#FFF;font-family: 微软雅黑; font-size: 18px;">首页</a></span>
                </div>
                <ul class="mui-table-view mui-table-view-chevron mui-table-view-inverted" style="background-color: #333;">
                <#--<li class="mui-table-view-cell">热门分类</li>-->
                <#if refCatelogList?? && refCatelogList?size &gt; 0>
                    <#list refCatelogList as cat>
                        <#if cat.cateTypeFlage == 2>

                            <li class="mui-table-view-cell">
                                <a class="mui-navigate-right" style="color: #d8d8d8!important;"
                                    href="${base}/list/whichapp/${cat.grandfather}-${cat.parentId}-${cat.id}.html?orderBy=sales&orderType=desc" title="${cat.name}">${cat.name}
                                </a>
                            </li>

                        <#elseif cat.cateTypeFlage ==1 >
                            <li class="mui-table-view-cell">
                                <a class="mui-navigate-right" style="color: #d8d8d8!important;"
                                    href="${base}/list/whichapp/${cat.parentId}-${cat.id}.html?orderBy=sales&orderType=desc" title="${cat.name}">${cat.name}
                                </a>
                            </li>
                        <#else >
                            <li class="mui-table-view-cell">
                                <a class="mui-navigate-right" style="color: #d8d8d8!important;"
                                   href="${base}/list/whichapp/${cat.id}.html" title="${cat.name}?orderBy=sales&orderType=desc">${cat.name}
                                </a>
                            </li>
                        </#if>
                    </#list>
                </#if>

                </ul>
            </div>
        </div>
    </aside>
    <div class="mui-inner-wrap">
        <header class="mui-bar mui-bar-nav bg_color_${grandCatelog.id}">
            <a class="mui-action-back mui-icon mui-icon-back mui-pull-left"></a>
            <a id="offCanvasBtn" href="#offCanvasSide" class="mui-icon mui-action-menu mui-icon-bars mui-pull-right" style="color:#FEE;"></a>
            <h1 class="mui-title"><#if catelog.id??>${catelog.name}<#elseif parentCatelog.id??>${parentCatelog.name}<#else>${grandCatelog.name}</#if></h1>
        </header>
        <div id="offCanvasContentScroll" class="mui-content mui-scroll-wrapper">
                <div class="mui-scroll mui-content" id="content" style="padding-top:20px;">
                    <ul class="category-toolbar" style="z-index:1;">
                        <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=sales&orderType=desc" <#if pager.orderBy=='sales' || pager.orderBy==''>style="color: red;"</#if>>销量</a></li>
                        <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=scoreCount&orderType=desc" <#if pager.orderBy=='scoreCount'>style="color: red;"</#if>>人气</a></li>
                        <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=price&orderType=<#if pager.orderBy=='createDate' || pager.orderType='asc'>desc<#else>asc</#if>"<#if pager.orderBy=='price'>style="color: red;"</#if>>价格<#if pager.orderBy=='price'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>
                    </ul>

                    <div class="guess-you-like" style="margin-top: 6px;">
                        <ul id="JS_guess_you_like_list" class="clearfix  mui-table-view mui-table-view-chevron">
                        <#list goodslist as gl>
                            <li>
                                <div class="face">
                                    <a href="${base}/item/whichapp/${gl.id}.html" title="${gl.fullName}">
                                        <img attr="lazyload" src="${picloading}" data-original="${gl.pic}_200x150.png" alt="${gl.name}" >
                                    </a>
                                </div>
                                <div class="info">
                                    <p style="position: relative;"><a  href="${base}/item/whichapp/${gl.id}.html" style="width:calc(100% - 31px);"> ${gl.name}</a>
                                        <a href="#" style="padding-right: 0 !important;" class="add-gwc" goodsId="${gl.id}"> <img src="${path}/images/add_gwc.png" style="width: 25px;  display: inline;"></a>
                                    </p>
                                    <div class="extra"><font style="padding-right:26px;">销量:<#if gl.sales??>${gl.sales}<#else>0</#if></font><font>评论:<#if gl.scoreCount??>${gl.scoreCount}<#else>0</#if></font></div>
                                    <div class="extra"><strong>￥${gl.price?string('##0.00')}</strong> <span>￥${gl.marketPrice?string('##0.00')}</span></div>
                                </div>
                            </li>
                        </#list>
                        </ul>
                    </div>

                    <div class="return" >
                        <a id="backToTop" href="#content" class="mui-control-item"><img src="${path}/images/return.png"></a>
                    </div>
                </div>



        </div>
        <!-- off-canvas backdrop -->
        <div class="mui-off-canvas-backdrop"></div>
    </div>
</div>
<input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
<input type="hidden" id="isFirst" value="1"/>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    (function (mui, doc) {
        mui.init({
            swipeBack: false,
            pullRefresh: {
                container: '#offCanvasContentScroll',
                up: {
                    contentrefresh: '正在加载...',
                    callback: pullupRefresh
                }
            }
        });

        if (mui.os.plus) {
            mui.plusReady(function() {
                setTimeout(function() {
                    mui('#offCanvasContentScroll').pullRefresh().pullupLoading();
                }, 1000);

            });
        } else {
            mui.ready(function() {
                mui('#offCanvasContentScroll').pullRefresh().pullupLoading();
            });
        }

        //侧滑容器父节点
        var offCanvasWrapper = mui('#offCanvasWrapper');
        //主界面容器
        var offCanvasInner = offCanvasWrapper[0].querySelector('.mui-inner-wrap');
        //菜单容器
        var offCanvasSide = document.getElementById("offCanvasSide");

        //移动效果是否为整体移动
        var moveTogether = false;
        //侧滑容器的class列表，增加.mui-slide-in即可实现菜单移动、主界面不动的效果；
        var classList = offCanvasWrapper[0].classList;
        offCanvasSide.classList.remove('mui-transitioning');
        offCanvasSide.setAttribute('style', '');
        classList.remove('mui-slide-in');
        classList.remove('mui-scalable');
        classList.add('mui-slide-in');
        offCanvasWrapper.offCanvas().refresh();

        //主界面和侧滑菜单界面均支持区域滚动；
        mui('#offCanvasSideScroll').scroll();//侧滑菜单
        mui('#offCanvasContentScroll').scroll();//主界面
        //实现ios平台的侧滑关闭页面；
        if (mui.os.plus && mui.os.ios) {
            offCanvasWrapper[0].addEventListener('shown', function(e) { //菜单显示完成事件
                plus.webview.currentWebview().setStyle({
                    'popGesture': 'none'
                });
            });
            offCanvasWrapper[0].addEventListener('hidden', function(e) { //菜单关闭完成事件
                plus.webview.currentWebview().setStyle({
                    'popGesture': 'close'
                });
            });
        }
        mui("#offCanvasContentScroll").on("tap", 'a', function(e){
            if( jQuery(e.target).is("a")){
                console.log(e.target.href);
                if(!(e.target.href.indexOf('#') == 0 || e.target.href.indexOf('javascript') == 0) ){
                    jumpto(e.target.href);
                }
            }else if(jQuery(e.target).is("img")){
                if(jQuery(e.target).parent().length > 0){
                    var aTarget = jQuery(e.target).parent()[0];
                    if(jQuery(aTarget).is("a")){
                        console.log(aTarget);
                        if(!(aTarget.href.indexOf('#') >= 0 || aTarget.href.indexOf('javascript') == 0) ){
                            jumpto(aTarget.href);
                        }else if( aTarget.id == 'backToTop'){
                            console.log('backToTop');
                            //jQuery('html,body').animate({scrollTop: '0px'}, 100);
                            //mui('#offCanvasContentScroll').pullRefresh().scrollerHeight = 0;
                            mui('#offCanvasContentScroll').pullRefresh().scrollTo(0,0,100);
                        }else if(jQuery(aTarget).hasClass("add-gwc")){
                            var goodsId;
                            if(jQuery(e.target).is("img")){
                                goodsId = jQuery(e.target).parent("a").attr("goodsId");
                            }else{
                                goodsId = jQuery(e.target).attr("goodsId");
                            }
                            addgwc(goodsId);
                        }
                    }
                }

            }


        })
        mui('#offCanvasSideScroll').on('tap','a',function(e){
            if( jQuery(e.target).is("a")){
                console.log(e.target.href);
                if(!(e.target.href.indexOf('#') == 0 || e.target.href.indexOf('javascript') == 0) ){
                    jumpto(e.target.href);
                    //console.log(e.target.href);
                }
            }
        });
        lazyload();
    }(mui, document));




    function lazyload(){
        jQuery("img[attr='lazyload']").lazyload({
            threshold : 20,
            effect: "fadeIn",
            failure_limit : 1
        });
    }
    var loadop=true;
//    var screenheight = window.screen.availHeight; //获取屏幕高
//    $(window).scroll(function(){
//        if ($(window).scrollTop()>100){
//            $("#backToTop").fadeIn(500);
//        }else{
//            $("#backToTop").fadeOut(500);
//        }
//        var scr = $(window).scrollTop();
//        var conH=document.getElementById("offCanvasWrapper").offsetHeight;
//        if(scr > 200 && screenheight+scr> conH-50){
//            if(loadop){
//                loadData();
//            }
//        }
//    });

    function fmoney (s, n) {
        if (!jQuery.isNumeric(s)) {
            return "0.00";
        }
        n = n > 0 && n <= 20 ? n : 2;
        s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
        var l = s.split(".")[0].split("").reverse();
        var r = s.split(".")[1];
        t = "";
        for(i = 0; i < l.length; i ++ )
        {
            t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
        }
        return t.split("").reverse().join("") + "." + r;
    };
    function loadData(){
        loadop=false;
        if(jQuery("#pageNumber").val() == "1"){
            mui('#offCanvasContentScroll').pullRefresh().scrollTo(0,0,100);
        }
        //jQuery("#loadmore").html("<img src='${base}/static/app/gwq/images/loading.gif'>");
        var pageNumber = parseInt(jQuery("#pageNumber").val())+1;
        var url ="${base}/list/getPageDateForJson?whichclient=whichapp&catelogPath=${grandCatelog.id}<#if parentCatelog??>,${parentCatelog.id}</#if><#if catelog??>,${catelog.id}</#if><#if pager.orderBy??>&orderBy=${pager.orderBy}</#if>&pageNumber="+pageNumber;
        jQuery.ajax({
            type: "post",
            url: url,
            data: {},
            datatype: 'json',
            success: function(data) {
                jQuery("#pageNumber").val(pageNumber);
                if(data.status == 'success'){
                    if(typeof (data.data) == 'undefined' || data.data.length == 0){
//                        jQuery("#loadmore").attr("style","background-color:#ddd")
//                        jQuery("#loadmore").html("没有更多了");
                        loadop=false;
                        return;
                    }
                    //jQuery("#loadmore").html("点击加载更多");
                    jQuery("#pageNumber").val(data.pager.pageNumber);
                    jQuery.each(data.data, function(index, goods){
                        var item='<li>'+
                                '<div class="face">'+
                                '<a href="${base}/item/whichapp/'+goods.id+'.html" title="'+goods.fullName+'">'+
                                '<img attr="lazyload" src="${picloading}" data-original="'+goods.pic+'_200x150.png" alt="'+goods.name+'" >'+
                                '</a>'+
                                '</div>'+
                                '<div class="info">'+
                                '<p style="position: relative;">' +
                                '   <a  href="${base}/item/whichapp/'+goods.id+'.html"> '+goods.name+'</a>' +
                                '   <a href="#" style="padding-right: 0 !important;" class="add-gwc" goodsId="'+ goods.id + '"> <img src="${path}/images/add_gwc.png" style="width: 25px;  display: inline;"></a>' +
                                '</p>'+
                                '<div class="extra"><font style="padding-right:26px;">销量:'+ goods.sales+'</font><font>评论:' + goods.scoreCount + '</font></div>' +
                                '<div class="extra"><strong>￥'+fmoney(goods.price)+'</strong> <span>￥'+fmoney(goods.marketPrice)+'</span></div>'+
                                '</div>'+
                                '</li>';
                        $("#JS_guess_you_like_list").append(item);
                    });
                    //重新绑定图片延时加载
                    lazyload();
                    loadop=true;
                }else{
//                    jQuery("#loadmore").attr("style","background-color:#ddd")
//                    jQuery("#loadmore").html("加载失败，稍后再试");

                }
            },
            error:function(data){
//                jQuery("#loadmore").attr("style","background-color:#ddd")
//                jQuery("#loadmore").html("加载失败，稍后再试");
            }
        });
    }


    function pullupRefresh(){
        console.log('pullupRefresh');
        if(loadop) (loadData());
        setTimeout(function(){
            mui('#offCanvasContentScroll').pullRefresh().endPullupToRefresh((loadop == false));
        }, 2000);

    }
</script>
<#include "app/gwq/panel.ftl">
</body>

</html>