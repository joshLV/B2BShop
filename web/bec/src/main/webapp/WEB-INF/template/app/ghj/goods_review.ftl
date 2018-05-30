<!DOCTYPE html>
<html>
<head>
<#include "app/ghj/head.ftl">
    <link href="${path}/theme/jquery-ui.min.css" rel="stylesheet"/>
    <script src="${path}/js/jquery-ui.min.js" type="text/javascript"></script>
</head>
<style>
    .comment-box {
    }

    .comment-box .box-t {
        position: absolute;
        right: 64px;
        top: -11px;
        width: 21px;
        height: 12px;
        background: url(${base}/static/img/cicon.png) 0 0 no-repeat;
    }

    .form .item {
        display: block;
        margin-bottom: 20px;
        line-height: 30px;
    }

    .form .item:after {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }

    .form .item span.label {
        float: left;
        height: 18px;
        line-height: 18px;
        padding: 6px 0;
        width: 100px;
        text-align: right;
    }

    .label {
        font-size: 12px;
    }

    .form em {
        color: #e4393c;
    }

    em {
        font-style: normal;
    }

    .form .item span.label {
        line-height: 18px;
        text-align: right;
    }

    .comment-box .commstar {
        background-color: red;
        width: 105px;
        height: 20px;
        background: url(${base}/static/img/commstar.jpg) 0 -21px repeat-x;
        position: relative;
        margin-top: 5px;
        display: inline-block;
        overflow: hidden;
        zoom: 1;
    }

    .comment-box .commstar .star1 {
        width: 20%; /*z-index:9;*/
    }

    .comment-box .commstar a {
        cursor: pointer;
        position: absolute;
        top: 1px;
        left: 0;
        display: inline-block;
        height: 21px;
        text-decoration: none !important;
    }

    .comment-box .commstar .star2 {
        width: 40%;
        z-index: 8;
    }

    .comment-box .commstar .star3 {
        width: 60%;
        z-index: 7;
    }

    .comment-box .commstar a:hover, .comment-box .commstar .active {
        background: url(${base}/static/img/commstar.jpg) left top repeat-x;
    }

    .comment-box .commstar .star4 {
        width: 80%;
        z-index: 6;
    }

    .comment-box .commstar .star5 {
        width: 100%;
        z-index: 5;
    }
    .goods_comment02{padding-left: 10px; background: #fff;}
    .goods_comment02 dl {padding: 15px 0; border-bottom: solid 1px #d8d8d8;}
    .goods_comment02 dl dt{height: 35px;
        line-height: 35px;
        display: -webkit-box;
        display: -moz-box;
        display: -o-box;
        display: -ms-box;
    }
    .goods_comment02 dl dt, .goods_comment02 dl dd {
        padding-right: 15px;
        border-top: 1px solid #d8d8d8;
    }
    .goods_comment02 dl dt .avatar {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        margin-top: 5px;
        margin-right: 10px;
    }
    .goods_comment02 dl dt .avatar img {
        border-radius: 50%;
        width: 100%;
        height: 100%;
    }

    .goods_comment02 dl dt .phone {
        font-size: 16px;
        color: #333;
    }

    .goods_comment02 dl dt .time {
        -webkit-box-flex: 1;
        -moz-box-flex: 1;
        -o-box-flex: 1;
        -ms-box-flex: 1;
        text-align: right;
        color: #aaa; font-size:13px;
    }

    .goods_comment02 dl dd {
        margin-top: 10px;
    }
    .goods_comment02 dl dd .level {
        height: 9px;
        position: relative;
        padding: 5px 0px;
    }
    .goods_comment02 dl dd .level .bg {
        width: 200px;
        height: 30px;
        overflow: hidden;
    }

    .goods_comment02 dl dd .level span {
        display: inline-block;
        vertical-align: top;
        height: 9px;
        background: url(${path}/images/xing.png) left center repeat-x;
        background-size: 13px 9px;
    }
    .goods_comment02 dl dd p {
        font-size: 12px;
        color: #666;
        margin-top: 10px; margin-bottom: 0!important;
        word-wrap: break-word;
    }
    /*新加样式  12-31*/
    .logo {
	position: absolute;
	left: 10px;
	float: left;
     }
     .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghj/images/arr.png) no-repeat; background-size:13px
     21px;margin-top:13px;}
