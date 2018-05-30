<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<style>

    .goods_comments table td{vertical-align:middle;}
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
    .star{
        width: 68px;
        height: 12px;background: url(${base}/static/bec/project/ghdj/img/goods.jpg) no-repeat;
        float: left;
        margin-top: 8px;
        margin-left: 5px;
    }
    .my_order2{ border: 0;width: 993px;}
     .star .bar{background: url(${base}/static/bec/project/ghdj/img/goods.jpg) no-repeat;background-position: 0px -13px; display:inline-block;height: 12px;}

    .repply_first {
        color: #ff7a1f;
        border-top: 1px dotted #dfdfdf;
        padding-top: 10px;
        margin-top: 10px;
    }
    .repply_second {
        color: #60b220;
        border-top: 1px dotted #dfdfdf;
        padding-top: 10px;
        margin-top: 10px;
    }
    .repply_none {
        border-top: 1px dotted #dfdfdf;
        padding-top: 10px;
        margin-top: 10px;
    }
</style>
<div  id="container" class="f-cb">
    <#include "bec/ghdj/top.ftl"/>
    <div class="member_content">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/order/list">订单中心</a></strong><span>&nbsp;&gt;&nbsp;我的评价<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="sppj"/>
            <!--leftMenu end-->
        </div>
        <div class="member_right">
            <div class="my_order2">
                <h3><em>商品评价</em></h3>
                <div class="goods_comments">

                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr class="goods_comments_tit">
                            <td width="18%">订单编号</td>
                            <td width="46%">商品信息</td>
                            <td width="18%">购买日期</td>
                            <td width="18%">评价</td>
                        </tr>
                    </table>
                    <#list orderItemList as item>
                    <table>
                        <tr>
                            <td width="18%"  style="border-right: 1px solid #e8e8e8;"><a href="${base}/order/view/${item.orderSn}.html">${item.orderSn}</a></td>
                            <td width="46%" style="border-right: 1px solid #e8e8e8;">
                                <div class="goods_imgs">
                                   <#-- <#if item.goodsId??>
                                      <a target="_blank" href="${base}/item/${item.goodsId}.html">
                                    <#else>
                                      <a style="text-decoration: none;">
                                    </#if>-->
                                        <img width="50" height="50" title="${item.goodsName}" data-img="1" src="<#if item.pic??>${item.pic}</#if>" class="err-product">
                                    </a>
                                </div>
                                <div class="goods_names" style="padding-top: 10px;max-width: 320px;">
                                    <#if item.goodsId??>
                                       <#-- <a target="_blank" href="${base}/item/${item.goodsId}.html">${item.goodsName}</a>-->
                                        <a>${item.goodsName}</a>
                                    <#else>
                                    <a style="text-decoration: none;">${item.goodsName}</a>
                                    </#if>

                                </div>
                            </td>
                            <td  style="border-right: 1px solid #e8e8e8;" width="18%">${item.createDate?string('yyyy-MM-dd')}</td>
                            <td width="18%">
                                <#if '${item.isReview}'=='1'>
                                    <span  class="pj" id="fbpj_${item.id}" alt="${item.id}" goodsId="${item.goodsId}" orderSn="${item.orderSn}" title="查看/追加评论" style="cursor: pointer;color: #005ea7">查看评论/回复<b class="hasReview"></b></span>
                                    <#if item.unreadReviewCount gt 0><span id="fbpj_${item.id}_units"  style="color:white;background-color: red;padding: 1px 5px; text-align: center;width: 15px;height: 15px;line-height: 15px;border-radius: 45%;">${item.unreadReviewCount}</span></#if>
                                <#elseif '${item.isReview}'=='0'>
                                    <span  class="pj" id="fbpj_${item.id}" alt="${item.id}" title="发表评价" style="cursor: pointer;color: #005ea7">发表评价<b class="notReview"></b></span>
                                </#if>
                            </td>
                        </tr>
                    </table>
                            <div class="clr"></div>
                        <#if '${item.isReview}'=='0'>
                            <div class="comment-box hide" id="${item.id}">
                                <div class="box-t"></div>
                                <div class="r-form" tagflag="true" isconspros="0" pid="1131836">
                                    <div class="item">
                                        <span class="label">评分：</span>
                                        <div class="fl">
                                                            <span class="commstar">
                                                                <a href="javascript:void(0);" class="star1" _val="1" goodsId="${item.id}"></a>
                                                                <a href="javascript:void(0);" class="star2" _val="2" goodsId="${item.id}"></a>
                                                                <a href="javascript:void(0);" class="star3" _val="3" goodsId="${item.id}"></a>
                                                                <a href="javascript:void(0);" class="star4" _val="4" goodsId="${item.id}"></a>
                                                            <#--Desc:默认选中五个星 Auth:zhangqiang Time:2015-12-04 16:11:35 Start-->
                                                                <a href="javascript:void(0);" class="star5 active" _val="5" goodsId="${item.id}" ></a>
                                                            </span>
                                            <input type="hidden" name="commentStar" id="commentStar_${item.id}" value="5">
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
                                            <#--<span class="msg-error-01 hide">您还没有填写心得哦！</span>-->
                                            <div class="msg-text">1-500字</div>
                                        </div>
                                        <div class="clr"></div>
                                    </div>
                                    <div class="item item02">
                                        <span class="label">&nbsp;</span>
                                        <div class="fl">
                                            <a href="#none" class="refund-btn btn-5 mr20" id="btnDoReview" onclick="doReview('${item.goodsId}','${item.orderSn}','${item.id}')"><s></s><span>评价并继续</span></a>
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
                    </#list>
                </div>
            </div>
            <div class="mymoney_pages">
                <div class="pagin fr">
                    <#if pager?? && pager.list?? && pager.list?size &gt; 0>
                        <#import "bec/ghdj/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/order/review.html" />
                    </#if>
                    <#if !pager?? || !pager.list?? ||pager.list?size = 0>
                        <div class="noRecord">你还没有订单！</div>
                    </#if>
                </div>
                <#--<ul>-->
                    <#--<li><a href="#" class="prev_pages current">上一页</a></li>-->
                    <#--<li><a href="#">1</a></li>-->
                    <#--<li><a href="#">2</a></li>-->
                    <#--<li><a href="#" class="next_pages">下一页</a></li>-->
                <#--</ul>-->
            </div>
        </div>
    </div>
