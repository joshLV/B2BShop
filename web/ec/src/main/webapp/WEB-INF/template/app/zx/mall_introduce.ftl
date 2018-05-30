
<!DOCTYPE html>
<html>

<head>
<#include "app/zx/head.ftl">
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
                <p style="text-indent: 2em;">跨境贸易电子商务主要是依托电子口岸，建立口岸监管部门与电商、物流、支付等企业系统联网对接信息平台，掌握跨境电子商务交易各环节的准确数据和状态，实现 口岸监管的前推后移、分类通关，科学统计，以及全程无纸化通关管理，方便企业快速通关，有效解决企业出口结汇、退税等问题。</p>
                <p style="text-indent: 2em;">2014年3月19日海关总署正式批复印发了《关于西安市开展跨境贸易电子商务服务试点工作的复函》，明确由西安综合保税区组织开展试点工作，按市场化 运作方式，委托西安国际港务区管委会下属公司（西安国际陆港保税物流投资建设有限公司）负责跨境电商试点（产业园）的建设、招商和运营。为承载跨境电商及 上下游配套服务企业并做好相关支撑服务，在西安综合保税区内规划设立了西安综合保税区跨境电子商务产业园，同时搭建并运营西安跨境电子商务平台，整合商贸 基础信息资源，规范电子商务数据标准，搭建数据中心，实现数据共享，提供电子商务通关、物流、数据交换、外贸协同、商务信息、商务信用等综合服务，并为国 内跨境消费者提供实名身份备案、年消费额度控制、税单查询、商品防伪溯源查询等服务，提供一条阳光、便利、放心的跨境网购新渠道。目前跨境电子商务综合服 务平台的建设已完成。可以开展进出口货物交易、通关、物流配送、支付结算贸易等一系列工作，平台永久域名为，中文名称为“洋货码头”。</p>

            </div>
        </div>
        <div>
            <h5>地理位置</h5>
            <div  style="padding:10px;  line-height:26px; background: #fff;font-size: 15px;">
                <p style="font-size: 15px;">西安市西安国际港务区港务大道六号 <br>
                    电话： 029-83591918   传真：029-83453501   <br>
                    邮编：710026 E-mail：xitlp@yahoo.com.cn </p>
            </div>
            <div class="mui-content" style="padding:10px; background: #fff; ">
                <p><img attr='lazyload' src="${picloading}" data-original="${path}/images/location.png"></p>
            </div>
        </div>
        <div >
            <h5>支付保障</h5>
            <div class="mui-content" style="padding:10px; background: #fff; ">
                <p><img attr='lazyload' src="${picloading}" data-original="${path}/images/zf_img.jpg"></p>
            </div>
        </div>
    </div>
    </div>
    <!--页面主内容区结束-->
</div>
<#include "app/zx/tools.ftl"/>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    jQuery("img[attr='lazyload']").lazyload({
        threshold : 20,
        effect: "fadeIn"
    });
</script>
</body>
</html>