</style>
<body>
<header class="mui-bar mui-bar-nav">
    <!--<button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left"
            style="height: 44px;">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>-->
    <div class="logo"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');" class="ltext">返回</a></div>
    <h1 class="mui-title">商品评价</h1>
</header>
<div class="mui-content" id="content" style="padding-bottom:50px;">
    <div class="myorder">
        <table border="0" cellpadding="0" cellspacing="0">
            <thead>
            <tr align="center">
                <td width="25%">商品信息</td>
                <td width="45%">商品信息</td>
                <td width="30%">&nbsp;&nbsp;评价&nbsp;&nbsp;</td>
            </tr>
            </thead>
	   
        <#list orderItemList as item>
            <tbody>
            <tr>
                <td colspan="2" class="orderNo">订单编号:<a href="${base}/order/view/${item.orderSn}?whichclient=whichapp">${item.orderSn}</a>
                </td>
                <td style="border-left-style: hidden;color:#8f8f94;" align="center" class="createDateOrder">${item.createDate?string('yyyy-MM-dd')}<br>${item.createDate?string("HH:mm:ss")}</td>
            </tr>
            <tr>
                <td class="goodsPic">
                    <a href="${base}/item/whichapp/${item.goodsId}.html">
                        <img width="50" height="50" title="${item.goodsName}" data-img="1" src="<#if item.pic??>${item.pic}@400w_300h.png</#if>" class="err-product">
                    </a>
                </td>
                <td class="goodsName">
                    <a href="${base}/item/whichapp/${item.goodsId}.html">${item.goodsName}</a>
                </td>

                <td class="isReview">
                    <#if '${item.isReview}'=='1'>
                        <div style="padding: 5px;"><a href="javascript:void(0);" id="fbpj_${item.goodsId}_${item_index}" alt="${item.goodsId}" title="查看评价" style="cursor: pointer;color: #005ea7" onclick="viewGoodsReviews(this,'${memberId}','${item.goodsId}','${item.orderSn}');">查看评价</a>
			<#if item.unreadReviewCount gt 0>
			      <span id="fbpj_${item.goodsId}_${item_index}_units"  style="float: right;color:white;background-color: red; margin: 4px 5px 0 0; text-align: center;width: 15px;height: 15px;line-height: 15px;border-radius: 45%;">
				   ${item.unreadReviewCount}
			      </span>
			</#if>
                        <span href="javascript:void(0);" id="fbpj_${item.goodsId}_${item_index}_bak" style="cursor: pointer;color: #dddddd;display: none;" >查看评价</span></div>
			<div  style="padding: 5px;">
			    <a href="javascript:void(0);" id="appendReview_${item.goodsId}" alt="${item.goodsId}" title="追加评价" style="cursor: pointer;color: #005ea7;" onclick="appendGoodsReviews(this,'${item.orderSn}','${item.goodsId}');">追加评价</a>
			</div>
                    </#if>
                    <#if '${item.isReview}'=='0'>
			<div style="padding: 5px;">
                        <a href="javascript:void(0);" id="fbpj_${item.orderSn}" alt="${item.orderSn}" title="发表评价" style="cursor: pointer;color: #005ea7" onclick="showDialog(this,'${item.id}','${item.orderSn}','${item.goodsId}');">发表评价</a>
			</div>
                    </#if>
                </td>
            </tr>
            </tbody>
        </#list>
	 
        </table>

    </div>
    <div class="checkout_btn">
     <a id="loadmore" class="gray_btn mui-control-item" href="#buttom" style="background-color:#ddd;">下拉加载更多</a>
    </div>
</div>

