
<!DOCTYPE html>
<html>

<head>
    <#assign path="${base}/static/app/nsc"/>
    <meta charset="utf-8">
    <title>文昌农商场</title>
    <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${path}/theme/red/mui.min.css">
    <link href="${path}/theme/red/my.css" rel="stylesheet" />
    <script src="${base}/static/app/nsc/js/mui.min.js"></script>
    <script src="${base}/static/app/nsc/js/mui.enterfocus.js"></script>
    <script src="${base}/static/app/nsc/js/app.js"></script>
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
            <a href="#"><img src="http://dcloudio.github.io/mui/assets/img/yuantiao.jpg"></a>
        </div>
        <div class="mui-content">
            <h5>商城介绍</h5>
            <div class="mui-content" style="padding:10px; line-height: 30px;">
                <p>西安文昌农资市场是瑞丰集团陕西文昌物流有限公司投资兴建的集农、林、渔、牧等大农业生产资料展示交易、物流集散为一体的农资专业综合市场。市场位于西安北三环西段36号，六村堡物流园东侧，一二期投资8000万元，建筑面积46000平方米，可容纳500户商家入驻经营。</p>
                <p>在深入研究国家三农政策、深刻分析我市农资市场现状的基础上，在政府有关部门和涉农协会的关怀指导和大力支持下，文昌农资市场定位准确，功能齐全，交通便利，经营存储设施专业完备，彻底改变了区域农资市场规模小、分布散、管理乱、效果差的状况，极大满足了大农资商贸流通市场需求，是农资商家朋友的理想经营场所。市场后期配套有商务办公区，是各大农资生产厂家设立展示交易区和区域市场办事处的理想场所。</p>
                <p>西安文昌农资市场是西安乃至西部地区唯一一家通过省市供销社支持并由瑞丰集团投资的专业性农业生产资料综合市场，整合了西安地区农业、园林、渔业、畜牧业生产资料行业。</p>
            </div>
        </div>
        <div class="mui-content">
            <h5>服务理念</h5>
            <div class="mui-content" style="padding:10px;  line-height: 30px;">
                <p>遵纪守法、诚信经营、共建共享、服务三农，切实打造出一个崭新的农资大舞台！</p>
            </div>
        </div>
        <div class="mui-content">
            <h5>支付保障</h5>
            <div class="mui-content" style="padding:10px;">
                <p><img src="${path}/images/zf_img.jpg"></p>
            </div>
        </div>
    </div>
    <!--页面主内容区结束-->
</div>
<#include "app/nsc/tools.ftl"/>
</body>
</html>