<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>

<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>

<#if hasSuccesTip == 'true'>
    <script type="text/javascript">
        layer.alert('您已完成支付！',{icon:1, title: '支付完成'},function(index){
            window.location.href = '${base}/order/view/${order.id}';
            layer.close(index);
        });
    </script>
</#if>

<div id="container">
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb" style="position: relative;">
        <div class="breadcrumbs">
            <span>您当前的位置：</span>
            <strong><a href="${base}/order/list?orderType_=${order.orderType}">订单中心</a></strong>
            <span>&nbsp;&gt;&nbsp;订单：${order.orderSn}<span></span></span>
        </div><!--breadcrumb end-->
        <div  class="order_info f-cb" >
        <div class="order_number">
            <div class="order_number_tit">
                <h5>订单号：${order.orderSn}</h5>
                <em>状态：
                    <b>
                        <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                            <strong>${orderStatusMapping['${order.orderStatus}']}</strong>
                        <#else>
                                <span>${orderStatusMapping['${order.orderStatus}']}</span>
                        </#if>
                    </b>
                </em>

                <!-- 20151130 董志忠 参考如下页面保持一致,如有问题请及时联系 -->
                <!-- 参考 \mall\gwq\member\order_detail.ftl -->
                <!-- <a href="${base}/order/popupcancel/${order.id}" class="cancel_right" id="btn_Cancel" >取消</a> -->


                <#if order.isRefund == 'Y'>
                    <em><div style="float: left;">退款状态：</div>
                    <span class="ftx14" style="float: left;">
                        <a href="javascript:void(0)" onclick="refundList('${order.orderSn}');">
                            <#if '${order.orderRefund.status}'== 'success'>
                                退款完成
                            <#elseif '${order.orderRefund.status}'== 'refunded'>
                                待收款
                           <#elseif '${order.orderRefund.status}'== 'confirmed'>
                               退款已受理，等待买家发货
                           <#elseif '${order.orderRefund.status}'== 'returned'>
                               退款未受理
                           <#elseif '${order.orderRefund.status}'== 'commit'>
                               退款申请中...
                           <#else>
                               退款中...
                           </#if>
                        </a>
                    </span>
                    </em>
                </#if>

                <#if order.orderStatus == "wait_buyer_pay">
                    <span id="pay-button-${order.orderSn}">
                        <#--<#if (order.orderType == '1' && isZCSuccess) || order.orderType == '0'>-->
                        <#if order.orderType == '0'>
                        <#--<a myurl="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}"
                           id="pay_${order.id}" href="javascript:void(0)" onclick="judgeAuthReload('${base}','pay',btnClick.bind({},'pay_${order.id}'))"
                           class="pay-button pay_btn" style="display: none;">支付</a>-->
                        <a class="pay-button pay_btn" id="pay_${order.id}" style="margin-left: 0px;display: none;"
                           href="javascript:void(0)" onclick="judgeAuthReload('${base}','pay',btnClick.bind({},'pay_${order.id}'))"
                           myurl="${base}/order/list?orderType_=0"><s></s>去合并支付</a><br>
                        </#if>
                            <#--<a class="btn-4 pay_btn" id="pay_${order.id}" style="margin-left: 0px;display: none;"-->
                               <#--href="javascript:void(0)" onclick="judgeAuthReload('${base}','pay',btnClick.bind({},'pay_${order.id}'))"-->
                               <#--myurl="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}"><s></s>付&nbsp;款</a><br>-->
                    </span>
                    <div class="fr">
                        <div class="toolbar">
                            <#--<a class="pay-button cancle_btn" href="${base}/order/popupcancel/${order.id}" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" id="btn_Cancel"  style="display: none;">-->
                                <#--取消-->
                            <#--</a>-->
                            <#if order.orderType!= '1'>
                                <a class="cancleOrder"
                                   id="btn_Cancel"
                                   href="${base}/order/popupcancel/${order.id}"
                                   title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请"
                                   <#--id="btn_Cancel"-->
                                   style="display: none;">
                                    <span id="cancleOrder2_${order.id}">取消</span>
                                </a>
                                <a class="pay-button cancle_btn"
                                   href="javascript:void(0)"
                                   onclick="judgeAuthReload('${base}','cancleOrder',btnClick.bind({},'cancleOrder2_${order.id}','popup'))"
                                   title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请"
                                   <#--id="btn_Cancel"-->
                                   style="display: none;">
                                    取消
                                </a>
                            </#if>

                        </div>
                    </div>
                </#if>

            </div>
            <!--弹出层时背景层DIV-->
            <div id="fade" class="black_overlay">
            </div>
            <!-- 20151130 董志忠 参考如下页面保持一致,如有问题请及时联系 -->
            <!-- 参考 \mall\gwq\member\order_detail.ftl -->
            <!--
            <div id="MyDiv" class="white_content">
                <div class="close_fade">
                    <h3>订单取消申请</h3><span onclick="CloseDiv('MyDiv','fade')">关闭</span>
                </div>
                <div class="cancel_reason">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>*取消原因:</td>
                            <td><select class="cancel_select"> <option>现在不想购买！</option></select></td>
                        </tr>
                        <tr>
                            <td>*其他原因:</td>
                            <td><textarea class="cancel_textarea">&nbsp;</textarea></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><a href="#" class="cancel_qr">确认取消</a><a href="#">暂不取消</a></td>
                        </tr>
                    </table>
                    <div class="cancel_ts">
                        <p>温馨提示</p>
                        <p style="margin-left:30px;">订单成功取消后无法恢复</p>
                    </div>
                </div>
            </div>
            -->

            <div class="order_number_con">
                尊敬的客户，
                <#if order.isRefund == 'N'>
                    <#if '${order.orderStatus}' == 'wait_buyer_pay'  >
                        ${order.isZCSuccess}
                        <#if order.orderType == '1' >
                            <#if isZCSuccess=='3' >
                                <#if endFlag=='1'>
                                    众筹成功，请您尽快付款！
                                <#elseif endFlag=='0'>
                                    众筹活动结束时我们会及时通知您付款，请耐心等待！
                                </#if>
                            <#elseif isZCSuccess=='4'>
                                尊敬的客户，此次众筹活动失败了，不能支付；去看看其他宝贝吧。
                            </#if>
                        <#else>
                            我们还未收到该订单的款项，请您尽快付款。<br>该订单会为您保留两个工作日（从下单之日算起），两个工作日之后如果还未付款，系统将自动取消该订单。
                        </#if>
                    <#elseif '${order.orderStatus}' == 'wait_seller_send_goods' >
                        <#if order.payType == 'offline'>
                            我们会尽快发货，请注意查收。
                        <#else>
                            您已支付成功，我们会尽快发货，请注意查收。
                        </#if>

                    <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods' >
                        卖家已经发货，请注意查收。
                    <#elseif '${order.orderStatus}' == 'wait_buyer_validate_goods' >
                        等待您验货。
                    <#elseif '${order.orderStatus}' == 'trade_finished' >
                        您已完成交易。
                    <#elseif '${order.orderStatus}' == 'cancel'>
                        订单已取消！
                    <#elseif '${order.orderStatus}' == 'deleted'>
                        您已经删除了您的订单！
                    <#elseif '${order.orderStatus}' == 'invalid'>
                        此订单已作废！
                    <#elseif '${order.orderStatus}' == 'unconfirm'>
                        我们正在对订单进行审核，审核结束后我们会及时通知您！
                    <#elseif '${order.orderStatus}' == 'refund_success'>
                        此订单已退款！
                    <#elseif '${order.orderStatus}' == 'refunding'>
                        退款中...！
                    </#if>
                </#if>
                <#if order.isRefund == 'Y'>
                    <#if '${order.orderRefund.status}'== 'success'>
                        此订单退款完成！
                    <#elseif '${order.orderRefund.status}'== 'refunded'>
                        退款已退回，等待买家收款！
                    <#elseif '${order.orderRefund.status}'== 'confirmed'>
                        退款已受理，等待买家发货！
                    <#elseif '${order.orderRefund.status}'== 'returned'>
                        退款未受理！
                    <#elseif '${order.orderRefund.status}'== 'commit'>
                        退款申请中...
                    <#else>
                        退款中...
                    </#if>
                    <div style="border-top:1px dotted #EED97C; margin-top:5px;">
                        <div style="padding-top: 5px;">
                            <span style="font-weight: bold;">退款原因:&nbsp;&nbsp;</span>
                        ${order.orderRefund.reason}
                        </div>
                    </div>
                </#if>
                <#if invalidReason??>
                    <div style="border-top:1px dotted #EED97C; margin-top:5px;">
                        <div style="padding-top: 5px;">
                            <span style="font-weight: bold;">
                                <#if order.orderStatus == 'cancel'>
                                    取消
                                <#elseif order.orderStatus == 'invalid'>
                                    作废
                                </#if>
                                    原因:&nbsp;&nbsp;
                            </span>
                            ${invalidReason}
                        </div>
                    </div>
                </#if>
            </div>
            <div class="mc" id="zxzf" style="display:none">
                <div>
                    <p style="text-align:left;">
                        尊敬的客户，您的订单商品已经从库房发出，请您做好收货准备。
                    </p>
                    <p style="text-align:left;">
                        <span class="ftx-01">由商城提供</span>
                        <s class="icon-bao"></s>
                        <span>如果您已收到货，请确认收货，我们将与卖家结算。如果您对购买的商品不满意，您可在确认收货后发起返修/退换货申请!</span>
                    </p>
                </div>
            </div>
        </div>

        <#--进度条-->
        <div class="orderdetail_state">
        <#if order.orderStatus != 'cancel' && order.orderStatus != 'deleted' && order.isRefund == 'N'>
           <#-- <div id="process" class="section4">
                <div class="node fore wait unconfirm wait_buyer_pay"><ul><li class="tx1">&nbsp;</li><li class="tx2">提交订单</li><li class="tx3">&nbsp;</li></ul></div>
                <div class="proce wait wait_buyer_pay" id="wait_buyer_pay_process"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node wait wait_buyer_pay"><ul><li class="tx1">&nbsp;</li><li class="tx2">等待付款</li><li class="tx3">&nbsp;</li></ul></div>
                <div class="proce wait wait_seller_send_goods"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node wait wait_buyer_confirm_goods" ><ul><li class="tx1">&nbsp;</li><li class="tx2">商品出库</li><li class="tx3">&nbsp;</li></ul></div>
                <div class="proce wait wait_buyer_confirm_goods"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node wait trade_finished"><ul><li class="tx1">&nbsp;</li><li class="tx2">等待收货</li><li class="tx3">&nbsp;</li></ul></div>
                <div class="proce wait trade_finished"><ul><li class="tx1">&nbsp;</li></ul></div>
                <div class="node wait trade_finished"><ul><li class="tx1">&nbsp;</li><li class="tx2">完成</li><li class="tx3">&nbsp;</li></ul></div>
            </div>-->
            <!-- 订单进度 -->
            <!-- 普通订单进度 -->
            <div class="md_process mu_d_mrgin">
                <div
                    <#if order.orderStatus == 'unconfirm'>
                            class="md_process_wrap md_process_step1"
                    <#elseif order.orderStatus == 'wait_buyer_pay'>
                            class="md_process_wrap md_process_step2"
                    <#elseif order.orderStatus == 'wait_seller_send_goods'>
                            class="md_process_wrap md_process_step3"
                    <#elseif order.orderStatus == 'wait_buyer_confirm_goods'>
                            class="md_process_wrap md_process_step4"
                    <#elseif order.orderStatus == 'wait_buyer_validate_goods'>
                            class="md_process_wrap md_process_step5"
                    <#elseif order.orderStatus == 'trade_finished'>
                            class="md_process_wrap md_process_step6"
                    <#else >
                            class="hide"
                    </#if>>
                    <!-- class: step样式不加为全黑，md_process_step1 为第一步，依次类推 -->
                    <div class="md_process_sd"></div>
                    <i class="md_process_i md_process_i1">
                        1
                        <span class="md_process_tip">提交订单</span>
                    </i>
                    <i class="md_process_i md_process_i2">
                        2
                        <span class="md_process_tip">等待付款</span>
                    </i>
                    <i class="md_process_i md_process_i3">
                        3
                        <span class="md_process_tip">商品出库</span>
                    </i>
                    <i class="md_process_i md_process_i4">
                        4
                        <span class="md_process_tip">等待收货</span>
                    </i>
                    <i class="md_process_i md_process_i5">
                        5
                        <span class="md_process_tip">等待验货</span>
                    </i>
                    <i class="md_process_i md_process_i6">
                        6
                        <span class="md_process_tip">完成</span>
                    </i>
                </div>
            </div>
        </#if>
        </div>
        <#--<div class="orderdetail_state">-->
            <#--<div id="process" class="section4">-->
                <#--<div class="node fore wait unconfirm wait_buyer_pay ready"><ul><li class="tx1">&nbsp;</li><li class="tx2" style="color: rgb(51, 51, 51);">提交订单</li><li class="tx3">&nbsp;</li></ul></div>-->
                <#--<div class="proce wait wait_buyer_pay ready" id="wait_buyer_pay_process"><ul><li class="tx1">&nbsp;</li></ul></div>-->
                <#--<div class="node wait wait_buyer_pay ready"><ul><li class="tx1">&nbsp;</li><li class="tx2" style="color: rgb(51, 51, 51);">等待付款</li><li class="tx3">&nbsp;</li></ul></div>-->
                <#--<div class="proce wait wait_seller_send_goods"><ul><li class="tx1">&nbsp;</li></ul></div>-->
                <#--<div class="node wait wait_buyer_confirm_goods"><ul><li class="tx1">&nbsp;</li><li class="tx2">商品出库</li><li class="tx3">&nbsp;</li></ul></div>-->
                <#--<div class="proce wait wait_buyer_confirm_goods"><ul><li class="tx1">&nbsp;</li></ul></div>-->
                <#--<div class="node wait trade_finished"><ul><li class="tx1">&nbsp;</li><li class="tx2">等待收货</li><li class="tx3">&nbsp;</li></ul></div>-->
                <#--<div class="proce wait trade_finished"><ul><li class="tx1">&nbsp;</li></ul></div>-->
                <#--<div class="node wait trade_finished"><ul><li class="tx1">&nbsp;</li><li class="tx2">完成</li><li class="tx3">&nbsp;</li></ul></div>-->
            <#--</div>-->
        <#--</div>-->
        <div class="payment_info" id="ordertrack" style="border: none;">
            <h1>付款信息</h1>
            <div class="payment_info_in">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                    <tr>
                        <td width="20%"> 应付金额：￥${order.totalAmount?string('##0.00')}</td>
                        <td width="20%"> <#if goodsType=='1'>众筹</#if>商品金额：￥${order.goodsTotalPrice?string('##0.00')}</td>
                        <td width="20%">
                            保价费：￥${order.insuranceFee?string('##0.00')}
                        </td>
                        <td width="20%">
                            优惠金额：￥<#if order.discount??>${order.discount?string('##0.00')}<#else>0.00</#if>
                        </td>
                        <td width="20%" > 运费金额：￥${order.deliveryFee?string('##0.00')}</td>
                    </tr>
                    <tr>
                    <#--<td width="25%" colspan="2"> 里　　程：<#if order.transportDistance?? && order.transportDistance != ''>${order.transportDistance} 千米<#else>未录入</#if></td>
                    <td width="25%"> 重　　量：<#if order.goodsWeight?? && order.goodsWeight != ''>${order.goodsWeight} 千克<#else>未录入</#if></td>
                    <td width="25%"> 体　　积：<#if order.goodsVolume?? && order.goodsVolume != ''>${order.goodsVolume} 立方米<#else>未录入</#if></td>-->
                    </tr>
                    <#list payCountList as pay>
                        <#if pay_index % 5 == 0>
                            <tr>
                        </#if>
                        <td> ${pay.name}：￥${pay.amount?string('##0.00')}</td>
                        <#if (pay_index+1) % 5 == 0>
                            </tr>
                        </#if>
                    </#list>
                    <#if payCountList?? && payCountList?size % 4 != 0>
                        <#assign size=5-payCountList?size%5>
                       <#list 1..size as col>
                            <td></td>
                       </#list>
                       </tr>
                    </#if>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="payment_info">
            <h1 style=" margin-bottom: 5px;">订单信息</h1>
            <div class="payment_info_in">
                <dl class="fore">
                    <dt>收货人信息</dt>
                    <dd>
                        <ul>
                            <li>收&nbsp;货&nbsp;人：${order.shipName}</li>
                            <li>地&nbsp;&nbsp;&nbsp;&nbsp;址：${order.shipAreaName}${order.shipAddress}</li>
                            <li>邮政编码：${order.shipZipCode}</li>
                            <li>手机号码：${order.shipMobile}</li>
                            <li>收货电话：${order.shipPhone}</li>
                        </ul>
                    </dd>
                </dl>
                <dl>
                    <dt>支付及配送方式</dt>
                    <dd>
                        <ul>
                            <li>支付方式：${order.paymentMethodName}</li>
                            <li>运&nbsp;&nbsp;&nbsp;&nbsp;费：￥${order.deliveryFee?string('##0.00')}</li>
                            <li>配送方式：${order.deliveryMethodName}</li>
                            <li>送货时间：${order.deliveryTime}</li>
                        </ul>
                    </dd>
                </dl>
            <#if orderDistribution??>
                <dl>
                    <dt>物流信息</dt>
                    <dd>
                        <ul>
                            <li>物流公司：<a href="${expressCompanyUrl}" class="blue" target="_blank">${orderDistribution.logisticsCompany}</li></a>
                            <li>物流单号：${orderDistribution.logisticsNo}</li>
                            <li>物流详情：<span><a href="javascript:;" class="blue" onclick="getExpressLog(this,'${order.id}');">物流详情</a></span><ul id="expressLog"></ul></li>
                        </ul>
                    </dd>
                </dl>
            </#if>
                <dl>
                    <dt>发票信息</dt>
                    <dd>
                        <ul>
                            <#if order.invoiceContent=="no">
                                <li>发票类型：不开发票</li>
                            <#else>
                                <li>发票类型：<span><#if order.invoiceType=="normal">普通发票</#if></span></li>
                                <li>发票抬头：<span>${order.invoiceTitle}</span></li>
                                <li>发票内容：<span><#if order.invoiceContent=="infos">明细</#if></span></li>
                            </#if>
                        </ul>
                    </dd>
                </dl>

            </div>
            <div class="payment_info">
                <h1>
                    <span class="i-mt"><#if goodsType=='1'>众筹</#if>商品清单</span>
                    <span class="i-mt" style="float: right; padding: 0px 5px 5px 0px;">
                        <a class="btn-4 arrival_btn" style="width: 100px; font-size: 14px;" href="${base}/order/exportOrder2Word/${order.orderSn}">导出Word</a>
                        <a class="btn-4 arrival_btn" style="width: 100px; font-size: 14px;" href="${base}/order/exportOrderDetail/${order.orderSn}">导出Excel</a>
                    </span>
                    <div id="fquan" class="fquan">
                        <div id="eventName" onmouseover="showCoupon()" onmouseout="hideCoupon()">
                        </div>

                        <div class="prompt p-fquan" id="couponListShow">
                            <div class="pc" id="couponList">
                            </div>
                        </div>
                    </div>
                    <div class="clr"></div>
                </h1>
                <div class="p-list">
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                        <tr>
                            <th width="80%"> <#if goodsType=='1'>众筹</#if>商品 </th>
                            <th width="10%">
                                <#if goodsType=='1'>众筹价<#else>
                                <#if order.isMemberPrice == 'yes'>
                                    会员价
                                <#else>
                                    商城价
                                </#if>
                               </#if>
                            </th>
                            <th width="10%"> <#if goodsType=='1'>众筹</#if>商品数量 </th>
                        </tr>
                        <#--<#list goodsList as goods> -->
                        <tr>
                            <td colspan="3" style="text-align: left;font-weight: bold;padding-left: 20px;">商家：<#--<a href="${base}/shop/${shop.urlAddress}" target="_blank">${shop.name}</a>-->
                                <a>陕西帮商乐信息技术有限公司</a>
                            </td>
                        </tr>
                            <#list goodsList as goods>
                            <tr>
                                <td>
                                    <div class="img-list">
                                        <#if goods.pic ??>
                                            <#if order.orderType=='0'>
                                                <div style="float: left; padding-left: 10px;">
                                                    <#--<a class="img-box" target="_blank" href="${base}/item/${goods.id}.html" style="float: left;">
                                                        <img width="50" height="50" src="${goods.pic}" title="${goods.fullName}">
                                                    </a>-->
                                                    <a class="img-box" style="float: left;">
                                                        <img width="50" height="50" src="${goods.pic}" title="${goods.fullName}">
                                                    </a>
                                                    <div class="name-fl">
                                                       <#-- <a class="flk13" target="_blank" href="${base}/item/${goods.id}.html"> ${goods.fullName}</a>-->
                                                            <span style="display: block; color: #00a2d4;margin-top: 15px;">
                                                                <#list orderItemList as orderItem>
                                                                <#if orderItem.goodsId == goods.id>
                                                                    ${orderItem.goodsName}
                                                                    ${orderItem.specification}
                                                                    <#break>
                                                                </#if>
                                                            </#list>
                                                            </span>
                                                    </div>
                                                    <div class="clr"></div>
                                                    <div id="coupon_${goods.sn}" class="fl"></div>
                                                </div>
                                            <#elseif order.orderType=='1'>
                                                <div style="float: left; padding-left: 10px;">
                                                    <a class="img-box" target="_blank" href="${base}/zcgoods/detail/${goods.id}.html?whichclient=whichpc" style="float: left;">
                                                        <img width="50" height="50" src="${goods.pic}" title="${goods.fullName}">
                                                    </a>
                                                    <div class="name-fl">
                                                        <a class="flk13" target="_blank" href="${base}/zcgoods/detail/${goods.id}.html?whichclient=whichpc"> ${goods.fullName}</a>
                                                            <span style="display: block;line-height: 24px; color: #00a2d4;">
                                                                <#list orderItemList as orderItem>
                                                                <#if orderItem.goodsId == goods.id>
                                                                ${orderItem.specification}
                                                                    <#break>
                                                                </#if>
                                                            </#list>
                                                            </span>
                                                    </div>
                                                    <div class="clr"></div>
                                                    <div id="coupon_${goods.sn}" class="fl"></div>
                                                </div>
                                            </#if>
                                        <#else>
                                            <div style="float: left; padding-left: 10px;">
                                            ${goods.fullName}
                                            </div>
                                        </#if>
                                    </div>
                                </td>
                                <td><span class="ftx04"> ￥<#list orderItemList as orderItem>
                                    <#if orderItem.goodsId == goods.id>
                                    ${orderItem.goodsPrice}
                                        <#break>
                                    </#if>
                                </#list></span></td>
                                <td>
                                    <#list orderItemList as orderItem>
                                    <#if orderItem.goodsId == goods.id>
                                    ${orderItem.quantity}
                                        <#break>
                                    </#if>
                                    </#list>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"  style="text-align: left;background: #f3f3f3; padding-bottom: 10px;">
                                    <span style="background: #f3f3f3;width: 10%;" ><font style="margin-left: 10px;vertical-align: middle;margin-top: 2px">备注：</font></span>
                                    <span style="width: 90%;vertical-align: middle;margin-top: 2px; color: #585757;">
                                        <#list orderItemList as orderItem>
                                               <#if orderItem.goodsId == goods.id>
                                        ${orderItem.ps}
                                            <#break>
                                        </#if>
                                           </#list>
                                    </span>
                                </td>
                            </tr>
                            </#list>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="order-total">
                <ul>
                    <li><span <#if goodsType=='1'>style="width:150px;"</#if>><#if goodsType=='1'>众筹</#if>总商品金额：</span>￥${order.goodsTotalPrice}</li>
                    <li>
                        <span <#if goodsType=='1'>style="width:150px;"</#if>>- 优惠：</span>￥<#if order.discount==''>0.00<#else>${order.discount?string('##0.00')}</#if>
                    </li>
                    <li>
                        <span <#if goodsType=='1'>style="width:150px;"</#if>>+ 保价费：</span>￥${order.insuranceFee?string('##0.00')}
                    </li>
                    <li><span <#if goodsType=='1'>style="width:150px;"</#if>>+ 运费：</span>￥${order.deliveryFee?string('##0.00')}</li>
                </ul>
                <div class="order-extra">
                    应付总额：<span class="ftx04"><b>￥${order.totalAmount?string('0.00')}</b></span>
                </div>
            </div>
        </div>
        </div>

        <dl class="faq">
            <dt>
                <#list services as service>
                    <#if service["category"].sign == 'commonProblem'>
                        <#list service["articles"] as article>
                            <a href="${base}/help/question/${article.id}.html" target="_blank">更多&gt;</a>
                            <#break >
                        </#list>
                    </#if>
                </#list>
                <span>常见问题</span>
            </dt>
            <dd>
                <ul>
                    <#list services as service>
                        <#if service["category"].sign == 'commonProblem'>
                            <#list service["articles"] as article>
                                <li><a href="${base}/help/question/${article.id}.html" target="_blank" title="${article.title}">${article.title}</a></li>
                                <#if article_index == 4><#break ></#if>
                            </#list>
                        </#if>
                    </#list>
                </ul>
            </dd>

        </dl>
    </div>

