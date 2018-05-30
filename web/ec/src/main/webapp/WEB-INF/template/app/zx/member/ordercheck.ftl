<!DOCTYPE html>
<html>
<head>
<#include "app/zx/head.ftl">
    <style>
        .hide { display: none;}
        .fl{ font-size: 12px;}
        .field{float: left;}
        .item{overflow: hidden; line-height: 10px;}
        .label{ float: left;}
        .tip{padding: 0px 5px 0px 0px;color: #999;background: transparent none repeat scroll 0% 0%;border: medium none;position: static;z-index: inherit; font-size: 10px; margin-left: 10px;}
        /*.item-selected {background-color: #FFF4D3;}*/
        .btn-submit{ color: red; text-decoration: none;}
        .form-btn {height: 30px;padding-top: 4px;}
        .group {zoom: 1;}
        .payment-selected{color: #8f8f94;}
        .delivery-selected{color: #8f8f94;}

        /*11-6*/
        .mui-content h5 {
            padding-top: 13px;
            padding-bottom: 13px;
            text-indent: 12px;
            border-top: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
            background: #f4f4f4;
            color: #333;
            font-size: 16px;
            margin: 0; background: #fff;
        }
       .mui-sh-box{ width: 100%;
           height: auto;
           border-top: 1px solid #d8d8d8; border-bottom: 1px solid #d8d8d8;
           background: #FFF;
           padding: 10px;
           margin: 10px 0px;
           line-height:2;
           -webkit-box-sizing: border-box;
           -moz-box-sizing: border-box;
           -ms-box-sizing: border-box;
           box-sizing: border-box;

}
        .mui-sh-box p{ margin-bottom: 0!important; font-size: 15px;}
        .mui-sh-box a{ color: #E4393C;}


        .mui-sp-box td {
            border-bottom: 1px solid #d8d8d8;
            /* border-left: 1px solid #ddd; */
            padding-left: 5px;
        }

        .mui-sp-box table {
            width: 100%;
            border-top: 1px solid #ddd;
             border-right: 1px solid #ddd!important;
            background: #FFF;
              margin-left: 0!important;
            margin-right: 0!important;
             margin: 10px;
            line-height: 30px;
            font-size: 14px;
        }

        .mui-sp-box {
            width: 100%!important;
            height: auto;
        }



        /*商品信息*/
        .order-list {
            margin-top: 10px;
        }
        .order-list dl {
            background: #fff;
            border-top: solid 1px #d8d8d8;
            border-bottom: solid 1px #d8d8d8;
            background: #fff;
            padding: 0 0 0 15px;
            margin-bottom: 0;
        }

        .order-list dl dt {
            height: 46px;
            line-height: 46px;
            display: -webkit-box;

            padding-right: 15px;
            border-bottom: dotted 1px #d8d8d8;
            color: #b2b2b2;
            font-size: 14px;
        }
        .order-list dl dt div {
            width: 50%;
        }
        .order-list dl dt .order-state span {
            color: #333;
        }
        .order-list dl dt .order-time {
            text-align: right; font-size:13px;
        }
        .order-list dl dd {
            margin-top: 15px;
        }
        .order-list dl dd .order-goods {
            display: -webkit-box;
            display: -moz-box;
            display: -o-box;
            display: -ms-box;
        }
        .order-list dl dd .order-goods .face {
            width: 115px;
            height: 115px;
            overflow: hidden;
        }
        .order-list dl dd .order-goods .face img {
            width: 100%;
            height: 100%;
        }
        .order-list dl dd .order-goods .info {
            padding: 0 15px 0 10px;
            -webkit-box-flex: 1;
            -moz-box-flex: 1;
            -o-box-flex: 1;
            -ms-box-flex: 1;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -o-box-sizing: border-box;
            box-sizing: border-box;
        }
        .order-list dl dd .order-goods .info a {
            display: block;
            height: 38px;
            line-height: 19px;
            overflow: hidden;
            font-size: 14px;
            color: #666;
        }
        .order-list dl dd .order-goods .info h4 {
            line-height: 16px;
            font-size: 15px;
            color: #E4393C;
            margin-top: 6px;
        }
        .order-list dl dd .order-goods .info p {
            color: #888;
            font-size: 12px;
        }
        .order-list dl dd .tools {
            margin-top: 13px;
            padding-right: 15px;
            text-align: right;
        }
        .order-list .bh{
            border-bottom: solid 1px #d8d8d8; padding-top:10px; font-size:14px; padding-bottom:10px; overflow:hidden;

        }
        .order-list .bh a{ padding-left:3px; color:#E4393C;}
        /*.items{line-height: 10px; overflow: hidden;}
        .items li {float: left;letter-spacing: 3px;cursor: pointer; line-height: 10px;margin-top: 3px; font-size: 12px;}
        .items .radioitem {padding: 5px 10px;margin: 3px 10px 0px;height: 18px;line-height: 10px;}*/

        ul{padding: 0; margin: 0; overflow: hidden;}
        .items{line-height: 15px; padding-top: 5px!important;}
        .items:after{display: block;  overflow: hidden;  clear: both;  height: 0;  line-height: 0;  font-size: 0;}
        .items li{float: left; letter-spacing: 3px; cursor: pointer; line-height: 34px; margin-top: 3px;  font-size: 13px; color: #555;}
        .btn{color:#ffffff; background-color: #e54044; padding: 5px 10px 5px 10px; }
        .items .radioitem{padding:5px 10px; margin: 0 10px; height: 18px; line-height: 18px; margin-top: 3px;border: #fff solid 1px;}
        .items .selected{border: #f43838 solid 1px; height: 18px; line-height: 18px;-webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;}
        .items .item-title{padding: 5px; height: 18px; line-height: 18px;}
        .items b{font-size: 10px; height: 18px; line-height: 18px; color: #ff3300; margin-left: 3px;}
        .btn{color:#ffffff; background: #E4393C; padding: 5px 15px;  -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;}
        .btn-submit {height: 30px;margin-right: 10px; padding: 0 15px; float: left;line-height: 30px;font-size: 14px;background: #E4393C;border-radius: 3px;}
        .group {zoom: 1;}
        .form-btn {height: 30px;padding-top: 4px;}
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
    <button type="button" id="jxgw" onclick="location.href='${base}/cart/list?whichclient=whichapp'" class="mui-btn  mui-btn-link mui-btn-nav mui-pull-right" style="margin-right:0px; padding-left: 6px;">
        <span class="mui-icon mui-icon-right-nav"></span>修改购物车
    </button>
</header>
<div class="mui-content" style="padding-bottom:50px; margin-top:14px;">
    <h5>填写并核对订单信息</h5>
    <div class="mui-sh-box">
        <form id="orderCheckInfo">
            <input type="hidden" id="order_receiverId" name="receiverId" value="${receiver.id}">
            <input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethod.id}">
            <input type="hidden" id="order_deliveryMethodId" name="deliveryMethodId" value="${deliveryMethod.id}">
            <!--送货时间 Auth:hks Time:2015-11-13 14:37:52 Start -->
            <input type="hidden" id="order_deliveryTime" name="deliveryTime" value="${deliveryTimeList[0].introduce}">
            <!--送货时间  Auth:hks Time:2015-11-13 14:37:52  end -->
            <input type="hidden" id="cartItemIds" name="cartItemIds" value="${o}">
            <input type="hidden" name="invoiceType" id="invoiceType" value="${invoiceInfo.invoiceType}"/>
            <input type="hidden" name="invoiceTitle" id="invoiceTitle" value="${invoiceInfo.invoiceTitle}"/>
            <input type="hidden" name="invoiceContent" id="invoiceContent" value="${invoiceInfo.invoiceContent}"/>
        </form>
        <div >
            <p ><b style="font-size: 15px;">收货人信息</b> <a onclick="toReceiver();" ><#if receiver == null> [设置] <#else > [修改]</#if> </a></p>
            <#if receiver != null>
                <p>${receiver.name} &nbsp; ${receiver.mobile} &nbsp;  &nbsp; </p>
                <p style="border-bottom: 1px solid #d8d8d8; padding-bottom: 5px;">
                    ${receiver.areaName} &nbsp;${receiver.address}
                </p>
            </#if>
            <p style=" padding-top: 4px;"><b style="font-size: 15px;">支付及配送方式 </b><a href="#" onclick="modifyPay()">[修改]</a></p>
            <div id="payMent" style="border-bottom: 1px solid #d8d8d8; margin-bottom: 7px; padding-bottom: 2px;">
                <p ><div class="payment-selected" style="font-size: 14px;">${paymentMethod.name}</div></p>
                <p><div class="delivery-selected" style="font-size: 14px;">${deliveryMethod.name}</div><font style="color:#E4393C; font-size: 15px;"> 预计 7日内 送达</font> </p>
            </div>
            <div class="hide" id="payMentList">
                <div id="payment-ship" style="position: static;">
                    <div id="paymentDiv">
                        <p><b>支付方式</b></p>
                        <#--<div style="padding-bottom:10px"></div>-->
                        <div class="mc form">
                            <#list paymentMethodList as payment>
                            <#if payment.enabled == 1>
                                <div class="item" style="height: 28px;">
                                    <div class="label">
                                        <input style="position: absolute; margin-left: 2px; margin-top: 1px;" type="radio" name="paymentRad" <#if payment_index==0 || paymentMethod.id==payment.id> checked </#if>  payname="${payment.name}" payid="${payment.id}" id="pay-method-${payment.id}" class="hookbox" value="${payment.id}">
                                        <label id="pay-method-label-${payment.id}" for="pay-method-${payment.id}" class="fl" style=" margin-left: 20px;">${payment.name}</label>
                                    </div>
                                    <div class="field">
                                        <span class="tip">${payment.description}</span>
                                    </div>
                                    <span class="clr"></span>
                                </div>
                            </#if><!--item end-->
                            </#list>
                        </div><!--mc end-->
                    </div><!--payment end-->

                    <div id="shipment" style="padding-top:0px;display: none">
                        <p><b>配送方式</b></p>
                        <#--<div style="padding-bottom:10px"></div>-->
                        <#list deliveryMethodList as delivery>
                        <div class="item" style="height: 28px;">
                            <div class="label">
                                <!--当选择配送方式时刷新页面 选择的值不变 Auth:zhangqiang Time:2015-09-25 17:41:35 Start -->
                                <!--<input type="radio" name="delivery" <#if delivery_index==0>checked</#if> onclick="choseDelivery('${delivery.id}')" payname="${delivery.name}" payid="${delivery.id}" id="delivery-method-${delivery.id}" class="hookbox" value="${delivery.id}">-->
                                <input style="position: absolute; margin-left: 2px; margin-top: 1px;" type="radio" name="deliveryRad" <#if (didFlag==0 && delivery_index==0) || (delivery.id==didFlag)>checked</#if> payname="${delivery.name}" payid="${delivery.id}" id="delivery-method-${delivery.id}" class="hookbox" value="${delivery.id}">
                                <!--当选择配送方式时刷新页面 选择的值不变 Auth:zhangqiang Time:2015-09-25 17:41:35 End -->
                                <label style=" margin-left: 20px;" id="delivery-method-label-${delivery.id}" for="delivery-method-${delivery.id}" class="fl">${delivery.name}</label>
                            </div>
                            <div class="field">
                                <span class="tip">${delivery.description}</span>
                            </div>
                            <span class="clr"></span>
                        </div><!--item end-->
                        </#list>

                    </div><!--shipment end-->
                    <div id="delivery-time">
                        <p><b>送货时间：</b></p>
                        <div class="middle">
                            <#list deliveryTimeList as deliveryTime>
                            <div class="item" style="height: 28px;">
                                <div class="label">
                                    <input style="position: absolute; margin-left: 2px; margin-top: 1px;"  id="delivery-t3" name="delivery-t" <#if deliveryTime_index==0>checked</#if>  value="${deliveryTime.id}" type="radio" onclick="$('#order_deliveryTime').val('${deliveryTime.introduce}');">
                                    <label  style=" margin-left: 20px;"  class="fl">${deliveryTime.introduce}</label>
                                </div>
                            </div>
                            </#list>
                        </div>
                    </div><!--delivery-time end-->
                    <span class="clr"></span>
                    <div class="form-btn group">
                        <a href="javascript:void(0);"  class="btn-submit"  style="color:#ffffff;margin-left:10px;padding-left:10px;padding-right:10px;" onclick="save_PayAndShip()">保存支付及配送方式</a>
                    </div>
                </div><!--payment-ship end-->
            </div>
            <div id="step-3" class="step step-complete"><a name="invoiceFocus"></a>
			<div class="step-title">
				<div id="save-invoice-tip" class="step-right"></div>
				<p><b>发票信息</b>
                <a href="javascript:void(0);" id="editInvoice" onclick="edit_Invoice()">[修改]</a>
                <a href="javascript:void(0);" id="saveInvoiceTitleMinDiv" class="hide" style=" color: #E4393C;" onclick="save_Invoice()">保存发票信息</a></p>

				<#--<span class="step-action" id="part-invoice_edit_action">
					<a href="javascript:void(0);" id="editInvoice" onclick="edit_Invoice()">[修改]</a>
					<a href="javascript:void(0);" id="saveInvoiceTitleMinDiv" class="hide" style="color:#005EA7;" onclick="save_Invoice()">保存发票信息</a>
				</span>-->
			</div><!--step-title end-->
			<div class="step-content">
				<div id="part-invoice" class="sbox-wrap">
					<div class="sbox">
						<div class="invoice" id="invoice-content">
							<div class="invoice-content" style="line-height: 28px;font-size: 14px; color: #8f8f94;">
								发票类型：<span id="invoiceInfo"><#if invoiceInfo.invoiceContent=="no">不开发票<#else><#if invoiceInfo.invoiceType=="normal">普通发票</#if>&nbsp;&nbsp;${invoiceInfo.invoiceTitle}&nbsp;&nbsp;<#if invoiceInfo.invoiceContent=="infos">明细</#if></#if>&nbsp;&nbsp;</span>
							</div>
						</div>

						<div class="form hide" id="invoice-edit-div">
							<div><ul class="items">
                                    <li class="item-title">发票类型：</li>
                                    <li class="radioitem <#if invoiceInfo.invoiceType=="normal">selected</#if>" type="invoiceType" value="normal">普通发票</li>
                            </ul></div>
                            <div>
                                <ul class="items">
                                <li class="item-title">发票抬头：</li>
                                        <#list memberInvoicesList as invoice>
                                               <li class="radioitem <#if invoice.invoiceTitle==memberInvoice.invoiceTitle>selected</#if>" type="invoiceTitle" id="${invoice.id}" value="${invoice.invoiceTitle}">
                                                   <span>${invoice.invoiceTitle}</span>
                                                   <b onclick="deleteInvoice('${invoice.id}','${invoice.invoiceTitle}');">X</b>
                                               </li>
                                           <#-- <div style="clear:both;"></div>-->
                                        </#list>
                                </ul>
                            </div>
                            <div><ul class="items">
                                <li class="hide addnew">
                                    <label for="title">
                                        <strong><span id="action">新增</span>发票抬头：</strong>
                                    </label>
                                    <input type="text" name="title" id="title" style="margin-top: 7px;"/>
                                    <input type="hidden" name="id" id="id" value=""/>
                                </li>
                                <li>
                                    <a href="javascript:;" class="closeaddnew btn" style="color: #ffffff"  onclick="addInvoiceTitle();">新增</a>&nbsp;
                                    <a href="javascript:;" class="hide addnew btn" style="color: #ffffff"  onclick="saveInvoiceTitle();">保存</a>&nbsp;
                                    <a href="javascript:;" class="hide addnew btn" style="color: #ffffff"  onclick="closeaddInvoiceTitle();">关闭</a>
                                </li>
                            </ul></div>
                            <div><ul class="items">
                                <li class="item-title">发票内容：</li>
                                <li class="radioitem <#if invoiceInfo.invoiceContent=="no">selected</#if>" type="invoiceContent" value="no">不开发票</li>
                                <li class="radioitem <#if invoiceInfo.invoiceContent=="infos">selected</#if>" type="invoiceContent" value="infos">明细</li>
                            </ul></div>
                            <div class="form-btn group">
                                <a href="javascript:void(0);" id="saveInvoiceTitleMinDiv" class="btn-submit"  style="color:#ffffff;margin-left:10px;padding-left:10px;padding-right:10px;" onclick="save_Invoice()">保存发票信息</a>
                            </div>
                        </div><!--payAndShip-edit-div end-->
					</div>
				</div><!--part-invoice end-->
			</div><!--step-content end-->
		</div><!--step-3 end-->
        </div>
    </div>
    <#--<div class="mui-sp-box">-->
        <#--<table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="715">商品</td>
                <td width="135">商城价</td>
                <td width="104">优惠</td>
                <td width="161">数量</td>
                <td width="361">库存状态</td>
            </tr>
            <#assign total = 0>
            <#assign totalPrice = 0>
            <#assign deliveryFee = 0>
            <#list cartItemList  as map>
            <#list map.items as cartItem>
                <#assign total = total+cartItem.quantity>
                <#assign totalPrice = totalPrice+(cartItem.price?number)*cartItem.quantity>
                <#assign deliveryFee = deliveryFee+(map.deliveryFeeTotal?number)>
                <tr>
                    <td>
                        <p><img src="${cartItem.pic}_437x374.png" width="100%"></p>
                        <p><a href="/item/whichapp/${cartItem.goodsId}.html" style="color:#06F; margin-left:3px;">${cartItem.name}</a></p>
                        <p>商品编号：${cartItem.sn}</p></td>
                    <td>￥${cartItem.price}</td>
                    <td>0.00</td>
                    <td>x ${cartItem.quantity}</td>
                    <td skuid="${cartItem.goodsId}">有货</td>
                </tr>
            </#list>
            </#list>
            <tr>
                <td colspan="5" style="text-align:right; line-height:24px; padding-right:5px;">
                    <p>${total} 件商品，总商品金额：<em  id="warePriceId" v="${totalPrice?string('##0.00')}">￥${totalPrice?string('##0.00')}</em></p>
                    <p>运费： <em class="price" id="freightPriceId"> ￥${deliveryFee?string('##0.00')}</em></p>
                    <#assign totalPrice = totalPrice + deliveryFee>
                    <p>应付总额： <em id="sumPayPriceId" class="price"> ￥${totalPrice?string('##0.00')}</em></p>
                    <button class="mui-btn mui-btn-primary mui-pull-right" onclick="javascript:submit_Order();" style=" margin-top:2px; margin-right:5px; margin-bottom:10px;">
                        提交订单
                    </button>
                </td>
            </tr>
        </table>-->
    <div class="step-title" style="padding-left:10px;padding-right:10px;">
        <div id="save-invoice-tip" class="step-right"></div>
        <p><b style="font-size: 15px;">商品清单</b>
    </div>
        <div class="order-list">
            <#assign discount = 0>
            <#assign total = 0>
            <#assign totalPrice = 0>
            <#assign deliveryFee = 0>
            <#list cartItemList  as map>
                <#assign discount = discount+(map.discount?number)>
                <#assign totalPrice = totalPrice+(map.goodsTotal?number)>
                <#assign deliveryFee = deliveryFee+(map.deliveryFeeTotal?number)>
                <#list map.items as cartItem>
                    <#assign total = total+cartItem.quantity>
            <dl>
                <div class="bh">
                   <#-- <div style="float:left;">商品编号：<a href="${base}/item/whichapp/${cartItem.goodsId}.html">${cartItem.sn}</a></div>-->
                    <div style="float:right; padding-right:15px; color:#888;" skuid="${cartItem.goodsId}">库存状态：有货</div>
                </div>
                <dd>
                    <div class="order-goods" style="padding-bottom: 15px;">
                        <div class="face"><a href="${base}/item/whichapp/${cartItem.goodsId}.html"><img src="${cartItem.pic}_437x374.png"></a></div>
                        <div class="info"> <a href="${base}/item/whichapp/${cartItem.goodsId}.html">${cartItem.name}</a>
                            <p class="title" style="height:38px;overflow: hidden;margin-bottom:0px;">${cartItem.specification}</p>
                           <h4>¥${cartItem.price}<span style="padding-left: 10px; font-size: 13px; color: #999; font-weight: normal; ">等级优惠：${(cartItem.price?number * memberRankScale?number)?string('currency')}</span></h4>
                            <div><p>共${cartItem.quantity}件</p></div>
                        </div>
                    </div>

                </dd>
            </dl>
            </#list>
            </#list>
            <div style=" background: #fff; text-align: right; padding: 15px 0; padding-right: 10px; border-bottom: 1px solid #d8d8d8;  overflow: hidden;">
                <p style="font-size: 14px; margin-bottom: 5px;">${total} 件商品，总商品金额：<em style="font-style: normal;"  id="warePriceId" v="${totalPrice?string('##0.00')}">￥${totalPrice?string('##0.00')}</em></p>
                <p style="font-size: 14px; margin-bottom: 5px;">运费： <em  style="font-style: normal;"  class="price" id="freightPriceId"> ￥${deliveryFee?string('##0.00')}</em></p>
                <p style="font-size: 14px; margin-bottom: 5px;">优惠合计： <em  style="font-style: normal;"  class="price" id="freightPriceId">￥${discount?string('##0.00')}</em></p>
            <#assign totalPrice = totalPrice + deliveryFee>
                <p style="font-size: 14px;">应付总额： <em  style="font-style: normal; font-size: 16px; font-weight: bold; color: #E4393C;"  id="sumPayPriceId" class="price"> ￥${totalPrice?string('##0.00')}</em></p>
                <button class="mui-btn mui-btn-primary mui-pull-right" onclick="javascript:submit_Order();" style=" padding:8px 18px; font-size: 16px; margin-top:2px; margin-right:5px; margin-bottom:10px;">
                    提交订单
                </button>

            </div>

        </div>

    <#--</div>-->
</div>
<#include "app/zx/tools.ftl">
<script>
    jQuery(function(){
       jQuery(".items").on('click','.radioitem',function(){
            jQuery("#"+jQuery(this).attr("type")).val(jQuery(this).attr("value"));
            jQuery(this).parent().find(".radioitem").removeClass("selected");
            jQuery(this).addClass("selected");
        });
        jQuery(".items").on('dblclick','.radioitem',function(){
            editInvoice(jQuery(this).find("a").text(),jQuery(this).attr("id"));
        });
    });
    /**
     * 提交订单
     */
    function submit_Order(){

        var receiverId=jQuery("#order_receiverId").val();
        if(receiverId.length==0){
            popAlert("请选择收货人!");
            return;
        }
        showWaiting();
        jQuery.ajax({
            type: "post",
            url: "${base}/order/submit?whichclient=whichapp",
            data:jQuery("#orderCheckInfo").formSerialize(),
            dataType: "json",
            success: function (data) {
                if (data.status == "success") {
                    jumpto(fullpath + "/order/view/" + data.orderId + ".html?whichclient=whichapp");
//                    if (data.payType == "online") {
//                        window.location.href =base+"payment?orderSn="+data.orderSn+"&total="+data.totalAmount+"&key="+data.orderId+"&t="+Math.random();
//                    } else if(data.payType == "offline") {
//                        window.location.href = base + "order/view/" + data.orderId + ".html?whichclient=whichapp";
//                    }
                    closeWaiting();
                } else {
                    closeWaiting();
                    popAlert(data.message);
                }
                
            },
            error : function(error) {
                closeWaiting();
                popAlert("亲爱的用户请不要频繁点击, 请稍后重试...");
                //$("#order-loading").replaceWith(originSubmit);
                //$("#submit_message").html("亲爱的用户请不要频繁点击, 请稍后重试...");
                //$("#submit_message").show();
            }

        });
    }
    function modifyPay(){
        jQuery("#payMent").toggle();
        jQuery("#payMentList").toggle();
    }
/**
 * 保存支付与配送方式   点击保存 会去根据选择的快递方式计算费用 Auth:zhangqiang Time:2015-09-25 17:46:25 Start
 */
function save_PayAndShip() {
    var paymentMethodName=jQuery("input:radio[name='paymentRad']:checked").attr("payname");
    var paymentMethodId=jQuery("input:radio[name='paymentRad']:checked").attr("payid");
    jQuery(".payment-selected").html(paymentMethodName);

    var deliveryMethodName=jQuery("input:radio[name='deliveryRad']:checked").attr("payname");
    var deliveryMethodId=jQuery("input:radio[name='deliveryRad']:checked").attr("payid");
    jQuery(".delivery-selected").html(deliveryMethodName);

    jQuery("#payMent").toggle();
    jQuery("#payMentList").toggle();
    jQuery("#order_paymentMethodId").val(paymentMethodId);
    jQuery("#order_deliveryMethodId").val(deliveryMethodId);

    if (!isEmpty(deliveryMethodId)) {
        window.location.href = "${base}/member/ordercheck?o=${o}&deliveryId="+deliveryMethodId+"&whichclient=whichapp&receiverId=${receiver.id}&paymentId="+paymentMethodId;
    }
}

/**
 * 判断是否是空 Auth:zhangqiang Time:2015-09-25 17:43:35
 * @param value
 */
function isEmpty(value){
    if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
        return true;
    }
    else{
        value = (value+"").replace(/\s/g,'');
        if(value == ""){
            return true;
        }
        return false;
    }
}

    /**
     * 修改收货地址
     */
    function toReceiver(){
        var paymentMethodId=jQuery("#order_paymentMethodId").val();
        var deliveryId = jQuery("#order_deliveryMethodId").val();
        var url="${base}/member/receiver?whichclient=whichapp&to=orderCheck&o=${o}&paymentId="+paymentMethodId+"&deliveryId="+deliveryId;
        window.location.href=url;
    }

    /**
     * 编辑发票信息
     */
    function edit_Invoice() {
        jQuery("#step-3").addClass("step-current");
        jQuery("#editInvoice").hide();
        jQuery("#saveInvoiceTitleMinDiv").show();
        jQuery("#invoice-content").hide();
        jQuery("#invoice-edit-div").show();
    }


    /**
     * 删除发票抬头
     * */
    function deleteInvoice(id,invoiceTitle){
        if(invoiceTitle=='个人'){
            popAlert("这是发票默认抬头不允许删除！");
        }else {

            var layer_confrim = layer.open({
                title:'提示：',
                content:'您确定要删除[' + invoiceTitle + ']这个发票抬头吗？删除后将不可恢复。',
                btn: ['确认', '取消'],
                shadeClose: false,
                yes: function(){
                    layer.close(layer_confrim);
                    showWaiting();

                    jQuery.ajax({
                        type: "post",
                        url: "${base}/member/deleteInvoice",
                        data: "id=" + id,
                        dataType: "json",
                        success: function (data) {
                            if (data.success) {
                                popAlert(data.msg);
                                jQuery("#" + id).remove();
                            } else {
                                popAlert(data.msg);
                            }
                            closeWaiting();
                        },
                        error:function(data){
                            popAlert(data.message);
                            closeWaiting();
                        }
                    });

                },
                no: function(){
                    closeWaiting();
                }
            });
        }
    }

    /**
     * 保存发票内容
     */
    function save_Invoice() {
        if(jQuery("#invoiceContent").val()=="no") {
            jQuery.ajax({type: "post",
                url: "${base}/member/saveInvoiceSetting",
                data:"invoiceContent=no",
                dataType: "json",
                success:function(data){
                    if(data.success){
                        popAlert(data.msg);
                        jQuery("#invoiceInfo").text(jQuery(".selected[type='invoiceContent']").text());
                        jQuery("#invoiceType").val("");
                        jQuery("#invoiceTitle").val("");
                        jQuery("#invoiveContent").val("no");
                        closeInvoiceForm();
                    }else{
                        popAlert(data.msg);
                    }
                }
            });
        }else{
            if(jQuery(".selected[type='invoiceType']").text()==""){
                popAlert("请选择发票类型！");
            }else if(jQuery(".selected[type='invoiceTitle']").text()==""){
                popAlert("请选择发票抬头！");
            }else {
                jQuery.ajax({
                    type: "post",
                    url: "${base}/member/saveInvoiceSetting",
                    data: "invoiceTitle=" + jQuery(".selected[type='invoiceTitle'] a").text() + "&id=" + jQuery(".selected[type='invoiceTitle']").attr("id") + "&invoiceContent=" + jQuery(".selected[type='invoiceContent']").text(),
                    dataType: "json",
                    success: function (data) {
                        if (data.success) {
                            popAlert(data.msg);
                            var info = jQuery(".selected[type='invoiceType']").text() + "　　" + jQuery(".selected[type='invoiceTitle'] a").text() + "　　" + jQuery(".selected[type='invoiceContent']").text();
                            jQuery("#invoiceInfo").text(info);
                            closeInvoiceForm();
                        } else {
                            popAlert(data.msg);
                        }
                    }
                });
            }
        }
    }

    function closeInvoiceForm(){
        jQuery("#step-3").removeClass("step-current");
        jQuery("#editInvoice").show();
        jQuery("#saveInvoiceTitleMinDiv").hide();
        jQuery("#invoice-content").show();
        jQuery("#invoice-edit-div").hide();
    }

    function addInvoiceTitle(){
        jQuery("#action").text("新增");
        jQuery(".addnew").show();
        jQuery(".closeaddnew").hide();
    }
    function closeaddInvoiceTitle(){
        jQuery(".addnew").hide();
        jQuery(".closeaddnew").show();
        jQuery("#title").val("");
        jQuery("#id").val("");
    }

    function editInvoice(title,id){
        if(title=='个人'){
            popAlert("默认发票抬头不允许修改！");
        }else {
            jQuery("#id").val(id);
            jQuery("#title").val(title);
            jQuery("#action").text("修改");
            jQuery(".addnew").show();
            jQuery(".closeaddnew").hide();
        }
    }

    function saveInvoiceTitle(){
        if(jQuery("#title").val()==""){
            popAlert("发票抬头不能为空！");
            jQuery("#title").focus();
        }else{
            if(jQuery("#id").val()!=""){
                if(jQuery("#title").val()!=jQuery("#"+jQuery("#id").val()+" span").text()){
                    var ishave = false;
                    jQuery(".radioitem[type='invoiceTitle']").each(function () {
                        if (jQuery("#title").val() == jQuery(this).find("a").text() && jQuery("#id").val()!=jQuery(this).attr("id")) {
                            popAlert("该发票抬头已经存在！");
                            ishave = true;
                        }
                    });
                    if (!ishave) {
                        jQuery.ajax({
                            type: "post",
                            url: "${base}/member/editInvoice",
                            data: "invoiceTitle=" + jQuery("#title").val() + "&id=" + jQuery("#id").val(),
                            dataType: "json",
                            success: function (data) {
                                if (data.success) {
                                    popAlert(data.msg);
                                    jQuery("#" + jQuery("#id").val() + " a").text(jQuery("#title").val());
                                    jQuery("#invoiceTitle").val(jQuery("#title").val());
                                    closeaddInvoiceTitle();
                                } else {
                                    popAlert(data.msg);
                                }
                            },
                            error: function () {
                                popAlert("亲爱的用户请不要频繁点击, 请稍后重试...");
                            }
                        })
                    }
                }else{
                    closeaddInvoiceTitle();
                }
            }else {
                var ishave = false;
                jQuery(".radioitem[type='invoiceTitle']").each(function () {
                    if (jQuery("#title").val() == jQuery(this).find("a").text()) {
                        popAlert("该发票抬头已经存在！");
                        ishave = true;
                    }
                });
                if (!ishave) {
                    jQuery.ajax({
                        type: "post",
                        url: "${base}/member/saveInvoice",
                        data: "invoiceTitle=" + jQuery("#title").val(),
                        dataType: "json",
                        success: function (data) {
                            if (data.success) {
                                popAlert(data.msg);
                                jQuery(".radioitem[type='invoiceTitle']").removeClass("selected");
                                var html = "<li class=\"radioitem selected\" type=\"invoiceTitle\" id=\""+data.id+"\" value=\"" + jQuery("#title").val() + "\"><a href=\"javascript:;\" title=\"双击修改\">" + jQuery("#title").val() + "</a><b onclick=\"deleteInvoice('" + data.id + "','" + jQuery("#title").val() + "');\">X<b></li>";
                                jQuery(".radioitem[type='invoiceTitle']").parent().append(html);
                                jQuery("#invoiceTitle").val(jQuery("#title").val());
                                closeaddInvoiceTitle();
                                jQuery("#title").val("");
                            } else {
                                popAlert(data.msg);
                            }
                        },
                        error: function () {
                            popAlert("亲爱的用户请不要频繁点击, 请稍后重试...");
                        }
                    })
                }
            }
        }
    }

</script>
</body>
</html>