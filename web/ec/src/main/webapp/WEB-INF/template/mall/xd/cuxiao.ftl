<!DOCTYPE html>
<html>
<head>
    <title>${keyword}促销 --- <@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>,${keyword}">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>,${keyword}">
    <link href="${base}/static/mall/xd/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/mall/xd/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/mall/css/index.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">window.pageConfig={compatible:true,navId:"search"};</script>
</head>
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
        font-weight: 700;
        line-height: 20px;
        font-size: 18px;
        font-family: "microsoft yahei";
    }
    .m, .sm {
        margin-bottom: 10px;
        padding-bottom: 5px;
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
        width: 990px;
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
        height: 30px;
        padding: 0 10px;
        border: 1px solid #ddd;
        border-bottom: none;
        background: #F7F7F7;
        line-height: 30px;
    }
    #select .mt h1 {
        float: left;
        height: 30px;
        font: normal 15px/30px \5fae\8f6f\96c5\9ed1;
        color: #E4393C;
    }
    #select .mt h1 strong {
        margin-right: 10px;
        font: normal 15px/30px \5fae\8f6f\96c5\9ed1;
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
        width: 140px;
        height: 20px;
        margin-right: 15px;
        padding-top: 5px;
    }
    .selected-c .a-values, .prop-attrs .a-values, .color-attr .a-values, .brand-attr .a-values {
        position: relative;
        overflow: hidden;
        padding-right: 120px;
    }
    .brand-attr .tabcon div {
        float: left;
        overflow: hidden;
        width: 140px;
        height: 20px;
        margin-right: 15px;
        padding-top: 5px;
    }
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
        width: 548px;
        height: 20px;
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
        padding: 0 3px 0 10px;
        float: left;
    }
    a:hover {
        color: #E4393C;
        text-decoration: underline;
    }
    #filter .order .curr {
        font-weight: bold;
    }
    #filter .order dd {
        line-height: 24px;
        zoom: 1;
    }
    #filter .order .curr {
        border: 1px solid #E4393C;
        background: #E4393C;
        font-weight: bold;
    }
    #filter .order dd {
        height: 24px;
        border: 1px solid #CECBCE;
        background-position: 0 -73px;
        background-repeat: repeat-x;
        background-color: #fff;
        margin-right: 5px;
        line-height: 24px;
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
        color: #666;
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
    .p-img{width: 220px; height: 220px; border: 1px solid #CCCCCC; margin-top: 10px; margin-bottom: 10px;}
    .list-h{margin-left: 5px; margin-top: 10px; margin-bottom: 20px;}
    #plist.ordinary-prebuy .list-h li {
        position: relative;
        /* width: 247px;*/
        height: 100%;
        /* padding: 0;
         padding-bottom: 30px;*/
    }
    #plist li {
        width: 220px;
        /* margin-left: 10px;*/
        text-align: left;
        font-family: "microsoft yahei",arial,\5b8b\4f53;
        padding: 10px;
        padding-top: 0;
    }
    #plist li:hover{
        -webkit-box-shadow:0 0 10px rgba(203, 203, 203, .5);
        -moz-box-shadow:0 0 10px rgba(203, 203, 203, .5);
        box-shadow:0 0 10px rgba(203, 203, 203, .5);

    }
    .list-h li, .list-h dl {
        float: left;
    }
    .left {
        float: left;
        width: 210px;
        margin-right: 10px;
        margin-top: 10px;
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
    <#--右側上部頁碼-->
    #filter .order a {
        display: block;
        padding: 0 3px 0 10px;
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
        padding-top: 3px;
        height: 14px;
        line-height: 14px;
    }
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
</style>
<style>
    .crumbs-bar {
        position: relative;
        margin-bottom: 5px;
        z-index: 5;
    }
    .fg-line {
        position: relative;
        line-height: 28px;
        width: auto;
        height: auto;
        zoom: 1;
    }
    .fg-line-key {
        width: 60px;
        color: #999;
    }
    .fg-line-value {
        margin-left: 5px;
    }
    .fg-line-value a {
        color: #005aa0;
    }
    .fg-line-value b {
        font-weight: 400;
        margin: 0 10px;
        color: #ddd;
    }
    .selector {
        border-top: 1px solid #DDD;
        background: #FFF;
        margin-bottom: 10px;
    }
    .selector .s-title {
        border-bottom: 1px solid #DDD;
        background: #F1F1F1;
        line-height: 34px;
        height: 34px;
        overflow: hidden;
        zoom: 1;
    }
    .selector .s-title h3 {
        float: left;
        padding-left: 10px;
        font-size: 14px;
    }
    .selector .s-title h3 b {
        color: #e4393c;
        margin-right: 5px;
        font-size: 14px;
    }
    .selector .s-title .st-ext {
        float: left;
        padding-left: 20px;
    }
    .selector .sl-wrap {
        position: relative;
        _zoom: 1;
        line-height: 34px;
        border-bottom: 1px solid #DDD;
    }
    .selector .sl-key {
        float: left;
        width: 100px;
        padding-left: 10px;
    }
    .selector .sl-value {
        margin-left: 110px;
        padding-right: 130px;
        padding-left: 10px;
        overflow: hidden;
        zoom: 1;
    }
    .selector .sl-v-list {
        overflow: hidden;
        zoom: 1;
        padding-top: 4px;
    }
    .selector .sl-v-list ul {
        float: left;
        overflow: hidden;
        zoom: 1;
        position: relative;
        height: 30px;
    }
    .selector .s-brand .sl-v-list li {
        float: left;
        width: 130px;
        margin-right: 5px;
        margin-bottom: 4px;
        height: 26px;
        line-height: 26px;
    }
    .selector .s-brand .sl-v-list li a {
        width: 130px;
        display: inline-block;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .selector .sl-v-list li a {
        float: left;
        white-space: nowrap;
        zoom: 1;
        color: #005aa0;
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
        background: url(${base}/static/mall/xd/img/search.ele.png) no-repeat 0 -273px;
    }
    #plist .btn-buy-new{float:left;height:28px; padding-left:35px;border: 1px solid #E8E8E8; padding-right: 15px;  position: relative; /*border-radius:2px;*/margin:0 4px 0 0;/*background:#F7F7F7;*/line-height:28px;text-align:center;text-decoration:none;color: #b2b2b2;}
    #plist .btn-buy-new i{
        position: absolute;
        display: block;
        font-style: normal;
        left:10px;
        top:7px;
        width: 18px;
        height: 18px;
        background: url(${base}/static/mall/xd/img/search.ele.png) no-repeat 0 -247px;
    }
    #plist .btn-coll{float:left;height:28px;padding-left:35px;border:1px solid #E8E8E8;background: url(${base}/static/mall/xd/img/search.ele.png) no-repeat 10px -407px; padding-right: 15px;  position: relative; /*border-radius:2px;*/margin:0 4px 0 0;/*background:#F7F7F7;*/line-height:28px;text-align:center;text-decoration:none;color:#b2b2b2;}
    #plist .btn-coll:hover{border: 1px solid #DB0000; color: #c00000; /*text-decoration: underline;*/ background: url(${base}/static/mall/xd/img/search.ele.png) no-repeat 10px -430px;}
    #plist .btn-compare{float:left;height:19px;padding:0 9px;border:1px solid #ddd;border-radius:2px;margin:0 4px 0 0;line-height:18px;text-align:center;text-decoration:none;color:#333;background:-moz-linear-gradient(top,#f7f7f7,#f2f2f2);background:-webkit-gradient(linear,0 0,0 100%,from(#f7f7f7),to(#f2f2f2));filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#f7f7f7",endColorstr="#f2f2f2");-ms-filter:"progid:DXImageTransform.Microsoft.gradient(startColorstr="#f7f7f7",endColorstr="#f2f2f2")";}
    .showattention{ padding-top:7px; padding-bottom:7px; color: #DB0000 !important; padding-left:35px; padding-right: 15px; border: 1px solid #DB0000; /*text-decoration: underline;*/ background: url(${base}/static/mall/xd/img/search.ele.png) no-repeat 10px -430px;}
    .searchTip {
        border: 1px solid #f7eae7;
    }

    .searchTip .searchTipContent {
        padding-left: 30px;
    }

    .searchTip .searchTipContent h2 {
        color: #333;
        font-size: 14px;
        font-weight: 700;
        line-height: 38px;
    }
    .searchTip .searchTipContent h2 {
        line-height: 36px;
    }

    #searchTipSugg {
        list-style: outside none none;
    }
    #searchTipSugg li {
        width: auto;
        list-style: inside none decimal;
        margin-bottom: 5px;
    }
    #filter .order .arrow_write_bottom{background: #DB0000; border: none; }
    #filter .order .arrow_write_bottom a{color: #ffffff;}
    #filter .order .curr b{background: url("${base}/static/img/top_arrow_write.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
    #filter .order .arrow_write_bottom b{background: url("${base}/static/img/bot_arrow_write.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
    #filter .arrow b{background: url("${base}/static/img/top_arrow.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}
    #filter .arrow_bottom b{background: url("${base}/static/img/bot_arrow.png") no-repeat; width: 11px; height: 11px; float: left; margin-top:7px; margin-right: 10px;}

