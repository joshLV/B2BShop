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
        var isindex = true;
    </script>
</head>
<body>

<#include "mall/xd/shortcut.ftl"/>
<#include "mall/xd/header.ftl"/>
<style>/*商品分类直接展开*/#categorys .mc {display: block;}#categorys .mt b {display: none;}</style>
<#include "mall/xd/slide.ftl"/>
<!--品牌旗舰店-->
<#include "mall/xd/index_shop.ftl"/>
<!--楼层展示-->
<#include "mall/xd/floor.ftl"/>
<!--知识区域-->
<#include "mall/xd/index_article.ftl"/>
<#include "mall/xd/service.ftl"/>
<#include "mall/xd/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/index.js" type="text/javascript"></script>
<#--<link href="${base}/static/mall/css/ad.css" rel="stylesheet" type="text/css" media="all"/>-->
<#--<script src="${base}/static/mall/js/ad.js" type="text/javascript"></script>-->
<script src="${base}/static/mall/js/car.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function(){
        $(".navCon-cate-title").unbind("mouseenter");
        $(".navCon-cate-title").unbind("hover");
        $(".navCon-cate-title").addClass("hover");
        $(".cateMenu").css("display","block");
    });
</script>
</body>
</html>