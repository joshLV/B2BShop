<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${grandCatelog.name}<#if parentCatelog.name??> - ${parentCatelog.name}</#if><#if catelog.name??> - ${catelog.name}</#if></title>
    <meta name="description" content="${grandCatelog.name},${parentCatelog.name},${catelog.name}">
    <meta name="Keywords" content="${grandCatelog.name},${parentCatelog.name},${catelog.name}">
    <link href="${base}/static/mall/gdnz/img/favicon.ico" rel="shortcut icon"/>
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon"/>
    <link href="${base}/static/mall/gdnz/css/base.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="${base}/static/mall/css/list3.css" rel="stylesheet" type="text/css" media="all"/>
	<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>

    <!-- 20151204 dzz 引入次样式 -->
    <link href="${base}/static/mall/gdnz/css/goods_detail.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        .breadcrumb {
            height: 20px;
            padding: 10px 0 4px 6px;
            margin-bottom: 10px;
            overflow: hidden;
            line-height: 20px;
            vertical-align: baseline;
        }
        a:hover, a:active {
            color: #ea5313;
        }
        .breadcrumb strong, .breadcrumb h1 {
            font-weight: 700;
            line-height: 20px;
            font-size: 18px;
            font-family: "microsoft yahei";
        }
        .m, .sm {
            margin-bottom: 10px;
        }
        .m, .mt, .mc, .mb, .sm, .smt, .smc, .smb {
            overflow: hidden;
            zoom: 1;
        }
        strong, b {
            font-weight: bold;
        }
        .j_logo {
            height: 31px;
            line-height: 31px;
            font-family: \5fae\8f6f\96c5\9ed1;
            font-weight: normal;
            font-size: 15px;
            background: #F7F7F7;
            padding-left: 15px;
        }
        div, img, ul, ol, li, dl, dt, dd {
            margin: 0;
            padding: 0;
            border: 0;
        }
        div {
            display: block;
        }
        .p-name {
        	height:36px;
        	overflow: hidden;
        }
        #hotsale {
            float: left;
            width: 590px;
            height: 137px;
            padding-bottom: 10px;
            _padding-bottom: 7px;
            background: #FCFFFA;
        }
        #i-right {
            overflow: visible;
            position: relative;
            height: 153px;
            border: 1px solid #ddd;
            background: #FCFFFA;
        }
        .m, .sm {
            margin-bottom: 10px;
        }
        .right-extra {
            float: right;
            width: 990px;
            border: 1px solid #e7e3e7;
        }
        #market .mt h2 {
            background-position: 0 -614px;
        }
        #i-right h2 {
            font: normal 15px/1.3 \5fae\8f6f\96c5\9ed1;
        }
        #market li {
            height: 20px;
            line-height: 20px;
            overflow: hidden;
        }
        #market .mc {
            padding: 10px 10px 2px;
            font-family: \5b8b\4f53;
        }
        #select .mt {
            height: 35px;
            padding: 0 10px 0 10px;
            border-bottom:1px solid #E8E8E8;
            background: #F7F7F7;
            line-height: 35px;
        }
        #select .mt h1 {
            float: left;
            height: 35px;
            font: normal 15px/35px \5fae\8f6f\96c5\9ed1;
            color: #ea5313;
        }
        #select .mt h1 strong {
            margin-right: 10px;
            font: normal 15px/35px \5fae\8f6f\96c5\9ed1;
            color: #333;
        }
        #select .mc > div:first-child .attr {
            border-top: none;
        }
        .attr {
            padding: 4px 0 2px;
            overflow: hidden;
            zoom: 1;
            border-top: 1px dotted #ccc;
        }
        .attr .a-key {
            float: left;
            width: 100px;
            font-weight: bold;
            text-align: right;
            line-height: 25px;
        }
        .brand-attr .tabcon div {
            float: left;
            overflow: hidden;
            width: 180px;
            height: 20px;
            margin-right: 15px;
            padding-top: 5px;
        }
        .selected-c .a-values, .prop-attrs .a-values, .color-attr .a-values, .brand-attr .a-values {
            position: relative;
            overflow: hidden;
            /*padding-right: 120px;*/
            float: left;
            width: 800px;
        }
        /*.brand-attr .tabcon div {
            float: left;
            overflow: hidden;
            width: 140px;
            height: 20px;
            margin-right: 15px;
            padding-top: 5px;
        }*/
        .brand-attr .v-tabs a:hover, .brand-attr .v-tabs a.curr {
            color: #ea5313;
        }
        .brand-attr .v-tabs a {
            height: 15px;
            line-height: 15px;
            text-decoration: none;
            overflow: hidden;
            white-space: nowrap;
            color: #005aa0;
        }
        .attr .a-values .v-option {
            position: absolute;
            right: 10px;
            top: 0px;
            width: 105px;
            height: 20px;
            padding-top: 2px;
        }
        .attr .a-values .o-more:hover {
            border-color: #ccc;
            cursor: pointer;
        }
        .attr .a-values .o-more {
            float: right;
            position: relative;
            width: 31px;
            height: 20px;
            padding-right: 14px;
            line-height: 20px;
            line-height: 21px\9;
            text-align: right;
            text-decoration: none;
            cursor: pointer;
            color: #005AA0;
        }
        .prop-attrs .v-fold .f-list {
            overflow: hidden;
            width: 800px;
            height: auto;
        }
        .prop-attrs .v-fold .f-list a:hover, .prop-attrs .v-fold .f-list a.curr {
            color: #ea5313;
        }
        <#--品牌 價格 類別 樣式 -->
        .prop-attrs .v-fold .f-list a {
            float: left;
            height: 15px;
            width: 80px;
            line-height: 25px;
            text-decoration: none;
            white-space: nowrap;
            font-family: verdana;
            color: #005aa0;
        }
        #select .mb .attr-extra div {
            position: relative;
            _display: inline;
            _zoom: 1;
            height: 24px;
            padding: 0 32px 0 24px;
            line-height: 24px;
        }
        #select .mb .attr-extra {
            line-height: 20px;
            text-align: right;
            cursor: pointer;
            font-size: 12px;
        }
        #filter .fore1 {
            overflow: hidden;
            height: 26px;
            padding: 5px 8px;
            border-bottom: 1px solid #E7E3E7;
            zoom: 1;
            margin-bottom: 5px;
        }
        #filter dl, #filter dt, #filter dd {
            float: left;
            line-height: 26px;
            zoom: 1;
        }
        #filter .order .curr a:link, #filter .order .curr a:visited {
            color: #fff;
        }
        #filter .order a {
            float: left;
            display: block;
            padding: 0 10px;
        }
        a:hover {
            color: #ea5313;
            text-decoration: underline;
        }
        #filter .order .curr {
            font-weight: bold;
        }
        #filter .order dd {
            line-height: 24px;
            zoom: 1;
        }
        #filter .order .curr {
            border: 1px solid #ea5313;
            background: #ea5313;
            font-weight: bold;
        }
        #filter .order dd {
            height: 24px;
            border: 1px solid #CECBCE;
            background-position: 0 -73px;
            background-repeat: repeat-x;
            background-color: #fff;
            margin-right: 5px;
            line-height: 24px;
            overflow: hidden;
            zoom: 1;
        }
        #filter .pagin {
            float: right;
            height: 22px;
            padding: 2px 0;
            border-left: 1px solid #fff;
        }
        .pagin-m .prev, .pagin-m .next, .pagin-m .prev-disabled, .pagin-m .next-disabled {
            border-radius: 3px;
            background: #fff;
            padding-top: 3px;
            height: 14px;
            line-height: 14px;
        }
        .pagin .prev, .pagin .prev-disabled {
            padding-left: 12px;
        }
        .pagin .prev-disabled, .pagin .next-disabled {
            color: #ccc;
            cursor: default;
        }
        pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {
            position: relative;
            padding-top: 5px;
            height: 18px;
            line-height: 18px;
        }
        .pagin-m a, .pagin-m span {
            height: 14px;
            line-height: 14px;
            font-size: 12px;
        }
        list.htmlmedia="all"
        .pagin a, .pagin span {
            float: left;
            height: 20px;
            padding: 3px 10px;
            border: 1px solid #ccc;
            margin-left: 2px;
            font-family: arial;
            line-height: 20px;
            font-size: 14px;
            overflow: hidden;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
        }
        #filter .total {
            line-height: 22px;
            font-family: verdana;
            color: #ea5313;
        }
        #filter .fore1 {
            zoom: 1;
        }
        #filter .fore2 {
            padding: 3px 8px;
            zoom: 1;
        }
        #filter .store {
            padding-right: 15px;
            border-right: 1px solid #E7E3E7;
        }
        #filter dd {
            float: left;
            line-height: 26px;
            zoom: 1;
        }
        dt {
            display: block;
        }
        #store-selector {
            position: relative;
            z-index: 5;
            height: 26px;
            margin-right: 10px;
        }
        #filter .type {
            border-right: 1px solid #E7E3E7;
            border-left: 1px solid #fff;
            padding-left: 15px;
        }
        #store-selector.hover .text {
            z-index: 1;
            height: 24px;
            border-bottom: 0;
            background: #fff;
        }
        #store-selector .text {
            float: left;
            position: relative;
            top: 0;
            overflow: hidden;
            height: 23px;
            padding: 0 24px 0 4px;
            border: 1px solid #ddd;
            background: #fff;
            line-height: 23px;
        }
        a:link, a:visited {
            color: #666;
        }
        a {
            color: #666;
            text-decoration: none;
        }
        a:hover, a:active {
            color: #ea5313;
        }
        img {
            vertical-align: middle;
        }
        a img {
            border: 0;
        }
        img {
            vertical-align: middle;
        }
        #plist.ordinary-prebuy .list-h li {
            position: relative;
           /* width: 247px;*/
            height: 421px;
            padding: 0;
            height: 100%;
            padding-bottom: 30px;
        }
        #plist li {
            width: 230px;
            text-align: left;
            font-family: "microsoft yahei",arial,\5b8b\4f53;
            margin-left: 14px;
        }
        .list-h li, .list-h dl {
            float: left;
        }
        .left {
            float: left;
            width: 210px;
        }
        <#--左側列表樣式 -->
        #sortlist {
            border: 1px solid #ddd;
            border-top: 2px solid #999;
        }
        #sortlist .mt {
            display: none;
            height: 24px;
            padding: 3px 8px;
            line-height: 24px;
        }
        #sortlist h2 {
            color: #fff;
        }
        #sortlist .mc {
            width: 208px;
            margin-top: -1px;
            background: #FFF;
        }
        #sortlist h3 {
            height: 30px;
            background-color: #F7F7F7;
            padding: 0 7px 0 10px;
            border-top: 1px solid #ddd;
            cursor: pointer;
            font: normal 14px/30px \5fae\8f6f\96c5\9ed1;
        }
        #sortlist .current ul {
			display: block;
		}
        #sortlist ul {
            overflow: hidden;
            display: none;
            padding: 6px 0;
            border-top: 1px solid #ddd;
            zoom: 1;
        }
        #sortlist .current b {
			background: url(${base}/static/mall/goods/20130603A.png) no-repeat -37px 0;
		}
        #sortlist b {
            float: left;
            width: 16px;
            height: 16px;
            margin: 7px 8px 0 0;
            background: url("${base}/static/mall/goods/20130603A.png") no-repeat -20px 0;
            overflow: hidden;
            cursor: pointer;
        }
        #sortlist li {
			width: 159px;
			height: 18px;
			padding: 3px 15px 3px 35px;
			overflow: hidden;
		}
    <#--右側頁面樣式-->
        .pagin .prev-disabled, .pagin .next-disabled {
            color: #ccc;
            cursor: default;
        }
        .pagin .prev-disabled, .pagin .next-disabled {
            position: relative;
            padding-top: 5px;
            height: 18px;
            line-height: 18px;
        }
        .pagin .current, .pagin .current:link, .pagin .current:visited {
            color: #f60;
            font-weight: 700;
        }
        .current {
            font-family: verdana;
        }
        .pagin a, .pagin span {
            border-radius: 3px;
        }
        .pagin a, .pagin span {
            float: left;
            height: 20px;
            padding: 3px 10px;
            border: 1px solid #ccc;
            margin-left: 2px;
            font-family: arial;
            line-height: 20px;
            font-size: 14px;
            overflow: hidden;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
        }
        .pagin .next, .pagin .next-disabled {
            padding-right: 12px;
        }
        pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {
            position: relative;
            padding-top: 5px;
            height: 18px;
            line-height: 18px;
        }
        .noRecord{padding: 10px;}
        .p-img{width: 220; height: 230px; border: 1px solid #CCCCCC; margin-top: 10px; margin-bottom: 10px;}
        .p-img:hover{ -webkit-box-shadow:0 0 5px rgba(98, 98, 98, .5);
            -moz-box-shadow:0 0 5px rgba(98, 98, 98, .5);
            box-shadow:0 0 5px rgba(98, 98, 98, .5);  }
    <#--右側上部頁碼-->
        #filter .order a {
            display: block;
            padding: 0 10px;
        }
        a:hover, a:active {
            color: #ea5313;
        }
        #filter .pagin {
            float: right;
            height: 22px;
            padding: 2px 0;
            border-left: 1px solid #fff;

        }
        .pagin .text, .pagin .current {
            font-family: verdana;
        }
        .pagin .text, .pagin .current {
            border: 0;
            padding: 4px 11px;
        }
        .pagin .text i {
            font-style: normal;
            font-weight: bold;
            color: #ea5313;
        }
        .pagin-m .prev-disabled, .pagin-m .next-disabled {
            padding-top: 5px;
            height: 18px;
            line-height: 18px;
        }
        .pager{margin-right: 10px;}
        #filter .total {
            float: right;
            height: 22px;
            padding: 2px 15px 2px 0;
            border-right: 1px solid #E7E3E7;
            line-height: 22px;
            font-family: verdana;
            color: #ea5313;
        }
        strong, b {
            font-weight: bold;
        }
        #plist .btns{
            margin-top:10px;
            zoom:1;
            overflow: hidden;
            height: 30px;
            line-height: 30px;
        }

        #plist .btn-buy{float:left;height:28px; padding-left:35px;border: 1px solid #E8E8E8; padding-right: 15px;  position: relative; /*border-radius:2px;*/margin:0 4px 0 0;/*background:#F7F7F7;*/line-height:28px;text-align:center;text-decoration:none;color:#ea5313;}
        #plist .btn-buy:hover{border: 1px solid #ea5313; color: #ea5313;/* text-decoration: underline;*/}
        #plist .btn-buy i{
            position: absolute;
            display: block;
            font-style: normal;
            left:10px;
            top:7px;
            width: 18px;
            height: 18px;
            background: url(${base}/static/mall/gdnz/img/search.ele.png) no-repeat 0 -273px;
        }

        #plist .btn-buy-new{float:left;height:28px; padding-left:35px;border: 1px solid #E8E8E8; padding-right: 15px;  position: relative; /*border-radius:2px;*/margin:0 4px 0 0;/*background:#F7F7F7;*/line-height:28px;text-align:center;text-decoration:none;color: #b2b2b2;}
        #plist .btn-buy-new i{
            position: absolute;
            display: block;
            font-style: normal;
            left:10px;
            top:7px;
            width: 18px;
            height: 18px;
            background: url(${base}/static/mall/gwq/img/search.ele.png) no-repeat 0 -247px;
        }


        #plist .btn-coll{float:left;height:28px;padding-left:35px;border:1px solid #E8E8E8;background: url(${base}/static/mall/gdnz/img/search.ele.png) no-repeat 10px -407px; padding-right: 15px;  position: relative; /*border-radius:2px;*/margin:0 4px 0 0;/*background:#F7F7F7;*/line-height:28px;text-align:center;text-decoration:none;color:#b2b2b2;}
        #plist .btn-coll:hover{border: 1px solid #ea5313; color: #ea5313; /*text-decoration: underline;*/ background: url(${base}/static/mall/gdnz/img/search.ele.png) no-repeat 10px -430px;}
        .showattention{ padding-top:7px; padding-bottom:7px; color: #ea5313 !important; padding-left:35px; padding-right: 15px; border: 1px solid #ea5313; /*text-decoration: underline;*/ background: url(${base}/static/mall/gwq/img/search.ele.png) no-repeat 10px -430px;}



        /* 筛选更多 */
        .list-more{float: left; border: 1px solid #E8E8E8; padding:3px 6px 3px 10px;}
        .list-more a{display: block; float: left;}
        .list-more i{width: 18px; height: 7px; margin-top: 6px; margin-left: 3px;  background: url(${base}/static/mall/gdnz/img/search.ele.png) no-repeat; float: left;}
        .list-less{float: left; border: 1px solid #E8E8E8; padding:3px 6px 3px 10px;}
        .list-less a{display: block; float: left;}
        .list-less i{width: 18px; height: 7px; margin-top: 6px; margin-left: 3px;  background: url(${base}/static/mall/gdnz/img/search.ele.png) no-repeat 0 -34px; float: left;}
        .a-values-more{float: left;overflow: hidden;width: 800px; margin-left: 100px;}
        .a-values-more div {
            float: left;
            overflow: hidden;
            width: 180px;
            height: 20px;
            margin-right: 15px;
            padding-top: 5px;
        }
        .a-values-more a{color: #005aa0}
        .a-values-more a.curr {
            color: #ea5313;
        }

        #filter .order .arrow_write_bottom{background: #ea5313; border: none; }
        #filter .order .arrow_write_bottom a{color: #ffffff;}
        #filter .order .curr b{background: url("${base}/static/img/top_arrow_write.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
        #filter .order .arrow_write_bottom b{background: url("${base}/static/img/bot_arrow_write.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
        #filter .arrow_native b{background: url("${base}/static/img/top_arrow.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
        #filter .arrow_bottom b{background: url("${base}/static/img/bot_arrow.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}

    </style>
    <script type="text/javascript">
        $(".u-category").css("display","none");
        window.pageConfig = {
            compatible: true,
            navId: "list-${catelog.id}"
        };
    </script>
</head>
<body>
<#include "mall/gdnz/shortcut.ftl"/>
<#include "mall/gdnz/header.ftl"/>

<style>

</style>
<div class="content">
	<div class="breadcrumb">
		<strong><a href="${base}/list/${grandCatelog.id}.html">${grandCatelog.name}</a></strong>
        <span>
        <#if parentCatelog.id??>
		&nbsp;&gt;&nbsp;
		    <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}.html">${parentCatelog.name}</a>
        </#if>
        <#if catelog.id??>
            &nbsp;&gt;&nbsp;
                <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html">${catelog.name}</a>
        </#if>
	    </span>
	    </span>
	</div>
</div>
<div class="content m">
	<div class="left">
	    <div id="sortlist" class="m">
	        <div class="mc">
	        	<#list list3 as pc3>
	        		<div class="item"><h3><b></b>${(pc3.name)!}</h3>
	        			<ul>
	        				<#list list4 as pc4>
		        			<#if pc4.parentId== pc3.id>
		        			<li><a href="${base}/list/${grandCatelog.id}-${pc3.id}-${pc4.id}.html">${pc4.name}</a></li>
		        			</#if>
		        			</#list>
	        			</ul>
	        		</div>
	        	</#list>
	        </div>
		</div><!--sortlist end-->
		<div style="position: relative;">
            <#list advertisingImages as ai>
         	<div style="top:0px;left:0px;padding-bottom: 8px">
            	<a href="${(ai.link)!}" target="_blank" ><img src="${(ai.pic)!}@210w_261h.png" width="210" height="261" border="0" alt=""></a>
        	</div>
            </#list>
        </div>


        <!-- 左边相关分类 -->
        <div class="left" style="float: left">
            <div id="related-sorts" class="m m2">
                <div class="mt">
                    <h2>相关分类</h2>
                </div>
                <div class="mc">
                    <ul class="lh">
                    <#if refCatelogList?? && refCatelogList?size &gt; 0>
                        <#list refCatelogList as cat>
                            <#if cat.cateTypeFlage == 2>
                                <li><a href="${base}/list/${cat.grandfather}-${cat.parentId}-${cat.id}.html" title="${cat.name}">${cat.name}</a></li>
                            <#elseif cat.cateTypeFlage ==1 >
                                <li><a href="${base}/list/${cat.parentId}-${cat.id}.html" title="${cat.name}">${cat.name}</a></li>
                            <#else >
                                <li><a href="${base}/list/${cat.id}.html" title="${cat.name}">${cat.name}</a></li>
                            </#if>
                        </#list>
                    </#if>
                    </ul>
                </div>
            </div>
            <div id="related-brands" class="m m2">
                <div class="mt">
                    <h2>同类其他品牌</h2>
                </div>
                <div class="mc">
                    <ul class="lh">
                    <#if brandRefList?? && brandRefList?size &gt; 0>
                        <#list brandRefList as brand>
                            <li><a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?brand=${brand.id}&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>" title="${brand.name}（${brand.sign}）">${brand.name}</a></li>
                        </#list>
                    </#if>
                    </ul>
                </div>
            </div>
        </div>


	</div><!--left end-->
    <div class="right-extra">


        <div id="select" class="m">
            <div class="mt"><h1><#if catelog.id??>${catelog.name}
            <#elseif parentCatelog.id??>
            ${parentCatelog.name}
            <#else>
            ${grandCatelog.name}
            </#if> -<strong>&nbsp;商品筛选</strong></h1></div>
            <div class="mc attrs">
                <div class="brand-attr">
                    <div class="attr">
                        <div class="a-key">品牌：</div>
                        <div class="a-values">
                            <div class="v-tabs">
                                <div class="tabcon">
                                <#list brandList as brand>
                                    <#if brand_index == 8 >
                                        <#break>
                                    </#if>
                                    <div id="brand_id_19570" rel="y" more="false">
                                        <!--品牌中增加 价格与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 Start -->
                                        <#--<a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?brand=${brand.id}&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"-->
                                           <#--title="${brand.name}">${brand.name}</a>-->
                                        <a <#if brand.id==brandFlag>class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?brand=${brand.id}&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"
                                           title="${brand.name}">${brand.name}</a>
                                        <!--品牌中增加 价格与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 End -->
                                    </div>
                                </#list>
                                </div>
                            </div>
                        </div>

                        <div class="list-more" id="more_btn" <#if brandMore == 'true' >style="display: none; "</#if> onclick="$('#less_btn').show();$('#more_btn').hide();$('#brand_more').show();">
                            <a href="javascript:void(0)">更多</a><i></i>
                        </div>
                        <div class="list-less" id="less_btn" <#if brandMore != 'true' >style="display: none;"</#if>  onclick="$('#less_btn').hide();$('#more_btn').show();$('#brand_more').hide();">
                            <a href="javascript:void(0)">收起</a><i></i>
                        </div>
                        <div id="brand_more" class="a-values-more" <#if brandMore != 'true' >style="display: none; "</#if>>
                        <#list brandList as brand>
                            <#if brand_index &gt;= 8 >
                                <div id="brand_id_19570" rel="y" more="false">
                                    <!--品牌中增加 价格与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 Start -->
                                <#--<a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?brand=${brand.id}&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"-->
                                <#--title="${brand.name}">${brand.name}</a>-->
                                    <a <#if brand.id==brandFlag>class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?brand=${brand.id}&brandMore=true&page=1<#if priceFlag??>&price=${priceFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>"
                                       title="${brand.name}">${brand.name}</a>
                                    <!--品牌中增加 价格与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 End -->
                                </div>
                            </#if>
                        </#list>
                        </div>

                    </div>
                </div>
                <div class="prop-attrs">
                    <div class="attr">
                        <div class="a-key">价格：</div>
                        <div class="a-values">
                            <div class="v-fold">
                                <ul class="f-list">
                                <!--价格中增加 品牌与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 Start -->
                                    <li>
                                        <a <#if priceFlag=="M0L199">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M0L199&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">0-199</a>
                                    </li>
                                    <li>
                                        <a <#if priceFlag=="M200L499">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?&price=M200L499&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">200-499</a>
                                    </li>
                                    <li>
                                        <a <#if priceFlag=="M500L999">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M500L999&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">500-999</a>
                                    </li>
                                    <li>
                                        <a <#if priceFlag=="M1000L4999">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M1000L4999&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">1000-4999</a>
                                    </li>
                                    <li>
                                        <a <#if priceFlag=="M5000">class="curr"</#if> href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?price=M5000&page=1<#if brandFlag??>&brand=${brandFlag}</#if><#if orderByFlag??>&orderBy=${orderByFlag}</#if>">&ge;5000</a>
                                    </li>

                                    <!-- 自定义价格区间 -->
                                    <li>
                                        <input id="priS" type="text" style="width:39px;border: 1px solid #E8E8E8;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="<#if priS??>${priS}<#else>0</#if>"/>
                                        <em>-</em>
                                        <input id="priE" type="text" style="width:39px;border: 1px solid #E8E8E8;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="<#if priE??>${priE}<#else>100</#if>" />
                                        <input type="button" value="确定" onclick="javascript:searchPriceArea();"/>
                                    </li>
                                    <!-- #自定义价格区间 -->
                                <!--价格中增加 品牌与排序查询条件 Auth:zhangqiang Time:2015-09-30 15:50:35 End -->
                                </ul>
                            </div>
                            <div option="more" onclick="moreExpandValue(this)" class="v-option hide"
                                 style="display: block;">
                                <!--隐藏更多按钮 Auth:zhangqiang Time:2015-10-08 14:10:06 Start -->
                                <span class="o-more unfold hide"><b></b>更多</span>
                                <!--隐藏更多按钮 Auth:zhangqiang Time:2015-10-08 14:10:06 End -->
                            </div>
                            <div option="less" onclick="lessExpandValue(this)" class="v-option hide"><span
                                    class="o-more unfold"><b></b>收起</span></div>
                        </div>
                    </div>
                </div>
                <!--先将类别 适用人群 隐藏 Auth:zhangqiang Time:2015-09-24 15:30:45 Start -->
                <!--
                <div overfour="false" class="prop-attrs ">
                    <div class="attr">
                        <div class="a-key">类别：</div>
                        <div class="a-values">
                            <div class="v-fold">
                                <ul class="f-list">
                                <#list list3 as pc>
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?ext=13987%3A%3A456%5E%5E&page=1">${pc.name}</a>
                                    </li>
                                </#list>
                                </ul>
                            </div>
                            <div option="more" onclick="moreExpandValue(this)" class="v-option hide"><span
                                    class="o-more unfold"><b></b>更多</span></div>
                            <div option="less" onclick="lessExpandValue(this)" class="v-option hide"><span
                                    class="o-more unfold"><b></b>收起</span></div>
                        </div>
                    </div>
                </div>
                <div overfour="false" class="prop-attrs ">
                    <div class="attr">
                        <div class="a-values">
                            <div option="more" onclick="moreExpandValue(this)" class="v-option hide"><span
                                    class="o-more unfold"><b></b>更多</span></div>
                            <div option="less" onclick="lessExpandValue(this)" class="v-option hide"><span
                                    class="o-more unfold"><b></b>收起</span></div>
                        </div>
                    </div>
                </div>
                <div overfour="true" class="prop-attrs hide">
                    <div class="attr">
                        <div class="a-key">适用人群：</div>
                        <div class="a-values">
                            <div class="v-fold">
                                <ul class="f-list">
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?ext=104682%3A%3A7437%5E%5E&page=1">家用</a>
                                    </li>
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?ext=542159%3A%3A7437%5E%5E&page=1">商用</a>
                                    </li>
                                </ul>
                            </div>
                            <div option="more" onclick="moreExpandValue(this)" class="v-option hide"><span
                                    class="o-more unfold"><b></b>更多</span></div>
                            <div option="less" onclick="lessExpandValue(this)" class="v-option hide"><span
                                    class="o-more unfold"><b></b>收起</span></div>
                        </div>
                    </div>
                </div>
                <div id="moreProp" onclick="moreProp(this);" class="mb">
                    <div class="attr-extra">
                        <div>更多选项（适用人群)<b></b></div>
                    </div>
                </div>
                <div id="lessProp" onclick="lessProp(this);" class="mb hide">
                    <div class="attr-extra open">
                        <div>收起<b></b></div>
                    </div>
                </div>
                <div id="advanced" style="margin-bottom: 10px;" class="mb hide"></div>
            </div>
        </div>-->
        <!--先将类别 适用人群 隐藏 Auth:zhangqiang Time:2015-09-24 15:30:45 End -->
        <div id="filter">
            <div class="cls"></div>
            <div class="fore1">
                <dl class="order">
                    <dt>排序：</dt>
                    <dd <#if pager.orderBy=="sales" && pager.orderType=="desc">class="arrow_write_bottom" <#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="curr" <#else>class="arrow_native"</#if>>
                    <#if pager.orderBy=="sales" && pager.orderType=="desc">
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a><b></b>
                    <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a><b></b>
                    <#else>
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">销量</a><b></b>
                    </#if>
                    </dd>
                    <dd <#if pager.orderBy=="price" && pager.orderType=="desc">class="arrow_write_bottom" <#elseif pager.orderBy=="price" && pager.orderType=="asc">class="curr" <#else>class="arrow_native"</#if>>
                    <#if pager.orderBy=="price" && pager.orderType=="desc">
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a><b></b>
                    <#elseif pager.orderBy=="price" && pager.orderType=="asc">
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a><b></b>
                    <#else>
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">价格</a><b></b>
                    </#if>
                    </dd>
                    <dd <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">class="arrow_write_bottom" <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">class="curr" <#else>class="arrow_native"</#if>>
                    <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a><b></b>
                    <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a><b></b>
                    <#else>
                        <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}<#if brandFlag??>&brand=${brandFlag}</#if><#if priceFlag??>&price=${priceFlag}</#if>">评论数</a><b></b>
                    </#if>
                    </dd>
                </dl>
                <div class="pagin pagin-m hide">
                    <span class="text"><i>1</i>/152</span>
                    <span class="prev-disabled">上一页<b></b></span>
                    <a href="${base}/list/${grandCatelog.id}<#if parentCatelog.id??>-${parentCatelog.id}</#if><#if catelog.id??>-${catelog.id}</#if>.html?page=2"
                       class="next">下一页<b></b></a>
                </div>
                <div class="total">
                    <span>共<strong>${total}</strong>个商品</span>
                </div>
                <span class="clr"></span>
            </div>
        </div>
        <div id="plist" class="m plist-n7a ordinary-prebuy">
            <ul class="list-h">
            <#list goodslist as gl>
                <li index="0" sku="${gl.id}" selfservice="0">
                    <div class="lh-wrap">
                        <div class="p-img">
                            <a target="_blank" href="${base}/item/${gl.id}.html">
                                <img width="230" height="230" alt="${gl.fullName}" data-img="1" class="err-product" src="${gl.pic}@230w_230h.png" title="${gl.fullName}">
                            </a>
                        </div>
                        <div class="p-name">
                            <a target="_blank" href="${base}/item/${gl.id}.html" title="${gl.fullName}">${gl.fullName}<font style="color: #ff0000;" name="${gl.id}" class="adwords"></font></a>
                        </div>
                        <div class="p-price">
                            <strong>
                            <#--Desc:市场价为0时显示为价格面议,加入购物车与购买 无法点击 Auth:zhangqiang Time:2016-01-14 11:43:14 Start -->
                                <#if gl.price == '0'>
                                    价格面议
                                <#else>
                                    ￥${gl.price}
                                </#if>
                            </strong>
                            <span id="${gl.id}">
                                <a class="pt2" title="购买本商品送赠品"></a>
                                <a class="pt4" title="购买本商品送京豆"></a>
                            </span>
                        </div>
                        <!--增加商品销量 Auth:zhangqiang Time:2015-09-24 17:19:35 Start -->
                        <div class="extra">
                            <strong>销量&nbsp;<#if gl.sales??>${gl.sales}<#else>0</#if></strong>
                        <div>
                        <!--增加商品销量 Auth:zhangqiang Time:2015-09-24 17:19:35 End -->
                        <div class="extra">
                            <span class="evaluate">
                                <a target="_blank" href="${base}/item/${gl.id}.html">已有&nbsp;<#if gl.scoreCount??>${gl.scoreCount}<#else>0</#if>&nbsp;人评价</a>
                            </span>
                        </div>
                        <div class="btns">
                            <#if gl.price == '0'>
                                <a stock="1010626351" tpl="1" class="btn-buy-new"><i></i>加入购物车</a>
                            <#else>
                                <a stock="1010626351" tpl="1" onclick="addCart('${gl.id}','1');" href="javascript:void(0);" class="btn-buy"><i></i>加入购物车</a>
                            </#if>
                        <#--Desc:市场价为0时显示为价格面议,加入购物车与购买 无法点击 Auth:zhangqiang Time:2016-01-14 11:43:14 End -->
                            <#--<a stock="1010626351" tpl="1" href="${base}/item/${gl.id}.html" class="btn-buy">加入购物车</a>-->
                            <a id="coll1010626351" onclick="addGoodsAttention('${gl.id}',this);" href="javascript:void(0);" class="btn-coll">关注</a>
                            <!--<a id="comp_1010626351" skuid="1010626351" class="btn-compare btn-compare-s"><span></span>对比</a>-->
                        </div>
                    </div>
                </li>
            </#list>
            </ul>
        </div>
        <div class="m clearfix">
		    <div class="pagin fl">
	 			<#if (pager.list?size > 0)>
	 				<#import "mall/gdnz/pager.ftl" as p>
                    <#--分页时增加价格与品牌条件 Auth:zhangqiang Time:2015-09-28 13:47:25 Start -->
                    <#if parentCatelog.id?? && catelog.id?? &&  grandCatelog.id??>
                        <#--<@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html" />-->
                        <@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?price=${priceFlag}&brand=${brandFlag}" />
                    <#elseif parentCatelog.id?? && grandCatelog.id??>
                        <#--<@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}.html" />-->
                       <@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}.html?price=${priceFlag}&brand=${brandFlag}" />
                    <#else>
                        <#--<@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}.html" />-->
                        <@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}.html?price=${priceFlag}&brand=${brandFlag}" />
                    </#if>
                   <#--分页时增加价格与品牌条件 Auth:zhangqiang Time:2015-09-28 13:47:25 End -->
	 			<#else>
				<div class="noRecord">
					尚未发布任何信息!
				</div>
				</#if>
			</div>
		</div>
    </div>
    <!--right-extra end-->
    <div class="clr"></div>
