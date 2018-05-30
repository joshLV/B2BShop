
<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/jd/head.ftl">
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">订单中心</h1>
</header>
<div class="mui-content wrap" style="margin-bottom:50px;">
    <section class="order-con">
        <ul class="order-list">
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p>订单号：${order.orderSn}</p>
                        <p>状态：${orderStatusMapping['${order.orderStatus}']}</p>
                        <p>尊敬的客户，
                            <#if order.orderStatus == 'wait_seller_send_goods' && order.paymentMethodName == '货到付款'>
                                你购买的商品即将发出，请你准备好货款。
                            <#elseif order.paymentStatus == 'unpaid' && order.orderStatus != 'deleted' && order.orderStatus != 'cancel'>
                                我们还未收到该订单的款项，请您尽快付款，如果您已经付款，请务必填写付款确认。<br>该订单会为您保留24小时（从下单之日算起），24小时之后如果还未付款，系统将自动取消该订单。
                            <#elseif order.paymentStatus == 'paid' && order.orderStatus != 'deleted'>
                                你已支付成功，我们会尽快发货，请注意查收。
                            <#elseif order.paymentStatus == 'paid' && order.orderStatus == 'trade_finished' && order.orderStatus != 'deleted'>
                                你已交易完成。
                            <#elseif order.orderStatus == 'cancel' && order.paymentStatus == 'unpaid'>
                                订单已取消！
                            <#elseif order.orderStatus == 'deleted'>
                                你已经删除了你的订单！
                            </#if>
                        </p>
                    </div>
                    <div class="pay-zt">
                        提交订单--------等待付款---------商品出库-----------等待收货----------完成
                    </div>
                </div>
            </li>
            <li>
                <div class="order-box">
                    <ul class="book-list">
                        <li>
                            <a href="#">
                                <div class="order-msg">
                                    <h5 style="text-align:left; font-size:16px; font-weight:bold; border-bottom:1px solid #CCC; padding-bottom:10px;"><b>付款信息</b></h5>
                                    <p >付款方式：${order.paymentMethodName}</p>
                                    <p >商品金额：￥${order.goodsTotalPrice}<span style="margin-left:30px;">运费金额：￥${order.deliveryFee}</span></p>
                                    <p>优惠金额：￥0.00<span style="margin-left:30px;">实际运费：￥${order.deliveryFee}</span></p>
                                    <p>应支付金额：￥${order.goodsTotalPrice}</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </li>
            <li>
                <div class="order-box">
                    <h5 style="text-align:left; margin-left:10px; font-size:16px; font-weight:bold; border-bottom:1px solid #CCC; padding-bottom:10px;">订单信息</h5>
                    <ul class="book-list">
                        <li>
                            <a href="#">
                                <div class="order-msg list_border">
                                    <p class="title"><b>收货人信息</b></p>
                                    <p>收 货 人：${order.shipName}</p>
                                    <p>地    址：${order.shipAddress}</p>
                                    <p>手机号码：${order.shipMobile}</p>
                                    <p>收货电话：${order.shipPhone}</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="order-msg list_border">
                                    <p class="title"><b>支付及配送方式</b></p>
                                    <p>支付方式：${order.paymentMethodName}</p>
                                    <p>运    费：￥${order.deliveryFee}</p>
                                    <p>配送方式：${order.deliveryMethodName}</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="order-msg list_border">
                                    <p class="title"><b>发票信息</b></p>
                                    <p>发票类型：不开发票</p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <div class="order-msg ">
                                <p class="title"><b>商品清单</b></p>
                                <#list goodsList as goods>
                                    <div class="list_sp list_border">
                                        <p>
                                            <span>商品编号:</span><font>${goods.sn}</font>
                                        </p>
                                        <p>
                                            <span style="float:left;">商品图片:</span> <img src="${goods.pic}" style="width:20%; float:left;">
                                        </p>
                                        <p>
                                            <span style="color:#999">商品名称:</span><a href="${base}/item/which/${goods.id}.html">${goods.fullName}</a>
                                        </p>
                                        <p>
                                            <span>商城价:</span><font> ￥${goods.price}</font>
                                        </p>
                                        <p>
                                            <span>商品数量:</span>
                                            <font>
                                                <#list orderItemList as orderItem>
                                                    <#if orderItem.goodsId == goods.id>
                                                        ${orderItem.quantity}
                                                    </#if>
                                                </#list>
                                            </font>
                                        </p>
                                    </div>
                                </#list>
                            </div>
                        </li>
                    </ul>
                </div>
            </li>

        </ul>
    </section>
</div>
<#include "app/jd/tools.ftl"/>
</body>
</html>