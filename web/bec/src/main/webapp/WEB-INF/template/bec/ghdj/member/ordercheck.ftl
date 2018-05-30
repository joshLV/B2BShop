<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<style type="text/css">
    .order-summary .statistic span {
        margin-right: 10px;
    }
</style>

<div id="container">
    <#include "bec/ghdj/top2.ftl"/>
    <div class="main f-cb" style="position: relative;">
        <h1 class="order_tit">填写并核对订单信息</h1>
        <div class="headr" style="position: absolute; right:0; top: -100px; z-index: 99999;">
            <div class="flow-steps">
                <ol class="num5">
                    <li class="done current-prev"><span>1. 我的购物车</span></li>
                    <li class="current"><span>2. 填写核对订单信息</span></li>
                    <li class="last"><span>3. 成功提交订单</span></li>
                </ol>
            </div>
        </div>
        <div class="order_info">
            <h1>收货地址</h1>
            <form id="orderCheckInfo">
                <#--Desc:createOrderType--》产生订单类型 值为1表示  由采购单生成订单 其它此参数不起作用-->
                <input type="hidden" id="createOrderType" name="createOrderType" value="${createOrderType}">

                <input type="hidden" id="order_receiverId" name="receiverId" value="${receiver.id}">
                <input type="hidden" id="order_receiverId_back" name="order_receiverId_back" value="${receiver.id}"><!--当新增窗口打开时会清空 order_receiverId的值  新增打开什么都不做 用此处还原之前的选择 -->
                <#--<input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethod.id}">-->
                <input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethodIds}">

                <input type="hidden" id="order_deliveryMethodId" name="deliveryMethodId" value="${deliveryMethod.id}">
                <!--送货时间 Auth:hks Time:2015-11-13 14:37:52 Start -->
                <#--<input type="hidden" id="order_deliveryTime" name="deliveryTime" value="${deliveryTimeList[0].introduce}">-->
                <input type="hidden" id="order_deliveryTime" name="deliveryTime" value="${deliveryTimeIds}">
                <input type="hidden" id="order_deliveryTimeName" name="order_deliveryTimeName" value="${deliveryTimeName}">
                <!--送货时间  Auth:hks Time:2015-11-13 14:37:52  end -->
                <input type="hidden" id="order_cartItemIds" name="cartItemIds" value="<#list cartItemList as map><#list map.items as cartItem>${cartItem.id},</#list></#list>">

                <!--设置平台类型(1.B2B、2.B2C)  Auth:hks Time:2015-10-21 18:04:35 Start  在修改这个的时候 曾经好像在梦中见过 -->
                <input type="hidden" id="platform" name="platform" value="1">
                <input type="hidden" id="dataFrom" name="dataFrom" value="2">
                <!--设置平台类型(1.B2B、2.B2C)  Auth:hks Time:2015-10-21 18:04:35 End -->

                <input type="hidden" name="invoiceType" id="invoiceType" value="${invoiceInfo.invoiceType}"/>
                <input type="hidden" name="invoiceTitle" id="invoiceTitle" value="${invoiceInfo.invoiceTitle}"/>
                <input type="hidden" name="invoiceContent" id="invoiceContent" value="${invoiceInfo.invoiceContent}"/>

                <input type="hidden" name="hasInsuranceFee" id="hasInsuranceFee" value="${hasInsuranceFee}"/>
                <input type="hidden" name="isMemberPrice" id="isMemberPrice" value="${isMemberPrice}"/>
            </form>
            <div class="columnright">
                <div class="mod_address_book">
                    <div id="addressListDiv" class="addressListDiv">
                        <input type="hidden" value="1" id="size">
                        <input type="hidden" id="addressNum_top" value="${receiverList?size}">
                        <ul class="adr_list" id="consignee-list">
                            <#list receiverList as receiver>
                                <li class="<#if receiver.isDefault==1>address_on hover_li</#if>" id = "consignee_radio_${receiver.id}"  isDefault="<#if receiver.isDefault==1>true<#else>false</#if>">
                                    <p class="using_add"> 默认地址 </p>
                                    <div class="vcard" onclick="chooseCurrAddress('${receiver.id}')">
                                        <p> <strong>${receiver.name} </strong>&nbsp;&nbsp;&nbsp;收 </p>
                                        <p class="adr"> <span class="street-address"> <strong class="locality"> ${receiver.areaName} </strong> <span class="street-address">${receiver.address}</span> </p>
                                        <p class="tel">  ${receiver.mobile}&nbsp;&nbsp;&nbsp;&nbsp;${receiver.phone}</p>
                                    <#--<p >  ${receiver.email} </p>-->
                                        <p > ${receiver.zipCode} </p>
                                    </div>
                                <div class="edit_box clearfix">
                                    <button class="del_adr" title="删除地址" onClick="showTips('${receiver.id}');"> 删除 </button>
                                    <a class="aBlu btn_edit" href="javascript:void(0)" id="show" onClick="show_ConsigneeDetail('${receiver.id}',event)">编辑</a>
                                    <#if receiver.isDefault==1>
                                        <a id="addrDefault" class="btn_set_common" href="javascript:void(0)" onClick="setDefault('${receiver.id}')">默认地址</a>
                                    <#else>
                                        <a class="btn_set_common" onClick="setDefault('${receiver.id}')" href="javascript:void(0)">设为默认地址</a></div>
                                    </#if>
                                    <div class="tips_del" id="tips_${receiver.id}">
                                        <p class="txt"> 确认删除该收货地址吗？ </p>
                                        <div class="btn_box">
                                            <button onClick="delReceiver('${receiver.id}')" class="btn_sure"> <span>确认</span> </button>
                                            <button class="btn_cancle" onClick="hideTips('${receiver.id}');"> <span>取消</span> </button>
                                        </div>
                                    </div>
                                </li>
                            </#list>
                            <li type="2" id="address_list_li_3" class="li_add_addr add_adr saveAddress last" isDefault="false">
                                <p> <a class="btn_add_addr"  href="javascript:void(0)" id="show" onClick="use_NewConsignee()"><i>&nbsp;</i>添加新收货地址</a> </p>
                                <div class="tips_care" id="tips_full_2">
                                    <p> 地址已满6条，无法再添加新地址 </p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <h1>支付方式</h1>
            <div class="online online_on">
                <#list paymentMethodList as payment>
                    <#if paymentMethodIds ??>
                        <div class="online_info">
                            <input type="radio" name="payment" id="pay-method-${payment.id}" <#if payment.id==paymentMethodIds>checked</#if> onclick="chosePayment('${payment.id}')" payname="${payment.name}" payid="${payment.id}" value="${payment.id}" >
                            <label class="pay_info"><b id="pay-method-label-${payment.id}">${payment.name}</b>${payment.description}</label>
                        </div>
                    <#else >
                        <#if payment.enabled == 1>
                            <div class="online_info">
                                <input type="radio" name="payment" id="pay-method-${payment.id}" <#if payment_index==0>checked</#if> onclick="chosePayment('${payment.id}')" payname="${payment.name}" payid="${payment.id}" value="${payment.id}" >
                                <label class="pay_info"><b id="pay-method-label-${payment.id}">${payment.name}</b>${payment.description}</label>
                            </div>
                        </#if>
                    </#if>

                </#list>
            </div>
            <h1>送货方式</h1>
            <div class="peis_info">
            <#list deliveryMethodList as delivery>
                <div class="online_info">
                    <input type="radio" name="delivery" id="delivery-method-${delivery.id}" <#if deliveryMethod.id == delivery.id>checked</#if> value="${delivery.id}" onclick="choseDelivery('${delivery.id}')" payname="${delivery.name}" payid="${delivery.id}">
                    <label class="pay_info"><b id="delivery-method-label-${delivery.id}">${delivery.name}</b>${delivery.description}</label>
                </div>
            </#list>
            </div>
            <h1>送货时间</h1>
            <div class="peis_info">
                <#--<#list deliveryMethodList as delivery>
                    <div class="online_info">
                        <input type="radio" name="delivery" id="delivery-method-${delivery.id}" <#if delivery_index==0>checked</#if> value="${delivery.id}" onclick="choseDelivery('${delivery.id}')" payname="${delivery.name}" payid="${delivery.id}">
                        <label class="pay_info"><b id="delivery-method-label-${delivery.id}">${delivery.name}</b>${delivery.description}</label>
                    </div>
                </#list>-->
                <div id="delivery-time">
                    <#--<div class="f-fl"> <span class="label">送货时间：</span> </div>-->
                    <div class="middle">
                        <#list deliveryTimeList as deliveryTime>
                            <div class="field">
                            <#if deliveryTimeIds??>
                                <input id="delivery-time-${deliveryTime.id}" name="deliveryTime" <#if deliveryTimeIds==deliveryTime.id>checked</#if> class="hookbox" value="${deliveryTime.id}" type="radio" onclick="$('#order_deliveryTime').val('${deliveryTime.id}');$('#order_deliveryTimeName').val('${deliveryTime.introduce}');">
                            ${deliveryTime.introduce}
                            <#else >
                                <input id="delivery-time-${deliveryTime.id}" name="deliveryTime" <#if deliveryTime_index==0>checked</#if> class="hookbox" value="${deliveryTime.id}" type="radio" onclick="$('#order_deliveryTime').val('${deliveryTime.id}');$('#order_deliveryTimeName').val('${deliveryTime.introduce}');">
                            ${deliveryTime.introduce}
                            </#if>

                            </div>
                        </#list>
                    </div>
                </div>
            </div>

            <h1>会员价、保价</h1>
            <div class="peis_info">
                <div>
                    <input type="checkbox" id="isMemberPrice_checkbox" value="yes" onchange="choseIsMemberPrice()" <#if isMemberPrice == 'yes'>checked="checked"</#if>/>&nbsp;&nbsp;会员价
                </div>
                <div>
                    <input type="checkbox" id="hasInsuranceFee_checkbox" value="yes" onchange="choseHasInsuranceFee()" <#if hasInsuranceFee == 'yes'>checked="checked"</#if>/>&nbsp;&nbsp;保价
                </div>
            </div>

            <h1>发票信息</h1>

            <div class="peis_info">
                <div id="step-3" class="step step-complete"><a name="invoiceFocus"></a>
                    <div class="step-title">
                        <div id="save-invoice-tip" class="step-right"></div>
                        <strong>发票信息</strong>
                        <span class="step-action" id="part-invoice_edit_action">
                            <#if isMemberPrice != 'yes'>
                            <a href="javascript:void(0);" id="editInvoice" onclick="edit_Invoice()">[修改]</a>
                            <a href="javascript:void(0);" id="saveInvoiceTitleMinDiv" class="hide" style="color:#005EA7;" onclick="save_Invoice()">保存发票信息</a>
                            </#if>
                        </span>
                    </div><!--step-title end-->
                    <div class="step-content">
                        <div id="part-invoice" class="sbox-wrap">
                            <div class="sbox">
                                <div class="invoice" id="invoice-content">
                                    <div class="invoice-content">
                                        发票类型：<span id="invoiceInfo"><#if invoiceInfo.invoiceContent=="no">不开发票<#else><#if invoiceInfo.invoiceType=="normal">普通发票</#if>&nbsp;&nbsp;${invoiceInfo.invoiceTitle}&nbsp;&nbsp;<#if invoiceInfo.invoiceContent=="infos">明细</#if></#if>&nbsp;&nbsp;</span>
                                    </div>
                                </div>
                                <div class="form hide" id="invoice-edit-div" style="position: relative; right: 0px; top: 0px; width:100%;">
                                    <div>
                                        <ul class="items">
                                            <li class="item-title">发票类型：</li>
                                            <li class="radioitem <#if invoiceInfo.invoiceType=="normal">selected</#if>" type="invoiceType" value="normal">普通发票</li>
                                        </ul>
                                    </div>
                                    <div>
                                        <h3 class="item-title" style="float: left;">发票抬头：</h3>
                                        <ul class="items" id="fptt" style="width: 1000px">
                                            <#list memberInvoicesList as invoice>
                                                <li class="radioitem invoiceTitel <#if invoice.invoiceTitle==memberInvoice.invoiceTitle>selected</#if>" type="invoiceTitle" id="${invoice.id}" value="${invoice.invoiceTitle}">
                                                    <a href="javascript:;" title="双击修改">${invoice.invoiceTitle}</a>
                                                    <b onclick="deleteInvoice('${invoice.id}','${invoice.invoiceTitle}','${invoice_index}');" class="close-color"></b>
                                                </li>
                                            </#list>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul class="items">
                                            <li class="hide addnew">
                                                <label for="title" class="fl"><span id="action">新增</span>发票抬头：</label>
                                                <input type="text" name="title" id="title" style="height:28px; line-height:28px;border:#e8e8e8 solid 1px;padding:0 5px; width:260px; margin-top: 2px;"/>
                                                <input type="hidden" name="id" id="id" value=""/>
                                            </li>
                                            <li class="f-cb">
                                                <a href="javascript:;" class="add-items f-fl closeaddnew" onclick="addInvoiceTitle();">新增</a>
                                                <a href="javascript:;" class="add-items f-fl addnew" style="margin-left: 10px; display: none;" onclick="saveInvoiceTitle();">保存</a>
                                                <a href="javascript:;" class="add-items f-fl addnew" style="margin-left: 10px; display: none;"  onclick="closeaddInvoiceTitle();">关闭</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div>
                                        <ul class="items" id="fpcontext">
                                            <li class="item-title">发票内容：</li>
                                            <li class="radioitem <#if invoiceInfo.invoiceContent=="no">selected</#if>" type="invoiceContent" value="no">
                                                不开发票
                                            </li>
                                            <li class="radioitem <#if invoiceInfo.invoiceContent=="infos">selected</#if>" type="invoiceContent" value="infos" style="margin-left: 2px;">
                                                明细
                                            </li>
                                        </ul>
                                    </div>
                                </div><!--payAndShip-edit-div end-->

                            </div>
                        </div><!--part-invoice end-->
                    </div><!--step-content end-->
                </div>
            </div>

            <h1>商品清单<#if createOrderType != '1'><a href="${base}/cart/list" style="float: right;padding-right: 20px;font-size: 12px;">返回修改购物车</a></#if></h1>
            <div class="step-content checkout-steps">
                <div id="part-order" class="sbox-wrap">
                    <div class="sbox">
                        <div id="order-cart">
                            <div class="order-review">
                                <!--商品清单展示-->
                                <form id="orderGoodsForm">
                <span id="span-skulist">
                <table class="review-thead">
                    <tbody>
                    <tr>
                        <th class="fore1">商品</th>
                        <th class="fore2"><#if isMemberPrice == 'yes'>会员价<#else>商城价</#if>(元)</th>
                        <th class="fore3">优惠(元)</th>
                        <th class="fore4">数量
                        <#--20160505 dzz 隐藏库存显示-->
                        <#--</td>
                            <th class="fore4">库存状态
                        </td>-->
                    </tr>
                    <tr class="row-border">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <#--<td class="tube-postage"></td>-->
                    </tr>
                    </tbody>
                </table>
                <div class="review-body">
                    <div class="review-block review-present">
                        <div class="block-header">
                            <!--满赠信息-->
                        </div>
                    </div>

                    <#assign total = 0>
                    <#assign totalPrice = 0>
                    <#assign discount = 0>
                    <#assign deliveryFee = 0>
                    <#assign hasDF = true>
                    <#if hasInsuranceFee == 'yes'>
                        <#assign insuranceFee = 0>
                    </#if>
                    <#list cartItemList as map>
                        <div class="sj-name">
                           <#-- <label for="shopcheck"><a href="${base}/shop/${map.shopUrl}.html">商家：${map.shopName}</a></label>-->
                               <label for="shopcheck"><a>商家：陕西帮商乐信息技术有限公司</a></label>
                            <br>
                        </div>
                        <div class="sp-list">
                            <#assign totalPrice = totalPrice+(map.goodsTotal?number)>
                            <#assign discount = discount+(map.discount?number)>
                            <#assign deliveryFee = deliveryFee+(map.deliveryFeeTotal?number)>
                            <#list map.items as cartItem>
                                <#assign total = total+cartItem.quantity>
                                <!--购物车单品商品-->
                                <div class="review-tbody">
                                    <table class="order-table">
                                        <tbody>
                                        <tr bgcolor="#fafeff" style=" padding-top:15px;">
                                            <td class="fore1" style=" padding-bottom: 15px;"><div class="p-goods">
                                                <div class="p-img">
                                                    <#if cartItem.goodsId??>
                                                        <a href="${base}/item/${cartItem.goodsId}.html" target="_blank"><img height="50" width="50" alt="" src="${cartItem.pic}"></a>
                                                    <#else>
                                                    ${cartItem.goodsName}
                                                    </#if>
                                                </div>
                                                <div class="p-detail">
                                                    <div class="p-name"> <a href="${base}/item/${cartItem.goodsId}.html" target="_blank">${cartItem.name}</a> </div>
                                                    <#--<div class="p-more"> 商品编号：${cartItem.sn}<br>-->
                                                    <#--</div>-->
                                                </div>
                                            </div></td>
                                            <td class="p-sp">${cartItem.specification}</td>
                                            <td class="p-price"><strong>￥${cartItem.price}</strong></td>
                                            <td class="p-promotion">等级优惠：${(cartItem.price?number * memberRankScale?number)?string('currency')}</td>
                                            <td class="fore2">x ${cartItem.quantity}</td>
                                            <#--20160505 dzz 隐藏库存显示-->
                                            <#--<td class="fore2 p-inventory" skuid="${cartItem.goodsId}">有货</td>-->
                                        </tr>
                                        <tr>
                                            <td class="sj-ps" colspan="6" ><font style=" margin-left: 15px;vertical-align:20px; color:#999; ">给卖家留言：</font>
                                                <textarea id="ps_${cartItem.goodsId}" name="ps_${cartItem.goodsId}" style="width: 1000px;height: 30px; padding:5px 0 0 5px; border:1px solid #e6e6e6;resize: none;margin-top: 10px; color: #999;" maxlength="100" placeholder="选填：对本次交易的说明（建议填写已经和卖家达成一致的说明）"></textarea>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </#list>
                        </div>
                        <div style="text-align: right;">
                            <table class="order-table">
                                <tbody>
                                <tr>
                                    <td class="fore1">
                                        商品合计:&nbsp;&nbsp;&nbsp;${map.goodsTotal?string('currency')}
                                    </td>
                                    <td style="width: 200px;">
                                        优惠合计:&nbsp;&nbsp;&nbsp;${map.discount?string('currency')}
                                    </td>
                                    <td style="text-align: right;width: 150px;">
                                        运费：
                                        <#if map.deliveryFeeTotal &lt; 0>
                                            <#assign hasDF = false>
                                            ERROR
                                        <#else>
                                            ${map.deliveryFeeTotal?string('currency')}
                                        </#if>
                                    </td>
                                    <#if hasInsuranceFee == 'yes'>
                                    <td style="text-align: right;width: 150px;">
                                        <#assign insuranceFee = insuranceFee + map.insuranceFee>
                                        保价费：${map.insuranceFee}
                                    </td>
                                    </#if>
                                    <td  style="text-align: right;">店铺合计:</td>
                                    <td class="fore2 p-inventory"  style="text-align: right;width: 115px;padding-right: 20px;" >
                                        ${map.shopTotal?string('currency')}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </#list>
                </div>
                </span>
                                </form>
                                <div class="order-summary">
                                    <div class="statistic f-fr">
                                        <div class="list"> <span><em id="span-skuNum" style="width: 50px;">${total}</em> 件商品，总商品金额：</span><em class="price" id="warePriceId" v="${totalPrice?string('##0.00')}">${totalPrice?string('currency')}</em> </div>
                                        <div class="list">
                                            <span>优惠合计：</span>
                                            <em class="price" id="warePriceId" v="${totalPrice?string('##0.00')}">${discount?string('currency')}</em>
                                        </div>
                                        <div class="list" style="display:none;"> <span>返现：</span><em class="price" id="cachBackId" v="0.00"> -￥0.00</em> </div>
                                        <div class="list" id="showFreightPrice" style="padding-left:140px;"> <span id="freightSpan" style="width:40px;">运费：</span> <em class="price" id="freightPriceId">${deliveryFee?string('currency')}</em> </div>
                                        <div class="list" id="showCouponPrice" style="display:none;"> <span>优惠券：</span><em class="price" id="couponPriceId">-￥0.00</em> </div>
                                        <#if hasInsuranceFee == 'yes'>
                                        <div class="list" id="showInsuranceFee"> <span>保价费：</span><em class="price" id="insuranceFee_span">${insuranceFee?string('currency')}</em> </div>
                                        </#if>
                                        <div class="list">
                                            <span>应付总额：</span>
                                            <em id="sumPayPriceId" class="price">
                                                <#if hasInsuranceFee == 'yes'>
                                                    ${(totalPrice + deliveryFee + insuranceFee - discount)?string('currency')}
                                                <#else>
                                                    ${(totalPrice + deliveryFee - discount)?string('currency')}
                                                </#if>
                                            </em>
                                        </div>
                                    </div>
                                    <div class="span clr"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="checkout-floatbar" class="checkout-buttons group">
                    <div class="sticky-wrap">
                        <div class="inner">
                            <#if hasDF>
                                <button type="submit" class="checkout-submit" id="order-submit" onclick="submit_Order();">提交订单<b></b></button>
                            <#else>
                                <button type="submit" class="checkout-submit" id="order-submit" onclick="submit_Order_ERROR();">提交订单<b></b></button>
                            </#if>
                            <span class="total">应付总额：
                                <strong id="payPriceId">
                                <#if hasInsuranceFee == 'yes'>
                                    ${(totalPrice + deliveryFee + insuranceFee - discount)?string('currency')}
                                <#else>
                                    ${(totalPrice + deliveryFee - discount)?string('currency')}
                                </#if>
                                </strong>元
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="popGeneral_address" id="popupdiv" style="display:none;">
        <form class="registerform" onsubmit="return false">
            <input type="hidden" id="consignee_form_id">
            <input type="hidden" id="isReceiverSubmit" value="false">
            <div class="pop_win aptab_center_address">
                <ul class="newaddress">
                    <li>
                        <label> <strong style="color: red;">*</strong> 收&nbsp;&nbsp;货&nbsp;&nbsp;人： </label>
                        <input type="text" id="consignee_name"  name="consigneeParam.name" value="" class="inputxt" maxlength="20">
                        <span class="form-tip"><span style="color: #ec0202;" id="name_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;收货城市： </label>
                        <span id="span_area"><input type="text" name="receiver.areaPath" class="areaSelect hidden" value=""/></span>
                        <span class="form-tip"><span style="color: #ec0202;" id="area_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;详细地址： </label>
                        <input type="text" name="consigneeParam.address" id="consignee_address" maxlength="60"  class="inputxt" style="width: 350px;">
                        <span class="form-tip"><span style="color: #ec0202;" id="address_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;手机号码： </label>
                        <input type="text" value=""  id="consignee_mobile" name="consigneeParam.mobile"  class="inputxt mobile"  ignore="ignore" >
                        &nbsp;<span style="color: #333333">或 &nbsp; 固定电话：</span>
                        <input type="text" value=""  id="consignee_phone" name="consigneeParam.phone" class="inputxt tel"  >
                        <span class="form-tip"><span style="color: #ec0202;" id="call_div_error"></span></span>
                    </li>
                    <li style="display: none" class="setDefaultAddressLi" id="setDefaultAddressLi">
                        <label for="set_normal" class="label_set_normal">
                            <input type="checkbox" value="1" name="addressInfo.addressType" class="set_normal" id="set_normal">
                            设为默认地址 </label>
                    </li>
                    <#--<li>-->
                        <#--<label> <strong style="color:#fff;">*</strong> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱： </label>-->
                        <#--<input type="text" maxlength="30" value="" id="consignee_email" name="consigneeParam.email" style="width:200px;" ignore="ignore" datatype="e" errormsg="邮箱格式错误！">-->
                    <#--</li>-->
                    <li>
                        <label> <strong style="color:#fff;">*</strong> 邮政编码： </label>
                        <input type="text" maxlength="6" id="consignee_zipCode" name="consigneeParam.zipCode" value="" id="Email" style="width:200px;">
                    </li>
                    <li>
                        <input type="submit" value="保 存" onclick="save_Consignee()"  class="btn_save  bule_btn" /> <span id="saveConsigneeTitleDiv"></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>

    <div style="display:none;">
        <form action="${base}/member/reloadOrderCheck" method="post" id="reloadForm">

        </form>
    </div>

    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
    <script src="${base}/static/js/jquery.form.js" type="text/javascript"></script>
    <script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
    <script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/order.common.js" type="text/javascript"></script>
    <script src="${base}/static/bec/project/ghdj/js/order_new.js?v=1.0.1" type="text/javascript"></script>
    <script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
 <script type="text/javascript">

