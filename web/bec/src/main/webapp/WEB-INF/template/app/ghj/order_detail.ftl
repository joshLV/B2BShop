<!DOCTYPE html>
<HTML>
<HEAD>
	<TITLE> ZTREE DEMO - multiTree</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="../../../css/demo.css" type="text/css">
	<link rel="stylesheet" href="../../../css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="../../../js/jquery-1.4.4.min.js"></script>
	<script type="text/javascript" src="../../../js/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="../../../js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="../../../js/jquery.ztree.exedit-3.5.js"></script>
	<SCRIPT type="text/javascript">
		<!--
		var setting = {
			edit: {
				enable: true,
				showRemoveBtn: false,
				showRenameBtn: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeDrag: beforeDrag,
				beforeDrop: beforeDrop
			}
		};

		var zNodes =[
			{ id:1, pId:0, name:"父节点 1", open:true},
			{ id:11, pId:1, name:"叶子节点 1-1"},
			{ id:12, pId:1, name:"叶子节点 1-2"},
			{ id:13, pId:1, name:"叶子节点 1-3"},
			{ id:2, pId:0, name:"父节点 2", open:true},
			{ id:21, pId:2, name:"叶子节点 2-1"},
			{ id:22, pId:2, name:"叶子节点 2-2"},
			{ id:23, pId:2, name:"叶子节点 2-3"},
			{ id:3, pId:0, name:"父节点 3", open:true},
			{ id:31, pId:3, name:"叶子节点 3-1"},
			{ id:32, pId:3, name:"叶子节点 3-2"},
			{ id:33, pId:3, name:"叶子节点 3-3"}
		];

		function beforeDrag(treeId, treeNodes) {
			for (var i=0,l=treeNodes.length; i<l; i++) {
				if (treeNodes[i].drag === false) {
					return false;
				}
			}
			return true;
		}
		function beforeDrop(treeId, treeNodes, targetNode, moveType) {
			return targetNode ? targetNode.drop !== false : true;
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$.fn.zTree.init($("#treeDemo2"), setting);
			
		});
		//-->
	</SCRIPT>
</HEAD>

<BODY>
<h1>多棵树之间 的 数据交互</h1>
<h6>[ 文件路径: exedit/multiTree.html ]</h6>
<div class="content_wrap">
	<div>
		<ul class="info">
			<li class="title"><h2>1、setting 配置信息说明</h2>
				<ul class="list">
				<li>zTree 对于多棵树之间拖拽的操作非常简单，只需要创建两棵可拖拽的树即可，同时可根据 各种事件回调函数 以及 zTree 的方法配合实现较复杂的操作规则，这里只是基本演示。</li>
				<li class="highlight_red">关于配置信息请参考拖拽、编辑等 Demo 的详细说明</li>
				</ul>
			</li>
			<li class="title"><h2>2、treeNode 节点数据说明</h2>
				<ul class="list">
				<li>对 节点数据 没有特殊要求，用户可以根据自己的需求添加自定义属性</li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div class="right">
		<ul id="treeDemo2" class="ztree"></ul>
	</div>
</div>
</BODY>
</HTML>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Test for jQuery validate() plugin</title>

<link rel="stylesheet" type="text/css" media="screen" href="css/screen.css" />
<script src="../lib/jquery.js" type="text/javascript"></script>
<script src="firebug/firebug.js" type="text/javascript"></script>

<script type="text/javascript">
$().ready(function() {
	var handler = {
		focusin: function() {
			$(this).addClass("focus");
		},
		focusout: function() {
			$(this).removeClass("focus");
		}
	}
	$("#commentForm").delegate("focusin focusout", ":text, textarea", function(event) {
		/*
		this.addClass("focus").one("blur", function() {
			$(this).removeClass("focus");
		});
		*/
		handler[event.type].call(this, arguments);
	});
	$("#remove").click(function() {
		$("#commentForm").unbind("focusin");
	})
});
</script>

<style type="text/css">
#commentForm { width: 500px; }
#commentForm label { width: 250px; display: block; float: left; }
#commentForm label.error, #commentForm input.submit { margin-left: 253px; }
.focus { background-color: red; }
</style>

</head>
<body>
<form class="cmxform" id="commentForm" method="get" action="">
	<fieldset>
		<legend>A simple comment form with submit validation and default messages</legend>
		<p>
			<label for="cname">Name (required, at least 2 characters)</label>
			<input id="cname" name="name" class="some other styles {required:true,minLength:2}" />
		<p>
			<label for="cemail">E-Mail (required)</label>
			<input id="cemail" name="email" class="{required:true,email:true}" />
		</p>
		<p>
			<label for="curl">URL (optional)</label>
			<input id="curl" name="url" class="{url:true}" value="" />
		</p>
		<p>
			<label for="ccomment">Your comment (required)</label>
			<textarea id="ccomment" name="comment" class="{required:true}"></textarea>
		</p>
		<p>
			<input class="submit" type="submit" value="Submit"/>
		</p>
	</fieldset>
