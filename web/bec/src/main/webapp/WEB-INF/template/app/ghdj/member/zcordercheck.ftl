<!DOCTYPE html>
<html>
<head>
<#include "app/ghdj/head.ftl">
    <link href="${path}/theme/red/ghdj_style.css" rel="stylesheet"/>

    <style>
        textarea{
            padding:0;
            border-radius: 0; font-size: 14px;
        }

        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghdj/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:5px;}

        .mt-20{margin-top: -20px;}

    </style>
</head>
<body>
<header>
    <div class="logo"><a <#--href="javascript:jumpto(fullpath+'/zcgoods/detail/${zcgoods.id}.html')"--> href="javascript:jumpto(fullpath+'/zcgoods/detail/${zcgoods.id}.html')" class="ltext">返回</a></div>
    <div class="mtit">订单信息</div>
    <div class="user"><a href="${base}/member/index?whichclient=whichapp">用户</a></div>
</header>

<div class="pro_banner" style="margin-top:47px;">
<#if goodsImagesList?? && goodsImagesList?size &gt; 0>
    <img src="${goodsImagesList[0].pic}@400w_190h.png">
<#else>
    <img src="${path}/images/loaderror.png">
</#if>

</div>
<div class="order-title order-row_02">
    <div class="order-name">
        <dl>
            <dt>项目名称：</dt>
            <dd class="deep">${zcgoods.fullName}</dd>
        </dl>
    </div>
    <div class="split-line"></div>
    <div class="order-content" style="display: none">
        <dl class="clearfix">
            <dt>发起人：</dt>
            <dd class="deep">${zcgoods.shopId}</dd>
        </dl>
        <dl class="mt10">
            <dt>项目简介：</dt>
            <dd class="deep">${zcgoods.description}</dd>
        </dl>
    </div>
</div>
<div class="order-row_02 order-box_02 arrow-box_02">
    <div class="order-add">
        <dl onclick="toReceiver();">
            <dt>收货地址：</dt>
            <dd>${receiver.areaName} &nbsp;${receiver.address}</dd>
        </dl>
        <i class="order-arrow"></i>
    </div>
</div>
<!--支付及配送会员价保价方式Title begin new-->
<div class="order-row_02 order-box_02 arrow-box_02">
	<div class="order-add">
		<dl onclick="chooseDeliveryAddressToggle();" style="margin-left:8px;">
		  保价及配送方式:
		</dl>
		<i id="order-arrow" class="order-arrow"></i>
	</div>
</div>
<div id="shipmentTest" style="margin-top:-10px;">  
	<div class="order-row_02 order-box_02 arrow-box_02" style="border-top: 1px dotted #dfdfdf;background: #fafafa;">
		<div class="order-add"   style="margin-left: 10px;">
			<dd></dd>
			<dd>
				<p><div class="delivery-selected" style="font-size: 14px;">${deliveryMethod.name}</div></p>
				<p><div class="payment-selected" style="font-size: 14px;">${paymentMethodN.name}</div></p>
				<p><div class="deliveryT-selected" style="font-size: 14px;color: #8f8f94;">${deliveryTimeList[0].introduce}</div></p>
				
			</dd>
		</div>
	</div>
