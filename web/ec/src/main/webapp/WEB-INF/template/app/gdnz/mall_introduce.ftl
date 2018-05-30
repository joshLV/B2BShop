
<!DOCTYPE html>
<html>

<head>
<#include "app/gdnz/head.ftl">
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
                <p>项目名称： 58百亩园商品交易电子商务平台</p>
                <p>主要经营： 有硫酸钾复合肥、有机-无机复肥、硝硫基肥、缓控释肥、微生物菌剂、生物有机肥六大系列的化肥产品，种子，农药等农产品</p>
                <p> 项目概述：</p>
                <p style="text-indent: 2em;">
                    陕西供销集团光大农资有限公司倾力打造的光大农资城供货平台；着力建设陕西供销系统农资经营服务体系；
                    致力于陕西农资电子商务探索；旨在用互联网+平台+体系+农户的模式，安全、快捷、低成本的向农户提供放心农资，确保农业生产安全。
		</p>

            </div>
        </div>
        <div>
            <h5>地理位置</h5>
            <div  style="padding:10px;  line-height:26px; background: #fff;font-size: 15px;">
                <p style="font-size: 15px;">陕西供销集团光大农资有限公司 <br>
                    电话： 0913-8123026 / 0913-1570606205<br>
                    地址： 陕西省渭南市北塘路北段<br>
            </div>
        </div>
	<p style="font-size: 12px;text-align: center; margin-top: 8px;">Copyright © 2015-2016   <br> 陕西供销集团光大农资有限公司</p>
    </div>
    </div>
    <!--页面主内容区结束-->
</div>
<#include "app/gdnz/tools.ftl"/>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    jQuery("img[attr='lazyload']").lazyload({
        threshold : 20,
        effect: "fadeIn"
    });
</script>
</body>
</html>