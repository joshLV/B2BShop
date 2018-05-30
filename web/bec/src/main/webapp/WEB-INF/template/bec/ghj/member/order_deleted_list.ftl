<#escape x as x?html>
	<#include "bec/ghj/header.ftl"/>
<div id="container">
	<#include "bec/ghj/top.ftl"/>
	<div class="content">
		<div class="breadcrumb">
			<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;个人主页<span></span></span>
		</div><!--breadcrumb end-->
	</div>
<div class="content">
	<div class="left">
		<#include "mall/gwq/member/menu.ftl"/>
	</div><!--left end-->
	<div class="right">
		<div class="order-mt">
			<h2>已删除订单</h2>
		</div>
		<div class="m" id="orderlist">
			<div class="mc">
				<div class="tb-order">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tbody>
							<tr>
								<th width="286">订单信息</th>
								<th width="80">收货人</th>
								<th width="110">应付金额</th>
								<th width="100">下单时间</th>
								<th width="100">订单状态</th>
								<th width="128">操作</th>
							</tr>
						</tbody>
                    <#list orderList as order>
						<tbody id="tb-order-${order.id}" class="parent-1637764313">
							<tr class="tr-th">
								<td colspan="6">
									<span class="tcol1">
										订单编号: 
										<a name="orderIdLinks" id="idUrl${order.orderSn}" target="_blank"
                                           href="${base}/order/view/${order.id}.html">${order.orderSn}</a>
									</span>
								</td>
							</tr>
							<tr id="track${order.id}" oty="0,4" class="tr-td">
								<td>
                                    <div class="img-list">
                                        <#list orderItemList as orderitem>
                                            <#if order.orderSn == orderitem.orderSn>
                                                <#--<#if orderitem_index gt 0>-->
                                                <a href="${base}/item/${orderitem.goodsId}.html" target="_blank" class="img-box"><img src="${orderitem.pic}" title="${orderitem.goodsName}" height="50" width="50"></a>
                                                <#--</#if>-->
                                            </#if>
                                        </#list>
                                    </div>
								</td>
								<td>
									<div class="u-name">${order.shipName}</div>
								</td>
								<td>
                                    ￥${order.totalAmount}<br>${order.paymentMethodName}<br>
								</td>
								<td>
                                    <span class="ftx-03">${order.createDate?string("yyyy-MM-dd")} <br>${order.createDate?string("HH:mm:ss")}</span>
									<input type="hidden" id="datasubmit-${order.id}" value="${order.createDate?string("yyyy-MM-dd")} ${order.createDate?string("HH:mm:ss")}">
								</td>
								<td id="order_status">
                                    <span class="ftx-03 ${order.orderStatus}">${orderStatusMapping['${order.orderStatus}']}</span>
								</td>
								<td id="operate${order.orderSn}" class="order-doi" width="100">
                                    <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                        <a class="btn btn-4" target="_blank" href="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}"><s></s>付&nbsp;款</a><br>
                                        <a target="_blank" href="${base}/order/view/${order.id}.html" >查看</a>
                                        <span>|</span>
                                        <a href="javascript:void(0)" onclick="deleteOrder('${order.id}')">删除</a><br>
                                    <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                                        <a href="javascript:void(0)" onclick="confirmGoods('${order.id}')">确认收货</a><br/>
                                    <#elseif '${order.orderStatus}' == 'trade_finished'>
                                        <a href="${base}/order/review.html?sn=${order.orderSn}">评价</a><br/>
                                    <#else>
                                        <a target="_blank" href="${base}/order/view/${order.id}.html" >查看</a>
                                    </#if>
                                    <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                        <a href="javascript:void(0)" onclick="cancleOrder('${order.id}')">取消订单</a>
                                    </#if>
								</td>
							</tr>
						</tbody>
                    </#list>
					</table>
				</div>
			</div>
		</div>
		<div class="m clearfix hide">
			<div class="pagin fr">
				<!--  <span class="text">共14条记录</span>    <span class="text">共1页</span> -->
				<span class="prev-disabled">上一页<b></b></span>
				<!-- <span class="prev-disabled">首页</span> -->
				<a class="current">1</a>
				<!-- <span class="next-disabled">末页</span>  -->
				<span class="next-disabled">下一页<b></b></span>
    		</div>
		</div>
	    <div class="clr"></div>
	</div><!--right end-->
</div>
</div>
	<#include "bec/ghj/service.ftl"/>
	<#include "bec/ghj/foot.ftl"/>
</#escape>
