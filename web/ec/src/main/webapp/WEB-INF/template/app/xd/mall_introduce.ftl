
<!DOCTYPE html>
<html>

<head>
<#include "app/xd/head.ftl">
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
                <p>项目名称： 喜都云商城</p>
                <p>主要经营： 食品，酒水饮料，副食调料，家居百货的交易，配送，支付</p>
                <p> 项目概述：</p>
                <p style="text-indent: 2em;">
		喜都云商城是西安喜都商贸有限公司为各级商超经销商及个人搭建的网络采购平台。商城货品种类多样化，涵盖休闲食品系列，调味品系列，酒水系列，方便食品系列，办公文体，日化系列等。喜都云商城让经销商真正体验零等待零库存一站式购物。
		</p>

            </div>
        </div>
        <div>
            <h5>地理位置</h5>
            <div  style="padding:10px;  line-height:26px; background: #fff;font-size: 15px;">
                <p style="font-size: 15px;">西安市大兴路西北国亨批发商城E区7排4-5号二楼 <br>
                    服务热线: 029-81334430  <br>
                    E-mail：xdgwgc01@163.com </p>
            </div>
        </div>
	<p style="font-size: 12px;text-align: center; margin-top: 8px;">Copyright © 2015-2016   <br> 西安喜都商贸有限公司</p>
    </div>
    </div>
    <!--页面主内容区结束-->
</div>
<#include "app/xd/tools.ftl"/>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    jQuery("img[attr='lazyload']").lazyload({
        threshold : 20,
        effect: "fadeIn"
    });
</script>
</body>
</html>