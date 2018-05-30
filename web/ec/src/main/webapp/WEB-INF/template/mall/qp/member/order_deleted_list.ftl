<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>已删除订单</title>
<meta name="description" content="已删除订单">
<meta name="Keywords" content="已删除订单">
<link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"order_deleted_list"
};
</script>
</head>
<body>
<#include "mall/qp/shortcut.ftl"/>
<#include "mall/qp/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 150px;margin-right: 10px;}
.right {float: right;width: 830px;}

.widepage .right {width: 980px;}

.right a:link, .right a:visited {color: #005ea7;}
.right a:link, .right a:visited {color: #005ea7;}
.ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}

/**order-mt**/
.right .order-mt {border: 1px solid #e6e6e6;border-bottom: 2px solid #c30000;height: 33px;line-height: 33px;margin-bottom: 10px;margin-top: 10px;}
.right .order-mt h2 {position: relative;}
.right .order-mt h2 {color: #cc0000;padding-left: 16px;float: left;}
.right .order-mt .extra {float: right;padding-right: 15px;}
.right .order-mt .extra a {display: inline-block;position: relative;margin-right: 10px;}
.right .order-mt .extra a {margin-right: 10px;display: inline-block;vertical-align: middle;}

/**order01**/
#order01 {margin-top: -10px;line-height: 20px;}
#order01 .mc {padding: 10px 20px;line-height: 25px;border: 1px solid #e6e6e6;border-top: none;}
#order01 dl, .filter-item .item-con {overflow: hidden;}
#order01 dt {width: 60px;text-align: right;}
#order01 dt, #order01 dd {float: left;}
#order01 dd {margin-right: 25px;color: #999;}
#order01 dt, #order01 dd {float: left;}

</style>

<style>
.ftx-04 {color: #ff6600;}

#orderlist, #orderlist .mc, #orderlist .tb-order, #orderlist .mt {overflow: visible;}
#orderlist .mt {border-bottom: 2px solid #FFCCAA;padding-left: 6px;}
#orderlist .taborder li {position: relative;float: left;z-index: 2;}
#orderlist .taborder .tyies-t {line-height: 31px;background: url(${base}/static/mall/img/tab01.png) 0 -32px;height: 31px;padding-left: 15px;padding-right: 47px;position: relative;z-index: 3;}
#orderlist .taborder li b,#orderlist .taborder li s {height: 31px;background: url(${base}/static/mall/img/tab01.png);position: absolute;}
#orderlist .taborder li s {top: 0;left: 0;width: 3px;}
#orderlist .taborder li b {width: 31px;background-position: -3px 0;top: 0;right: 0;}
#orderlist .mt .extra {width: 447px;}
#orderlist .mt .extra {color: #666666;}
#orderlist .mt .extra {float: right;}
#orderlist .search {float: right;}
#orderlist .search .text {padding: 4px;margin-right: 3px;border: 1px solid;border-color: #aaa #ddd #ddd #aaa;width: 190px;}
#orderlist .search .bti {background: url(${base}/static/mall/img/use.gif) 0 -42px;width: 50px;height: 25px;margin-top: -1px;}
#orderlist .search .bti {border: none;}

#orderlist .mc {border: 1px solid #e6e6e6;border-top: none;}
#orderlist .tb-order {overflow: hidden;margin-right: -1px;margin-left: -1px;margin-bottom: -1px;}
#orderlist .tb-order table {border-collapse: collapse;border: solid #E6E6E6;border-width: 0 1px 1px 1px;}
#orderlist .tb-order th{background:#f7f7f7 url(${base}/static/mall/img/tb-th.bg.gif) repeat-x;height:31px;color:#666666;font-weight:normal;}
#orderlist .tb-order td{border:solid #E6E6E6;border-width:1px 0 0 1px;padding:5px 4px;text-align:center}
#orderlist .tb-order td.td-02 {background: #fffdee;color: #666666;padding-top: 5px;}

#orderlist .tb-order .tr-th {background: #f9f9f9;}
#orderlist .tb-order .tr-th td{text-align:left}
#orderlist .tr-th td,#orderlist .tr-split td{padding-top:4px;padding-bottom:4px;}
#orderlist .tr-th span {display: inline-block;margin-right: 10px;overflow: hidden;vertical-align: middle;height: 24px;line-height: 23px;float: left;}
#orderlist .tr-th .tcol1{width:225px;color:#666666}
#orderlist .tr-th .tcol2{/*width:130px;*/color:#666666;margin:0;}

#orderlist .tr-td td {vertical-align: top;padding-top: 10px;}
#orderlist .tr-td .img-list {width: 280px;overflow: hidden;/* margin-bottom: 4px; */}
#orderlist .tr-td .img-list .img-box{border:1px solid #e1e1e1;float:left;margin-right:4px;margin-bottom:4px}
#orderlist .tr-td .img-list .img-box:hover{border-color: #e5ca84}
#orderlist .tr-td .u-name{width:80px;overflow:hidden;word-break:break-all;word-wrap:break-word;}
#orderlist .tr-td .cellphone-icon {display: block;width: 58px;height: 16px;margin: 5px auto 0;line-height: 100px;overflow: hidden;background: url(${base}/static/mall/img/cellphone.png) no-repeat;}
#orderlist .tr-td a.btn-again {background: url(${base}/static/mall/img/use.gif);display: block;height: 21px;line-height: 100px;margin: 3px auto 0;overflow: hidden;width: 72px;}
#orderlist .tr-td a.btn-again:hover{background-position:0 -21px}

/**pagin**/
.pagin a,.pagin span {float: left;height: 20px;padding: 3px 10px;border: 1px solid #ccc;margin-left: 2px;font-family: arial;line-height: 20px;font-size: 14px;overflow: hidden;-moz-border-radius: 5px;-webkit-border-radius: 5px;}
.pagin .text,.pagin .current {border: 0;padding: 4px 11px;}
.pagin a:link,.pagin a:visited {color: #005aa0;}
.pagin a:hover,.pagin a:active {background: #005aa0;color: #fff;text-decoration: none;}
.pagin .current,.pagin .current:link,.pagin .current:visited {color: #f60;font-weight: 700;}
.pagin b {display: block;position: absolute;top: 9px;width: 5px;height: 9px;background-image: url(${base}/static/mall/img/bg5.gif);background-repeat: no-repeat;overflow: hidden;}
.pagin .prev,.pagin .next,.pagin .prev-disabled,.pagin .next-disabled {position: relative;padding-top: 5px;height: 18px;line-height: 18px;}
.pagin .prev-disabled,.pagin .next-disabled {color: #ccc;cursor: default;}
.pagin .prev,.pagin .prev-disabled {padding-left: 12px;}
.pagin .prev b {left: 3px;background-position: -68px -608px;}
.pagin .prev-disabled b {left: 3px;background-position: -80px -608px;}
.pagin .next,.pagin .next-disabled {padding-right: 12px;}
.pagin .next b {right: 3px;background-position: -62px -608px;}
.pagin .next-disabled b {right: 3px;background-position: -74px -608px;}
.pagin-m a,.pagin-m span {height: 14px;line-height: 14px;font-size: 12px;}
.pagin-m b {top: 5px;}
.pagin-m .prev,.pagin-m .next,.pagin-m .prev-disabled,.pagin-m .next-disabled {padding-top: 3px;height: 14px;line-height: 14px;*line-height: 16px;}

</style>

<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;个人主页<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
	<div class="left">
		<#include "mall/qp/member/menu.ftl"/>
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
<#include "mall/qp/service.ftl"/>
<#include "mall/qp/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });
    });
</script>
</body>
</html>