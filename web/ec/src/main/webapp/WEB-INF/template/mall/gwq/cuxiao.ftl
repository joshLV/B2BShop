<#escape x as x?html>
    <#include "mall/gwq/top.ftl"/>
    <#include "mall/gwq/header_new.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/css/list3.css" rel="stylesheet" type="text/css" media="all"/>

<link href="${base}/static/mall/gwq/css/goods_detail.css" rel="stylesheet" type="text/css" />

<style type="text/css">
    .breadcrumb {
        height: 20px;
        padding: 10px 0 4px 6px;
        margin-bottom: 10px;
        overflow: hidden;
        line-height: 20px;
        vertical-align: baseline;
    }
    a:hover, a:active {
        color: #E4393C;
    }
    .breadcrumb strong, .breadcrumb h1 {
        font-weight: normal;
        line-height: 20px;
        font-size: 18px;
        font-family: "microsoft yahei";
    }
    .m, .sm {
        margin-bottom: 10px;
    }
    .m, .mt, .mc, .mb, .sm, .smt, .smc, .smb {
        overflow: hidden;
        zoom: 1;
    }
    strong, b {
        font-weight: bold;
    }
    .j_logo {
        height: 31px;
        line-height: 31px;
        font-family: \5fae\8f6f\96c5\9ed1;
        font-weight: normal;
        font-size: 15px;
        background: #F7F7F7;
        padding-left: 15px;
    }
    div, img, ul, ol, li, dl, dt, dd {
        margin: 0;
        padding: 0;
        border: 0;
    }
    div {
        display: block;
    }
    .p-name {
        height:36px;
        overflow: hidden;
    }
    #hotsale {
        float: left;
        width: 590px;
        height: 137px;
        padding-bottom: 10px;
        _padding-bottom: 7px;
        background: #FCFFFA;
    }
    #i-right {
        overflow: visible;
        position: relative;
        height: 153px;
        border: 1px solid #ddd;
        background: #FCFFFA;
    }
    .m, .sm {
        margin-bottom: 10px;
    }
    .right-extra {
        float: right;
        width: 990px;
        border: 1px solid #e7e3e7;
        background: #ffffff;
    }
    #market .mt h2 {
        background-position: 0 -614px;
    }
    #i-right h2 {
        font: normal 15px/1.3 \5fae\8f6f\96c5\9ed1;
    }
    #market li {
        height: 20px;
        line-height: 20px;
        overflow: hidden;
    }
    #market .mc {
        padding: 10px 10px 2px;
        font-family: \5b8b\4f53;
    }
    #select .mt {
        height: 35px;
        padding: 0 10px 0 10px;
        border-bottom:1px solid #E8E8E8;
        background: #ffffff;
        line-height: 35px;
    }
    #select .mt h1 {
        float: left;
        height: 35px;
        font: normal 15px/35px \5fae\8f6f\96c5\9ed1;
        color: #E4393C;
    }
    #select .mt h1 strong {
        margin-right: 10px;
        font: normal 15px/35px \5fae\8f6f\96c5\9ed1;
        color: #333;
    }
    #select .mc > div:first-child .attr {
        border-top: none;
    }
    .attr {
        padding: 4px 0 2px;
        overflow: hidden;
        zoom: 1;
        border-top: 1px dotted #ccc;
    }
    .attr .a-key {
        float: left;
        width: 100px;
        font-weight: bold;
        text-align: right;
        line-height: 25px;
    }
    .brand-attr .tabcon div {
        float: left;
        overflow: hidden;
        width: 170px;
        height: 20px;
        margin-right: 10px;
        padding-top: 5px;
    }

    .a-values-more div{
        float: left;
        overflow: hidden;
        width: 170px;
        height: 20px;
        margin-right: 10px;
        padding-top: 5px;
    }
    /*  .attrs{background: #ffffff;}*/
    .selected-c .a-values, .prop-attrs .a-values, .color-attr .a-values, .brand-attr .a-values {
        position: relative;
        overflow: hidden;
        /* padding-right: 120px;*/
        float: left;
        width: 750px;
    }
    /*  .brand-attr .tabcon div {
          float: left;
          overflow: hidden;
          width: 140px;
          height: 20px;
          margin-right: 15px;
          padding-top: 5px;
      }*/
    .brand-attr .v-tabs a:hover, .brand-attr .v-tabs a.curr {
        color: #E4393C;
    }
    .brand-attr .v-tabs a {
        height: 15px;
        line-height: 15px;
        text-decoration: none;
        overflow: hidden;
        white-space: nowrap;
        color: #005aa0;
    }
    .attr .a-values .v-option {
        position: absolute;
        right: 10px;
        top: 0px;
        width: 105px;
        height: 20px;
        padding-top: 2px;
    }
    .attr .a-values .o-more:hover {
        border-color: #ccc;
        cursor: pointer;
    }
    .attr .a-values .o-more {
        float: right;
        position: relative;
        width: 31px;
        height: 20px;
        padding-right: 14px;
        line-height: 20px;
        line-height: 21px\9;
        text-align: right;
        text-decoration: none;
        cursor: pointer;
        color: #005AA0;
    }
    .prop-attrs .v-fold .f-list {
        overflow: hidden;
        width: 800px;
        height: auto;
    }
    .prop-attrs .v-fold .f-list a:hover, .prop-attrs .v-fold .f-list a.curr {
        color: #E4393C;
    }
    <#--品牌 價格 類別 樣式 -->
    .prop-attrs .v-fold .f-list a {
        float: left;
        height: 15px;
        width: 80px;
        line-height: 25px;
        text-decoration: none;
        white-space: nowrap;
        font-family: verdana;
        color: #005aa0;
    }
    #select .mb .attr-extra div {
        position: relative;
        _display: inline;
        _zoom: 1;
        height: 24px;
        padding: 0 32px 0 24px;
        line-height: 24px;
    }
    #select .mb .attr-extra {
        line-height: 20px;
        text-align: right;
        cursor: pointer;
        font-size: 12px;
    }
    #filter .fore1 {
        overflow: hidden;
        height: 26px;
        padding: 5px 8px;
        border-bottom: 1px solid #E7E3E7;
        zoom: 1;
        margin-bottom: 5px;
    }
    #filter dl, #filter dt, #filter dd {
        float: left;
        line-height: 26px;
        zoom: 1;
    }
    #filter .order .curr a:link, #filter .order .curr a:visited {
        color: #fff;
    }
    #filter .order a {
        display: block;
        float: left;
        padding: 0px 3px 0px 10px;
    }
    a:hover {
        color: #E4393C;
        text-decoration: underline;
    }
    #filter .order .curr {
        font-weight: bold;
    }
    #filter .order dd {
        line-height: 26px;
        zoom: 1;
    }
    #filter .order .curr {
        border: 1px solid #E4393C;
        background: #E4393C;
        font-weight: bold;
    }
    #filter .order dd {
        height: 26px;
        border: 1px solid #CECBCE;
        background-position: 0 -73px;
        background-repeat: repeat-x;
        background-color: #fff;
        margin-right: 5px;
        line-height: 26px;
        overflow: hidden;
        zoom: 1;
    }
    #filter .pagin {
        float: right;
        height: 22px;
        padding: 2px 0;
        border-left: 1px solid #fff;
    }
    .pagin-m .prev, .pagin-m .next, .pagin-m .prev-disabled, .pagin-m .next-disabled {
        border-radius: 3px;
        background: #fff;
        padding-top: 3px;
        height: 14px;
        line-height: 14px;
    }
    .pagin .prev, .pagin .prev-disabled {
        padding-left: 12px;
    }
    .pagin .prev-disabled, .pagin .next-disabled {
        color: #ccc;
        cursor: default;
    }
    pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {
        position: relative;
        padding-top: 5px;
        height: 18px;
        line-height: 18px;
    }
    .pagin-m a, .pagin-m span {
        height: 14px;
        line-height: 14px;
        font-size: 12px;
    }
    list.htmlmedia="all"
    .pagin a, .pagin span {
        float: left;
        height: 20px;
        padding: 3px 10px;
        border: 1px solid #ccc;
        margin-left: 2px;
        font-family: arial;
        line-height: 20px;
        font-size: 14px;
        overflow: hidden;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
    }
    #filter .total {
        line-height: 22px;
        font-family: verdana;
        color: #E4393C;
    }
    #filter .fore1 {
        zoom: 1;
    }
    #filter .fore2 {
        padding: 3px 8px;
        zoom: 1;
    }
    #filter .store {
        padding-right: 15px;
        border-right: 1px solid #E7E3E7;
    }
    #filter dd {
        float: left;
        line-height: 26px;
        zoom: 1;
    }
    dt {
        display: block;
    }
    #store-selector {
        position: relative;
        z-index: 5;
        height: 26px;
        margin-right: 10px;
    }
    #filter .type {
        border-right: 1px solid #E7E3E7;
        border-left: 1px solid #fff;
        padding-left: 15px;
    }
    #store-selector.hover .text {
        z-index: 1;
        height: 24px;
        border-bottom: 0;
        background: #fff;
    }
    #store-selector .text {
        float: left;
        position: relative;
        top: 0;
        overflow: hidden;
        height: 23px;
        padding: 0 24px 0 4px;
        border: 1px solid #ddd;
        background: #fff;
        line-height: 23px;
    }
    a:link, a:visited {
        /* color: #666;*/
    }
    a {
        color: #666;
        text-decoration: none;
    }
    a:hover, a:active {
        color: #E4393C;
    }
    img {
        vertical-align: middle;
    }
    a img {
        border: 0;
    }
    img {
        vertical-align: middle;
    }
    #plist.ordinary-prebuy .list-h li {
        position: relative;
        /* width: 247px;*/
        height: 421px;
        padding: 0;
        height: 100%;
        padding-bottom: 30px;
    }
    #plist li {
        width: 230px;
        text-align: left;
        font-family: arial,\5b8b\4f53;
        margin-left: 14px;
    }
    .list-h li, .list-h dl {
        float: left;
    }
    .left {
        float: left;
        width: 210px;
    }
    <#--左側列表樣式 -->
    #sortlist {
        border: 1px solid #ddd;
        border-top: 2px solid #999;
    }
    #sortlist .mt {
        display: none;
        height: 24px;
        padding: 3px 8px;
        line-height: 24px;
    }
    #sortlist h2 {
        color: #fff;
    }
    #sortlist .mc {
        width: 208px;
        margin-top: -1px;
        background: #FFF;
    }
    #sortlist h3 {
        height: 30px;
        background-color: #F7F7F7;
        padding: 0 7px 0 10px;
        border-top: 1px solid #ddd;
        cursor: pointer;
        font: normal 14px/30px \5fae\8f6f\96c5\9ed1;
    }
    #sortlist .current ul {
        display: block;
    }
    #sortlist ul {
        overflow: hidden;
        display: none;
        padding: 6px 0;
        border-top: 1px solid #ddd;
        zoom: 1;
    }
    #sortlist .current b {
        background: url(${base}/static/mall/goods/20130603A.png) no-repeat -37px 0;
    }
    #sortlist b {
        float: left;
        width: 16px;
        height: 16px;
        margin: 7px 8px 0 0;
        background: url("${base}/static/mall/goods/20130603A.png") no-repeat -20px 0;
        overflow: hidden;
        cursor: pointer;
    }
    #sortlist li {
        width: 159px;
        height: 18px;
        padding: 3px 15px 3px 35px;
        overflow: hidden;
    }
    <#--右側頁面樣式-->
    .pagin .prev-disabled, .pagin .next-disabled {
        color: #ccc;
        cursor: default;
    }
    .pagin .prev-disabled, .pagin .next-disabled {
        position: relative;
        padding-top: 5px;
        height: 18px;
        line-height: 18px;
    }
    .pagin .current, .pagin .current:link, .pagin .current:visited {
        color: #f60;
        font-weight: 700;
    }
    .current {
        font-family: verdana;
    }
    .pagin a, .pagin span {
        border-radius: 3px;
    }
    .pagin a, .pagin span {
        float: left;
        height: 20px;
        padding: 3px 10px;
        border: 1px solid #ccc;
        margin-left: 2px;
        font-family: arial;
        line-height: 20px;
        font-size: 14px;
        overflow: hidden;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
    }
    .pagin .next, .pagin .next-disabled {
        padding-right: 12px;
    }
    pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {
        position: relative;
        padding-top: 5px;
        height: 18px;
        line-height: 18px;
    }
    .noRecord{padding: 10px;}
    .p-img{width: 220; height: 230px; border: 1px solid #CCCCCC; margin-top: 10px; margin-bottom: 10px; background:url("${base}/static/mall/gwq/img/default_img.jpg") no-repeat center;}
    .p-img:hover{ -webkit-box-shadow:0 0 5px rgba(98, 98, 98, .5);
        -moz-box-shadow:0 0 5px rgba(98, 98, 98, .5);
        box-shadow:0 0 5px rgba(98, 98, 98, .5);  }
    <#--右側上部頁碼-->
    #filter .order a {
        display: block;
        padding: 0px 3px 0px 10px;
    }
    a:hover, a:active {
        color: #E4393C;
    }
    #filter .pagin {
        float: right;
        height: 22px;
        padding: 2px 0;
        border-left: 1px solid #fff;

    }
    .pagin .text, .pagin .current {
        font-family: verdana;
    }
    .pagin .text, .pagin .current {
        border: 0;
        padding: 4px 11px;
    }
    .pagin .text i {
        font-style: normal;
        font-weight: bold;
        color: #E4393C;
    }
    .pagin-m .prev-disabled, .pagin-m .next-disabled {
        padding-top: 5px;
        height: 18px;
        line-height: 18px;
    }
    .pager{margin-right: 10px;}
    #filter .total {
        float: right;
        height: 22px;
        padding: 2px 15px 2px 0;
        border-right: 1px solid #E7E3E7;
        line-height: 22px;
        font-family: verdana;
        color: #E4393C;
    }
    strong, b {
        font-weight: bold;
    }
    #plist .btns{
        margin-top:10px;
        zoom:1;
        overflow: hidden;
        height: 30px;
        line-height: 30px;
    }

    #plist .btn-buy{float:left;height:28px; padding-left:35px;border: 1px solid #E8E8E8; padding-right: 15px;  position: relative; /*border-radius:2px;*/margin:0 4px 0 0;/*background:#F7F7F7;*/line-height:28px;text-align:center;text-decoration:none;color:#c00000;}
    #plist .btn-buy:hover{border: 1px solid #DB0000; color: #c00000;/* text-decoration: underline;*/}
    #plist .btn-buy i{
        position: absolute;
        display: block;
        font-style: normal;
        left:10px;
        top:7px;
        width: 18px;
        height: 18px;
        background: url(${base}/static/mall/gwq/img/search.ele.png) no-repeat 0 -273px;
    }
    #plist .btn-coll{float:left;height:28px;padding-left:35px;border:1px solid #E8E8E8;background: url(${base}/static/mall/gwq/img/search.ele.png) no-repeat 10px -407px; padding-right: 15px;  position: relative; /*border-radius:2px;*/margin:0 4px 0 0;/*background:#F7F7F7;*/line-height:28px;text-align:center;text-decoration:none;color:#b2b2b2;}
    #plist .btn-coll:hover{border: 1px solid #DB0000; color: #c00000; /*text-decoration: underline;*/ background: url(${base}/static/mall/gwq/img/search.ele.png) no-repeat 10px -430px;}
    .showattention{ padding-top:7px; padding-bottom:7px; color: #DB0000 !important; padding-left:35px; padding-right: 15px; border: 1px solid #DB0000; /*text-decoration: underline;*/ background: url(${base}/static/mall/gwq/img/search.ele.png) no-repeat 10px -430px;}

    /* 筛选更多 */
    .list-more{float: left; border: 1px solid #E8E8E8; padding:3px 6px 3px 10px;}
    .list-more a{display: block; float: left;}
    .list-more i{width: 18px; height: 7px; margin-top: 6px; margin-left: 3px;  background: url(${base}/static/mall/gwq/img/search.ele.png) no-repeat; float: left;}
    .list-less{float: left; border: 1px solid #E8E8E8; padding:3px 6px 3px 10px;}
    .list-less a{display: block; float: left;}
    .list-less i{width: 18px; height: 7px; margin-top: 6px; margin-left: 3px;  background: url(${base}/static/mall/gwq/img/search.ele.png) no-repeat 0 -34px; float: left;}
    .a-values-more{float: left;overflow: hidden;width: 750px; margin-left: 100px;}
    .a-values-more a{color: #005aa0}
    .a-values-more a.curr {
        color: #E4393C;
    }

    #filter .order .arrow_write_bottom{background: #DB0000; border: 1px solid #e4393c; }
    #filter .order .arrow_write_bottom a{color: #ffffff;}
    #filter .order .curr b{background: url("${base}/static/img/top_arrow_write.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
    #filter .order .arrow_write_bottom b{background: url("${base}/static/img/bot_arrow_write.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
    #filter .arrow_native b{background: url("${base}/static/img/top_arrow.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
    #filter .arrow_bottom b{background: url("${base}/static/img/bot_arrow.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
    #filter .arrow_native em{float: left; font-weight: normal; margin-right: 5px;}
    #filter .arrow_bottom em{float: left; font-weight: normal; margin-right: 5px;}
    #filter .order .curr em{float: left; font-weight: normal; margin-right: 5px;}
    #filter .order .arrow_write_bottom em{float: left; font-weight: normal; margin-right: 5px;}

    /*Desc:设置会员身份证号弹出框样式 Auth:zhangqiang Time:2015-01-30  Start*/
    .popGeneral_address .aptab_center_address label {width: 80px;display: inline-block;}
    .popGeneral_address .aptab_center_address .newaddress{margin-top: 20px; margin-left: 20px;}
    .popGeneral_address .aptab_center_address .newaddress li {margin-bottom: 10px;}
    .popGeneral_address .aptab_center_address .newaddress li input {height: 27px;line-height: 27px;padding-left: 5px;vertical-align: middle;border: 1px solid #e6e6e6;}
    .popGeneral_address .aptab_center_address .btn_save { width:116px; height:auto;  line-height:34px; margin: 10px 5px 0 85px; text-align: center; background: #db0000; border: none !important; color: #FFFFFF; border-radius: 3px;}

    .check_error{color: #DB0000; margin-left: 10px;}
    /*Desc:设置会员身份证号弹出框样式 Auth:zhangqiang Time:2015-01-30  End*/
    /*专题活动样式*/
    .cxlist{width:100%;}
    .cxinfo{width: 1200px; min-height: 500px; height: auto !important; margin: 0 auto;}
    #plist.ordinary-prebuy .list-h li{width: 280px; margin: 10px; float: left;}
    .cxinfo .p-img{width: 280px; height: 240px; padding:0;}
    #plist .btns{text-align: center;}
</style>
<script type="text/javascript">
    <#if message>
        layer.alert("${message}",function(){window.location.href="${base}/index";})
    </#if>
    $(".u-category").css("display","none");
    window.pageConfig = {
        compatible: true,
        navId: "list-${catelog.id}"
    };
</script>

<style>

</style>
<div class="content">
    <input id="getParentCatelogId" type="hidden" value="${parentCatelog.id}" />
    <input id="getCatelogId" type="hidden" value="${catelog.id}" />
    <input id="getBrandFlag" type="hidden" value="${brandFlag}" />
    <input id="getOrderByFlag" type="hidden" value="${orderByFlag}" />
<#--Desc:存放点击商品加入购物车的商品ID Auth:zhangqiang Time:2015-01-30  Start-->
    <input id="crossBorderId" type="hidden" value="" />
<#--Desc:存放点击商品加入购物车的商品ID Auth:zhangqiang Time:2015-01-30  End-->

    <div class="breadcrumb">
        <strong><a href="${base}/list/${grandCatelog.id}.html">${grandCatelog.name}</a></strong>
        <span>
        <#if parentCatelog.id??>
            <#if grandCatelog.id??>
                &nbsp;&gt;&nbsp;
                <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}.html">${parentCatelog.name}</a>
            <#else>
                <h1>
                    <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}.html">${parentCatelog.name}</a>
                </h1>
            </#if>
        </#if>
            <#if catelog.id??>
                &nbsp;&gt;&nbsp;
                <a href="${base}/list/${grandCatelog.id}-${parentCatelog.id}-${catelog.id}.html">${catelog.name}</a>
            </#if>
	    </span>
    </div>
</div>
<div class="content m">
    <div style="width: 100%; height: 30px; line-height: 30px; padding: 10px 0; font-size: 20px; font-weight: bold; text-align: center;">${promotions.pName}</div>
    <div id="plist" class="m plist-n7a ordinary-prebuy f-cb cxlist">
        <ul id="cxinfo" class="list-h f-cb cxinfo">
            <#list pager.getList() as gl>
                <li index="${gl_index}" sku="${gl.id}" selfservice="0">
                    <div class="lh-wrap">
                        <div class="p-img">
                            <a target="_blank" href="${base}/item/${gl.id}.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}&mt=z">
                                <img width="280" height="240" alt="${gl.fullName}" data-img="1" class="err-product" src="${gl.pic}@280w_240h.png" title="${gl.fullName}">
                            </a>
                        </div>
                        <div class="p-name">
                            <a target="_blank" href="${base}/item/${gl.id}.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}&mt=z" title="${gl.fullName}">${gl.fullName}<font style="color: #ff0000;" name="${gl.id}" class="adwords"></font></a>
                        </div>
                        <#if promotions.isOpen == "start">
                        <div class="p-price">
                            <strong>活动价：￥${gl.price}</strong>
                            <span style="float: right; text-decoration: line-through;">原价：￥${gl.goodsPrice}</span>
                            <div class="clearfix"></div>
                        </div>
                        <#else>
                            <div class="p-price">
                                <strong>商城价：￥${gl.price}</strong>
                                <span style="float: right; text-decoration: line-through;">市场价：￥${gl.goodsPrice}</span>
                                <div class="clearfix"></div>
                            </div>
                        </#if>
                        <!--增加商品销量 Auth:zhangqiang Time:2015-09-24 17:19:35 Start -->
                        <div class="extra">
                            <strong>销量&nbsp;<#if gl.sales??>${gl.sales}<#else>0</#if></strong>
                            </div>
                                <!--增加商品销量 Auth:zhangqiang Time:2015-09-24 17:19:35 End -->
                                <div class="extra">
                <span class="evaluate">
                    <a target="_blank" href="${base}/item/${gl.id}.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}&mt=z">已有&nbsp;<#if gl.scoreCount??>${gl.scoreCount}<#else>0</#if>&nbsp;人评价</a>
                </span>
                                </div>
                                <div class="btns">
                                <#--Desc:点击加入购物车时先判断是否登录 priceHide == 'hide' 表示未登录 Auth:zhangqiang Time:2015-01-30  Start-->
                                    <#if priceHide == 'hide'>
                                        <a stock="1010626351" tpl="1" onclick="forward();" href="javascript:void(0);"  class="btn-buy"><i></i>加入购物车</a>
                                    <#else>
                                    <#--Desc:判断是否为跨境商品 gl.crossBorder == '1' 是跨境商品 Auth:zhangqiang Time:2015-01-30  Start-->
                                        <#if gl.crossBorder == '1'>
                                            <a stock="1010626351" tpl="1" onclick="addCart('${gl.id}','1','1');" href="javascript:void(0);"  class="btn-buy"><i></i>加入购物车</a>
                                        <#else>
                                            <a stock="1010626351" tpl="1" onclick="addCart('${gl.id}','1','0');" href="javascript:void(0);"  class="btn-buy"><i></i>加入购物车</a>
                                        </#if>
                                    <#--Desc:判断是否为跨境商品 gl.crossBorder == '1' 是跨境商品 Auth:zhangqiang Time:2015-01-30  End-->
                                    </#if>
                                <#--Desc:点击加入购物车时先判断是否登录 priceHide == 'hide' 表示未登录 Auth:zhangqiang Time:2015-01-30  End-->
                                <#--<a stock="1010626351" tpl="1" href="${base}/item/${gl.id}.html" class="btn-buy">加入购物车</a>-->
                                    <a id="coll1010626351" onclick="addGoodsAttention('${gl.id}',this);" href="javascript:void(0);" class="btn-coll">关注</a>
                                    <!--<a id="comp_1010626351" skuid="1010626351" class="btn-compare btn-compare-s"><span></span>对比</a>-->
                                </div>
                            </div>
                </li>
            </#list>
        </ul>
    </div>
    <#--<div id="plist" class="m plist-n7a ordinary-prebuy">
        <ul class="list-h">
            <#list goodsList as gl>
                <li index="0" sku="${gl.id}" selfservice="0">
                    <div class="lh-wrap">
                        <div class="p-img">
                            <a target="_blank" href="${base}/item/${gl.id}.html">
                                <img width="220" height="220" alt="${gl.fullName}" data-img="1" class="err-product" src="${gl.pic}@220w_220h.png" title="${gl.fullName}">
                            </a>
                        </div>
                        <div class="p-name">
                            <a target="_blank" href="${base}/item/${gl.id}.html" title="${gl.fullName}">${gl.fullName}<font style="color: #ff0000;" name="${gl.id}" class="adwords"></font></a>
                        </div>
                        <div class="p-price">
                            <strong>促销价：￥${gl.promotionsPrice}</strong>
                            <span style="float: right; text-decoration: line-through;">原价：￥${gl.goodsPrice}</span>
                            <div class="clearfix"></div>
                        </div>
                        <!--增加商品销量 Auth:zhangqiang Time:2015-09-24 17:19:35 Start &ndash;&gt;
                        <div class="extra">
                            <strong>销量&nbsp;<#if gl.sales??>${gl.sales}<#else>0</#if></strong>
                            <div>
                                <!--增加商品销量 Auth:zhangqiang Time:2015-09-24 17:19:35 End &ndash;&gt;
                                <div class="extra">
                <span class="evaluate">
                    <a target="_blank" href="${base}/item/${gl.id}.html">已有&nbsp;<#if gl.scoreCount??>${gl.scoreCount}<#else>0</#if>&nbsp;人评价</a>
                </span>
                                </div>
                                <div class="btns">
                                &lt;#&ndash;Desc:点击加入购物车时先判断是否登录 priceHide == 'hide' 表示未登录 Auth:zhangqiang Time:2015-01-30  Start&ndash;&gt;
                                    <#if priceHide == 'hide'>
                                        <a stock="1010626351" tpl="1" onclick="forward();" href="javascript:void(0);"  class="btn-buy"><i></i>加入购物车</a>
                                    <#else>
                                    &lt;#&ndash;Desc:判断是否为跨境商品 gl.crossBorder == '1' 是跨境商品 Auth:zhangqiang Time:2015-01-30  Start&ndash;&gt;
                                        <#if gl.crossBorder == '1'>
                                            <a stock="1010626351" tpl="1" onclick="addCart('${gl.id}','1','1');" href="javascript:void(0);"  class="btn-buy"><i></i>加入购物车</a>
                                        <#else>
                                            <a stock="1010626351" tpl="1" onclick="addCart('${gl.id}','1','0');" href="javascript:void(0);"  class="btn-buy"><i></i>加入购物车</a>
                                        </#if>
                                    &lt;#&ndash;Desc:判断是否为跨境商品 gl.crossBorder == '1' 是跨境商品 Auth:zhangqiang Time:2015-01-30  End&ndash;&gt;
                                    </#if>
                                &lt;#&ndash;Desc:点击加入购物车时先判断是否登录 priceHide == 'hide' 表示未登录 Auth:zhangqiang Time:2015-01-30  End&ndash;&gt;
                                &lt;#&ndash;<a stock="1010626351" tpl="1" href="${base}/item/${gl.id}.html" class="btn-buy">加入购物车</a>&ndash;&gt;
                                    <a id="coll1010626351" onclick="addGoodsAttention('${gl.id}',this);" href="javascript:void(0);" class="btn-coll">关注</a>
                                    <!--<a id="comp_1010626351" skuid="1010626351" class="btn-compare btn-compare-s"><span></span>对比</a>&ndash;&gt;
                                </div>
                            </div>
                </li>
            </#list>
        </ul>
    </div>
<div class="clr"></div>-->
</div>
<#--Desc:弹出DIV设置身份证号 Auth:zhangqiang Time:2016-01-30 Start-->
<div class="popGeneral_address" id="popupdiv" style="display:none;">
    <div class="pop_win aptab_center_address">

        <ul class="newaddress">
            <li>
                <label> <strong style="color: red;">*</strong> 身份证号： </label>
                <input type="text" id="idcode"  name="idcode" value="" class="inputxt" style="width: 180px;">
                <span id="checkIdcodeId" class="check_error hide"></span>
            </li>

            <li>
                <input type="submit" value="保 存" onclick="save_idcode()"  class="btn_save  bule_btn" />
            </li>
        </ul>
    </div>
</div>
<#--Desc:弹出DIV设置身份证号 Auth:zhangqiang Time:2016-01-30 End-->
<script src="${base}/static/mall/js/list3.js" type="text/javascript"></script>
<script type="text/javascript">
    var pagecount= ${pager.pageCount};
    var page= ${pager.pageNumber};
    var pagesize = ${pager.pageSize};
    var promotionsId = "${promotions.id}";
    var isload = false;
    $(function(){
        $(window).scroll(function(){
            var plisth=$("#plist").height();
            var plisttop=$("#plist").offset().top;
            var st=$(window).scrollTop();
            if((st+plisttop)>(plisth-400)){
                more();
            }
        });
    });

    //显示加载更多
    function more(){
        if(pagecount>page && !isload){
            var index = layer.load();
            page=parseInt(page)+1;
            isload=true;
            $.ajax({
                url:"${base}/huodongdata/"+promotionsId,
                type:"POST",
                data:"pageNumber="+page,
                success:function(result){
                    layer.close(index);
                    isload = false;
                    if(result.status=="success") {
                        var html = makehtml(result.data);
                        $("#cxinfo").append(html);
                    }
                },
                error:function(){
                    layer.alert("获取数据失败请刷新后重试！");
                }
            });
        }
    }

    function makehtml(data){
        var html="";
        $.each(data,function(index,goods){
            html +='<li index="'+(pagesize*(page-1)+index+1)+'" sku="'+goods.id+'" selfservice="0">';
            html +='<div class="lh-wrap">';
            html +='<div class="p-img"><a target="_blank" href="${base}/item/'+goods.id+'.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}"><img width="280" height="240" alt="'+goods.fullName+'" data-img="1" class="err-product" src="'+goods.pic+'@280w_240h.png" title="'+goods.fullName+'"></a></div>';
            html +='<div class="p-name"><a target="_blank" href="${base}/item/'+goods.id+'.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}" title="'+goods.fullName+'">'+goods.fullName+'<font style="color: #ff0000;" name="'+goods.id+'" class="adwords"></font></a></div>';
            html +='<div class="p-price f-cb">';
            <#if promotions.isOpen == "start">
            html +='<strong>活动价：￥'+goods.price+'</strong>';
            html +='<span style="float: right; text-decoration: line-through;">原价：￥'+goods.goodsPrice+'</span></div>';
            <#else >
            html +='<strong>商城价：￥'+goods.price+'</strong>';
            html +='<span style="float: right; text-decoration: line-through;">市场价：￥'+goods.goodsPrice+'</span></div>';
            </#if>
            html +='<div class="extra"><strong>销量&nbsp;';
            if(goods.sales==""){
                html +='0';
            }else{
                html += goods.sales;
            }
            html +='</strong></div>';
            html +='<div class="extra"><span class="evaluate"><a target="_blank" href="${base}/item/'+goods.id+'.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}">已有&nbsp;';
            if(goods.scoreCount==""){
                html +='0';
            }else{
                html += goods.scoreCount;
            }
            html +='&nbsp;人评价</a></span></div>';
            html +='<div class="btns">';
            if(goods.crossBorder==1){
                html +='<a stock="1010626351" tpl="1" onclick="addCart(\''+goods.id+'\',\'1\',\'1\');" href="javascript:void(0);"  class="btn-buy"><i></i>加入购物车</a>';
            }else{
                html +='<a stock="1010626351" tpl="1" onclick="addCart(\''+goods.id+'\',\'1\',\'0\');" href="javascript:void(0);"  class="btn-buy"><i></i>加入购物车</a>';
            }
            html +='<a id="coll1010626351" onclick="addGoodsAttention(\''+goods.id+'\',this);" href="javascript:void(0);" class="btn-coll">关注</a>';
            html +='</div>';
            html +='</div>';
            html +='</li>';
        });
        return html;
    }

    $("#sortlist h3").bind("click",function(){
        var element=$(this).parent();
        if (element.hasClass("current")){
            element.removeClass("current");
        }else{
            element.addClass("current");
        }
    })

    /**
     * Desc:加入购物车操作
     * Auth:zhangqiang
     * Time:2016-01-30
     * Param:
     *       goodsId        商品ID
     *       cnt            加入购物车的商品数量
     *       ifCrossBorder  是否为跨境商品标识  1:是跨境商品  0:不是跨境商品
     */
    function addCart(goodsId, cnt,ifCrossBorder) {
        //是跨境商品时
        if(ifCrossBorder == '1'){
            var message = '';
            //是跨境商品 获取弹出提示信息
            $.ajax({
                type: 'post',
                async: false,
                url: '${base}/goods/ajaxGetSystemCrossMsg',
                success: function(data) {
                    if( data.status == 'success' ){
                        message = data.msg;
                    }else{
                    }
                }
            });
            //弹出提示信息
            layer.confirm(message, {icon: 7, title:'温馨提示'}, function(index){
                //判断此会员是否设置了身份证号
                if(ifMemberIDcode()) {
                    //设置了后执行加入购物车操作
                    window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
                }else{//未设置身份证时
                    //将此商品的ID存储下来，并弹出设置身份证号的DIV层
                    $("#crossBorderId").val(goodsId);
                    layer.open({
                        type: 1,
                        title:'设置会员本人身份证号',
                        area:["500px","210px"],
                        scrollbar:false,
                        content: $('#popupdiv') //这里content是一个DOM
                    });
                }
                layer.close(index);
            });
        }else{//不是跨境商品直接执行加入购物车操作
            window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
        }

    }

    /**
     * Desc:判断会员是否设置了身份证号
     * Auth:zhangqiang
     * Time:2016-01-30
     * Return:
     *        true  设置了身份证号
     *        false 没有设置
     */
    function ifMemberIDcode(){
        var flags = false;
        $.ajax({
            type: 'post',
            async: false,
            url: '${base}/member/getMemberIDcode',
            success: function(data) {
                if( data.status == 'success' ){
                    flags = true;
                }else if(data.status == 'error'){
                    flags = false;
                }else{//没有登录时页面跳到登录页
                    location.href = "${base}/member/login";
                    return;
                }
            }
        });
        return flags;
    }

    function addGoodsAttention(goodsId,item) {
        $.ajax({
            type: "get",
            url: "${base}/goods/addToGoodsAttention",
            data: "goodsId="+goodsId,
            success: function(data) {
                if(data.status=='success'){
                    layer.alert(data.message,{icon:1});
                    $(item).removeClass("btn-coll").addClass("showattention");
                    $(item).text('已关注');
                    $(item).attr("onclick", "");
                }else if(data.status=='warn'){
                    layer.alert(data.message,{icon:2});
                    $(item).removeClass("btn-coll").addClass("showattention");
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
     * 查询价格区间
     */
    function searchPriceArea() {
        var priS = $("#priS").val();
        var priE = $("#priE").val();

        var parentCatelogId = $("#getParentCatelogId").val();
        var catelogId = $("#getCatelogId").val();
        var brandFlag = $("#getBrandFlag").val();
        var orderByFlag = $("#getOrderByFlag").val();

        var srcUrl = "${base}/list/${grandCatelog.id}";
        if(parentCatelogId!="" && parentCatelogId!=null) {
            srcUrl += "-"+parentCatelogId;
        }
        if(catelogId!="" && catelogId!=null) {
            srcUrl +="-"+catelogId;
        }
        srcUrl += ".html?price=";
        if(priS) {
            srcUrl +="M" + priS;
        }
        if(priE) {
            srcUrl += "L" + priE;
        }
        srcUrl += "&page=1";
        if(brandFlag!="" && brandFlag!=null) {
            srcUrl += "&brand=" + brandFlag
        }
        if(orderByFlag!="" && orderByFlag!=null) {
            srcUrl += "&orderBy=" + orderByFlag;
        }

        window.location.href = srcUrl;
    }

    /**
     * Desc:跳转到登录页面
     * Auth:zhangqiang
     * Time:2016-01-30
     */
    function forward(){
        location.href = "${base}/member/login";
    }

    /**
     * Desc:保存身份证号
     * Auth:zhangqiang
     * Time:2016-01-30
     */
    function save_idcode(){
        //获取到身份证号
        var idcode = $("#idcode").val();

        //判断身份证号是否存在
        if(idcode == '' || idcode == null || idcode == "null" || idcode == undefined || idcode == "idcode"){
            $("#checkIdcodeId").text('身份证号不能为空!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }

        //判断身份证号长度是否符合要求 旧身份证号15位纯数字 二代身份证号18位 最后一位可能是字母X
        if(idcode.length > 18 || idcode.length < 15){
            $("#checkIdcodeId").text('身份证号长度范围15~18位!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }

        //正则表达式判断身份证号格式是否正确
        var re = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
        if (!re.test(idcode)) {
            $("#checkIdcodeId").text('身份证号格式错误!');
            $("#checkIdcodeId").removeClass('hide');
            return ;
        }

        $("#checkIdcodeId").addClass("hide");

        //验证身份证号是否已经存在
        $.ajax({
            type: "post",
            async: false,
            url: base+"member/username/check",
            data:{'userName':idcode,'property':'iDCode'},
            datatype: 'json',
            error: function () {

            },
            success: function(result) {
                if(result){
                    $("#checkIdcodeId").addClass("hide");
                    //保存身份证号
                    $.ajax({
                        type: "post",
                        async: false,
                        url: base+"member/saveMemberIDcode",
                        data:{'idcode':idcode},
                        datatype: 'json',
                        error: function () {

                        },
                        success: function(result) {
                            if(result.status == 'success'){
                                layer.closeAll();
                                window.location.href = "${base}/cart/add?gid=" + $("#crossBorderId").val() + "&cnt=" +1 + "&backurl=" + window.location.href
                            }else{
                                layer.alert('设置失败',{icon:2});
                            }
                        }
                    });
                }else{
                    $("#checkIdcodeId").text('身份证号已存在,请重新输入!');
                    $("#checkIdcodeId").removeClass('hide');
                }
            }
        });
    }

</script>
    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>
</#escape>