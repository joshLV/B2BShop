<!DOCTYPE html>
<html>
<head>
<#include "app/xd/head.ftl">
    <link href="${path}/theme/red/xd_style.css" rel="stylesheet" />
<style>
    .mui-content {
        padding-bottom: 0!important;
    }
    .pro_box_peo{ background:#f5f5f5; margin:15px;  margin-bottom:0;padding:10px; overflow:hidden;}
</style>
</head>
<body>
<div class="top">
    <span class="fl return_2"><a href="${base}/zcgoods/list"><img src="${path}/images/fh.png"></a></span>
    <span class="fr p_user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');"><img src="${path}/images/yh.png"></a></span>
</div>
<div class="mui-content" id="topbar">

    <#--<div id="slider" class="mui-slider">
        <div class="mui-slider-group mui-slider-loop">
            <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) &ndash;&gt;
            <div class="mui-slider-item mui-slider-item-duplicate">
                <img src="${path}/images/pic1.jpg" alt="超能润滑油">
            </div>
            <div class="mui-slider-item mui-slider-item-duplicate">
                <img src="${path}/images/pic1.jpg" alt="">
            </div>
            <div class="mui-slider-item mui-slider-item-duplicate">
                <img src="${path}/images/pic1.jpg" alt="">
            </div>

        </div>

        <!-- 轮播图片下面的小点 &ndash;&gt;
        <div class="mui-slider-indicator">
            <div class="mui-indicator mui-active"></div>
            <div class="mui-indicator"></div>
            <div class="mui-indicator"></div>
        </div>
    </div>-->

        <div id="slider" class="mui-slider">
            <div class="mui-slider-group">
            <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                <#list goodsImagesList?sort_by("orderNo") as img>
                    <div class="mui-slider-item">
                        <img name="imgSilder" name="imgSilder" alt="${img.title}" src="${base}/static/mall/img/error-img.gif" data-original="${img.pic}@455w_354h_2e.png"/>
                    </div>
                </#list>
            </#if>
            </div>
        <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
            <div class="mui-slider-indicator">
                <#list goodsImagesList?sort_by("orderNo") as img>
                    <#if img_index == 0>
                        <div class="mui-indicator mui-active"></div>
                    <#else>
                        <div class="mui-indicator"></div>
                    </#if>
                </#list>
            </div>
        </#if >
        </div>


</div>
<div class="pro_info">
    <dl class="pro_info_tit">
        <dt>${goods.name}</dt>
        <dd>${goods.description}</dd>
    </dl>
    <div class="total_data">
        <ul>
            <li>
                <p class="par"> <span><i>${zcrs}</i><em>支持人数</em></span> </p>
            </li>
            <li class="can">

                <div class="jqm-round-wrap">
                    <div class="jqm-round-bg"></div>
                    <canvas id="jqm-round-sector0" class="jqm-round-sector" height="200" width="200"></canvas>

                    <div class="jqm-round-circle">
                        <p>${zcbfb}%</p>
                        <span class="center_span">
                        <#if status =='1'>未开始</#if>
                        <#if status =='2'>众筹中</#if>
                        <#if status =='3'>已结束</#if>
                        </span>
                    </div>
                </div>
            </li>

            <li>
                <p class="par"> <span> <i><#if syts ==1> ${sysj}<#else> ${syts}</#if> </i> <em><#if syts &lt;=1>剩余时间<#else>剩余天数</#if></em> </span> </p>
            </li>
        </ul>

    </div>
    <div class="je">
        <span class="fl"><em>目标金额：</em>￥${mbje}万元</span>
	
        <span class="fr"><em>已筹金额：</em>￥<#if ycje?number&lt;1>${ycjeY}元<#else>${ycje}万元</#if></span>
	
    </div>
    <div class="je">
       <#-- <span class="fl"><em>市场价格：</em><font style="text-decoration:line-through">${goods.marketPrice?string(priceCurrencyFormat)}元</font></span>-->
        <span class="fl"><em>众筹价格：</em>${goods.successPrice?string(priceCurrencyFormat)}元</span>
    </div>
    <#--<div class="je">
        <span class="fl"><em>保证金(${goods.thresholdUnit})：</em><#if goods.prepaymentType ==1>${(goods.prepaymentRatio?number*goods.successPrice?number*0.01)?string(priceCurrencyFormat)}<#else>${goods.prepaymentRatio?string(priceCurrencyFormat)}</#if>元</span>
        <span class="fr"><em>起订金额：</em>￥${qdje}元</span>
    </div>-->
    <dl class="pro_about">
        <dt>
            <!--1_活动未开始，2_进行中，3_已结束，-->
            <#if status =='1'><span class="s_ks">未开始</span></#if>
            <#if status =='2'><span >众筹中</span></#if>
            <#if status =='3'><span class="s_sb">已结束</span></#if>
            <!--  <span class="ok">已达成</span>-->
            <!--  <span class="s_sb">已失败</span>-->
            <!--  <span class="s_ks">准备开始</span>-->
        </dt>
        <dd>此商品众筹必须在 <font color="red">${goods.zcEndTime?string("yyyy年MM月dd日")}</font> 前得到<font color="red">￥${mbje}万元</font>才算众筹成功，众筹成功只需付款<font color="red">${goods.successPrice}元/件</font>即可得到该众筹商品，众筹失败后系统将作废您的订单并且解冻您在下单时冻结的的保证金。</dd>
    </dl>

