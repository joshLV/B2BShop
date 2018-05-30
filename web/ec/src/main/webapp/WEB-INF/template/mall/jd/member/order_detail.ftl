<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单详情</title>
<meta name="description" content="订单详情">
<meta name="Keywords" content="订单详情">
<link href="${base}/static/mall/jd/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
</head>
<body>
<#include "mall/jd/shortcut.ftl"/>
<#include "mall/jd/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 0 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 150px;margin-right: 10px;}
.right {float: right;width: 830px;}
    #expressLog{margin-left: 20px;}
    .green{color: #00aa00;}
    .black{color: #000000;}
    .red{color: #ff0000;}
    .blue{color: #0000cc;}
</style>
<style>
    /**状态、提示**/
    #orderstate{border:1px solid #EED97C;padding:0 5px;background:#FFFCEB;}#orderstate{color:#333;}#orderstate .mt{padding:4px 8px;height:25px;line-height:25px;border-bottom:1px dotted #EED97C;}#orderstate .mt strong{float:left;font-size:14px;}.mt{cursor:default}.m{margin-bottom:10px;overflow:hidden;zoom:1;}.ftx14,.flk14 a:link,.flk14 a:visited,a.flk14:link,a.flk14:visited{color:#12A000}.fr{float:right}#orderstate .btn{width:46px;height:25px;margin:0 4px;background:url(${base}/static/img/btn0330.jpg) no-repeat 0 0;color:#fff;}.btn-img{cursor:pointer;margin:0;padding:0;border:0;text-align:center;}#orderstate .mc{padding:10px 8px;}.toolbar .btn-40 {display: inline-block;padding: 0 13px 0 13px;background-color: #FFBA01;background: url(${base}/static/img/btn_bg.png) no-repeat;background-position: -20px;color: white;border-radius: 3px;}
    /**进度条**/
    #process{margin:0 auto;padding:25px 0 80px;}.section2{width:403px;}.section3{width:533px;}.section4{width:706px;}.section5{width:880px;}#process .node,#process .proce{float:left;position:relative;height:13px;background-image:url(${base}/static/img/bg_process_state.jpg);background-repeat:no-repeat;}#process .node{width:13px;}#process .proce{width:150px;border:solid #fff;border-width:0 5px;}#process .tx1{height:36px;margin-bottom:16px;}#process .tx3{color:#999;line-height:15px;}.node.wait{background-position:-150px -40px;}.node.ready{background-position:-150px 0px;}.node.singular{background-position:-150px -60px;}.proce.wait{background-position:0 -40px;}.proce.doing{background-position:0 -20px;color:#360;}.proce.ready{background-position:0 0;}#process .wait .tx2{color:#999;}#process ul{position:absolute;margin-top:-38px;text-align:center;}#process .proce ul{z-index:5;width:150px;}#process .node ul{z-index:1;width:318px;margin-left:-152px;}*html #process{overflow:hidden;}*html #process .node{background-position-x:-150px;}*html #process .proce{background-position-x:0;}*html #process .wait{background-position-y:-40px;}*html #process .doing{background-position-y:-20px;}*html #process .ready{background-position-y:0;}*html #process .singular{background-position-y:-60px;}
    /**跟踪、付款信息**/
    #ordertrack{border:1px solid #EED97C;padding:0 5px;position:relative}#ordertrack td{vertical-align:top}#ordertrack .i-ordertrack s,.post01 .fore .fr s{float:left;width:9px;height:16px;font-size:0;line-height:0;margin-right:5px;background:url(i/od-icon.png)}.post01 .fore .fr s{margin-top:4px}#ordertrack .i-ordertrack a{color:#005AA0}#ordertrack .tab{height:30px;line-height:30px;border-bottom:1px solid #EED97C;background:#FFFCEB;overflow:visible;}#ordertrack .tab li{border-right:1px solid #EED97C;cursor:pointer}#ordertrack .tab li h2{float:left;height:30px;padding:0 8px;color:#999;}#ordertrack .tab .curr h2{position:relative;height:31px;background:#fff;color:#333;}#ordertrack .mc{padding:5px 8px;}#ordertrack .mc .extra{margin-top:10px;}#ordertrack th strong{display:block;padding-bottom:3px;margin-bottom:5px;border-bottom:1px solid #DBDBDB;text-align:left;}*html #ordertrack .tab{overflow:hidden;}
    /**订单信息**/
    #orderinfo{border:1px solid #DADADA;padding:0 5px 10px;background:#EDEDED;overflow:visible;}#orderinfo .mt{padding:0 8px;height:30px;line-height:30px;font-size:14px;}#orderinfo .mc{padding:5px 8px;background:#fff;overflow:visible;}#orderinfo .mc dl{padding:10px 5px;border-top:1px solid #EDEDED;}#orderinfo .mc dl.fore{border-top:0;}#orderinfo .mc dt{margin-bottom:4px;font-weight:bold;}#orderinfo .p-list{overflow:hidden;margin-right:-1px;border-left:1px solid #DEDEDE;}#orderinfo .p-list table{border-collapse:collapse;margin-left:-1px;border:solid #DEDEDE;border-width:0 1px;}#orderinfo .p-list th{padding:5px;background:#F0F0F0;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;font-weight:normal;}#orderinfo .p-list td{padding:5px;background:#fff;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;text-align:center;}#barcode{position:relative;height:20px;padding:0 5px;}#barcode ul{position:absolute;left:5px;padding:6px 10px;border:1px solid #ccc;background:#fff;z-index:1}#orderinfo .total{padding:15px 10px 0;overflow:hidden;zoom:1;font-family:arial;}#orderinfo .total ul{float:right;padding:0 20px 10px 0;overflow:hidden;font-size:14px;}#orderinfo .total li{overflow:hidden;line-height:20px;}#orderinfo .total li span{float:left;width:150px;text-align:right;}#orderinfo .total .extra{float:right;padding:10px 20px 0 0;border-top:1px solid #ccc;font-size:16px;font-weight:bold;}#orderinfo .total .extra b{font-size:24px;}a.flk13:link,a.flk13:visited{color:#005AA0;}.img-list .img-box:hover{border-color:#EDD28B;}.img-list .img-box{border:1px solid #e1e1e1;display:block;margin:0 auto;width:50px;height:50px;}.ftx04{color:#F00}
</style>
<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/order/list">订单中心</a></strong><span>&nbsp;&gt;&nbsp;订单：${order.orderSn}<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
    <#--状态、提示-->
    <div class="m" id="orderstate">
        <div class="mt">
            <strong class=" ">订单号：${order.orderSn}&nbsp;&nbsp;&nbsp;&nbsp;状态：<span class="ftx14">${orderStatusMapping['${order.orderStatus}']}</span>&nbsp;&nbsp;</strong>
            <#--判断显示什么样的按钮-->
            <#if order.orderStatus == "wait_buyer_pay">
            <span id="pay-button-${order.orderSn}">
                <a href="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}" target="_blank">
                    <img width="46" height="25" style="display:inline;" src="${base}/static/img/btn_pay.gif">
                </a>
            </span>
            <div class="fr">
                <div class="toolbar">
                    <#--<input type="button" class="btn-img btn" id="btn_Cancel"
                           onclick="cancleOrder('${order.id}')" value="取消">-->
                        <a href="${base}/order/popupcancel/${order.id}" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请"  class="btn-img btn" id="btn_Cancel">取消</a>
                </div>
            </div>
            </#if>
            <#--<#if order.orderStatus == "cancel">-->
            <#--<div class="fr">-->
                <#--<div class="toolbar">-->
                    <#--<a href="${base}/cart/add?gid=${goods.id}" class="btn-40"><s></s>放入购物车</a>-->
                <#--</div>-->
            <#--</div>-->
            <#--</#if>-->
        </div>

        <div class="mc" style="display:show">
            尊敬的客户，
        <#if order.orderStatus == 'wait_seller_send_goods' && order.paymentMethodName == '货到付款'>
            你购买的商品即将发出，请你准备好货款。
        <#elseif order.paymentStatus == 'unpaid' && order.orderStatus != 'deleted' && order.orderStatus != 'cancel'>
            我们还未收到该订单的款项，请您尽快付款，如果您已经付款，请务必填写付款确认。<br>该订单会为您保留24小时（从下单之日算起），24小时之后如果还未付款，系统将自动取消该订单。
        <#elseif order.paymentStatus == 'paid' && order.orderStatus != 'deleted'>
            你已支付成功，我们会尽快发货，请注意查收。
        <#elseif order.paymentStatus == 'paid' && order.orderStatus == 'trade_finished' && order.orderStatus != 'deleted'>
            你已交易完成。
        <#elseif order.orderStatus == 'cancel' && order.paymentStatus == 'unpaid'>
            订单已取消！
        <#elseif order.orderStatus == 'deleted'>
            你已经删除了你的订单！
        </#if>
        <#if invalidReason??>
            <div style="border-top:1px dotted #EED97C; margin-top:5px;">
                <div style="padding-top: 5px;">
                    <span style="font-weight: bold;">
            <#if order.orderStatus == 'cancel'>取消<#elseif order.orderStatus == 'invalid'>作废</#if>原因:&nbsp;&nbsp;
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
    <#if order.orderStatus != 'cancel' && order.orderStatus != 'deleted'>
    <div id="process" class="section4">
        <div class="node fore wait unconfirm wait_buyer_pay"><ul><li class="tx1">&nbsp;</li><li class="tx2">提交订单</li><li class="tx3">&nbsp;</li></ul></div>
        <div class="proce wait wait_buyer_pay" id="wait_buyer_pay_process"><ul><li class="tx1">&nbsp;</li></ul></div>
        <div class="node wait wait_buyer_pay"><ul><li class="tx1">&nbsp;</li><li class="tx2">等待付款</li><li class="tx3">&nbsp;</li></ul></div>
        <div class="proce wait wait_seller_send_goods"><ul><li class="tx1">&nbsp;</li></ul></div>
        <div class="node wait wait_buyer_confirm_goods" ><ul><li class="tx1">&nbsp;</li><li class="tx2">商品出库</li><li class="tx3">&nbsp;</li></ul></div>
        <div class="proce wait wait_buyer_confirm_goods"><ul><li class="tx1">&nbsp;</li></ul></div>
        <div class="node wait trade_finished"><ul><li class="tx1">&nbsp;</li><li class="tx2">等待收货</li><li class="tx3">&nbsp;</li></ul></div>
        <div class="proce wait trade_finished"><ul><li class="tx1">&nbsp;</li></ul></div>
        <div class="node wait trade_finished"><ul><li class="tx1">&nbsp;</li><li class="tx2">完成</li><li class="tx3">&nbsp;</li></ul></div>
    </div>
    </#if>
    <#--跟踪、付款信息-->
    <div class="m" id="ordertrack">
        <ul class="tab">
            <li class="" style="display:none;">
                <h2> 订单跟踪</h2>
            </li>
            <li class="curr">
                <h2> 付款信息</h2>
            </li>
            <li id="orderlocustab" style="display:none;">
                <h2> 订单轨迹</h2>
            </li>
        </ul>
        <div class="clr"></div>
        <#--付款信息-->
        <div class="mc tabcon hide" style="display: block;">
            <table cellpadding="0" cellspacing="0" width="100%">
                <tbody><tr>
                    <td width="30%" id="daiFuName"> 付款方式：${order.paymentMethodName}</td>
                    <td width="70%" id="daiFuPeople">
                    </td>
                </tr>
                <tr>
                    <td> 商品金额：￥${order.goodsTotalPrice}</td>
                    <td> 运费金额：￥${order.deliveryFee}</td>
                </tr>
                <tr>
                    <td> 优惠金额：￥0.00</td>
                    <td> 实际运费：￥${order.deliveryFee}</td>
                </tr>
                <tr>
                    <td colspan="2"> 应支付金额：￥${order.goodsTotalPrice}</td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                </tbody></table>
        </div>
    </div>
    <#--订单信息-->
    <div class="m" id="orderinfo">
        <div class="mt">
            <strong>订单信息</strong></div>
        <div class="mc">
            <#--顾客信息-->
            <dl class="fore">
                <dt>收货人信息</dt>
                <dd>
                    <ul>
                        <li>收&nbsp;货&nbsp;人：${order.shipName}</li>
                        <li>地&nbsp;&nbsp;&nbsp;&nbsp;址：${order.shipAddress}</li>
                        <li>手机号码：${order.shipMobile}</li>
                        <li>收货电话：${order.shipPhone}</li>
                    </ul>
                </dd>
            </dl>
            <#--配送、支付方式-->
            <dl>
                <dt>支付及配送方式</dt>
                <dd>
                    <ul>
                        <li>支付方式：${order.paymentMethodName}</li>
                        <li>运&nbsp;&nbsp;&nbsp;&nbsp;费：￥${order.deliveryFee}</li>
                        <li>配送方式：${order.deliveryMethodName}</li>



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
            <#--发票-->
            <dl>
                <dt>发票信息</dt>
                <dd>
                    <ul>
                        <li>发票类型：不开发票</li>
                    </ul>
                </dd>
            </dl>
            <#--商品-->
            <dl>
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
                        <tbody><tr>
                            <th width="10%"> 商品编号 </th>
                            <th width="12%"> 商品图片 </th>
                            <th width="42%"> 商品名称 </th>
                            <th width="10%"> 商城价 </th>
                            <th width="7%"> 商品数量 </th>
                        </tr>
                    <#list goodsList as goods>
                        <tr>
                            <td>${goods.sn}</td>
                            <td>
                                <div class="img-list">
                                    <a class="img-box" target="_blank" href="${base}/item/${goods.id}.html">
                                        <img width="50" height="50" src="${goods.pic}" title="${goods.fullName}">
                                    </a>
                                </div>
                            </td>
                            <td>
                                <div class="al fl">
                                    <a class="flk13" target="_blank" href="${base}/item/${goods.id}.html"> ${goods.fullName}</a>
                                </div>
                                <div class="clr"></div>
                                <div id="coupon_${goods.sn}" class="fl"></div>
                            </td>
                            <td><span class="ftx04"> ￥${goods.price}</span></td>
                            <td>
                                <#list orderItemList as orderItem>
                                    <#if orderItem.goodsId == goods.id>
                                        ${orderItem.quantity}
                                    </#if>
                                </#list>
                            </td>
                        </tr>
                    </#list>
                        </tbody></table>
                </dd>
            </dl>
        </div>
        <#--金额-->
        <div class="total">
            <ul>
                <li><span>总商品金额：</span>￥${order.goodsTotalPrice}</li>
                <li><span>+ 运费：</span>￥${order.deliveryFee}</li>
            </ul>
            <span class="clr">ad</span> <span style="color:#EDEDED;"></span>
            <div class="extra">
                应付总额：<span class="ftx04"><b>￥${(order.goodsTotalPrice + order.deliveryFee)?string('0.00')}</b></span>
            </div>
        </div>

    </div>
</div>
<#include "mall/jd/service.ftl"/>
<#include "mall/jd/footer.ftl"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
</body>
</html>
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
        $("#expressLog").html("");
        $.ajax({
            url:"${base}/order/getExpressLog/"+orderId,
            type:'post',
            success:function(data){
                obj.style.display="none";
                var expressLog = JSON.parse(data);
                if(expressLog.error_code=='0'){
                    var html="";
                    if(expressLog.data!=""){
                        html +="<li>数据更新时间："+expressLog.data.updatetime+"</li>";
                        for(var key in expressLog.data.result){
                            color="black";
                            if (key=="0"){
                                color="green";
                            }
                            html +="<li class=\""+color+"\">"+expressLog.data.result[key].ftime+"&nbsp;&nbsp;&nbsp;&nbsp;"+expressLog.data.result[key].context+"</li>"
                        }
                    }
                    $("#expressLog").html(html);
                }else{
                    var html="<li class=\"red\">"+expressLog.message+"</li>";
                    $("#expressLog").html(html);
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
</script>