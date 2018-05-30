<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "#www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="#www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单信息确认</title>
<link href="${base}/static/mall/jd/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"ordercheck"
};
</script>
</head>
<body>
<#include "mall/jd/shortcut.ftl"/>
<style>
.header {padding: 20px 0 10px;}
#logo {padding-left: 5px;float: left}
.progress {padding-top: 6px;}
.progress .progress-1{background:url(${base}/static/mall/img/step1.png) no-repeat;width:481px;padding-top:23px;overflow:hidden;height:23px;}
.progress .progress-2 {background: url(${base}/static/mall/img/step2.png) no-repeat;width: 481px;padding-top: 23px;overflow: hidden;height: 23px;}
.progress ul {width:481px; float:right;}
.progress li {width:160px; height:23px; float:left; color:#bce8a3; line-height:23px; text-align:center;}
.progress li b {width:22px; height:25px; display:none; }
.progress li.step-1{color:#7abd54;}
.progress li.step-2{color:#aaaaaa;width:161px;}
.progress li.step-3{color:#aaaaaa;}
.progress li.complete b {background-position:0 -50px;}

</style>

<style>

#checkout {/*width:988px;*/ border:1px solid #ddd; margin-bottom: 20px;}
#checkout .mt {height:28px; background-color:#f7f7f7;padding-top:7px;}
#checkout .mt h2 {padding-left:10px;font-size: 16px;}

.checkout-steps .step {border-top:1px solid #ddd;}

.checkout-steps .step-current {width:984px; margin:-1px; border:3px solid #f60; position:relative;}
.checkout-steps .step-title {height:45px; padding:0 20px; line-height:45px;position:relative;}
.checkout-steps .step-title strong {color:#999; font-size:14px;}
.checkout-steps .step-current .step-title strong, .checkout-steps .step-complete .step-title strong {color:#000;}
.checkout-steps .step-action {padding-left:10px; color:#005ea7; font-size:12px; font-weight:400;}
.checkout-steps .step-action a, .checkout-steps .step-action a:visited, .checkout-steps .step-action a:hover {color:#005ea7;}

.checkout-steps .sbox-wrap {padding:0 42px;}
.checkout-steps .sbox {width:1210px; overflow:hidden;}
.checkout-steps .sbox {padding:0px 0 20px;}
.checkout-steps .step-complete .sbox-wrap {padding:0 44px;}
.checkout-steps .s-content p {line-height:22px;}


.checkout-steps a.return-edit, .checkout-steps a.return-edit:visited {color: #005ea7;}
.checkout-steps a.return-edit, .checkout-steps a.return-edit:visited {color: #005ea7;}
.checkout-steps a.return-edit {float: right;font-size: 12px;font-weight: 400;padding-right: 24px;text-decoration: bottom;}

#checkout .invoice-content {line-height: 22px;}
.ftx-04 {color: #f60;}
.invoice-prompt dt {float: left;width: 60px;}
.invoice-prompt dd {float: left;}
#part-invoice .invoice-note {padding: 1px 0 5px 1px;color: #f60;}

.group {zoom: 1;}
.checkout-buttons {width:1185px; height:50px; background-color:#f5f5f5;position:relative; padding-right: 25px;}
.checkout-buttons .inner {padding-right: 18px;}
.checkout-buttons .checkout-submit {width: 135px;height: 36px;line-height: 100px;overflow: hidden;margin-top: 8px;}
.checkout-buttons .checkout-submit, .checkout-buttons .checkout-submit-disabled {margin-top: 5px;border: 0;float: right;cursor: pointer;}
.checkout-buttons .checkout-submit{background-color:#e00;position:relative;line-height:36px;overflow:hidden;color:#fff;font-weight:bold;font-size:16px;}
.checkout-buttons .checkout-submit b{position:absolute;left:0;top:0;width:135px;height:36px;background:url(${base}/static/mall/img/btn-submit.jpg) no-repeat;cursor:pointer;overflow:hidden;}
.checkout-buttons .checkout-submit:hover{background-color:#EF494D;}
.checkout-buttons .checkout-submit:hover b{background-position:0 -36px;}
.checkout-buttons .checkout-submit-disabled{background-color:#ccc;position:relative;line-height:36px;font-weight:bold;font-size:16px;cursor:not-allowed;}
.checkout-buttons .checkout-submit-disabled b{position:absolute;left:0;top:0;width:135px;height:36px;background:url(${base}/static/mall/img/btn-submit-disabled.png) no-repeat;cursor:not-allowed;}
.checkout-buttons .total {padding-right: 18px;float: right;line-height: 50px;font-size: 14px;font-weight: 700;}
.checkout-buttons .total strong {color: #e4393c;font-size: 20px;vertical-align: middle;font-weight: normal;}

#order-cart {width:1120px;}
#order-cart .order-review {width:1120px; padding-top:5px;}
#order-cart .order-review table {border-collapse: collapse;border-spacing: 0;}
#order-cart .review-thead {width:100%;}
#order-cart .review-thead td {height:25px; border-left:1px solid #fff; color:#666; line-height:25px; text-align:center; background-color:#eeeeee;}
#order-cart .review-thead .fore1 {border-left:0;}
#order-cart .review-thead .fore2 {width:120px;}
#order-cart .review-thead .fore3 {width:150px;}
#order-cart .review-thead .fore4 {width:100px;}

.order-summary {padding-top: 10px;overflow: hidden;zoom: 1;}
.order-summary .statistic {width: 300px;}
.order-summary .statistic .list {height: 24px;line-height: 24px;overflow: hidden;zoom: 1;}
.order-summary .statistic span {width: 180px;margin-right: 20px;float: left;text-align: right;}
.order-summary .statistic .price {color: #333333;float: left;width: 100px;text-align: right;}
.order-summary .statistic em {color: #e4393c;}

#order-cart .review-block .block-header {background-color: #ddefff;}
#order-cart .review-block .block-header {border-bottom: 1px solid #ddd;}

#order-cart .review-tbody {border-bottom: 1px dashed #ddd;padding: 10px 0 0 0;}
#order-cart .order-table {width:1120px;border-collapse: collapse;border-spacing: 0; height: 30px; line-height: 30px;}
#order-cart .order-table td {padding-left:1px;}
#order-cart .order-table .fore1 {width:400px; padding:0 10px;}
#order-cart .order-table .p-price {width:110px; padding-right:10px; text-align:right;}
#order-cart .order-table .p-sp {width:200px; padding-right:10px; text-align:right;}
#order-cart .order-table .p-promotion {width:150px; padding-top:5px;}
#order-cart .order-table .fore2 {width:100px; text-align:center;}
#order-cart .order-table .p-price strong {color:#333;}

#order-cart .p-goods {width:406px;}
#order-cart .p-goods {overflow:hidden; zoom:1;}
#order-cart .p-img {width:50px; height:50px; margin-right:5px; border:1px solid #ddd; padding:0; float:left; overflow:hidden;}
#order-cart .p-detail {width:346px; float:left; line-height:16px;}
#order-cart .p-detail .p-tip {width:60px; float:left; color:#c00;}
#order-cart .p-name {width:245px; height:32px; overflow:hidden; zoom:1;}
#order-cart .p-name a, #order-cart .p-name a:visited, #order-cart .p-name a:hover {color:#005ea7;}
#order-cart .p-more, #order-cart .p-extra {color:#999; line-height:20px;}
#order-cart .p-promotion {text-align:center;}

.p-name, .p-detail {word-break: break-all;word-wrap: break-word;}
.p-img, .p-name, .p-price, .p-market, .p-detail {overflow: hidden;}

</style>

<style>
#consignee .item, #part-invoice .item {height:28px; margin-bottom:5px; overflow:hidden; zoom:1; line-height:28px;}
#consignee .item label b{font-weight:normal;}
#consignee .item-selected label b{font-weight:bold;}
#consignee .item-selected, #part-invoice .item-selected {background-color:#fff4d3;}
#consignee .item .hookbox, #part-invoice .item .hookbox {margin:7px 5px 0 8px; *margin:3px 2px 0 5px;}
#consignee-list .item-action {padding-left:20px; color:#999;}
#consignee-list .item-action a, #invoice-list .item-action a {margin:0 5px; color:#005ea7;}
#consignee-list .item-action a:visited, #consignee-list .item-action a:hover,
#invoice-list .item-action a:visited, #invoice-list .item-action a:hover{color:#005ea7;}


#consignee .list,.invoice-form .list{padding:5px 0;overflow:hidden;zoom:1}
#consignee .list .label,.invoice-form .list .label{width:85px;height:26px;margin-right:5px;float:left;color:#666;line-height:26px;text-align:right}
#consignee .list .label em,.invoice-form .list .label em{margin-right:5px;color:#f60;font-family:sans-serif}
#consignee .list .field{height:26px;float:left;line-height:26px}

#consignee .message,.invoice-form .message{border:1px solid #db9a9a;padding:4px 0;background-color:#ffe8e8}
#consignee .message .error,.invoice-form .error{height:26px;padding-left:6px;float:left;color:#c00;line-height:26px}
#consignee .message i,.invoice-form .message i{margin-right:5px;float:left;overflow:hidden;line-height:0;font-size:0}
#consignee .message .error i,.invoice-form .message .error i{width:16px;height:15px;margin-top:5px;background:url(${base}/static/mall/img/icon-error.gif) no-repeat}
#consignee .textbox,.invoice-form .textbox{width:138px;height:16px;border:1px solid #ccc;padding:4px 3px;font-family:Arial,"\5b8b\4f53",sans-serif}
#consignee input.focus,.invoice-form input.focus{border:1px solid #fdd253;background-color:#ffffe6}
#consignee .list-radio .hookbox,.invoice-form .list-radio .hookbox{vertical-align:top;margin:7px 5px 0 0}
#consignee .list-radio label,.invoice-form .list-radio label{margin-right:20px}
#consignee .select-address select,.invoice-form .select-address select{height:22px;margin:2px 5px 0 0}
#consignee .full-address .textbox,.invoice-form .full-address .textbox{width:308px}
#consignee .phone,.invoice-form .phone{float:left}
#consignee .phone span,#consignee .phone em,.invoice-form .phone span,.invoice-form .phone em{float:left}
#consignee .phone em,.invoice-form .phone em{padding:0 20px 0 5px;color:#999}
#consignee .phone span,.invoice-form .phone em{color:#666}

#consignee .form .form-tip {padding-left: 10px;float: left;}
#checkout .form-tip {color: #999;}

#consignee .form-btn {height: 30px;padding-top: 4px;}

#checkout a.btn-submit, #checkout a.btn-submit:visited, #checkout a.btn-submit:hover {color:#fff; text-decoration:none;}
#checkout .btn-submit {height:30px; margin-right:10px; padding-left:20px; float:left; line-height:30px; font-size:14px; font-weight:700;background:url(${base}/static/mall/img/btn-red.png) no-repeat;}
#checkout .btn-submit span {height:30px; padding-right:20px; float:left; cursor:pointer;background:url(${base}/static/mall/img/btn-red.png) no-repeat 100% -30px;}
#checkout .btn-submit:hover {height:30px; margin-right:10px; padding-left:20px; float:left; line-height:30px; font-size:14px; font-weight:700;background:url(${base}/static/mall/img/btn-red.png) no-repeat 0 -60px;}
#checkout .btn-submit:hover span {height:30px; padding-right:20px; float:left; cursor:pointer;background:url(${base}/static/mall/img/btn-red.png) no-repeat 100% -90px;}

</style>

<style>
#payment-ship .mc {overflow: visible;}
#payment-ship .item {overflow: hidden;zoom: 1;line-height: 28px;}
#payment-ship .item-selected {background-color:#fff4d3;}

#payment-ship .item .label {width: 120px;float: left;}
#payment-ship .item .hookbox {margin: 7px 5px 0 8px;}

#payment-ship .item .field {float: left;max-width: 680px;_width: 680px;}
#payment-ship .item .tip {padding: 0 5px 0 0;color: #999;background: none;border: none;position: static;z-index: inherit;box-shadow: 0;}



#delivery-time {padding-top:0px;}
#delivery-time .left {float: left;width: 110px;}
#delivery-time .middle {float: left;width: 550px;}
#delivery-time .label {width:110px; margin-right:5px; line-height:24px; text-align:right;float: left;}
#delivery-time .field {float: left;width:500px;}
#delivery-time .hookbox {margin:6px 5px 0 8px; *margin:1px 2px 0 5px;}
/* 商家名称 */
.sj-name{height: 40px; line-height: 40px; width: 1120px; margin: 0 auto; padding-left: 18px; font-size: 14px; font-weight: bold; }
.sj-ps{paddin-left: 18px; }
.sp-list{border: 1px solid #dddddd; padding-bottom: 10px;}
</style>

<div class="content m header clearfix">
	<div id="logo">
		<a href="${base}"><img src="${base}/static/mall/jd/img/logo_index.png" title="返回商城首页" alt="返回商城首页"></a>
	</div><!--logo end-->
	<div class="progress clearfix">
		<ul class="progress-2">
			<li class="step-1"><b></b>1.我的购物车</li>
			<li class="step-2">2.填写核对订单信息</li>
			<li class="step-3">3.成功提交订单</li>
		</ul>
	</div>
	<div class="clr"></div>
</div>
<div id="checkout" class="content">
	<div class="mt">
        <h2>填写并核对订单信息</h2>
    </div>
    <div id="wizard" class="checkout-steps">
    	<form id="orderCheckInfo">
    		<input type="hidden" id="order_receiverId" name="receiverId" value="${receiver.id}">
    		<input type="hidden" id="order_paymentMethodId" name="paymentMethodId" value="${paymentMethod.id}">
    		<input type="hidden" id="order_deliveryMethodId" name="deliveryMethodId" value="${deliveryMethod.id}">
    		<input type="hidden" id="order_cartItemIds" name="cartItemIds" value="<#list cartItemList as map><#list map.items as cartItem>${cartItem.id},</#list></#list>">
    	</form>
    	<div id="step-1" class="step step-complete <#if receiver==null>step-current</#if>">
			<div class="step-title">
				<div id="save-consignee-tip" class="step-right"></div>
				<strong id="consigneeTitleDiv">收货人信息</strong>
				<span class="step-action" id="consignee_edit_action">
					<a href="javascript:void(0);" id="editConsignee" onclick="edit_Consignee()" <#if receiver==null>class="hide"</#if>>[修改]</a>
					<a href="javascript:void(0);" id="saveConsigneeTitleMinDiv" <#if receiver!=null>class="hide"</#if> style="color:#005EA7;" onclick="save_Consignee()">保存收货人信息</a>
				</span>
			</div><!--step-title end-->
			<div class="step-content">
				<div id="consignee" class="sbox-wrap">
					<div class="sbox">
						<div class="s-content <#if receiver==null>hide</#if>" id="consignee-content">
							<p>
							${receiver.name} &nbsp; ${receiver.mobile} &nbsp;  &nbsp; 
							<br>
							${receiver.areaName} &nbsp;
							${receiver.address}
							</p>
						</div>
						
						<div class="form <#if receiver!=null>hide</#if>" id="consignee-edit-div">
							<div id="consignee-list" name="consignee-list" class="<#if receiver==null>hide</#if>">
								<input type="hidden" id="addressNum_top" value="${receiverList?size}">
								<#list receiverList as receiver>
								<div class="item <#if receiver_index==0>item-selected</#if>" index="consignee_index_${receiver_index}">
									<input type="radio" class="hookbox" <#if receiver_index==0>checked</#if> name="consignee_radio" id="consignee_radio_${receiver.id}" value="${receiver.id}" onclick="chose_Consignee('${receiver.id}')">
									<label for="consignee_radio_${receiver.id}" onclick="chose_Consignee('${receiver.id}')">
										<b>${receiver.name}</b>&nbsp; ${receiver.areaName}${receiver.address} &nbsp; ${receiver.mobile} &nbsp;
									</label>
									<span class="item-action hide" <#if receiver_index==0>style="display: inline;"</#if>>				
										<a href="javascript:void(0);" onclick="show_ConsigneeDetail('${receiver.id}')">编辑</a> &nbsp; 
										<a href="javascript:void(0);" onclick="delReceiver('${receiver.id}')">删除</a>&nbsp;
									</span>
								</div>
								</#list>							
							</div><!--consignee-list end-->
							<!--更多常用收货人--->
							
							<!---详细收货人信息表单--->
							<div class="item <#if receiver==null>item-selected</#if>" id="use-new-address">
								<a name="editConsignee"></a>
								<input type="radio" class="hookbox" name="consignee_radio" id="consignee_radio_new" <#if receiver==null>checked</#if> value="userNew" onclick="use_NewConsignee()" >
								<label for="consignee_radio_new">使用新地址 </label><span id="addNumLimitNote" class="status error" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 当前地址数量已达上限，若要继续添加新地址，请先删除部分收货地址。</span>
							</div><!--use-new-address end-->
							<form>
								<div class="consignee-form" id="consignee-form" name="consignee-form" style="padding-left: 12px;<#if receiver!=null>display: none;</#if>">
									<input type="hidden" id="consignee_form_id">
									<input type="hidden" id="isReceiverSubmit" value="false">
									<div class="list" id="name_div">
										<span class="label"><em>*</em>收货人：</span>
										<div class="field">
											<input type="text" class="textbox" id="consignee_name" name="consigneeParam.name" maxlength="20" onblur="check_Consignee('name_div')">
										</div>
										<span class="status error" id="name_div_error"></span>
									</div><!--name_div end-->
																		
									<div class="list select-address" id="area_div">
										<span class="label"><em>*</em>所在地区：</span>
										<div class="field">
											<span id="span_area">
												<input type="text" name="receiver.areaPath" class="areaSelect hidden" value=""/>
											</span>
											<span class="form-tip"><span class="status error" id="area_div_error"></span></span>
										</div>
									</div><!--area_div end-->
									<div class="list full-address" id="address_div">
										<span class="label"><em>*</em>详细地址：</span>
										<div class="field">
											<span class="fl selected-address" id="areaNameTxt"></span>
											<input type="text" class="textbox" id="consignee_address" name="consigneeParam.address" maxlength="50" onblur="check_Consignee('address_div')">
										</div>
										<span class="status error" id="address_div_error"></span>
									</div><!--address_div end-->
									<div class="list" id="call_div">
										<span class="label"><em>*</em>手机号码：</span>
										<div class="field">
											<div class="phone">
												<input type="text" class="textbox" id="consignee_mobile" name="consigneeParam.mobile" onblur="check_Consignee('call_mobile_div')" maxlength="11" onkeyup="check_Phone('call_mobile_div')">
												<em>或</em>
												<span>固定电话：</span>
												<input type="text" class="textbox" id="consignee_phone" name="consigneeParam.phone" onblur="check_Consignee('call_phone_div')" maxlength="20">
											</div>
											<span class="status error" id="call_div_error"></span>
										</div>
									</div><!--call_div end-->
									<div class="list" id="email_div">
										<span class="label"><em></em>邮箱：</span>
										<div class="field">
											<input type="text" class="textbox" id="consignee_email" name="consigneeParam.email" maxlength="50" onblur="check_Consignee('email_div')">
											<span class="form-tip">接收订单提醒邮件</span>
										</div>
										<span class="status error" id="email_div_error"></span>
									</div><!--email_div end-->
								</div><!--consignee-form end-->
							</form>
							
							<div class="form-btn group">
								<a href="javascript:void(0);" class="btn-submit" onclick="save_Consignee()"><span id="saveConsigneeTitleDiv">保存收货人信息</span></a>
							</div><!--form-btn end-->
							<div style="display:none"><input id="consignee_form_reset" name="" type="reset"></div>
						</div><!--consignee-form-->
												
					</div>
				</div><!--consignee end-->
			</div><!--step-content end-->
    	</div><!--step-1 end-->
    	
		<div id="step-2" class="step step-complete"><a name="payAndShipFocus"></a>
    		<div class="step-title">
				<div id="save-payAndShip-tip" class="step-right"></div>
				<strong>支付及配送方式</strong>
				<span class="step-action" id="payment-ship_edit_action">
					<a href="javascript:void(0);" id="editPayAndShip" onclick="edit_Payment(false)">[修改]</a>
					<a href="javascript:void(0);" id="savePayAndShipTitleMinDiv" class="hide" style="color:#005EA7;" onclick="save_PayAndShip()">保存支付及配送方式</a>
				</span>
			</div><!--step-title end-->
			<div class="step-content sbox-wrap">
				<div class="sbox">
					<div class="s-content payment-info" id="payAndShip-content">
						<div class="payment-selected">
							${paymentMethod.name}
						</div>
						<div class="way-list">
							<div class="way-item">
								 <label class="delivery-selected">${deliveryMethod.name}</label>&nbsp;&nbsp;<span id="promisetip"><font color="#FF6600;">预计&nbsp;7日内&nbsp;送达</font></span> &nbsp;
							</div>
						</div>
					</div><!--payAndShip-content end-->
					
					<div class="hide" id="payAndShip-edit-div">
						<div id="payment-ship" style="position: static;">
							<div class="payment">
								<h3>支付方式</h3>
								<div style="padding-bottom:10px"></div>
								<div class="mc form">
									<#list paymentMethodList as payment>
									<#if payment.enabled == 1>
										<div class="item <#if payment_index==0>item-selected</#if>" style="height: 28px;">
											<div class="label">
												<input type="radio" name="payment" <#if payment_index==0>checked</#if> onclick="chosePayment('${payment.id}')" payname="${payment.name}" payid="${payment.id}" id="pay-method-${payment.id}" class="hookbox" value="${payment.id}">
												<label id="pay-method-label-${payment.id}" for="pay-method-${payment.id}">${payment.name}</label>
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
							
							<div id="shipment" style="padding-top:10px;">
								<h3>配送方式</h3>
								<div style="padding-bottom:10px"></div>
								<#list deliveryMethodList as delivery>
								<div class="item <#if delivery_index==0>item-selected</#if>" style="height: 28px;">
									<div class="label">
										<input type="radio" name="delivery" <#if delivery_index==0>checked</#if> onclick="choseDelivery('${delivery.id}')" payname="${delivery.name}" payid="${delivery.id}" id="delivery-method-${delivery.id}" class="hookbox" value="${delivery.id}">
										<label id="delivery-method-label-${delivery.id}" for="delivery-method-${delivery.id}">${delivery.name}</label>
									</div>
									<div class="field">
										<span class="tip">${delivery.description}</span>
									</div>
									<span class="clr"></span>
								</div><!--item end-->
								</#list>
								<div id="delivery-time">
									<div class="left">
										<span class="label">送货时间：</span>
									</div>
									<div class="middle">
										<#list deliveryTimeList as deliveryTime>
										<div class="field">
											<input id="delivery-t3" name="delivery-t" <#if deliveryTime_index==0>checked</#if> class="hookbox" value="${deliveryTime.id}" type="radio">
											${deliveryTime.introduce}
										</div>
										</#list>
									</div>
								</div><!--delivery-time end-->
							</div><!--shipment end-->
							<span class="clr"></span>
							<div class="form-btn group">
								<a href="javascript:void(0);" class="btn-submit" onclick="save_PayAndShip()"><span>保存支付及配送方式</span></a>
							</div>
						</div><!--payment-ship end-->
					</div><!--payAndShip-edit-div end-->
								
				</div>
			</div><!--step-content end-->
		</div><!--step-2 end-->
		
		<div id="step-3" class="step step-complete hide"><a name="invoiceFocus"></a>
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
								普通发票（纸质） &nbsp; 郑州宝源科技有限公司 &nbsp; &nbsp; 图书 <br>
								<div class="ftx-04 invoice-prompt">
									<dl class="clearfix">
									   <dt>温馨提示：</dt>
									   <dd><div>发票的开票金额不包括优惠券和满减部分</div></dd>
									</dl>
								</div>
								<div class="invoice-note" style="display:none">
									备注：如商品由第三方卖家销售，发票内容由其卖家决定，发票由卖家开具并寄出
								</div>
							</div>
						</div>
						
						<div class="form hide" id="invoice-edit-div">
							发票信息
						</div><!--payAndShip-edit-div end-->
					
					</div>
				</div><!--part-invoice end-->
			</div><!--step-content end-->
		</div><!--step-3 end-->
    	
    	<div id="step-4" class="step step-complete">
    		<div class="step-title">
    			<a href="${base}/cart/list" id="cartRetureUrl" class="return-edit">返回修改购物车</a><strong>商品清单</strong>
    		</div><!--step-title end-->
    		<div class="step-content">
    			<div id="part-order" class="sbox-wrap">
    				<div class="sbox">
    					<div id="order-cart">
    						<div class="order-review"><!--商品清单展示-->
                                <form id="orderGoodsForm">
    							<span id="span-skulist">
    								<table class="review-thead">
										<tbody>
											<tr>
												<td class="fore1">商品</td>
												<td class="fore2">商城价</td>
												<td class="fore3">优惠</td>
												<td class="fore4">数量</td>
												<td class="fore4">库存状态</td>
											</tr>
										</tbody>
									</table>
									<div class="review-body" >
										<div class="review-block review-present">
											<div class="block-header">
												<!--满赠信息-->
											</div>
										</div>

										<#assign total = 0>
                                        <#assign totalPrice = 0>
                                        <#assign deliveryFee = 0>
										<#list cartItemList as map>
										<#-- 添加商家名称 TianYu 2015-8-19  -->
										<div class="sj-name">
											<label for="shopcheck"><a href="${base}/shop/${map.shopUrl}.html">${map.shopName}</a></label><br>
										</div>
										<#-- 遍历商品 TianYu 2015-8-19  -->
										<div class="sp-list">
										 <#assign totalPrice = totalPrice+(map.goodsTotal?number)>
										 <#assign deliveryFee = deliveryFee+(map.deliveryFeeTotal?number)>
											<#list map.items as cartItem>
                                        <#--<#list cartItemList as cartItem>-->
                                       <#-- <#assign totalPrice = totalPrice+(cartItem.price?number)*cartItem.quantity>-->
                                        <#assign total = total+cartItem.quantity>
                                        <!--购物车单品商品-->
										<div class="review-tbody">
											<table class="order-table">
												<tbody>
													<tr >
														<td class="fore1" style=" padding-bottom: 10px;">
															<div class="p-goods">
																<div class="p-img">
																	<a href="${base}/item/${cartItem.goodsId}.html" target="_blank"><img height="50" width="50" alt="" src="${cartItem.pic}"></a>
																</div>
																<div class="p-detail">
																	<div class="p-name">
																		<a href="${base}/item/${cartItem.goodsId}.html" target="_blank">${cartItem.name}</a>
																	</div>
																	<div class="p-more">
																		商品编号：${cartItem.sn}<br>
																	</div>
																</div>
															</div>
														</td>
														<td class="p-sp">${cartItem.specification}</td>
														<td class="p-price"><strong>￥${cartItem.price}</strong></td>
														<td class="p-promotion">0.00</td>
														<td class="fore2">x ${cartItem.quantity}</td>
														<td class="fore2 p-inventory" skuid="${cartItem.goodsId}">有货</td>
													</tr>
													<tr>
														<td class="sj-ps" colspan="6" style="vertical-align: top; border-top: 1px dashed #dddddd; background: #f3f3f3; padding-bottom: 10px;"><font style=" margin-left: 10px;vertical-align:20px; ">给卖家留言：</font><textarea id="ps_${cartItem.goodsId}" name="ps_${cartItem.goodsId}" style="width: 1000px;height: 30px;resize: none;margin-top: 10px; color: #CCCCCC;" maxlength="100" placeholder="选填：对本次交易的说明（建议填写已经和卖家达成一致的说明）"></textarea></td>
													</tr>
												</tbody>
											</table>
										</div>
										</#list>
                                        </div>
										<#-- 运费按店铺收取 TianYu 2015-8-19  -->
                                            <div style="text-align: right;">
                                                <table class="order-table">
                                                    <tbody>
                                                    <tr>
                                                        <td class="fore1">
                                                            商品合计:&nbsp;&nbsp;&nbsp;￥${map.goodsTotal?string('##0.00')}
                                                        </td>
                                                        <td style="text-align: right;">运费：</td>
                                                        <td class="p-promotion">￥${map.deliveryFeeTotal?string('##0.00')}</td>
                                                        <td  style="text-align: right;">店铺合计:</td>
                                                        <td class="fore2 p-inventory"  >￥${map.shopTotal?string('##0.00')}</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div>
										</#list>
									</div>
    							</span>
                                    </form>
    							<div class="order-summary">
									<div class="statistic fr">
										<div class="list">
											<span><em id="span-skuNum">${total}</em> 件商品，总商品金额：</span><em class="price" id="warePriceId" v="${totalPrice?string('##0.00')}">￥${totalPrice?string('##0.00')}</em>
										</div>
										<div class="list" style="display:none;">
											<span>返现：</span><em class="price" id="cachBackId" v="0.00"> -￥0.00</em>
										</div>
										<div class="list" id="showFreightPrice" style="padding-left:140px;">
											<span id="freightSpan" style="width:40px;">运费：</span> 
											<em class="price" id="freightPriceId"> ￥${deliveryFee?string('##0.00')}</em>
										</div>
										<div class="list" id="showCouponPrice" style="display:none;">
											<span>优惠券：</span><em class="price" id="couponPriceId">-￥0.00</em>
										</div>
										<div class="list">
											<span>应付总额：</span><em id="sumPayPriceId" class="price"> ￥${(totalPrice + deliveryFee)?string('##0.00')}</em>
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
							<span class="total">应付总额：<strong id="payPriceId">￥${(totalPrice + deliveryFee)?string('##0.00')}</strong>元 </span>
						</div>
					</div>
    			</div>
    		</div>
    	</div>
    </div>
	<div class="clr"></div>
</div>
<#include "mall/jd/service.ftl"/>
<#include "mall/jd/footer.ftl"/>
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
<script src="${base}/static/mall/js/order.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
/*宽屏设置*/
//pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");

$(function () {
	<#if receiver==null>
		$(".areaSelect").val("");
		$(".areaSelect").lSelect({
			url: "${base}/area/ajaxChildren"// Json数据获取url
		});
	</#if>
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
 * 保存支付与配送方式
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
	
}

/**
 * 选择支付方式
 */
function chosePayment(id) {
    $("#order_paymentMethodId").val(id);
    if (obj != null) {
        var e = $(obj);
        e.parent().parent().addClass('item-selected');
        e.parent().parent().siblings().removeClass('item-selected');
    }
}

/**
 * 选择配送方式
 */
function choseDelivery(id) {
	$("#order_deliveryMethodId").val(id);
	var payArr = $("[id^='delivery-method-']");
	for(var i = 0 ;i < payArr.length ;i++){
		$(payArr[i]).parent().parent().removeClass("item-selected");
		if(id==$(payArr[i]).val()){
			$(payArr[i]).parent().parent().addClass("item-selected");
		}
	}


    // 动态计算配送费用
    $.ajax({
        type: "post",
        url: "${base}/member/countDeliveryFee",
        data:$("#orderCheckInfo").formSerialize(),
        dataType: "json",
        success: function (data) {
            $("#freightPriceId").text("￥" + data.toFixed(2));
            var deliveryFee = data.toFixed(2);
            var goodsTotalFee = $("#warePriceId").attr("v");
            var total = parseFloat(deliveryFee) + parseFloat(goodsTotalFee);
            $("#sumPayPriceId").text("￥" + total.toFixed(2));
            $("#payPriceId").text("￥" + total.toFixed(2));
        }
    });
}
 

/**
 * 编辑发票信息
 */
function edit_Invoice() {
	alert("编辑发票信息");
	
	$("#step-3").addClass("step-current");
	$("#editInvoice").hide();
	$("#saveInvoiceTitleMinDiv").show();
	$("#invoice-content").hide();
	$("#invoice-edit-div").show();
	
}

/**
 * 保存发票内容
 */
function save_Invoice() {
	alert("保存发票内容");
	
	$("#step-3").removeClass("step-current");
	$("#editInvoice").show();
	$("#saveInvoiceTitleMinDiv").hide();
	$("#invoice-content").show();
	$("#invoice-edit-div").hide();
	
}
/**
 * 提交订单
 */
function submit_Order(){

 	var receiverId=$("#order_receiverId").val();
	if(receiverId.length==0){
 		alert("请选择收货人!");
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
                alert(data.message);
            }
        },
        error : function(error) {
            alert("亲爱的用户请不要频繁点击, 请稍后重试...");
            //$("#order-loading").replaceWith(originSubmit);
            //$("#submit_message").html("亲爱的用户请不要频繁点击, 请稍后重试...");
            //$("#submit_message").show();
        }

    });
}
</script>
</body>
</html>