</div>
</div>
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
<script src="${base}/static/mall/js/list3.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/layer.js" type="text/javascript"></script>
<script type="text/javascript">
$("#sortlist h3").bind("click",function(){
    var element=$(this).parent();
    if (element.hasClass("current")){
        element.removeClass("current");
    }else{
        element.addClass("current");
    }
})
function addCart(goodsId, cnt) {
	window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
}
function addGoodsAttention(goodsId,item) {
	$.ajax({
        type: "get",
        url: "${base}/goods/addToGoodsAttention",
        data: "goodsId="+goodsId,
        success: function(data) {
            if(data.status=='success'){
                layer.alert(data.message,{icon:1});
                $(item).removeClass("btn-coll").addClass("showattention");
                $(item).text('已关注');
                $(item).attr("onclick", "");
            }else if(data.status=='warn'){
                layer.alert(data.message,{icon:2});
                $(item).removeClass("btn-coll").addClass("showattention");
                $(item).text('已关注');
                $(item).attr("onclick", "");
            }else if(data.status=='NOLOGIN'){
                layer.alert("登录后才可关注商品",{icon:2},function(){
                    window.location="${base}/member/login";
                });
            }else{
                layer.alert(data.message,{icon:2});
            }
	        
        }
    });
}

/**
 * 查询价格区间
 */
function searchPriceArea() {
    var priS = $("#priS").val();
    var priE = $("#priE").val();

    var parentCatelogId = $("#getParentCatelogId").val();
    var catelogId = $("#getCatelogId").val();
    var brandFlag = $("#getBrandFlag").val();
    var orderByFlag = $("#getOrderByFlag").val();

    var srcUrl = "${base}/list/${grandCatelog.id}";
    if(parentCatelogId!="" && parentCatelogId!=null) {
        srcUrl += "-"+parentCatelogId;
    }
    if(catelogId!="" && catelogId!=null) {
        srcUrl +="-"+catelogId;
    }
    srcUrl += ".html?price=";
    if(priS) {
        srcUrl +="M" + priS;
    }
    if(priE) {
        srcUrl += "L" + priE;
    }
    srcUrl += "&page=1";
    if(brandFlag!="" && brandFlag!=null) {
        srcUrl += "&brand=" + brandFlag
    }
    if(orderByFlag!="" && orderByFlag!=null) {
        srcUrl += "&orderBy=" + orderByFlag;
    }

    window.location.href = srcUrl;
}
</script>
</body>
</html>
