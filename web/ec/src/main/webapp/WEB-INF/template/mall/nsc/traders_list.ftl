<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>商家信息 - <@spring.message "project_name"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />

    <link rel="stylesheet" href="${base}/static/mall/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>
    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>


    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/jquery.idTabs.min.js"></script>
    <script src="${base}/static/mall/js/jquery.kinMaxShow-1.1.min.js"></script>
    <script src="${base}/static/mall/js/kefu.js"></script>
    <script type="text/javascript">
        $(window).load(function(e) {
            //$(".u-top-ad").animate({height:"131px"},"slow");
            //$(".u-top-ad").animate({height:"0"},"slow");
            $(".u-cate-tabs").idTabs("!mouseover");
            $(".u-cate-tabs a").bind("mouseover",function(){
                $(".u-cate-tabs a").removeClass("tabsselected");
                $(this).addClass("tabsselected");
            });
            $(".u-cates-li:even").css("background-color","#fafafa");
            $(".m-category").hover(function(e){
                $(".u-category").show();
            },function(e){
                $(".u-category").hide();
            });
            $(".u-cates-li").hover(function(e) {
                $(this).css("background","#f0f0f0");
                $(this).addClass("u-cates-over").removeClass(".u-cates-li");
            },function(e){
                $(this).removeClass("u-cates-over").addClass(".u-cates-li");
                $(".u-cates-li:even").css("background-color","#fafafa");
            });
        });
    </script>
    <script type="text/javascript">
        window.pageConfig={
            compatible:true,
            navId:"traders"
        };
    </script>
</head>
<body>
<#assign path="mall/nsc/">
<div class="g-doc">
    <div class="u-top-ad"></div>
    <#--页眉-->
    <div class="g-hd">
    <#--加入收藏-->
		<#include "${path}/shortcut.ftl"/>
		<#--头部-->
		<#include "${path}/header.ftl"/>
    </div>
    <div class="g-bd">
        <div class="g-main">
            <div class="s_tit">
                <h3>商家信息</h3>
                <a href="#">更多&gt;</a></div>
            <div class="sjxx">
                <ul>
                    <#list merchantList as merchant>
                        <li>
                            <div class="s_img"><img src="${merchant.pic!"${base}/static/mall/img/default_shop_logo.gif"}" width="190" height="135"></div>
                            <div class="s_name"><a href="${base}/shop/detail/${merchant.urlAddress}.html">${merchant.name}</a></div>
                            <div class="s_tel">
                                <p>手机号码：${merchant.mobile}</p>
                                <p>固定电话：${merchant.telphone}</p>
                                <p>所在地区：${merchant.address}</p>
                            </div>
                            <div class="s_jrdp"><a href="${base}/shop/${merchant.urlAddress}.html">进入店铺</a></div>
                        </li>
                    </#list>
                </ul>
            </div>
        </div>

        <#--底部商品指南-->
        <#include "${path}/service.ftl"/>
    </div>
</div>

<#--页脚-->
<#include "${path}/footer.ftl"/>

    <script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
    <script type="text/javascript">
    /*宽屏设置*/
    pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function(){

    });
    </script>
</body>
</html>
<script type="text/javascript">
    $(".u-category").hide();
</script>