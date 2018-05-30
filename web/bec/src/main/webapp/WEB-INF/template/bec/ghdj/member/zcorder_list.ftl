<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
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
        font-size: 18px;
        font-family: "microsoft yahei";
    }

    .left {
        float: left;
        width: 195px;
        margin-right: 10px;
    }

    .right {
        float: right;
        width: 830px;
    }

    .widepage .right {
        width:1000px;
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
    .member_right {
        background:none !important;
        border:none;
        float: right;
        height: auto;
        overflow: hidden;
        width: 993px;
    }
    .my_orders {
        background: #ffffff none repeat scroll 0 0;
        border-right: 1px solid #e8e8e8;
        float: left;
        width: 991px !important;
    }
    .mymoney_pages{
        width: 975px !important;
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
    .mybtn-disable {
        width: 70px;
        height: 26px;
        background: #ccc;
        display: inline-block;
        color: #FFF !important;
        text-align: center;
        line-height: 26px;
        border-radius: 3px;
        margin-left: 18px;
        margin-bottom: 5px;
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
        border-bottom: 2px solid #C30000;
        padding-left: 6px;
        border-top: 1px solid #E6E6E6;
        border-right: 1px solid #E6E6E6;
        border-left: 1px solid #E6E6E6;
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
        border: 1px solid #e6e6e6;
        border-top: none;
    }

    #orderlist .tb-order {
        overflow: hidden;
        margin-right: -1px;
        margin-left: -1px;
        margin-bottom: -1px;
    }

    #orderlist .tb-order table {
        border-collapse: collapse;
        border: solid #E6E6E6;
        border-width: 0 1px 1px 1px;
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
        margin-bottom: 4px
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
    .btn{display: block; width: 76px; height: 24px; line-height: 24px; background: #db0000;border-radius: 3px;color: #ffffff !important; margin-left:35px;}
    .btn:hover{background: #ed4548;}
    .bltx-color{color: #DB0000;}
</style>

<div id="container" class="f-cb">
    <#include "bec/ghdj/top.ftl"/>
    <script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <div class="member_content f-cb" style="position: relative;">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/order/list.html?orderType_=1">订单中心</a></strong><span>&nbsp;&gt;&nbsp;众筹订单<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <!-- leftMenu-->
            <#--<#include "bec/ghdj/member/leftmenu.ftl"/>-->
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="ol2"/>
            <!--leftMenu end-->
        </div>
        <div class="member_right">
            <div class="my_order">

                <div class="my_orders">
                    <ul class="myOderNav list_tab">
                    <#--页面样式调整-相应状态的可点击 Auth:zhangqiang Time:2015-11-19  Start-->
                        <li><strong class="ftx-04" style="color: #DB0000; border-bottom: 2px solid #DB0000; width:60px; text-align: center;  height: 38px; display: block;">全部订单</strong></li>

                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('wait_buyer_pay')" <#if orderStates = 'wait_buyer_pay'>class="bltx-color"</#if> >
                                    待付款(${orderFuKuanCount})
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('wait_seller_send_goods')" <#if orderStates = 'wait_seller_send_goods'>class="bltx-color"</#if>>
                                    待发货(${orderFaHuoCount})
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('wait_buyer_confirm_goods')" <#if orderStates = 'wait_buyer_confirm_goods'>class="bltx-color"</#if>>
                                    待确认收货(${orderConfirmCount})
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('wait_buyer_validate_goods')" <#if orderStates = 'wait_buyer_validate_goods'>class="bltx-color"</#if>>
                                    待确认验货(${orderValidateCount})
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('trade_finished')" <#if orderStates = 'trade_finished'>class="bltx-color"</#if>>
                                    交易完成(${orderOverCount})
                                </a>
                            </div>
                        </li>
                        <li style="float: right;">
                            <div class="tyies-t">
                                <input type="text" class="order-query has_reset" id="search_input" value="${s}" maxlength="20" placeholder="订单号/商品名称/商品条码">
                                <input type="button" value="查询" class="order-btn" onclick="searchOrder();">

                            </div>
                        </li>
                    <#--页面样式调整-相应状态的可点击 Auth:zhangqiang Time:2015-11-19  End-->
                    </ul>
                </div>
            </div>
            <#--<div class="my_order_all">全部订单</div>-->
            <div class="tb-orders">

                <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                    <tbody class="myorder_tit">
                    <tr>
                        <th width="40%">订单信息</th>
                        <th width="12%" align="center">收货人</th>
                        <th width="12%" align="center">应付金额</th>
                        <th width="12%" align="center">
                            <select id="submitDate" name="" class="sele">
                                <#list dateSelect as ds>
                                    <option value="${ds.sd}" ed="${ds.ed}" <#if ds.selected == 'true' >selected="selected"</#if>>${ds.name}</option>
                                </#list>
                            </select>
                        </th>
                        <th width="12%" align="center">
                            <select id="orderState" name="" class="sele">
                                <#list orderStatusMapping?keys as orderStatusKey>
                                    <#if orderStatusKey != 'refunding'>
                                    <option value="${orderStatusKey}"
                                            <#if currStatus = orderStatusKey>selected</#if>>${orderStatusMapping[orderStatusKey]}</option>
                                    </#if>
                                </#list>
                            </select>
                        </th>
                        <th width="128">操作</th>
                    </tr>
        <#if orderList?? && orderList?size &gt; 0>
                 <#assign isShowRecive = 0>
                 <#list orderList as order>
                    <tr class="tr-th">
                        <td colspan="6" class="tb-order-tit">
                            <span class="tcol1">
                                订单编号:
                                <a name="orderIdLinks" id="idUrl${order.orderSn}" target="_blank"
                                   href="${base}/order/view/${order.id}.html">${order.orderSn}</a>
                            </span>
                        </td>
                    </tr>
                    <tr class="tr-td">
                        <td class="f-cb">
                        <#list orderItemList as orderitem>
                         <#if order.orderSn == orderitem.orderSn>
                             <#if orderitem.goodsId??>
                                 <#assign isShowRecive = 1>
                                    <div class="img-list f-fl">
                                                <a href="${base}/zcgoods/detail/${orderitem.goodsId}.html?whichclient=whichpc" target="_blank">
                                                <img src="${orderitem.pic}@50w_50h.png" title="${orderitem.goodsName}" height="50" width="50"></a>
                                    </div>
                                <#else>
                                     ${orderitem.goodsName}
                             </#if>
                         </#if>
                        </#list>
                        </td>
                        <td align="center">
                            <div class="u-name">${order.shipName}</div>
                        </td>
                        <td align="center">
                            ￥${order.totalAmount}<br>${order.paymentMethodName}<br>
                        </td>
                        <td align="center">
                            <span class="ftx-03">${order.createDate?string("yyyy-MM-dd")}
                                <br>${order.createDate?string("HH:mm:ss")}</span>
                            <input type="hidden" id="datasubmit-${order.id}"
                                   value="${order.createDate?string("yyyy-MM-dd")} ${order.createDate?string("HH:mm:ss")}">
                        </td>
                        <td align="center">
                            <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                <#if order.zhongChouStatus=='3'>
                                    <strong class="ftx-04 order-statu" state="ddfk">${orderStatusMapping['${order.orderStatus}']}</strong>
                                <#elseif order.zhongChouStatus=='4'>
                                    <strong class="ftx-04 order-statu" state="ddfk">众筹失败</strong>
                                <#else>
                                    众筹中
                                </#if>
                            <#else>
                                <span class="ftx-03">${orderStatusMapping['${order.orderStatus}']}</span>
                            </#if>
                            <br><br>
                            <#if '${order.isRefund }'== 'N'>
                                <a target="_blank" href="${base}/order/view/${order.id}.html">订单详情</a>
                                <#if '${order.orderStatus}' == 'wait_buyer_confirm_goods' || '${order.orderStatus}' == 'trade_finished'>
                                    <br/><br>
                                    <a href="javascript:;" onclick="showExpressLog('${order.id}');">查看物流</a><br><br>
                                </#if>
                            </#if>

                            <#if '${order.isRefund }'== 'Y'>
                                <a target="_blank" href="${base}/order/view/${order.id}.html">订单详情</a><br><br>
                                <#if '${order.orderStatus}' == 'wait_buyer_confirm_goods' || '${order.orderStatus}'=='wait_buyer_validate_goods' || '${order.orderStatus}' == 'trade_finished'>
                                    <a href="javascript:;" onclick="showExpressLog('${order.id}');">查看物流</a><br><br>
                                </#if>
                            </#if>

                        </td>
                        <td id="operate${order.orderSn}" class="order-doi" align="center" width="100">
                            <#if '${order.isRefund }'== 'N'>
                                <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                    <#--${order.zhongChouStatus}-->
                                    <#if order.zhongChouStatus=='3'>
                                        <#if order.endFlag=='1'>
                                            <a class="btn-4 pay_btn" id="pay_${order.id}" style="margin-left: 0px;display: none;"
                                               href="javascript:void(0)" onclick="judgeAuthReload('${base}','pay',btnClick.bind({},'pay_${order.id}'))"
                                               myurl="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}"><s></s>付&nbsp;款</a><br>
                                        </#if>
                                    </#if>
                                <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                                    <a href="javascript:void(0)" onclick="judgeAuthReload('${base}','confirmArrival',validateGoods.bind({},'${order.id}'));" class="btn-4 arrival_btn" style="margin-left: 0px;display: none;">确认到货</a><br/>
                                <#elseif '${order.orderStatus}' == 'trade_finished' && !order.quotationId??>
                                    <#--<#if '${order.isReview}' == '0'>
                                        &lt;#&ndash;当不是数据库中的商品时不支持评论。&ndash;&gt;
                                        <#if '${isShowRecive}' == 1>
                                            <a class="btn-4 review_btn" id="review_${order.id}"
                                               href="javascript:void(0)" onclick="judgeAuthReload('${base}','review',btnClick.bind({},'review_${order.id}'))"
                                               myurl="${base}/order/review.html?sn=${order.orderSn}" style="display: none;margin-left: 0px;">评&nbsp;价</a><br/>
                                        </#if>
                                    <#else >
                                        已评价<br/>
                                    </#if>-->
                                <#elseif '${order.orderStatus}' == 'unconfirm'>
                                    <#--<#if order.zhongChouStatus=='3'>
                                        <a href="${base}/order/popupcancel/${order.id}"
                                           title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" class="cancleOrder" style="display: none;"><span id="cancleOrder1_${order.id}">取消订单</span></a>
                                        <a href="javascript:void(0)" onclick="judgeAuthReload('${base}','cancleOrder',btnClick.bind({},'cancleOrder1_${order.id}','popup'))"
                                           title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" class="cancle_btn" style="display: none;">取消订单</a>
                                    </#if>-->
                                </#if>
                                <#--<a target="_blank" href="${base}/order/view/${order.id}.html">查看</a>-->
                                <#if (order.paymentMethodName == '在线支付' && order.orderStatus == 'wait_buyer_pay') || (order.paymentMethodName == '货到付款' && order.orderStatus == 'wait_seller_send_goods')>
                                <#-- <a href="javascript:void(0)" onclick="cancleOrder('${order.id}')">取消订单</a>-->
                                    <#--<#if order.zhongChouStatus=='3'>
                                        <a href="${base}/order/popupcancel/${order.id}"
                                           title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" class="cancleOrder" style="display: none;"><span id="cancleOrder2_${order.id}">取消订单</span></a>
                                        <a href="javascript:void(0)" onclick="judgeAuthReload('${base}','cancleOrder',btnClick.bind({},'cancleOrder2_${order.id}','popup'))"
                                           title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单取消申请" class="cancle_btn" style="display: none;">取消订单</a>
                                    </#if>-->
                                </#if>
                                <#--<#if '${order.paymentStatus}'== 'paid'>
                                    <a href="javascript:void(0)" onclick="checkurl('${order.orderSn}');">退款</a>
                                </#if>
                                <#if '${order.paymentStatus}'== 'refunding'>
                                    <a href="javascript:void(0)" id="${order.orderSn}" class="btn-4"  style="margin-left: 0px;"  onclick="confirmReceivables('${order.orderSn}');">确认收款</a>
                                </#if>-->
                                <#--订单状态为“等待买家验货”的订单  【wait_buyer_validate_goods】  添加申诉-->
                                <#if '${order.orderStatus}'== 'wait_buyer_validate_goods'>
                                    <a href="javascript:void(0)" class="btn-4 inspection_btn"
                                        <#if '${order.handleResultStatu}'=='untreated'>
                                            onclick="layer.alert('申诉还未处理,不能确认验货')" class="mybtn-disable" title="申诉还未处理,不能确认验货"
                                       <#else>
                                        onclick="judgeAuthReload('${base}','confirmInspection',confirmGoods.bind({},'${order.id}'))"</#if>   style="margin-left: 0px;display: none;">确认验货</a><br/>
                                    <#--<#if '${order.handleResultStatu}'=='0'>
                                        <a href="${base}/order/popupComplaint/${order.orderSn}"
                                           title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申诉"
                                           class="cancleOrder" style="display: none;">
                                            <span id="appeal2_${order.id}">申诉</span>
                                        </a>
                                        <a href="javascript:void(0)"
                                           onclick="judgeAuthReload('${base}','appeal',btnClick.bind({},'appeal2_${order.id}','popup'))"
                                           title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申诉" class="appeal_btn" style="display: none;">申诉</a>
                                    </#if>-->
                                </#if>
                               <#-- <#if '${order.handleResultStatu}'!='0'>
                                    <a href="${base}/order/lookComplaint/${order.orderSn}"
                                       title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查看申诉"
                                       class="cancleOrder" style="display: none;">
                                        <span id="appeal_d_${order.id}">查看申诉</span>
                                    </a>
                                    <a href="javascript:void(0)"
                                       onclick="judgeAuthReload('${base}','appeal',btnClick.bind({},'appeal_d_${order.id}','popup'))"
                                            title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查看申诉" class="appeal_btn" style="display: none;">查看申诉</a>
                                </#if>-->
                            <#--<#if '${order.paymentStatus}'== 'refunded'>
                                <a href="javascript:void(0)" >退款完成</a>
                            </#if>-->
                                <#--<#if '${order.orderStatus}' == 'wait_buyer_confirm_goods' || '${order.orderStatus}' == 'trade_finished'>-->
                                    <#--<br/>-->
                                    <#--<a href="javascript:;" onclick="showExpressLog('${order.id}');">物流信息</a>-->
                                <#--</#if>-->
                            </#if>
                            <!-- 20151210 退款单处理 -->
                            <#--<#if '${order.isRefund }'== 'Y'>
                                <#if order.orderRefund.status== 'refunded'>
                                    <a href="javascript:void(0)" id="${order.orderSn}"  class="btn-4"  style="margin-left: 0px;"  onclick="confirmReceivables('${order.orderSn}');">确认收款</a>
                                <#else>
                                    <#if order.refundCount &lt;=3 && !(order.currRefundId??)>
                                        <#if order.orderStatus == 'wait_buyer_confirm_goods'>
                                            <a href="javascript:void(0)" class="btn-4"  style="margin-left: 0px;" onclick="confirmGoods('${order.id}')">确认收货</a><br/>
                                        <#elseif order.orderStatus == 'trade_finished'  && !order.quotationId??>
                                            <#if order.isReview == '0'>
                                                <a href="${base}/order/review.html?sn=${order.orderSn}">评价</a><br/>
                                            <#else >
                                                已评价<br/>
                                            </#if>
                                        </#if>
                                    </#if>
                                    &lt;#&ndash;<a target="_blank" href="${base}/order/view/${order.id}.html">查看</a>&ndash;&gt;
                                    &lt;#&ndash;<#if '${order.orderStatus}' == 'wait_buyer_confirm_goods' || '${order.orderStatus}' == 'trade_finished'>&ndash;&gt;
                                        &lt;#&ndash;<a href="javascript:;" onclick="showExpressLog('${order.id}');">物流信息</a><br>&ndash;&gt;
                                    &lt;#&ndash;</#if>&ndash;&gt;
                                    <#if (order.refundCount &gt; 1 || order.refundCount == 1 ) && order.refundCount &lt;3 && !order.currRefundId?? >
                                        <a href="javascript:void(0)" onclick="nextRefund('${order.orderSn}');">退款</a>
                                    </#if>
                                    <a href="javascript:void(0)" onclick="refundList('${order.orderSn}');">退款单</a>
                                </#if>


                            </#if>-->
                        </td>
                    </tr>
                     <#assign isShowRecive = 0>
                    </#list>
                    <#else>
                    <tr>
                        <td colspan="6">

                            <div class="nocont-box nocont-order">
                                <b class="icon-order"></b>没有符合条件的订单！
                            </div>
                        </td>
                    </tr>
                    </#if>
                    </tbody>
                </table>
            </div>
            <div class="mymoney_pages f-cb">
                <div class="pagin fr">
                    <#if pager!false && pager.list?size &gt; 0>
                        <#import "bec/ghdj/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/order/list.html?yearS=${currYearS}&yearE=${currYearE}&status=${currStatus}&orderType_=1&s=${sOld}" />
                    <#else>
                        <div class="noRecord">你还没有订单！</div>
                    </#if>
                </div>
            </div>
            <dl class="faq">
                <dt>
                    <#list services as service>
                        <#if service["category"].sign == 'commonProblem'>
                            <#list service["articles"] as article>
                                <a href="${base}/help/question/${article.id}.html" target="_blank">更多&gt;</a>
                                <#break >
                            </#list>
                        </#if>
                    </#list>
                    <span>常见问题</span>
                </dt>
                <dd>
                    <ul>
                        <#list services as service>
                            <#if service["category"].sign == 'commonProblem'>
                                <#list service["articles"] as article>
                                    <li><a href="${base}/help/question/${article.id}.html" target="_blank" title="${article.title}">${article.title}</a></li>
                                    <#if article_index == 4><#break ></#if>
                                </#list>
                            </#if>
                        </#list>
                    </ul>
                </dd>

            </dl>

            </div>

        </div>
    </div>
</div>

<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).keyup(function(event) {
        if (event.keyCode == 13) {
            var st = $("#search_input").val();
            if($.trim(st) != ''){
                searchOrder();
            }
        }
    });
    $(function(){
        $(".cancleOrder").colorbox({iframe: true, innerWidth: 520, innerHeight: 350, opacity: 0.15});
        $("#submitDate").change(function () {
            searchOrder();
        });
        $("#orderState").change(function () {
            searchOrder();
        });


        //按钮权限检查
        initBtn();

        //常见问题
        var totalheight = 0;
        $(window).scroll( function() {
            totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());     //浏览器的高度加上滚动条的高度,减去底部高度
            if ($(document).height() <= totalheight)     //当文档的高度小于或者等于总的高度的时候，开始动态加载数据
            {
                $(".faq").css("bottom","525px");
            }else{
                $(".faq").css("bottom","51%");
            }
        });
    });
    /**
     * 显示物流信息
     * */
    function showExpressLog(orderId){
        var load=layer.load();
        //$("#expressLog").html("");
        //$("body").append("<div id='mask'></div>");
        //$("#mask").addClass("mask").fadeIn("slow");
        //$("#LoginBox").css("top",$(document).scrollTop()+150+"px");
        //$("#LoginBox").fadeIn("slow");
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

    function searchOrder(){
        var st = $("#orderState").val();

        var st = $("#orderState").val();

        var $year = $("#submitDate").find(":selected");
        if( $year.length <= 0 ){
            $year = $("#submitDate option:first");
        }
        var yearS = $year.val()==null ? '' : $year.val();
        var yearE = $year.attr("ed");

        var search_input = $.trim($("#search_input").val());
        if( search_input.length > 20){
            search_input = search_input.substring(0,20);
        }

        location.href = "${base}/order/list?status=" + st + "&orderType_=1&yearS="+yearS+"&yearE="+yearE+"&s="+encodeURI(encodeURI(search_input));
    }

    /**
     * 确认收货
     * @param orderId 订单Id
     */
    function confirmGoods(orderId) {
        layer.confirm('您确定要进行验货确认吗？', {icon: 3, title:'温馨提示'}, function(index){
            $.ajax({
                type: 'post',
                url: '${base}/order/confirmGoods/' + orderId,
                success: function (data) {
                    if (data.status == 'success') {
                        window.location.reload();
                    }
                }
            });
        });
    }

    /**
     * 确认到货
     * @param orderId 订单Id
     */
    function validateGoods(orderId) {
        layer.confirm('您确定要进行到货确认吗？', {icon: 3, title:'温馨提示'}, function(index){
            $.ajax({
                type: 'post',
                url: '${base}/order/validateGoods/' + orderId,
                success: function (data) {
                    if (data.status == 'success') {
                        window.location.reload();
                    }
                }
            });
        });
    }

    /**
     * 取消订单
     * @param orderId 订单Id
     */
    function cancleOrder(orderId,reason) {
        $("#orderpay").colorbox.close();
        $.ajax({
            type: 'post',
            url: '${base}/order/cancle/' + orderId + '/'+encodeURI(encodeURI(reason)),
            success: function (data) {
                if (data.status == 'success') {
                    window.location.reload();
                } else {
                    layer.alert(data.message, {icon: 3, title: "温馨提示"});
                    window.location.reload();
                }
            }
        });
    }

    function cancleOrderError(){
        $("#orderpay").colorbox.close();
    }

    /**
     * 删除订单
     * @param orderId
     */
    function deleteOrder(orderId) {
        layer.confirm('您确定要删除订单吗？', {icon: 3, title:'温馨提示'}, function(index){
            $.ajax({
                type: 'post',
                url: '${base}/order/delete/' + orderId,
                success: function (data) {
                    if (data.status == 'success') {
                        window.location.reload();
                    }
                }
            });
            layer.close(index);
        });
    }

    function checkurl(orderSn){
        $.ajax({
            type: "POST",
            url: "${base}/member/refund/refundurl/"+orderSn,
            datatype: 'json',
            success: function(data) {
                var t=data.status;
                var s=data.refundstatus;
                var type=data.type;
                var refundId=data.refundId;
                if (t == "success") {
                    if(type="unreceived"){
                        if(s == 'commit' || s == 'confirmed'||s == 'unrefund' || s == 'returned'){
                            window.location.href ="${base}/member/refund/applyfillwl/" + orderSn+ ".html";
                        } else {
                            window.location.href ="${base}/member/refund/apply/" + orderSn + ".html";
                        }
                    }
                    if(type="received"){
                        if(s == 'commit' ||s == 'returned'){
                            window.location.href =
                                    "${base}/member/refund/applyfillwl/" + orderSn+ ".html";
                        } else {
                            window.location.href =
                                    "${base}/member/refund/refundsuccess/" + orderSn + ".html";
                        }
                    }
                }else{
                    window.location.href =
                            "${base}/member/refund/apply/" + orderSn + ".html";
                }
            }
        });
    }

    function refundList(orderSn){
        window.location.href ="${base}/member/refund/list.html?orderSn=" + orderSn;
    }

    /**
     * 买家确认收到退款
     * @param {string} orderId 订单Id
     */
    var clickAllow = "true";
    function confirmReceivables(orderSn) {
        if(clickAllow=="true"){
            clickAllow = "false";
            layer.confirm('您确认收款?',{icon:3},function(index){
                        $.ajax({
                            type: 'post',
                            url: '${base}/member/refund/receivableupdate/' + orderSn + '.html',
                            success: function (data) {
                                if (data.status == 'success') {
                                    location.reload();
                                }else{
                                    clickAllow = "true";
                                }
                            }
                        });
                        layer.close(index);
                    },
                    function(index){
                        clickAllow = "true";
                        layer.close(index);
                    });
        }

    }

    /**
     * Desc:点击 全部订单-便利提醒-订单状态显示相关状态的 订单
     * Auth:zhangqiang
     * Time:2015-11-19 10:39:46
     */
    function submitOrderState(state){
        var $year = $("#submitDate");
        var yearS = $year.val();
        if(isEmpty(yearS)){
            yearS = "";
        }
        var yearE = $year.find(":selected").attr("ed");
        if(isEmpty(yearE)){
            yearE = "";
        }
        location.href = "${base}/order/list?status=" + state + "&orderType_=1&yearS="+yearS+"&yearE="+yearE;
    }

    /**
     * 判断是否是空
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
     * 退款单驳回
     * @param orderSn 退款单号
     */
    function nextRefund(orderSn){
        $.ajax({
            type: "POST",
            url: "${base}/member/refund/refundurl/"+orderSn,
            datatype: 'json',
            success: function(data) {
                var size = data.size;
                if(size>=3){
                    layer.alert('驳回三次，不能进行此操作', {icon: 2, title: '温馨提示'});
                    return false;
                }else{
                    window.location.href="${base}/member/refund/apply/"+ orderSn +".html";
                }
            }
        });
    }
    /**
     * 订单验货申诉
     * yuech
     * @param orderId 订单Id
     * reason 申诉内容
     */
    function orderComplaint(orderId,reason) {
        $("#orderpay").colorbox.close();
        $.ajax({
            type: 'post',
            url: '${base}/order/complaint/' + orderId + '/'+encodeURI(encodeURI(reason)),
            success: function (data) {
                if (data.status == 'success') {
                    window.location.reload();
                } else {
                    layer.alert(data.message, {icon: 3, title: "温馨提示"});
                    window.location.reload();
                }
            }
        });
    }
    function cancleComplaint(){
        $("#orderpay").colorbox.close();
    }


    function initBtn(){
        //取消订单
        judgeBtnAuth('${base}', 'cancleOrder', 'cancle_btn');
        //付款
        judgeBtnAuth('${base}', 'pay', 'pay_btn');
        //确认到货
        judgeBtnAuth('${base}', 'confirmArrival', 'arrival_btn');
        //确认验货
        judgeBtnAuth('${base}', 'confirmInspection', 'inspection_btn');
        //申诉
        judgeBtnAuth('${base}', 'appeal', 'appeal_btn');
        //评价
        judgeBtnAuth('${base}', 'review', 'review_btn');
    }

    function btnClick(btnId, isPopup){
        if( isPopup == 'popup'){
            $("#"+ btnId).trigger("click");
        }else{
            var page = window.open($("#"+ btnId).attr("myurl"), "_blank");
            if(page == null){
                window.location.href = $("#"+ btnId).attr("myurl");
            }
        }
    }
</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>