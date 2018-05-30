<#escape x as x?html>
    <#include "bec/jp/header.ftl"/>

<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>

<div id="container">
    <#include "bec/jp/top.ftl"/>
    <div class="member_content">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/order/list">订单中心</a></strong><span>&nbsp;&gt;&nbsp;订单：${order.orderSn}<span></span></span>
        </div><!--breadcrumb end-->
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

                <#--${order.isRefund} <===> ${order.orderStatus} <===> ${order.orderRefund.status}-->
                <#if order.isRefund == 'Y'>
                    <em><div style="float: left;">退款状态：</div>
                    <span class="ftx14" style="float: left;">
                        <a href="javascript:void(0)" onclick="refundList('${order.orderSn}');">
                            <#--<#if '${order.orderRefund.status}'== 'success'>
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
                           </#if>-->

                            <#if '${order.orderRefund.status}'== 'commit'>
                                <#--此订单退款申请已提交！-->
                                已提交
                            <#elseif '${order.orderRefund.status}'== 'confirmed'>
                                <#--此订单退款申请已受理！-->
                                已受理
                            <#elseif '${order.orderRefund.status}'== 'returned'>
                                <#--退款申请已退回！-->
                                已退回
                            <#elseif '${order.orderRefund.status}'== 'shipped'>
                                <#--买家已发货,等待卖家收货！-->
                                已发货,等待卖家收货
                            <#elseif '${order.orderRefund.status}'== 'unrefund'>
                                <#--等待退款...-->
                                等待退款
                            <#elseif '${order.orderRefund.status}'== 'refunded'>
                                <#--已退款, 等待买家确认...-->
                                已退款,等待买家确认
                            <#elseif '${order.orderRefund.status}'== 'success'>
                                <#--已退款！-->
                                已完成
                            <#else>
                            </#if>

                        </a>
                    </span>
                    </em>
                </#if>

                <#if order.orderStatus == "wait_buyer_pay">
                    <span id="pay-button-${order.orderSn}">
                        <a href="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}" target="_blank" class="pay-button">
                            支付
                        </a>
                    </span>
                    <div class="fr">
                        <div class="toolbar">
                            <a class="pay-button" href="${base}/order/popupcancel/${order.id}" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" id="btn_Cancel"  >
                                取消
                            </a>
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
                        我们还未收到该订单的款项，请您尽快付款，如果您已经付款，请务必填写付款确认。<br>该订单会为您保留24小时（从下单之日算起），24小时之后如果还未付款，系统将自动取消该订单。
                    <#elseif '${order.orderStatus}' == 'wait_seller_send_goods' >
                        <#if order.payType == 'offline'>
                            我们会尽快发货，请注意查收。
                        <#else>
                            您已支付成功，我们会尽快发货，请注意查收。
                        </#if>

                    <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods' >
                        卖家已经发货，请注意查收。
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
                    <#--<#if '${order.orderRefund.status}'== 'success'>
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
                    </#if>-->


                    <#if '${order.orderRefund.status}'== 'commit'>
                        已提交
                    <#elseif '${order.orderRefund.status}'== 'confirmed'>
                        已受理
                    <#elseif '${order.orderRefund.status}'== 'returned'>
                        已退回
                    <#elseif '${order.orderRefund.status}'== 'shipped'>
                        已发货,等待卖家收货
                    <#elseif '${order.orderRefund.status}'== 'unrefund'>
                        等待退款
                    <#elseif '${order.orderRefund.status}'== 'refunded'>
                        已退款,等待买家确认
                    <#elseif '${order.orderRefund.status}'== 'success'>
                        已完成
                    <#else>
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
                    <#elseif order.orderStatus == 'trade_finished'>
                            class="md_process_wrap md_process_step5"
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
            <h3>付款信息</h3>
            <div class="payment_info_in">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                    <tr>
                        <td width="30%" id="daiFuName"> 付款方式：${order.paymentMethodName}</td>
                        <td width="70%" id="daiFuPeople">
                        </td>
                    </tr>
                    <tr>
                        <td> 商品金额：￥${order.goodsTotalPrice}</td>
                        <td> 运费金额：￥${order.deliveryFee}</td>
                    </tr>
                    <tr>
                        <td> 优惠金额：￥<#if order.discount??>${order.discount}<#else>0.00</#if></td>
                        <td> 实际运费：￥${order.deliveryFee}</td>
                    </tr>
                    <tr>
                        <td colspan="2"> 应支付金额：￥${order.totalAmount}</td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="payment_info">
            <h3>订单信息</h3>
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
                            <li>运&nbsp;&nbsp;&nbsp;&nbsp;费：￥${order.deliveryFee}</li>
                            <li>配送方式：${order.deliveryMethodName}</li>
                            <li>送货时间：${order.deliveryTime}</li>
                        </ul>
                    </dd>
                </dl>
            <#if orderDistribution??>
                <#--<dl>
                    <dt>物流信息</dt>
                    <dd>
                        <ul>
                            <li>物流公司：<a href="${expressCompanyUrl}" class="blue" target="_blank">${orderDistribution.logisticsCompany}</li></a>
                            <li>物流单号：${orderDistribution.logisticsNo}</li>
                            <li>物流详情：<span><a href="javascript:;" class="blue" onclick="getExpressLog(this,'${order.id}');">物流详情</a></span><ul id="expressLog"></ul></li>
                        </ul>
                    </dd>
                </dl>-->
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
                <dl style="border-bottom:none;">
                    <dt>
                        <span class="i-mt">商品清单</span>
                    <div id="fquan" class="fquan">
                        <div id="eventName" onmouseover="showCoupon()" onmouseout="hideCoupon()">
                        </div>

                        <div class="prompt p-fquan" id="couponListShow">
                            <div class="pc" id="couponList">
                            </div>
                        </div>
                    </div>
                    <div class="clr"></div>
                    </dt>
                    <dd class="p-list">
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                            <tr>
                                <th width="80%"> 商品 </th>
                                <th width="10%"> 商城价 </th>
                                <th width="10%"> 商品数量 </th>
                            </tr>
                        <#--<#list goodsList as goods> -->
                            <tr>
                                <td colspan="3" style="text-align: left;font-weight: bold;padding-left: 20px;">
                                    <a href="${base}/shop/${shop.urlAddress}" target="_blank">${shop.name}</a>
                                </td>
                            </tr>
                            <#list goodsList as goods>
                            <tr>

                                <td>
                                    <div class="img-list">
                                        <#if goods.pic ??>
                                                <div style="float: left; padding-left: 10px;">
                                                    <a class="img-box" target="_blank" href="${base}/item/${goods.id}.html" style="float: left;">
                                                        <img width="50" height="50" src="${goods.pic}" title="${goods.fullName}">
                                                    </a>
                                                    <div class="name-fl">
                                                        <a class="flk13" target="_blank" href="${base}/item/${goods.id}.html"> ${goods.fullName}</a>
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
                    </dd>
                </dl>
            </div>
            <div class="order-total">
                <ul>
                    <li><span>总商品金额：</span>￥${order.goodsTotalPrice}</li>
                    <li><span>- 优惠：</span>￥<#if order.discount??>${order.discount}<#else>0.00</#if></li>
                    <li><span>+ 运费：</span>￥${order.deliveryFee}</li>
                </ul>
                <div class="order-extra">
                    应付总额：<span class="ftx04"><b>￥${order.totalAmount?string('0.00')}</b></span>
                </div>
            </div>
        </div>
    </div>
</div>
    <#include "bec/jp/service.ftl"/>
    <#include "bec/jp/foot.ftl"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $("#btn_Cancel").colorbox({iframe:true, innerWidth:520, innerHeight:300, opacity: 0.15});
        contrlProcess();
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
        } else if ('${order.orderStatus}' == 'trade_finished') {
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
</script>
</#escape>