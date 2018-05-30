<#escape x as x?html>
    <#include "bec/gdnz/header.ftl"/>
<style>

    .goods_comments table td{vertical-align:middle;}

</style>
<div  id="container" class="f-cb">
    <#include "bec/gdnz/top.ftl"/>
    <div class="member_content">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/order/list">订单中心</a></strong><span>&nbsp;&gt;&nbsp;我的评价<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/gdnz/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="sppj"/>
            <!--leftMenu end-->
        </div>
        <div class="member_right2">
            <div class="my_order2">
                <h3><em>商品评价</em></h3>
                <div class="goods_comments">

                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr class="goods_comments_tit">
                            <td width="18%">订单编号</td>
                            <td width="46%">商品信息</td>
                            <td width="18%">购买时间</td>
                            <td width="18%">评价</td>
                        </tr>
                    </table>
                    <#list orderItemList as item>
                    <table>
                        <tr>
                            <td width="18%"  style="border-right: 1px solid #e8e8e8;"><a href="${base}/order/view/${item.orderSn}.html">${item.orderSn}</a></td>
                            <td width="46%" style="border-right: 1px solid #e8e8e8;">
                                <div class="goods_imgs">
                                    <#if item.goodsId??>
                                      <a target="_blank" href="${base}/item/${item.goodsId}.html">
                                    <#else>
                                      <a style="text-decoration: none;">
                                    </#if>
                                        <img width="50" height="50" title="${item.goodsName}" data-img="1" src="<#if item.pic??>${item.pic}</#if>" class="err-product">
                                    </a>
                                </div>
                                <div class="goods_names" style="padding-top: 10px;">
                                    <#if item.goodsId??>
                                        <a target="_blank" href="${base}/item/${item.goodsId}.html">${item.goodsName}</a>
                                    <#else>
                                    <a style="text-decoration: none;">${item.goodsName}</a>
                                    </#if>

                                </div>
                            </td>
                            <td  style="border-right: 1px solid #e8e8e8;" width="18%">${item.createDate?string('yyyy-MM-dd')}</td>
                            <td width="18%">
                                <#if '${item.isReview}'=='1'>
                                    <span target="_blank" class="pj" id="fbpj_${item.id}" alt="${item.id}" title="已评价" style="cursor: pointer;color: #B4B4B4">已评价</span>
                                </#if>
                                <#if '${item.isReview}'=='0'>
                                    <span class="btn-4" id="fbpj_${item.id}" alt="${item.id}" title="发表评价" style="cursor: pointer;color: #005ea7">发表评价<b class="notReview"></b></span>
                                </#if>
                            </td>
                        </tr>
                    </table>
                            <div class="clr"></div>
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
                                                                <a href="javascript:void(0);" class="star5 active" _val="5"></a>
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
                                            <a href="javascript:void(0)" class="refund-btn btn-5 mr20" id="btnDoReview" onclick="doReview('${item.goodsId}','${item.orderSn}','${item.id}')"><s></s><span>评价并继续</span></a>
                                            <div class="msg-text"></div>
                                        </div>
                                        <div class="clr"></div>
                                    </div>
                                </div>
                            </div>
                    </#list>
                </div>
            </div>
            <div class="mymoney_pages">
                <div class="pagin fr">
                    <#if pager?? && pager.list?size &gt; 0>
                        <#import "bec/gdnz/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/order/review.html" />
                    </#if>
                    <#if !pager?? || pager.list?size = 0>
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
    <#include "bec/gdnz/service.ftl"/>
    <#include "bec/gdnz/foot.ftl"/>
<script type="text/javascript">
    $(document).ready(function() {
        $('.btn-4:has(.notReview)').bind('click', showOrHideReviewText);
        $('.commstar a').bind('click', activeStar);
//        $('.cont textarea').bind('keyup', countCommentLenght);

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
        $('#commentStar_'+$(this).attr("goodsId")).val($(this).attr('_val'));
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
        var content = $('#pj_' + orderItemId).val();
        if(content.length > 500 || content.length < 1) {
            layer.alert('评论内容1~500个字符!',{icon:2});
        }else{
            var _data = {
                orderSn:orderSn,
                score: $('#commentStar_'+orderItemId).val(),
                content: content,
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
</script>
</#escape>