</div>   
<!--支付及配送会员价保价方式Title end new-->
<div id="shipment" style="display:none;margin-top: -10px;">  
	<div class="order-row_02 order-box_02 arrow-box_02" style="border-top: 1px dotted #dfdfdf;background: #fafafa;">
		<div class="order-add" >
			<dl>
				<dt style="margin-top:6px;">支付方式：</dt>
				<dd>
					<div class="mc form"  style="float: left;">

		<div class="item" style="height: 28px;">
		   <#list paymentMethodList as payment>	
		    <#if payment.enabled == "1">
		    <div class="label" style="padding-top:10px;">
			<input style="position: absolute; margin-left: 2px; margin-top: 1px;" type="radio" name="paymentRad" <#if paymentMethod.id==payment.id>checked</#if>  payid="${payment.id}" id="pay-method-${payment.id}" class="hookbox" value="${payment.id}" payname="${payment.name}">
			<label id="pay-method-label-${payment.id}" for="pay-method-${payment.id}" class="fl" style=" margin-left: 20px;line-height: 18px;">${payment.name}</label>
		    </div>
		    <div class="field" style="float:left;white-space:normal; word-break:break-all;">
			<span class="tip">${payment.description}</span>
		    </div>
		    <span class="clr"></span>  
		    </#if>
		    </#list>

		</div>
					</div>
				</dd>
			</dl>
		</div>
		<div class="order-add">
		    <dl>
			<dt style="margin-top:6px;">配送方式：</dt>
			<dd>
			    <#list deliveryMethodList as delivery>
			    <div class="" style="height: 28px;margin-top:10px;line-height:15px;" >
			    <div class="label">
				<input style="margin-left: 2px; margin-top: 1px;float: left;" type="radio" name="deliveryRad"  payname="${delivery.name}" payid="${delivery.id}" id="delivery-method-${delivery.id}"  <#if delivery.id==deliveryMethod.id>checked</#if>  class="hookbox" value="${delivery.id}" >
				<label style="line-height: 18px;" id="delivery-method-label-${delivery.id}" for="delivery-method-${delivery.id}" class="fl">${delivery.name}</label>
			    </div>
			    <div class="field" style="float:left;white-space:normal; word-break:break-all;">
				<span class="tip">${delivery.description}</span>
			    </div>
			   <span class="clr"></span>
			   </div>
			   </#list>
			</dd>
		     </dl>
		</div>
		<div class="order-add">
			<dl>
				<dt style="margin-top:6px;">送货时间：</dt>
				<dd>
					<div class="middle">
						<div class="item" style="height: 10px;margin-top:10px;line-height:15px;">
						<#list deliveryTimeList as deliveryTime>
							<div class="label">
								<input style="position: absolute; margin-left: 2px;"  id="delivery-t3" name="delivery-t"  <#if deliveryTimeIds==deliveryTime.id>checked</#if>  payname="${deliveryTime.introduce}" payid="${deliveryTime.id}"  value="${deliveryTime.id}" type="radio" >
								<label  style="margin-left: 20px;"  class="fl">${deliveryTime.introduce}</label>
							</div>
						</#list>
						</div>
					</div>
				</dd>
			</dl>
		</div>


		<div class="order-add">
			<dt style="margin-top:6px;margin-left: 16px;">保价：&nbsp;<input type="checkbox" id="hasInsuranceFee_checkbox" value="yes" onclick="choseHasInsuranceFee()" <#if hasInsuranceFee == 'yes'>checked="checked"</#if> /></dt>
		</div>
		<div class="order-add" style="display:none;">
			<dt style="margin-top:6px;>会员价：<input type="checkbox" id="isMemberPrice_checkbox" value="yes" onclick="choseIsMemberPrice()" /></dt>
		</div>
		<div class="order-add" style="margin-top:10px;">
			<dl>
				<dt style=" width: 100px; text-align: right;"></dt>
				<dd>
					<input type="button"  value="保存" style="background-color: #E12F45;color: #FFF; border: none; margin:0 auto;" onclick="save_PayAndShip()"/>
				</dd>
			</dl>
		</div>
	</div>
</div>	






<div class="order-row_02 order-box_02 arrow-box_02">
    <div class="order-add">
        <dl onclick="invoiceToggle();">
            <dt>发票信息：</dt>
            <dd id="invoiceInfo"><#if invoiceInfo.invoiceContent=="no">不开发票<#else><#if invoiceInfo.invoiceType=="normal">普通发票</#if>&nbsp;&nbsp;${invoiceInfo.invoiceTitle}&nbsp;&nbsp;<#if invoiceInfo.invoiceContent=="infos">明细</#if></#if></dd>
        </dl>
        <i id="order-arrow" class="order-arrow"></i>
    </div>
</div>
<div id="editInvoiceArea" style="display: none;">
    <div class="order-row_02 order-box_02 arrow-box_02" style="border-top: 1px dotted #dfdfdf;margin:-10px 0 0px 0;background: #fafafa;">
        <div class="order-add">
            <dl>
                <dt style="width: 100px;">是否开具发票：</dt>
                <dd>
                    <span style="margin:0 10px;"><input style="margin-right: 10px;" type="radio" id="needInvoiceYes" name="needInvoice" <#if invoiceInfo.invoiceContent!="no">checked</#if>/>是</span>
                    <span style="margin:0 10px;"><input style="margin-right: 10px;" type="radio" id="needInvoiceNo" name="needInvoice" <#if invoiceInfo.invoiceContent=="no">checked</#if>/>否</span>
                    <input type="hidden" id="needInvoiceHidden" value='${invoiceInfo.invoiceContent}'/>
                </dd>
            </dl>
        </div>
    </div>
    <div id="editInvoiceDetailArea">
        <div class="order-row_02 order-box_02 arrow-box_02" style="background: #fafafa; margin-top: -10px;">
            <div class="order-add">
                <dl>
                    <dt style=" width: 100px; text-align: right;">发票抬头：</dt>
                    <dd>
                        <ul>
                        <#list memberInvoicesList as invoice>
                            <li style="padding: 8px;" tag="_InvoicesLi">
                                <input style="margin-right: 10px;" type="radio" id="${invoice.id}" name="invoiceTitleRadio" checked="<#if memberInvoice.id == invoice.id>true<#else>false</#if>"
                                       value="${invoice.invoiceTitle}"/>${invoice.invoiceTitle}</li>
                        </#list>
                            <li style="padding-top: 10px;" >
                                <input style="margin-right: 10px; font-size:10px;" type="text" id="newInvoice" name="newInvoice" placeholder="请输入新的发票抬头"/>
                            </li>
                            <input type="hidden" id="selectedTitleId" value="${memberInvoice.id}"/>
                        </ul>
                    </dd>
                </dl> 
            </div>
        </div></div><!--editInvoiceDetailArea-->
    <div id="saveBtnArea" class="order-row_02 order-box_02 arrow-box_02 <#if invoiceInfo.invoiceContent!="no">mt-20</#if>" style="border-bottom: 1px solid #d8d8d8;  padding-top: 0; padding-bottom:20px; background: #fafafa;" >
        <div class="order-add">
            <dl>
                <dt style=" width: 100px; text-align: right;"></dt>
                <dd>
                    <input type="button" id="saveInvoiceInfo" value="保存" style="background-color: #E12F45;color: #FFF; border: none; margin:0 auto;"/>
                </dd>
            </dl>
        </div>
    </div>
