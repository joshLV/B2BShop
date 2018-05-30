
<!DOCTYPE html>
<html>

<head>
<#include "app/ghj/head.ftl">
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
    <div class="mui-page-content" style="margin-top: 50px;">
        <div class="mui-img-banner">
            <a href="#"><img attr="lazyload" src="${path}/images/mall_logo.jpg" style="display: inline;"></a>
        </div>
        <div class="mui-content">
            <div class="about_bg" style="padding:10px;">

                <div style="padding:10px; line-height: 26px; margin: 10px; border: 1px solid #d8d8d8;">

                    <p style="text-indent: 2em;">“广货街”---是一个F2B（厂家对商家）电子商务交易平台。以厂家、一级代理商为供货主体，大、中型商超为采购主体，以现金结算为基础，专业化团队运营，同时提供以信用贷款、资金池担保的金融服务，保姆式物流为配送体系，厂家直接对商超的电子商务交易平台。</p>
                    <p style="text-indent: 2em;">该项目为解决传统商贸行业的账期问题、中间商问题、拓宽采购和销售渠道的问题而产生。“广货街”以交易现结为基础，降低商品进货成本，打通采购与销售对接、贷款渠道、仓储物流一体化环节，让厂家、一级供应商与商超之间形成无缝链接的业务流程，建设供应商和超市可持续的高盈利运营模式。</p>

                </div>
            </div>

            <p style="font-size: 12px;text-align: center; background-color: #fff;">&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2015-2016&nbsp;&nbsp;<br>广货街有限责任公司&nbsp;&nbsp;版权所有<br>陕ICP备16001873号</p>
        </div>
    </div>
    </div>
    <!--页面主内容区结束-->
</div>
<#include "app/ghj/tools.ftl"/>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    jQuery("img[attr='lazyload']").lazyload({
        threshold : 20,
        effect: "fadeIn"
    });
</script>
</body>
</html>