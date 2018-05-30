
<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/jd/head.ftl">
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <h1 class="mui-title">订单详情</h1>
</header>
<div class="mui-content wrap">
    <section class="order-con">
        <ul class="order-list">
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p>订单编号：${order.orderSn}</p>
                        <p>订单金额：￥${order.goodsTotalPrice}</p>
                        <p>订单日期：${order.createDate?string("yyyy-MM-dd HH:mm:ss")}</p>
                    </div>
                    <div class="pay-button">
                        <button class="mui-btn mui-btn-primary" >
                            订单跟踪
                        </button>
                        <button class="mui-btn mui-btn-primary" >
                            满意度评价
                        </button>
                    </div>
                </div>
            </li>
            <#list goodsList as goods>
                <li>
                    <div class="order-box">
                        <ul class="book-list">
                            <li>
                                <a href="${base}/item/${goods.id}.html,1">
                                    <div class="order-msg">
                                        <img src="${goods.pic}_86x86.png" class="img_ware" />
                                        <div class="order-msg">
                                            <p class="title"> ${goods.fullName}</p>
                                            <p class="price">￥${goods.price} <span></span></p>
                                            <p class="order-data">X
                                                <#list orderItemList as orderItem>
                                                    <#if orderItem.goodsId == goods.id>
                                                    ${orderItem.quantity}
                                                    </#if>
                                                </#list>
                                            </p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </#list>
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p class="border-bottom usr-name"> ${order.shipName} <span class="fr">${order.shipPhone}</span> </p>
                        <p class="usr-addr">${order.shipAddress}</p>
                    </div>
                </div> </li>
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p class="border-bottom usr-name">付款方式:<span class="fr">${order.paymentMethodName}</span></p>
                        <p>商品金额:<span class="fr red">￥${order.goodsTotalPrice}</span></p>
                        <p>返现:<span class="fr red">￥0.00</span></p>
                        <p>运费:<span class="fr red">￥${order.deliveryFee}</span></p>
                        <p class="border-bottom">-商品优惠:<span class="fr red">0.00</span></p>
                        <p>应支付金额:<span class="fr red">￥${order.goodsTotalPrice}</span></p>
                    </div>
                </div> </li>
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p class="border-bottom usr-name">配送信息<span class="fr"></span></p>
                        <p>配送方式: ${order.paymentMethodName}</p>
                        <p>送货时间： 2015-06-26</p>
                        <p>配送时间： 9:00-15:00</p>
                    </div>
                </div> </li>
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p class="border-bottom usr-name">发票信息<span class="fr"></span></p>
                        <p>发票类型: 普通发票</p>
                        <p></p>
                        <p>发票抬头: 个人</p>
                        <p></p>
                        <p>发票内容: 明细</p>
                        <p></p>
                    </div>
                </div> </li>
        </ul>
    </section>
</div>
<#include "app/jd/tools.ftl">
</body>
</html>