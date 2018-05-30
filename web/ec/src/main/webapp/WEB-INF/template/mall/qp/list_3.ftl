<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>${grandCatelog.name} - ${parentCatelog.name} - ${catelog.name}</title>
    <meta name="description" content="${grandCatelog.name},${parentCatelog.name},${catelog.name}">
    <meta name="Keywords" content="${grandCatelog.name},${parentCatelog.name},${catelog.name}">
    <link href="${base}/static/img/favicon.ico" rel="shortcut icon"/>
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon"/>
    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="${base}/static/mall/css/list3.css" rel="stylesheet" type="text/css" media="all"/>
	<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <style type="text/css">
        .breadcrumb {
            height: 20px;
            padding: 0 0 4px 6px;
            margin-bottom: 10px;
            overflow: hidden;
            line-height: 20px;
            vertical-align: baseline;
        }
        a:hover, a:active {
            color: #E4393C;
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
            height: 30px;
            padding: 0 10px;
            border: 1px solid #ddd;
            border-bottom: none;
            background: #F7F7F7;
            line-height: 30px;
        }
        #select .mt h1 {
            float: left;
            height: 30px;
            font: normal 15px/30px \5fae\8f6f\96c5\9ed1;
            color: #E4393C;
        }
        #select .mt h1 strong {
            margin-right: 10px;
            font: normal 15px/30px \5fae\8f6f\96c5\9ed1;
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
            width: 140px;
            height: 20px;
            margin-right: 15px;
            padding-top: 5px;
        }
        .selected-c .a-values, .prop-attrs .a-values, .color-attr .a-values, .brand-attr .a-values {
            position: relative;
            overflow: hidden;
            padding-right: 120px;
        }
        .brand-attr .tabcon div {
            float: left;
            overflow: hidden;
            width: 140px;
            height: 20px;
            margin-right: 15px;
            padding-top: 5px;
        }
        .brand-attr .v-tabs a:hover, .brand-attr .v-tabs a.curr {
            color: #E4393C;
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
            width: 548px;
            height: 20px;
        }
        .prop-attrs .v-fold .f-list a:hover, .prop-attrs .v-fold .f-list a.curr {
            color: #E4393C;
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
            display: block;
            padding: 0 10px;
        }
        a:hover {
            color: #E4393C;
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
            border: 1px solid #E4393C;
            background: #E4393C;
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
            color: #E4393C;
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
            color: #E4393C;
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
            width: 247px;
            height: 421px;
            padding: 0;
            height: 100%;
            padding-bottom: 30px;
        }
        #plist li {
            width: 230px;
            padding: 0 13px 10px;
            _padding: 0 12px 10px;
            text-align: left;
            font-family: arial,\5b8b\4f53;
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
    <#--右側上部頁碼-->
        #filter .order a {
            display: block;
            padding: 0 10px;
        }
        a:hover, a:active {
            color: #E4393C;
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
            color: #E4393C;
        }
        .pagin-m .prev-disabled, .pagin-m .next-disabled {
            padding-top: 5px;
            height: 18px;
            line-height: 18px;
        }
        #filter .total {
            float: right;
            height: 22px;
            padding: 2px 15px 2px 0;
            border-right: 1px solid #E7E3E7;
            line-height: 22px;
            font-family: verdana;
            color: #E4393C;
        }
        strong, b {
            font-weight: bold;
        }
        #plist .btns{margin-top:10px;zoom:1;}#plist .btn-buy{float:left;height:19px;padding:0 9px;border:1px solid #ddd;border-radius:2px;margin:0 4px 0 0;background:#F7F7F7;line-height:18px;text-align:center;text-decoration:none;color:#333;background:-moz-linear-gradient(top,#f7f7f7,#f2f2f2);background:-webkit-gradient(linear,0 0,0 100%,from(#f7f7f7),to(#f2f2f2));filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#f7f7f7",endColorstr="#f2f2f2");-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr="#f7f7f7",endColorstr="#f2f2f2")";}#plist .btn-coll{float:left;height:19px;padding:0 9px;border:1px solid #ddd;border-radius:2px;margin:0 4px 0 0;background:#F7F7F7;line-height:18px;text-align:center;text-decoration:none;color:#333;background:-moz-linear-gradient(top,#f7f7f7,#f2f2f2);background:-webkit-gradient(linear,0 0,0 100%,from(#f7f7f7),to(#f2f2f2));filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#f7f7f7",endColorstr="#f2f2f2");-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr="#f7f7f7",endColorstr="#f2f2f2")";}#plist .btn-compare{float:left;height:19px;padding:0 9px;border:1px solid #ddd;border-radius:2px;margin:0 4px 0 0;line-height:18px;text-align:center;text-decoration:none;color:#333;background:-moz-linear-gradient(top,#f7f7f7,#f2f2f2);background:-webkit-gradient(linear,0 0,0 100%,from(#f7f7f7),to(#f2f2f2));filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#f7f7f7",endColorstr="#f2f2f2");-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr="#f7f7f7",endColorstr="#f2f2f2")";}
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
<#include "mall/qp/shortcut.ftl"/>
<#include "mall/qp/header.ftl"/>

