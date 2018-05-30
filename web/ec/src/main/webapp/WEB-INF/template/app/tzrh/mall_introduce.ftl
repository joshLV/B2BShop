
<!DOCTYPE html>
<html>

<head>
<#include "app/tzrh/head.ftl">
    <style>


        .mui-table-view.mui-grid-view .mui-table-view-cell .mui-media-body{
            font-size: 15px;
            margin-top:8px;
            color: #333;
        }
        .mui-content img{width:100%;}
    </style>
</head>

<body>
<!--页面主结构开始-->
<div id="app" class="mui-views">
    <div class="mui-view">
        <div class="mui-navbar">
        </div>
        <div class="mui-pages">
        </div>
    </div>
</div>
<!--页面主结构结束-->
<!--单页面开始-->
<div id="setting" class="mui-page">
    <!--页面标题栏开始-->
    <div class="mui-navbar-inner mui-bar mui-bar-nav">
        <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
            <span class="mui-icon mui-icon-left-nav"></span>
        </button>
        <h1 class="mui-center mui-title">关于我们</h1>
    </div>
    <!--页面标题栏结束-->
    <!--页面主内容区开始-->
    <div class="mui-page-content " style="padding-bottom:50px;margin-top: 45px;">
        <div class="mui-img-banner">
            <a href="#"><img attr='lazyload' src="${picloading}" data-original="${path}/images/jdjs.jpg"></a>
        </div>
        <div class="mui-content">
            <div class="about_bg">
            <h5>商城介绍</h5>
            <div style="padding:10px; line-height: 26px;">
                <p style="text-align: left; text-indent: 2em;">
    天泽日化商城是由西安天泽化妆品有限公司担纲运营。公司从2000年开始代理蒂花之秀品牌，是陕西省总代理，覆盖面积是陕西省所有的县城及乡镇批发，化妆品零售店客户，及超市配送，还经营各种名品护肤及洗护用品。现在代理的品牌有：蒂花之秀，广东名臣欧萱系列，云南三七牙膏，绮梦牙刷系列，自然使者面膜。
</p>
            </div>
        </div>
        <div>
            <h5>地理位置</h5>
            <div  style="padding:10px;  line-height:26px; background: #fff;font-size: 15px;">
               <p style="text-align: left;">
    西安市大兴西路国亨市场E区2排15至17号
</p>
<p style="text-align: left;">
    电话：029-84265316 029-84420836
</p>
<p style="text-align: left;">
    E-mail:970409196@qq.com
</p>
            </div>
        </div>
	<p style="font-size: 12px;text-align: center; margin-top: 8px;">Copyright © 2015-2016   <br> 西安天泽化妆品有限公司</p>
    </div>
    </div>
    <!--页面主内容区结束-->
</div>
<#include "app/tzrh/tools.ftl"/>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    jQuery("img[attr='lazyload']").lazyload({
        threshold : 20,
        effect: "fadeIn"
    });
</script>
</body>
</html>