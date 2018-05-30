<style>
.ftx-04 {color: #ff6600;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}
</style>
<div id="order-list" class="m mod-main">
	<div class="mt">
		<h3>我的订单</h3>
		<ul class="extra-l">
            <#--Desc:与订单列表页面一致不可以点击只是显示 Auth:zhangqiang Time:2015-11-11 14:02:35  Start  -->
            <#--<li class="fore-1"><a href="${base}/order/list">待付款<em class="ftx03">(${orderFuKuanCount})</em></a></li>-->
            <#--<li class="fore-2"><a href="${base}/order/list">待发货<em class="ftx03">(${orderFaHuoCount})</em></a></li>-->
            <#--<li class="fore-3"><a href="${base}/order/list">待确认收货<em class="ftx03">(${orderConfirmCount})</em></a></li>-->
                <#--Desc:暂时不需要 在我的订单页面可以查看 Auth:zhangqiang Time:2015-11-19 10:24:35  Start  -->
                <#--<li class="fore-1">待付款<em class="ftx03">(${orderFuKuanCount})</em></li>-->
                <#--<li class="fore-2">待发货<em class="ftx03">(${orderFaHuoCount})</em></li>-->
                <#--<li class="fore-3">待确认收货<em class="ftx03">(${orderConfirmCount})</em></li>-->
                <#--Desc:暂时不需要 在我的订单页面可以查看 Auth:zhangqiang Time:2015-11-19 10:24:35  End  -->
            <#--Desc:与订单列表页面一致不可以点击只是显示 Auth:zhangqiang Time:2015-11-11 14:02:35  End  -->
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
                                            <#if orderitem.goodsId??>
										        <a href="${base}/item/${orderitem.goodsId}.html" target="_blank"><img src="${orderitem.pic}@70w_70h.png" title="${orderitem.goodsName}" height="70" width="70"></a>
                                            <#else>
                                            ${orderitem.goodsName}
                                            </#if>
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
								<span class="ftx-03">
                                    ${order.createDate?string("yyyy-MM-dd")}
                                        <br>
                                    ${order.createDate?string("HH:mm:ss")}
                                </span>
							</td>
                            <!-- 订单状态 -->
                            <td>
                                <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                    <strong class="ftx-04 order-statu" state="ddfk">
                                        ${orderStatusMapping['${order.orderStatus}']}
                                    </strong>
                                <#else>
                                    <span class="ftx-03">${orderStatusMapping['${order.orderStatus}']}</span>
                                    <#if '${order.orderStatus}' == 'trade_finished'>
                                        <br>
                                        <div style="padding-top: 3px;">
                                            <a href="${base}/orderRejected/listRejected/${order.id}.html" target="_blank">部分退货</a>
                                        </div>
                                    </#if>
                                </#if>
							</td>
                            <!-- #订单状态 -->
							<td id="operate${order.orderSn}" class="order-doi" width="180">
                                <#if '${order.isRefund }'== 'N'>
                                    <#if '${order.orderStatus}' == 'order_item_exception'>
                                        <span style="color:#fc9836;">订单项异常，请重新购买</span>
                                    <#elseif '${order.orderStatus}' == 'wait_buyer_pay'>
                                        <a class="btn btn-4" target="_blank"
                                           href="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}">
                                            <s></s>付&nbsp;款
                                        </a>
                                    <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                                        <a class="btn btn-4" href="javascript:void(0)" onclick="confirmGoods('${order.id}')">确认收货</a><br/>
                                    <#elseif '${order.orderStatus}' == 'trade_finished'>
                                        <#if '${order.isReview}' == '0'>
                                            <a href="${base}/order/review.html?sn=${order.orderSn}">评价</a><br/>
                                        <#else>
                                            已评价<br/>
                                        </#if>
                                    <#elseif '${order.orderStatus}' == 'unconfirm'>
                                        <a href="${base}/order/popupcancel/${order.id}" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" class="cancleOrder">取消订单</a>
                                    </#if>

                                    <#if (order.paymentMethodName == '在线支付' && order.orderStatus == 'wait_buyer_pay') || (order.paymentMethodName == '货到付款' && order.orderStatus == 'wait_seller_send_goods')>
                                        <a href="${base}/order/popupcancel/${order.id}"
                                           title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" class="cancleOrder">
                                            取消订单
                                        </a>
                                    </#if>

                                    <a target="_blank" href="${base}/order/view/${order.id}.html">查看</a>

                                    <#if '${order.paymentStatus}'== 'paid'>
                                        <a href="javascript:void(0)" onclick="checkurl('${order.orderSn}');">退款</a>
                                    </#if>
                                    <#if '${order.paymentStatus}'== 'refunding'>
                                        <a href="javascript:void(0)" id="${order.orderSn}"  onclick="confirmReceivables('${order.orderSn}');">确认收款</a>
                                    </#if>

                                    <#if ('${order.orderStatus}' == 'wait_buyer_confirm_goods' || '${order.orderStatus}' == 'trade_finished') && order.paymentMethodName == '在线支付'>
                                        <br/>
                                        <a href="javascript:;" onclick="showExpressLog('${order.id}');">物流信息</a>
                                    </#if>
                                </#if>

                                <!-- 20151210 退款单处理 -->
                                <#if '${order.isRefund }'== 'Y'>
                                    <#if '${order.orderRefund.status}'== 'refunded'>
                                        <a href="javascript:void(0)" id="${order.orderSn}"  onclick="confirmReceivables('${order.orderSn}');">确认收款</a>
                                    <#else>
                                        <#if (order.refundCount &gt; 1 || order.refundCount == 1 ) && order.refundCount&lt;3 && !(order.currRefundId??) >
                                            <a href="javascript:void(0)" onclick="nextRefund('${order.orderSn}');">申请</a>
                                        </#if>
                                        <#if order.refundCount == 3 && !(order.currRefundId??)>
                                            <#if '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                                                <a href="javascript:void(0)" onclick="confirmGoods('${order.id}')">确认收货</a><br/>
                                            <#elseif '${order.orderStatus}' == 'trade_finished'>
                                                <#if '${order.isReview}' == '0'>
                                                    <a href="${base}/order/review.html?sn=${order.orderSn}">评价</a><br/>
                                                <#else >
                                                    已评价<br/>
                                                </#if>
                                            </#if>
                                        </#if>
                                        <a href="javascript:void(0)" onclick="refundList('${order.orderSn}');">退款单</a>
                                    </#if>
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
<script type="text/javascript">
    /**
     * 确认收货
     * @param orderId 订单Id
     */
    function confirmGoods(orderId) {
        layer.confirm('您确定要收货吗？', {icon: 3, title:'温馨提示'}, function(index) {
            $.ajax({
                type: 'post',
                url: '${base}/order/confirmGoods/' + orderId,
                success: function (data) {
                    if (data.status == 'success') {
                        window.location.reload();
                    }
                }
            });
            layer.close(index);
        });
    }

    /**
     * 取消订单
     * @param orderId 订单Id
     */
    function cancleOrder(orderId,reason) {
        $("#orderpay").colorbox.close();
        $.ajax({
            type: 'post',
            url: '${base}/order/cancle/' + orderId + '/'+encodeURI(encodeURI(reason)),
            success: function (data) {
                if (data.status == 'success') {
                    window.location.reload();
                } else {
                    layer.alert(data.message, {icon: 2, title: "温馨提示"});
                    window.location.reload();
                }
            }
        });
    }

    function cancleOrderError(){
        $("#orderpay").colorbox.close();
    }

    /**
     * 删除订单
     * @param orderId
     */
    function deleteOrder(orderId) {
        layer.confirm('您确定要删除订单吗？', {icon: 3, title:'温馨提示'}, function(index) {
            $.ajax({
                type: 'post',
                url: '${base}/order/delete/' + orderId,
                success: function (data) {
                    if (data.status == 'success') {
                        window.location.reload();
                    }
                }
            });
            layer.close(index);
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
        layer.confirm('您确定要收取退款吗？', {icon: 3, title:'温馨提示'}, function(index) {
            if (clickAllow == "true") {
                clickAllow = "false";
                $.ajax({
                    type: 'post',
                    url: '${base}/member/refund/receivableupdate/' + orderSn + '.html',
                    success: function (data) {
                        if (data.status == 'success') {
                            location.reload();
                        } else {
                            clickAllow = "true";
                        }
                    }
                });
            }
            layer.close(index);
        });
    }


    /**
     * 退款单
     * @param orderSn
     */
    function refundList(orderSn){
        window.location.href ="${base}/member/refund/list.html?orderSn=" + orderSn;
    }

    /**
     * 显示物流信息
     * */
    function showExpressLog(orderId){
        var load=layer.load();
        //$("#expressLog").html("");
        //$("body").append("<div id='mask'></div>");
        //$("#mask").addClass("mask").fadeIn("slow");
        //$("#LoginBox").css("top",$(document).scrollTop()+150+"px");
        //$("#LoginBox").fadeIn("slow");
        $.ajax({
            url:"${base}/order/getExpressLog/"+orderId,
            type:'post',
            success:function(data){
                layer.close(load);
                if( data.status == 'success' ){
                    var html = '';
                    $.each(data.list,function(k,v){
                        html += '<li><h2>运单'+(k+1) + '：' + v.no +'</h2></li>';
                        var expressLog = JSON.parse(v.expressLog);
                        if(expressLog.Success==true && (expressLog.Reason=='' || expressLog.Reason == undefined)){
                            if(expressLog.Traces!=""){
                                $(expressLog.Traces).each(function(index,obj){
                                    color="black";
                                    if (index==(expressLog.Traces.length-1)){
                                        color="red";
                                    }
                                    html +="<li style=\"line-height:20px;\" class=\""+color+"\">"+obj.AcceptTime+"&nbsp;&nbsp;&nbsp;&nbsp;"+obj.AcceptStation+"</li>";
                                });
                            }
                            //$("#expressLog").html(html);

                        }else{
                            //var html="<li class=\"red\">"+expressLog.message+"</li>";
                            //$("#expressLog").html(html);
                            if(expressLog.Reason=='' || expressLog.Reason == undefined){
//                                layer.alert(expressLog.message,{icon: 7});
                                html += expressLog.message;
                            }else{
//                                layer.alert(expressLog.Reason,{icon: 7});
                                html += expressLog.Reason;
                            }
                        }
                        html += '<li>&nbsp;</li>'
                    });

                    if(html!=''){
                        layer.open({
                            title : '物流信息详情',
                            type:1,
                            skin: 'layui-layer-rim', //加上边框
                            area: ['650px', '400px'], //宽高
                            shadeClose: true,
                            content: '<ul style="padding:10px;">'+html+'</ul>'
                        });
                    }
                }else{
                    layer.alert(data.message,{icon: 7});
                }
            }
        });
    }


    /**
     * 退款单驳回
     * @param orderSn 退款单号
     */
    function nextRefund(orderSn){
        $.ajax({
            type: "POST",
            url: "${base}/member/refund/refundurl/"+orderSn,
            datatype: 'json',
            success: function(data) {
                var size = data.size;
                if(size>=3){
                    layer.msg('驳回三次，不能进行此操作', {icon: 2});
                    return false;
                }else{
                    window.location.href="${base}/member/refund/apply/"+ orderSn +".html";
                }
            }
        });
    }

</script>