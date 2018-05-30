<!DOCTYPE html>
<html>
<head>
    <title>${goods.name} - <@spring.message "project_name"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${base}/static/mall/xd/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <link href="${base}/static/mall/xd/css/goods_detail.css" rel="stylesheet" type="text/css" />
    <link href="${base}/static/mall/xd/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/mall/css/index.css" rel="stylesheet" type="text/css" media="all"/>
    <#--<script src="${base}/static/mall/nsc/js/cloud-zoom.1.0.2.min.js" type="text/javascript"></script>-->
    <#--<link href="${base}/static/css/cloud-zoom.css" rel="stylesheet" type="text/css" />-->
    <script type="text/javascript">window.pageConfig={compatible:true,navId:"detail"};</script>
</head>
<body>
<#include "mall/xd/shortcut.ftl"/>
<#include "mall/xd/header.ftl"/>
<#if !goods??>
<div id="refresh" class="content">
        <style type="text/css">#refresh{background-color:#ebebeb;text-align:center;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px;margin-bottom:10px;padding:100px 0;font-size:18px;}</style>
        不好意思 :(&nbsp;&nbsp;&nbsp;&nbsp;该商品不存在或已下架，不能进行购买......
</div>
<#else>
<!--面包屑导航-->
<style>
    .breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
    .breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
    .breadcrumb span {font-family: "\5b8b\4f53"}
    .comment-box .commstar .star1{background-color:red; display:block; width:20px;height:20px;background:url(${base}/static/img/commstar.jpg) left top repeat-x;position:relative;margin-top:1px;display:inline-block;overflow:hidden;zoom:1;}
    .comment-box .commstar .star2{background-color:red; display:block; width:43px;height:20px;background:url(${base}/static/img/commstar.jpg) left top repeat-x;position:relative;margin-top:1px;display:inline-block;overflow:hidden;zoom:1;}
    .comment-box .commstar .star3{background-color:red; display:block; width:63px;height:20px;background:url(${base}/static/img/commstar.jpg) left top repeat-x;position:relative;margin-top:1px;display:inline-block;overflow:hidden;zoom:1;}
    .comment-box .commstar .star4{background-color:red; display:block; width:85px;height:20px;background:url(${base}/static/img/commstar.jpg) left top repeat-x;position:relative;margin-top:1px;display:inline-block;overflow:hidden;zoom:1;}
    .comment-box .commstar .star5{background-color:red; display:block; width:105px;height:20px;background:url(${base}/static/img/commstar.jpg) left top repeat-x;position:relative;margin-top:1px;display:inline-block;overflow:hidden;zoom:1;}
    /* 选择商品 */
    .choose-goods{width: 540px; height: auto; float: left;}
    .choose-goods .dd{border: 2px solid #cccccc; margin-top: 3px; margin-bottom: 3px; padding-left: 5px; padding-right:5px; height: 30px; line-height: 30px; margin-right: 5px;}
    .choose-goods .selected {
        position: relative;
        border: 2px solid #DB0000;
    }
    .choose-goods .selected b{
        position: absolute;
        bottom: -2px;
        right: -2px;
        width: 12px;
        height: 12px;
        overflow: hidden;
        background:url(${base}/static/img/newicon20140910.png) no-repeat scroll -202px -224px;
    }
    .choose-goods a:hover{text-decoration: none;}
    #choose-btns .btn_buys {
        width: 137px;
        height: 38px;
        background: #DDD none repeat scroll 0% 0%;
        color: #FFF;
        border-radius: 3px;
    }
    #choose-btns .btn-appends {
        width: 137px;
        height: 36px;
        border: 1px solid #DDD;
        background: #DDD none repeat scroll 0% 0%;
        border-radius: 3px;
        line-height: 34px !important;
    }
    .reply-color {
        color:#ff6500 ;
    }
    .reply-color dt{
        color:#ff6500 !important;
    }
    <#--#spec-left {-->
        <#--background: transparent url("${base}/static/img/arr_l.gif") no-repeat scroll 0% 0%;-->
    <#--}-->
    <#--.control {-->
        <#--width: 14px;-->
        <#--height: 23px;-->
        <#--float: left;-->
        <#--cursor: pointer;-->
        <#--margin-top: 20px;-->
    <#--}-->

    <#--#spec-right {-->
        <#--background: transparent url("${base}/static/img/arr_r.gif") no-repeat scroll 0% 0%;-->
    <#--}-->

    <#--#spec-list ul {-->
        <#--float: left;-->
        <#--overflow: hidden;-->
    <#--}-->
    <#--ul, menu, dir {-->
    <#--}-->
    <#--ol, ul {-->
        <#--list-style: outside none none;-->
    <#--}-->
    <#--#spec-list ul li img {-->
        <#--padding: 2px;-->
        <#--border: 1px solid #CCC;-->
        <#--width: 54px;-->
        <#--height: 54px;-->
    <#--}-->
    <#--img {-->
        <#--vertical-align: middle;-->
        <#--margin: 0px;-->
        <#--padding: 0px;-->
    <#--}-->

    .list-h li{ float:left;}
    #spec-n5{/*width:300px*/; height:65px; padding-top:13px; overflow:hidden;}
    .control{ width:14px; height:23px; float:left;cursor:pointer;margin-top:23px;}
    #spec-left{ background: transparent url("${base}/static/img/arr_l.gif") no-repeat scroll 0% 0%; margin-left: 5px;}
    #spec-right{background: transparent url("${base}/static/img/arr_r.gif") no-repeat scroll 0% 0%;}
    #spec-list{ width:270px; float:left; overflow:hidden; display:inline; margin:0 12px 0 13px; position:relative;}
    #spec-list ul{width:1100px; float:left; overflow:hidden;}
    #spec-list ul li{ float:left; padding-right:10px; display:inline-block; width:50px;}
    #spec-list ul li img{ padding:2px ; border:1px solid #ccc; width:44px; height:44px;}

    /*jqzoom*/
    .jqzoom{ width:420px; height:360px; /*border:1px solid #e6e6e6;*/ position:relative;overflow:hidden; background: url("${base}/static/mall/xd/img/default_logo.jpg") no-repeat center;}
    .zoomdiv{z-index:100;position:absolute;top:0px!important;left:360px!important;width:450px;height:450px;border:1px solid #e4e4e4;display:none;text-align:center;overflow: hidden;}
    .bigimg{width:800px;height:800px;}
    .jqZoomPup{z-index:10;visibility:hidden;position:absolute;top:0px;left:0px;width:50px;height:50px;border:1px solid #aaa;background:#FEDE4F 50% top no-repeat;opacity:0.5;-moz-opacity:0.5;-khtml-opacity:0.5;filter:alpha(Opacity=50);cursor:move;}
    #code{display:none;width: 100px;height: 100px;background:#CCC; position: absolute; z-index: 2; bottom: 16px; left:-40px;}
    #code img{ width: 100%; }
    .wx{ position: relative;z-index: 1;}
    .wx .wx_ico{ width: 18px; height: 18px;}

</style>
<#--Desc:存放商品ID,用于获取商品评论使用。 Auth:zhangqiang Time:2016-01-18 14:01:57 Start-->
<input type="hidden" name="goodsId" value="${goods.id}" id="goodsId" />
<#--Desc:存放商品ID,用于获取商品评论使用。 Auth:zhangqiang Time:2016-01-18 14:01:57 End-->
<div class="content">
    <div class="breadcrumb">
        <#if breadcrumbCatList?? && breadcrumbCatList?size &gt; 0>
            <#assign c = breadcrumbCatList?first>
            <h1><a href="${base}/list/${c['l1_id']}.html">${c['l1_name']}</a></h1>
            <#if c['l2_id'] != null>
            <span>&nbsp;&gt;&nbsp;<a target="_blank" href="${base}/list/${c['l1_id']}-${c['l2_id']}.html">${c['l2_name']}</a></span>
            </#if>
            <#if c['l3_id'] != null>
            <span>&nbsp;&gt;&nbsp;<a target="_blank" href="${base}/list/${c['l1_id']}-${c['l2_id']}-${c['l3_id']}.html">${c['l3_name']}</a></span>
            </#if>
        </#if>
    </div>
    <!-- 左边相关分类 -->
    <div class="left" style="float: left">
        <#if refCatelogList?? && refCatelogList?size &gt; 0>
            <div id="related-sorts" class="m m2">
                <div class="mt">
                    <h2>相关分类</h2>
                </div>
                <div class="mc">
                    <ul class="lh">
                        <#list refCatelogList as cat>
                            <#if cat.cateTypeFlage == 2 >
                                <li><a href="${base}/list/${cat.grandfather}-${cat.parentId}-${cat.id}.html" title="${cat.name}">${cat.name}</a></li>
                            <#else>
                                <li><a href="${base}/list/${cat.grandfather}-${cat.id}.html" title="${cat.name}">${cat.name}</a></li>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </div>
        </#if>
        <div id="related-brands" class="m m2">
            <div class="mt">
                <h2>同类其他品牌</h2>
            </div>
            <div class="mc">
                <ul class="lh">
                    <#if brandRefList?? && brandRefList?size &gt; 0>
                    <#list brandRefList as brand>
                        <li><a href="javascript:void(0)"  onclick="s('${brand.name}','')"  title="${brand.name}（${brand.sign}）">${brand.name}</a></li>
                    </#list>
                    </#if>
                </ul>
            </div>
        </div>
    </div>

    <!-- 商品介绍 -->

    <div style="margin-left: 10px;float: left;/*width: 618px;min-width: 618px*/">
        <!-- 简要说明 -->
        <div id="product-intro" style="min-height: 430px">
            <input type="hidden" value="${goods.id}">
            <div id="name" style="width: 618px">
            <#--Desc:增加ECM端商品预览时商品为下架状态 提示为未上架 Auth:zhangqiang Time:2015-12-01 14:18:35 start-->
                <h1 >
                    <#if goods.isMarketable == 0 || goods.isDelete != '1'>
                    <span style="color: red;">
                        <#if showView == "success">
                            [未上架]
                        <#else >
                            [已下架]
                        </#if>
                        &nbsp;&nbsp;&nbsp;
                    </span>
                    </#if>
                    <#--${goods.fullName}-->${goods.name}
                </h1>
            <#--Desc:增加ECM端商品预览时商品为下架状态 提示为未上架 Auth:zhangqiang Time:2015-12-01 14:18:35 End-->
                <strong></strong>
            </div>
            <!-- 简单介绍 -->
            <div <#--class="clearfix"-->style=" width: 618px;border-bottom: 1px dotted #e8e8e8;">
                <ul id="summary">
                    <div class="goods-price">
                        <#--<li id="summary-price">
                            <div class="dt"><b>商&nbsp;城&nbsp;价：</b></div>
                            <div class="dd" style=";margin-top: 3px">
                                <strong class="p-price" id="weipu-price">
                                &lt;#&ndash;Desc:市场价为0时显示为价格面议,加入购物车与购买 无法点击 Auth:zhangqiang Time:2016-01-14 11:43:14 Start &ndash;&gt;
                                    <#if goods.price == '0'>
                                        价格面议
                                    <#else>
                                        ￥${goods.price}
                                    </#if>
                                &lt;#&ndash;Desc:市场价为0时显示为价格面议,加入购物车与购买 无法点击 Auth:zhangqiang Time:2016-01-14 11:43:14 End &ndash;&gt;
                                    &nbsp;
                                </strong>&lt;#&ndash;<a id="notice-downp" href="#" target="_blank">(降价通知)</a>&ndash;&gt;
                            </div>
                        </li>
                        <li id="summary-price">
                            <div class="dt"><b>市&nbsp;场&nbsp;价：</b></div>
                            <div class="dd" style=";margin-top: 3px">
                                <span style="text-decoration:line-through;" id="weipu-marketPrice">￥${goods.marketPrice}&nbsp;</span>
                            </div>
                        </li>-->
                            <#if isOpen == "start">
                                <li id="summary-price">
                                    <div class="dt"><b>活&nbsp;动&nbsp;价：</b></div>
                                    <div class="dd" style=";margin-top: 3px">
                                        <strong class="p-price" id="weipu-price">
                                        ${promotionsGoods.promotionsPrice}
                                    </div>
                                </li>
                                <li id="summary-price">
                                    <div class="dt"><b>商&nbsp;城&nbsp;价：</b></div>
                                    <div class="dd" style=";margin-top: 3px">
                                        <span style="text-decoration:line-through;" id="weipu-marketPrice">￥${promotionsGoods.goodsPrice}&nbsp;</span>
                                    </div>
                                </li>
                            <#else >
                                <li id="summary-price">
                                    <div class="dt"><b>商&nbsp;城&nbsp;价：</b></div>
                                    <div class="dd" style=";margin-top: 3px">
                                        <strong class="p-price" id="weipu-price">
                                        <#--Desc:市场价为0时显示为价格面议,加入购物车与购买 无法点击 Auth:zhangqiang Time:2016-01-14 11:43:14 Start -->
                                            <#if goods.price == '0'>
                                                价格面议
                                            <#else>
                                                ￥${goods.price}
                                            </#if>
                                        <#--Desc:市场价为0时显示为价格面议,加入购物车与购买 无法点击 Auth:zhangqiang Time:2016-01-14 11:43:14 End -->
                                            &nbsp;
                                        </strong><#--<a id="notice-downp" href="#" target="_blank">(降价通知)</a>-->
                                    </div>
                                </li>
                                <li id="summary-price">
                                    <div class="dt"><b>市&nbsp;场&nbsp;价：</b></div>
                                    <div class="dd" style=";margin-top: 3px">
                                        <span style="text-decoration:line-through;" id="weipu-marketPrice">￥${goods.marketPrice}&nbsp;</span>
                                    </div>
                                </li>
                            </#if>
                    </div>
                    <#--Desc:商品编号没有什么作用，去掉 Auth:zhangqiang Time:2015-11-23 16:34:45 Start-->
                    <#--<li id="summary-market">-->
                    <#--<div class="dt">商品编号：</div>-->
                    <#--<div class="dd">${goods.sn}</div>-->
                    <#--</li>-->
                    <#--Desc:商品编号没有什么作用，去掉 Auth:zhangqiang Time:2015-11-23 16:34:45 End-->
                    <li id="summary-promotion" class="hide">
                        <div class="dt">计量单位：</div>
                        <div class="dd">${goods.unit}</div>
                    </li>
                    <#if activityFullCut??>
                        <li>
                            <dl class="mj_info">
                                <dt><b>促&nbsp;&nbsp;&nbsp;销：</b><em class="mj">${activityFullCut.mjName}</em></dt>
                                <dd><span style="color: #db0000;">
                                    <#if activityFullCutPrice?? && activityFullCutPrice?size &gt; 0>
                                        <#list activityFullCutPrice as price>
                                            满${price.totalPrice}元减${price.decreaseAmount}元
                                            <#if price_has_next>,</#if>
                                        </#list>
                                    </#if>
                                                </span></dd>
                            </dl>

                        </li>
                    </#if>
                    <li id="summary-service">
                        <div class="dt">服　　务：</div>
                        <div class="dd">由 ${(shop.name?exists)?string("<a href='${base}/shop/${shop.urlAddress}'>${shop.name}</a>","本商城")} 发货并提供售后服务。
                            <#if shop.qqKeFu??>
                            <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=${shop.qqKeFuList[0]}&site=qq&menu=yes" >
                                <img src="http://wpa.qq.com/pa?p=2:${shop.qqKeFuList[0]}:4" alt="客服QQ" align="客服" />
                            </a>
                            </#if>
                            <#if shop.weixinImg??>
                                <a href="javascript:void(0)" onmouseover="display()" onmouseout="disappear()" class="wx">
                                <img src="${base}/static/mall/img/weixin.jpg" alt="微信二维码" align="微信二维码"  class="wx_ico"/>
                                    <div id="code" onmouseover="display()" onmouseout="disappear()">
                                        <img src="${shop.weixinImg}" alt="微信二维码" align="微信二维码" />
                                    </div>
                                </a>
                            </#if>
                        </div>
                    </li>
                    <li><div class="times">预计送达时间：<em>${goods.predictDay}</em></div></li>
                    <#--Desc:增加此商品所属单品下的所有商品信息 Auth:zhangqiang Time:2015-11-27 15:35:06 Start-->
                    <li>
                        <div class="dt">同类商品：</div>
                        <div class="choose-goods">
                            <#list goodsProductList as gsP>
                                <#if goods.id == gsP.id>
                                    <div class="dd selected ">
                                        <b></b><a title="${gsP.shortName}">${gsP.shortName}<font style="color: #ff0000;" name="${gsP.id}" class="adwords"></font></a>
                                    </div>
                                <#else>
                                    <div class="dd">
                                        <b></b><a href="${base}/item/${gsP.id}.html<#if showView == "success">?showView=true</#if>" title="${gsP.shortName}">${gsP.shortName}<font style="color: #ff0000;" name="${gsP.id}" class="adwords"></font></a>
                                    </div>
                                </#if>
                            </#list>
                        </div>
                    </li>
                    <#--Desc:增加此商品所属单品下的所有商品信息 Auth:zhangqiang Time:2015-11-27 15:35:06 End-->
                </ul>
                <ul id="choose">
                    <#list spInfoMap["goodsSpList"] as sp>
                        <li id="choose-${sp.id}">
                            <div class="dt" id="${sp.id}_sp">${sp.name}：</div>
                            <#assign i = 0>
                            <#list spInfoMap["goodsSpItemList"] as item>
                                <#if item.specificationId == sp.id>
                                    <#if i == 0>
                                        <input type="hidden" name="goodsSp" id="goodsSp_${sp.id}" value="${item.name}" spname="${sp.name}">
                                    </#if>
                                    <div style="float: left;">
                                        <div class="item <#if i == 0>selected</#if>" style="min-width: 35px;text-align: center;margin-top: -2px">
                                            <#if sp.type == 1>
                                                <a href="javascript:void(0)" onclick="chekedSp('goodsSp_${sp.id}','${item.id}_item','${item.name}');" id="${item.id}_item" title="${item.name}">
                                                ${item.name}<img src="${item.pic}" style="margin-top: 1px;padding-left: 1px;padding-right: 3px" width="16" height="16">
                                                </a>
                                            <#else>
                                                <a href="javascript:void(0)" onclick="chekedSp('goodsSp_${sp.id}','${item.id}_item','${item.name}');" id="${item.id}_item" title="${item.name}">${item.name}</a>
                                            </#if>
                                        </div>
                                    </div>
                                    <#assign i = i+1>
                                </#if>
                            </#list>
                        </li>
                    </#list>
                    <#-- 用js来渲染选中效果 -->
                    <#--<script type="text/javascript">
                        var currSpItems = ${currSpItems};
                        $.each(currSpItems, function (i, n) {
                            $('#' + n.content + '_item').parent().addClass('selected');
                        });
                        // 去掉重复的规格项
                        var temp = '';
                        $('#choose li a').each(function () {
                            if (temp.indexOf($(this).text()) != -1)
                                $(this).parent().parent().remove();
                            temp += $(this).html();
                        });
                    </script>-->
                    <li id='choose-type'></li>
                    <li id="choose-amount">
                        <div class="dt">购买数量：</div>
                        <div class="dd">
                            <div class="wrap-input" style="width: 140px">
                                <#if goods.stock <= 0>
                                    <div title="减少数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 20px;height: 20px;font-size: 15px;margin-left: -18px;margin-right: 3px; text-align: center;">－</div>
                                    <input class="text" id="buy-num" disabled value="0" style="float: left" />
                                    <div title="增加数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 20px;height:20px;font-size: 15px;margin-left: 3px; text-align: center;">＋</div>
                                    <div style="color: red;font-size: 14px;font-weight: bold; margin-left: 15px; float: left; margin-top: 3px;">[无货]</div>
                                <#else>
                                    <div onclick="reduce();" title="减少数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 20px;height: 20px;font-size: 15px;margin-left: -18px;margin-right: 3px; text-align: center;">－</div>
                                    <input class="text" id="buy-num" value="1" style="float: left" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
                                    <div onclick="add();" title="增加数量" style="float: left; cursor: pointer;border: 1px solid lightgray;width: 20px;height:20px;font-size: 15px;margin-left: 3px; text-align: center;">＋</div>
                                </#if>
                            </div>
                        </div>
                    </li>
                    <li id="choose-result" style="display: block">
                        <div class="dt"></div>
                        <div class="dd">
                            <em>已选择</em>
                            <strong></strong>
                        </div>
                    </li>
                    <script type="text/javascript">
                        /* var selectedText = "“";
                         var selected = $('#choose .selected');
                         var choose_result = $('#choose-result .dd strong');
                         $.each(selected, function (i, n) {
                             selectedText += $(n).children('a').text();
                             if (i < selected.length - 1) {
                                 selectedText += "，"
                             }
                         });
                         selectedText += "”";
                         if (selectedText != "" && selectedText != undefined && selectedText != "“”") {
                             choose_result.html(selectedText);
                         } else {
                             $('#choose-result').html("");
                         }*/
                    </script>
                    <li id="choose-btns">
                        <div id="choose-btn-append" class="btn">
                            <#if goods.isMarketable != 0 && goods.isDelete != '0'>
                                <#if goods.stock <= 0 || goods.price == '0'>
                                    <a class="btn_buys" id="goBuyUrl"  >立即购买</a>
                                    <a class="btn-appends " id="InitCartUrl"  >加入购物车</a>
                                <#else>
                                    <a class="btn_buy" id="goBuyUrl" onclick="addCart('${goods.id}', $('#buy-num').val(),'goBuy');" href="javascript:void(0);">立即购买</a>
                                    <a class="btn-append " id="InitCartUrl" onclick="addCart('${goods.id}', $('#buy-num').val(),'add');" href="javascript:void(0);">加入购物车</a>
                                </#if>
                            <script type="text/javascript">
                                function addCart(goodsId, cnt, type) {
                                    var sp = '';
                                    var flag = true;
                                    if($('input[name="goodsSp"]').length > 0){
                                        $('input[name="goodsSp"]').each(function(){
                                            if($(this).val() == ''){
                                                flag =false;
                                                alert('请选择['+$(this).attr("spname")+']');
                                                return false;
                                            }else{
                                                sp += $(this).attr("spname")+':'+$(this).val() + ',';
                                            }
                                        });
                                    }
                                    if(sp != ''){
                                        sp = sp.substring(0,sp.length-1);
                                    }
                                    if(flag){
                                        if(type == 'add'){
                                            window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href
                                        }else if(type=='goBuy'){
                                            window.location.href = "${base}/cart/goBuy?gid=" + goodsId + "&cnt=" +cnt + "&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href
                                        }
                                    }
                                }
                            </script>
                            <#--<#elseif goods.isMarketable == 0>-->
                                <#--<a class="btn-append" id="InitCartUrl" href="javascript:void(0);" alt="已下架">已下架<b class="btn-append-disable"></b></a>-->
                            </#if>
                        </div>
                        <div id="choose-btn-easybuy" class="btn"></div>
                        <div id="choose-btn-divide" class="btn"></div>
                    <#--<div id="choose-btn-coll" class="btn">-->
                    <#--<a href="#" id="coll988900" onclick="mark(988900,4);" class="btn-coll">加关注<b></b></a>-->
                    <#--</div>-->
                        <div id="Fqfk_Tip" class="Tip360" style="display:none;"></div>
                    </li>
                </ul>
                <span class="clr"></span>
            </div>
            <div class="attention-shop"><a onclick="addGoodsAttention('${goods.id}',this);" href="javascript:void(0);">关注该商品</a></div>
            <!-- 图片预览 -->
            <div id="preview">
                <#if goodsImagesList?? && goodsImagesList?size &gt; 0>
                <#assign firstImg = goodsImagesList?sort_by("orderNo")?first>
                <a href="${base}/goods/getGoodsImages/${goods.id},.html" id="goods_img_a" target="_blank">
                <div id="spec-n1" class="jqzoom"><!-- onclick="window.open('${firstImg.pic}')" -->
                    <img data-img="1" width="350" height="350" class="cloudzoom" style="border: 1px solid #ddd"
                         src="${firstImg.pic}@350w_350h.png"
                         alt="${firstImg.title}"
                         jqimg="${firstImg.pic}"/>
                </div>
                </a>
                <#else>
                <div id="imgPreview" class="jqzoom">
                    <img data-img="1" width="350" height="350" alt="商家没有上传图片"/>
                </div>
                </#if>

                <#--<div id="spec-list" style="margin-top: 5px">-->
                    <#--<input type="hidden" id="goodsImgesSize" value="<#if goodsImagesList??>${goodsImagesList?size}<#else>0</#if>">-->
                    <#--<a href="javascript:;" class="spec-control <#if goodsImagesList?size &lt; 6>disabled</#if>" id="spec-forward" style="z-index: 2"></a>-->
                    <#--<a href="javascript:;" class="spec-control <#if goodsImagesList?size &lt; 6>disabled</#if>" id="spec-backward" style="z-index: 2"></a>-->
                    <#--<div class="spec-items">-->
                        <#--<ul class="lh" style="position: absolute; left: 0px; top: 0px; width: 744px;z-index: 1;">-->
                            <#--<#list goodsImagesList?sort_by("orderNo") as img>-->
                                <#--<#assign cls></#assign>-->
                                <#--<#if img_index == 0>-->
                                    <#--<#assign cls = "class='img-hover'">-->
                                <#--</#if>-->
                                <#--<li><img ${cls} alt="${img.title}" src="${img.pic}_350x350.png"-->
                                                <#--width="50" height="50"></li>-->
                            <#--</#list>-->
                        <#--</ul>-->
                    <#--</div>-->
                <#--</div>-->

                <div id="spec-n5">
                    <div class="control" id="spec-left"> </div>
                    <div id="spec-list" style="margin-top: 5px">
                        <ul class="list-h" style="width: 180px; overflow: hidden;">
                            <#list goodsImagesList?sort_by("orderNo") as img>
                                <li><img alt="${img.title}" src="${img.pic}@350w_350h" jqimg="${img.pic}"></li>
                            </#list>
                        </ul>
                    </div>
                    <div class="control" id="spec-right"> </div>
                </div>
            </div>
        </div>
        <!-- 详细信息 -->
        <div id="detail-info">
            <div class="right" style="padding-top: 10px">
                <div id="product-detail" class="m m1" data-widget="tabs" clstag="shangpin|keycount|product|detail" load="true">
                    <div class="float-nav-wrap" style="height: 35px;">
                        <div class="mt" style="height:35px; width: 988px; background: #fbfbfb; border-top: 1px solid #dedfde;">
                            <ul class="tab">
                                <li data-widget="tab-item" id="p-detail-tab" class="curr"><a href="javascript:;" class="toggle-link">商品介绍</a></li>
                                <li data-widget="tab-item" id="p-attr-tab" class=""><a href="javascript:;" class="toggle-link">相关参数</a></li>
                                <li data-widget="tab-item" id="p-review-tab" class=""><a href="javascript:;" class="toggle-link">商品评价<span class="hl_blue" id="reviewSizeId"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div style="border-top: 1px solid #ccc;width: 990px;min-width: 990px"></div>
                    <div id="tab-content">
                        <!-- 商品介绍 -->
                        <div class="mc " data-widget="tab-content" id="p-detail" style="width:990px;min-width: 990px">
                            <ul class="detail-list">
                                <li title="${goods.name}">商品名称：${goods.name}</li>
                                <#list brandMap["${goods.brandId}"] as brandName>
                                    <li>品牌：${brandName}</li>
                                </#list>
                                <li>上架时间：${goods.createDate?datetime}</li>
                                <#list goodsParamList as pm>
                                    <#assign c = pm["content"]/>
                                    <#assign parameterId = pm["parameterId"]/>
                                    <#if c != "">
                                        <#list parameterMap?values as vals>
                                            <#list vals as val>
                                                <#if val.id = parameterId>
                                                    <li>${val.name}：${c}</li>
                                                </#if>
                                            </#list>
                                        </#list>
                                    </#if>
                                </#list>
                            </ul>
                            <div class="detail-correction ac"></div>
                            <div class="detail-content">
                                <div style="width: 100%">
                                ${goods.introduction}
                                </div>
                            </div>
                        </div>
                        <!-- 属性参数 -->
                        <div class="mc hide" data-widget="tab-content" id="p-attr" style="width:990px;min-width: 990px">
                            <div class="detail-correction ac" style="border: 1px solid #ddd; border-top: none;"></div>
                            <table cellpadding="0" cellspacing="1" width="100%" border="0" class="Ptable" style="margin-top:10px">
                                <tbody>
                                    <#list parameterMap?keys as key>
                                        <#assign params=parameterMap[key] />
                                        <#assign flag=false />
                                        <#list params as p>
                                            <#list goodsParamList as gpm>
                                                <#if gpm.parameterId == p.id && gpm.content != "">
                                                    <#assign flag=true>
                                                    <#break>
                                                </#if>
                                            </#list>
                                        </#list>

                                        <#if flag>

                                        <tr>
                                            <th class="tdTitle" colspan="2"><b>${key?substring(key?index_of("_")+1)}</b></th>
                                        </tr>
                                            <#list params as p>
                                                <#list goodsParamList as gpm>
                                                    <#if gpm.parameterId == p.id && gpm.content != "">
                                                    <tr>
                                                        <td class="tdTitle">${p.name}</td>
                                                        <td id="${p.id}_${p.name}">${gpm.content}</td>
                                                    </tr>
                                                    </#if>
                                                </#list>
                                            </#list>
                                        </#if>
                                        </#list>
                                </tbody>
                            </table>
                        </div>

                        <!-- 商品评价 -->
                        <div class="mc hide" data-widget="tab-content" id="p-review" style="width:990px;min-width: 990px;margin-top: 10px">
                            <div id="comment" class="m m2">
                                <div class="mc">
                                    <div id="i-comment">
                                        <div class="rate">
                                            <strong></strong><br>
                                            <span>好评度</span>
                                        </div>
                                        <div class="percent" style="width: 700px;">
                                            <dl>
                                                <dt>好评<span id="haoping_tip"></span></dt>
                                                <dd style="width: 600px;min-width: 600px">
                                                    <div id="haoping_rating" style=""></div>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>中评<span id="zhongping_tip"></span></dt>
                                                <dd class="d1" style="width: 600px;min-width: 600px">
                                                    <div id="zhongping_rating" style=""></div>
                                                </dd>
                                            </dl>
                                            <dl>
                                                <dt>差评<span id="chaping_tip"></span></dt>
                                                <dd class="d1" style="width: 600px;min-width: 600px">
                                                    <div id="chaping_rating" style=""></div>
                                                </dd>
                                            </dl>
                                        </div>
                                        <div class="btns">
                                            <div>您可对已购商品进行评价</div>
                                            <a href="${base}/order/review?goodsId=${goods.id}" class="btn-comment" target="_blank" style="margin-top: 15px">发评价</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 评价详细内容 -->
                            <div id="comments-list" class="m" data-widget="tabs" load="true" style=" width: 988px; background: #fbfbfb; border-top: 1px solid #dedfde;">
                                <div class="mt">
                                    <ul class="tab">
                                        <li data-widget="tab-item" class="curr" onclick="showTab('comments-all')"><a href="javascript:;">全部评价<em>(<span id="totalReview"></span>)</em></a></li>
                                        <li data-widget="tab-item" class="" onclick="showTab('comments-haoping')"><a href="javascript:;">好评<em>(<span id="haopingCnt"></span>)</em></a></li>
                                        <li data-widget="tab-item" class="" onclick="showTab('comments-zhongping')"><a href="javascript:;">中评<em>(<span id="zhongpingCnt"></span>)</em></a></li>
                                        <li data-widget="tab-item" class="" onclick="showTab('comments-chaping')"><a href="javascript:;">差评<em>(<span id="chapingCnt"></span>)</em></a></li>
                                    </ul>
                                </div>
                                <div id="comments-container" style="border-top: 1px solid #ccc;width: 988px;min-width: 988px">
                                    <div id="comments-all" class="mc curr" data-widget="tab-content"></div>
                                    <div id="comments-haoping" class="mc hide" data-widget="tab-content"></div>
                                    <div id="comments-zhongping" class="mc hide" data-widget="tab-content"></div>
                                    <div id="comments-chaping" class="mc hide" data-widget="tab-content"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <span class="clr"></span>
        </div>
    </div>
</div>
</#if>
<div id="include-foot">
	<span class="clr"></span>
    <#include "mall/xd/service.ftl"/>
    <#include "mall/xd/footer.ftl"/>
</div>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/index.js" type="text/javascript"></script>
<script src="${base}/static/js/layer.js" type="text/javascript"></script>
<script type="text/javascript" src="${base}/static/js/product.js"></script>

</body>
</html>
<script type="text/javascript">
    var reviewClicked = false;
    $(document).ready(function () {
        $.ajax({
            type: 'post',
            url: '${base}/member/getCurrM',
            success: function(data) {
                if( data.status == 'success' ){
                    $("#login").hide();
                    $("#loginAfter").show();
                    $("#lg_nickeName").text('Hi! '+data.m.nickName);
                    $("#lg_orderFuKuanCount").text('('+data.bl.orderFuKuanCount+')');
                    $("#lg_orderFaHuoCount").text('('+data.bl.orderFaHuoCount+')');
                    $("#lg_orderConfirmCount").text('('+data.bl.orderConfirmCount+')');

                }else{
                    $("#loginAfter").hide();
                    $("#login").show();
                }
            }
        });

        $(".jqzoom").jqueryzoom({
            xzoom: 400,
            yzoom: 400,
            offset: 10,
            position: "right",
            preload: 1,
            lens: 1
        });
        $("#spec-list").jdMarquee({
            deriction:"left",
            width:360,
            height:50,
            step:5,
            speed:5,
            delay:10,
            control:true,
            _front:"#spec-right",
            _back:"#spec-left"
        });
        $("#spec-list img").bind("mouseover",function(){
            var src=$(this).attr("src");
            var jqsrc=$(this).attr("jqimg");

            $("#spec-n1 img").eq(0).attr({
                src:src.replace("\/n5\/","\/n1\/"),
                jqimg:jqsrc.replace("\/n5\/","\/n0\/")
            });
            $(this).css({
                "border":"2px solid #e4393c",
                "padding":"1px"
            });
        }).bind("mouseout",function(){
            $(this).css({
                "border":"1px solid #ccc",
                "padding":"2px"
            });
        });


        selectedSp();
        $('.float-nav-wrap .tab li').bind('click', function () {
            tabStyle($(this), $('#tab-content').find('.mc'));
        });

        $('#choose .item').bind('click', function () {
            selectedSps($(this));
        });

        $('.spec-items .lh li').bind('mouseover', function () {
            previewImg($(this).children('img'));
        });

        $('#spec-backward').bind('click', imgBackward);
        $('#spec-forward').bind('click', imgForward);

        // 图片放大预览效果
//        CloudZoom.quickStart();

        // 初始化评价视图数据
        initReviewCount();

        // 延时加载评价
        $('#p-review-tab').bind('click', countReviewRate);

        $('#comments-list .tab li').bind('click', function () {
            tabStyle($(this), $('#comments-list li'));
        });

        getGoodsReviewSize($("#goodsId").val());
    });

    /**
     * 商品详细页tab页切换效果
     * @param li 选中的tab页
     * @param tabContent tab对应的详细内容
     */
    function tabStyle(li, tabContent) {
        li.addClass('curr');
        var subs = li.siblings();
        $.each(subs, function (i, _li) {
            $(_li).removeClass('curr');
        });
        var tmpId = $(li).attr('id');
        var tabContentId = tmpId.substr(0,tmpId.lastIndexOf('-tab'));
        $('#' + tabContentId).removeClass('hide');
        $('#' + tabContentId).siblings('div').addClass('hide');
    }

    <#if goods.stock??  || goods.stock &gt; 0>
    function reduce() {
        var buyNum = $('#buy-num');
        if(parseInt(buyNum.val()) > 1) {
            buyNum.val(parseInt(buyNum.val()) - 1);
        }
        <#--$('#InitCartUrl').attr('href', "${base}/cart/add?gid=${goods.id}&cnt=" + $('#buy-num').val() + "&backurl=" + window.location.href);-->
    }
    function add() {
        var buyNum = $('#buy-num');
        buyNum.val(parseInt(buyNum.val()) + 1);
        <#--$('#InitCartUrl').attr('href', "${base}/cart/add?gid=${goods.id}&cnt=" + $('#buy-num').val() + "&backurl=" + window.location.href);-->
    }
    </#if>

    /**
     * 选择规格的效果
     */
    function selectedSps(c) {
        var _id = c.children().eq(0).prop('id');
        var id = _id.substring(0, _id.indexOf('_item'));
        c.addClass('selected');
        var pSubs = c.parent().siblings();    // 选中元素的兄弟元素
        $.each(pSubs, function (i, sp) {
            $(sp).children('.item').removeClass('selected');
        });
    }

    /**
     * 鼠标放到缩略图上可以在id=imgPreview的div上显示中型图片效果
     * @param img 鼠标放上去的缩略图对象
     */
    function previewImg(img) {
        var newImgSrc = $(img).attr('src');
        $('#imgPreview img').attr('src', newImgSrc);
        /*$('#imgPreview').bind('click', function() {
            window.open(newImgSrc)
        });*/
        $(img).addClass('img-hover');   // 当前选中效果

        // 其它兄弟图片元素取消选中效果
        var sibsLi = $(img).parent().siblings();
        $.each(sibsLi, function (i, li) {
            $(li).children('img').removeClass('img-hover');
        });

        // 重新使图片放大预览
        var myInstance = $('#imgPreview img').data('CloudZoom');
        myInstance.loadImage(newImgSrc, newImgSrc);
    }

    /**
     * 图片回退
     */
    var picCounter = 0;
    function imgBackward() {
        var _left = $('.spec-items .lh').css('left');
        var left = parseInt(_left.substring(0, _left.indexOf("px")));
        if (left <= 0) {
            $('#spec-forward').removeClass('disabled');
        }
        var goodsImgesSize = parseInt($('#goodsImgesSize').val());
        var absLeft = Math.abs(left);
        if((absLeft + 62*5) >= goodsImgesSize*62 || goodsImgesSize == 0) {
            $('#spec-backward').addClass('disabled');
        } else {
            $('.spec-items .lh').css('left', (left - 62) + "px");
        }
        if(goodsImgesSize <= 5) {
            $('#spec-forward').addClass('disabled');
        }
    }

    /**
     * 图片前进
     */
    function imgForward() {
        var _left = $('.spec-items .lh').css('left');
        var left = parseInt(_left.substring(0, _left.indexOf("px")));
        var goodsImgesSize = parseInt($('#goodsImgesSize').val());
        if (goodsImgesSize > 5) {
            $('#spec-backward').removeClass('disabled');
        }
        if (left == 0) {
            $('#spec-forward').addClass('disabled');
        } else{
            $('.spec-items .lh').css('left', (left + 62) + "px");
        }
    }

    function initReviewCount() {
        var reviewList = [];
        var haopingList = [];
        var zhongpingList = [];
        var chapingList = [];
    <#list goodsReviewList as review>
        var pingjia = {
            score: '${review.score}'
        };
        <#if review.score &lt; 2>
            chapingList.push(pingjia);
        <#elseif review.score &gt; 1 && review.score &lt; 4>
            zhongpingList.push(pingjia);
        <#elseif review.score &gt; 3>
            haopingList.push(pingjia);
        </#if>
        reviewList.push(pingjia);
    </#list>
        var haopinglv = haopingList.length / reviewList.length;
        var zhongpinglv = zhongpingList.length / reviewList.length;
        var chapinglv = chapingList.length / reviewList.length;

        $("#i-comment .rate strong").html(haopinglv.toPercent() + "<span>%</span>");
        $("#haoping_tip").html("(" + haopinglv.toPercent() + "%)");
        $("#haoping_rating").attr("style", "width:" + haopinglv.toPercent() + "%");
        $("#zhongping_tip").html("(" + zhongpinglv.toPercent() + "%)");
        $("#zhongping_rating").attr("style", "width:" + zhongpinglv.toPercent() + "%");
        $("#chaping_tip").html("(" + chapinglv.toPercent() + "%)");
        $("#chaping_rating").attr("style", "width:" + chapinglv.toPercent() + "%");
    }

    /**
     * 计算并展示评价内容
     */
    function countReviewRate() {
        if (!reviewClicked) {
            $.ajax({
                type: 'post',
                url: '${base}/goods/getGoodsReviewList/${goods.id}.html',
                success: function(data) {
                    var all_comments_list = $("#comments-all");
                    var haoping_comments_list = $("#comments-haoping");
                    var zhongping_comments_list = $("#comments-zhongping");
                    var chaping_comments_list = $("#comments-chaping");
                    var allHtml = "";
                    var haopingHtml = "";
                    var zhongpingHtml = "";
                    var chapingHtml = "";
                    var huifuHtml = "";
                    var haopingList = []; var zhongpingList = []; var chapingList = [];
                    $('#totalReview').text(data.length);
                    $.each(data, function(i, review) {
                        huifuHtml = '';
                        if(review.maps != 'undefined' && review.maps != undefined && review.maps != ''){
                            $.each(review.maps, function(i, item) {
                                if(item !="" && item !=undefined){
                                    huifuHtml +="<div class='";

                                    if( i % 2 == 0){
                                        huifuHtml += "repply_second";
                                    }else{
                                        huifuHtml += "repply_first";
                                    }

                                    huifuHtml += "'>";
                                    huifuHtml +="<s class='clr'></s>";
                                    huifuHtml += '<dl><dt>';
                                    if(item.whichSys=='EC'){
                                        huifuHtml += '追加评论';
                                    }else if(item.whichSys=='MCM'){
                                        huifuHtml += '商家回复';
                                    }else if(item.whichSys=='ECM'){
                                        huifuHtml += '商城回复';
                                    }
                                    huifuHtml +="：</dt><dd>" + item.replyContent+"</dd></dl>";
                                    huifuHtml +="<s class='clr'></s><dl><dt>";
                                    huifuHtml +='<dt>';
                                    if(item.whichSys=='EC'){
                                        huifuHtml += '追加';
                                    }else{
                                        huifuHtml += '回复';
                                    }
                                    huifuHtml +='时间：</dt><dd>' + item.replyDate+'</dd></dl>';
                                    huifuHtml +='</div>';
                                }
                            });
                        }

                        var score = parseInt(review.score);
                        //Desc:将评论分数变为小星星显示 Auth:zhangqiang 2015-11-23 Start
                        var starts = "";
                        var flags = "";
                        if(score ==1){
                            starts = "star1";
                            flags = "star1 sa commstar";
                        }else if(score ==2){
                            starts = "star2";
                            flags = "star2 sa commstar";
                        }else if(score ==3){
                            starts = "star3";
                            flags = "star3 sa commstar";
                        }else if(score ==4){
                            starts = "star4";
                            flags = "star4 sa commstar";
                        }else if(score ==5){
                            starts = "star5";
                            flags = "star5 sa commstar";
                        }else{
                            starts = "";
                            flags = "star sa commstar";
                        }

                        if (score > 3) {
                            haopingList.push(review);
                            haopingHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic comment-box'>" + "<span class='sa commstar' style='margin-bottom: 5px'><a class='"+starts+"'></a></span><span class='fr'>购买时间："+review.buyDateStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>评论时间：</dt>" + "<dd>" + review.cdStr+"</dd>" + "</dl>";
                            if(huifuHtml !="" && huifuHtml !=undefined){
                                //haopingHtml +="<s class='clr'></s><dl><dt>回复：</dt><dd>" + review.replyContent+"</dd></dl><s class='clr'></s><dl><dt>回复时间：</dt><dd>" + review.replyDate+"</dd></dl>";
                                haopingHtml +=huifuHtml;
                            }
                            haopingHtml +="</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                        } else if (score > 1 && score < 4) {
                            zhongpingList.push(review);
                            zhongpingHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic comment-box'>" + "<span class='sa commstar' style='margin-bottom: 5px'><a class='"+starts+"'></a></span><span class='fr'>购买时间："+review.buyDateStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>评论时间：</dt>" + "<dd>" + review.cdStr+"</dd>" + "</dl>";
                            if(huifuHtml !="" && huifuHtml !=undefined){
                                //zhongpingHtml +="<s class='clr'></s><dl><dt>回复：</dt><dd>" + review.replyContent+"</dd></dl><s class='clr'></s><dl><dt>回复时间：</dt><dd>" + review.replyDate+"</dd></dl>";
                                zhongpingHtml +=huifuHtml;
                            }
                            zhongpingHtml += "</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                        } else if (score < 2) {
                            chapingList.push(review);
                            chapingHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic comment-box'>" + "<span class='sa commstar' style='margin-bottom: 5px'><a class='"+starts+"'></a></span><span class='fr'>购买时间："+review.buyDateStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>评论时间：</dt>" + "<dd>" + review.cdStr+"</dd>" + "</dl>";
                            if(huifuHtml !="" && huifuHtml !=undefined){
                                //chapingHtml +="<s class='clr'></s><dl><dt>回复：</dt><dd>" + review.replyContent+"</dd></dl><s class='clr'></s><dl><dt>回复时间：</dt><dd>" + review.replyDate+"</dd></dl>";
                                chapingHtml +=huifuHtml;
                            }
                            chapingHtml += "</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                        }
                        allHtml += "<div class='item'>" + "<div class='user'>" + "<div class='u-icon'>" + "<img height='50' width='50' upin='" + review.id + "' src='${base}/static/mall/img/header.png'>" + "</div>" + "<div class='u-name'>" + review.nickName + "</div>" + "</div>" + "<div class='i-item' data-guid='ec03fcfa-6c26-4892-ada4-a6c12cef0f03' style='min-height: 95px'>" + "<div class='o-topic comment-box'>" + "<span class='sa commstar' style='margin-bottom: 5px'><a class='"+starts+"'></a></span><span class='fr'>购买时间："+review.buyDateStr+"</span>" + "</div>" + "<div class='comment-content'>" + "<dl>" + "<dt>心得：</dt>" + "<dd> " + review.content + "。</dd>" + "</dl>" + "<s class='clr'></s>" + "<dl>" + "<dt>评论时间：</dt>" + "<dd>" + review.cdStr+"</dd>" + "</dl>";
                        if(huifuHtml !="" && huifuHtml !=undefined){
                            //allHtml +="<s class='clr'></s><dl><dt>回复：</dt><dd>" + review.replyContent+"</dd></dl><s class='clr'></s><dl><dt>回复时间：</dt><dd>" + review.replyDate+"</dd></dl>";
                            allHtml +=huifuHtml;
                        }
                        allHtml += "</div>" + "</div>" + "<div class='corner tl'></div>" + "</div>";
                    });
                    $('#haopingCnt').text(haopingList.length);
                    $('#zhongpingCnt').text(zhongpingList.length);
                    $('#chapingCnt').text(chapingList.length);
                    $(allHtml).appendTo(all_comments_list);
                    $(haopingHtml).appendTo(haoping_comments_list);
                    $(zhongpingHtml).appendTo(zhongping_comments_list);
                    $(chapingHtml).appendTo(chaping_comments_list);
                    //Desc:将评论分数变为小星星显示 Auth:zhangqiang 2015-11-23 End
                }
            });

            reviewClicked = true;
            $('#comments-all').removeClass('hide');
        }
    }

    /**
     * 选择规格
     */
    function chekedSp(spId,itemId,itemName){
        $('#' +spId).val(itemName);
        $('.item').removeClass("selected");
        $('#' +itemId).parent().addClass('selected');
        selectedSp();
    }

    function showTab(tab) {
        $("#" + tab + "").removeClass("hide");
        $("#" + tab + "").siblings("div").addClass("hide");
    }

    function selectedSp(){
        var selectedText = "“";
        if($('input[name="goodsSp"]').length > 0){
            var i = 0;
            $('input[name="goodsSp"]').each(function(){
                if($(this).val() != ''){
                    if(i > 0){
                        selectedText += ","
                    }
                    selectedText += $(this).val();
                    i++;
                }
            });
        }
        selectedText += "”";
        if (selectedText != "" && selectedText != undefined && selectedText != "“”") {
            $('#choose-result .dd strong').html(selectedText);
        } else {
            $('#choose-result').html("");
        }
    }

    function addGoodsAttention(goodsId,item) {
        $.ajax({
            type: "get",
            url: "${base}/goods/addToGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='success'){
                    layer.alert(data.message,{icon:1});
//                    $(item).removeClass("btn-coll").addClass("showattention");
                    $(item).text('已关注');
                    $(item).attr("onclick", "");
                }else if(data.status=='warn'){
                    layer.alert(data.message,{icon:2});
//                    $(item).removeClass("btn-coll").addClass("showattention");
                    $(item).text('已关注');
                    $(item).attr("onclick", "");
                }else if(data.status=='NOLOGIN'){
                    layer.alert("登录后才可关注商品",{icon:2},function(){
                        window.location="${base}/member/login";
                    });
                }else{
                    layer.alert(data.message,{icon:2});
                }

            }
        });
    }

    /**
     * Desc:获取商品评论次数，商品详情页静态化使用
     * Auth:zhangqiang
     * Time:2016-01-18 14:07:35
     * Start
     */
    function getGoodsReviewSize(goodsId){
        $.ajax({
            type: "post",
            url: "${base}/goods/ajaxGetGoodsReviewSize",
            data:{'goodsId':goodsId},
            datatype: 'json',
            error: function () {
                $("#reviewSizeId").text("("+0+")");
            },
            success: function(result) {
                if(result.status=='success'){
                    $("#reviewSizeId").text("("+result.goodsReviewSize+")");
                }else{
                    $("#reviewSizeId").text("("+0+")");
                }
            }
        });

    }

    /**
     * 数字百分比格式化
     * @param n 保留几位小数
     * @returns {string}
     */
    Number.prototype.toPercent = function (n) {
        n = n || 0;
        var result = (Math.round(this * Math.pow(10, n + 2)) / Math.pow(10, n) ).toFixed(n);
        return !isNaN(result) ? result : 0;
    }
    // 用法
    //    var A = 0.358975, B = 0.25554;
    //    alert([A, A.toPercent(3), B, B.toPercent()].join('\n'));
</script>
<script type="text/javascript" language="javascript" >
    <!--
    function display(){
        document.getElementById("code").style.display="block";
    }
    function disappear(){
        document.getElementById("code").style.display="none";
    }
    -->
</script>