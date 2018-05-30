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
        <div class="g-main">
            <div class="banner"> <img src="${base}/static/mall/nsc/img/yhhd/yh_banner.jpg"> </div>
            <div class="g_flzq">
                <div class="g_ctit">
                    <h3>促销特惠</h3>
                    <div class="g_ms">剩余：0天09时25分13秒　结束 </div>
                </div>
                <div class="g_ccon">
                    <ul>
                        <li>
                            <div class="g_cimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img01.jpg"></a></div>
                            <div class="g_cname"><a href="#">绿茶特级</a></div>
                            <div class="g_cmoney">促销价：99.00</div>
                        </li>
                        <li>
                            <div class="g_cimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img01.jpg"></a></div>
                            <div class="g_cname"><a href="#">中农(天津)化肥有限公司</a></div>
                            <div class="g_cmoney">促销价：<b>99.00</b></div>
                        </li>
                        <li>
                            <div class="g_cimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img01.jpg"></a></div>
                            <div class="g_cname"><a href="#">中农(天津)化肥有限公司</a></div>
                            <div class="g_cmoney">促销价：<b>99.00</b></div>
                        </li>
                        <li>
                            <div class="g_cimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img01.jpg"></a></div>
                            <div class="g_cname"><a href="#">中农(天津)化肥有限公司</a></div>
                            <div class="g_cmoney">促销价：<b>99.00</b></div>
                        </li>
                        <li>
                            <div class="g_cimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img01.jpg"></a></div>
                            <div class="g_cname"><a href="#">中农(天津)化肥有限公司</a></div>
                            <div class="g_cmoney">促销价：<b>99.00</b></div>
                        </li>
                        <li>
                            <div class="g_cimg"><a href="#"><img src="${base}/static/mall/nsc/img/ppj/img01.jpg"></a></div>
                            <div class="g_cname"><a href="#">中农(天津)化肥有限公司</a></div>
                            <div class="g_cmoney">促销价：<b>99.00</b></div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="g_flzq">
                <div class="g_th_tit"> 特惠购 </div>
                <div class="g_th_con th_right">
                    <dl class="pl20 pr20">
                        <dd class="txt mt30"> <a> 金牌会员特权 联盟化工 尿素 总氮含量≥46.4%（中颗粒）50kg（需要自行提货） </a> </dd>
                        <dd class="descrip mt20"> 尿素是一种高浓度氮肥，属中性速效肥料，也可用于生产多种复合肥料。在土壤中不残留任何有害物质，长期施用没有不良影响。畜牧业可用作反刍动物的饲料。 </dd>
                        <p class="mt10"> <span> ¥60.00 </span> <del class="ml10"> ¥93.00 </del> </p>
                        <dt class="mt20 pb20">
                        <div class="tg"> <a> <img src="${base}/static/mall/nsc/img/yhhd/c5Q517.png" > </a>
                            <div class="tg_zz"> 请等待下次开始 </div>
                        </div>
                        <div class="ml20">
                            <p class="mt20">
                                <input name="" type="button" class="nbtn" value="立即购买" disabled="disabled"
                                       onclick="sub(53)">
                            </p>
                            <p class="mt20"> <em> 每人限量：3 </em> <em class="pt10"> 商品库存 0 </em> </p>
                            <div class="fc"> </div>
                        </div>
                        </dt>
                    </dl>
                    <dl class="pl20 pr20">
                        <dd class="txt mt30"> <a> 金牌会员特权 联盟化工 尿素 总氮含量≥46.4%（中颗粒）50kg（需要自行提货） </a> </dd>
                        <dd class="descrip mt20"> 尿素是一种高浓度氮肥，属中性速效肥料，也可用于生产多种复合肥料。在土壤中不残留任何有害物质，长期施用没有不良影响。畜牧业可用作反刍动物的饲料。 </dd>
                        <p class="mt10"> <span> ¥60.00 </span> <del class="ml10"> ¥93.00 </del> </p>
                        <dt class="mt20 pb20">
                        <div class="tg"> <a> <img src="${base}/static/mall/nsc/img/yhhd/c5Q517.png" > </a>
                            <div class="tg_zz"> 请等待下次开始 </div>
                        </div>
                        <div class="ml20">
                            <p class="mt20">
                                <input name="" type="button" class="nbtn" value="立即购买" disabled="disabled"
                                       onclick="sub(53)">
                            </p>
                            <p class="mt20"> <em> 每人限量：3 </em> <em class="pt10"> 商品库存 0 </em> </p>
                            <div class="fc"> </div>
                        </div>
                        </dt>
                    </dl>
                    <dl class="pl20 pr20">
                        <dd class="txt mt30"> <a> 金牌会员特权 联盟化工 尿素 总氮含量≥46.4%（中颗粒）50kg（需要自行提货） </a> </dd>
                        <dd class="descrip mt20"> 尿素是一种高浓度氮肥，属中性速效肥料，也可用于生产多种复合肥料。在土壤中不残留任何有害物质，长期施用没有不良影响。畜牧业可用作反刍动物的饲料。 </dd>
                        <p class="mt10"> <span> ¥60.00 </span> <del class="ml10"> ¥93.00 </del> </p>
                        <dt class="mt20 pb20">
                        <div class="tg"> <a> <img src="${base}/static/mall/nsc/img/yhhd/c5Q517.png" > </a>
                            <div class="tg_zz"> 请等待下次开始 </div>
                        </div>
                        <div class="ml20">
                            <p class="mt20">
                                <input name="" type="button" class="nbtn" value="立即购买" disabled="disabled"
                                       onclick="sub(53)">
                            </p>
                            <p class="mt20"> <em> 每人限量：3 </em> <em class="pt10"> 商品库存 0 </em> </p>
                            <div class="fc"> </div>
                        </div>
                        </dt>
                    </dl>
                    <dl class="pl20 pr20">
                        <dd class="txt mt30"> <a> 金牌会员特权 联盟化工 尿素 总氮含量≥46.4%（中颗粒）50kg（需要自行提货） </a> </dd>
                        <dd class="descrip mt20"> 尿素是一种高浓度氮肥，属中性速效肥料，也可用于生产多种复合肥料。在土壤中不残留任何有害物质，长期施用没有不良影响。畜牧业可用作反刍动物的饲料。 </dd>
                        <p class="mt10"> <span> ¥60.00 </span> <del class="ml10"> ¥93.00 </del> </p>
                        <dt class="mt20 pb20">
                        <div class="tg"> <a> <img src="${base}/static/mall/nsc/img/yhhd/c5Q517.png" > </a>
                            <div class="tg_zz"> 请等待下次开始 </div>
                        </div>
                        <div class="ml20">
                            <p class="mt20">
                                <input name="" type="button" class="nbtn" value="立即购买" disabled="disabled"
                                       onclick="sub(53)">
                            </p>
                            <p class="mt20"> <em> 每人限量：3 </em> <em class="pt10"> 商品库存 0 </em> </p>
                            <div class="fc"> </div>
                        </div>
                        </dt>
                    </dl>
                    <dl class="pl20 pr20">
                        <dd class="txt mt30"> <a> 金牌会员特权 联盟化工 尿素 总氮含量≥46.4%（中颗粒）50kg（需要自行提货） </a> </dd>
                        <dd class="descrip mt20"> 尿素是一种高浓度氮肥，属中性速效肥料，也可用于生产多种复合肥料。在土壤中不残留任何有害物质，长期施用没有不良影响。畜牧业可用作反刍动物的饲料。 </dd>
                        <p class="mt10"> <span> ¥60.00 </span> <del class="ml10"> ¥93.00 </del> </p>
                        <dt class="mt20 pb20">
                        <div class="tg"> <a> <img src="${base}/static/mall/nsc/img/yhhd/c5Q517.png" > </a>
                            <div class="tg_zz"> 请等待下次开始 </div>
                        </div>
                        <div class="ml20">
                            <p class="mt20">
                                <input name="" type="button" class="nbtn" value="立即购买" disabled="disabled"
                                       onclick="sub(53)">
                            </p>
                            <p class="mt20"> <em> 每人限量：3 </em> <em class="pt10"> 商品库存 0 </em> </p>
                            <div class="fc"> </div>
                        </div>
                        </dt>
                    </dl>
                    <dl class="pl20 pr20">
                        <dd class="txt mt30"> <a> 金牌会员特权 联盟化工 尿素 总氮含量≥46.4%（中颗粒）50kg（需要自行提货） </a> </dd>
                        <dd class="descrip mt20"> 尿素是一种高浓度氮肥，属中性速效肥料，也可用于生产多种复合肥料。在土壤中不残留任何有害物质，长期施用没有不良影响。畜牧业可用作反刍动物的饲料。 </dd>
                        <p class="mt10"> <span> ¥60.00 </span> <del class="ml10"> ¥93.00 </del> </p>
                        <dt class="mt20 pb20">
                        <div class="tg"> <a> <img src="${base}/static/mall/nsc/img/yhhd/c5Q517.png" > </a>
                            <div class="tg_zz"> 请等待下次开始 </div>
                        </div>
                        <div class="ml20">
                            <p class="mt20">
                                <input name="" type="button" class="nbtn" value="立即购买" disabled="disabled"
                                       onclick="sub(53)">
                            </p>
                            <p class="mt20"> <em> 每人限量：3 </em> <em class="pt10"> 商品库存 0 </em> </p>
                            <div class="fc"> </div>
                        </div>
                        </dt>
                    </dl>
                </div>
            </div>
            <div class="g_flzq">
                <div class="g_hd_tit"> 活动正在进行中 </div>
                <div class="hd_zcon">
                    <ul>
                        <li>
                            <div class="hd_zimg"><a href="#"><img src="${base}/static/mall/nsc/img/yhhd/hd_img.png"></a></div>
                            <div class="hd_zname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="hd_zimg"><a href="#"><img src="${base}/static/mall/nsc/img/yhhd/hd_img.png"></a></div>
                            <div class="hd_zname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="hd_zimg"><a href="#"><img src="${base}/static/mall/nsc/img/yhhd/hd_img.png"></a></div>
                            <div class="hd_zname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="g_flzq">
                <div class="g_wq_tit"> 往期活动 </div>
                <div class="wq_zcon">
                    <ul>
                        <li>
                            <div class="wq_zimg"><a href="#"><img src="${base}/static/mall/nsc/img/yhhd/hd_img.png"></a></div>
                            <div class="wq_zname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="wq_zimg"><a href="#"><img src="${base}/static/mall/nsc/img/yhhd/hd_img.png"></a></div>
                            <div class="wq_zname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="wq_zimg"><a href="#"><img src="${base}/static/mall/nsc/img/yhhd/hd_img.png"></a></div>
                            <div class="wq_zname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="wq_zimg"><a href="#"><img src="${base}/static/mall/nsc/img/yhhd/hd_img.png"></a></div>
                            <div class="wq_zname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                        <li>
                            <div class="wq_zimg"><a href="#"><img src="${base}/static/mall/nsc/img/yhhd/hd_img.png"></a></div>
                            <div class="wq_zname"><a href="#">中农(天津)化肥有限公司</a></div>
                        </li>
                    </ul>
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