
<!DOCTYPE html>
<html>
<head>
<#include "app/zx/head.ftl">
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        我的关注
    </div>
    <button type="button" id="jxgw" onclick="javascript:deleteAll();" class="mui-btn  mui-btn-link mui-btn-nav mui-pull-right" style="margin-right:0px; padding-left: 6px;">
        <span class="mui-icon mui-icon-right-nav"></span>清空关注
    </button>
</header>


<div class="mui-content" style="padding-bottom:50px;" id="content">
    <div class="myorder" style="margin-top: 16px;">
        <div class="viewport" id="tabs" style=" padding-left: 0!important; padding-right:0!important; width: 100%!important;">
            <div id="order01" class="order_list01">
                <div style="height: 5px;"></div>
                <#list goodsAttentionList as goodsAttention>
                <dl title="unconfirm" id="${goodsAttention.id}">
                    <dd>
                        <div class="order-goods">
                            <div class="face"><a href="${base}/item/whichapp/${goodsAttention.goodsId}.html"><img src="${goodsAttention.image}@150w_150h.png"></a></div>
                            <div class="info"> <a href="${base}/item/whichapp/${goodsAttention.goodsId}.html">${goodsAttention.name}</a>
                                <h4 style="font-size: 14px;">商城价:<font>￥${goodsAttention.price}</font><span style="font-size: 12px;color: #666">&nbsp;市场价:<del>￥${goodsAttention.marketPrice}</del></span></h4>
                            </div>
                        </div>
                        <div class="tools">
                            <a href="javascript:void(0);" onclick="addCart('${goodsAttention.goodsId}');" class="JS_order_btn " style="background:#DB0000;color:#fff;border-color:#DB0000;"><img src="${base}/static/mall/img/gwc_icon.png" style="margin-right: 5px;">加入购物车</a>
                            <a onclick="deleteOne('${goodsAttention.id}');" href="javascript:void(0);" class="JS_order_btn ">清除该关注</a>
                        </div>

                    </dd>
                </dl>
                </#list>
            </div>
        </div>
    </div>
    <div class="checkout_btn">
        <a id="loadmore" class="gray_btn" class="mui-control-item" href="#buttom" style="background-color:#F4F4F4;">上拉加载更多</a>
    </div>
    <div id="buttom"></div>
    <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
    <input type="hidden" id="pageCount" value="${pager.pageCount}"/>
    <input type="hidden" id="pageSize" value="${pager.pageSize}"/>
