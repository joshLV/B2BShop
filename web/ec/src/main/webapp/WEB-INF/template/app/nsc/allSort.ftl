<!DOCTYPE html>
<html class="ui-page-login">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>文昌农商场</title>
    <link href="${base}/static/app/nsc/theme/red/mui.min.css" rel="stylesheet" />
    <link href="${base}/static/app/nsc/theme/red/style.css" rel="stylesheet" />
    <link href="${base}/static/app/nsc/theme/red/my.css" rel="stylesheet" />
    <link href="${base}/static/app/nsc/theme/red/mui.listpicker.css" rel="stylesheet" />
    <link href="${base}/static/app/nsc/theme/red/mui.poppicker.css" rel="stylesheet" />
    <script src="${base}/static/app/nsc/js/mui.min.js"></script>

    <script>
        function s(key) {
            if (key != undefined && key != "" && key != "请输入您要找的商品名称") {
                window.location.href = "${base}/search/sa?key=" + key;
            }
        }
        (function(mui, doc) {
            mui.init({
                statusBarBackground: '#f7f7f7',
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
        <div id="sliderSegmentedControl" class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
            <a class="mui-control-item" href="#item1mobile">
                农资类
            </a>
            <a class="mui-control-item" href="#item2mobile">
                养殖类
            </a>
        </div>
        <div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-4"></div>
        <!--农资类-->
        <div class="mui-slider-group">
            <div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
                <ul class="mui-table-view mui-table-view-chevron">
                <#list catelogList as grandfather>
                    <#if grandfather.catelogType == "agricultural">
                    <li class="mui-table-view-cell mui-collapse">
                        <!--标题-->
                        <a class="mui-navigate-right">
                            <img src="${base}/static/app/nsc/images/icon_zz.png" style="margin-bottom:5px; float:left;">
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
            <div id="item2mobile" class="mui-slider-item mui-control-content">
                <ul class="mui-table-view mui-table-view-chevron">
                <#list catelogList as grandfather>
                    <#if grandfather.catelogType == "farm">
                        <li class="mui-table-view-cell mui-collapse">
                            <!--标题-->
                            <a class="mui-navigate-right">
                                <img src="${base}/static/app/nsc/images/icon_zz.png" style="margin-bottom:5px; float:left;">
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

        </div>
    </div>
</div>
</body>
</html>