</form>

<button id="remove">Remove focus handler</button>

</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 </p>
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
                <#if '${order.orderStatus}' == 'wait_buyer_pay_deposit' >
                    我们还未收到该订单的定金，请您尽快支付定金！
                <#elseif '${order.orderStatus}' == 'wait_buyer_pay'  >
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
                                            <p class="price" style="font-size: 12px!important;font-weight: 100;height: 18px;">商品金额:${goods.price?string(priceCurrencyFormat)}</p>
                                            <p class="price" style="font-size: 12px!important;;font-weight: 100;height: 18px;">优惠金额:<#if goods.discount==''>${0?string(priceCurrencyFormat)}<#else>${goods.discount?string(priceCurrencyFormat)}</#if></p>
                                            <p class="order-data" style="font-size: 12px!important;;font-weight: 100;height: 18px;"><#list orderItemList as orderItem><#if orderItem.goodsId == goods.id>共${orderItem.quantity}<#if goods.unit??>${goods.unit}<#else>件</#if></#if></#list></p>
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
                            <div class="val" style="text-align: left">${order.shipAreaName}&nbsp;${order.shipAddress}</div>
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
                                <div class="val">${gis} <a class="mui-control-item red" href="javascript:void(0);" <#--id="getExpressLog" -->gis="${gis}" id="getWLXX"  orderId="${order.id}"   style="padding:5px 12px;  background: #E4393C;-webkit-border-radius: 3px; color: #fff;-moz-border-radius: 3px;border-radius: 3px;">获取物流详情</a></div>
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

<#include "app/ghj/tools.ftl">
<script>

    function showExpressLog4DB(orderSn){
        $.ajax({
            url:"${base}/order/getWLXX4DB_ghj_logistics_info/"+orderSn,
            type:'post',
            success:function(data){
                if( data.status == 'success' ){
                    var html = '';
                    $.each(data.logisticslist,function(k,obj){
                        html +='<li style="line-height:20px;" class="black">'+dateFormat(obj.logisticsTime)+'&nbsp;&nbsp;&nbsp;&nbsp;'+obj.logisticsContent+'</li>';
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
                    popAlert(data.message)
                }
            }
        });
    }



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

        $("#getWLXX").bind("tap",function(e){
            showExpressLog4DB('${order.orderSn}')
        });

        leftPad = function (tbl) {
            return function (num, n) {
                return (0 >= (n = n - num.toString().length)) ? num : (tbl[n] || (tbl[n] = Array(n + 1).join(0))) + num;
            }
        }([]);
        dateFormat = function (now, type) {
            var date = new Date(now)
            var year = date.getFullYear();
            var month = date.getMonth() + 1;
            var day = date.getDate();
            var hour = date.getHours();
            var minute = date.getMinutes();
            var second = date.getSeconds();
            if(type == 1 ){
                return year + "年"
                        + leftPad(month, 2) + "月"
                        + leftPad(day, 2) + "日";
            }else if( type == 2){
                return leftPad(hour, 2) + ":"
                        + leftPad(minute, 2);
            }else{
                return year + "-"
                        + leftPad(month, 2) + "-"
                        + leftPad(day, 2) + " "
                        + leftPad(hour, 2) + ":"
                        + leftPad(minute, 2) + ":"
                        + leftPad(second, 2);
            }

        };

    }(mui, document));

    //付订单款
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

    function payDJ(orderSn, totalAmount, orderId, orderType) {
        if(orderType == 0){
            jumpto(fullpath + "/payment?orderSn=" + orderSn
                    + "&total=" + totalAmount
                    + "&key=" + orderId
                    + "&whichclient=whichapp");
        }else if(orderType == 1){
            jumpto(fullpath + "/payment?payAmountType=deposit&orderSn=" + orderSn
                    + "&total=" + totalAmount
                    + "&key=" + orderId
                    + "&whichclient=whichapp");
        }

    }
    //普通订单上传支付凭证
 function offlinePay(){
    location.href="${base}/payment/merge/offlinePay?orderSns=${order.orderSn}&whichclient=whichapp";
 }
    //众筹订单上传定金支付凭证
 function offlinePayDJ(){
    location.href="${base}/payment/merge/offlinePay?voucherType=deposit&orderSns=${order.orderSn}&whichclient=whichapp";
 }
    //众筹订单上传订单支付凭证
    function offlinePayDD(orderSn,orderId){
        showWaiting();
        jQuery.ajax({
            type: "POST",
            url: "${base}/zcorder/checkZCGoodsStatus/?orderId="+orderId,
            datatype: 'json',
            success: function(data) {
                if(data.status=="error"){
                    popAlert(data.message);
                    closeWaiting();
                }else if(data.status=="success"){
                    if(data.data == 3&&data.message=="after"){
                        closeWaiting();
                        jumpto('${base}/payment/merge/offlinePay?voucherType=order&orderSns='+orderSn+'&whichclient=whichapp')
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
</script>
</body>
</html>