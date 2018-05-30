
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/gwq/head.ftl">
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
            width: 25%;
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
    <style type="text/css">
        .prev-disabled, .next-disabled {
            pointer-events:none;
            color:#afafaf;
            cursor:default
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav bg_color_${grandCatelog.id}">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>首页
    </button>
    <h1 class="mui-title">${promotions.pName}</h1>
</header>
<div class="mui-content" id="content" style="padding-bottom:58px; padding-top:50px;">
<#--   <div class="r_px"><span>排序方式:</span>
       <a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??> -${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}"<#if pager.orderBy=='createDate'>style="color: red;"</#if>>默认</a>
       <a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??> -${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=sales" <#if pager.orderBy=='sales'>style="color: red;"</#if>>销量<img src="${path}/images/px_jt.jpg" ></a>
       <a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??> -${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=scoreCount"  <#if pager.orderBy=='scoreCount'>style="color: red;"</#if>>人气<img src="${path}/images/px_jt.jpg"></a>
       <a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??> -${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=price" <#if pager.orderBy=='price'>style="color: red;"</#if>>价格<img src="${path}/images/px_jt.jpg"></a>
   </div>-->
<#-- <ul class="category-toolbar" style="z-index:1;">
     <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}"<#if pager.orderBy=='createDate' || pager.orderBy==''>style="color: red;"</#if>>默认</a></li>
     <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=sales&orderType=<#if pager.orderBy=='createDate' || pager.orderType=='asc'>desc<#else>asc</#if>" <#if pager.orderBy=='sales'>style="color: red;"</#if>>销量<#if pager.orderBy=='sales'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>
     <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=scoreCount&orderType=<#if pager.orderBy=='createDate' || pager.orderType=='asc'>desc<#else>asc</#if>"  <#if pager.orderBy=='scoreCount'>style="color: red;"</#if>>人气<#if pager.orderBy=='scoreCount'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>
     <li><a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber}&orderBy=price&orderType=<#if pager.orderBy=='createDate' || pager.orderType=='asc'>desc<#else>asc</#if>"<#if pager.orderBy=='price'>style="color: red;"</#if>>价格<#if pager.orderBy=='price'><#if pager.orderType='desc'><img src="${path}/images/px_jt.jpg"><#else><img style="-webkit-transform: rotateZ(180deg);-moz-transform: rotateZ(180deg);-o-transform: rotateZ(180deg);-ms-transform: rotateZ(180deg);transform: rotateZ(180deg);" src="${path}/images/px_jt.jpg"></#if></#if></a></li>
 </ul>-->
    <div class="guess-you-like" style="margin-top: 6px;">
        <ul id="JS_guess_you_like_list" class="clearfix">
        <#list pager.getList() as gl>
            <li>
                <div class="face">
                    <a href="${base}/item/whichapp/${gl.id}.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}" title="${gl.fullName}">
                        <img attr="lazyload" src="${picloading}" width="200" height="150" data-original="${gl.pic}_200x150.png" alt="${gl.name}" >
                    </a>
                </div>
                <div class="info">
                    <p><a  href="${base}/item/whichapp/${gl.id}.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}"> ${gl.name}</a></p>
                    <div class="extra"><font style="padding-right:26px;">销量:<#if gl.sales??>${gl.sales}<#else>0</#if></font><font>评论:<#if gl.scoreCount??>${gl.scoreCount}<#else>0</#if></font></div>
                    <#if promotions.isOpen == "start">
                        <div class="extra"><strong>活动价:￥${gl.price?string('##0.00')}</strong><br/><span>￥${gl.goodsPrice?string('##0.00')}</span></div>
                    <#else>
                        <div class="extra"><strong>商城价:￥${gl.price?string('##0.00')}</strong><br/><span>￥${gl.goodsPrice?string('##0.00')}</span></div>
                    </#if>
                </div>
            </li>
        </#list>
        </ul>
    </div>

    <div class="checkout_btn">
        <a id="loadmore" class="gray_btn mui-control-item" href="javascript:;" style="background-color:#F4F4F4;">点击加载更多</a>
    </div>
    <div id="buttom"></div>
    <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
<#--   <div class="r_pxfs">
            <div class="pages ">
            &lt;#&ndash;下一页&ndash;&gt;
            <a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??>-${catelog.id}</#if>.html?pageNumber=${pager.pageNumber + 1}"
               class="<#if pager.pageNumber == pager.pageCount>next-disabled<#else>pagesdown</#if>"> &raquo;
            </a>

            &lt;#&ndash;上一页&ndash;&gt;
            <a href="${base}/list/whichapp/${grandCatelog.id}<#if parentCatelog??>-${parentCatelog.id}</#if><#if catelog??> -${catelog.id}</#if>.html?pageNumber=${pager.pageNumber - 1}"
               class="<#if pager.pageNumber - 1 <= 0>next-disabled<#else>pagesup</#if>">&laquo;
            </a>

            </div>

        </div>


    </div>-->
<#--
<div class="mui-content floors" style="background-color:#fff; ">
    <div class="floor-content">
        <ul class="f-cb">
            <#list goodslist as gl>
            <li class="f-fl">
                <div class="li-line">
                    <div class="goods-pic li-line">
                        <a href="${base}/item/whichapp/${gl.id}.html">
                            <img class="lazy" src="${base}/static/mall/img/error-img.gif" data-original="${gl.pic}_128x114.png" alt="${gl.fullName}">
                        </a>
                    </div>
                    <div class="goods-name"><a href="${base}/item/whichapp/${gl.id}.html">${gl.fullName}</a></div>
                    <div class="goods-price1">${gl.price?string(priceCurrencyFormat)}</div>
                    <div class="goods-price3">${gl.marketPrice?string(priceCurrencyFormat)}</div>
                </div>
            </li>
            </#list>
        </ul>
    </div>
</div>
-->
    <div class="return" >
        <a id="backToTop" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
    </div>
</div>
<#include "app/gwq/tools.ftl">
<script src="${path}/js/jquery.lazyload.min.js"></script>
<#if message>
<script type="text/javascript">
    layer.open({content:"${message}",btn:['确定'],end:function(){showWaiting();jumpto("${base}/app_index");}})
</script>
</#if>
<script>
    (function (mui, doc) {
        jQuery(".face,.info").on('click',"a",function(){
            loadop=true;
            jQuery("#pageNumber").val(1);
        });
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        mui.back = function(){
            jumpto(fullpath + "/app_index");
        }
    <#--//动态加载数据-->
    <#--jQuery("#loadmore").bind('tap', function(e){-->
    <#--jQuery("#loadmore").html("加载中...");-->
    <#--var waiting;-->
    <#--if(ismobile){-->
    <#--waiting = plus.nativeUI.showWaiting( "加载中..." );-->
    <#--setTimeout(function(){}, 100); // 延时100ms防止click事件传递到Ajax中刚生成的对象-->
    <#--}-->
    <#--var pageNumber = parseInt(jQuery("#pageNumber").val())+1;-->
    <#--//var url = "${base}/list/getPageDateForJson?catelogPath=8,804&pageNumber="+pageNumber;-->
    <#--var url ="${base}/list/getPageDateForJson?catelogPath=${grandCatelog.id}<#if parentCatelog??>,${parentCatelog.id}</#if><#if catelog??>,${catelog.id}</#if><#if pager.orderBy??>&orderBy=${pager.orderBy}</#if>&pageNumber="+pageNumber;-->
    <#--jQuery.ajax({-->
    <#--type: "post",-->
    <#--url: url,-->
    <#--data: {},-->
    <#--datatype: 'json',-->
    <#--success: function(data) {-->
    <#--jQuery("#pageNumber").val(pageNumber)-->
    <#--if(data.status == 'success'){-->
    <#--if(typeof (data.data) == 'undefined' || data.data.length == 0){-->
    <#--jQuery("#loadmore").html("没有更多了");-->
    <#--jQuery("#loadmore").unbind("tap");-->
    <#--if(ismobile) {waiting.close();}-->
    <#--return;-->
    <#--}-->
    <#--jQuery("#loadmore").html("点击加载更多");-->
    <#--jQuery("#pageNumber").val(data.pager.pageNumber);-->
    <#--jQuery.each(data.data, function(index, goods){-->
    <#--var item='<li>'+-->
    <#--'<div class="face">'+-->
    <#--'<a href="${base}/item/whichapp/'+goods.id+'.html" title="'+goods.fullName+'">'+-->
    <#--'<img attr="lazyload" src="${picloading}" data-original="'+goods.pic+'_200x150.png" alt="'+goods.name+'" >'+-->
    <#--'</a>'+-->
    <#--'</div>'+-->
    <#--'<div class="info">'+-->
    <#--'<p><a  href="${base}/item/whichapp/'+goods.id+'.html"> '+goods.name+'</a></p>'+-->
    <#--'<div class="extra"><strong>'+goods.price+'</strong> <span>'+goods.marketPrice+'</span></div>'+-->
    <#--'</div>'+-->
    <#--'</li>';-->
    <#--$("#JS_guess_you_like_list").append(item);-->
    <#--});-->
    <#--//重新绑定图片延时加载-->
    <#--lazyload();-->
    <#--if(ismobile) {waiting.close();}-->
    <#--}else{-->
    <#--jQuery("#loadmore").html("加载失败，稍后再试");-->
    <#--if(ismobile) {waiting.close();}-->
    <#--}-->
    <#--},-->
    <#--error:function(data){-->
    <#--jQuery("#loadmore").html("加载失败，稍后再试");-->
    <#--if(ismobile) {waiting.close();}-->
    <#--}-->
    <#--});-->
    <#--});-->
        //图片延时加载
        lazyload();
        //返回顶部
        jQuery('#backToTop').bind("tap", function(){
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });
    }(mui, document));


    function lazyload(){
        jQuery("img[attr='lazyload']").lazyload({
            threshold : 20,
            effect: "fadeIn",
            failure_limit : 1
        });
    }
    var loadop=true;
    var screenheight = window.screen.availHeight; //获取屏幕高
    $(window).scroll(function(){
        if ($(window).scrollTop()>100){
            $("#backToTop").fadeIn(500);
        }else{
            $("#backToTop").fadeOut(500);
        }
        var scr = $(window).scrollTop();
        var conH=document.getElementById("content").offsetHeight
        if(screenheight+scr> conH-100){
            if(loadop){
                loadData();
            }
        }
    });
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
        jQuery("#loadmore").html("<img src='${base}/static/app/gwq/images/loading.gif'>");
        var pageNumber = parseInt(jQuery("#pageNumber").val())+1;
        //var url = "${base}/list/getPageDateForJson?catelogPath=8,804&pageNumber="+pageNumber;
        var url ="${base}/huodongdata/${promotions.id}?pageNumber="+pageNumber;
        jQuery.ajax({
            type: "post",
            url: url,
            data: {},
            datatype: 'json',
            success: function(data) {
                jQuery("#pageNumber").val(pageNumber);
                if(data.status == 'success'){
                    if(typeof (data.data) == 'undefined' || data.data.length == 0){
                        jQuery("#loadmore").attr("style","background-color:#ddd")
                        jQuery("#loadmore").html("没有更多了");
                        loadop=false;
                        return;
                    }
                    //jQuery("#loadmore").html("点击加载更多");
                    jQuery("#pageNumber").val(data.pager.pageNumber);
                    jQuery.each(data.data, function(index, goods){
                        var item='<li>'+
                                '<div class="face">'+
                                '<a href="${base}/item/whichapp/'+goods.id+'.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}" title="'+goods.fullName+'">'+
                                '<img attr="lazyload" src="${picloading}" data-original="'+goods.pic+'_200x150.png" alt="'+goods.name+'" >'+
                                '</a>'+
                                '</div>'+
                                '<div class="info">'+
                                '<p><a  href="${base}/item/whichapp/'+goods.id+'.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}"> '+goods.name+'</a></p>'+
                                '<div class="extra"><font style="padding-right:26px;">销量:'+ goods.sales+'</font><font>评论:' + goods.scoreCount + '</font></div>' +
                                <#if promotions.isOpen == "start">
                                '<div class="extra"><strong>活动价：￥'+fmoney(goods.price)+'</strong><br/><span>￥'+fmoney(goods.goodsPrice)+'</span></div>'+
                                <#else >
                                '<div class="extra"><strong>商城价：￥'+fmoney(goods.price)+'</strong><br/><span>￥'+fmoney(goods.goodsPrice)+'</span></div>'+
                                </#if>
                                '</div>'+
                                '</li>';
                        $("#JS_guess_you_like_list").append(item);
                    });
                    //重新绑定图片延时加载
                    lazyload();
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
    }
</script>
</body>
</html>