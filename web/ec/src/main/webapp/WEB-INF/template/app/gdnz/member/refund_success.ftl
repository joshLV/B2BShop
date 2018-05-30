<!DOCTYPE html>
<html>
<head>
<#include "app/gdnz/head.ftl">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style>
        .mui-margin {
            margin: -5px 5px 0px 5px;
        }

        .mui-input-group label {
            font-family: "微软雅黑";
            width: 30%;
            margin-top: 10px;
            font-size: 14px;
        }

        .mui-input-row label {
            font-family: "微软雅黑";
            line-height: 1.1;
            float: left;
            width: 30%;
            padding: 0px 0px 5px 10px;
            font-size: 14px;
        }

        .mui-input-row .mui-btn {
            font-family: "微软雅黑";
            line-height: 1.1;
            float: right;
            width: 60%;
            padding: 10px 0px 10px 0px;
            margin-top: 10px;
            font-size: 14px;
        }
        .mui-input-row .mui-input {
            font-family: "微软雅黑";
            line-height: 1.1;
            float: right;
            width: 60%;
            padding: 10px 0px 0px 0px;
            font-size: 14px;
        }
        .mui-input-row .mui-textarea {
            font-family: "微软雅黑";
            line-height: 2.2;
            float: right;
            width: 60%;
            padding: 0px 0px 10px 0px;
            font-size: 14px;
        }

        .ftx04 {
            width: 60%;
            float: right;
            padding: 10px 0px 5px 5px;
            font-size: 14px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>

    <#if refund.status == "shipped">
        <h1 class="mui-title">等待卖家收货</h1>
    <#elseif refund.status == "unrefund">
        <h1 class="mui-title">卖家已收货,等待退款</h1>
    <#elseif "${refund.status}"== "refunded">
        <h1 class="mui-title">已退款，请查收</h1>
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
            <span class="ftx04"><a name="orderIdLinks" id="idUrl${order.orderSn}" href="${base}/order/view/${order.id}.html?whichclient=whichapp"><b>${order.orderSn}</b></a></span>
        </div>
        <div class="mui-input-row">
            <label>退款编号:</label>
            <span class="ftx04"><b>${refund.id}</b></span>
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
        <#if "${refund.type}"=="received">
            <#--<div class="mui-input-row">
                <label>收货人:</label>
                <span class="ftx04">${refund.shipName}</span>
            </div>
            <div class="mui-input-row">
                <label>收货地址:</label>
                <span class="ftx04">${refund.shipAddress}</span>
            </div>
            <div class="mui-input-row">
                <label>邮编：</label>
                <span class="ftx04">${refund.shipZipCode}</span>
            </div>
            <div class="mui-input-row">
                <label>收货电话：</label>
                <span class="ftx04">${refund.shipPhone}</span>
            </div>
            <div class="mui-input-row">
                <label>手机号码：</label>
                <span class="ftx04">${refund.shipMobile}</span>
            </div>-->
            <div class="mui-input-row">
                <label>物流公司：</label>
                <span class="ftx04">${refund.logisticsName}</span>
            </div>
            <div class="mui-input-row">
                <label>物流单号：</label>
                <span class="ftx04">${refund.logisticsNo}</span>
            </div>
        </#if>
        <div class="mui-input-row">
            <#if refund.status =="refunded">
                <button  id="findPwdSubmit" type="button" class="mui-btn mui-btn-primary mui-btn-block" style="display: block; width:100%; float:right; padding: 10px 0px 10px 0px;" onclick="onNext(0);">确认收款</button>
            <#else>
                <button  id="findPwdSubmit" type="button" class="mui-btn mui-btn-primary mui-btn-block" style="display: block; width:100%; float:right; padding: 10px 0px 10px 0px;" onclick="onNextBack();">返回</button>
            </#if>
        </div>
    </form>
    <div id="outLine"></div>

</div>

<#include "app/gdnz/tools.ftl">
<script>

    function fill_address(){
        jumpto(fullpath + '/member/refund/refundsuccess/'+'${refund.orderSn}'+'.html?whichclient=whichapp');
    }
    var clickAllow = "true";
    function onNext(a){
        if(a==0) {
            showWaiting();
            if (clickAllow == "true") {
                clickAllow = "false";
                jQuery.ajax({
                    type: "POST",
                    url: "${base}/member/refund/applyfillupdate/" + "${refund.id}",
                    datatype: 'json',
                    success: function (data) {
                        jumpto(fullpath + '/order/list?whichclient=whichapp');
                        closeWaiting();
                    },
                    error:function(data){
                        closeWaiting();
                        popAlert(data.message);
                    }
                });
            } else {
                jumpto(fullpath + '/order/list?whichclient=whichapp');
                closeWaiting();
            }
        }
    }

    /**
     * 返回退款列表
     * @return
     */
    function onNextBack(){
        jumpto(fullpath + '/order/list?whichclient=whichapp');
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
            jumpto(fullpath + '/order/list?whichclient=whichapp');
        };
    }(mui, document));
</script>
</body>
</html>