</div>
<section>
    <#--<div class="pro_box">
        <h2>项目发起人</h2>
        <dl class="pro_box_info">
            <dt><img src="${path}/images/user_img.jpg"></dt>
            <dd>
                <h3>陕西深龙信息技术有限公司</h3>
                <p>电话：<a href="tel:029-81297736">029-81297736</a></p>
            </dd>
        </dl>
        <div class="message">
            <div class="comment">
                陕西深龙信息技术有限公司，是一家集云计算软件开发和软件销售于一体的高科技信息技术服务公司！公司拥有多位云计算软件开发专家组成的研发团队...
                <i class="jt"></i>
            </div>
        </div>

    </div>-->
    <div class="pro_box">
        <h2 class="tb_2">项目支持者</h2>
        <div id="xmzcz">
            <#if orderList?? && orderList?size &gt; 0>
                <#list orderList as order>
                    <dl class="pro_box_peo">
                        <dt>
                            <img src="${path}/images/pic6.jpg">
                        </dt>
                        <dd>
                            <h3>${order.createUser?substring(0,3)}****${order.createUser?substring(order.createUser?length-4,order.createUser?length)}</h3>
                            <p>订购数量：${order.goodsTotalQuantity}件</p>
                            <p>订购时间：${order.createDate?string("yyyy年MM月dd日")}</p>
                        </dd>
                    </dl>
                </#list>
            <#else>
                <div class="more">
                    <span>暂时没有支持者！</span>
                </div>
            </#if>
        </div>
        <#if orderList?? && orderList?size &gt;= 2>
            <div class="more">
                <a href="${base}/zcgoods/moreSupporters?id=${goods.id}">查看更多</a>
            </div>
        </#if>

    </div>
    <div class="pro_box mt40" style="margin-bottom: 80px;">
        <h2 class="tb_3">产品详情</h2>
        <div class="pro_info_xx">
            <#if isEnable='NO'>
                ${goods.introduction}
            <#else>
                ${goods.phoneIntroduction}
            </#if>
           <#-- <img src="${path}/images/pic7.jpg">-->
        </div>
    </div>



</section>
<!---1_活动未开始，2_进行中，3_已结束-->
<div class="pro_but">
    <div class="fl">

        <div class="gz" onclick="addGoodsAttention('${goods.id}')"><strong>添加关注：</strong><i><img src="${path}/images/u_bg6.png"></i></div>
        <!--<div class="gz"><strong style="color:#e12f45;">已关注：</strong><i><img src="images/u_bg4.png"></i></div>-->
    </div>
    <a href="javascript:void(0)" onclick="<#if status ==1>popAlert('活动尚未开始,尽请期待！');</#if><#if status ==2>xdzc('${goods.id}')</#if><#if status ==3>popAlert('活动已经结束！');</#if>" class="fr mr10">下单支持</a>
</div>

<div class="return" style="bottom:70px;">
    <a id="backToTop" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>
</body>
<script type="text/javascript" src="${path}/js/circle.js"></script>
<script src="${path}/js/jquery.lazyload.min.js"></script>
<script>
    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack:true
        });
        jQuery("img[name='imgSilder']").lazyload({
            effect: "fadeIn"
        });
        jQuery('#backToTop').bind("tap", function () {
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });
    }(mui, document));
    $(window).scroll(function(){
        if ($(window).scrollTop()>100){
            $("#backToTop").fadeIn(500);
        }else{
            $("#backToTop").fadeOut(500);
        }
    });
    //下单支持
    function xdzc(goodsId){
        jumpto(fullpath + '/zcorder/ordercheck/${goods.id}.html?whichclient=whichapp');
    }
    /**
     * Desc:关注商品
     * Auth:liuxiaobing
     * Time:2015-12-7 10:50:35
     */
    function addGoodsAttention(goodsId) {
        $.ajax({
            type: "get",
            url: "${base}/goods/addToGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='success'){
                    popAlert(data.message);
                    $(".gz").html('<strong style="color:#e12f45;">已关注：</strong><i><img src="${path}/images/u_bg4.png"></i>')
                }else if(data.status=='warn'){
                    popAlert(data.message);
                    $(".gz").html('<strong style="color:#e12f45;">已关注：</strong><i><img src="${path}/images/u_bg4.png"></i>')
                }else if(data.status=='NOLOGIN'){
                    popAlert('登录后才可关注商品');
                }else{
                    popAlert(data.message);
                }

            }
        });
    }
    window.onload=ck_gz('${goods.id}');
    function ck_gz(goodsId){
        $.ajax({
            type: "get",
            url: "${base}/goods/isGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='warn'){
                    $(".gz").html('<strong style="color:#e12f45;">已关注：</strong><i><img src="${path}/images/u_bg4.png"></i>')
                }
            }
        });
    }

</script>
</html>