<style>

</style>
<div class="content">
	<div class="breadcrumb">
		<strong><a href="${base}/list/${grandCatelog.id}.html">${grandCatelog.name}</a></strong>
		<span>&nbsp;&gt;&nbsp;
		<a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}.html">${parentCatelog.name}</a>&nbsp;&gt;&nbsp;
		<a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html">${catelog.name}</a>
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
            	<a href="${(ai.link)!}" target="_blank" ><img src="${(ai.pic)!}" width="210" height="261" border="0" alt=""></a>
        	</div>
            </#list>
        </div>
	</div><!--left end-->
    <div class="right-extra">


        <div id="select" class="m">
            <div class="mt"><h1>${catelog.name} -<strong>&nbsp;商品筛选</strong></h1></div>
            <div class="mc attrs">
                <div class="brand-attr">
                    <div class="attr">
                        <div class="a-key">品牌：</div>
                        <div class="a-values">
                            <div class="v-option">
                                <span onclick="moreBrand();" option="more" class="o-more"><b></b>更多</span>
                                        <span onclick="lessBrand();" option="less"
                                              class="o-more fold hide"><b></b>收起</span>
                            </div>
                            <div class="v-tabs">
                                <ul class="tab hide">
                                    <li rel="0" class="curr">所有品牌<b></b></li>
                                    <li rel="a">A<b></b></li>
                                    <li rel="b">B<b></b></li>
                                    <li rel="c">C<b></b></li>
                                    <li rel="d">D<b></b></li>
                                    <li rel="e">E<b></b></li>
                                    <li rel="f">F<b></b></li>
                                    <li rel="g">G<b></b></li>
                                    <li rel="h">H<b></b></li>
                                    <li rel="i">I<b></b></li>
                                    <li rel="j">J<b></b></li>
                                    <li rel="k">K<b></b></li>
                                    <li rel="l">L<b></b></li>
                                    <li rel="m">M<b></b></li>
                                    <li rel="n">N<b></b></li>
                                    <li rel="o">O<b></b></li>
                                    <li rel="p">P<b></b></li>
                                    <li rel="q">Q<b></b></li>
                                    <li rel="r">R<b></b></li>
                                    <li rel="s">S<b></b></li>
                                    <li rel="t">T<b></b></li>
                                    <li rel="u" style="display: none;">U<b></b></li>
                                    <li rel="v">V<b></b></li>
                                    <li rel="w">W<b></b></li>
                                    <li rel="x">X<b></b></li>
                                    <li rel="y">Y<b></b></li>
                                    <li rel="z">Z<b></b></li>
                                    <li rel="other" style="display: none;">其它<b></b></li>
                                </ul>
                                <div class="tabcon">
                                <#list brandList as brand>
                                    <div id="brand_id_19570" rel="y" more="false">
                                        <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?brand=${brand.id}&page=1"
                                           title="${brand.name}">${brand.name}</a>
                                    </div>
                                </#list>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="prop-attrs">
                    <div class="attr">
                        <div class="a-key">价格：</div>
                        <div class="a-values">
                            <div class="v-fold">
                                <ul class="f-list">
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?price=M0L199&page=1">0-199</a>
                                    </li>
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?&price=M200L899&page=1">200-899</a>
                                    </li>
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?price=M900L2399&page=1">900-2399</a>
                                    </li>
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?price=M2400L3799&page=1">2400-3799</a>
                                    </li>
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?price=M3800L6999&page=1">3800-6999</a>
                                    </li>
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?price=M7000L20099&page=1">7000-20099</a>
                                    </li>
                                </ul>
                            </div>
                            <div option="more" onclick="moreExpandValue(this)" class="v-option hide"
                                 style="display: block;"><span class="o-more unfold"><b></b>更多</span></div>
                            <div option="less" onclick="lessExpandValue(this)" class="v-option hide"><span
                                    class="o-more unfold"><b></b>收起</span></div>
                        </div>
                    </div>
                </div>
                <div overfour="false" class="prop-attrs ">
                    <div class="attr">
                        <div class="a-key">类别：</div>
                        <div class="a-values">
                            <div class="v-fold">
                                <ul class="f-list">
                                <#list list3 as pc>
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?ext=13987%3A%3A456%5E%5E&page=1">${pc.name}</a>
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
                                        <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?ext=104682%3A%3A7437%5E%5E&page=1">家用</a>
                                    </li>
                                    <li>
                                        <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?ext=542159%3A%3A7437%5E%5E&page=1">商用</a>
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
        </div>
        <div id="filter">
            <div class="cls"></div>
            <div class="fore1">
                <dl class="order">
                    <dt>排序：</dt>
                    <dd <#if pager.orderBy=="sales">class="curr"</#if> >
                    	<a href="${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?orderBy=sales&pageNumber=${pager.pageNumber}">销量</a><b></b>
                    </dd>
                    <dd <#if pager.orderBy=="price">class="curr"</#if>>
                        <a href="${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?orderBy=price&pageNumber=${pager.pageNumber}">价格</a><b></b>
                    </dd>
                    <dd <#if pager.orderBy=="scoreCount">class="curr"</#if>>
                        <a href="${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?orderBy=scoreCount&pageNumber=${pager.pageNumber}">评论数</a><b></b>
                    </dd>
                </dl>
                <div class="pagin pagin-m hide">
                    <span class="text"><i>1</i>/152</span>
                    <span class="prev-disabled">上一页<b></b></span>
                    <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html?page=2"
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
                                <img width="220" height="220" alt="${gl.fullName}" data-img="1" class="err-product" src="${gl.pic}" title="${gl.fullName}">
                            </a>
                        </div>
                        <div class="p-name">
                            <a target="_blank" href="${base}/item/${gl.id}.html" title="${gl.fullName}">${gl.fullName}<font style="color: #ff0000;" name="${gl.id}" class="adwords"></font></a>
                        </div>
                        <div class="p-price">
                            <strong>￥${gl.price}</strong>
                            <span id="${gl.id}">
                                <a class="pt2" title="购买本商品送赠品"></a>
                                <a class="pt4" title="购买本商品送京豆"></a>
                            </span>
                        </div>
                        <div class="extra">
                            <span class="evaluate">
                                <a target="_blank" href="${base}/item/${gl.id}.html">已有&nbsp;<#if gl.scoreCount??>${gl.scoreCount}<#else>0</#if>&nbsp;人评价</a>
                            </span>
                        </div>
                        <div class="btns">
                            <a stock="1010626351" tpl="1" onclick="addCart('${gl.id}','1');" href="javascript:void(0);" target="_blank" class="btn-buy">加入购物车</a>
                            <a id="coll1010626351" onclick="addGoodsAttention('${gl.id}');" href="javascript:void(0);" class="btn-coll">关注</a>
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
	 				<#import "mall/qp/pager.ftl" as p>
	 				<@p.pager pager = pager baseUrl = "/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html" />
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
<#include "mall/qp/service.ftl"/>
<#include "mall/qp/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/list3.js" type="text/javascript"></script>
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
function addGoodsAttention(goodsId) {
	$.ajax({
        type: "get",
        url: "${base}/goods/addToGoodsAttention",
        data: "goodsId="+goodsId,
        success: function(data) {
        	if(data.status=='success'){
        		alert(data.message);
	        }else if(data.status=='warn'){
	        	alert(data.message);
	        }else{
	        	alert(data.message);
	        }
	        
        }
    });
}
</script>
</body>
</html>