</style>
<body>
<#include "mall/xd/shortcut.ftl"/>
<#include "mall/xd/header.ftl"/>
<!-- 面包屑 -->
<div class="content">
    <div style="width: 100%; height: 30px; line-height: 30px; padding: 10px 0; font-size: 20px; font-weight: bold; text-align: center;">${promotions.pName}</div>
<#if flag == true>
    <div id="plist" class="m plist-n7a ordinary-prebuy">
        <ul id="cxinfo" class="list-h">
            <#list pager.getList() as gl>
                <li>
                    <div class="lh-wrap">
                        <div class="p-img">
                            <a target="_blank" href="${base}/item/${gl.id}.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}">
                                <img width="220" height="220" alt="${gl.name}" data-img="1" class="err-product" src="${gl.pic}@220w_220h.png" title="${gl.name}"></a>
                        </div>
                        <div class="p-name">
                            <a target="_blank" href="${base}/item/${gl.id}.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}" title="${gl.name}">${gl.name}</a>
                        </div>
                        <div class="p-price">
                            <#if promotions.isOpen == "start">
                               <strong>活动价：￥${gl.promotionsPrice?string(',##0.00')}</strong>
                               <span style="float: right; text-decoration: line-through;">原价:￥${gl.goodsPrice?string(',##0.00')}</span></div>
                            <#else >
                                <strong>商城价：￥${gl.price}</strong>
                               <span style="float: right; text-decoration: line-through;">市场价：￥${gl.goodsPrice?string(',##0.00')}</span></div>
                            </#if>
                        </div>
                        <!--增加商品销量 Auth:zhangqiang Time:2015-09-28 14:46:35 Start -->
                        <div class="extra">
                            <strong>销量&nbsp;
                                <#if gl.sales != '' && gl.sales &gt; 0>
                                    <#if gl.sales?index_of('.') &gt; 0>
                                    ${gl.sales?substring(0,gl.sales?index_of('.') )}
                                    <#else>
                                    ${gl.sales}
                                    </#if>
                                <#else>
                                    0
                                </#if>
                            </strong>
                            <div>
                                <div class="extra">
                                    <span class="evaluate"><a target="_blank" href="${base}/item/${gl.id}.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}">已有<#if gl.scoreCount != '' && gl.scoreCount &gt; 0>${gl.scoreCount}<#else>0</#if>人评价</a></span>
                                </div>
                                <div class="btns">
                                    <a stock="1010626351" tpl="1" onclick="addCart('${gl.id}','1');" href="javascript:void(0);" class="btn-buy"><i></i>加入购物车</a>
                                    <a id="coll1010626351" onclick="addGoodsAttention('${gl.id}',this);" href="javascript:void(0);" class="btn-coll">关注</a>
                                </div>
                            </div>
                </li>
            </#list>
        </ul>
    </div>
    <div id="tip_notice" style="margin-left: 560px;color: red;"><#if pager.pageCount &gt; 0 && pager.pageCount != pager.pageNumber>滚动鼠标滚轮加载更多...<#else>没有了...</#if></div>
    <#else>
        <div style="text-align: center;color: #e12f45;height: 500px;">
        ${message}
        </div>
    </#if>