</div><!--editInvoiceArea-->
<div class="order-row_02 order-box_02" style="margin-top: 10px;">
    <div class="order-comment">
        <dl>
            <dt>备注信息：</dt>
            <dd>
                <textarea name="remark" id="remark" type="text" placeholder="给支持的项目留下备注信息" maxlength="170" class="remark" style="visibility: visible;"></textarea>
            </dd>
        </dl>
    </div>  
</div>
<div class="order-row_02 order-box_02 order-money-box" style="margin-bottom:70px;">
    <div class="order-money">
	
	<dl id="insuranceFeeId">
	     <#if hasInsuranceFee == 'yes'>
	     <dt>保价费：</dt>
	     <dd><span> ${insuranceFee*zcgoods.buycount?string(priceCurrencyFormat)} </span></dd>
	     </#if>
	</dl>
	
        <dl>
	
            <dt>众筹价：</dt>
            <dd><span id="successPrice"> ${zcgoods.successPrice?string(priceCurrencyFormat)} </span></dd>
        </dl>
        <#--<dl>-->
            <#--<dt>市场价：</dt>-->
            <#--<dd>${zcgoods.marketPrice?string(priceCurrencyFormat)}</dd>-->
        <#--</dl>-->
        <dl>
            <dt>起订数量：</dt>
            <#--<dd><span> ${(zcgoods.buyMinNum * zcgoods.successPrice)?string(priceCurrencyFormat)}元(${zcgoods.buyMinNum}<#if zcgoods.unit?exists>${zcgoods.unit}<#else>件</#if>) </span></dd>-->
            <dd><span> ${zcgoods.buyMinNum}<#if zcgoods.unit?exists>${zcgoods.unit}<#else>件</#if></span></dd>
        </dl>
        <#if zcgoods.buyMaxNum != 0>
        <dl>
            <dt>最大购买数量：</dt>
            <#--<dd><span> ${(zcgoods.buyMaxNum * zcgoods.successPrice)?string(priceCurrencyFormat)}元(${zcgoods.buyMaxNum}<#if zcgoods.unit?exists>${zcgoods.unit}<#else>件</#if>) </span></dd>-->
            <dd><span> ${zcgoods.buyMaxNum}<#if zcgoods.unit?exists>${zcgoods.unit}<#else>件</#if> </span></dd>
        </dl>
        </#if>
        <#if zcgoods.maxNum != 0>
            <dl style="display: none;">
                <dt>库存：</dt>
                <dd><span> ${sysl}<#if sysl?exists>${sysl}<#else>件</#if> </span></dd>
            </dl>
        </#if>

        <dl>
            <dt>购买数量:</dt>
            <dd>
                <div class="quantity-wrapper customize-qua">
                    <input type="tel" pattern="[0-9]*" class="spinnerExample" value="${zcgoods.buyMinNum}"/>
                </div>
            </dd>
        </dl>

        <dl>
            <dt>配送运费：</dt>
            <dd><em><span id="deliveryFee" style="font-size: 18px;">${deliveryFee?string(priceCurrencyFormat)}</span></em></dd>
            <input type="hidden" id="tfare" value="0">
        </dl>

        <dl>
            <dt>商品总额：</dt><#-- 不含运费 -->
            <dd><em>
                <span id="allFee" style="font-size: 18px;">
            <#if zcgoods.prepaymentType == 1>
                ${(zcgoods.buyMinNum * zcgoods.successPrice)?string(priceCurrencyFormat)}
            <#elseif zcgoods.prepaymentType == 2 >
                ${zcgoods.prepaymentRatio?string(priceCurrencyFormat)}
            </#if>
            </span></em></dd>
        </dl>
        <dl>
            <dt>订单合计：</dt>
            <dd><em><span id="payAll" style="font-size: 18px;">${(zcgoods.buyMinNum * zcgoods.successPrice  + deliveryFee)?string(priceCurrencyFormat)}</span></em></dd>
        </dl>
    </div>
