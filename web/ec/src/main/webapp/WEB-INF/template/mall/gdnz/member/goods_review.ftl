<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>商品评价</title>
    <meta name="description" content="商品评价">
    <meta name="Keywords" content="商品评价">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${base}/static/mall/gdnz/img/favicon.ico" rel="shortcut icon"/>
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <link href="${base}/static/mall/gdnz/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/mall/css/index.css" rel="stylesheet" type="text/css" media="all"/>
    <style>
        .breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
        .breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
        .breadcrumb span {font-family: "\5b8b\4f53"}
        .g-0{float:left;width:100%;}.c-3-5{margin-left:190px;}
        .mod-comm{/*padding:10px 20px 20px;*/ margin-left: 20px;}
        .mod-main{background:#fff;margin-bottom:10px; margin-top: 5px;}
        .extra-main .mt{padding-left:0;}
        .mod-comm .mt{padding:11px 0 11px 10px; border: 1px solid #E8E8E8; /*border-bottom: 2px solid #C30000;*/ background: #F5F5F5;}
        .mt,.smt{cursor:default;overflow:hidden;zoom:1;}
        .mod-comm .mt h3{font-size:12px;color:#333333;font-family:'\5b8b\4f53';line-height:18px;}
        .mod-main .mt h3{float:left;}
        .mod-main .mt .extra-l{float:left;}
        .ftx03,.ftx-03{color:#999;}
        .ml10{margin-left:10px;}
        .mt10{margin-top: 10px;}
        .mod-comm .mc{line-height:20px;}
        .mod-main .mc{overflow:visible; border:1px solid #E8E8E8;border-top:0;}
        .tb-void{line-height:18px;text-align:center; color:#333;width:98%; padding-top: 20px; margin-bottom: 10px; margin-left: 1%;}
        table{border-collapse:collapse;empty-cells:show;display:table;border-color:gray;border-spacing:2px;border-top:1px solid #E8E8E8;  border-left: 1px solid #E8E8E8;}
        colgroup{display:table-column-group;}
        thead{display:table-header-group;vertical-align:middle;border-color:inherit; border-bottom: 1px solid #E8E8E8;}
        tr{display:table-row;vertical-align:inherit;border-color:inherit;}
        .tb-void th{background:#f5f5f5;height:32px;line-height:32px;padding:0;font-weight:400; border-right: 1px solid #E8E8E8;}
        td,th{display:table-cell;vertical-align:inherit;}
        tbody{display:table-row-group;vertical-align:middle;border-color:inherit;}
        .tb-line td{border:0;border-bottom:1px solid #E8E8E8;  border-right: 1px solid #E8E8E8;}
        .tb-void td{padding:10px 5px;}
        .pro-info{display:block;/* width: 970px;*/}
        ol,ul{list-style:none;}
        ul,menu,dir{-webkit-margin-start:0px;-webkit-margin-end:0px;/*-webkit-padding-start:40px;*/}
        .pro-info:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
        .pro-info li.fore1{width:400px;/*margin-left:-45px;margin-top:-11px;*/}
        .pro-info li{float:left;vertical-align:middle;/*margin-left:10px;*//* margin-right:15px;*/}
        li{display:list-item;text-align:-webkit-match-parent;}
        .clearfix{display:block;}
        .clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
        .fl{float:left;}
        .p-img{padding:5px 0;}
        .p-img,.p-name,.p-price,.p-market,.p-detail{overflow:hidden;}
        .p-img a:link,.p-img a:visited{text-decoration:none;}
        .tb-void a{color:#005ea7;}
        a img{border:0;}
        img{vertical-align:middle;margin:0;padding:0;}
        .p-info .p-name{width:300px;overflow:hidden;margin-left:10px;height:3em;line-height:1.5em;margin-top:10px;text-align:left;}
        .p-name,.p-detail{word-break:break-all;word-wrap:break-word;}
        .pro-info li.fore3{width:134px;}
        .pro-info li.fore4{width:111px;}
        .pro-info li.fore5{width:130px;}
        .clr{display:block;overflow:hidden;clear:both;height:0;line-height:0;font-size:0;}
        .comment-box{background:#fcfffa;border:1px solid #d0e4c2;padding:10px 0 0 30px;margin:0 -6px 5px;text-align:left;position:relative;zoom:1;}
        .comment-box .box-t{position:absolute;right:64px;top:-11px;width:21px;height:12px;background:url(${base}/static/img/cicon.png) 0 0 no-repeat;}
        .form .item {
            display: block;
            margin-bottom: 10px;
            line-height: 30px;
            width: 705px;
            margin-left: 100px;
        }
        .form .item:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
        .form .item span.label{float:left;height:18px;line-height:18px;padding:6px 0;width:100px;text-align:right;}
        .label{font-size:12px;}.form em{color:#ea5313;}em{font-style:normal;}
        .form .item span.label{line-height:18px;text-align:right;}
        .comment-box .commstar{background-color:red;width:105px;height:20px;background:url(${base}/static/img/commstar.jpg) 0 -21px repeat-x;position:relative;margin-top:5px;display:inline-block;overflow:hidden;zoom:1;}
        .comment-box .commstar .star1{width:20%;z-index:9;}
        .comment-box .commstar a{cursor:pointer;position:absolute;top:0;left:0;display:inline-block;height:20px;}
        .comment-box .commstar .star2{width:40%;z-index:8;}.comment-box .commstar .star3{width:60%;z-index:7;}
        .comment-box .commstar a:hover,.comment-box .commstar .active{background:url(${base}/static/img/commstar.jpg) left top repeat-x;}
        .comment-box .commstar .star4{width:80%;z-index:6;}
        .comment-box .commstar .star5{width:100%;z-index:5;}
        .form input{float:left;font-size:12px;}
        .comment-box .msg-error-01{border:1px solid #FFBDBE;background:#FFEBEB;color:#ea5313;float:left;line-height:24px;padding:2px 6px;}
        .comment-box .hide{display:none;}.form .item:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
        .comment-box .cont {
            float: left;
            width: 602px;
            line-height: 1.7;
            font-size: 13px;
            color: #999;
            word-wrap: break-word;
        }
        .comment-box .area01{color:#ccc;}.comment-box .area{width:590px;height:88px;}
        .form .area{line-height:18px;border:1px solid #ccc;padding:5px;float:none;}.form textarea{font-size:12px;}textarea{font-family:monospace;-webkit-appearance:textarea;background-color:white;-webkit-rtl-ordering:logical;-webkit-user-select:text;flex-direction:column;resize:auto;cursor:auto;white-space:pre-wrap;word-wrap:break-word;margin:0em;font:-webkit-small-control;letter-spacing:normal;word-spacing:normal;text-transform:none;text-indent:0px;text-shadow:none;display:inline-block;text-align:start;-webkit-writing-mode:horizontal-tb;}.comment-box .msg-text{float:right;}.btn-5:link{color:#323333;text-decoration:none;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5fbef',endColorstr='#eaf6e2',GradientType='0');-ms-filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5fbef',endColorstr='#eaf6e2');background-image:linear-gradient(to top,#f5fbef 0,#eaf6e2 100%);-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;display:inline-block;height:18px;line-height:18px;border:1px solid #bfd6af;padding:2px 14px 3px;}.mr20{margin-right:20px;}.c-0{margin-left:-100%;}.g-3-5{float:left;width:130px;}#menu{-moz-border-radius:5px,5px,5px,5px;background-color:#fff;padding:15px 5px 15px 10px;width:115px;margin-bottom:10px;}#menu h3{font-family:"microsoft yahei";font-size:16px;margin-bottom:8px;color:#333;}#menu dl{line-height:24px;}#menu dl dt{padding-left:20px;height:24px;padding-bottom:2px;}#menu dl dt a.curr{color:#ea5313;font-weight:700;}#menu dl dt a{display:inline-block;vertical-align:middle;}
        /*分页*/
        .pagin a,.pagin span{float:left;height:20px;padding:3px 10px;border:1px solid #ccc;margin-left:2px;font-family:arial;line-height:20px;font-size:14px;overflow:hidden;-moz-border-radius:5px;-webkit-border-radius:5px;}.pagin .text,.pagin .current{border:0;padding:4px 11px;}.pagin a:link,.pagin a:visited{color:#005aa0;}.pagin a:hover,.pagin a:active{background:#005aa0;color:#fff;text-decoration:none;}.pagin .current,.pagin .current:link,.pagin .current:visited{color:#f60;font-weight:700;}.pagin b{display:block;position:absolute;top:9px;width:5px;height:9px;background-image:url(${base}/static/mall/img/bg5.gif);background-repeat:no-repeat;overflow:hidden;}.pagin .prev,.pagin .next,.pagin .prev-disabled,.pagin .next-disabled{position:relative;padding-top:5px;height:18px;line-height:18px;}.pagin .prev-disabled,.pagin .next-disabled{color:#ccc;cursor:default;}.pagin .prev,.pagin .prev-disabled{padding-left:12px;}.pagin .prev b{left:3px;background-position:-68px -608px;}.pagin .prev-disabled b{left:3px;background-position:-80px -608px;}.pagin .next,.pagin .next-disabled{padding-right:12px;}.pagin .next b{right:3px;background-position:-62px -608px;}.pagin .next-disabled b{right:3px;background-position:-74px -608px;}.pagin-m a,.pagin-m span{height:14px;line-height:14px;font-size:12px;}.pagin-m b{top:5px;}.pagin-m .prev,.pagin-m .next,.pagin-m .prev-disabled,.pagin-m .next-disabled{padding-top:3px;height:14px;line-height:14px;*line-height:16px;}
        #left {
            float: left;
            width: 195px;
            margin-right: 10px;
        }
        @media screen and (-webkit-min-device-pixel-ratio:0){
            .pro-info li {
                float: left;
                vertical-align: middle;
                margin: 0;
                /*margin-left: 17px;*/
            }
        }

        .pj_style{border: 1px dashed #cae1b8; background: #f7fdf3;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px; margin-bottom: 15px; padding: 15px 0 10px 0;}
        .pj_text1{font-size: 14px;font-weight:bold;}
        .form .item span.pj_text{padding-top: 1px!important;font-size: 14px;font-weight:bold; color: #84cf49;}
        .pj_even_style{
            background: #fff5ee;
            border: 1px dashed #ffd3b5;
            color: #ff7a1f;
        }
        .pj_even_style span.pj_text{
            color: #ff7a1f !important;
        }
    </style>
</head>
<body>
<#include "mall/gdnz/shortcut.ftl"/>
<#include "mall/gdnz/header.ftl"/>
<div class="content">
    <div class="breadcrumb" style="padding-left: 0">
<#--
        <strong><a href="${base}/order/list">消息中心</a></strong><span>&nbsp;&gt;&nbsp;评价<span></span></span>
-->
    <strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;我的评价<span></span></span>
    </div>

    <div class="g-0">
        <div id="content" class="c-3-5">
            <div class="mod-main mod-comm extra-main" id="evalu01">
                <div class="mt">
                    <h3>商品评价</h3>
                <#--<#if 1 <= reviewed>-->
                    <div class="extra-l ftx03 ml10">
                        <span id="tip-num">(本页还有<span class="num-comment"><#if reviewed??>${reviewed}<#else>0</#if></span>个待评价)</span>
                    </div>
                <#--</#if>-->
                </div>
                <div class="mc">
                    <div class="tb-void tb-line">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <colgroup>
                                <col>
                                <col>
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th width="250" align="center">订单编号</th>
                                <th width="400" align="center">商品信息</th>
                                <th width="190" align="center">购买时间</th>
                                <th  align="center">评价</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list orderItemList as item>
                            <tr>
                                <td colspan="4">
                                    <ul class="pro-info" oid="1743395318">
                                        <li class="fore5" style="text-align: center; width: 250px;">
                                            <#--Desc:应该到商品详情页面 Auth:zhangqiang Time:2015-11-11 17:15:35 Start -->
                                            <#--<a href="${base}/order/review.html?sn=${item.orderSn}">${item.orderSn}-->
                                                <a href="${base}/order/view/${item.orderSn}.html">${item.orderSn}</a>
                                            <#--</a>-->
                                            <#--Desc:应该到商品详情页面 Auth:zhangqiang Time:2015-11-11 17:15:35 End -->
                                        </li>
                                        <li class="fore1" style="width: 400px;">
                                            <div class="p-info clearfix">
                                                <div class="p-img fl">
                                                    <a target="_blank" href="${base}/item/${item.goodsId}.html">
                                                        <img width="50" height="50" title="${item.goodsName}" data-img="1" src="<#if item.pic??>${item.pic}</#if>" class="err-product">
                                                    </a>
                                                </div>
                                                <div class="p-name fl">
                                                    <a target="_blank" href="${base}/item/${item.goodsId}.html">${item.goodsName}</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="fore2" style="text-align: center; width: 190px;"><span class="ftx03">${item.createDate?string('yyyy-MM-dd')}</span></li>
                                        <li class="forem" style="text-align: center; width: 120px;">
                                            <#if '${item.isReview}'=='1'>
                                                <span  class="pj" id="fbpj_${item.id}" alt="${item.id}" goodsId="${item.goodsId}" orderSn="${item.orderSn}" title="查看/追加评论" style="cursor: pointer;color: #005ea7">查看评论/回复<b class="hasReview"></b></span>
                                                <#if item.unreadReviewCount gt 0><span id="fbpj_${item.id}_units"  style="color:white;background-color: red;padding: 1px 5px; text-align: center;width: 15px;height: 15px;line-height: 15px;border-radius: 45%;">${item.unreadReviewCount}</span></#if>
                                            <#elseif '${item.isReview}'=='0'>
                                                <span  class="pj" id="fbpj_${item.id}" alt="${item.id}" title="发表评价" style="cursor: pointer;color: #005ea7">发表评价<b class="notReview"></b></span>
                                            </#if>
                                        </li>
                                    </ul>
                                    <div class="clr"></div>
                                    <#if '${item.isReview}'=='0'>
                                        <div class="comment-box hide" id="${item.id}">
                                            <div class="box-t"></div>
                                            <div class="form" tagflag="true" isconspros="0" pid="1131836">
                                                <div class="item">
                                                    <span class="label">评分：</span>
                                                    <div class="fl">
                                                                <span class="commstar">
                                                                    <a href="javascript:void(0);" class="star1" _val="1" goodsId="${item.id}"></a>
                                                                    <a href="javascript:void(0);" class="star2" _val="2" goodsId="${item.id}"></a>
                                                                    <a href="javascript:void(0);" class="star3" _val="3" goodsId="${item.id}"></a>
                                                                    <a href="javascript:void(0);" class="star4" _val="4" goodsId="${item.id}"></a>
                                                                    <a href="javascript:void(0);" class="star5 active" _val="5" goodsId="${item.id}"></a>
                                                                <#--Desc:默认选中五个星 Auth:zhangqiang Time:2015-12-04 16:11:35 Start-->
                                                                </span>
                                                        <input type="hidden" name="commentStar" value="5" id="commentStar_${item.id}">
                                                    <#--Desc:默认选中五个星 Auth:zhangqiang Time:2015-12-04 16:11:35 End-->
                                                        <div class="clr"></div>
                                                    </div>
                                                    <#--<span class="msg-error-01 ml10 hide">你的评分是偶们前进的动力</span>-->
                                                    <div class="clr"></div>
                                                </div>
                                                <div class="item item01"><span class="label">心得：</span>
                                                    <div class="cont">
                                                        <textarea name="" class="area" id="pj_${item.id}"></textarea>
                                                        <div class="clr"></div>
                                                        <#--<span class="msg-error-01 hide">您还没有填写心得呦！</span>-->
                                                        <div class="msg-text">1-500字</div>
                                                    </div>
                                                    <div class="clr"></div>
                                                </div>
                                                <div class="item item02">
                                                    <span class="label">&nbsp;</span>
                                                    <div class="fl">
                                                        <a href="javascript:void(0)" class="btn btn-5 mr20" id="btnDoReview" onclick="doReview('${item.goodsId}','${item.orderSn}','${item.id}')"><s></s><span>评价并继续</span></a>
                                                        <div class="msg-text"></div>
                                                    </div>
                                                    <div class="clr"></div>
                                                </div>
                                            </div>
                                        </div>
                                    <#elseif '${item.isReview}'=='1'>
                                        <div class="comment-box hide" id="${item.id}">

                                        </div>
                                    </#if>
                                </td>
                            </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                    <div class="mt10 clearfix">
                        <div class="pagin pagin-m fr"></div>
                    </div>
                </div>
                <#-- 分页条 -->
                <div class="m clearfix">
                    <div class="pagin fr">
                    <#if pager?? && pager.list?size &gt; 0>
                        <#import "mall/gdnz/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/order/review.html" />
                    </#if>
		            <#if !pager?? || pager.list?size = 0>
                        <div class="noRecord">你还没有订单！</div>
                    </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="left" class="g-3-5 c-0" style="margin-top: 5px">
        <#--<div id="menu"><h3>评价相关</h3>
            <dl class="fore1">
                <dt><a id="_MYJD_comments" href="" class="curr">我要评价</a></dt>
            </dl>
        </div>-->
        <#import "mall/gdnz/member/menu.ftl" as memu>
		<@memu.menu id="wdpj"/>
    </div>
</div>
<#include "mall/gdnz/service.ftl"/>
<#include "mall/gdnz/footer.ftl"/>
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
<script src="${base}/static/mall/js/layer.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.pj:has(.notReview)').bind('click', showOrHideReviewText);
        $('.pj:has(.hasReview)').bind('click', showOrHideReviewHisText);
        $('.commstar a').bind('click', activeStar);
        $('.cont textarea').bind('keyup', countCommentLenght);

        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });

    });

    /**
     * 控制评价框显示/隐藏效果
     */
    function showOrHideReviewText() {
        var commentBoxId = $(this).attr('alt');
        var commentBox = $("#" + commentBoxId + "");
        commentBox.fadeToggle('fast', 'linear');
        // 隐藏其它商品的评价框
        commentBox.parent().parent().siblings().children('td').children('.comment-box').fadeOut('fast', 'linear');
    }
    /**
     * 控制评价框显示/隐藏效果
     */
    function showOrHideReviewHisText() {
        var commentBoxId = $(this).attr('alt');
        var goodsId = $(this).attr('goodsId');
        var orderSn = $(this).attr('orderSn');
        var commentBox = $("#" + commentBoxId + "");

        if ($(this).attr('isOpen')) {
            $(this).removeAttr('isOpen');
            commentBox.fadeToggle('fast', 'linear');
            // 隐藏其它商品的评价框
            commentBox.parent().parent().siblings().children('td').children('.comment-box').fadeOut('fast', 'linear');
        } else{
            $(this).attr('isOpen','true');
            $.ajax({
                type: 'post',
                url: '${base}/goods/getGoodsReviewList/' + goodsId + ".html?orderSn=" + orderSn,
                success: function (data) {
                    if (data.length > 0) {
//                        console.log(data);
                        var html = '<div class="box-t"></div>';
                        var replay = '';
                        $.each(data, function (i, review) {
                            html += '<div class="form" tagflag="true" isconspros="0" pid="1131836">';
                            html += '<div class="item">';
                            html += '<span class="label pj_text1">评分：</span>';
                            html += '<div class="fl"><b style="color: #e52c32; padding-right: 3px; font-size: 14px;">';
                            html += parseInt(review.score);
                            html += '</b>分</div>';
                            html += '</div>';
                            html += '<div class="item item01"><span class="label  pj_text" >内容：</span>';
                            html += '<div class="cont">';
                            html += review.content;
                            html += '</div><div class="clr"></div></div>';
                            html += '<div class="item item01"><span class="label  pj_text" >评论时间：</span>';
                            html += '<div class="cont">';
                            html += new Date(review.createDate).Format("yyyy-MM-dd hh:mm");
                            html += '</div><div class="clr"></div></div>';
                            html += '</div>';
                            if (review.maps != 'undefined' && review.maps != undefined && review.maps != '') {
                                $.each(review.maps, function (i, item) {
                                    if (item != "" && item != undefined) {
                                        replay += '<div class="item item01 pj_style';
                                        if( i % 2 == 1 ){
                                            replay += ' pj_even_style';
                                        }
                                        replay += '" ><div class="repply_text"><span class="label pj_text">';
                                        if (item.whichSys == 'EC') {
                                            replay += '追加评论';
                                        } else if (item.whichSys == 'MCM') {
                                            replay += '商家回复';
                                        } else if (item.whichSys == 'ECM') {
                                            replay += '商城回复';
                                        }
                                        replay += '：</span><div class="cont">';
                                        replay += item.replyContent;
                                        replay += '</div></div>';
                                        replay += '<div class="clr"></div>';

                                        replay += '<div  class="repply_date">';
                                        replay += '<span class="label pj_text">';
                                        if (item.whichSys == 'EC') {
                                            replay += '追加时间';
                                        } else if (item.whichSys == 'MCM') {
                                            replay += '回复时间';
                                        } else if (item.whichSys == 'ECM') {
                                            replay += '回复时间';
                                        }
                                        replay += '：</span><div class="cont">';
                                        replay += new Date(review.createDate).Format("yyyy-MM-dd hh:mm");
                                        replay += '</div></div>';

                                        replay += '</div>';
                                    }
                                });
                            }

                        });
                        html += '<div class="box-t"></div><div class="form" tagflag="true" isconspros="0" pid="1131836">';
                        html += replay;


                        //huifu
                        html += '<div class="item item01"><span class="label pj_text" style="padding-top: 0;font-size: 14px;font-weight:bold;">再次评论：</span>';
                        html += '<div class="cont">';
                        html += '<textarea name="" class="area" id="pj_' + commentBoxId + '"></textarea>';
                        html += '<div class="fl">';
                        html += '<a href="javascript:void(0)" class="btn btn-5 mr20" ';
                        html += ' onclick="doReviewAgin(\'' + goodsId + '\',\'' + orderSn + '\',\'' + commentBoxId + '\')"><span>保存评价</span></a>';
                        html += '<div class="msg-text"></div></div><div class="msg-text">1-500字</div></div></div>';
                        html += '</div>';

                        commentBox.html(html);

                        commentBox.fadeToggle('fast', 'linear');
                        // 隐藏其它商品的评价框
                        commentBox.parent().parent().siblings().children('td').children('.comment-box').fadeOut('fast', 'linear');
                    }
                }
            });

            //更新只读状态
            $.ajax({
                type:"post",
                url: '${base}/order/updateReview/' + orderSn + '/' + goodsId + ".html",
                success: function (data) {
                    //do noting;
//                    console.log(data);
                    $("#fbpj_"+commentBoxId+"_units").hide();
                }
            });
        }
    }

    /**
     * 设置评分组件的值和显示效果
     */
    function activeStar() {
        $(this).addClass('active');
        $(this).siblings().removeClass('active');
        /*alert($(this).attr('_val'));*/
        $('#commentStar_'+$(this).attr("goodsId")).val($(this).attr('_val'));
        /*alert($(this).attr('_val')+"<===>"+$("input[name='commentStar']").val());*/
    }

    /**
     * 计算输入评价字数
     */
    function countCommentLenght() {
        if ($(this).val().length < 1 || $(this).val().length > 500) {
            $('.cont span').removeClass('hide');
        } else {
            $('.cont span').addClass('hide');
        }
    }

    /**
     * 提交评价
     */
    function doReview(goodsId,orderSn,orderItemId) {
        var cont = $('#pj_' + orderItemId + '').val();
        if(cont.length > 500 || cont.length < 1){
            layer.alert('评价字数范围在1~500之间!', {icon: 2, title: '温馨提示'});
        }else{
            var _data = {
                orderSn:orderSn,
//                score: $('#commentStar_'+orderItemId).val(),
                score: $("input[name='commentStar']").val(),
                content: $('#pj_' + orderItemId + '').val(),
                orderItemId:orderItemId
            };
            var data = encodeURIComponent(JSON.stringify(_data));
            $.ajax({
                type: 'post',
                url: '${base}/order/doReview/' + goodsId + '.html',
                data: {review: data},
                success: function (data) {
                    if (data.status = 'success') {
                        location.href = '${base}/order/review.html'
                    }
                }
            });
        }
    }

    /**
     * 提交评价
     */
    function doReviewAgin(goodsId,orderSn,orderItemId) {
        var cont = $('#pj_' + orderItemId + '').val();
        if(cont.length > 500 || cont.length < 1){
            layer.alert('评价字数范围在1~500之间!', {icon: 2, title: '温馨提示'});
        }else{
            $.ajax({
                type: 'post',
                url: '${base}/order/appendReview/' + orderSn + '/' + goodsId + '.html',
                data: {review: cont},
                success: function (data) {
                    if (data.status = 'success') {
                        location.href = '${base}/order/review.html'
                    }
                }
            });
        }
    }
</script>