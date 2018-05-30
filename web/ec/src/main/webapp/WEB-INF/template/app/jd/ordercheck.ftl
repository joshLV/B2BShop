<!DOCTYPE html>
<html>
<head>
<#include "app/jd/head.ftl">
    <style>
        .checkout-steps {width:80%; margin:-1px; border:3px solid #f60; position:relative;}
        .hide {display: none }
    </style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.location.href =${backurl};">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        订单确认
    </div>

</header>
<div class="mui-content" style="padding-bottom:50px; margin-top:20px;">
    <h5 style="margin-left:10px;">填写并核对订单信息</h5>
    <div class="mui-sh-box <#if receiver==null>step-current</#if>">
        <form id="orderCheckInfo">
            <input type="hidden" id="order_receiverId" name="receiverId" value="${receiver.id}">
            <input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethod.id}">
            <input type="hidden" id="order_deliveryMethodId" name="deliveryMethodId" value="${deliveryMethod.id}">
            <input type="hidden" id="order_cartItemIds" name="cartItemIds" value="<#list cartItemList as cartItem>${cartItem.id},</#list>">
        </form>
        <div <#if receiver==null>class="hide"</#if> >
            <p><b>收货人信息</b> <a href="#" <#if receiver!=null>class="hide"</#if> >[修改]</a></p>
            <p>${receiver.name} &nbsp; ${receiver.mobile} &nbsp;  &nbsp; </p>
            <p>
                ${receiver.areaName} &nbsp;${receiver.address}
            </p>
            <p>支付及配送方式 <a href="#" <#if receiver!=null>class="hide"</#if> >[修改]</a></p>
            <p><b>${paymentMethod.name}</b></p>
            <p>物流快递 <font style="color:#F60;"> 预计 7日内 送达</font> </p>
            <p>商品清单<a href="${base}/cart/list?whichclient=whichapp" style="float:right;">返回修改购物车</a></p>
        </div>
    </div>
    <div class="mui-sp-box">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="700">商品</td>
                <td width="135">商城价</td>
                <td width="104">优惠</td>
                <td width="176">数量</td>
                <td width="361">库存状态</td>
            </tr>
            <#assign total = 0>
            <#assign totalPrice = 0>
            <#list cartItemList as cartItem>
                <#assign total = total+cartItem.quantity>
                <#assign totalPrice = totalPrice+(cartItem.price?number)*cartItem.quantity>
                <tr>
                    <td>
                        <p><img src="${cartItem.pic}_437x374.png" width="100%"></p>
                        <p><a href="/goods/getGoodsDetail/${cartItem.goodsId},1" style="color:#06F; margin-left:3px;">${cartItem.name}</a></p>
                        <p>商品编号：${cartItem.sn}</p></td>
                    <td>￥${cartItem.price}</td>
                    <td>0.00</td>
                    <td>x ${cartItem.quantity}</td>
                    <td skuid="${cartItem.goodsId}">有货</td>
                </tr>
            </#list>
            <tr>
                <td colspan="5" style="text-align:right; line-height:24px; padding-right:5px;">
                    <p>${total} 件商品，总商品金额：<em  id="warePriceId" v="${totalPrice?string('##0.00')}">￥${totalPrice?string('##0.00')}</em></p>
                    <p>运费： <em class="price" id="freightPriceId"> ￥${deliveryFee?string('##0.00')}</em></p>
                    <p>应付总额： <em id="sumPayPriceId" class="price"> ￥${(totalPrice + deliveryFee)?string('##0.00')}</em></p>
                    <button class="mui-btn mui-btn-primary mui-pull-right" onclick="javascript:submit_Order();" style=" margin-top:2px; margin-right:5px; margin-bottom:10px;">
                        提交订单
                    </button>
                </td>
            </tr>
        </table>

    </div>
</div>
<#include "app/jd/tools.ftl">
<script>
    /**
     * 提交订单
     */
    function submit_Order(){

        var receiverId=$("#order_receiverId").val();
        if(receiverId.length==0){
            alert("请选择收货人!");
            return;
        }
        $.ajax({
            type: "post",
            url: "${base}/order/submit?whichclient=whichapp",
            data:$("#orderCheckInfo").formSerialize(),
            dataType: "json",
            success: function (data) {
                if (data.status == "success") {
                    jumpto("${base}/order/view/" + data.orderId + ".html?whichclient=whichapp");
//                    if (data.payType == "online") {
//                        window.location.href =base+"payment?orderSn="+data.orderSn+"&total="+data.totalAmount+"&key="+data.orderId+"&t="+Math.random();
//                    } else if(data.payType == "offline") {
//                        window.location.href = base + "order/view/" + data.orderId + ".html?whichclient=whichapp";
//                    }
                } else {
                    alert(data.message);
                }
            },
            error : function(error) {
                alert("亲爱的用户请不要频繁点击, 请稍后重试...");
                //$("#order-loading").replaceWith(originSubmit);
                //$("#submit_message").html("亲爱的用户请不要频繁点击, 请稍后重试...");
                //$("#submit_message").show();
            }

        });
    }
</script>
</body>
</html>