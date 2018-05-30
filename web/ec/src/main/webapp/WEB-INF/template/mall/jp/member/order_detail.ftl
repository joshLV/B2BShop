<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>订单详情</title>
<meta name="description" content="订单详情">
<meta name="Keywords" content="订单详情">
<link href="${base}/static/mall/jp/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/jp/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
</head>
<body>
<#include "mall/jp/shortcut.ftl"/>
<#include "mall/jp/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 10px 0 10px 0;/*margin-bottom: 10px;*/overflow: hidden;line-height: 20px;vertical-align: baseline; border-bottom: 1px solid #E8E8E8; margin-left: 10px; margin-right: 10px;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

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
    #orderstate{/*border:1px solid #EED97C;*/padding:0 5px;/*background:#FFFCEB;*/}#orderstate{color:#333;}
    #orderstate .mt{padding:4px 8px;height:25px;line-height:25px;/*border-bottom:1px dotted #EED97C;*/}#orderstate .mt strong{float:left;font-size:14px;}.mt{cursor:default}.m{margin-bottom:10px;overflow:hidden;zoom:1;}.ftx14,.flk14 a:link,.flk14 a:visited,a.flk14:link,a.flk14:visited{color:#12A000}.fr{float:right}
    #orderstate .btn{width:46px;height:25px;margin:0 4px;background:#ee701c;color:#fff; border-radius: 3px;}
    .btn-img{cursor:pointer;margin:0;padding:0;border:0;text-align:center;}#orderstate .mc{padding:10px 8px; line-height: 24px;}.toolbar .btn-40 {display: inline-block;padding: 0 13px 0 13px;background-color: #FFBA01;background: url(${base}/static/img/btn_bg.png) no-repeat;background-position: -20px;color: white;border-radius: 3px;}
    /**进度条**/
    #process{margin:0 auto;padding:25px 0 80px;}.section2{width:403px;}.section3{width:533px;}.section4{width:706px;}.section5{width:880px;}#process .node,#process .proce{float:left;position:relative;height:13px;background-image:url(${base}/static/img/bg_process_state.jpg);background-repeat:no-repeat;}#process .node{width:13px;}#process .proce{width:150px;border:solid #fff;border-width:0 5px;}#process .tx1{height:36px;margin-bottom:16px;}#process .tx3{color:#999;line-height:15px;}.node.wait{background-position:-150px -40px;}.node.ready{background-position:-150px 0px;}.node.singular{background-position:-150px -60px;}.proce.wait{background-position:0 -40px;}.proce.doing{background-position:0 -20px;color:#360;}.proce.ready{background-position:0 0;}#process .wait .tx2{color:#999;}#process ul{position:absolute;margin-top:-38px;text-align:center;}#process .proce ul{z-index:5;width:150px;}#process .node ul{z-index:1;width:318px;margin-left:-152px;}*html #process{overflow:hidden;}*html #process .node{background-position-x:-150px;}*html #process .proce{background-position-x:0;}*html #process .wait{background-position-y:-40px;}*html #process .doing{background-position-y:-20px;}*html #process .ready{background-position-y:0;}*html #process .singular{background-position-y:-60px;}
    /**跟踪、付款信息**/
    #ordertrack{/*border:1px solid #e8e8e8;padding:0 5px;*/position:relative; border-top: 1px solid #E8E8E8; border-bottom: 1px solid #E8E8E8; padding-top: 10px; padding-bottom: 10px; margin-left: 10px; margin-right: 10px;}
    #ordertrack td{vertical-align:top}#ordertrack .i-ordertrack s,.post01 .fore .fr s{float:left;width:9px;height:16px;font-size:0;line-height:0;margin-right:5px;background:url(i/od-icon.png)}.post01 .fore .fr s{margin-top:4px}#ordertrack .i-ordertrack a{color:#005AA0}
    #ordertrack .tab{height:40px;line-height:40px;overflow:visible;}
    #ordertrack .tab li{cursor:pointer}#ordertrack .tab li h2{float:left;height:30px;/*padding:0 8px;*/color:#999;}
    #ordertrack .tab{/*border-bottom: 1px solid #E8E8E8;background: #F5F5F5;*/ }
    #ordertrack .tab .curr h2{position:relative;height:31px;color:#333333;}
    #ordertrack .mc{padding:5px 8px 5px 0; line-height: 30px;}#ordertrack .mc .extra{margin-top:10px;}#ordertrack th strong{display:block;padding-bottom:3px;margin-bottom:5px;border-bottom:1px solid #DBDBDB;text-align:left;}*html #ordertrack .tab{overflow:hidden;}
    /**订单信息**/
    #orderinfo{/*border:1px solid #DADADA;*/overflow:visible;}
    #orderinfo .mt{padding:0 8px;height:40px;line-height:40px;font-size:14px; /*border-bottom:1px solid #E8E8E8;*/ color: #333333; /*background:#F5F5F5;*/}
    #orderinfo .mc{padding:5px 8px;background:#fff;overflow:visible; line-height: 30px;}
    #orderinfo .mc dl{padding:10px 5px;border-top:1px solid #EDEDED; width: 1190px; float: left;}
    #orderinfo .mc dl.fore{border-top:0;}#orderinfo .mc dt{margin-bottom:4px;font-weight:bold;}#orderinfo .p-list{overflow:hidden;margin-right:-1px;border-left:1px solid #DEDEDE;}#orderinfo .p-list table{border-collapse:collapse;margin-left:-1px;border:solid #DEDEDE;border-width:0 1px;}#orderinfo .p-list th{padding:5px;background:#F0F0F0;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;font-weight:normal;}#orderinfo .p-list td{padding:5px;background:#fff;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;text-align:center;}#barcode{position:relative;height:20px;padding:0 5px;}#barcode ul{position:absolute;left:5px;padding:6px 10px;border:1px solid #ccc;background:#fff;z-index:1}
    #orderinfo .total{padding:15px 10px 0;overflow:hidden;zoom:1;font-family:arial; padding-bottom: 20px;}#orderinfo .total ul{float:right;padding:0 20px 10px 0;overflow:hidden;font-size:14px;}#orderinfo .total li{overflow:hidden;line-height:20px;}#orderinfo .total li span{float:left;width:150px;text-align:right;}#orderinfo .total .extra{float:right;padding:10px 20px 0 0;border-top:1px solid #ccc;font-size:16px;font-weight:bold;}#orderinfo .total .extra b{font-size:24px;}a.flk13:link,a.flk13:visited{color:#005AA0;}.img-list .img-box:hover{border-color:#EDD28B;}.img-list .img-box{border:1px solid #e1e1e1;display:block;margin:0 auto;width:50px;height:50px;}.ftx04{color:#F00}
    .pay-button{display: block; width: 46px; height: 24px; background: #ee701c; color: #ffffff; text-align: center; line-height: 24px; border-radius: 3px; float: left;}
    .fore-in{width:375px; float: left; border-right: 1px dashed #E8E8E8; margin-right: 20px;}
    /*  退款进度 */
    .md_process {
        padding-bottom:36px;
        padding-top:20px
    }
    .md_process_wrap {
        position:relative;
        width:729px;
        height:38px;
        margin:0 auto;
        padding:28px 0;
        background:url(${base}/static/img/ubzlo_kqze2y27krbdizcugfjeg5sckzsew_174x38.png) 0 28px repeat-x;
        *zoom:1
    }
    .md_process_sd {
        position:absolute;
        top:28px;
        left:0;
        height:38px;
        margin:0 3px;
        background:url(${base}/static/img/ubzlo_kqzdsvk7krbhsvsugfjeg5sckzsew_174x38.png) -321px 0 repeat-x
    }
    .md_process_i {
        position:absolute;
        top:28px;
        width:32px;
        height:38px;
        font:400 14px/38px helvetica,tahoma,arial,sans-serif;
        color:#fff;
        text-align:center
    }
    .md_process_i1 {
        left:0
    }
    .md_process_i2 {
        left:175px
    }
    .md_process_i3 {
        left:349px
    }
    .md_process_i4 {
        left:522px
    }
    .md_process_i5 {
        left:697px
    }
    .md_process_tip,.md_process_tip_bt {
        position:absolute;
        top:-28px;
        width:310px;
        height:28px;
        left:16px;
        margin-left:-155px;
        font:400 12px/28px helvetica,tahoma,arial,sans-serif;
        color:#999
    }
    .md_process_tip_bt {
        top:auto;
        bottom:-28px
    }
    .md_process_step1 .md_process_i1 .md_process_tip {
        color:#7abd53
    }
    .md_process_step1 .md_process_sd {
        width:27px
    }
    .md_process_step1_5 .md_process_i1 .md_process_tip {
        color:#7abd53
    }
    .md_process_step1_5 .md_process_sd {
        width:100px
    }
    .md_process_step2 .md_process_i1 .md_process_tip,.md_process_step2 .md_process_i2 .md_process_tip {
        color:#7abd53
    }
    .md_process_step2 .md_process_sd {
        width:201px
    }
    .md_process_step2_5 .md_process_i1 .md_process_tip,.md_process_step2_5 .md_process_i2 .md_process_tip {
        color:#7abd53
    }
    .md_process_step2_5 .md_process_sd {
        width:274px
    }
    .md_process_step3 .md_process_i1 .md_process_tip,.md_process_step3 .md_process_i2 .md_process_tip,.md_process_step3 .md_process_i3 .md_process_tip {
        color:#7abd53
    }
    .md_process_step3 .md_process_sd {
        width:375px
    }
    .md_process_step3_5 .md_process_i1 .md_process_tip,.md_process_step3_5 .md_process_i2 .md_process_tip,.md_process_step3_5 .md_process_i3 .md_process_tip {
        color:#7abd53
    }
    .md_process_step3_5 .md_process_sd {
        width:448px
    }
    .md_process_step4 .md_process_i1 .md_process_tip,.md_process_step4 .md_process_i2 .md_process_tip,.md_process_step4 .md_process_i3 .md_process_tip,.md_process_step4 .md_process_i4 .md_process_tip {
        color:#7abd53
    }
    .md_process_step4 .md_process_sd {
        width:549px
    }
    .md_process_step4_5 .md_process_i1 .md_process_tip,.md_process_step4_5 .md_process_i2 .md_process_tip,.md_process_step4_5 .md_process_i3 .md_process_tip,.md_process_step4_5 .md_process_i4 .md_process_tip {
        color:#7abd53
    }
    .md_process_step4_5 .md_process_sd {
        width:622px
    }
    .md_process_step5 .md_process_i1 .md_process_tip,.md_process_step5 .md_process_i2 .md_process_tip,.md_process_step5 .md_process_i3 .md_process_tip,.md_process_step5 .md_process_i4 .md_process_tip,.md_process_step5 .md_process_i5 .md_process_tip {
        color:#7abd53
    }
    .md_process_step5 .md_process_sd {
        width:723px
    }
    .mdx_process {
        padding-bottom:36px;
        padding-top:20px;
        border-bottom:1px solid #f1f1f1
    }
    .mdx_process_wrap {
        position:relative;
        width:743px;
        height:38px;
        margin:0 auto;
        padding:28px 0;
        background:url(${base}/static/img/ubzlo_kqzgo6k7ozbdiqkugfjeg5sckzsew_142x38.png) 0 28px repeat-x;
        *zoom:1
    }
    .mdx_process_sd {
        position:absolute;
        top:28px;
        left:0;
        height:38px;
        margin:0 3px;
        background:url(${base}/static/img/ubzlo_kqzhayklozbhgv2ugfjeg5sckzsew_142x38.png) -257px 0 repeat-x
    }
    .mdx_process_i {
        position:absolute;
        top:28px;
        width:32px;
        height:38px;
        font:400 14px/38px helvetica,tahoma,arial,sans-serif;
        color:#fff;
        text-align:center
    }
    .mdx_process_i1 {
        left:0
    }
    .mdx_process_i2 {
        left:143px
    }
    .mdx_process_i3 {
        left:285px
    }
    .mdx_process_i4 {
        left:426px
    }
    .mdx_process_i5 {
        left:569px
    }
    .mdx_process_i6 {
        left:711px
    }
    .mdx_process_tip,.mdx_process_tip_bt {
        position:absolute;
        top:-28px;
        width:310px;
        height:28px;
        left:16px;
        margin-left:-155px;
        font:400 12px/28px helvetica,tahoma,arial,sans-serif;
        color:#aeaeae
    }
    .mdx_process_tip_bt {
        top:auto;
        bottom:-28px
    }
    .mdx_process_step1 .mdx_process_i1 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step1 .mdx_process_sd {
        width:27px
    }
    .mdx_process_step1_5 .mdx_process_i1 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step1_5 .mdx_process_sd {
        width:85px
    }
    .mdx_process_step2 .mdx_process_i1 .mdx_process_tip,.mdx_process_step2 .mdx_process_i2 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step2 .mdx_process_sd {
        width:169px
    }
    .mdx_process_step2_5 .mdx_process_i1 .mdx_process_tip,.mdx_process_step2_5 .mdx_process_i2 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step2_5 .mdx_process_sd {
        width:227px
    }
    .mdx_process_step3 .mdx_process_i1 .mdx_process_tip,.mdx_process_step3 .mdx_process_i2 .mdx_process_tip,.mdx_process_step3 .mdx_process_i3 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step3 .mdx_process_sd {
        width:311px
    }
    .mdx_process_step3_5 .mdx_process_i1 .mdx_process_tip,.mdx_process_step3_5 .mdx_process_i2 .mdx_process_tip,.mdx_process_step3_5 .mdx_process_i3 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step3_5 .mdx_process_sd {
        width:369px
    }
    .mdx_process_step4 .mdx_process_i1 .mdx_process_tip,.mdx_process_step4 .mdx_process_i2 .mdx_process_tip,.mdx_process_step4 .mdx_process_i3 .mdx_process_tip,.mdx_process_step4 .mdx_process_i4 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step4 .mdx_process_sd {
        width:453px
    }
    .mdx_process_step4_5 .mdx_process_i1 .mdx_process_tip,.mdx_process_step4_5 .mdx_process_i2 .mdx_process_tip,.mdx_process_step4_5 .mdx_process_i3 .mdx_process_tip,.mdx_process_step4_5 .mdx_process_i4 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step4_5 .mdx_process_sd {
        width:511px
    }
    .mdx_process_step5 .mdx_process_i1 .mdx_process_tip,.mdx_process_step5 .mdx_process_i2 .mdx_process_tip,.mdx_process_step5 .mdx_process_i3 .mdx_process_tip,.mdx_process_step5 .mdx_process_i4 .mdx_process_tip,.mdx_process_step5 .mdx_process_i5 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step5 .mdx_process_sd {
        width:595px
    }
    .mdx_process_step5_5 .mdx_process_i1 .mdx_process_tip,.mdx_process_step5_5 .mdx_process_i2 .mdx_process_tip,.mdx_process_step5_5 .mdx_process_i3 .mdx_process_tip,.mdx_process_step5_5 .mdx_process_i4 .mdx_process_tip,.mdx_process_step5_5 .mdx_process_i5 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step5_5 .mdx_process_sd {
        width:653px
    }
    .mdx_process_step6 .mdx_process_i1 .mdx_process_tip,.mdx_process_step6 .mdx_process_i2 .mdx_process_tip,.mdx_process_step6 .mdx_process_i3 .mdx_process_tip,.mdx_process_step6 .mdx_process_i4 .mdx_process_tip,.mdx_process_step6 .mdx_process_i5 .mdx_process_tip,.mdx_process_step6 .mdx_process_i6 .mdx_process_tip {
        color:#7abd53
    }
    .mdx_process_step6 .mdx_process_sd {
        width:737px
    }

</style>
<div style="background: #F5F5F5;">
<div class="content" style="background: #ffffff;  border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8;">
	<div class="breadcrumb">
    	<strong><a href="${base}/order/list">订单中心</a></strong><span>&nbsp;&gt;&nbsp;订单：${order.orderSn}<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content" style="background: #ffffff; padding-top: 15px; border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8;">
    <#--状态、提示-->
    <div class="m" id="orderstate">
        <div class="mt">
            <#--将状态改为订单主状态 以及加上退款状态 Auth:zhangqiang Time:2015-10-10 17:33:25 Start -->
            <#--<strong class=" ">订单号：${order.orderSn}&nbsp;&nbsp;&nbsp;&nbsp;状态：<span class="ftx14">-->
            <#--<#if order.isRefund == 'N'>-->
                        <#--${orderStatusMapping['${order.orderStatus}']}-->
            <#--</#if>-->
            <#--<#if order.isRefund == 'Y'>-->
                <#--<#if '${order.orderRefund.status}'== 'success'>-->
                    <#--退款完成-->
                <#--<#elseif '${order.orderRefund.status}'== 'refunded'>-->
                    <#--待收款-->
                <#--<#elseif '${order.orderRefund.status}'== 'confirmed'>-->
                    <#--退款已受理，等待买家发货-->
                <#--<#elseif '${order.orderRefund.status}'== 'returned'>-->
                    <#--退款未受理-->
                <#--<#elseif '${order.orderRefund.status}'== 'commit'>-->
                    <#--退款申请中...-->
                <#--<#else>-->
                    <#--退款中...-->
                <#--</#if>-->
            <#--</#if>-->
            <#--</span>&nbsp;&nbsp;</strong>-->

            <strong class=" ">
                订单号：${order.orderSn}&nbsp;&nbsp;&nbsp;&nbsp;状态：
                <span class="ftx14">
                <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                  <strong class="ftx-04 order-statu"
                            state="ddfk" style="float: right; margin-right: 10px;">${orderStatusMapping['${order.orderStatus}']}</strong>
                <#else>
                  <span class="ftx-03">${orderStatusMapping['${order.orderStatus}']}</span>
                </#if>
                </span>&nbsp;&nbsp;</strong>

                 <#if order.isRefund == 'Y'>
                 &nbsp;&nbsp;退款状态：<span class="ftx14">
                   <a href="javascript:void(0)" onclick="refundList('${order.orderSn}');">
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
                   </a>
                 </span>
                 </#if>
             </span>&nbsp;&nbsp;</strong>
            <#--将状态改为订单主状态 以及加上退款状态 Auth:zhangqiang Time:2015-10-10 17:33:25 End -->
            <#--判断显示什么样的按钮-->
            <#if order.orderStatus == "wait_buyer_pay">
            <span id="pay-button-${order.orderSn}">
                <a href="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}" target="_blank" class="pay-button">
                   <#-- <img width="46" height="25" style="display:inline;" src="${base}/static/img/btn_pay.gif">-->支付
                </a>
            </span>
            <div class="fr">
                <div class="toolbar">
                    <#--<input type="button" class="btn-img btn" id="btn_Cancel"
                           onclick="cancleOrder('${order.id}')" value="取消">-->
                        <a href="${base}/order/popupcancel/${order.id}" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请"  id="btn_Cancel">取消</a>
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
    <#if order.orderStatus != 'cancel' && order.orderStatus != 'deleted' && order.isRefund == 'N'>
    <#--<div id="process" class="section4">
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
                <#else>
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
                    <td  width="33.5%" id="daiFuName"> 付款方式：${order.paymentMethodName}</td>
                    <td  width="66.5%" id="daiFuPeople">
                    </td>
                </tr>
                <tr>
                    <td> 商品金额：￥${order.goodsTotalPrice}</td>
                    <td> 运费金额：￥${order.deliveryFee}</td>
                </tr>
                <tr>
                    <td> 优惠金额：
                        <#if order.discount??>
                            ￥${order.discount}
                        <#else>
                            ￥0
                        </#if>
                    </td>
                    <td> 实际运费：￥${order.deliveryFee}</td>
                </tr>
                <tr>
                    <td colspan="2"> 应支付金额：￥${order.totalAmount}</td>
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

    <#--金额-->
        <div class="mc" style="overflow: hidden;">
        <#--顾客信息-->
            <dl class="fore" >
                <div class="fore-in">
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
                </div>
                <div class="fore-in">
                    <dt>支付及配送方式</dt>
                    <dd>
                        <ul>
                            <li>支付方式：${order.paymentMethodName}</li>
                            <li>运&nbsp;&nbsp;&nbsp;&nbsp;费：￥${order.deliveryFee}</li>
                            <li>配送方式：${order.deliveryMethodName}</li>
                            <li>送货时间：${order.deliveryTime}</li>
                        </ul>
                    </dd>
                </div>
                <div class="fore-in" style="border-right: none;">
                <#--发票-->
                    <dt>发票信息</dt>
                    <dd>
                        <ul>
                        <#if order.invoiceContent=="no">
                            <li>发票类型：不开发票</li>
                        <#else>
                            <li>发票类型：<span class="blue"><#if order.invoiceType=="normal">普通发票</#if></span></li>
                            <li>发票抬头：<span class="blue">${order.invoiceTitle}</span></li>
                            <li>发票内容：<span class="blue"><#if order.invoiceContent=="infos">明细</#if></span></li>
                        </#if>
                        </ul>
                    </dd
                </div>
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
        <#--商品-->
            <dl>
                <dt>
                <#--字体受影响 Auth:zhangqiang Time:2015-10-08 18:04:25 Start-->
                <#--<span class="i-mt">商品清单</span>-->
                    <span style="font-family : 宋体;">商品清单</span>
                <#--字体受影响 Auth:zhangqiang Time:2015-10-08 18:04:25 End-->
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
                            <th width="10%"> 商品图片 </th>
                            <th width="60%"> 商品名称 </th>
                            <th width="10%"> 商品简称 </th>
                            <th width="10%"> 购买价格 </th>
                            <th width="10%"> 商品数量 </th>
                        </tr>
                        <#list goodsList as goods>
                        <tr>
                            <td>
                                <div class="img-list">
                                    <a class="img-box" target="_blank" href="${base}/item/${goods.id}.html">
                                        <img width="50" height="50" src="${goods.pic}" title="${goods.fullName}">
                                    </a>
                                </div>
                            </td>
                            <td>
                                <div>
                                    <div style="float: left;width: 78%;">
                                        <div class="al fl">
                                            <a class="flk13" target="_blank" href="${base}/item/${goods.id}.html"> ${goods.fullName}</a>
                                        </div>
                                        <div class="clr"></div>
                                        <div id="coupon_${goods.sn}" class="fl"></div>
                                    </div>
                                    <div style="float: right;width: 20%;">
                                        <#list orderItemList as orderItem>
                                             <#if orderItem.goodsId == goods.id>
                                        ${orderItem.specification}
                                        </#if>
                                        </#list>
                                    </div>
                                    <div></div>
                                </div>

                            </td>
                            <td>
                            ${goods.shortName}
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
                                </#if>
                                </#list>
                            </td>
                        </tr>
                        <tr>
                            <td style="background: #f3f3f3; ><font style="margin-left: 10px;vertical-align: middle;margin-top: 2px">备注：</font></td>
                            <td colspan="4" style="text-align: left;border-top: 1px dashed #dddddd; background: #f3f3f3; padding-bottom: 10px;">
                                <span style="width: 1000px;vertical-align: middle;margin-top: 2px; color: #585757;">
                                    <#list orderItemList as orderItem>
                                    <#if orderItem.goodsId == goods.id>
                                    ${orderItem.ps}
                                    </#if>
                                 </#list>
                                </span>
                            </td>
                        </tr>
                        </#list>
                        </tbody></table>
                </dd>
            </dl>
        </div>
        <div class="total">
            <ul>
                <li><span>总商品金额：</span>￥${order.goodsTotalPrice}</li>
                <li><span>- 优惠：</span>￥${order.discount}</li>
                <li><span>+ 运费：</span>￥${order.deliveryFee}</li>
            </ul>
            <span class="clr">ad</span> <span style="color:#EDEDED;"></span>
            <div class="extra">
                应付总额：<span class="ftx04"><b>￥${order.totalAmount?string('0.00')}</b></span>
            </div>
        </div>
    </div>
</div>
</div>
<div style="margin-top: -10px !important;">
<#include "mall/jp/service.ftl"/>
<#include "mall/jp/footer.ftl"/>
</div>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/js/layer.js" type="text/javascript"></script>
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

    /**Auth:zhangqiang Time:2015-10-10 17:39:56 Start
     * 到退款页面
     * @param orderId 订单Id
     */
    function refundList(orderSn){
        window.location.href ="${base}/member/refund/list.html?orderSn=" + orderSn;
    }
</script>