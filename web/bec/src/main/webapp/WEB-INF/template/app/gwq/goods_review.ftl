<!DOCTYPE html>
<html>
<head>
<#include "app/gwq/head.ftl">
    <link href="${path}/theme/jquery-ui.min.css" rel="stylesheet" />
    <script src="${path}/js/jquery-ui.min.js" type="text/javascript"></script>
</head>
<style>
    .comment-box{}
    .comment-box .box-t{position:absolute;right:64px;top:-11px;width:21px;height:12px;background:url(${base}/static/img/cicon.png) 0 0 no-repeat;}
    .form .item{display:block;margin-bottom:20px;line-height:30px;}
    .form .item:after{content:".";display:block;height:0;clear:both;visibility:hidden;}
    .form .item span.label{float:left;height:18px;line-height:18px;padding:6px 0;width:100px;text-align:right;}
    .label{font-size:12px;}.form em{color:#e4393c;}em{font-style:normal;}
    .form .item span.label{line-height:18px;text-align:right;}
    .comment-box .commstar{background-color:red;width:105px;height:20px;background:url(${base}/static/img/commstar.jpg) 0 -21px repeat-x;position:relative;margin-top:5px;display:inline-block;overflow:hidden;zoom:1;}
    .comment-box .commstar .star1{width:20%;z-index:9;}
    .comment-box .commstar a{cursor:pointer;position:absolute;top:0;left:0;display:inline-block;height:20px;}
    .comment-box .commstar .star2{width:40%;z-index:8;}.comment-box .commstar .star3{width:60%;z-index:7;}
    .comment-box .commstar a:hover,.comment-box .commstar .active{background:url(${base}/static/img/commstar.jpg) left top repeat-x;}
    .comment-box .commstar .star4{width:80%;z-index:6;}
    .comment-box .commstar .star5{width:100%;z-index:5;}
    a{ text-decoration:none; color: #333333;}
</style>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" style="height: 44px;">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">商品评价</h1>
</header>
<div class="mui-content" style="padding-bottom:50px;">
    <div class="myorder">
        <table border="0" cellpadding="0" cellspacing="0">
            <thead><tr align="center">
                <td width="25%">商品信息</td>
                <td width="45%">商品信息</td>
                <td width="30%">&nbsp;&nbsp;评价&nbsp;&nbsp;</td>
            </tr></thead>

            <#list orderItemList as item>
            <tbody>
                <tr>
                    <td colspan="2">
                        订单编号:<a href="${base}/order/view/${orderId}?whichclient=whichapp">${item.orderSn}</a>
                    </td>
                    <td style="border-left-style: hidden;color:#8f8f94;" align="center">
                        ${item.createDate?string('yyyy-MM-dd')}<br>${item.createDate?string("HH:mm:ss")}
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="${base}/item/whichapp/${item.goodsId}.html">
                            <img width="50" height="50" title="${item.goodsName}" data-img="1" src="<#if item.pic??>${item.pic}_400x300.png</#if>" class="err-product">
                        </a>
                    </td>
                    <td>
                        <a href="${base}/item/whichapp/${item.goodsId}.html">${item.goodsName}</a>
                    </td>

                    <td>
                        <#if '${item.isReview}'=='1'>
                            <span href="none" target="_blank"  id="fbpj_${item.goodsId}" alt="${item.goodsId}" title="已评价" style="cursor: pointer;color: #B4B4B4">已评价</span>
                        </#if>
                        <#if '${item.isReview}'=='0'>
                            <span href="none" id="fbpj_${item.orderSn}" alt="${item.orderSn}" title="发表评价" style="cursor: pointer;color: #005ea7"
                                  onclick="showDialog(this,'${item.id}','${item.orderSn}','${item.goodsId}');">发表评价</span>
                        </#if>
                    </td>
                </tr>
            </tbody>
            </#list>

        </table>

    </div>
</div>

<div class="comment-box" id="dialog-form" title="请评价商品">
    <form>
        <div class="form"  >
            <div class="item">
                <div class="fl">
                    <div style="margin-top: 5px;">
                        <span>评分：</span>
                        <span class="commstar" style="margin-left:-5px;">
                            <a href="javascript:void(0);" class="star1" _val="1"></a>
                            <a href="javascript:void(0);" class="star2" _val="2"></a>
                            <a href="javascript:void(0);" class="star3" _val="3"></a>
                            <a href="javascript:void(0);" class="star4" _val="4"></a>
                            <a href="javascript:void(0);" class="star5 active" _val="5"></a>
                        </span>
                        <span id="val_F" style="margin-left: 10px;"><font color="#ff8c00;">5</font>分</span>
                    </div>
                    <input type="hidden" name="commentStar" id="startGrade">
                    <div style="margin-top: 5px;">
                        <span>评语：</span>
                        <textarea style="width:190px;height:66px;margin-left: 57px;margin-top: -24px;font-size:14px;" id="comment" placeholder="麻烦填写10-20个字呦" ></textarea>
                    </div>
                    <input type="hidden" id="reviewItemId"/>
                    <input type="hidden" id="reviewOrderSn"/>
                    <input type="hidden" id="reviewGoodsId"/>
                    <div class="clr"></div>
                </div>
            </div>
        </div>
    </form>
</div>

<#include "app/gwq/tools.ftl">
<script>
    (function(mui, doc){
        mui.init({
            statusBarBackground: '#ffffff'
        });

        mui.back = function(){
            jumpto(fullpath + "//order/list?whichclient=whichapp");
        }
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }
        /**
         * 设置评分组件的值和显示效果
         */
        activeStar = function () {
            $(this).addClass('active');
            $(this).siblings().removeClass('active');
            $('#startGrade').val($(this).attr('_val'));
            $('#val_F').html('<font color="#ff8c00;">'+$(this).attr('_val')+'</font>'+'分');
        };

        showDialog = function (self, itemId,orderSn,goodsId){
           // console.debug("open: " + itemId);
            jQuery("#reviewItemId").val(itemId);
            jQuery("#reviewOrderSn").val(orderSn);
            jQuery("#reviewGoodsId").val(goodsId);
            jQuery("#dialog-form").dialog('open');
        };

        jQuery('.commstar a').bind('click', activeStar);

        jQuery("#dialog-form").dialog({
            autoOpen: false,
            modal: true,
            buttons: {
                "确定": function () {
                    var orderItemId = jQuery("#reviewItemId").val();
                    var orderSn = jQuery("#reviewOrderSn").val();
                    var goodsId = jQuery("#reviewGoodsId").val();
                    var startGrade = jQuery("#startGrade").val();
                    var comment = jQuery("#comment").val()
                    //console.debug("colse: " + orderItemId + " startGrade: " + startGrade + " comment: " + comment);
                    if(comment.length < 10){
                        popAlert('请多给些评语吧！');
                        return;
                    }
                    //comment = encodeURI(encodeURI(comment));
                    jQuery("#reviewItemId").val("");
                    jQuery("#reviewOrderSn").val("");
                    jQuery("#reviewGoodsId").val("");
                    jQuery("#startGrade").val(1);
                    jQuery("#comment").val("");
                    jQuery(this).dialog("close");
                    var _data = {
                        orderSn: orderSn,
                        score: startGrade,
                        content: comment,
                        orderItemId: orderItemId
                    };
                    var data = encodeURIComponent(JSON.stringify(_data));
                    jQuery.ajax({
                        type: 'post',
                        url: base + 'order/doReview/' + goodsId + '.html',
                        data: {review: data},
                        success: function (data) {
                            if (data.status = 'success') {
                                location.reload();
                            }
                        }
                    });
                },
                "关闭": function () {
                    jQuery(this).dialog("close");
                }
            }
        });
    }(mui, document));;



</script>
</body>
</html>