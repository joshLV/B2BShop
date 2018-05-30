<#escape x as x?html>
<style>
.ftx-04 {color: #ff6600;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}
</style>
<div id="order-list" class="m mod-main">
	<div class="mt">
		<h3>我的订单</h3>
		<ul class="extra-l">
            <li class="fore-1"><a href="${base}/order/list">待付款<em class="ftx03">(${orderFuKuanCount})</em></a></li>
            <li class="fore-2"><a href="${base}/order/list">待发货<em class="ftx03">(${orderFaHuoCount})</em></a></li>
            <li class="fore-3"><a href="${base}/order/list">待确认收货<em class="ftx03">(${orderConfirmCount})</em></a></li>
		</ul>
		<div class="extra-r"><a href="${base}/order/list">查看全部订单</a></div>
	</div>
	<div class="mc">
		<div class="tb-order">
			<table width="100%" cellspacing="0" cellpadding="0" border="0">
				<#list orderList as order>
					<tbody class="fore1">
						<tr>
							<td>
								<div class="img-list">
									<#list orderItemList as orderitem>
										<#if order.orderSn == orderitem.orderSn>
										<a href="${base}/item/${orderitem.goodsId}.html" target="_blank"><img src="${orderitem.pic}" title="${orderitem.goodsName}" height="50" width="50"></a>
										</#if>
									</#list>
								</div>
							</td>
							<td>
								<div class="u-name">
								${order.shipName}
								</div>
							</td>
							<td>
								￥${order.totalAmount}<br>${order.paymentMethodName}
							</td>
							<td>
								<span class="ftx-03">${order.createDate?string("yyyy-MM-dd")} <br>${order.createDate?string("HH:mm:ss")}</span>
							</td>
							<td>
                                <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                    <strong class="ftx-04 order-statu" state="ddfk">${orderStatusMapping['${order.orderStatus}']}</strong>
                                <#else>
                                    <span class="ftx-03">${orderStatusMapping['${order.orderStatus}']}</span>
                                </#if>
							</td>
							<td id="operate${order.orderSn}" class="order-doi" width="100">
                                <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                    <a class="btn btn-4" target="_blank" href="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}"><s></s>付&nbsp;款</a><br>
                                <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                                    <a href="javascript:void(0);" onclick="confirmGoods('${order.id}')">确认收货</a><br/>
                                </#if>
                                    <a target="_blank" href="${base}/order/view/${order.id}.html" >查看</a>
                                <#if (order.paymentMethodName == '在线支付' && order.orderStatus == 'wait_buyer_pay') || (order.paymentMethodName == '货到付款' && order.orderStatus == 'wait_seller_send_goods')>
                                    <a href="javascript:void(0);" onclick="cancleOrder('${order.id}')">取消订单</a>
                                </#if>
                                <#if '${order.paymentStatus}'== 'paid'>
                                    <a href="javascript:void(0)" target="_blank" onclick="checkurl('${order.orderSn}');">退款</a>
                                </#if>
                                <#if '${order.paymentStatus}'== 'refunding'>
                                    <a href="javascript:void(0)" id="${order.orderSn}"  onclick="confirmReceivables('${order.orderSn}');">确认收款</a>
                                </#if>
                                <#if '${order.paymentStatus}'== 'refunded'>
                                    <a href="javascript:void(0)"target="_blank">已退款</a>
                                </#if>
							</td>
						</tr>
					</tbody>
				</#list>
			</table>
			<div class="nocont-box nocont-order" style="display: none;">
				<b class="icon-order"></b>你买的东西太少了，这里空空的，快去挑选合适的商品吧！
			</div>
		</div>
	</div>
</div><!-order-list end-->
</#escape>
<script type="text/javascript">
    /**
     * 确认收货
     * @param orderId 订单Id
     */
    function confirmGoods(orderId) {
        $.ajax({
            type: 'post',
            url: '${base}/order/confirmGoods/' + orderId,
            success: function (data) {
                if (data.status == 'success') {
                    window.location.reload();
                }
            }
        });
    }

    /**
     * 取消订单
     * @param orderId 订单Id
     */
    function cancleOrder(orderId) {
        $.ajax({
            type: 'post',
            url: '${base}/order/cancle/' + orderId,
            success: function (data) {
                if (data.status == 'success') {
                    window.location.reload();
                } else {
                    alert(data.message);
                    window.location.reload();
                }
            }
        });
    }

    /**
     * 删除订单
     * @param orderId
     */
    function deleteOrder(orderId) {
        $.ajax({
            type: 'post',
            url: '${base}/order/delete/' + orderId,
            success: function (data) {
                if (data.status == 'success') {
                    window.location.reload();
                }
            }
        });
    }
    function checkurl(orderSn){
        $.ajax({
            type: "POST",
            url: "${base}/member/refund/refundurl/"+orderSn,
            datatype: 'json',
            success: function(data) {
                var t=data.status;
                var s=data.refundstatus;
                var type=data.type;
                var refundId=data.refundId;
                if (t == "success") {
                    if ((s == 'commit' || s == 'confirmed') || (type == 'unreceived' && s == 'unrefund') || s == 'returned') {
                        if (type == 'received'&&s=='commit') {
                            window.location.href = "${base}/member/refund/applyfillwl/" + orderSn
                                    + ".html";
                        } else {
                            window.location.href = "${base}/member/refund/refundsuccess/" + orderSn
                                    + ".html";
                        }
                    } else {
                        window.location.href = "${base}/member/refund/refundsuccess/" + orderSn + ".html";
                    }
                } else {
                    window.location.href = "${base}/member/refund/apply/" + orderSn + ".html";
                }
            }
        });
    }
    /**
     * 买家确认收到退款
     * @param {string} orderId 订单Id
     */
    var clickAllow = "true";
    function confirmReceivables(orderSn) {
        if(clickAllow=="true"){
            clickAllow = "false";
            $.ajax({
                type: 'post',
                url: '${base}/member/refund/receivableupdate/' + orderSn + '.html',
                success: function (data) {
                    if (data.status == 'success') {
                        location.reload();
                    }else{
                        clickAllow = "true";
                    }
                }
            });
        }
    }
</script>