<input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
<input type="hidden" id="pageCount" value="${pager.pageCount}"/>
<input type="hidden" id="pageSize" value="${pager.pageSize}"/>

<div class="comment-box" id="dialog-form" title="请评价商品">
    <form>
        <div class="form">
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
                    <input type="hidden" name="commentStar" id="startGrade" value="5">
                    <div style="margin-top: 5px;">
                        <span>评语：</span>
                        <textarea style="width:190px;height:66px;margin-left: 57px;margin-top: -24px;font-size:14px;"
                                  id="comment" placeholder="麻烦填写4-20个字呦"></textarea>
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

<#include "app/ghj/tools.ftl">
<script>
    (function (mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff'
        });

        mui.back = function () {
            jumpto(fullpath + "/order/list?whichclient=whichapp");
        };
        if (ismobile) {
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
            $('#val_F').html('<font color="#ff8c00;">' + $(this).attr('_val') + '</font>' + '分');
        };

        viewGoodsReviews = function (self, memberId, goodsId, orderSn) {
	   
            var selfId = '#'+ jQuery(self).attr("id");
            var selfIdBak = selfId+'_bak';
            jQuery(selfId).hide();
            jQuery(selfIdBak).show();
            console.debug(memberId, goodsId);
            jQuery.ajax({
                type: 'post',
                url: base + 'goods/getGoodsReviewList/' + goodsId + ".html?memberId=" + memberId + "&orderSn=" + orderSn,
                success: function (data) {
                    if (data.length > 0) {
                        console.log(data);
                        var html = '<div class="goods_comment02"><dl>';
                        jQuery.each(data, function (i, review) {
                            var replyHtml = "";
                            if (review.maps != 'undefined' && review.maps != undefined && review.maps != '') {
                                jQuery.each(review.maps, function (i, item) {
                                    if (item != "" && item != undefined) {
                                        if( item.whichSys == "EC"){
                                            replyHtml += '<dd style="margin-left: 20px;"><p style="color:#005ea7;">追加评价：' + item.replyContent + '</p><p style="color:#005ea7;">评价日期：' + item.replyDate + '</p></dd>';
                                        }else{
                                            replyHtml += '<dd style="margin-left: 20px;"><p style="color:#F66D13;">商城回复：' + item.replyContent + '</p><p style="color:#F66D13;">回复日期：' + item.replyDate + '</p></dd>';
                                        }

                                    }
                                });
                            }
                            
                            html += '<div style="float: right;margin-top: -14px;font-size: 14px;padding: 2px 3px;background-color: #fe0000;color: #fff;">收起</div>' +
                                    '<dd>' +
                                    '<div class="level">' +
                                    '<div class="bg"><span style="zoom:2;width:' + review.score * 13 + 'px"></span></div>' +
                                    '</div>' +
                                    '<p>会员评价：' + review.content + '</p>' +
                                    '<p>评价时间：' + review.cdStr + '</p>' +
                                    '</dd>';
                            if(replyHtml !="" && replyHtml !=undefined){
                                html +=replyHtml;
                            }
                            html += '</dl></div>';
                        });

                       console.log(jQuery(self).parents("tr"));
                        var td = jQuery("<td>").prop("colspan", "3").html(html);
                        var tr = jQuery('<tr  onclick="jQuery(\''+ selfId +'\').show();jQuery(\''+ selfIdBak +'\').hide();remove(this); ">').append(td);
                        jQuery(self).parents("tr").after(tr);
                    }
                }
            });
            //TODO update isRead = YES;
            jQuery.ajax({
                type:"post",
                url: base + 'order/updateReview/' + orderSn + '/' + goodsId + ".html",
                success: function (data) {
                    //do noting;
                    console.log(data);
                    var selfIdUnits = selfId+'_units';
                    jQuery(selfIdUnits).hide();
                }
            });
        };

        appendGoodsReviews = function(self, orderSn, goodsId){
            console.log(orderSn, goodsId);
            var html = '<ul style="margin-top:-25px;width: 100%;">'
                    + '    <li class="mui-table-view-cell" style="padding: 0 15px;">'
                    + '        <div class="mui-collapse-content" style="text-align: left;margin: 10px;">'
                    + '            <div class="item_account">'
                    + '            	<span class="label" style="font-size: 16px;">请输入评价：</span>'
                    + '            	<span class="money"><textarea id="appendReview" rows="3" style="margin-top: 10px;" placeholder="麻烦填写4-20个字呦"></textarea></span>'
                    + '            </div>'
                    + '        </div>'
                    + '    </li>'
                    + '</ul>';
            layer.open({
                title: [
                    '追加评价',
                    'background-color:#8DCE16;color:#fff;margin-top:-5px;'
                ],
                content: html,
                btn: ['确认', '取消'],
                shadeClose: false,
                yes: function(){
                    //ajax append review
                    var review = jQuery("#appendReview")[0].value;
                    if (review.length < 4) {
                        popAlert('评语太少了，请多写些评语吧！');
                        return;
                    }
                    if (review.length >20) {
                        popAlert('评语太多了，请少写些评语吧！');
                        return;
                    }
                    jQuery.ajax({
                        type: 'post',
                        url: base + 'order/appendReview/' + orderSn + '/' + goodsId + ".html?review=" + review,
                        success: function (data) {
                            if (data.status == 'success') {
                                popAlert('追加评价成功');
                            }else{
                                popAlert('追加评价失败，请稍后再试');
                            }
                        }
                    });
                }, no: function(){
                    //do nothing
                }
            });
        };
        showDialog = function (self, itemId, orderSn, goodsId) {
            // console.debug("open: " + itemId);
            jQuery("#reviewItemId").val(itemId);
            jQuery("#reviewOrderSn").val(orderSn);
            jQuery("#reviewGoodsId").val(goodsId);
            jQuery("#dialog-form").dialog('open');
        };

        jQuery('.commstar a').on('click', activeStar);

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
                    if (comment.length < 4) {
                        popAlert('请多给些评语吧！');
                        return;
                    }
                    //comment = encodeURI(encodeURI(comment));
                    jQuery("#reviewItemId").val("");
                    jQuery("#reviewOrderSn").val("");
                    jQuery("#reviewGoodsId").val("");
                    jQuery("#startGrade").val(5);
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
    }(mui, document));

   
    var loadop=true;
    var screenheight = window.screen.availHeight; //获取屏幕高
    $(window).scroll(function(){
        if ($(window).scrollTop()>100){
            $("#backToTop").fadeIn(500);
        }else{
            $("#backToTop").fadeOut(500);
        }
        var scr = $(window).scrollTop();
        var conH=document.getElementById("content").offsetHeight;//获取内如高度
        if(screenheight+scr>conH-100){
            if(loadop){
                loadData();
            }
        }
    });


    /*----------------- 分页Begin ----------------------*/	
    function loadData(){
        //当前页数
	var pageNumber = parseInt(jQuery("#pageNumber").val());
	var pageSize = parseInt(jQuery("#pageSize").val());
	var pageCount = parseInt(jQuery("#pageCount").val());
	if(pageNumber>pageCount){
	    jQuery("#loadmore").attr("style","background-color:#ddd")
            jQuery("#loadmore").html("没有更多商品了");
	    loadop=false;
	    return;
	}
	
        loadop=false;
        jQuery("#loadmore").html("<img style='width: 60px;' src='${base}/static/app/gwq/images/loading.gif'>");
        pageNumber = pageNumber + 1;
	
        var url = fullpath + "/order/ajax/review?whichclient=whichapp";
	var data= {
            'pageNumber': pageNumber  
        }
	
	jQuery.ajax({type: "post",url: url,data:data,datatype: 'json',success: function (result){
	      var orderItemListHtml="";
	      jQuery.each(result.orderItemList, function (index, item) {
		  if(typeof (result.pager.list) == 'undefined' || result.pager.list.length == 0){
                    jQuery("#loadmore").attr("style","background-color:#ddd")
                    jQuery("#loadmore").html("没有更多商品了");
                    loadop=false;
                    return;
                  }

	          var pic=null;
	          if(item.pic!=""){
			pic=item.pic+"@400w_300h.png";
		  }
	          orderItemListHtml+='<tbody>'+
		    '<tr>'+
			'<td colspan="2">订单编号:<a href="${base}/order/view/'+ item.orderSn +'?whichclient=whichapp">'+ item.orderSn +'</a>'+
			'</td>'+
			'<td style="border-left-style: hidden;color:#8f8f94;" align="center">'+utils.dateFormat(item.createDate,1)+'</td>'+
		    '</tr>'+
		    '<tr>'+
			'<td>'+
			    '<a href="${base}/item/whichapp/'+item.goodsId+'.html">'+
				'<img width="50" height="50" title="'+item.goodsName+'" data-img="1" src="'+pic+'" class="err-product">'+
			    '</a>'+
			'</td>'+
			'<td class="goodsName">'+
			    '<a href="${base}/item/whichapp/'+item.goodsId+'.html">'+item.goodsName+'</a>'+
			'</td>'+
			'<td class="isReview">';
		   var num=(pageNumber-1)*parseInt(result.pager.pageSize)+index;	
		   if(item.isReview=='1'){
			orderItemListHtml+='<div style="padding: 5px;">'+
			'<a href="javascript:void(0);" id="fbpj_'+item.goodsId+"_"+num+'" alt="'+item.goodsId+'" title="查看评价" style="cursor: pointer;color: #005ea7" onclick="viewGoodsReviews(this,\''+result.memberId+'\',\''+ item.goodsId +'\',\''+item.orderSn+'\');">'+
			'查看评价</a>';
			if(item.unreadReviewCount >0){
				orderItemListHtml+='<span id="fbpj_'+item.goodsId+"_"+num+'_units"  style="float: right;color:white;background-color: red; margin: 4px 5px 0 0; text-align: center;width: 15px;height: 15px;line-height: 15px;border-radius: 45%;">'+
					   item.unreadReviewCount+'</span>';
			}
			orderItemListHtml+='<span href="javascript:void(0);" id="fbpj_'+item.goodsId+"_"+num+'_bak"  style="cursor: pointer;color: #dddddd;display: none;" >查看评价</span></div>';
			orderItemListHtml+='<div  style="padding: 5px;">'+
				'<a href="javascript:void(0);" id="appendReview_'+item.goodsId+'" alt="'+item.goodsId+'" title="追加评价" style="cursor: pointer;color: #005ea7;" onclick="appendGoodsReviews(this,\''+item.orderSn+'\',\''+item.goodsId+'\');">追加评价</a>'+
				'</div>';
		   }else if(item.isReview=='0'){
			orderItemListHtml+='<div style="padding: 5px;">'+
			'<a href="javascript:void(0);" id="fbpj_'+item.orderSn+'" alt="'+item.orderSn+'" title="发表评价" style="cursor: pointer;color: #005ea7;" onclick="showDialog(this,\''+item.id+'\',\''+item.orderSn+'\',\''+item.goodsId+'\');">发表评价</a>'+
			'</div>';
		   }
		   orderItemListHtml+='</td>'+
		   '</tr>'+
		   '</tbody>';
		 

	    })
	    jQuery("#pageNumber").val(result.pager.pageNumber);
	    jQuery("#pageSize").val(result.pager.pageSize);
	    jQuery("#pageCount").val(result.pager.pageCount);
	    $(".myorder").find("table").append(orderItemListHtml);

	    loadop=true;
            jQuery("#loadmore").attr("style","background-color:#F4F4F4");
            jQuery("#loadmore").html("上拉加载更多");
	},
        error: function (data) {
              jQuery("#loadmore").attr("style","background-color:#ddd");
              jQuery("#loadmore").html("加载失败，稍后再试");
        }})

    }
</script>
</body>
</html>