</div>

<#include "mall/xd/service.ftl"/>
<#include "mall/xd/footer.ftl"/>
</body>
</html>
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
<script type="text/javascript">
    var pagecount= ${pager.pageCount};
    var page= ${pager.pageNumber};
    var pagesize = ${pager.pageSize};
    var promotionsId = "${promotions.id}";
    var isload = false;
    $(window).scroll( function() {
        totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop()) + 500;     //浏览器的高度加上滚动条的高度,减去底部高度
        if ($(document).height() <= totalheight)     //当文档的高度小于或者等于总的高度的时候，开始动态加载数据
        {
            //加载数据
            loadGoods();
        }
    });

    //显示加载更多
    function loadGoods(){
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
                    //判断是否加载完
                    if( parseInt(result.pager.pageNumber) >= parseInt(result.pager.pageCount)) {
                        flag = false;
                        $("#tip_notice").text('没有了...');
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
            html +='<div class="p-img"><a target="_blank" href="${base}/item/'+goods.id+'.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}"><img width="220" height="220" alt="'+goods.fullName+'" data-img="1" class="err-product" src="'+goods.pic+'@220w_220h.png" title="'+goods.fullName+'"></a></div>';
            html +='<div class="p-name"><a target="_blank" href="${base}/item/'+goods.id+'.html?isOpen=${promotions.isOpen}&promotionsId=${promotions.id}" title="'+goods.fullName+'">'+goods.fullName+'<font style="color: #ff0000;" name="'+goods.id+'" class="adwords"></font></a></div>';
            html +='<div class="p-price f-cb">';
        <#if promotions.isOpen == "start">
            html +='<strong>活动价：￥'+goods.promotionsPrice.toFixed(2)+'</strong>';
            html +='<span style="float: right; text-decoration: line-through;">原价：￥'+goods.goodsPrice.toFixed(2)+'</span></div>';
        <#else >
            html +='<strong>商城价：￥'+goods.price.toFixed(2)+'</strong>';
            html +='<span style="float: right; text-decoration: line-through;">市场价：￥'+goods.goodsPrice.toFixed(2)+'</span></div>';
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
    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
    }

    function highlight(key) {
        var html=$("#plist").html();
        var key = key.split('|');
        for (var i=0; i<key.length; i++) {
            var content = html.replace(key[i],"<font style='color:red'>" + key[i]+ "</font>");
        }
        $("#plist").html(content);
    }
    function addCart(goodsId, cnt) {
        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
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
</script>