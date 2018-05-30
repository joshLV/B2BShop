<#include "bec/ghdj/header.ftl"/>
<link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghdj/css/cuxiao.css">

<script type="text/javascript" src="${base}/static/bec/project/ghdj/js/jquery.fly.min.js"></script>
<!--商品分类所用js（allSort_head.js）-->
<script type="text/javascript" src="${base}/static/bec/project/ghdj/js/allSort_head.js"></script>
<script type="text/javascript" src="${base}/static/bec/project/ghdj/js/cuxiao.js"></script>
<#--<script type="text/javascript" src="${base}/static/bec/project/ghdj/js/index.js"></script>-->

<#include "bec/ghdj/top.ftl"/>

<#--促销最顶部大图         Start-->
<#--<div class="cxbanner"></div>-->
<!-- 轮播 -->
<div class="banner" id="kinMaxShow">
    <div><img alt="轮播图1" src="${base}/static/bec/project/ghdj/img/cxbanner_ry.jpg" /></div>
    <div><img alt="轮播图2" src="${base}/static/bec/project/ghdj/img/cxbanner_sp.jpg" /></div>
</div><#-- kinMaxShow end-->
<#--促销最顶部大图         End-->

<#--促销商品最大DIV         Start-->
<div class="z_main">

    <#--促销商品DIV         Start-->
      <#--商品分类-->
    <#list typeList as child>
        <div class="floortitle">
            <a href="${base}/promotionGoods/listPromotion.html?goodsCategory=${child["catelog"].name}" target="_blank" alt="点击查询更多" title="点击查询更多">${child["catelog"].name}</a>
            <#--<a href="${base}/list/${child["catelog"].id}.html" target="_blank">${child["catelog"].name}</a>-->
        </div>
        <#--商品-->
        <div class="floorcontent">
            <ul>
                <#list child["goodschildList"] as goodschild>
                    <li>
                        <div class="p-pic">
                            <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">
                                <img alt="${goodschild.fullName}"  src="${goodschild.pic}@230w_230h.png" width="230" height="230" >
                            </a>
                        </div>
                        <div class="p-name">
                            <a target="_blank" href="${base}/item/${goodschild.id}.html" title="${goodschild.fullName}">
                            ${goodschild.fullName}
                            </a>
                        </div>
                        <div class="p-tm">条码：${goodschild.barcode}</div>
                        <div class="p-price nologin_price"><span>仅会员可见！</span></div>
                        <div class="p-price login_price" style="display: none;">
                            <span>
                                <#if goodschild.batchPrice != null && goodschild.batchPrice != "0.00~0.00">
                                    ￥${goodschild.batchPrice}
                                <#else >
                                ${goodschild.price?string("currency")}
                                </#if>
                            </span>
                        </div>
                        <div class="p-btn login_addCar" style="display: none;">
                            <button class="addtocart" onclick="judgeAuth('${base}','addCarts',addCart.bind({},'${goodschild.id}','1'));">
                                加入购物车&nbsp;
                                <i class="icon-angle-right"></i>
                            </button>
                        </div>
                    </li>
                    <#if (goodschild_index == 9)><#break></#if>
                </#list>
            </ul>
        </div>
    </#list>

    <#--促销商品DIV         End-->

</div>
<#--促销商品最大DIV         End-->

<script type="text/javascript">
    $(function() {
        $.ajax({
            type: 'post',
            async: false,
            url: '${base}/member/getCurrM',
            success: function(data) {
                if( data.status == 'success' ){
                    $(".nologin_price").hide();
                    $(".login_price").show();

                    $(".login_addCar").show();
                }else{
                    $(".nologin_price").show();
                    $(".login_price").hide();

                    $(".login_addCar").hide();
                }

            }
        });

    });

    /**
     * 加入购物车
     * */
    function addCart(goodsId, cnt) {
        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
    }

    /**
     * 判断是否是空
     * @param value
     */
    function isEmpty(value){
        if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
            return true;
        }
        else{
            value = (value+"").replace(/\s/g,'');
            if(value == ""){
                return true;
            }
            return false;
        }
    }
</script>
<#include "bec/ghdj/service.ftl"/>
<#include "bec/ghdj/foot.ftl"/>