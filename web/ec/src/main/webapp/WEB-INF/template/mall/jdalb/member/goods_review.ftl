<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>商品评价</title>
    <meta name="description" content="商品评价">
    <meta name="Keywords" content="商品评价">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${base}/static/mall/jd/img/favicon.ico" rel="shortcut icon"/>
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/mall/css/index.css" rel="stylesheet" type="text/css" media="all"/>
    <style>
        .breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
        .breadcrumb strong,.breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}
        .breadcrumb span {font-family: "\5b8b\4f53"}
        .g-0{float:left;width:100%;}.c-3-5{margin-left:140px;}.mod-comm{padding:10px 20px 20px;}.mod-main{background:#fff;margin-bottom:10px;}.extra-main .mt{padding-left:0;}.mod-comm .mt{padding:10px 0;}.mt,.smt{cursor:default;overflow:hidden;zoom:1;}.mod-comm .mt h3{font-size:12px;color:#666;font-family:'\5b8b\4f53';line-height:18px;}.mod-main .mt h3{float:left;}.mod-main .mt .extra-l{float:left;}.ftx03,.ftx-03{color:#999;}.ml10{margin-left:10px;}.mod-comm .mc{line-height:20px;}.mod-main .mc{overflow:visible;}.tb-void{line-height:18px;text-align:center;border:1px solid #f2f2f2;border-top:0;color:#333;width:100%;}table{border-collapse:collapse;empty-cells:show;display:table;border-color:gray;border-spacing:2px;}colgroup{display:table-column-group;}thead{display:table-header-group;vertical-align:middle;border-color:inherit;}tr{display:table-row;vertical-align:inherit;border-color:inherit;}.tb-void th{background:#f5f5f5;height:32px;line-height:32px;padding:0 5px;text-align:center;font-weight:400;}td,th{display:table-cell;vertical-align:inherit;}tbody{display:table-row-group;vertical-align:middle;border-color:inherit;}.tb-line td{border:0;border-bottom:1px solid #f2f2f2;}.tb-void td{padding:10px 5px;}.pro-info{display:block;}ol,ul{list-style:none;}ul,menu,dir{-webkit-margin-start:0px;-webkit-margin-end:0px;-webkit-padding-start:40px;}.pro-info:after{content:".";display:block;height:0;clear:both;visibility:hidden;}.pro-info li.fore1{width:425px;margin-left:-45px;margin-top:-11px;}.pro-info li{float:left;vertical-align:middle;margin:0;margin-left:122px;}li{display:list-item;text-align:-webkit-match-parent;}.clearfix{display:block;}.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden;}.fl{float:left;}.p-img{padding:5px 0;}.p-img,.p-name,.p-price,.p-market,.p-detail{overflow:hidden;}.p-img a:link,.p-img a:visited{text-decoration:none;}.tb-void a{color:#005ea7;}a img{border:0;}img{vertical-align:middle;margin:0;padding:0;}.p-info .p-name{width:330px;overflow:hidden;margin-left:10px;height:3em;line-height:1.5em;margin-top:10px;text-align:left;}.p-name,.p-detail{word-break:break-all;word-wrap:break-word;}.pro-info li.fore3{width:134px;margin-left:57px;}.pro-info li.fore4{width:111px;}.clr{display:block;overflow:hidden;clear:both;height:0;line-height:0;font-size:0;}.comment-box{background:#fcfffa;border:1px solid #d0e4c2;padding:10px 0 0 30px;margin:0 -6px 5px;text-align:left;position:relative;zoom:1;}.comment-box .box-t{position:absolute;right:64px;top:-11px;width:21px;height:12px;background:url(${base}/static/img/cicon.png) 0 0 no-repeat;}.form .item{display:block;margin-bottom:20px;line-height:30px;}.form .item:after{content:".";display:block;height:0;clear:both;visibility:hidden;}.form .item span.label{float:left;height:18px;line-height:18px;padding:6px 0;width:100px;text-align:right;}.label{font-size:12px;}.form em{color:#e4393c;}em{font-style:normal;}.form .item span.label{line-height:18px;text-align:right;}.comment-box .commstar{background-color:red;width:105px;height:20px;background:url(${base}/static/img/commstar.jpg) 0 -21px repeat-x;position:relative;margin-top:5px;display:inline-block;overflow:hidden;zoom:1;}.comment-box .commstar .star1{width:20%;z-index:9;}.comment-box .commstar a{cursor:pointer;position:absolute;top:0;left:0;display:inline-block;height:20px;}.comment-box .commstar .star2{width:40%;z-index:8;}.comment-box .commstar .star3{width:60%;z-index:7;}.comment-box .commstar a:hover,.comment-box .commstar .active{background:url(${base}/static/img/commstar.jpg) left top repeat-x;}.comment-box .commstar .star4{width:80%;z-index:6;}.comment-box .commstar .star5{width:100%;z-index:5;}.form input{float:left;font-size:12px;}.comment-box .msg-error-01{border:1px solid #FFBDBE;background:#FFEBEB;color:#E4393C;float:left;line-height:24px;padding:2px 6px;}.comment-box .hide{display:none;}.form .item:after{content:".";display:block;height:0;clear:both;visibility:hidden;}.comment-box .cont{float:left;width:602px;}.comment-box .area01{color:#ccc;}.comment-box .area{width:590px;height:88px;}.form .area{line-height:18px;border:1px solid #ccc;padding:5px;float:none;}.form textarea{font-size:12px;}textarea{font-family:monospace;-webkit-appearance:textarea;background-color:white;-webkit-rtl-ordering:logical;-webkit-user-select:text;flex-direction:column;resize:auto;cursor:auto;white-space:pre-wrap;word-wrap:break-word;margin:0em;font:-webkit-small-control;letter-spacing:normal;word-spacing:normal;text-transform:none;text-indent:0px;text-shadow:none;display:inline-block;text-align:start;-webkit-writing-mode:horizontal-tb;}.comment-box .msg-text{float:right;}.btn-5:link{color:#323333;text-decoration:none;filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5fbef',endColorstr='#eaf6e2',GradientType='0');-ms-filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5fbef',endColorstr='#eaf6e2');background-image:linear-gradient(to top,#f5fbef 0,#eaf6e2 100%);-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;display:inline-block;height:18px;line-height:18px;border:1px solid #bfd6af;padding:2px 14px 3px;}.mr20{margin-right:20px;}.c-0{margin-left:-100%;}.g-3-5{float:left;width:130px;}#menu{-moz-border-radius:5px,5px,5px,5px;background-color:#fff;padding:15px 5px 15px 10px;width:115px;margin-bottom:10px;}#menu h3{font-family:"microsoft yahei";font-size:16px;margin-bottom:8px;color:#333;}#menu dl{line-height:24px;}#menu dl dt{padding-left:20px;height:24px;padding-bottom:2px;}#menu dl dt a.curr{color:#e4393c;font-weight:700;}#menu dl dt a{display:inline-block;vertical-align:middle;}
        /*分页*/
        .pagin a,.pagin span{float:left;height:20px;padding:3px 10px;border:1px solid #ccc;margin-left:2px;font-family:arial;line-height:20px;font-size:14px;overflow:hidden;-moz-border-radius:5px;-webkit-border-radius:5px;}.pagin .text,.pagin .current{border:0;padding:4px 11px;}.pagin a:link,.pagin a:visited{color:#005aa0;}.pagin a:hover,.pagin a:active{background:#005aa0;color:#fff;text-decoration:none;}.pagin .current,.pagin .current:link,.pagin .current:visited{color:#f60;font-weight:700;}.pagin b{display:block;position:absolute;top:9px;width:5px;height:9px;background-image:url(${base}/static/mall/img/bg5.gif);background-repeat:no-repeat;overflow:hidden;}.pagin .prev,.pagin .next,.pagin .prev-disabled,.pagin .next-disabled{position:relative;padding-top:5px;height:18px;line-height:18px;}.pagin .prev-disabled,.pagin .next-disabled{color:#ccc;cursor:default;}.pagin .prev,.pagin .prev-disabled{padding-left:12px;}.pagin .prev b{left:3px;background-position:-68px -608px;}.pagin .prev-disabled b{left:3px;background-position:-80px -608px;}.pagin .next,.pagin .next-disabled{padding-right:12px;}.pagin .next b{right:3px;background-position:-62px -608px;}.pagin .next-disabled b{right:3px;background-position:-74px -608px;}.pagin-m a,.pagin-m span{height:14px;line-height:14px;font-size:12px;}.pagin-m b{top:5px;}.pagin-m .prev,.pagin-m .next,.pagin-m .prev-disabled,.pagin-m .next-disabled{padding-top:3px;height:14px;line-height:14px;*line-height:16px;}
    </style>
</head>
<body>
<#include "mall/jd/shortcut.ftl"/>
<#include "mall/jd/header.ftl"/>
<div class="content">
    <div class="breadcrumb" style="padding-left: 0">
        <strong><a href="${base}/order/list">消息中心</a></strong><span>&nbsp;&gt;&nbsp;评价<span></span></span>
    </div>

    <div class="g-0">
        <div id="content" class="c-3-5">
            <div class="mod-main mod-comm extra-main" id="evalu01">
                <div class="mt">
                    <h3>商品评价</h3>
                    <div class="extra-l ftx03 ml10">
                        <span id="tip-num">(<span class="num-comment"><#if goodsList??>${goodsList?size-reviewedGoodsIdList?size}<#else>0</#if></span>个待评价)</span>
                    </div>
                </div>
                <div class="mc">
                    <div class="tb-void tb-line">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <colgroup>
                                <col width="430">
                                <col width="130">
                                <col width="134">
                                <col>
                            </colgroup>
                            <thead>
                            <tr>
                                <th>商品信息</th>
                                <th>购买时间</th>
                                <th>评价</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list goodsList as goods>
                            <tr>
                                <td colspan="3">
                                    <ul class="pro-info" oid="1743395318">
                                        <li class="fore1">
                                            <div class="p-info clearfix" style="padding-left: 35px">
                                                <div class="p-img fl">
                                                    <a target="_blank" href="${base}/item/${goods.id}.html">
                                                        <img width="50" height="50" title="${goods.fullName}" data-img="1" src="<#if goods.pic??>${goods.pic}</#if>" class="err-product">
                                                    </a>
                                                </div>
                                                <div class="p-name fl">
                                                    <a target="_blank" href="${base}/item/${goods.id}.html">${goods.fullName}</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="fore2"><span class="ftx03">${goods.createDate?string('yyyy-MM-dd')}</span></li>
                                        <li class="fore3 forem">
                                            <#if reviewedGoodsIdList?seq_contains(goods.id)>
                                                <span href="none" target="_blank" class="pj" id="fbpj_${goods.id}" alt="${goods.id}" title="已评价" style="cursor: pointer;color: #B4B4B4">已评价</span>
                                            </#if>
                                            <#if !reviewedGoodsIdList?? || !reviewedGoodsIdList?seq_contains(goods.id)>
                                                <span href="none" class="pj" id="fbpj_${goods.id}" alt="${goods.id}" title="发表评价" style="cursor: pointer;color: #005ea7">发表评价<b class="notReview"></b></span>
                                            </#if>
                                        </li>
                                    </ul>
                                    <div class="clr"></div>
                                    <div class="comment-box hide" id="${goods.id}">
                                        <div class="box-t"></div>
                                        <div class="form" tagflag="true" isconspros="0" pid="1131836">
                                            <div class="item">
                                                <span class="label">评分：</span>
                                                <div class="fl">
                                                            <span class="commstar">
                                                                <a href="javascript:void(0);" class="star1" _val="1"></a>
                                                                <a href="javascript:void(0);" class="star2" _val="2"></a>
                                                                <a href="javascript:void(0);" class="star3" _val="3"></a>
                                                                <a href="javascript:void(0);" class="star4" _val="4"></a>
                                                                <a href="javascript:void(0);" class="star5" _val="5"></a>
                                                            </span>
                                                    <input type="hidden" name="commentStar" id="commentStar">
                                                    <div class="clr"></div>
                                                </div>
                                                <span class="msg-error-01 ml10 hide">你的评分是偶们前进的动力</span>
                                                <div class="clr"></div>
                                            </div>
                                            <div class="item item01"><span class="label">心得：</span>
                                                <div class="cont">
                                                    <textarea name="" class="area" id="pj_${goods.id}"></textarea>
                                                    <div class="clr"></div>
                                                    <span class="msg-error-01 hide">麻烦填写10-500个字呦</span>
                                                    <div class="msg-text">10-500字</div>
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                            <div class="item item02">
                                                <span class="label">&nbsp;</span>
                                                <div class="fl">
                                                    <a href="#none" class="btn btn-5 mr20" id="btnDoReview" onclick="doReview('${goods.id}')"><s></s><span>评价并继续</span></a>
                                                    <div class="msg-text"></div>
                                                </div>
                                                <div class="clr"></div>
                                            </div>
                                        </div>
                                    </div>
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
                    <#if !pager?? && pager.list?size &gt; 0>
                        <#import "mall/jdalb/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/order/review.html" />
                    <#else>
                        <div class="noRecord">你还没有订单！</div>
                    </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="left" class="g-3-5 c-0" style="margin-top: 5px">
        <div id="menu"><h3>评价相关</h3>
            <dl class="fore1">
                <dt><a id="_MYJD_comments" href="" class="curr">我要评价</a></dt>
            </dl>
        </div>
    </div>
</div>
<#include "mall/jd/service.ftl"/>
<#include "mall/jd/footer.ftl"/>
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
<script type="text/javascript">
    $(document).ready(function() {
        $('.pj:has(.notReview)').bind('click', showOrHideReviewText);
        $('.commstar a').bind('click', activeStar);
        $('.cont textarea').bind('keyup', countCommentLenght);

        if ('${currGoodsId}' != undefined && '${isReviewed}' == '') {
            $('#' + '${currGoodsId}').removeClass('hide');
            $(document).scrollTop($('#' + '${currGoodsId}').offset().top);
        }
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
     * 设置评分组件的值和显示效果
     */
    function activeStar() {
        $(this).addClass('active');
        $(this).siblings().removeClass('active');
        $('#commentStar').val($(this).attr('_val'));
    }

    /**
     * 计算输入评价字数
     */
    function countCommentLenght() {
        if ($(this).val().length < 10 || $(this).val().length > 500) {
            $('.cont span').removeClass('hide');
        } else {
            $('.cont span').addClass('hide');
        }
    }

    /**
     * 提交评价
     */
    function doReview(goodsId) {
        var _data = {
            score: $('#commentStar').val(),
            content: $('#pj_' + goodsId + '').val()
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
</script>