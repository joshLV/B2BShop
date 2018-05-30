<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <link rel="shortcut icon" href="${base}/static/mall/nsc/img/favicon.ico"/>
    <link rel="apple-touch-icon" href="${base}/static/mall/nsc/img/touchicon.png"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/Jdropdown.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/Jlazyload.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js"></script>
    <script src="${base}/static/mall/nsc/js/jquery.kinMaxShow-1.1.min.js"></script>
    <script src="${base}/static/mall/nsc/js/kefu.js"></script>
    <script src="${base}/static/mall/nsc/js/base.js"></script>
    <script type="text/javascript">
        window.pageConfig={
            compatible:true,
            navId:"home"
        };
    </script>
</head>
<body>
<#--<@string.message "project.webpath"></@string.message>-->
<#assign path="mall/nsc" />

<div class="g-doc">
    <div class="u-top-ad" style="height:131px;"></div>
    <div class="g-hd">
        <#include "${path}/shortcut.ftl"/>
        <#include "${path}/header.ftl"/>
    </div>
    <div class="g-bd">
        <#include "${path}/slide.ftl"/>
        <!--楼层展示-->
        <#include "${path}/floor.ftl"/>
        <!--实体店展示-->
        <#include "${path}/tenant.ftl"/>
    </div>
<!--品牌旗舰店-->
<#--<#include "${path}/index_shop.ftl"/>-->
<#include "${path}/service.ftl"/>
<#include "${path}/footer.ftl"/>
</div>
<#include "${path}/customer_service.ftl"/>
<script type="text/javascript">
    $(".u-category").show();
</script>
</body>
</html>