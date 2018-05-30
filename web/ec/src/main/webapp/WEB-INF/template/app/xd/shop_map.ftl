<!DOCTYPE html>
<html>

<head>
<#include "app/xd/head.ftl">
    <style>
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
</head>
<!--页眉-->
<body style="padding-bottom:55px;">
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        驾车线路
    </div>
</header>
<div style="position:fixed;z-index:10;left:0;right:0;bottom: 0;background-color: #333;color:#fff;font-size: 14px;padding: 10px 15px" id="r-result">正在获取驾车线路...</div>

<div id="allmap"></div>

<input type="hidden" id="atitude" value="${atitude}"/>
<input type="hidden" id="longitude" value="${longitude}"/>
<input type="hidden" id="address" value="${address}"/>
<script src="${path}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=rmRI4a2Py259uEP0RU4NGC5F88S6UdZp"></script>

<script>
    (function (mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        if(ismobile && typeof(plus)!='undefined'){
            plus.navigator.closeSplashscreen();
        }
    }(mui, document));
    setTimeout(function () {
        //console.log("--------------->"+plus.storage.getItem("defaule_address"))
        showBaiduMap();
    }, 600);

    function showBaiduMap(){
        var atitude=$("#atitude").val();
        var longitude=$("#longitude").val();
        var fromaddress=$.cookie('defaule_address')//plus.storage.getItem("defaule_address")
        var toaddress=$("#address").val();
        if(typeof (atitude)!='undefined' && atitude!="" && typeof (longitude)!='undefined' && longitude!=""){
            // 百度地图API功能
            var map = new BMap.Map("allmap");
            map.centerAndZoom(new BMap.Point(108.953459, 34.265679), 12);
            var output = "从<font style='color: red'>"+fromaddress+"</font>到<font style='color: red'>"+toaddress+"</font>驾车需要<font style='color: red'>";
            var searchComplete = function (results){
                if (transit.getStatus() != BMAP_STATUS_SUCCESS){
                    return ;
                }
                var plan = results.getPlan(0);
                output += plan.getDuration(true) + "</font>";                //获取时间
                output += "总路程为：<font style='color: red'>" ;
                output += plan.getDistance(true) + "</font>";             //获取距离
            }
            var transit = new BMap.DrivingRoute(map, {renderOptions: {map: map},
                onSearchComplete: searchComplete,
                onPolylinesSet: function(){
                    setTimeout(function(){
                        $("#r-result").html(output)
                    },"1000");
                }});
            transit.search(fromaddress, toaddress);

        }
    }

</script>
</body>
</html>
