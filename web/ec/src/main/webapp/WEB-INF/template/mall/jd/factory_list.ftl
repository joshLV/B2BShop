<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>生产厂家信息 - <@spring.message "project_name"/></title>
<meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
<meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
<link href="${base}/static/mall/jd/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"traders"
};
</script>
</head>
<body>
<#include "mall/jd/shortcut.ftl"/>
<#include "mall/jd/header.ftl"/>
<!--面包屑导航-->
<style>
.breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
.breadcrumb span {font-family: "\5b8b\4f53"}
</style>
<div class="content">
	<div class="breadcrumb">
		<h1><a href="${base}/index">首页</a></h1>
		<span>&nbsp;&gt;&nbsp;<a href="${base}/traders/list">生产厂家信息展示</a></span>
	</div><!--breadcrumb end -->
	<div class="clr"></div>
</div>

<style>
#traderList .m {width: 485px;border: 1px solid #E9E9E9;}

#traderList .mt{height:28px;background:url(${base}/static/mall/img/bg-allsort.jpg) repeat-x 0 -162px;border-bottom:1px solid #E9E9E9;line-height:28px;}
#traderList .mt h2{height:28px;padding:0 5px 0 20px;background:url(${base}/static/mall/img/bg-allsort.jpg) no-repeat 0 -191px;}
#traderList .mc {padding: 0 5px;}
#traderList .mc .fore {border-top: none;}
#traderList dl {width: 465px;padding: 5px;border-top: 1px dotted #ccc;overflow: hidden;line-height: 24px;}
#traderList dt {float: left;width: 55px;padding-right: 10px;font-weight: bold;text-align: right;color: #666;}
#traderList dt a {color: #666;}
#traderList dd {float: left;width: 395px;}
#traderList dd em {float: left;}
#traderList dd a {white-space: nowrap;margin-right: 16px;}

.widepage #traderList .m {width: 595px;}
.widepage #traderList dl {width: 575px;}
.widepage #traderList dd {width: 510px;}
</style>
<div class="content" id="traderList">
    <div class="fl">
    <#list merchantList as merchant>
        <#if merchant_index%2==0>
        <div class="m" id="trader_${merchant.id}">
            <div class="mt">
                <h2><a href="${base}/shop/${merchant.urlAddress}.html">${merchant.name}&nbsp;</a></h2>
            </div>
            <div class="mc">
                <dl class="fore">
                    <dt>手机号码</dt>
                    <dd>
                        <em>${merchant.mobile}</em>
                    </dd>
                </dl>
                <dl>
                    <dt>固定电话</dt>
                    <dd>
                        <em>${merchant.telphone}</em>
                    </dd>
                </dl>
                <dl>
                    <dt>所在地区</dt>
                    <dd>
                        <em>${merchant.address}</em>
                    </dd>
                </dl>
            </div>
            <!--mc end-->
        </div>
        </#if>
    </#list>
    </div>
    <!--fl end-->
	<div class="fr">
    <#list merchantList as merchant>
        <#if merchant_index%2==1>
        <div class="m" id="trader_${merchant.id}">
            <div class="mt">
                <h2><a href="${base}/shop/${merchant.urlAddress}.html">${merchant.name}</a></h2>
            </div>
            <div class="mc">
                <dl class="fore">
                    <dt>手机号码</dt>
                    <dd>
                        <em>${merchant.mobile}</em>
                    </dd>
                </dl>
                <dl>
                    <dt>固定电话</dt>
                    <dd>
                        <em>${merchant.telphone}</em>
                    </dd>
                </dl>
                <dl>
                    <dt>所在地区</dt>
                    <dd>
                        <em>${merchant.address}</em>
                    </dd>
                </dl>
            </div>
            <!--mc end-->
        </div>
        </#if>
    </#list>
    </div>
    <!--fr end-->
    <div class="clr"></div>
</div>


<#include "mall/jd/service.ftl"/>
<#include "mall/jd/footer.ftl"/>

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