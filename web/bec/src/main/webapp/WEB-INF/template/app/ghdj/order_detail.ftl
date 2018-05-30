
<!DOCTYPE html>
<html>
<head>
<#include "app/ghdj/head.ftl">
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

    /*top*/
    header{
        position: fixed;
        top: 0px;
        right: 0;
        left: 0;
        background:#e12f45;
        padding:8px 0;
        font-size:18px;
        height:30px;
        line-height:30px;
        box-shadow: 0px 3px 6px #999;
        z-index:10;text-align:center;}
    .logo{ position:absolute;left:10px;float:left;}
    .logo a{ color:#fff;}
    .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
    .user{ position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
    .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/ghdj/images/user.png) no-repeat; background-size: 20px
    20px;}

    .mtit{color:#fff;}

    /*新加样式  12-31*/
    .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghdj/images/arr.png) no-repeat; background-size:13px
    21px;margin-top:5px;}


    .order-box {
        margin-top: 10px;
        background: #FFF;
        border-top: 1px solid #e2e2e2;
        border-bottom: 1px solid #e2e2e2;
        display: inline-block;
        width: 100%;
        padding: 15px 0;
    }

</style>
</head>
<body>
<header>
    <div class="logo"><a href="javascript:jumpto(fullpath + '/order/list?whichclient=whichapp');" class="ltext">返回</a></div>
    <div class="mtit">订单详情</div>
    <div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a></div>
</header>

<div class="mui-content wrap" style="margin-top:35px;">
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
                            <button type="button" onclick="pay('${order.orderSn}', '${order.totalAmount}', '${order.id}', '${order.orderType}');"
                                    style="height: 28px; font-size: 14px; line-height:16px; margin-left: 3px; margin-top: -4px; font-weight: bold; background-color: #e12f45; color: white; border: 0;">
                                去付款
                            </button>  
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
                    <#if '${order.orderType}' == '0'>
                        我们还未收到该订单的款项，请您尽快付款，如果您已经付款，请务必填写付款确认。该订单会为您保留<b>24小时</b>（从下单之日算起），24小时之后如果还未付款，系统将自动取消该订单。
                    <#elseif '${order.orderType}' == '1'>
                        众筹活动结束时我们会及时通知您付款，请耐心等待！
                    </#if>

                <#elseif '${order.orderStatus}' == 'wait_seller_send_goods' >
                    您已支付成功，我们会尽快发货，请注意查收。
                <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods' >
                    卖家已经发货，请注意查收。
                <#elseif '${order.orderStatus}' == 'trade_finished' >
                    您已完成交易。
                <#elseif '${order.orderStatus}' == 'wait_buyer_validate_goods' >
                    卖家已经发货，请验货！
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
                <li>
                    <div class="order-box" style="height:115px;">
                        <ul class="book-list">
                            <li>
                                <div class="order-goods">
                                <a <#if goods.type==1> href="${base}/zcgoods/detail/${goods.id}.html"<#else >href="${base}/item/whichapp/${goods.id}.html"</#if>>
                                    <div class="order-msg">
                                        <img src="${goods.pic}@300w_300h.png" class="img_ware" />
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
                                <p>买家留言：
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
                            <div class="val">${order.shipAreaName}&nbsp;${order.shipAddress}</div>
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
                                <div class="key">保价：</div>
                                <div class="val red">￥${order.insuranceFee?string('0.00')}</div>
                            </div>
                            <#--
                            <div class="sh_info">
                                <div class="key">商品优惠：</div>
                                <div class="val red">￥${order.discount?string('0.00')}</div>
                            </div>-->
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

<#include "app/ghdj/tools.ftl">
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
                   
                    /*if(expressLog.Success){
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

                        }else{
                            jQuery("#expressLog").html("暂时不支持该快递公司查询，或者快递公司编码错误！");
                        }
                        jQuery("#expressLog li:last").css("color","#12A000");
                    }else{
                        jQuery("#expressLog").html("");
                        jQuery("#getExpressLog").show();
                        jQuery("<li/>").addClass('expresslogfont').addClass('red').html('服务忙，请稍后再试!').appendTo(jQuery("#expressLog"));//error
                    }*/


		    if(expressLog.Success){
                        jQuery("#expressLog").html("");  
                        if(expressLog.Traces!=""){
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
                         jQuery("#expressLog").html("暂时不支持该快递公司查询，或者快递公司编码错误！");
                    }
                }
            });
        });
    }(mui, document));

    function pay(orderSn, totalAmount, orderId, orderType) {
        if(orderType == 0){
            jumpto(fullpath + "/payment?orderSn=" + orderSn
                    + "&total=" + totalAmount
                    + "&key=" + orderId
                    + "&whichclient=whichapp");
        }else if(orderType == 1){
            showWaiting();
            jQuery.ajax({
                type: "POST",
                url: "${base}/zcorder/checkZCGoodsStatus/?orderId="+orderId,
                datatype: 'json',
                success: function(data) {
		    // 1_待发布，2_进行中，3_成功，4失败，5_作废
                    /*if(data.data == 3){
                        jumpto(fullpath + "/payment?orderSn=" + orderSn
                                + "&total=" + totalAmount
                                + "&key=" + orderId
                                + "&whichclient=whichapp");
                        closeWaiting();
                    }else if(data.data == 4){
                        closeWaiting();
                        popAlert('众筹活动失败，不能支付！');
                    }else if(data.data == 5){
                        closeWaiting();
                        popAlert('众筹活动作废，不能支付！');
                    }*/

		    if(data.status=="error"){
			 popAlert(data.message);
			 closeWaiting();
		    }else if(data.status=="success"){
			if(data.data == 3&&data.message=="after"){
			    jumpto(fullpath + "/payment?orderSn=" + orderSn
                                + "&total=" + totalAmount
                                + "&key=" + orderId
                                + "&whichclient=whichapp");
				closeWaiting();	
			}else if(data.data == 3&&data.message=="before"){
				popAlert("众筹活动尚未结束，不能支付!");
				closeWaiting();	
			}else if(data.data == 4){
				popAlert("该众筹活动已失败，不能支付!");
				closeWaiting();	
			}else if(data.data == 5){
				popAlert("该众筹活动已作废，不能支付!");
				closeWaiting(); 
			}else if(data.data == 1){
				popAlert("该众筹活动还在【待发布】阶段，不能支付!");
				closeWaiting();
			}else if(data.data == 2){
				popAlert("该众筹活动还在【进行中】阶段，不能支付!");
				closeWaiting();
			}
		    }




                },
                error:function(data){
                    popAlert(data.message);
                    closeWaiting();
                }
            });
        }

    }

</script>
</body>
</html>