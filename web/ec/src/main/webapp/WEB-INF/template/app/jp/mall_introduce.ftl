
<!DOCTYPE html>
<html>

<head>
<#include "app/jp/head.ftl">
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
                <p>项目名称： 西安港进出口商品交易中心电子商务平台</p>
                <p>占地面积：6.18平方公里</p>
                <p>主要经营： 进出口货物交易、通关、物流配送、支付结算贸易</p>
                <p>开发分期： 二期</p>
                <p> 开发时间： 2015年</p>
                <p>竣工时间： 2015年 11月</p>
                <p> 项目概述：</p>
                <p style="text-indent: 2em;">
		立足于西安港，拥有线下实体店品牌“ULIFE西安港进口商品直营店”，
		为客户提供线上线下一体的便捷、放心的跨境商品购物渠道。
		主要经营进口食品、进口日用百货、进口名酒、进口母婴用品等。
		</p>

            </div>
        </div>
        <div>
            <h5>地理位置</h5>
            <div  style="padding:10px;  line-height:26px; background: #fff;font-size: 15px;">
                <p style="font-size: 15px;">西安市西安国际港务区港务大道六号 <br>
                    电话： 029-83591918   传真：029-83453501   <br>
                    邮编：710026 E-mail：xitlp@yahoo.com.cn </p>
            </div>
        </div>
	<p style="font-size: 12px;text-align: center; margin-top: 8px;">Copyright © 2015-2016   <br> 西安国际陆港管理服务有限责任公司</p>
    </div>
    </div>
    <!--页面主内容区结束-->
</div>
<#include "app/jp/tools.ftl"/>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    jQuery("img[attr='lazyload']").lazyload({
        threshold : 20,
        effect: "fadeIn"
    });
</script>
</body>
</html>