</div>
<div class="return">
    <a id="backToTop" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>


    <script>
        (function(mui, doc) {
            mui.init({
                statusBarBackground: '#F4F4F4'
            });
            if(ismobile) {
                mui.plusReady(function () {
                    //关闭等待框
                    plus.nativeUI.closeWaiting();
                    //显示当前页面
                    plus.webview.currentWebview().show();
                });
            }
            fmoney=function (s, n)
            {
                var res = "0.00";
                if(typeof(s) == 'undefined' || !jQuery.isNumeric(s)){
                    return res;
                }
                n = n > 0 && n <= 20 ? n : 2;
                s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
                // return s;

                var l = s.split(".")[0].split("").reverse();
                var r = s.split(".")[1];
                t = "";
                for(i = 0; i < l.length; i ++ )
                {
                    t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
                }
                res = t.split("").reverse().join("") + "." + r;

                
                return res;

            };
            var loadop=true;
            loadData = function(){
                jQuery("#loadmore").html("<img src='${path}/images/loading.gif'>");

                var pageNumber = parseInt(jQuery("#pageNumber").val());
                var pageCount = parseInt(jQuery("#pageCount").val());
                var pageSize = parseInt(jQuery("#pageSize").val());

                pageNumber = pageNumber + 1;
                var url = fullpath + "/member/goodsattention/loadmore";
                jQuery.ajax({
                    type: "post",
                    url: url,
                    data: {'pageNumber': pageNumber,'pageSize': pageSize},
                    datatype: 'json',
                    success: function(data) {
                        if(data.status == 'success'){
                            if(typeof (data.data) == 'undefined' || data.data.length == 0){
                                jQuery("#loadmore").attr("style","background-color:#ddd")
                                jQuery("#loadmore").html("没有更多商品了");
                                loadop=false;
                                return;
                            }

                            jQuery("#pageNumber").val(data.pager.pageNumber);
                            jQuery("#pageCount").val(data.pager.pageCount);
                            jQuery.each(data.data, function(index, ga){
                                var lastGoodsAttention = jQuery("dl").last();
                                var domGA = lastGoodsAttention.clone();
                                jQuery(domGA).prop('id', ga.id);
                                jQuery(domGA).find(".face").find("a").prop('href', fullpath + "/item/whichapp/" + ga.id  + ".html").html('<img src=' + ga.image + '@150w_150h.png>');
                                jQuery(domGA).find(".info").find("a").prop('href', fullpath + "/item/whichapp/" + ga.id  + ".html").html(ga.name);
                                jQuery(domGA).find("h4").html('商城价:<font>￥' + fmoney(ga.price, 2) + '</font><span style="font-size: 12px;color: #666">&nbsp;市场价:<del>￥' + fmoney(ga.marketPrice, 2) + '</del></span>');
                                jQuery(domGA).find(".tools").find("a").first().bind('click', function(){addCart(ga.goodsId);});
                                jQuery(domGA).find(".tools").find("a").last().bind('click', function(){deleteOne(ga.id);});
                                lastGoodsAttention.after(domGA);

                            });
                            loadop=true;
                        }else{
                            jQuery("#loadmore").attr("style","background-color:#ddd")
                            jQuery("#loadmore").html("加载失败，稍后再试");
                        }
                    },
                    error:function(data){
                        jQuery("#loadmore").attr("style","background-color:#ddd")
                        jQuery("#loadmore").html("加载失败，稍后再试");
                    }
                });
            };


            var screenheight = window.screen.availHeight; //获取屏幕高
            jQuery(window).scroll(function(){
                if (jQuery(window).scrollTop()>100){
                    jQuery("#backToTop").fadeIn(500);
                }else{
                    jQuery("#backToTop").fadeOut(500);
                }
                var scr = jQuery(window).scrollTop();
                var conH=document.getElementById("content").offsetHeight;//获取内如高度
                if(screenheight+scr>conH-100){
                    if(loadop){
                        loadData();
                    }
                }
            });

            deleteAll = function (){

                var layer_confrim = layer.open({
                    title:'提示：',
                    content:'确认删除所有关注?',
                    btn: ['确认', '取消'],
                    shadeClose: false,
                    yes: function(){
                        layer.close(layer_confrim);
                        showWaiting();
                        jQuery.ajax({
                            type: "get",
                            url: "${base}/member/goodsattention/ajaxDeleteAllByMemberId",
                            success: function(data) {
                                if(data.status=='success'){
                                    //刷新本页面
                                    location.replace("${base}/member/goodsattention/list?whichclient=whichapp");
                                }
                                closeWaiting();
                            },
                            error:function(data){
                                closeWaiting();
                                popAlert(data.message);
                            }
                        });
                    },
                    no: function(){
                        layer.close(layer_confrim);
                    }
                });
            };

            deleteOne = function (id){
                showWaiting();
                jQuery.ajax({
                    type: "get",
                    url: "${base}/member/goodsattention/ajaxDeleteGoodsAttentionId",
                    data: "id="+id,
                    success: function(data) {
                        if(data.status=='success'){
                            jQuery("#"+id).remove();
                        }
                        closeWaiting();
                    },
                    error:function(data){
                        closeWaiting();
                        popAlert(data.message);
                    }
                });
            };
            addCart = function (goodsId) {
                window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=1" + "&backurl=" + window.location.href+"&whichclient=whichapp";
            };
            jQuery('#backToTop').bind("tap", function(){
                jQuery('html,body').animate({scrollTop: '0px'}, 100);
            });
        }(mui, document));


    </script>

</div>
</body>
</html>