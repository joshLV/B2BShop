<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js"></script>
    <script src="${base}/static/mall/nsc/js/jquery.kinMaxShow-1.1.min.js"></script>
    <script src="${base}/static/mall/nsc/js/kefu.js"></script>
    <script type="text/javascript">
        window.pageConfig={
            compatible:true,
            navId:"allSort"
        };
        $(window).load(function(e) {
            $(".u-category").hide();
            /*二级页面*/
            $(".m-category").hover(function(e){
                $(".u-category").show();
            },function(e){
                $(".u-category").hide();
            });
            $(".p_box_int").idTabs("!mouseover");
        });
    </script>
</head>
<body>
<#assign path="mall/nsc" />
<div class="g-doc">
	<div class="g-hd">
	<#include "${path}/shortcut.ftl"/>
	<#include "${path}/header.ftl"/>
	</div>
	<div class="g-bd">
        <div class="content" id="allsort">
            <div class="fl">
			<#list catelogList as grandfather>
				<#if grandfather_index%2==0>
                    <div class="m" id="catelog_${grandfather.id}">
                        <div class="mt">
                            <h2><a href="${base}/list/${grandfather.id}.html">${grandfather.name}</a></h2>
                        </div>
                        <div class="mc">
							<#list catelogChildrenMap["${grandfather.id}"] as father>
                                <dl <#if father_index==0>class="fore"</#if>>
                                    <dt><a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a></dt>
                                    <dd>
										<#list catelogChildrenMap["${father.id}"] as catelog>
                                            <em><a title="${catelog.name}" href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a></em>
										</#list>
                                    </dd>
                                </dl>
							</#list>
                        </div><!--mc end-->
                    </div><!--catelog_${grandfather.id} end-->
				</#if>
			</#list>
            </div><!--fl end-->
            <div class="fr">
			<#list catelogList as grandfather>
				<#if grandfather_index%2==1>
                    <div class="m" id="catelog_${grandfather.id}">
                        <div class="mt">
                            <h2><a href="${base}/list/${grandfather.id}.html">${grandfather.name}</a></h2>
                        </div>
                        <div class="mc">
							<#list catelogChildrenMap["${grandfather.id}"] as father>
                                <dl <#if father_index==0>class="fore"</#if>>
                                    <dt><a href="${base}/list/${grandfather.id}-${father.id}.html">${father.name}</a></dt>
                                    <dd>
										<#list catelogChildrenMap["${father.id}"] as catelog>
                                            <em><a title="${catelog.name}" href="${base}/list/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a></em>
										</#list>
                                    </dd>
                                </dl>
							</#list>
                        </div><!--mc end-->
                    </div><!--catelog_${grandfather.id} end-->
				</#if>
			</#list>
            </div><!--fr end-->
            <div class="clr"></div>
        </div>
	</div>
	<div class="g-bd2">
		<#include "${path}/service.ftl" />
	</div>
	<#include "${path}/footer.ftl" />
</div>
<#--<div class="content">-->
	<#--<div class="breadcrumb">-->
		<#--<h1><a href="${base}/index">首页</a></h1>-->
		<#--<span>&nbsp;&gt;&nbsp;<a href="${base}/allSort">全部商品分类</a></span>-->
	<#--</div><!--breadcrumb end &ndash;&gt;-->
	<#--<div class="clr"></div>-->
<#--</div>-->

<style>
#allsort .m {width: 485px;border: 1px solid #E9E9E9;}

#allsort .mt{height:28px;background:url(${base}/static/mall/img/bg-allsort.jpg) repeat-x 0 -162px;border-bottom:1px solid #E9E9E9;line-height:28px;}
#allsort .mt h2{height:28px;padding:0 5px 0 20px;background:url(${base}/static/mall/img/bg-allsort.jpg) no-repeat 0 -191px;}
#allsort .mc {padding: 0 5px;}
#allsort .mc .fore {border-top: none;}
#allsort dl {width: 465px;padding: 5px;border-top: 1px dotted #ccc;overflow: hidden;line-height: 24px;}
#allsort dt {float: left;width: 55px;padding-right: 10px;font-weight: bold;text-align: right;color: #CC0000;}
#allsort dt a {color: #CC0000;}
#allsort dd {float: left;width: 395px;}
#allsort dd em {float: left;}
#allsort dd a {white-space: nowrap;margin-right: 16px;}

.widepage #allsort .m {width: 595px; margin-top: 10px;}
.widepage #allsort dl {width: 575px;}
.widepage #allsort dd {width: 510px;}
</style>

<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
$(function () {
	
});
</script>
</body>
</html>