</div>
<div class="pro_but">
    <div class="fl">保证金：<em><span id="prepaymentFee" style="font-size: 20px;"><#if zcgoods.prepaymentType == 1>${(zcgoods.buyMinNum * zcgoods.successPrice * zcgoods.prepaymentRatio / 100)?string(priceCurrencyFormat)}
            <#elseif zcgoods.prepaymentType == 2 >${zcgoods.prepaymentRatio?string(priceCurrencyFormat)}</#if></span></em></div><#-- 含运费 -->
    <a href="javascript:void(0);" onclick="submit_Order();" class="fr mr10" id="submitOrder">提交订单</a>
</div>
<form id="orderCheckInfo">
    <input type="hidden" id="order_receiverId" name="receiverId" value="${receiver.id}">
    <input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethod.id}">
    <input type="hidden" id="order_deliveryMethodId" name="deliveryMethodId" value="${deliveryMethod.id}">
    <!--送货时间 Auth:hks Time:2015-11-13 14:37:52 Start -->
    <input type="hidden" id="order_deliveryTime" name="order_deliveryTimeName" value="${deliveryTimeList[0].introduce}">
    <!--送货时间  Auth:hks Time:2015-11-13 14:37:52  end -->
    <input type="hidden" id="order_deliveryTimeId" name="order_deliveryTimeId" value="${deliveryTimeList[0].id}">

    <input type="hidden" id="zcgoodsId" name="zcgoodsId" value="${zcgoods.id}">
    <input type="hidden" id="platform" name="platform" value="1">
    <input type="hidden" name="invoiceType" id="invoiceType" value="${invoiceInfo.invoiceType}"/>
    <input type="hidden" name="invoiceTitle" id="invoiceTitle" value="${invoiceInfo.invoiceTitle}"/>
    <input type="hidden" name="invoiceContent" id="invoiceContent" value="${invoiceInfo.invoiceContent}"/>
    <input type="hidden" name="hasInsuranceFee" id="hasInsuranceFee" value="${invoiceInfo.hasInsuranceFee}"/>
    <input type="hidden" name="insuranceFee" id="insuranceFee" value="${insuranceFee*zcgoods.buycount?string(priceCurrencyFormat)}" fee="${insuranceFee}"/>
    <input type="hidden" name="orderDealNum" id="orderDealNum"/>
    <input type="hidden" id="dataFrom" name="dataFrom" value="4">
