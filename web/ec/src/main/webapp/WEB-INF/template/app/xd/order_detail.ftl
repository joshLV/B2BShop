
<!DOCTYPE html>
<html>
<head>
<#include "app/xd/head.ftl">
<style>
    .blue {
        color: #0000cc;
    }
    .green {
        color: #12A000;
    }
    .black {
        color: #888;
    }
    .expresslogfont{
        float:left;
        font-size:10px;
    }

    .order-box  .order-goods {
        display: -webkit-box;
        display: -moz-box;
        display: -o-box;
        display: -ms-box;

        margin-bottom: 10px;
        padding-bottom: 5px;
    }
    .order-box  .order-goods a{ display: block;; width: 100%;

        margin-bottom: 10px;
        padding-bottom: 5px;}

    #expressLog li{ line-height: 1.8; text-align: left; font-size: 14px;width: 100%; margin-left:10px; padding: 8px 0; padding-left: 10px; padding-right:15px;-webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        -ms-box-sizing: border-box;
        box-sizing: border-box;border-top: 1px dotted #d8d8d8; color: #999;}

    .upsj{ font-size: 14px;border-top: 1px solid #d8d8d8; padding-top: 10px; padding-bottom:8px; margin-top: 10px; text-align: left; padding-left: 10px;}



</style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" style="height: 44px;">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">订单详情</h1>
</header>

<div class="mui-content wrap">
    <section class="order-con">
        <ul class="order-list">
            <li>
                <div class="order-box">
                    <div class="order-width">
                        <p>订单编号：${order.orderSn}</p>
                        <p>订单金额：￥${(order.totalAmount?string('0.00'))}</p>
                        <p>订单日期：${order.createDate?string("yyyy-MM-dd HH:mm:ss")}</p>
                        <p>订单状态：
                        <#if '${order.orderStatus}' == 'cancel' || '${order.orderStatus}' == 'invalid'>
                            <span style="color:red;font-weight: bold ;">${orderStatusMapping['${order.orderStatus}']}</span>
                        <#else>
                            <span style="color:green;font-weight: bold">${orderStatusMapping['${order.orderStatus}']}</span>
                        </#if>
                            <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                <button type="button" onclick="pay('${order.orderSn}', '${order.totalAmount}', '${order.id}')"
                                        style="height: 28px; font-size: 14px; line-height: 1.1; margin-top: -4px; font-weight: bold; background-color: #fe0000; color: white;">
                                    去付款
                                </button>
                                <!--<button type="button" onclick="pay('${order.orderSn}', '${order.totalAmount}', '${order.id}')"
                                        style="height: 28px; font-size: 14px; line-height: 1.1; margin-top: -4px; font-weight: bold; background-color: #85C226; color: white;">
                                    去付款
                                </button>-->
                            </#if>
                        </p>
                        <#if order.isRefund == 'Y'>
                            <p>退款状态：<span style="color:green;font-weight: bold">
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
                           </span> </p>
                       </a>
                     </span>
                        </#if>
                    </div>
                </div>
            </li>
            <li>
            <div style="font-size: 14px;background: #FFF;border-bottom: 1px solid #d8d8d8; display: inline-block; width: 100%;color: #888;text-align: left;">
                <p style="font-size: 14px;padding-top: 5px; padding-left: 10px">尊敬的客户，
            <#if order.isRefund == 'N'>
                <#if '${order.orderStatus}' == 'wait_buyer_pay'  >
                    我们还未收到该订单的款项，请您尽快付款，如果您已经付款，请务必填写付款确认。该订单会为您保留<b>24小时</b>（从下单之日算起），24小时之后如果还未付款，系统将自动取消该订单。
                <#elseif '${order.orderStatus}' == 'wait_seller_send_goods' >
                    我们会尽快发货，请注意查收。
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
                </p>
                <div style="border-top:1px dotted #d8d8d8; margin-top:5px;margin-bottom:5px;">
                    <div style="padding-top: 5px;padding-left: 10px">
                        <span style="font-weight: bold;">退款原因:&nbsp;&nbsp;</span>
                    ${order.orderRefund.reason}
                    </div>
                </div>
            </#if>
            <#if invalidReason??>
                <div style="border-top:1px dotted #d8d8d8; margin-top:5px;margin-bottom:5px;">
                    <div style="padding-top: 5px;padding-left: 10px">
                    <span style="font-weight: bold;">
            <#if order.orderStatus == 'cancel'>取消<#elseif order.orderStatus == 'invalid'>作废</#if>原因:&nbsp;&nbsp;
            </span>
                    ${invalidReason}
                    </div>
                </div>
            </#if>

            </div></li>
            <#list goodsList as goods>
                <li style="margin-bottom: -4px;">
                    <div class="order-box" style="height:125px;">
                        <ul class="book-list">
                            <li>
                                <div class="order-goods">
                                <a href="${base}/item/whichapp/${goods.id}.html">
                                    <div class="order-msg">
                                        <img src="${goods.pic}@300_300.png" class="img_ware" />
                                    </div>
                                        <div class="order-info2">
                                            <#assign fullNameLength = goods.fullName?length>
                                            <p class="title" style="height:38px;overflow: hidden;padding-bottom: 5px;">${goods.fullName}</p>
                                           <p class="title" style="height:19px;overflow: hidden;padding-bottom: 5px;">
                                               <#list orderItemList as orderItem>
                                                     <#if orderItem.goodsId == goods.id>
                                                       ${orderItem.specification}
                                                       </#if>
                                                </#list>
                                           </p>
                                            <p class="price">商品金额:${goods.price?string(priceCurrencyFormat)}</p>
                                            <p class="price">优惠金额:<#if goods.discount==''>${0?string(priceCurrencyFormat)}<#else>${goods.discount?string(priceCurrencyFormat)}</#if></p>
                                            <p class="order-data"><#list orderItemList as orderItem><#if orderItem.goodsId == goods.id>x${orderItem.quantity}</#if></#list></p>
                                        </div>

                                </a>
                                </div>
                            </li>
                        </ul>
                        <ul>
                            <li style="margin-left:10px;">
                                <p>卖家留言：
                                    <#list orderItemList as orderItem>
                                        <#if orderItem.goodsId == goods.id>
                                        ${orderItem.ps}
                                        </#if>
                                    </#list>
                                </p>
                            </li>
                        </ul>
                    </div>
                </li>
            </#list>
            <li>
                <div class="order-box" style=" padding: 0px 0;">
                    <div class="order-width">
                <#--新添加-->
                        <div class="sh_info">
                            <div class="key">收货人：</div>
                            <div class="val">${order.shipName}</div>
                        </div>
                        <div class="sh_info">
                            <div class="key">手机号码：</div>
                            <div class="val">${order.shipMobile}</div>
                        </div>
                        <div class="sh_info">
                            <div class="key">地址：</div>
                            <div class="val">${order.shipAddress}</div>
                        </div>
                        <div class="sh_info">
                            <div class="key">邮政编码：</div>
                            <div class="val">${order.shipZipCode}</div>
                        </div>
                        <div class="sh_info" style="border-bottom: 0;">
                            <div class="key">收货电话：</div>
                            <div class="val">${order.shipPhone}</div>
                        </div>

                    </div>
                </div> </li>
            <li>
                <div class="order-box" style=" padding: 0px 0;">
                    <div class="order-width">

                        <#--新添加-->
                            <div class="sh_info">
                                <div class="key">付款方式：</div>
                                <div class="val">${order.paymentMethodName}</div>
                            </div>
                            <div class="sh_info">
                                <div class="key">商品金额：</div>
                                <div class="val red" style="color: #E4393C;">￥${order.goodsTotalPrice?string('0.00')}</div>
                            </div>
                            <div class="sh_info">
                                <div class="key">运费：</div>
                                <div class="val red">￥${order.deliveryFee?string('0.00')}</div>
                            </div>
                            <div class="sh_info">
                                <div class="key">商品优惠：</div>
                                <div class="val red">￥${order.discount?string('0.00')}</div>
                            </div>
                            <div class="sh_info" style="border-bottom: 0;">
                                <div class="key">应支付金额：</div>
                                <div class="val red">￥${(order.totalAmount?string('0.00'))}</div>
                            </div>
                    </div>
                </div> </li>
            <li>
                <div class="order-box" style=" padding: 0px 0; padding-top: 10px;">
                    <div class="order-width">
                        <p class="border-bottom usr-name" style="padding: 5px 0;"><b>配送信息</b></p>
                        <div class="sh_info">
                            <div class="key">配送方式:</div>
                            <div class="val red">${order.deliveryMethodName}</div>
                        </div>
                        <div class="sh_info">
                            <div class="key">送货时间:</div>
                            <div class="val red">${order.deliveryTime}</div>
                        </div>

                       <#if gisList?exists && gisList?size gt 0>
                            <div class="sh_info">
                                <div class="key">物流公司：</div>
                                <div class="val"><a class="mui-control-item red" href="${expressCompanyUrl}" >${orderDistribution.logisticsCompany}</a></div>
                            </div>
                            <#list gisList as gis>
                            <div class="sh_info">
                                <div class="key">物流单号：</div>
                                <div class="val">${gis} <a class="mui-control-item red" href="javascript:void(0);" class="blue" id="getExpressLog" gis="${gis}"  orderId="${order.id}"   style="padding:5px 12px;  background: #E4393C;-webkit-border-radius: 3px; color: #fff;-moz-border-radius: 3px;border-radius: 3px;">获取物流详情</a></div>
                            </div>
                            </#list>
                            <div class="sh_info" style="border-bottom: 0;">
                                <div class="key">物流详情：</div>
                                <div class="val">
                                <ul id="expressLog"></ul>
                            </div>

                        </#if>

                    </div>
                </div>
            </li>
            <li>
                <div class="order-box" style="padding-bottom: 0;">
                    <div class="order-width">
                        <p class="border-bottom usr-name" style="padding-bottom: 3px; margin-bottom: 5px!important;"><b>发票信息</b></p>
                            <#if order.invoiceContent=="no">
                                <div class="sh_info">
                                    <div class="key">发票类型：</div>
                                    <div class="val red">不开发票</div>
                                </div>
                            <#else>
                                <div class="sh_info">
                                    <div class="key">发票类型：</div>
                                    <div class="val red"><#if order.invoiceType=="normal">普通发票</#if></div>
                                </div>
                                <div class="sh_info">
                                    <div class="key">发票抬头：</div>
                                    <div class="val red">${order.invoiceTitle}</div>
                                </div>
                                <div class="sh_info" style="border-bottom: 0;">
                                    <div class="key">发票内容：</div>
                                    <div class="val red"><#if order.invoiceContent=="infos">明细</#if></div>
                                </div>
                            </#if>
                    </div>
                </div>
            </li>
        </ul>
    </section>
</div>

<#include "app/xd/tools.ftl">
<script>
    (function(mui, doc) {
        mui.back = function(){
            jumpto(fullpath + '/order/list?whichclient=whichapp');
        };
        mui.init({  });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }

        jQuery(".order-width").bind("tap","#getExpressLog", function(e){
            //jQuery("#getExpressLog").hide();
            jQuery("#expressLog").html("获取物流信息中...");
            jQuery.ajax({
                url:"${base}/order/getExpressLogs/"+jQuery("#getExpressLog").attr("orderId"),
                data:{gis:jQuery(e.target).attr("gis")},
                type:'post',
                success:function(data){
                   // jQuery("#getExpressLog").hide();
                    var expressLog = JSON.parse(data);
                    if(expressLog.Success){
                        jQuery("#expressLog").html("");

                        if(expressLog.Traces!=""){//normal
                            jQuery("<br/>").appendTo(jQuery("#expressLog"));
                            jQuery("<div/>").addClass('upsj').html("【数据更新时间】"+ (typeof(expressLog.Traces[expressLog.Traces.length -1 ].AcceptTime) == "undefined" ? "" : expressLog.Traces[expressLog.Traces.length -1 ].AcceptTime))
                                    .appendTo(jQuery("#expressLog"));
                            jQuery(expressLog.Traces).each(function(index, trace){
                                jQuery("<li/>").addClass('expresslogfont')
                                        .html( trace.AcceptStation + "<br/>"+  trace.AcceptTime)
                                        .appendTo(jQuery("#expressLog"));
                            });

                        }
                        jQuery("#expressLog li:last").css("color","#12A000");
                    }else{
                        jQuery("#expressLog").html("");
                        jQuery("#getExpressLog").show();
                        jQuery("<li/>").addClass('expresslogfont').addClass('red').html('服务忙，请稍后再试!').appendTo(jQuery("#expressLog"));//error
                    }
                }
            });
        });
        <#--jQuery("#getExpressLog").bind("tap", function(e){
            jQuery("#getExpressLog").hide();
            jQuery("#expressLog").html("获取物流信息中...");
            jQuery.ajax({
                url:"${base}/order/getExpressLog/"+jQuery("#getExpressLog").attr("orderid"),
                type:'post',
                success:function(data){
                    jQuery("#getExpressLog").hide();
                    var expressLog = JSON.parse(data);
                    if(expressLog.error_code=='0'){
                        jQuery("#expressLog").html("");
                        var html="";
                        if(expressLog.data!=""){//normal
                            jQuery("<br/>").appendTo(jQuery("#expressLog"));
                            jQuery("<div/>").addClass('upsj').html("【数据更新时间】"+ (typeof(expressLog.data.updatetime) == "undefined" ? "" : expressLog.data.updatetime))
                                    .appendTo(jQuery("#expressLog"));
                            for(var key in expressLog.data.result){
                                jQuery("<li/>").addClass('expresslogfont')
                                        .html( expressLog.data.result[key].context + "<br/>"+  expressLog.data.result[key].ftime.trim())
                                        .appendTo(jQuery("#expressLog"));
                            }
                        }
                        jQuery("#expressLog li:first").css("color","#12A000");
                    }else{
                        jQuery("#expressLog").html("");
                        jQuery("#getExpressLog").show();
                        jQuery("<li/>").addClass('expresslogfont').addClass('red').html(expressLog.message).appendTo(jQuery("#expressLog"));//error
                    }
                }
            });
        });-->
    }(mui, document));
    function pay(orderSn, totalAmount, orderId){
        jumpto(fullpath + "/payment?orderSn=" + orderSn
                + "&total=" + totalAmount
                + "&key=" + orderId
                + "&whichclient=whichapp");
    }
</script>
</body>
</html>