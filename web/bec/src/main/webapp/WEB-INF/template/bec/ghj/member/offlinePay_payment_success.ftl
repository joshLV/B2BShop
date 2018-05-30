<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
    <#include "bec/ghj/top2.ftl"/>
<style xmlns="http://www.w3.org/1999/html">
    .orderbody .mc{ border-bottom: 0;}
    .banking{border-bottom: 0;margin: 0px 20px;}
</style>
<div class="main f-cb">
    <h1 class="order_tit">支付凭证</h1>
    <div class="order_info">
        <div class="orderbody">
            <div class="mc">
                <s class="icon-succ04"></s>
                <div style="width: 1100px; float: left;">
                    <h3 class="orderinfo">${MESSAGE}</h3>
                    <div class="pay-total">总支付金额：<strong class="ftx-01" >￥${order.totalAmount?number?string("##0.00")}</strong>元<br></div>
                </div>
                <ul class="list-orderinfo">
                    <li class="li-last">订单号：${order.orderSn}</li>
                    <#--<li class="li-last">应付金额：<strong class="ftx-01">￥${order.totalAmount?number?string("##0.00")}</strong> 元</li>-->
                </ul>
                <#--<p class="mb-tip">请您在提交订单后<span class="ftx-04">72小时</span>内完成支付，否则订单会自动取消。</p>-->
            </div>
        </div>
        <div class="pay-total"><a style="color: red" href="${base}/order/list?orderType_=${order.orderType}">返回订单</a></div>
    </div>
</div>
    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>