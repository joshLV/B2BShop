<!DOCTYPE html>
<html>
<head>
<#include "app/jd/head.ftl">
</head>
<body>
<#assign path="mall/nsc" />
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left"">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        我的订单
    </div>
</header>
<div class="mui-content" style="padding-bottom:50px;">
    <div class="myorder">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="14%">订单<br/>信息</td>
                <td width="11%">收货人</td>
                <td width="20%">应付金额</td>
                <td width="23%">时间</td>
                <td width="10%">状态</td>
                <td width="22%">操作</td>
            </tr>
            <#list orderList as order>
            <tbody id="tb-order-${order.id}" class="parent-1637764313">
                <tr>
                    <td colspan="6">
                        订单编号: <a name="orderIdLinks" id="idUrl${order.orderSn}"
                                 href="${base}/order/view/${order.id}.html?whichclient=whichapp">${order.orderSn}</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>
                            <#list orderItemList as orderitem>
                                <#if order.orderSn == orderitem.orderSn>
                                <a href="${base}/order/view/${order.id}.html?whichclient=whichapp" >
                                    <img src="${orderitem.pic}" title="${orderitem.goodsName}" width="100%">

                                </a>
                                <#break >
                                </#if>
                            </#list>
                        </p>
                        <p><a href="#" style="color:#06F; margin-left:3px;">${order.shipName}</a></p>
                        <p>商品编号：005</p>
                    </td>
                    <td>***</td>
                    <td>
                        <p>￥${order.totalAmount}</p>
                        <p>${order.paymentMethodName}</p>
                    </td>
                    <td>
                        <p>${order.createDate?string("yyyy-MM-dd")} </p>
                        <p>${order.createDate?string("HH:mm:ss")}</p>
                    </td>
                    <td>
                        <p>
                            <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                <strong class="ftx-04 order-statu"
                                        state="ddfk">${orderStatusMapping['${order.orderStatus}']}</strong>
                            <#else>
                                <span class="ftx-03">${orderStatusMapping['${order.orderStatus}']}</span>
                            </#if>
                        </p>
                    </td>
                    <td>
                        <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                            <!--p><a class="btn btn-4" target="_blank"
                               href="${base}/payment?whichclient=whichapp&orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}"><s></s>付&nbsp;款</a><br></p-->
                        <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                            <p><a href="javascript:void(0)" onclick="confirmGoods('${order.id}')">确认收货</a><br/></p>
                        <#elseif '${order.orderStatus}' == 'trade_finished'>
                            <p><a href="${base}/order/review.html?sn=${order.orderSn}">评价</a><br/></p>
                        </#if>
                        <p><a href="${base}/order/view/${order.id}.html?whichclient=whichapp">查看</a></p>
                        <#if (order.paymentMethodName == '在线支付' && order.orderStatus == 'wait_buyer_pay') || (order.paymentMethodName == '货到付款' && order.orderStatus == 'wait_seller_send_goods')>
                            <p><a href="javascript:void(0)" onclick="cancleOrder('${order.id}')">取消订单</a></p>
                        </#if>
                        <#if '${order.paymentStatus}'== 'paid'>
                            <p><a href="javascript:void(0)" onclick="checkurl('${order.orderSn}');">退款</a></p>
                        </#if>
                        <#if '${order.paymentStatus}'== 'refunding'>
                            <p><a href="javascript:void(0)" id="${order.orderSn}"  onclick="confirmReceivables('${order.orderSn}');">确认收款</a></p>
                        </#if>
                        <#if '${order.paymentStatus}'== 'refunded'>
                            <p><a href="javascript:void(0)"target="_blank">已退款</a></p>
                        </#if>
                    </td>
                </tr>
            </tbody>
            </#list>

        </table>
    </div>
    <div class="mui-content-padded2" style=" margin-left:10px;">
        <ul class="mui-pagination">
        <#if pager.totalCount != 0>
        <#if pager.pageNumber == 1>
            <li class="mui-previous mui-disabled"><a href="#">上一页</a></li>
        <#else>
            <li class="mui-previous">
                <a href="${base}/order/list.html?whichclient=whichapp&pageNumber=${pager.pageNumber - 1}"><span>上一页</span></a>
            </li>
        </#if>
        <#list 1..pager.pageCount as n>

        <#if pager.pageNumber == n>
        <li class="mui-active">
            <a href="#">${n}</a>
        </li>
        <#else>
        <li>
            <a href="${base}/order/list.html?whichclient=whichapp&pageNumber=${n}">
                ${n}
            </a>
        </li>
        </#if>

        </#list>
        <#if pager.pageNumber == pager.pageCount>
            <li class="mui-next mui-disabled">
                <a href="#">下一页</a>
            </li>
        <#else>
            <li class="mui-next">
                <a href="${base}/order/list.html?whichclient=whichapp&pageNumber=${pager.pageNumber + 1}" class="demo">
                    下一页
                </a>
            </li>
        </#if>
        <#else>
            <div class="noRecord">你还没有订单！</div>
        </#if>
        </ul>
    </div>
</div>
<#include "app/jd/tools.ftl">
<script>
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
                    if(type="unreceived"){
                        if(s == 'commit' || s == 'confirmed'||s == 'unrefund' || s == 'returned'){
                            jumpto("${base}/member/refund/applyfillwl/" + orderSn+ ".html");
                        } else {
                            jumpto("${base}/member/refund/apply/" + orderSn + ".html");
                        }
                    }
                    if(type="received"){
                        if(s == 'commit' ||s == 'returned'){
                            jumpto("${base}/member/refund/applyfillwl/" + orderSn+ ".html");
                        } else {
                            jumpto("${base}/member/refund/refundsuccess/" + orderSn + ".html");
                        }
                    }
                }else{
                    jumpto("${base}/member/refund/apply/" + orderSn + ".html");
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
</body>
</html>