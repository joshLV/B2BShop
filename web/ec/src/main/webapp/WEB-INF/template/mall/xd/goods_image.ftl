<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <link href="${base}/static/mall/xd/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/mall/xd/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/xd/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/mall/css/index.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        window.pageConfig={
            compatible:true,
            navId:"home"
        };
    </script>
</head>
<body>

<#include "mall/xd/shortcut.ftl"/>
<#include "mall/xd/header.ftl"/>
<style>/*商品分类直接展开*/#categorys .mc {display: block;}#categorys .mt b {display: none;}</style>

<style>

    .pro-switch {
        margin: 20px auto;
        height: 770px;
        overflow: hidden;
        position: relative;
        width:800px;
    }
    .pro-switch .pro_title{font: 700 16px/1.5em Arial,Verdana,"microsoft yahei";color: #666; padding-bottom: 15px; text-align: center;}
    .flexslider {
        margin: 0;
        padding: 0;
    }
    .flexslider .slides > li {
        display: none;
        -webkit-backface-visibility: hidden;
    }
    .flexslider .slides img {
        width: 100%;
        display: block;
    }
    .slides:after {
        content: ".";
        display: block;
        clear: both;
        visibility: hidden;
        line-height: 0;
        height: 0;
    }
    html[xmlns] .slides {
        display: block;
    }
    * html .slides {
        height: 800px;
    }
    .no-js .slides > li:first-child {
        display: block;
    }
    .flexslider {
        margin: 0 auto;
        position: relative;
        width:770px;
        zoom: 1;
    }
    .flex-viewport {
        max-height: 2000px;
        -webkit-transition: all 1s ease;
        -moz-transition: all 1s ease;
        transition: all 1s ease;
    }
    .flexslider .slides {
        zoom: 1;
    }
    .flex-direction-nav {
        *height: 0;
    }
    .flex-direction-nav a {
        width: 60px;
        height: 90px;
        margin: -60px 0 0;
        display: block;
        background: url(${base}/static/mall/xd/img/ad_ctr.png) no-repeat 0 0;
        position: absolute;
        top: 50%;
        z-index: 10;
        cursor: pointer;
        text-indent: -9999px;
        opacity: 0;
        filter:alpha(opacity=0);
        -webkit-transition: all .3s ease;
    }
    .flex-direction-nav .flex-next {
        background-position: 0 -90px;
        right: 0;
    }
    .flex-direction-nav .flex-prev {
        left: 0;
    }
    .flexslider:hover .flex-next {
        opacity: 0.8;
        filter:alpha(opacity=25);
    }
    .flexslider:hover .flex-prev {
        opacity: 0.8;
        filter:alpha(opacity=25);
    }
    .flexslider:hover .flex-next:hover, .flexslider:hover .flex-prev:hover {
        opacity: 1;
        filter:alpha(opacity=50);
    }
    .flex-control-nav {
        width: 100%;
        position: absolute;
        bottom: 10px;
        text-align: center; display:none;
    }
    .flex-control-nav li {
        margin: 0 5px;
        display: inline-block;
        zoom: 1;
        *display: inline;
    }
    .flex-control-paging li a {
        background: url(${base}/static/mall/xd/img/dot.png) no-repeat 0 -16px;
        display:block;
        height: 16px;
        overflow: hidden;
        text-indent:-99em;
        width: 16px;
        cursor: pointer;
    }
    .flex-control-paging li a.flex-active {
        background-position: 0 0;
    }
    #j_tslm {
        border-bottom:1px solid #E2E2E3;
        margin-top:22px;
        overflow:hidden;
        padding-bottom:40px;
        *padding-bottom:20px;
    }


</style>

<div class="pro-switch">
    <div class="pro_title">${goods.fullName}</div>
    <div class="slider">
        <div class="flexslider">
            <ul class="slides">
            <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                <#list goodsImagesList?sort_by("orderNo") as img>
                    <li>
                        <div class="img"><img alt="${img.title}" src="${img.pic}@420w_420h" /></div>
                    </li>
                </#list>
            </#if>
            </ul>
        </div>
    </div>
</div>

<script defer src="${base}/static/mall/xd/js/slider.js"></script>
<script type="text/javascript">
    $(function(){
        $('.flexslider').flexslider({
            animation: "slide",
            start: function(slider){
                $('body').removeClass('loading');
            }
        });
    });
</script>

<!--知识区域-->
<#include "mall/xd/index_article.ftl"/>
<#include "mall/xd/service.ftl"/>
<#include "mall/xd/footer.ftl"/>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/index.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<#--<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
&lt;#&ndash;<link href="${base}/static/mall/css/ad.css" rel="stylesheet" type="text/css" media="all"/>&ndash;&gt;
&lt;#&ndash;<script src="${base}/static/mall/js/ad.js" type="text/javascript"></script>&ndash;&gt;
<script src="${base}/static/mall/js/car.js" type="text/javascript"></script>-->
</body>
</html>