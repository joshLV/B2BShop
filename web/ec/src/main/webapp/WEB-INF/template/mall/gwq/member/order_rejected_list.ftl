<#escape x as x?html>
    <#include "mall/gwq/top.ftl"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/addressDialog.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<style>
    .breadcrumb {
        height: 20px;
        padding: 10px 0 4px 6px;
        margin-bottom: 10px;
        overflow: hidden;
        line-height: 20px;
        vertical-align: baseline;
    }

    .breadcrumb strong, .breadcrumb h1 {
        display: inline;
        font-weight: normal;
        line-height: 20px;
        font-size: 14px;
        font-family: "microsoft yahei";
    }
    .main{border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8;}
    .left {
        float: left;
        width: 195px;
        /* margin-right: 10px;*/
        margin-bottom: -9999999px;
        padding-bottom: 9999999px;
        border-right: 1px solid #E8E8E8;
        overflow: hidden;
        background: #ffffff;
    }

    .right {
        float: right;
        width: 1024px;
        margin-bottom: -9999999px;
        padding-bottom: 9999999px;
        background: #ffffff;
    }

    .widepage .right {
        width: 1014px;
        overflow: hidden;

    }

    .right a:link, .right a:visited {
        color: #005ea7;
    }

    .right a:link, .right a:visited {
        color: #005ea7;
    }

    .ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {
        color: #999999;
    }

    /**order-mt**/
    .right .order-mt {
        border: 1px solid #e6e6e6;
        border-bottom: 2px solid #c30000;
        height: 40px;
        line-height: 40px;
        margin-bottom: 10px;
        /*margin-top: 10px;*/
    }

    .right .order-mt h2 {
        position: relative;
    }

    .right .order-mt h2 {
        color: #cc0000;
        padding-left: 16px;
        float: left;
    }

    .right .order-mt .extra {
        float: right;
        padding-right: 15px;
    }

    .right .order-mt .extra a {
        display: inline-block;
        position: relative;
        margin-right: 10px;
    }

    .right .order-mt .extra a {
        margin-right: 10px;
        display: inline-block;
        vertical-align: middle;
    }

    /**order01**/
    #order01 {
        margin-top: -10px;
        line-height: 20px;
    }

    #order01 .mc {
        padding: 10px 20px;
        line-height: 25px;
        border: 1px solid #e6e6e6;
        border-top: none;
    }

    #order01 dl, .filter-item .item-con {
        overflow: hidden;
    }

    #order01 dt {
        width: 60px;
        text-align: right;
    }

    #order01 dt, #order01 dd {
        float: left;
        border-right: 1px dashed #e4e4e4;
        padding-left: 15px;
        padding-right: 15px;
    }

    #order01 dd {
        /*margin-right: 25px;*/
        color: #999;
    }

    #order01 dt, #order01 dd {
        float: left;
    }

    #expressLog{margin-left: 20px; line-height: 20px;}
    .green{color: #00aa00;}
    .black{color: #000000;}
    .red{color: #ff0000;}

</style>

<style>
    .ftx-04 {
        color: #C00;
    }

    #orderlist, #orderlist .mc, #orderlist .tb-order, #orderlist .mt {
        overflow: visible;
    }

    #orderlist .mt {
        border-bottom: 1px solid #E8E8E8;
        padding-left: 6px;
        /* border-top: 1px solid #E6E6E6;*/
        /*border-right: 1px solid #E6E6E6;
        border-left: 1px solid #E6E6E6;*/
        background: #F5F5F5;
    }

    #orderlist .taborder li {
        position: relative;
        float: left;
        z-index: 2;
    }

    #orderlist .taborder .tyies-t {
        line-height: 40px;
        /* background: url(${base}/static/mall/img/tab01.png) 0 -32px;*/
        height: 40px;
        padding-left: 10px;
        padding-right: 47px;
        position: relative;
        z-index: 3;
        font-size: 14px;
        cursor: pointer;
    }

    #orderlist .taborder li b, #orderlist .taborder li s {
        height: 31px;
        /*   background: url(${base}/static/mall/img/tab01.png);*/
        position: absolute;
    }

    #orderlist .taborder li s {
        top: 0;
        left: 0;
        width: 3px;
    }

    #orderlist .taborder li b {
        width: 31px;
        background-position: -3px 0;
        top: 0;
        right: 0;
    }

    #orderlist .mt .extra {
        width: 447px;
    }

    #orderlist .mt .extra {
        color: #666666;
    }

    #orderlist .mt .extra {
        float: right;
    }

    #orderlist .search {
        float: right;
    }

    #orderlist .search .text {
        padding: 4px;
        margin-right: 3px;
        border: 1px solid;
        border-color: #aaa #ddd #ddd #aaa;
        width: 190px;
    }

    #orderlist .search .bti {
        background: url(${base}/static/mall/img/use.gif) 0 -42px;
        width: 50px;
        height: 25px;
        margin-top: -1px;
    }

    #orderlist .search .bti {
        border: none;
    }

    #orderlist .mc {
        /*  border: 1px solid #e6e6e6;
          border-top: none;*/
    }

    #orderlist .tb-order {
        overflow: hidden;
        /* margin-right: -1px;
         margin-left: -1px;
         margin-bottom: -1px;*/
    }

    #orderlist .tb-order table {
        border-collapse: collapse;
        border: solid #E6E6E6;
        border-width: 0 0 1px 0;
    }

    #orderlist .tb-order th {
        background: #f7f7f7;
        height: 31px;
        color: #666666;
        font-weight: normal;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    #orderlist .tb-order td {
        border: solid #E6E6E6;
        border-width: 1px 0 0 1px;
        padding: 5px 4px;
        text-align: center
    }

    #orderlist .tb-order td.td-02 {
        background: #fffdee;
        color: #666666;
        padding-top: 5px;
    }

    #orderlist .tb-order .tr-th {
        background: #f9f9f9;
    }

    #orderlist .tb-order .tr-th td {
        text-align: left;

    }

    #orderlist .tr-th td, #orderlist .tr-split td {
        padding-top: 4px;
        padding-bottom: 4px;
    }

    #orderlist .tr-th span {
        display: inline-block;
        margin-right: 10px;
        overflow: hidden;
        vertical-align: middle;
        height: 24px;
        line-height: 23px;
        float: left;
    }

    #orderlist .tr-th .tcol1 {
        width: 225px;
        color: #666666
    }

    #orderlist .tr-th .tcol2 {
        /*width:130px;*/
        color: #666666;
        margin: 0;
    }

    #orderlist .tr-td td {
        vertical-align: top;
        padding-top: 10px;
    }

    #orderlist .tr-td .img-list {
        width: 280px;
        overflow: hidden; /* margin-bottom: 4px; */
    }

    #orderlist .tr-td .img-list .img-box {
        border: 1px solid #e1e1e1;
        float: left;
        margin-right: 4px;
        margin-bottom: 4px;
        background: url(${base}/static/mall/gwq/img/default_img.jpg) no-repeat center;
        background-size: 100%;
        display: block;
        width: 70px;
        height: 70px;
    }

    #orderlist .tr-td .img-list .img-box:hover {
        border-color: #e5ca84
    }

    #orderlist .tr-td .u-name {
        width: 80px;
        overflow: hidden;
        word-break: break-all;
        word-wrap: break-word;
    }

    #orderlist .tr-td .cellphone-icon {
        display: block;
        width: 58px;
        height: 16px;
        margin: 5px auto 0;
        line-height: 100px;
        overflow: hidden;
        background: url(${base}/static/mall/img/cellphone.png) no-repeat;
    }

    #orderlist .tr-td a.btn-again {
        background: url(${base}/static/mall/img/use.gif);
        display: block;
        height: 21px;
        line-height: 100px;
        margin: 3px auto 0;
        overflow: hidden;
        width: 72px;
    }

    #orderlist .tr-td a.btn-again:hover {
        background-position: 0 -21px
    }

    /**pagin**/
    .pagin a, .pagin span {
        float: left;
        height: 20px;
        padding: 3px 10px;
        border: 1px solid #ccc;
        margin-left: 2px;
        font-family: arial;
        line-height: 20px;
        font-size: 14px;
        overflow: hidden;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
    }

    .pagin .text, .pagin .current {
        border: 0;
        padding: 4px 11px;
    }

    .pagin a:link, .pagin a:visited {
        color: #005aa0;
    }

    .pagin a:hover, .pagin a:active {
        background: #DB0000;
        color: #fff;
        text-decoration: none;
    }

    .pagin .current, .pagin .current:link, .pagin .current:visited {
        color: #f60;
        font-weight: 700;
    }

    .pagin b {
        display: block;
        position: absolute;
        top: 9px;
        width: 5px;
        height: 9px;
        background-image: url(${base}/static/mall/img/bg5.gif);
        background-repeat: no-repeat;
        overflow: hidden;
    }

    .pagin .prev, .pagin .next, .pagin .prev-disabled, .pagin .next-disabled {
        position: relative;
        padding-top: 5px;
        height: 18px;
        line-height: 18px;
    }

    .pagin .prev-disabled, .pagin .next-disabled {
        color: #ccc;
        cursor: default;
    }

    .pagin .prev, .pagin .prev-disabled {
        padding-left: 12px;
    }

    .pagin .prev b {
        left: 3px;
        background-position: -68px -608px;
    }

    .pagin .prev-disabled b {
        left: 3px;
        background-position: -80px -608px;
    }

    .pagin .next, .pagin .next-disabled {
        padding-right: 12px;
    }

    .pagin .next b {
        right: 3px;
        background-position: -62px -608px;
    }

    .pagin .next-disabled b {
        right: 3px;
        background-position: -74px -608px;
    }

    .pagin-m a, .pagin-m span {
        height: 14px;
        line-height: 14px;
        font-size: 12px;
    }

    .pagin-m b {
        top: 5px;
    }

    .pagin-m .prev, .pagin-m .next, .pagin-m .prev-disabled, .pagin-m .next-disabled {
        padding-top: 3px;
        height: 14px;
        line-height: 14px;
        *line-height: 16px;
    }
    /* 支付 */
    .btn{display: block; width: 76px; height: 24px; line-height: 24px; background: #db0000;border-radius: 3px;color: #ffffff !important; margin-left:35px; margin-bottom: 5px;}
    .btn:hover{background: #ed4548;}
    .bltx-color{color: #DB0000;}
</style>

    <#include "mall/gwq/header_new.ftl"/>

<div class="left">
    <#import "mall/gwq/member/menu.ftl" as memu>
		<@memu.menu id="wddd"/>
</div>
<!--left end-->
<div class="right">
    <div class="breadcrumb">
        <strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;部分退货<span></span></span>
    </div>
    <div class="m" id="orderlist">
        <div class="mc">
            <div class="tb-order">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <th width="128" style="text-align: center;">退货订单信息</th>
                        <th width="80" style="text-align: center;">收货人</th>
                        <th width="80" style="text-align: center;">购买价</th>
                        <th width="80" style="text-align: center;">购买数量</th>
                        <th width="80" style="text-align: center;">购买金额</th>
                        <th width="100" style="text-align: center;">购买时间</th>
                        <th width="80" style="text-align: center;">退货数量</th>
                        <th width="110" style="text-align: center;">应退货金额</th>
                        <th width="128" style="text-align: center;">操作</th>
                    </tr>
                    </tbody>
                    <tbody id="tb-order-${order.id}" class="parent-1637764313">
                    <tr class="tr-th">
                        <td colspan="9">
                            <span class="tcol1">
                                订单编号:
                                <a name="orderIdLinks" id="idUrl${order.orderSn}" target="_blank"
                                   href="${base}/order/view/${order.id}.html">${order.orderSn}</a>
                            </span>
                        </td>
                    </tr>
                    <#list orderItemList as orderitem>
                        <tr id="track${order.id}" oty="0,4" class="tr-td">
                            <td>
                                <div class="img-list" style="width: 128px;">

                                        <#if order.orderSn == orderitem.orderSn>
                                        <#--<#if orderitem_index gt 0>-->
                                            <a href="${base}/item/${orderitem.goodsId}.html" target="_blank" class="img-box">
                                                <img src="${orderitem.pic}@70w_70h.png" title="${orderitem.goodsName}" height="70" width="70">
                                            </a>
                                        <#--</#if>-->
                                        </#if>

                                </div>
                            </td>
                            <td>
                                <div class="u-name">${order.shipName}</div>
                            </td>
                            <td>
                                ￥${orderitem.goodsPrice}
                            </td>
                            <td>
                                ${orderitem.quantity}
                            </td>
                            <td>
                                ￥
                                ${orderitem.quantity * orderitem.goodsPrice}
                                <br>${order.paymentMethodName}<br>
                            </td>
                            <td>
                                <span class="ftx-03">
                                    ${order.createDate?string("yyyy-MM-dd")}
                                        <br>${order.createDate?string("HH:mm:ss")}
                                </span>
                                <input type="hidden" id="datasubmit-${order.id}" value="${order.createDate?string("yyyy-MM-dd")} ${order.createDate?string("HH:mm:ss")}">
                            </td>
                            <td>
                                ${orderitem.rejectedGoodsQuantity}
                            </td>
                            <td>
                                ￥
                                <#if orderitem.goodsPriceCount??>
                                    ${orderitem.goodsPriceCount}
                                <#else>
                                    0
                                </#if>
                            </td>
                            <td id="operate${order.orderSn}" class="order-doi" width="100">
                                <#if orderitem.rejectedStatus=="waitBusinessApprove" || orderitem.rejectedStatus=="waitMallApprove">
                                    <a class="btn btn-4" href=""><s></s>等待审批</a>
                                <#elseif orderitem.rejectedStatus=="waitMemberSendGoods">
                                    <a class="btn btn-4" href="${base}/orderRejected/confirmRejectedVoucher/${order.id}/${goodsRejected.rejectedSn}.html"><s></s>等待会员发货</a>
                                <#elseif orderitem.rejectedStatus=="waitBusinessConfirmReceipt">
                                    <a class="btn btn-4" href=""><s></s>等待商家确认收货</a>
                                <#elseif orderitem.rejectedStatus=="waitMallRefund">
                                    <a class="btn btn-4" href=""><s></s>退款中</a>
                                <#elseif orderitem.rejectedStatus=="refundFinished">
                                    <a class="btn btn-4" href=""><s></s>退货完成</a>
                                <#elseif orderitem.rejectedStatus=="businessApproveFail" || orderitem.rejectedStatus=="mallApproveFail">
                                    <a class="btn btn-4" href=""><s></s>审批失败</a>
                                    <a class="btn btn-4" target="_blank" href="${base}/orderRejected/confirmRejected/${order.id}/${orderitem.id}.html?apply=again"><s></s>重新申请</a>
                                <#elseif orderitem.rejectedStatus=="" || orderitem.rejectedStatus==null>
                                    <a class="btn btn-4" target="_blank" href="${base}/orderRejected/confirmRejected/${order.id}/${orderitem.id}.html"><s></s>申请退货</a>
                                </#if>
                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="clr"></div>
</div>
<!-- right end -->

<!--物流信息对话框 start-->
<div id="LoginBox">
    <div class="thickdiv" id=""></div>
    <div class="thickbox" id="" style="left: 246.5px; top: 276px; width: 762px; height: 543px;">
        <div class="thickwrap" style="width: 760px;">
            <div class="thicktitle" id="" style="width:640"><span id="oper">退货信息详情</span><a href="javascript:void(0)" title="关闭窗口" class="close_btn" id="closeBtn">×</a></div>
            <div class="thickcon" id="" style="width: 640px; height: 290px; padding-left: 10px; padding-right: 10px; overflow: auto;">
                <div id="addressDiagDiv">
                    <ul>
                        <li><strong>退货详情:</strong><ul id="expressLog"></ul></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--物流信息对话框 end-->

<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script type="text/javascript">
    //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {
        $(".cancleOrder").colorbox({iframe:true, innerWidth:520, innerHeight:350, opacity: 0.15});
        $(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
            $("#LoginBox").fadeOut("fast");
            $("#mask").css({ display: 'none' });
        });
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });

        $("#submitDate").change(function () {
            searchOrder();
        });
        $("#orderState").change(function () {
            searchOrder();
        });
        $(window).scroll(function(){
            var top=$(document).scrollTop()+150;
            $("#LoginBox").animate({top:top+"px"},200,"linear");
        });
    });



    function showRejectedLog(rejectedSn){
        var load=layer.load();
        //$("#expressLog").html("");
        //$("body").append("<div id='mask'></div>");
        //$("#mask").addClass("mask").fadeIn("slow");
        //$("#LoginBox").css("top",$(document).scrollTop()+150+"px");
        //$("#LoginBox").fadeIn("slow");
        $.ajax({
            url:"${base}/orderRejected/getRejectedDetailLog/"+rejectedSn,
            type:'post',
            success:function(data){
                layer.close(load);
                if( data.status == 'success' ){
                    var html = '';
                    html += '<li><h2>退货单：' + rejectedSn +'</h2></li>';
                    $.each(data.goodsRejectedLogs,function(k,v){
                        color="black";
                        if (0==k){
                            color="red";
                        }
                        var dealer = "";
                        if(v.rejectedStatus=="waitBusinessApprove") {
                            dealer = "[等待商家审批]";
                        } else if(v.rejectedStatus=="waitMallApprove") {
                            dealer = "[等待商城审批]";
                        } else if(v.rejectedStatus=="waitMemberSendGoods") {
                            dealer = "[等待会员发货]";
                        } else if(v.rejectedStatus=="waitBusinessConfirmReceipt") {
                            dealer = "[等待商家确认收货]";
                        } else if(v.rejectedStatus=="waitMallRefund") {
                            dealer = "[等待商城退款]";
                        } else if(v.rejectedStatus=="refundFinished") {
                            dealer = "[已成功退货, 商城已退款]";
                        } else if(v.rejectedStatus=="businessApproveFail") {
                            dealer = "[商家审批不通过]";
                        } else if(v.rejectedStatus=="mallApproveFail") {
                            dealer = "[商城审批不通过]";
                        }
                        var createDate = new WdatePicker(v.createDate)
                    <#--${order.createDate?string("yyyy-MM-dd")} ${order.createDate?string("HH:mm:ss")}-->
//                        html +="<li style=\"line-height:20px;\" class=\""+color+"\">"+new Date(v.createDate).toLocaleDateString()+"&nbsp;&nbsp;&nbsp;&nbsp;"+dealer+v.rejectedReason+"</li>";
                        html +="<li style=\"line-height:20px;\" class=\""+color+"\">"+v.createDateFormatter+"&nbsp;&nbsp;&nbsp;&nbsp;"+dealer+v.rejectedReason+"</li>";
                        html += '<li>&nbsp;</li>'
                    });

                    if(html!=''){
                        layer.open({
                            title : '退货信息详情',
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

</script>

    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>
</#escape>
