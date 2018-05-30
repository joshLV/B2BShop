<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>友情链接</title>
<meta name="description" content="友情链接">
<meta name="Keywords" content="友情链接">
<link href="${base}/static/mall/gwq/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/gdnz/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"memberindex"
};
</script>
</head>
<body>
<#include "mall/gdnz/shortcut.ftl"/>
<#include "mall/gdnz/header.ftl"/>
<style>
    .links-content{width:1198px; height:auto; margin:0 auto; border:1px solid #e8e8e8; border-top:2px solid #ea5313; margin-top: 10px;}
    .link_tit{height:40px; line-height:40px; background:#f5f5f5; border-bottom:1px solid #e8e8e8; font-size:16px; padding-left:15px;}
    .link_list{padding:10px 30px 0;}
    .link_list:after {
        content:".";
        display:block;
        height:0;
        clear:both;
        visibility:hidden;
    }
    .link_list{
        display:inline-table;
    }


    .link_list li{padding-left:28px;float:left;width:254px;height:32px;line-height:32px;border-bottom:1px dotted #ccc; white-space:nowrap; overflow:hidden}
    .link_list li a{color:#005ea7;}
    .link_list li a:hover{color:#ff4400; text-decoration:underline;}
</style>

<div class="links-content">
    <h3 class="link_tit">友情链接</h3>
    <ul  class="link_list">
     <#list friendlyLinkList as friend>
         <li><a href="${friend.url}" target="_blank">${friend.name}</a></li>
     </#list>
    </ul>
</div>
<#include "mall/gdnz/service.ftl"/>
<#include "mall/gdnz/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>

<script type="text/javascript">

</script>
</body>
</html>