<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="viewport" content="width=device-width"/>
    <link href="${base}/static/mall/nsc/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/mall/nsc/img/touchicon.png" rel="apple-touch-icon" />

    <link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/style.css"/>

    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.kinMaxShow-1.1.min.js"></script>
    <script src="${base}/static/mall/nsc/js/kefu.js"></script>
    <script type="text/javascript">
        $(window).load(function(e) {
            $(".u-category").hide();
            /*二级页面*/
            $(".m-category").hover(function(e){
                $(".u-category").show();
            },function(e){
                $(".u-category").hide();
            });
            $(".u-cates-li").hover(function(e) {
                $(this).css("background","#f0f0f0");
                $(this).addClass("u-cates-over").removeClass(".u-cates-li");
            },function(e){
                $(this).removeClass("u-cates-over").addClass(".u-cates-li");
                $(".u-cates-li:even").css("background-color","#fafafa");
            });
            $(".m-floor1-text").idTabs("!mouseover");
            $(".m-floor1-text a").mouseover(function(e) {
                $(this).parent().parent().find("a").removeClass("u-floor1-used");
                $(this).addClass("u-floor1-used");
            });
        });
    </script>

</head>
<body>
    <#assign path="mall/nsc">
    <div class="g-doc">
        <#--页眉-->
        <div class="g-hd">
        <#--加入收藏-->
		<#include "${path}/shortcut.ftl"/>
		<#--头部-->
		<#include "${path}/header.ftl"/>
        </div>
        <#--页面中间-->
        <div class="g-bd">
            <div class="banner">
                <img src="${base}/static/mall/nsc/img/ppj/banner01.jpg">
            </div>
            <div class="sjjs">
                <div class="sjjs_l">
                    <div class="js_left">
                        <h3>文章分类</h3>
                        <div class="js_l_con">
                            <ul>
                                <li><a href="#">商家公告</a></li>
                                <li><a href="#">帮助中心</a></li>
                                <li><a href="#">店主之家</a></li>
                                <li><a href="#">支付方式</a></li>
                                <li><a href="#">售后服务</a></li>
                                <li><a href="#">服务中心</a></li>
                                <li><a href="#">配送方式</a></li>
                                <li><a href="#">特色服务</a></li>
                                <li><a href="#">易农金融</a></li>
                                <li><a href="#">联系我们</a></li>
                                <li><a href="#">关于我们</a></li>
                                <li><a href="#">合作洽谈</a></li>
                                <li><a href="#">产品与服务</a></li>
                                <li><a href="#">服务大厅</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="js_left m_top">
                        <h3>最新文章</h3>
                        <div class="z_lcon">
                            <ul>
                                <li><a href="#">关于我们</a></li>
                                <li><a href="#">帮助中心</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="js_right">
                    <div class="about_r">
                        <h3>关于农商场</h3>
                        <div class="a_rcon">
                            <div class="a_img"><img src="${base}/static/mall/nsc/img/scjs/a_img.jpg"></div>
                            <div class="a_con">
                                <p>西安文昌农资市场是瑞丰集团陕西文昌物流有限公司投资兴建的集农、林、渔、牧等大农业生产资料展示交易、物流集散为一体的农资专业综合市场。市场位于西安北三环西段36号，六村堡物流园东侧，一二期投资8000万元，建筑面积46000平方米，可容纳500户商家入驻经营。</p>
                                <p>在深入研究国家三农政策、深刻分析我市农资市场现状的基础上，在政府有关部门和涉农协会的关怀指导和大力支持下，文昌农资市场定位准确，功能齐全，交通便利，经营存储设施专业完备，彻底改变了区域农资市场规模小、分布散、管理乱、效果差的状况，极大满足了大农资商贸流通市场需求，是农资商家朋友的理想经营场所。市场后期配套有商务办公区，是各大农资生产厂家设立展示交易区和区域市场办事处的理想场所。</p>
                                <p>西安文昌农资市场是西安乃至西部地区唯一一家通过省市供销社支持并由瑞丰集团投资的专业性农业生产资料综合市场，整合了西安地区农业、园林、渔业、畜牧业生产资料行业。 </p>

                            </div>
                        </div>
                    </div>
                    <div class="about_r m_top">
                        <h3>服务理念</h3>
                        <div class="a_rcon">
                            <div class="a_con">
                                <p>遵纪守法、诚信经营、共建共享、服务三农，切实打造出一个崭新的农资大舞台！ </p>
                            </div>
                        </div>
                    </div>
                    <div class="about_r m_top">
                        <h3>支付保障</h3>
                        <div class="a_rcon">
                            <div class="a_con">
                                <p><img src="${base}/static/mall/nsc/img/scjs/zf_img.jpg"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#--服务-->
    <div class="g-bd2">
        <#include "${path}/service.ftl">
    </div>
    <#--页脚-->
    <#include "${path}/footer.ftl">
</body>
</html>