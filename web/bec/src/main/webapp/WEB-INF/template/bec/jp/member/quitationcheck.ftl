<#escape x as x?html>
	<#include "bec/jp/header.ftl"/>
<style type="text/css">
    .order-summary .statistic span {
        margin-right: 10px;
    }
</style>
<div id="container">
	<#include "bec/jp/top2.ftl"/>
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
                <!-- ================================================================================= -->
                <input type="hidden" id="order_receiverId" name="receiverId" value="${receiver.id}">
                <input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethod.id}">
                <input type="hidden" id="order_deliveryMethodId" name="deliveryMethodId" value="${deliveryMethod.id}">
                <input type="hidden" id="order_cartItemIds" name="cartItemIds" value="<#list cartItemList as map><#list map.items as cartItem>${cartItem.id},</#list></#list>">

                <!--当选择配送方式时存放快递ID  Auth:zhangqiang Time:2015-09-25 17:41:35 Start -->
                <input type="hidden" id="deliveryId" name="deliveryId" value="">
                <!--当选择配送方式时存放快递ID Auth:zhangqiang Time:2015-09-25 17:41:35 End -->
                <!--送货时间 Auth:hks Time:2015-11-13 14:37:52 Start -->
                <input type="hidden" id="order_deliveryTimeName" name="order_deliveryTimeName" value="${deliveryTimeList[0].introduce}">
                <!--送货时间  Auth:hks Time:2015-11-13 14:37:52  end -->

                <!--设置平台类型(1.B2B、2.B2C)  Auth:hks Time:2015-10-21 18:04:35 Start -->
                <input type="hidden" id="platform" name="platform" value="1">
                <input type="hidden" id="enquiryId" name="enquiryId" value="${quotation.enquiryId}">
                <input type="hidden" id="quotationId" name="quotationId" value="${quotation.id}">
                <input type="hidden" id="dataFrom" name="dataFrom" value="3">
                <!--当选择配送方式时存放快递ID Auth:hks Time:2015-10-21 18:04:35 End -->

                <input type="hidden" name="invoiceType" id="invoiceType" value="${invoiceInfo.invoiceType}"/>
                <input type="hidden" name="invoiceTitle" id="invoiceTitle" value="${invoiceInfo.invoiceTitle}"/>
                <input type="hidden" name="invoiceContent" id="invoiceContent" value="${invoiceInfo.invoiceContent}"/>
                <!-- ================================================================================= -->


            </form>
			<!-- layer 弹出窗口,新增或编辑地址信息 -->
            <div class="columnright">
                <div class="mod_address_book">
                    <div id="addressListDiv" class="addressListDiv">
                        <input type="hidden" value="1" id="size">
                        <input type="hidden" id="addressNum_top" value="${receiverList?size}">
                        <ul class="adr_list" id="consignee-list">
							<#list receiverList as receiver>
                                <li class="<#if receiver.isDefault==1>address_on</#if>" id = "consignee_radio_${receiver.id}" onclick="chooseCurrAddress('${receiver.id}')">
                                    <p class="using_add"> 默认地址 </p>
                                    <div class="vcard">
                                        <p> <strong>${receiver.name} </strong>&nbsp;&nbsp;&nbsp;收 </p>
                                        <p class="adr"> <span class="street-address"> <strong class="locality"> ${receiver.areaName} </strong> <span class="street-address">${receiver.address}</span> </p>
                                        <p class="tel">  ${receiver.mobile} </p>
									<#--<p >  ${receiver.email} </p>-->
                                        <p > ${receiver.zipCode} </p>
                                    </div>
                                    <div class="edit_box clearfix">
                                    <button class="del_adr" title="删除地址" onClick="showTips('${receiver.id}');"> 删除 </button>
                                    <a class="aBlu btn_edit" href="javascript:void(0)" id="show" onClick="show_ConsigneeDetail('${receiver.id}')">编辑</a>
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
                            <li type="2" id="address_list_li_3" class="li_add_addr add_adr saveAddress last">
                                <p> <a class="btn_add_addr"  href="javascript:void(0)" id="show" onClick="use_NewConsignee()"><i>&nbsp;</i>添加新收货地址</a> </p>
                                <div class="tips_care" id="tips_full_2">
                                    <p> 地址已满6条，无法再添加新地址 </p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- #layer 弹出窗口,新增或编辑地址信息 -->

            <h1>支付方式</h1>
            <div class="peis_info">
				<#list paymentMethodList as payment>
					<#if payment.enabled == 1>
                        <div class="field">
                            <input type="radio" name="payment" id="pay-method-${payment.id}" <#if payment_index==0>checked</#if> onclick="chosePayment('${payment.id}')" payname="${payment.name}" payid="${payment.id}" value="${payment.id}" >
                            <label class="pay_info"><b id="pay-method-label-${payment.id}">${payment.name}</b>${payment.description}</label>
                        </div>
					</#if>
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
               <#-- <div id="delivery-time">
                    <div class="f-fl"> <span class="label">：</span> </div>
                    <div class="middle">-->
						<#list deliveryTimeList as deliveryTime>
                            <div class="field">
                                <input id="delivery-time-${deliveryTime.id}" name="deliveryTime" <#if deliveryTime_index==0>checked</#if> class="hookbox" value="${deliveryTime.id}" type="radio" onclick="$('#order_deliveryTime').val('${deliveryTime.introduce}');">
							${deliveryTime.introduce}
                            </div>
						</#list>
                    <#--</div>
                </div>-->
            </div>

            <h1 >发票信息</h1>
            <#if quotation.invoiceType == '1'>
                <div class="peis_info" >
                    <div id="step-3" class="step step-complete"><a name="invoiceFocus"></a>
                        <div class="step-title">
                            <div id="save-invoice-tip" class="step-right"></div>
                            <strong>发票信息</strong>
                        <span class="step-action" id="part-invoice_edit_action">
                        </span>
                        </div><!--step-title end-->
                        <div class="step-content">
                            <div id="part-invoice" class="sbox-wrap">
                                <div class="sbox">
                                    <div class="invoice" id="invoice-content">
                                        <div class="invoice-content">
                                            发票类型：<span id="invoiceInfo">不开发票</span>
                                        </div>
                                    </div>
                                </div>
                            </div><!--part-invoice end-->
                        </div><!--step-content end-->
                    </div>
                </div>
            <#else>
                <div class="peis_info" >
                    <div id="step-3" class="step step-complete"><a name="invoiceFocus"></a>
                        <div class="step-title">
                            <div id="save-invoice-tip" class="step-right"></div>
                            <strong>发票信息</strong>
                        <span class="step-action" id="part-invoice_edit_action">

                            <a href="javascript:void(0);" id="editInvoice" onclick="edit_Invoice()">[修改]</a>
                            <a href="javascript:void(0);" id="saveInvoiceTitleMinDiv" class="hide" style="color:#005EA7;" onclick="save_Invoice()">保存发票信息</a>

                        </span>
                        </div><!--step-title end-->
                        <div class="step-content">
                            <div id="part-invoice" class="sbox-wrap">
                                <div class="sbox">
                                    <div class="invoice" id="invoice-content">
                                        <div class="invoice-content">
                                            发票类型：
                                        <span id="invoiceInfo">
                                            <#if invoiceInfo.invoiceContent=="no">
                                                不开发票
                                            <#else>
                                                <#if invoiceInfo.invoiceType=="normal">
                                                    普通发票
                                                </#if>
                                                &nbsp;&nbsp;
                                            ${invoiceInfo.invoiceTitle}
                                                &nbsp;&nbsp;
                                                <#if invoiceInfo.invoiceContent=="infos">
                                                    明细
                                                </#if>

                                            </#if>&nbsp;&nbsp;
                                        </span>
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
                                            <ul class="items">
                                                <li class="item-title">发票抬头：</li>
                                                <#list memberInvoicesList as invoice>
                                                    <li class="radioitem <#if invoice.invoiceTitle==memberInvoice.invoiceTitle>selected</#if>" type="invoiceTitle" id="${invoice.id}" value="${invoice.invoiceTitle}">
                                                        <a href="javascript:;" title="双击修改">${invoice.invoiceTitle}</a>
                                                        <b onclick="deleteInvoice('${invoice.id}','${invoice.invoiceTitle}');" class="close-color"></b>
                                                    </li>
                                                </#list>
                                            </ul>
                                        </div>
                                        <div>
                                            <ul class="items">
                                                <li class="hide addnew">
                                                    <label for="title" class="fl"><span id="action">新增</span>发票抬头：</label>
                                                    <input type="text" name="title" id="title" style="height:28px; line-height:28px;border:#e8e8e8 solid 1px;padding:0 5px; width:260px; margin-top: 2px;" />
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
                                            <ul class="items">
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
            </#if>

            <h1>商品清单</h1>
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
                        <th class="fore2">商城价</th>
                        <th class="fore3">优惠</th>
                        <th class="fore4">数量
                        </td>
                        <th class="fore4">库存状态
                        </td>
                    </tr>
                    <tr class="row-border">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="tube-postage"></td>
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
					<#list cartItemList as map>
                        <div class="sj-name">
                            <label for="shopcheck"><a href="${base}/shop/${map.shopUrl}.html">商家：${map.shopName}</a></label>
                            <br>
                        </div>
                        <div class="sp-list">${map.goodsTotal}
							<#list map.items as cartItem>
								<#assign total = total+cartItem.purchaseNum>
                                <!--购物车单品商品-->
                                <div class="review-tbody">
                                    <table class="order-table">
                                        <tbody>
                                        <tr bgcolor="#fafeff" style=" padding-top:15px;">
                                            <td class="fore1" style=" padding-bottom: 15px;"><div class="p-goods">
                                                    <#--Desc:当没有图片时不显示图片边框；Auth:zhangqiang Time:2015-11-30 17:05:35 Start-->
													<#if cartItem.goodsId??>
                                                    <div class="p-img">
                                                        <a href="${base}/item/${cartItem.goodsId}.html" target="_blank"><img height="50" width="50" alt="" src="${cartItem.pic}"></a>
                                                    </div>
                                                    <#else>
                                                        <div class="p-noimg">
                                                        </div>
                                                    </#if>

                                                <div class="p-detail">
                                                    <div class="p-name">
                                                        <#if cartItem.goodsId??>
                                                            <a href="${base}/item/${cartItem.goodsId}.html" target="_blank">${cartItem.goodsName}</a>
                                                        <#else>
                                                            ${cartItem.goodsName}
                                                        </#if>
                                                    </div>
                                                    <#--<div class="p-more"> 商品编号：${cartItem.sn}<br>-->
                                                    </div>
                                                </div>
                                            <#--Desc:当没有图片时不显示图片边框；Auth:zhangqiang Time:2015-11-30 17:05:35 End-->
                                            </div></td>
                                            <td class="p-sp">${cartItem.specification}</td>
                                            <td class="p-price"><strong>￥${cartItem.quotationPrice}</strong></td>
                                            <td class="p-promotion">0.00</td>
                                            <td class="fore2">x ${cartItem.purchaseNum}${cartItem.units}</td>
                                            <td class="fore2 p-inventory" skuid="${cartItem.goodsId}">有货</td>
                                        </tr>
                                        <tr>
                                            <td class="sj-ps" colspan="6" ><font style=" margin-left: 15px;vertical-align:20px; color:#999; ">给卖家留言：</font>
                                                <textarea id="ps_${cartItem.id}" name="ps_${cartItem.id}" style="width: 1000px;height: 30px; padding:5px 0 0 5px; border:1px solid #e6e6e6;resize: none;margin-top: 10px; color: #999;" maxlength="100" placeholder="选填：对本次交易的说明（建议填写已经和卖家达成一致的说明）"></textarea>
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
                                    <td class="fore1"> 商品合计:&nbsp;&nbsp;&nbsp;￥${quotation.goodsTotalCost?string('##0.00')}</td>
                                    <td style="text-align: right;">运费：</td>
                                    <td class="p-promotion">￥${quotation.freightTotalCost?string('##0.00')}</td>
                                    <td style="text-align: right;">店铺合计:</td>
                                    <td class="fore2 p-inventory">￥${quotation.totalCost?string('##0.00')}</td>
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
                                        <div class="list">
                                            <span><em id="span-skuNum">${total}</em> 件商品，总商品金额：</span>
                                            <em class="price" id="warePriceId" v="${quotation.goodsTotalCost?string('##0.00')}">￥${quotation.goodsTotalCost?string('##0.00')}</em>
                                        </div>
                                        <div class="list" style="display:none;">
                                            <span>返现：</span><em class="price" id="cachBackId" v="0.00"> -￥0.00</em>
                                        </div>
                                        <div class="list" id="showFreightPrice" style="padding-left:140px;">
                                            <span id="freightSpan" style="width:40px;">运费：</span>
                                            <em class="price" id="freightPriceId"> ￥${quotation.freightTotalCost?string('##0.00')}</em>
                                        </div>
                                        <div class="list" id="showCouponPrice" style="display:none;">
                                            <span>优惠券：</span><em class="price" id="couponPriceId">-￥0.00</em>
                                        </div>
                                        <div class="list">
                                            <span>应付总额：</span>
                                            <em id="sumPayPriceId" class="price"> ￥${quotation.totalCost?string('##0.00')}</em>
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
                            <button type="submit" class="checkout-submit" id="order-submit" onclick="javascript:submit_Order();">提交订单<b></b></button>
                            <span class="total">应付总额：<strong id="payPriceId">￥${quotation.totalCost?string('##0.00')}</strong>元 </span> </div>
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
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;收货城市： </label>
                        <span id="span_area"><input type="text" name="receiver.areaPath" class="areaSelect hidden" value=""/></span>
                        <span class="form-tip"><span class="status error" id="area_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;详细地址： </label>
                        <input type="text" name="consigneeParam.address" id="consignee_address" maxlength="50"  class="inputxt" style="width: 350px;">
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;手机号码： </label>
                        <input type="text" value=""  id="consignee_mobile" name="consigneeParam.mobile"  class="inputxt mobile"  ignore="ignore" datatype="m" errormsg="手机号码格式不对！">
                        &nbsp;<span style="color: #333333">或 &nbsp; 固定电话：</span>
                        <input type="text" value=""  id="consignee_phone" name="consigneeParam.phone" class="inputxt tel" datatype="phone" errormsg="手机与固话至少填写一项！"  nullmsg="手机与固话至少填写一项！" >
                    </li>
                    <li style="display: none" class="setDefaultAddressLi" id="setDefaultAddressLi">
                        <label for="set_normal" class="label_set_normal">
                            <input type="checkbox" value="1" name="addressInfo.addressType" class="set_normal" id="set_normal">
                            设为默认地址 </label>
                    </li>
				<#--<li>
                    <label> <strong style="color:#fff;">*</strong> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱： </label>
                    <input type="text" maxlength="30" value="" id="consignee_email" name="consigneeParam.email" style="width:200px;">
                </li>-->
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
	<#include "bec/jp/service2.ftl"/>
	<#include "bec/jp/foot.ftl"/>
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
    <script src="${base}/static/mall/js/order_new.js" type="text/javascript"></script>
    <script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function(){

            var demo=$(".registerform").Validform({
                tiptype:3,
                label:".label",
                showAllError:true,
                datatype:{
                    "zh1-6":/^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/
                }
            });



            //通过$.Tipmsg扩展默认提示信息;
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


            $(".registerform").Validform({
                datatype:{
                    "phone":function(gets,obj,curform,regxp){
                        /*参数gets是获取到的表单元素值，
  obj为当前表单元素，
  curform为当前验证的表单，
  regxp为内置的一些正则表达式的引用。*/

                        var reg1=regxp["m"],
                                reg2=/[\d]{7}/,
                                mobile=curform.find(".mobile");

                        if(reg1.test(mobile.val())){return true;}
                        if(reg2.test(gets)){return true;}

                        return false;
                    }
                }
            });




        })



    </script>
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
                        $(this).removeClass("hover_li");
                    });
        });
        function showTips(index){
            $("#tips_"+index).show();
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
            $(".items").on('dblclick','.radioitem',function(){
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
            var paymentMethodId=$("#order_paymentMethodId").val();
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
                window.location.href = "${base}/member/ordercheck?o="+$("#order_cartItemIds").val()+"&deliveryId="+deliveryId;
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
        }
        /**
         * 选择配送方式 时把快递ID存放到input中 Auth:zhangqiang Time:2015-09-25 17:44:25 End
         */


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
        function deleteInvoice(id,invoiceTitle){
            layer.confirm('您确定要删除[' + invoiceTitle + ']这个发票抬头吗？删除后将不可恢复。', {icon: 3, title:'温馨提示'}, function(index) {
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
            });
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
            if(title=='个人'){
                layer.alert("发票抬头不能为空！", {icon: 5, title:"温馨提示"});
            }else {
                $("#id").val(id);
                $("#title").val(title);
                $("#action").text("修改");
                $(".addnew").show();
                $(".closeaddnew").hide();
            }
        }

        function saveInvoiceTitle(){
            if($("#title").val()==""){
                layer.alert("发票抬头不能为空！", {icon: 5, title:"温馨提示"});
                $("#title").focus();
            }else{
                if($("#id").val()!=""){
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
                                        layer.msg('data.msg', {icon: 6});
                                        $("#" + $("#id").val() + " a").text($("#title").val());
                                        $("#invoiceTitle").val($("#title").val());
                                        closeaddInvoiceTitle();
                                    } else {
                                        layer.msg('data.msg', {icon: 5});
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
                                    $(".radioitem[type='invoiceTitle']").removeClass("items-border");
                                    var html = "<li class=\"radioitem items-border\" type=\"invoiceTitle\" id=\""+data.id+"\" value=\"" + $("#title").val() + "\"><a href=\"javascript:;\" title=\"双击修改\">" + $("#title").val() + "</a><b onclick=\"deleteInvoice('" + data.id + "','" + $("#title").val() + "');\">X<b></li>";
                                    $(".radioitem[type='invoiceTitle']").parent().append(html);
                                    $("#invoiceTitle").val($("#title").val());
                                    closeaddInvoiceTitle();
                                    $("#title").val("");
                                } else {
                                    layer.msg(data.msg, {icon:5});
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
    </script>
</#escape>