</div>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
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
     * 设置评分组件的值和显示效果
     */
    function activeStar() {
        $(this).addClass('active');
        $(this).siblings().removeClass('active');
        $('#commentStar_'+ $(this).attr("goodsId")).val($(this).attr('_val'));
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
        if(cont.length > 500 || cont.length < 1) {
            layer.alert('评论内容1~500个字符!',{icon:2});
        }else{
            var _data = {
                orderSn:orderSn,
                score: $('#commentStar_'+orderItemId).val(),
                content: cont,
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
                            html += '<div class="r-form" tagflag="true" isconspros="0" pid="1131836">';
                            html += '<div class="item">';
                            html += '<span class="label pj_text1">评分：</span>';
                            html += '<div class="fl"><b style="color: #e52c32; padding-right: 3px; font-size: 14px;">';
                            html += parseInt(review.score);
                            html += '</b>分</div>';
                            html += '<div class="star"><span class="bar" id="avgrating" style="width: '+parseInt(parseInt(review.score)/5*100)+'%" ></span></div>';
                            html += '</div>';
                            html += '<div class="item item01"><span class="label  pj_text" >内容：</span>';
                            html += '<div class="cont">';
                            html += review.content;
                            html += '</div><div class="clr"></div></div>';
                            html += '<div class="item item01"><span class="label  pj_text" >评论时间：</span>';
                            html += '<div class="cont">';
                            html += /*review.buyDateStr;*/new Date(review.createDate).Format("yyyy-MM-dd hh:mm");
                            html += '</div><div class="clr"></div></div>';
                            html += '</div>';
                            if (review.maps != 'undefined' && review.maps != undefined && review.maps != '') {
                                $.each(review.maps, function (i, item) {
                                    if (item != "" && item != undefined) {
                                        replay += '<div class="item item01 pj_style';
/*                                        if( i % 2 == 1 ){
                                            replay += ' repply_second';
                                        } else {
                                            replay += ' repply_first';
                                        }*/
                                        if (item.whichSys == 'BEC') {
                                            replay += ' repply_none';
                                        } else if (item.whichSys == 'MCM') {
                                            replay += ' repply_second';
                                        } else if (item.whichSys == 'ECM') {
                                            replay += ' repply_first';
                                        }

                                        replay += '" ><div class="repply_text"><span class="label pj_text" style="';
                                        if (item.whichSys == 'BEC') {
                                        } else if (item.whichSys == 'MCM') {
                                            replay += 'color: #60b220;';
                                        } else if (item.whichSys == 'ECM') {
                                            replay += 'color: #ff7a1f;';
                                        }
                                        replay += '">';
                                        if (item.whichSys == 'BEC') {
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
                                        replay += '<span class="label pj_text" style="';
                                        if (item.whichSys == 'BEC') {
                                        } else if (item.whichSys == 'MCM') {
                                            replay += 'color: #60b220;';
                                        } else if (item.whichSys == 'ECM') {
                                            replay += 'color: #ff7a1f;';
                                        }
                                        replay +='">';
                                        if (item.whichSys == 'BEC') {
                                            replay += '追加时间';
                                        } else if (item.whichSys == 'MCM') {
                                            replay += '回复时间';
                                        } else if (item.whichSys == 'ECM') {
                                            replay += '回复时间';
                                        }
                                        replay += '：</span><div class="cont">';
                                        replay += item.replyDate;//new Date(item.createDate).Format("yyyy-MM-dd hh:mm");
                                        replay += '</div></div>';

                                        replay += '</div>';
                                    }
                                });
                            }

                        });
                        html += '<div class="box-t"></div><div class="r-form" tagflag="true" isconspros="0" pid="1131836">';
                        html += replay;


                        //huifu
                        html += '<div class="item item01"><span class="label pj_text" style="padding-top: 0;font-size: 14px;font-weight:bold;">再次评论：</span>';
                        html += '<div class="cont">';
                        html += '<textarea name="" class="area" id="pj_' + commentBoxId + '"></textarea>';
                        html += '<div class="fl">';
                        html += '<a href="javascript:void(0)" class="refund-btn btn-5 mr20" ';
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
</#escape>