</div>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#btn_Cancel").colorbox({iframe:true, innerWidth:520, innerHeight:300, opacity: 0.15});
//        contrlProcess();
        initBtn();
        //常见问题
        var totalheight = 0;
        $(window).scroll( function() {
            totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());     //浏览器的高度加上滚动条的高度,减去底部高度
            if ($(document).height() <= totalheight)     //当文档的高度小于或者等于总的高度的时候，开始动态加载数据
            {
                $(".faq").css("bottom","525px");
            }else{
                $(".faq").css("bottom","51%");
            }
        });
    });

    /**
     *获取订单物流信息
     * @param orderId 订单Id
     * */
    function getExpressLog(obj,orderId){
        var load=layer.load();
        $("#expressLog").html("");
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
     * 取消订单
     * @param orderId 订单Id
     */
    function cancleOrder(orderId,reason) {
        $("#btn_Cancel").colorbox.close();
        $.ajax({
            type: 'post',
            url: '${base}/order/cancle/' + orderId + '/'+encodeURI(encodeURI(reason)),
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

    function cancleOrderError(){
        $("#btn_Cancel").colorbox.close();
    }
    /**
     * 动态控制进度条
     */
    function contrlProcess() {
        if ('${order.orderStatus}' == 'unconfirm') {
            $('.unconfirm').addClass('ready');
            $('.unconfirm .tx2').css('color', '#333')
            $('.unconfirm + div').addClass('doing');
        } else if ('${order.orderStatus}' == 'wait_buyer_pay') {
            $('.wait_buyer_pay').addClass('ready');
            $('.wait_buyer_pay .tx2').css('color', '#333')
        } else if ('${order.orderStatus}' == 'wait_seller_send_goods') {
            $('.wait_buyer_pay').addClass('ready');
            $('.wait_seller_send_goods').addClass('ready');
            $('.wait_buyer_pay .tx2').css('color', '#333')
            $('.wait_seller_send_goods .tx2').css('color', '#333')
        } else if ('${order.orderStatus}' == 'wait_buyer_confirm_goods') {
            $('.wait_buyer_pay').addClass('ready');
            $('.wait_seller_send_goods').addClass('ready');
            $('.wait_buyer_confirm_goods').addClass('ready');
            $('.wait_buyer_pay .tx2').css('color', '#333')
            $('.wait_seller_send_goods .tx2').css('color', '#333')
            $('.wait_buyer_confirm_goods .tx2').css('color', '#333')
        }else if ('${order.orderStatus}' == 'wait_buyer_validate_goods') {
            $('.wait_buyer_pay').addClass('ready');
            $('.wait_seller_send_goods').addClass('ready');
            $('.wait_buyer_confirm_goods').addClass('ready');
            $('.wait_buyer_pay .tx2').css('color', '#333')
            $('.wait_seller_send_goods .tx2').css('color', '#333')
            $('.wait_buyer_confirm_goods .tx2').css('color', '#333')
        }  else if ('${order.orderStatus}' == 'trade_finished') {
            $('.wait_buyer_pay').addClass('ready');
            $('.wait_seller_send_goods').addClass('ready');
            $('.wait_buyer_confirm_goods').addClass('ready');
            $('.trade_finished').addClass('ready');
            $('.wait_buyer_pay .tx2').css('color', '#333')
            $('.wait_seller_send_goods .tx2').css('color', '#333')
            $('.wait_buyer_confirm_goods .tx2').css('color', '#333')
            $('.trade_finished .tx2').css('color', '#333')
        }
        // 货到付款时把“等待付款这个进度条隐藏”
        if ('${order.payType}' == 'offline') {
            var wait_buyer_pay_process = $('#wait_buyer_pay_process');
            wait_buyer_pay_process.addClass('hide');
            wait_buyer_pay_process.next('div').addClass('hide');
        }
    }

    /**
     * 到退款页面
     * @param orderId 订单Id
     */
    function refundList(orderSn){
        window.location.href ="${base}/member/refund/list.html?orderSn=" + orderSn;
    }

    function initBtn(){
        //取消订单
        judgeBtnAuth('${base}', 'cancleOrder', 'cancle_btn');
        //付款
        judgeBtnAuth('${base}', 'pay', 'pay_btn');
    }

    function btnClick(btnId, isPopup){
        if( isPopup == 'popup'){
            $("#"+ btnId).trigger("click");
        }else{
            window.open($("#"+ btnId).attr("myurl"), "_blank");
        }
    }
</script>
</#escape>