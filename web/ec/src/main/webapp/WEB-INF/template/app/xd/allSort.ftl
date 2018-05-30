<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/xd/head.ftl">
<#--分类修改样式  zyf 11-5-->
    <style>
        .mui-table-view-cell {
            position: relative;
            overflow: hidden;
            padding:10px 15px;
        }
    </style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.location.href='${base}/app_index'">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-title">
       商品分类
    </div>
</header>

<div class="mui-content" style="margin-top:15px;">

    <div id="slider" class="mui-slider">

        <div class="mui-slider-group">
            <div id="item1mobile" class="mui-slider-item mui-control-content2 mui-active">
                <ul class="mui-table-view mui-table-view-chevron">
                <#list catelogList as grandfather>
                    <li class="mui-table-view-cell mui-collapse">
                        <!--标题-->
                        <a class="mui-navigate-right ">
                            <font style="font-size:18px; margin:5px 5px; float:left;">${grandfather.name}</font>
                        </a>
                        <!--列表-->
                        <#list catelogChildrenMap["${grandfather.id}"] as father>
                            <ul class="mui-table-view mui-table-view-chevron">
                                <!--一级列表-->
                                <li class="mui-table-view-cell" style="">
                                   <#--<a class="mui-navigate-right" href="${base}/list/whichapp/${grandfather.id}-${father.id}.html?orderBy=sales&orderType=desc"style="font-size:17px; margin-left: -20px;">${father.name}</a>-->
                                   <a class="mui-navigate-right" href="javascript:categoryPathSj_SP('${grandfather.id},${father.id}')"style="font-size:17px; margin-left: -20px;">${father.name}</a>
                                </li>
                                <!--二级列表-->
                                <#list catelogChildrenMap["${father.id}"] as catelog>
                                    <li class="mui-table-view-cell"style="margin-left: 30px; margin-top: 5px;" >
                                       <#-- <a href="${base}/list/whichapp/${grandfather.id}-${father.id}-${catelog.id}.html?orderBy=sales&orderType=desc" >${catelog.name}</a>-->
                                        <a href="javascript:categoryPathSj_SP('${grandfather.id},${father.id},${catelog.id}')" >${catelog.name}</a>
                                    </li>
                                </#list>
                                <!--二级列表-->
                            </ul>
                        </#list>
                        <!--列表-->
                    </li>
                </#list>
                </ul>
            </div>

        </div>
    </div>
</div>
</body>
<script src="${path}/js/jquery.cookie.js"></script>
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

    function categoryPathSj_SP(categoryPath) {
        var atitude=$.cookie('defaule_atitude')//plus.storage.getItem("defaule_atitude");//plus.storage.getItem("defaule_atitude")//"34.23244406047252";//
        var longitude=$.cookie('defaule_longitude')//plus.storage.getItem("defaule_longitude");//plus.storage.getItem("defaule_longitude")//"108.8804946441841";//
        if (categoryPath != undefined && categoryPath != "") {
            jumpto(hosturl+"/shop/extend/searchFJSJ?categoryPath="+categoryPath+"&atitude="+atitude+"&longitude="+longitude+"&km_GT=&km_LT=1&filterType=km");
        }
    }

</script>
</html>