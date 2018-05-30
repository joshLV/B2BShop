
<!DOCTYPE html>
<html>

<head>
<#include "app/jd/head.ftl">
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
        <h1 class="mui-center mui-title">商城介绍</h1>
    </div>
    <!--页面标题栏结束-->
    <!--页面主内容区开始-->
    <div class="mui-page-content " style="padding-bottom:50px;">
        <div class="mui-img-banner">
            <a href="#"><img src="${path}/images/jdjs.jpg"></a>
        </div>
        <div class="mui-content">
            <div>
            <h5>商城介绍</h5>
            <div style="padding:10px; line-height: 26px;">
                <p>项目名称： 立达国际机电城</p>
                <p>占地面积：</p>
                <p>建筑面积： 11万余平方米</p>
                <p>主要经营： 五金机电</p>
                <p>开发分期： 二期</p>
                <p> 开发时间： 2008年</p>
                <p>竣工时间： 2009年 11月</p>
                <p>产品结构： 一连三商铺；小高层电梯公寓</p>
                <p>户型面积：</p>
                <p>公　　寓： 41-72平米</p>
                <p>商　　铺：</p>
                <p>配套设施:  近300个地下车位， 30多间地下配套仓库</p>
                <p> 项目概述：</p>
                <p style="text-indent: 2em;">宁夏立达国际机电城，总建筑面积达11万余平方米，是西部宁夏机电批发市场的2倍多。可容纳机电经营商户约370户，是目前西北地区规模最大的专业机电市场之一。</p>
                <p style="text-indent: 2em;"> 项目位处银川新交通枢纽，新南门汽车站对面，雄踞新南门商圈核心地段，天生财富旺地。加上其超大型专业市场的规模，意味着强大的市场聚集力、广阔的辐射范围。项目必将带动商家升级，经营效益升级，财富升级！</p>
                <p style="text-indent: 2em;"> 项目配套“立达国际公寓”，全品牌装修，精装上阵。国际生活，拒绝繁复拖沓过程，好房子提前到来，形式与内容并重。精致，简约，现代风。品牌装修，不仅有舒适居家氛围，更能快捷打造唯美居家风格。</p>
                <p style="text-indent: 2em;">沿项目西侧为大型百货商场，建筑面积约4万平方米，承接新汽车站优势地段人脉，打造特色大型商业平台，兼有化妆品、针织用品、各式鞋类、小百货、小家电等各类批发项目，可容纳商户500余户。</p>
                <p style="text-indent: 2em;"> 百货商场实行统一规划，统一管理，统一招商的领先模式，设置近7000平米仓储和地下停车场，为客户提供全方位立体化服务，使商家能有效利用聚集化商业资源。</p>
            </div>
        </div>
        <div>
            <h5>地理位置</h5>
            <div  style="padding:10px;  line-height:26px;">
                <p>银川市新汽车站正对面（清和南街东侧，丽景南街西侧）<br>
                    新南门汽车站面对面隔街而望，坐享新汽车站带来的巨大人流、商机，天生经营旺地，引爆机电财富全面升级！<br>
                    公　　交：1路、101路、102路、316路、312路、313路均可直达</p>
            </div>
        </div>
        <div >
            <h5>支付保障</h5>
            <div class="mui-content" style="padding:10px;">
                <p><img src="${path}/images/zf_img.jpg"></p>
            </div>
        </div>
    </div>
    </div>
    <!--页面主内容区结束-->
</div>
<#include "app/jd/tools.ftl"/>
</body>
</html>