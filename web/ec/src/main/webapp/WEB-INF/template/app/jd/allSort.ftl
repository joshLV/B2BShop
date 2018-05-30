<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/jd/head.ftl">

    <script>
        function s(key) {
            if (key != undefined && key != "" && key != "请输入您要找的商品名称") {
                window.location.href = "${base}/search/sa?key=" + key;
            }
        }
        (function(mui, doc) {
            mui.init({
                statusBarBackground: '#ffffff',
                swipeBack: true
            });
            mui.plusReady(function(){
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }(mui, document));
    </script>
</head>

<body>

<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.location.href='${base}/app_index'">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-title">
        <input type="search" id="search" class="mui-input-clear" onkeydown="javascript:if(event.keyCode==13){ s(document.getElementById('search').value);return false;}" placeholder="请输入您要找的商品名称">
    </div>
</header>

<div class="mui-content" style="margin-top:15px;">

    <div id="slider" class="mui-slider">
        <#--<div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
            <a class="mui-control-item" href="#item1mobile">
                农资类
            </a>
            <a class="mui-control-item" href="#item2mobile">
                养殖类
            </a>
        </div>-->
        <#--<div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-4"></div>-->
        <!--农资类-->
        <div class="mui-slider-group">
            <div id="item1mobile" class="mui-slider-item mui-control-content2 mui-active">
                <ul class="mui-table-view mui-table-view-chevron">
                <#list catelogList as grandfather>
                    <#if grandfather.catelogType == "agricultural">
                    <li class="mui-table-view-cell mui-collapse">
                        <!--标题-->
                        <a class="mui-navigate-right ">
                            <font style="font-size:22px; margin:5px 5px; float:left;">${grandfather.name}</font>
                        </a>
                        <!--标题-->

                        <!--标题下面那三个-->
                        <#list catelogChildrenMap["${grandfather.id}"] as father>
                                <span class="mui-black"><a href="${base}/list/whichapp/${grandfather.id}-${father.id}.html">${father.name}</a>&nbsp;|
                            <#if father_index==2><#break></#if>
                        </#list>
                        <!--标题下面那三个-->

                        <!--列表-->
                        <#list catelogChildrenMap["${grandfather.id}"] as father>
                            <ul class="mui-table-view mui-table-view-chevron">
                                <!--一级列表-->
                                <li class="mui-table-view-cell">
                                   <a class="mui-navigate-right" href="${base}/list/whichapp/${grandfather.id}-${father.id}.html"style="font-size:18px;">${father.name}</a>
                                </li>
                                <!--一级列表-->
                                <!--二级列表-->
                                <#list catelogChildrenMap["${father.id}"] as catelog>
                                    <li class="mui-table-view-cell">
                                        <a href="${base}/list/whichapp/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a>
                                    </li>
                                </#list>
                                <!--二级列表-->
                            </ul>

                        </#list>
                        <!--列表-->
                    </li>
                    </#if>
                </#list>
                </ul>
            </div>
            <!--养殖类-->
     <#--       <div id="item2mobile" class="mui-slider-item mui-control-content2">
                <ul class="mui-table-view mui-table-view-chevron">
                <#list catelogList as grandfather>
                    <#if grandfather.catelogType == "farm">
                        <li class="mui-table-view-cell mui-collapse">
                            <!--标题&ndash;&gt;
                            <a class="mui-navigate-right">

                                <font style="font-size:22px; margin:5px 5px; float:left;">${grandfather.name}</font>
                            </a>
                            <!--标题&ndash;&gt;

                            <!--标题下面那三个&ndash;&gt;
                            <#list catelogChildrenMap["${grandfather.id}"] as father>
                            <span class="mui-black"><a href="${base}/list/whichapp/${grandfather.id}-${father.id}.html">${father.name}</a>&nbsp;|
                                <#if father_index==2><#break></#if>
                            </#list>
                            <!--标题下面那三个&ndash;&gt;

                            <!--列表&ndash;&gt;
                            <#list catelogChildrenMap["${grandfather.id}"] as father>
                                <ul class="mui-table-view mui-table-view-chevron">
                                    <!--一级列表&ndash;&gt;
                                    <li class="mui-table-view-cell">
                                        <a class="mui-navigate-right" href="${base}/list/whichapp/${grandfather.id}-${father.id}.html"style="font-size:18px;">${father.name}</a>
                                    </li>
                                    <!--一级列表&ndash;&gt;
                                    <!--二级列表&ndash;&gt;
                                    <#list catelogChildrenMap["${father.id}"] as catelog>
                                        <li class="mui-table-view-cell">
                                            <a href="${base}/list/whichapp/${grandfather.id}-${father.id}-${catelog.id}.html">${catelog.name}</a>
                                        </li>
                                    </#list>
                                    <!--二级列表&ndash;&gt;
                                </ul>

                            </#list>
                            <!--列表&ndash;&gt;
                        </li>
                    </#if>
                </#list>
                </ul>
            </div>-->
        </div>
    </div>
</div>
</body>
</html>