</form>
<form method="post" id="reloadForm" style="display:none;"></form>
<script src="${path}/js/jquery.spinner.js"></script>
<script type="text/javascript">

    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#FFFFFF'
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();

                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }
        fmoney = function (s, n) {
            if (!jQuery.isNumeric(s)) {
                return "0.00";
            }
            n = n > 0 && n <= 20 ? n : 2;
            s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
            return s;
        };
        recalculate = function(){
	   
            var allFee = 0.0;
            var payAll = 0.0;
            var deliveryFee = 0.0;
            var prepaymentFee = 0.0;
	    
	    var  size=parseFloat(jQuery('.spinnerExample').val());
	    if(size < ${zcgoods.buyMinNum}){
                closeWaiting();
                popAlert("您最少需购买${zcgoods.buyMinNum}件商品方可下单!");
                return;
            }else if(size > ${sysl}){
		closeWaiting();
                popAlert("您还可以再购买${sysl}件商品!");
                return;
	    }
           
            /*var goodsTotalWeight = parseFloat(jQuery('.spinnerExample').val()) *  parseFloat(${zcgoods.weight});
  
            if( goodsTotalWeight < ${deliveryMethod.firstWeight}){
                deliveryFee = ${deliveryMethod.firstPrice};
            } else {
                var overWeight = goodsTotalWeight - ${deliveryMethod.firstWeight};
                var continueUnit = 0;
                if(${deliveryMethod.continueWeight} > 0 ) {
                    continueUnit = new Number( overWeight / ${deliveryMethod.continueWeight} + 0.1);
                    continueUnit = continueUnit.toFixed(0);
                    deliveryFee = ${deliveryMethod.firstPrice} + ${deliveryMethod.continuePrice} * continueUnit;
                }
            }*/
	    var  dealNum=parseFloat(jQuery('.spinnerExample').val());

	    $.ajax({
                type: "post",
                url: "${base}/zcorder/ajax/calcBuyZcGoods?zcgoodsId=${zcgoods.id}&dealNum="+dealNum+"&whichclient=whichapp",
                data:jQuery("#orderCheckInfo").formSerialize(),
                dataType: "json",
		async:false,
                success: function (data) {
		    deliveryFee=data.deliveryFee;
                },
                error : function(error) {
                    //layer.alert("购买数量必须为大于等于起批数量的整数", {icon:5});
                }
            });
	   
            jQuery('#deliveryFee').html('¥'+fmoney(deliveryFee, 2));
            if( 1 == ${zcgoods.prepaymentType}){
                allFee = parseFloat(jQuery('.spinnerExample').val()) * parseFloat(${zcgoods.successPrice});
                prepaymentFee = parseFloat(jQuery('.spinnerExample').val()) * parseFloat(${zcgoods.successPrice}) * parseInt(${zcgoods.prepaymentRatio}) / 100;
                payAll = parseFloat(jQuery('.spinnerExample').val()) * parseFloat(${zcgoods.successPrice}) +  parseFloat(deliveryFee);
                jQuery('#allFee').html('¥'+fmoney(allFee+parseFloat(jQuery('.spinnerExample').val())*parseFloat($("#insuranceFee").attr("fee")), 2));
                jQuery('#payAll').html('¥'+fmoney(payAll+parseFloat(jQuery('.spinnerExample').val())*parseFloat($("#insuranceFee").attr("fee")), 2));
                jQuery('#prepaymentFee').html('¥'+fmoney(prepaymentFee, 2));
            }else if( 2 == ${zcgoods.prepaymentType}){
                allFee = zcgoods.prepaymentRatio;
                payAll = zcgoods.prepaymentRatio;
                jQuery('#allFee').html('¥'+fmoney(allFee+parseFloat(jQuery('.spinnerExample').val())*parseFloat($("#insuranceFee").attr("fee")), 2));
                jQuery('#payAll').html('¥'+fmoney(payAll+parseFloat(jQuery('.spinnerExample').val())*parseFloat($("#insuranceFee").attr("fee")), 2));

            }

            //$("#insuranceFee").html(parseFloat(jQuery('.spinnerExample').val())*parseFloat($("#insuranceFee").attr("fee")));
	    //保价费
            if($("#hasInsuranceFee").val()=="yes"){
		    var insuranceFee=fmoney(parseFloat(jQuery('.spinnerExample').val())*parseFloat($("#insuranceFee").attr("fee")),2);
		    $("#insuranceFeeId").html('<dt>保价费：</dt><dd><span>¥'+insuranceFee+'</span></dd>');
	    }
	   

        };
        var sp = jQuery('.spinnerExample').spinner({
                    min: ${zcgoods.buyMinNum},
                    max: <#if zcgoods.buyMaxNum gt sysl>${sysl}<#else>${zcgoods.buyMaxNum}</#if>,
                    value:${zcgoods.buyMinNum}
                },recalculate,recalculate,recalculate);

        /**
         * 修改收货地址
         */
        toReceiver = function(){
            var paymentMethodId=jQuery("#order_paymentMethodId").val();
            var deliveryId = jQuery("#order_deliveryMethodId").val();
            var url= fullpath + "/member/receiver?whichclient=whichapp&to=zcorderCheck&o=${zcgoods.id}&paymentId="+paymentMethodId+"&deliveryId="+deliveryId;
            jumpto(url);
        };
        invoiceToggle = function() {
            jQuery('#editInvoiceArea').toggle();
            jQuery('#order-arrow').toggleClass('order-arrow90');
        }

        jQuery('input[name="needInvoice"]').on('change', function(e){
            console.log(e.target.id);
            if('needInvoiceYes' == e.target.id){
                jQuery('#needInvoiceHidden').val('infos');
                jQuery('#editInvoiceDetailArea').show();
                jQuery('#saveBtnArea').addClass('mt-20');
            }else{
                jQuery('#needInvoiceHidden').val('no');
                jQuery('#editInvoiceDetailArea').hide();
                jQuery('#saveBtnArea').removeClass('mt-20');
            }

        });

        jQuery('input[name="invoiceTitleRadio"]').on('change', function(e){
            console.log(e.target.id);
            jQuery('#selectedTitleId').val(e.target.id);
        });

        jQuery('#saveInvoiceInfo').on('tap', function(e){
            console.log(e.target.id);
            showWaiting();
            var data;
            if('no' != jQuery('#needInvoiceHidden').val()){
                //需要开具发票
                if(!isEmpty(jQuery('#newInvoice').val())){
                    //输入了新的发票抬头，即认为是新增
                    var isExist = false;
                    var newInvoice = jQuery('#newInvoice').val();
                    jQuery('input[name=invoiceTitleRadio]').each( function(index, domEle){
                        if (newInvoice == jQuery(domEle).val()){
                            isExist = true;
                            closeWaiting();
                            popAlert('发票抬头已存在!');
                            return;
                        }
                    });
                    data = "invoiceTitle=" + newInvoice;
                    if(!isExist){
                        jQuery.ajax({
                            type: "post",
                            url: "${base}/member/saveInvoice",
                            data: data,
                            dataType: "json",
                            success: function (data) {
                                if (data.success) {
                                    var info =  "普通发票　　" + newInvoice + "　　明细";
                                    jQuery("#invoiceInfo").text(info);
                                    jQuery('input[name=invoiceTitleRadio]').each( function(index, domEle){
                                        jQuery(domEle).removeProp('checked');
                                    });

                                    var html = '<li style="border-bottom: 1px solid #d8d8d8;padding: 10px;" tag="_InvoicesLi"><input style="margin-right: 10px;" type="radio" id="'
                                            + data.id + '" name="invoiceTitleRadio" checked value="'
                                            + newInvoice + '"/>' + newInvoice + '</li>';
                                    jQuery('li[tag="_InvoicesLi"]').last().after(html);
                                    jQuery('#editInvoiceArea').hide();
                                    jQuery("#newInvoice").val("");

                                    jQuery("#invoiceType").val("normal");
                                    jQuery("#invoiceTitle").val(newInvoice);
                                    jQuery("#invoiveContent").val("infos");


                                    closeWaiting();
                                    popAlert(data.msg);
                                } else {
                                    closeWaiting();
                                    popAlert(data.msg);
                                }
                            },
                            error: function () {
                                closeWaiting();
                                popAlert("亲爱的用户请不要频繁点击, 请稍后重试...");
                            }
                        });
                    }
                }else{
                    //选择发票抬头
                    if(typeof(jQuery('#selectedTitleId').val()) == 'undefined' || jQuery('#selectedTitleId').val() == ''){
                        closeWaiting();
                        popAlert('请选择发票抬头或者输入一个新的发票抬头!');
                        return;
                    }
                    var selectedTitle = jQuery("#" + jQuery('#selectedTitleId').val());
                    if(typeof(selectedTitle) == 'undefined'){
                        closeWaiting();
                        popAlert('请选择发票抬头或者输入一个新的发票抬头!');
                        return;
                    }

                    data = "invoiceTitle=" + jQuery(selectedTitle).prop("value")
                            + "&id=" + jQuery(selectedTitle).prop("id")
                            + "&invoiceContent=infos";
                    jQuery.ajax({
                        type: "post",
                        url: "${base}/member/saveInvoiceSetting",
                        data: data,
                        dataType: "json",
                        success: function (data) {
                            closeWaiting();
                            if (data.success) {
                                popAlert(data.msg);
                                var info =  "普通发票　　" + jQuery(selectedTitle).prop("value") + "　　明细";
                                jQuery("#invoiceInfo").text(info);
                                jQuery('#editInvoiceArea').hide();
                                jQuery("#invoiceType").val("normal");
                                jQuery("#invoiceTitle").val(jQuery(selectedTitle).prop("value"));
                                jQuery("#invoiveContent").val("infos");

                            } else {
                                popAlert(data.msg);
                            }
                        },
                        error:function(data){
                            closeWaiting();
                            popAlert(data);
                        }
                    });
                }
            }else{
                //不需要开具发票
                data = "invoiceContent=no";

                jQuery.ajax({type: "post",
                    url: "${base}/member/saveInvoiceSetting",
                    data: data,
                    dataType: "json",
                    success:function(data){

                        if(data.success){

                            jQuery("#invoiceInfo").text('不开发票');
                            jQuery("#invoiceType").val("");
                            jQuery("#invoiceTitle").val("");
                            jQuery("#invoiveContent").val("no");
                            jQuery('#editInvoiceArea').hide();
                            closeWaiting();
                            popAlert(data.msg);
                        }else{
                            closeWaiting();
                            popAlert(data.msg);
                        }
                    },
                    error:function(data){
                        closeWaiting();
                        popAlert(data);
                    }
                });
            }

        });
        /**
         * 提交订单
         */
        submit_Order = function(){
	    
            showWaiting();
            setTimeout( function(){
                var receiverId=jQuery("#order_receiverId").val();
                if(receiverId.length==0){
                    popAlert("请选择收货人!");
                    return;
                }
                var dealNum=jQuery('.spinnerExample').val();
                if(dealNum.length==0){
                    closeWaiting();
                    popAlert("数量不能为空!");
                    return;
                }else if (dealNum < ${zcgoods.buyMinNum}){
                    closeWaiting();
                    popAlert("数量不能小于${zcgoods.buyMinNum}件!");
                    return;
                }else if(dealNum > <#if zcgoods.buyMaxNum gt sysl>${sysl}<#else>${zcgoods.buyMaxNum}</#if>){
                    closeWaiting();
                    popAlert("数量不能大于${sysl}件!"); 
                    return;
                }

                jQuery("#orderDealNum").val(dealNum);
		
                jQuery.ajax({
                    type: "post",
                    url: "${base}/zcorder/submit?remark="+jQuery("#remark").val(),
                    data:jQuery("#orderCheckInfo").formSerialize(),
                    dataType: "json",
                    success: function (data) {
                        if (data.status == "success") {
                            jumpto(fullpath + "/order/view/" + data.orderId + ".html?whichclient=whichapp");

                            closeWaiting();
                        } else if(data.status == "warn"){
                            var layer_confrim = layer.open({
                                title:'提示：',
                                content:'可用资金不足，不能下单！</br>确定要去充值吗?',
                                btn: ['确认', '取消'],
                                shadeClose: false,
                                yes: function(){
                                    layer.close(layer_confrim);
                                    jumpto(fullpath + '/account/recharge?whichclient=whichapp');
                                },
                                no: function(){
                                    closeWaiting();
                                }
                            });
                        }else {
                            closeWaiting();
                            popAlert(data.message);
                        }
                    },
                    error : function(error) {
                        closeWaiting();
                        popAlert("亲爱的用户请不要频繁点击, 请稍后重试...");
                    }

                });
            }, 1000);//spinner校验执行有一定的延时，需要延时1000ms，等待spinner校验执行
        };
	
    }(mui, document));
