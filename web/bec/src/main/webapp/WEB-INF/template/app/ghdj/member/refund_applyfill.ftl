<!DOCTYPE html>
<html>
<head>
<#include "app/ghdj/head.ftl">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style>
        .mui-margin {
            width: 100%;-webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
        }
        .mui-input-group label {
            width: 30%;

            font-size: 14px;
        }
        .mui-input-row label {
            font-family: "微软雅黑";
            float: left;
            width: 40%;
            padding: 10px 15px;
            padding-right: 10px;
            font-size: 15px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            color: #444;
        }
        .mui-input-row .mui-btn {
            font-family: "微软雅黑";
            line-height: 1.1;
            float: right;
            width: 60%; margin-right: 3%;
            padding: 10px 5px 10px 0px;
            margin-top: 5px;
            font-size: 14px;
            -webkit-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
        }
        .mui-input-row .mui-textarea {
            font-family: "微软雅黑";
            line-height:1.7;
            float: right;
            width: 60%; margin-right: 3%;
            padding:  0px 0px 10px 5px;-webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            font-size: 14px;
        }
        .ftx04{
            font-family: "微软雅黑";
            width: 60%;
            float: left;
            padding: 10px 0px 5px 5px;-webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            color: #555;
            font-size: 14px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
<#--     commit, confirmed, returned, shipped,                      unrefund,    refunded, success,fail
退款状态（已提交、 已受理、    已退回、   已发货, 等待卖家收货、卖家已收货, 等待退款、已退款,等待买家确认、已完成）,失败-->
    <#if refund.status == "commit">
        <h1 class="mui-title">等待卖家处理退款申请</h1>
    <#elseif  refund.status == "returned" >
        <h1 class="mui-title">卖家驳回退款申请</h1>
    <#elseif refund.status == "confirmed">
        <h1 class="mui-title">卖家同意退款申请</h1>
    <#elseif refund.status == "refunded">
        <h1 class="mui-title">已退款，请查收</h1>
    <#elseif "${refund.status}"== "shipped"> 
        <h1 class="mui-title">等待卖家收货</h1>
    <#elseif "${refund.status}"== "unrefund">
        <h1 class="mui-title">等待卖家退款</h1>
    <#elseif "${refund.status}"== "success">
        <h1 class="mui-title">退款成功</h1>
    </#if>

</header>



<div class="mui-content mui-margin">
    <form id='myform' class="mui-input-group">
        <input type="hidden" name="orderSn" value="${order.orderSn}"/>
        <input type="hidden" name="shopId" value="${order.shopId}"/>
        <input type="hidden" name="amount" value="${order.totalAmount + order.deliveryFee}"/>
        <div class="mui-input-row">
            <label>订单编号:</label>
            <span class="ftx04"><a name="orderIdLinks" id="idUrl${order.orderSn}" href="${base}/order/view/${order.id}.html?whichclient=whichapp" style="color: #555;">${order.orderSn}</a></span>
        </div>
        <div class="mui-input-row">
            <label>退款编号:</label>
            <span class="ftx04">${refund.id}</span>
        </div>
        <div class="mui-input-row">
            <label>申请退款时间:</label>
            <span class="ftx04">${refund.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
        </div>
        <div class="mui-input-row">
            <label>退款类型:</label>
            <span class="ftx04"><#if "${refund.type}"== "unreceived">未收货  <#else>已收货</#if></span>
        </div>
        <div class="mui-input-row">
            <label>需要退款金额:</label>
            <span class="ftx04">${order.totalAmount?string(priceCurrencyFormat)}</span>
        </div>

        <div class="mui-input-row">
            <label>退款原因:</label>
            <span class="ftx04">${refund.reason}</span>
        </div>
        <div class="mui-input-row">
            <label>退款说明:</label>
            <span class="ftx04">${refund.info}</span>
        </div>
        <#if  refund.status == "returned" >
            <div class="mui-input-row">
                <label>驳回原因:</label>
                <span class="ftx04">${refundLog.info}</span>
            </div>
        <#elseif refund.status == "unrefund" >
            <div class="mui-input-row">
                <label>商家收货说明:</label>
                <span class="ftx04">${refundLog.info}</span>
            </div>
        <#elseif refund.status == "refunded" >
            <div class="mui-input-row">
                <label>商家退款说明:</label>
                <span class="ftx04">${refundLog.info}</span>
            </div>
        </#if>

    </form>
    <div id="outLine" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; margin-top: 10px; font-size: 12px"></div>
    <div class="mui-content-padded">
    <#if size gte 3>
        <#if refund.status == "commit">
            <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" style="z-index:1; display: block; width:100%; float:right;  padding: 8px 0;" disabled="true"  >等待卖家处理</button>
        <#elseif "${refund.status}"== "returned">
            <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" style="z-index:1; display: block; width:100%; float:right;  padding: 8px 0;" onclick="back();">被驳回次数达到上限，请返回</button>
        <#elseif "${refund.status}"== "refunded">
            <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" style="z-index:1; display: block; width:100%; float:right;  padding: 8px 0;" onclick="onNext(0);">确认收款</button>
        <#elseif "${refund.status}"== "confirmed">
            <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" style="z-index:1; display: block; width:100%; float:right;  padding: 8px 0;" onclick="fill_address();">下一步</button>
        <#else>
            <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" style="z-index:1; display: block; width:100%; float:right;  padding: 8px 0;" onclick="onNextBack();"> 返回</button>
        </#if>
    <#else>
        <#if refund.status =="confirmed" && refund.type == "received">
            <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" style="z-index:1; display: block; width:100%; float:right;  padding: 8px 0;" onclick="fill_address();">下一步</button>
        </#if>
        <#if refund.status == "commit">
            <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" style="z-index:1; display: block; width:100%; float:right; padding: 8px 0;" disabled="true">等待卖家处理</button>
        <#elseif refund.status == "returned">
            <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" style="z-index:1; display: block; width:100%; float:right;  padding: 8px 0;" onclick="nextRefund();">请求被驳回，请重新申请</button>
        <#elseif refund.status == "refunded">
            <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" style="z-index:1; display: block; width:100%; float:right;  padding: 8px 0;" onclick="onNext(0);">确认收款</button>
        <#else>
            <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" style="z-index:1; display: block; width:100%; float:right;  padding: 8px 0;" onclick="onNextBack();">返回</button>
        </#if>
    </#if>
    </div>


</div>

<#include "app/ghdj/tools.ftl">
<script>

    function outLine(s){
        var _dout_ = document.getElementById("outLine");

        _dout_.innerText += s + "\n";
        (0==_dout_.scrollTop)&&(_dout_.scrollTop=1);//在iOS8存在不滚动的现象
    }
    function outSet(s){
        var _dout_ = document.getElementById("outLine");
        _dout_.innerText=s+"\n";
        (0==_dout_.scrollTop)&&(_dout_.scrollTop=1);//在iOS8存在不滚动的现象
    };
    function fill_address(){
        jumpto(fullpath + '/member/refund/refundsuccess/'+'${refund.orderSn}'+'.html?whichclient=whichapp');
    }
    function nextRefund(){
        jQuery.ajax({
            type: "POST",
            url: "${base}/member/refund/refundurl/${refund.orderSn}",
            datatype: 'json',
            success: function(data) {
                var size = data.size;
                if(size>3){
                    outSet("驳回三次，不能进行此操作");
                    return false;
                }else{
                    jumpto(fullpath + '/member/refund/apply/'+'${refund.orderSn}'+'.html?whichclient=whichapp');
                }
            }
        });
    }
    function back(){
        jumpto(fullpath + '/order/list?whichclient=whichapp&orderType_=1');
    }
    var clickAllow = "true";
    function onNext(a){
        if(a==0) {
            if (clickAllow == "true") {
                clickAllow = "false";
                jQuery.ajax({
                    type: "POST",
                    url: "${base}/member/refund/applyfillupdate/" + "${refund.id}",
                    datatype: 'json',
                    success: function (data) {
                        jumpto(fullpath + '/order/list?whichclient=whichapp&orderType_=1');
                    }
                });
            } else {
                jumpto(fullpath + '/order/list?whichclient=whichapp&orderType_=1');
            }
        }
    }

    /**
     * 返回退款列表
     * @return
     */
    function onNextBack(){
        jumpto(fullpath + '/order/list?whichclient=whichapp&orderType_=1');
    }

    (function(mui, doc) {

        mui.init({  });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }

        mui.back = function(){
            jumpto(fullpath + '/order/list?whichclient=whichapp&orderType_=1');
        };
    }(mui, document));
</script>
</body>
</html>