$(function(){

      /* var demo=$(".registerform").Validform({
           tiptype:3,
           label:".label",
           showAllError:true,
           datatype:{
               "zh1-6":/^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/
           }
       });*/

       <#if !hasDF>
           submit_Order_ERROR();
       </#if>


   /*    //通过$.Tipmsg扩展默认提示信息;
       //$.Tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
       demo.tipmsg.w["zh1-6"]="请输入1到6个中文字符！";

       demo.addRule([{
           ele:".inputxt:eq(0)",
           datatype:"*"
       },
           {
               ele:".inputxt:eq(1)",
               datatype:"*"
           },

           {
               ele:"select",
               datatype:"*"
           }
       ]);
*/

/*
       $(".registerform").Validform({
           datatype:{
               "phone":function(gets,obj,curform,regxp){
                   */
/*参数gets是获取到的表单元素值，
obj为当前表单元素，
curform为当前验证的表单，
regxp为内置的一些正则表达式的引用。*//*


                   var reg1=regxp["m"],
                           reg2=/[\d]{7}/,
                           mobile=curform.find(".mobile");

                   if(reg1.test(mobile.val())){return true;}
                   if(reg2.test(gets)){return true;}

                   return false;
               }
           }
       });
*/




   })



</script>-->
    <!--收货地址所用js-->
    <script type="text/javascript">

        $(function(){
            $("#addresshtml").addClass("current");
            $(".mod_address_book .adr_list li").hover(function() {
                        if ($(this) !== $(".mod_address_book .adr_list li:last-child")) {
                            $(this).addClass("hover_li");
                            if ($(this).find(".using_add").length > 0 && $(this).find(".using_add").is(":visible")) {
                                $(this).find(".edit_box a").eq(1).hide();
                            }
                        }
                    },
                    function() {
                        if( $(this).attr("isDefault") == "false" ){
                            $(this).removeClass("hover_li");
                        }
                    });
        });
        function showTips(receiverId){
//            $("#tips_"+index).show();
            if($('#consignee_radio_'+receiverId).attr("isDefault") == 'true'){
                layer.alert('默认地址无法删除！', {icon: 7, title:'温馨提示'});
            }else{

                layer.confirm('您确定要删除吗？', {icon: 3, title:'温馨提示'}, function(index){

                            delReceiver(receiverId);
                            layer.close(index);
                        },
                        function(index){
                            layer.close(index);
                        });
            }
        }
        function hideTips(index){
            $("#tips_"+index).hide();
        }

    </script>
    <script type="text/javascript">
        /*宽屏设置*/
        //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");

        $(function () {
            $(".areaSelect").val("");
            $(".areaSelect").lSelect({
                url: "${base}/area/ajaxChildren"// Json数据获取url
            });
            $(".items").on('click','.radioitem',function(){
                $("#"+$(this).attr("type")).val($(this).attr("value"));
                $(this).parent().find(".radioitem").removeClass("selected");
                $(this).addClass("selected");
            });
            $(".items").on('dblclick','.invoiceTitel',function(){
                editInvoice($(this).find("a").text(),$(this).attr("id"));
            });
        });

        /**
         * 编辑支付与配送方式
         */
        function edit_Payment(flag) {
            $("#step-2").addClass("step-current");

            $("#editPayAndShip").hide();
            $("#savePayAndShipTitleMinDiv").show();
            $("#payAndShip-content").hide();
            $("#payAndShip-edit-div").show();

        }

        /**
         * 保存支付与配送方式   点击保存 会去根据选择的快递方式计算费用 Auth:zhangqiang Time:2015-09-25 17:46:25 Start
         */
        function save_PayAndShip() {
            var order_deliveryTimeName = $("#order_deliveryTimeName").val();
            var paymentMethodId=$("#order_paymentMethodId").val();
            var deliveryTimeId=$("#order_deliveryTime").val();

            var paymentMethodLabel=$("#pay-method-label-"+paymentMethodId).html();
            $(".payment-selected").html(paymentMethodLabel);

            var deliveryMethodId=$("#order_deliveryMethodId").val();
            var deliveryMethodLabel=$("#delivery-method-label-"+deliveryMethodId).html();
            $(".delivery-selected").html(deliveryMethodLabel);

            $("#step-2").removeClass("step-current");
            $("#editPayAndShip").show();
            $("#savePayAndShipTitleMinDiv").hide();
            $("#payAndShip-content").show();
            $("#payAndShip-edit-div").hide();

            var deliveryId = $("#deliveryId").val();
            if (!isEmpty(deliveryId)) {
                window.location.href = "${base}/member/ordercheck?o="+$("#order_cartItemIds").val()+"&deliveryId="+deliveryId+"&paymentMethodId="+paymentMethodId+"&deliveryTimeId="+deliveryTimeId+"&order_deliveryTimeName="+order_deliveryTimeName;
            }
        }
        /**
         * 保存支付与配送方式   点击保存 会去根据选择的快递方式计算费用 Auth:zhangqiang Time:2015-09-25 17:46:25 End
         */

        /**
         * 选择支付方式
         */
        function chosePayment(id) {
            $("#order_paymentMethodId").val(id);
        }

        /**
         * 选择配送方式 时把快递ID存放到input中 Auth:zhangqiang Time:2015-09-25 17:44:25 Start
         */

        function choseDelivery(id) {
            $("#order_deliveryMethodId").val(id);

            reloadThisPage();
        }
        /**
         * 选择配送方式 时把快递ID存放到input中 Auth:zhangqiang Time:2015-09-25 17:44:25 End
         */

        /**
         * 是否启用会员价
         */
        function choseIsMemberPrice() {
            if($("#isMemberPrice_checkbox").is(":checked")){
                $("#isMemberPrice").val("yes");
                $("#invoiceContent").val("no");
                $("#invoiceTitle").val("");
                $("#invoiceType").val("");
            }else{
                $("#isMemberPrice").val("no");
            }

            reloadThisPage();
        }

        /**
         * 是否保价
         */
        function choseHasInsuranceFee() {
            if($("#hasInsuranceFee_checkbox").is(":checked")){
                $("#hasInsuranceFee").val("yes");
            }else{
                $("#hasInsuranceFee").val("no");
            }

            reloadThisPage();
        }

        /**
         * 编辑发票信息
         */
        function edit_Invoice() {
            $("#step-3").addClass("step-current");
            $("#editInvoice").hide();
            $("#saveInvoiceTitleMinDiv").show();
            $("#invoice-content").hide();
            $("#invoice-edit-div").show();
        }


        /**
         * 删除发票抬头
         * */
        function deleteInvoice(id,invoiceTitle,indexNum){
            if(indexNum == '0'){
                layer.alert('默认发票抬头无法删除！', {icon: 7, title:'温馨提示'});
            }else{
                layer.confirm('您确定要删除[' + invoiceTitle + ']这个发票抬头吗？删除后将不可恢复。', {icon: 3, title:'温馨提示'}, function(index){
                    $.ajax({
                        type: "post",
                        url: "${base}/member/deleteInvoice",
                        data: "id=" + id,
                        dataType: "json",
                        success: function (data) {
                            if (data.success) {
                                $("#" + id).remove();
                                layer.msg(data.msg, {icon: 6});
                            } else {
                                layer.msg(data.msg, {icon: 5});
                            }
                        }
                    });
                    layer.close(index);
                })
            }

        }

        /**
         * 保存发票内容
         */
        function save_Invoice() {
            if($("#invoiceContent").val()=="no") {
                $.ajax({type: "post",
                    url: "${base}/member/saveInvoiceSetting",
                    data:"invoiceContent=no",
                    dataType: "json",
                    success:function(data){
                        if(data.success){
                            layer.msg(data.msg, {icon: 6});
                            $("#invoiceInfo").text($(".selected[type='invoiceContent']").text());
                            $("#invoiceType").val("");
                            $("#invoiceTitle").val("");
                            $("#invoiveContent").val("no");
                            closeInvoiceForm();
                        }else{
                            layer.msg(data.msg, {icon: 5});
                        }
                    }
                });
            }else{
                if($(".selected[type='invoiceType']").text()==""){
                    layer.alert("请选择发票类型！", {icon: 5, title:"温馨提示"});
                }else if($(".selected[type='invoiceTitle']").text()==""){
                    layer.alert("请选择发票抬头！", {icon: 5, title:"温馨提示"});
                }else {
                    $.ajax({
                        type: "post",
                        url: "${base}/member/saveInvoiceSetting",
                        data: "invoiceTitle=" + $(".selected[type='invoiceTitle'] a").text() + "&id=" + $(".selected[type='invoiceTitle']").attr("id") + "&invoiceContent=" + $(".selected[type='invoiceContent']").text(),
                        dataType: "json",
                        success: function (data) {
                            if (data.success) {
                                layer.msg(data.msg, {icon: 6});
                                var info = $(".selected[type='invoiceType']").text() + "　　" + $(".selected[type='invoiceTitle'] a").text() + "　　" + $(".selected[type='invoiceContent']").text();
                                $("#invoiceInfo").text(info);
                                closeInvoiceForm();
                            } else {
                                layer.msg(data.msg, {icon: 5});
                            }
                        }
                    });
                }
            }
        }

        function closeInvoiceForm(){
            $("#step-3").removeClass("step-current");
            $("#editInvoice").show();
            $("#saveInvoiceTitleMinDiv").hide();
            $("#invoice-content").show();
            $("#invoice-edit-div").hide();
        }

        function addInvoiceTitle(){
            $("#action").text("新增");
            $(".addnew").show();
            $(".closeaddnew").hide();
        }
        function closeaddInvoiceTitle(){
            $(".addnew").hide();
            $(".closeaddnew").show();
            $("#title").val("");
            $("#id").val("");
        }

        function editInvoice(title,id){
            $("#id").val(id);
            $("#title").val(title);
            $("#action").text("修改");
            $(".addnew").show();
            $(".closeaddnew").hide();
        }

        function saveInvoiceTitle(){
            if($("#title").val()==""){
                layer.alert("发票抬头不能为空！", {icon: 5, title:"温馨提示"});
                $("#title").focus();
            }else{
                if($("#id").val()!=""){
                    var titleStr = $("#title").val();
                    if(titleStr.length > 50){
                        layer.alert("发票抬头长度不超过50字符！", {icon: 5, title:"温馨提示"});
                        $("#title").focus();
                        return;
                    }
                    if($("#title").val()!=$("#"+$("#id").val()+" span").text()){
                        var ishave = false;
                        $(".radioitem[type='invoiceTitle']").each(function () {
                            if ($("#title").val() == $(this).find("a").text() && $("#id").val()!=$(this).attr("id")) {
                                layer.alert("该发票抬头已经存在！", {icon: 2, title:"温馨提示"});
                                ishave = true;
                            }
                        });
                        if (!ishave) {
                            $.ajax({
                                type: "post",
                                url: "${base}/member/editInvoice",
                                data: "invoiceTitle=" + $("#title").val() + "&id=" + $("#id").val(),
                                dataType: "json",
                                success: function (data) {
                                    if (data.success) {
                                        layer.msg(data.msg, {icon: 6});
                                        $("#" + $("#id").val() + " a").text($("#title").val());
                                        $("#invoiceTitle").val($("#title").val());
                                        closeaddInvoiceTitle();
                                    } else {
                                        layer.msg(data.msg, {icon: 5});
                                    }
                                },
                                error: function () {
                                    layer.alert("亲爱的用户请不要频繁点击, 请稍后重试...", {icon: 5, title:"温馨提示"});
                                }
                            })
                        }
                    }else{
                        closeaddInvoiceTitle();
                    }
                }else {
                    var titleStr = $("#title").val();
                    if(titleStr.length > 50){
                        layer.alert("发票抬头长度不超过50字符！", {icon: 5, title:"温馨提示"});
                        $("#title").focus();
                        return;
                    }

                    var ishave = false;
                    $(".radioitem[type='invoiceTitle']").each(function () {
                        if ($("#title").val() == $(this).find("a").text()) {
                            layer.alert("该发票抬头已经存在！", {icon: 5, title:"温馨提示"});
                            ishave = true;
                        }
                    });
                    if (!ishave) {
                        $.ajax({
                            type: "post",
                            url: "${base}/member/saveInvoice",
                            data: "invoiceTitle=" + $("#title").val(),
                            dataType: "json",
                            success: function (data) {
                                if (data.success) {
                                    layer.msg(data.msg, {icon: 6});
                                    $(".radioitem[type='invoiceTitle']").removeClass("selected");
                                    var html = "<li class=\"radioitem invoiceTitel selected\" type=\"invoiceTitle\" id=\""+data.id+"\" value=\"" + $("#title").val() + "\"><a href=\"javascript:;\" title=\"双击修改\">" + $("#title").val() + "</a><b onclick=\"deleteInvoice('" + data.id + "','" + $("#title").val() + "');\" class=\"close-color\">&nbsp;&nbsp;<b></li>";
                                    $(".radioitem[type='invoiceTitle']").parent().append(html);
                                    $("#invoiceTitle").val($("#title").val());
                                    closeaddInvoiceTitle();
                                    $("#title").val("");
                                } else {
                                    layer.msg(data.msg, {icon: 5});
                                }
                            },
                            error: function () {
                                layer.alert("亲爱的用户请不要频繁点击, 请稍后重试...", {icon: 5, title:"温馨提示"});
                            }
                        })
                    }
                }
            }
        }
        /**
         * 提交订单
         */
        function submit_Order(){

            var receiverId=$("#order_receiverId").val();
            if(receiverId.length==0){
                layer.alert("请选择收货人!", {icon: 5, title:"温馨提示"});
                return;
            }

            $.ajax({
                type: "post",
                url: "${base}/order/submit",
                data:$("#orderCheckInfo").formSerialize()+'&'+$("#orderGoodsForm").formSerialize(),
                dataType: "json",
                success: function (data) {
                    if (data.status == "success") {
                        if (data.payType == "online" && !data.isEnableConfirm) {
                            window.location.href ="${base}/payment?orderSn="+data.orderSn+"&total="+data.totalAmount+"&key="+data.orderId+"&t="+Math.random();
                        } else {// if(data.payType == "offline" || ) {
//					window.location.href = "${base}/order/view/" + data.orderId + ".html";
                            window.location.href = "${base}/order/list";
                        }
                    } else {
                        layer.alert(data.message, {icon: 6, title:"温馨提示"});
                    }
                },
                error : function(error) {
                    layer.alert("亲爱的用户请不要频繁点击, 请稍后重试...", {icon: 5, title:"温馨提示"});
                    //$("#order-loading").replaceWith(originSubmit);
                    //$("#submit_message").html("亲爱的用户请不要频繁点击, 请稍后重试...");
                    //$("#submit_message").show();
                }

            });
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


        function submit_Order_ERROR(){
            layer.alert("当前的配送方式不符合微货通的配送范围，请您与管理员联系！",{icon:7});
        }
    </script>
</#escape>