//配送方式和保价
function chooseDeliveryAddressToggle(){
	$("#shipmentTest").toggle();
	jQuery('#order-arrow').toggleClass('order-arrow90');
	jQuery('#shipment').toggle();  
	jQuery('#order-arrow').toggleClass('order-arrow90');
}


//是否保价
function choseHasInsuranceFee(){
     if($("#hasInsuranceFee_checkbox").is(":checked")){
	$("#hasInsuranceFee").val("yes");
     }else{
	$("#hasInsuranceFee").val("no");
     }
}


function save_PayAndShip(){
     //获取选中的支付方式、配送方式、配送时间、保价 
     $(".delivery-selected").html($("input[name='paymentRad']:checked").attr("payname"));
     $(".payment-selected").html($("input[name='deliveryRad']:checked").attr("payname"));
     $(".deliveryT-selected").html($("input[name='delivery-t']:checked").attr("payname"));
     
     $("#order_paymentMethodId").val($("input[name='paymentRad']:checked").val());
     $("#order_deliveryMethodId").val($("input[name='deliveryRad']:checked").val());  
     $("#order_deliveryTimeId").val($("input[name='delivery-t']:checked").val()); 
    
     //1.收货地址
     var receiverId=$("#order_receiverId").val();
     //2.支付方式
     var paymentMethodId=$("#order_paymentMethodId").val();
     //3.配送方式
     var deliveryMethodId=$("#order_deliveryMethodId").val();
     //4.送货时间
     var deliveryTimeId=$("#order_deliveryTimeId").val();
     //5.会员
     var isMemberPrice=$("#isMemberPrice").val();
     //6.保价
     var hasInsuranceFee=$("#hasInsuranceFee").val();
     //7.发票类型
     var invoiceType=$("#invoiceType").val();
     //8.发票内容 
     var invoiceContent=$("#invoiceContent").val();
     //9.发票标题
     var invoiceTitle=$("#invoiceTitle").val();
     //10.众筹商品数量
     var dealNum=$('.spinnerExample').val();//$("#dealNum").val();
     //11.送货时间内容
     var order_deliveryTimeName=$("#order_deliveryTime").val();
     //12.众筹商品id
     var zcgoodsId = jQuery("#zcgoodsId").val();
     //13.备注信息
     var remark = jQuery("#remark").val();
     //14.保价费
     var insuranceFee = jQuery("#insuranceFee").val();
     
     installReloadForm(zcgoodsId,deliveryMethodId,paymentMethodId,deliveryTimeId,order_deliveryTimeName,receiverId,invoiceContent,invoiceTitle,invoiceType,isMemberPrice,hasInsuranceFee,insuranceFee,dealNum);

     jQuery.ajax({
	type: "post",
		url: base + "zcorder/reloadZCOrderCheck/"+zcgoodsId+"?whichclient=whichapp&__getModel__=true",
		data:jQuery("#reloadForm").formSerialize(),
		dataType: "json",
		success: function (data) {
			//众筹价
			$("#deliveryFeeId").html('¥'+data.zcgoods.successPrice);
			//运费
			var deliveryFees=fmoney(data.deliveryFee,2);
			$("#deliveryFee").html('¥'+deliveryFees);
				
			//保价费
			var hasInsuranceFee=0;
			if(data.hasInsuranceFee== 'yes'){
			     hasInsuranceFee=fmoney(data.insuranceFee *data.dealNum,2);
			     $("#insuranceFee").html(hasInsuranceFee);
			     $("#insuranceFeeId").html('<dt>保价费：</dt><dd><span>¥'+hasInsuranceFee+'</span></dd>');
			     //$("#tfare").html(fmoney(data.insuranceFee *data.dealNum),2); 
			     $("#insuranceFee").attr("fee",data.insuranceFee);
			}else{
			     $("#insuranceFeeId").html("");
			     $("#insuranceFee").attr("fee",0);
			}

			//商品总额
			var allFee=0;
			if(parseInt(data.zcgoods.prepaymentType) == 1){
			     allFee=fmoney(data.zcgoods.successPrice*data.dealNum,2);
			     $("#allFee").html('¥'+allFee);
			     
			}else if(parseInt(zcgoods.prepaymentType) == 2){
			     allFee=fmoney(zcgoods.prepaymentRatio,2);
			     $("#allFee").html('¥'+allFee);  
			}

			var payAll=parseFloat(allFee)+parseFloat(hasInsuranceFee)+parseFloat(deliveryFees);
			
			//订单总额
			$("#payAll").html("¥"+payAll);

			closeWaiting();
			
													
			if(parseFloat(data.deliveryFee)<0){
			      $("#submitOrder").attr("disabled", true);
			      popAlert("运费计算出现问题，请更换配送方式或收货地址或与管理员联系！");
			}else{
			      $("#submitOrder").removeAttr("disabled");
			}
			$("#shipmentTest").show();
			jQuery('#order-arrow').toggleClass('order-arrow90');
		},
		error : function(error) {
			closeWaiting();
			popAlert("亲爱的用户请不要频繁点击, 请稍后重试...");
		}
			
	});

}
function installReloadForm(o,deliveryMethodId,paymentMethodId,deliveryTimeId,order_deliveryTimeName,receiverId,invoiceContent,invoiceTitle,invoiceType,isMemberPrice,hasInsuranceFee,insuranceFee,dealNum){
	var html = '';
	html += '<input type="hidden" name="o" id="rf_o" value="' + o + '" >';
	html += '<input type="hidden" name="deliveryMethodId" id="rf_deliveryMethodId" value="' + deliveryMethodId + '" >';
	html += '<input type="hidden" name="paymentMethodId" id="rf_paymentMethodId" value="' + paymentMethodId + '" >';
	html += '<input type="hidden" name="deliveryTimeId" id="rf_deliveryTimeId" value="' + deliveryTimeId + '" >';
	html += '<input type="hidden" name="order_deliveryTimeName" id="rf_order_deliveryTimeName" value="' + order_deliveryTimeName + '" >';
	html += '<input type="hidden" name="receiverId" id="rf_receiverId" value="' + receiverId + '" >';
	html += '<input type="hidden" name="invoiceContent" id="rf_invoiceContent" value="' + invoiceContent + '" >';
	html += '<input type="hidden" name="invoiceTitle" id="rf_invoiceTitle" value="' + invoiceTitle + '" >';
	html += '<input type="hidden" name="invoiceType" id="rf_createOrderType" value="' + invoiceType + '" >';
	html += '<input type="hidden" name="isMemberPrice" id="rf_isMemberPrice" value="' + isMemberPrice + '" >';
	html += '<input type="hidden" name="hasInsuranceFee" id="rf_hasInsuranceFee" value="' + hasInsuranceFee + '" >';
	html += '<input type="hidden" name="insuranceFee" id="rf_insuranceFee" value="' + insuranceFee + '" >';
	html += '<input type="hidden" name="dealNum" id="rf_dealNum" value="' + dealNum + '" >';				
	html += '<input type="hidden" name="__getModel__" id="__getModel__" value="true" >';
					
	$("#reloadForm").html( html );
	jQuery('#shipment').toggle();  
	jQuery('#order-arrow').toggleClass('order-arrow90');
}
			
</script>
</body>
</html>