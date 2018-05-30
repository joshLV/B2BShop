
<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/ghdj/head.ftl">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

<style>
    .mui-card {
    overflow: hidden;
    margin: 0 0 0 0px;
    border: 1px solid #ddd;
    border-radius: 0px;
    background-color: #fff;
    background-clip: padding-box
    }

    .f-fr2 {
        padding-left: 20px;
        color: #e12f45;
        background-size: 17px;
    }
    /*top*/
    header{
        position: fixed;
        top: 0px;
        right: 0;
        left: 0;
        background:#e12f45;
        padding:8px 0;
        font-size:18px;
        height:30px;
        line-height:30px;
        box-shadow: 0px 3px 6px #999;
        z-index:10;text-align:center;}
    .logo{ position:absolute;left:10px;float:left;}
    .logo a{ color:#fff;}
    .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
    .user{ position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
    .user a{ float:right;text-indent:-9999px;width:20px; height:20px; background:url(${base}/static/app/ghdj/images/user.png) no-repeat; background-size: 20px 20px;}
    .mtit{color:#fff;}


    /*新加样式  12-31*/
    .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghdj/images/arr.png) no-repeat; background-size:13px 21px;margin-top:5px;}


</style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">选择支付方式</h1>
</header>
<div class="mui-content" style="margin-top:30px;">
        <ul class="mui-table-view" >
            <li class="mui-table-view-cell mui-collapse">
                总支付金额:<span class="f-fr2"  style="color:#F00">￥${total}元</span>
            </li>
            <#list orders as order>
                <li class="mui-table-view-cell" index="${order_index}" >
                    <div class="mui-collapse-content">
                        <p><span style="">订单${order_index + 1}：</span>${order.orderSn}<span class="f-fr2" style="color: #e12f45;">￥${order.totalAmount}元</span></p>
                    </div>
                </li>
            </#list>

            <#list payTypeList as payType>
                <li class="mui-table-view-cell paytypeli" index="${payType_index}" id="${payType["sign"]}" >
                    <div class="mui-collapse-content">
                        <input type="radio" value="${payType["sign"]}" class="radio" name="payType">
                        <label><img width="125" height="28" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
                    </div>
                </li>
            </#list>
            <li class="mui-table-view-cell">请支付 <span class="f-fr2" style="color:#E4393C; font-weight: bold;">￥${total}元</span></li>
        </ul>

    <div class="mui-content-padded">

        <button class="mui-btn mui-btn-positive mui-btn-block mui-btn-primary" id = "nextBtn" >下一步</button>
    </div>
    <div id="outLine" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; margin-top: 10px; font-size: 12px"></div>
    <form id="paymentInfo" method="POST" style="display: none" action="">

    </form>
    <input id="orderSn" name="orderSn" type="hidden" value="${orderSn}" /><br>
    <input id="payType" name="payType" type="hidden" value="" />
</div>
<#include "app/ghdj/tools.ftl">
<script>
    (function(mui, doc) {
        mui.init();
        var pays = {};
        var isPayChannelOK = false;
        if(ismobile) {
            mui.plusReady(function () {
                // 获取支付通道
                plus.payment.getChannels(function(channels){
                    isPayChannelOK = true;
                    jQuery.each(channels, function(i, channel){
                        var txt = "id:"+channel.id+",,";
                        txt += "description:" + channel.description + ",";
                        txt += "serviceReady:" + channel.serviceReady + ";";
                        console.log(txt);
                        pays[channel.id] = channel;
                    });
                    jQuery.each(jQuery(".paytypeli"), function(index, paytypeli){

                        var paytype = jQuery(paytypeli).attr("id");
                        console.log("paytype : " + paytype);
                        var canSupport = false;
                        jQuery.each(channels, function(i, channel){
                            if(paytype == channel.id){
                                canSupport = true;
                                return false;//break
                            }
                        });
                        console.log("canSupport : " + canSupport);
                        if(!canSupport){
                            //jQuery(paytypeli).hide();
                        }
                    });
                },function(e){
                    outSet("获取支付通道失败："+e.message);
                });

                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }

        $("#nextBtn").bind("tap",function(){
            if (jQuery("#payType").val()  == ''){
                popAlert('请选择支付方式!');
                return;
            }
            showWaiting();
            var action = "${base}/payment/show?whichclient=whichapp";

            jQuery("#paymentInfo").prop("action",action + "&onlinePayAmount=${total}&orderSn=" + jQuery("#orderSn").val() + "&payType=" + jQuery("#payType").val() + "&r="+Math.random());

            jQuery("#paymentInfo").submit();
            closeWaiting();
        });
    }(mui, document));

    jQuery(function(){
        jQuery(".mui-table-view>li").click(function (){
            var _$this = jQuery(this);
            if(_$this.children("div").children(":radio").length == 0){
                return;
            };
            var index = _$this.attr('index');
            var id = _$this.attr('id');
            //var temp = "input[name='payType']:eq("+index+")";
            //var obj = jQuery(temp);
            //var payType = jQuery(temp).val();
            jQuery("#payType").val(id);

//            jQuery("input[name='payType']").each(function(idx, ele){
//                jQuery(this).prop("checked",(index == idx));
//            });

        });

    });

</script>
</body>
</html>