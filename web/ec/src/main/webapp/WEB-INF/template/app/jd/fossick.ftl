<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/jd/head.ftl">
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
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">农资淘</h1>
</header>
<div class="mui-content" style="padding-bottom:50px;">
    <div class="mui-content" style="background-color:#fff; padding-top:15px;">
		<#assign n = 0 />
		<#list typeList as child>
        <div id="segmentedControl" class="mui-segmented-control">
            <h5 style=" width:20%; float:left;">${child.catelog.name}淘</h5>
            <div style="float:left; width:80%; margin-top:2px;">
				<#list child.tagList as tag>
                    <a class="mui-control-item <#if tag_index==0>mui-active</#if>" href="#item${child_index}mobile">
					${tag.name}
                    </a>
				</#list>
            </div>
        </div>
        <div class="mui-content">
			<#list child.tagList as tag>
            <div id="item${tag_index+1}mobile" class="mui-control-content<#if tag_index == 0> mui-active</#if> "  >
                <ul class="mui-table-view mui-grid-view">
				<#list tag.goodsList as goods>
                    <li class="mui-table-view-cell mui-media mui-col-xs-6">
                        <a href="${base}/item/whichapp/${goods.id}.html" target="_blank"">
                            <img class="mui-media-object" src="${goods.pic}_40x30.png">
                            <div class="mui-media-body">${goods.name}</div>
                            <div class="mui-media-body">
                                <span style=" font-weight:bold;">${goods.price?string(priceCurrencyFormat)}</span>
                                <span style="color:#CCC; text-decoration:line-through;">${goods.marketPrice?string(priceCurrencyFormat)}</span>
                            </div>
                        </a>
                    </li>
					<#if goods_index == 3><#break></#if>
				</#list>
                </ul>
            </div>
			</#list>
        </div>
		</#list>
    </div>
</div>
<#include "app/jd/tools.ftl">
</body>
</html>