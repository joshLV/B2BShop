<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
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
    /* æ”¯ä»˜ */
    .btn{display: block; width: 76px; height: 24px; line-height: 24px; background: #db0000;border-radius: 3px;color: #ffffff !important; margin-left:35px;}
    .btn:hover{background: #ed4548;}
    .bltx-color{color: #DB0000;}
</style>

<div id="container" class="f-cb">
    <#include "bec/ghj/top.ftl"/>
    <script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <div class="member_content f-cb" style="position: relative;">
        <div class="breadcrumbs">
            <span>æ‚¨å½“å‰çš„ä½ç½®ï¼š</span><strong><a href="${base}/member/index.html">ä¼šå‘˜ä¸­å¿ƒ</a> > <a href="${base}/order/list.html?orderType_=1">è®¢å•ä¸­å¿ƒ</a></strong><span>&nbsp;&gt;&nbsp;ä¼—ç­¹è®¢å•<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <!-- leftMenu-->
            <#--<#include "bec/ghj/member/leftmenu.ftl"/>-->
            <#import "bec/ghj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="ol2"/>
            <!--leftMenu end-->
        </div>
        <div class="member_right">
            <div class="my_order">

                <div class="my_orders">
                    <ul class="myOderNav list_tab">
                    <#--é¡µé¢æ ·å¼è°ƒæ•´-ç›¸åº”çŠ¶æ€çš„å¯ç‚¹å‡» Auth:zhangqiang Time:2015-11-19  Start-->
                        <li><strong class="ftx-04" style="color: #DB0000; border-bottom: 2px solid #DB0000; width:60px; text-align: center;  height: 38px; display: block;">å…¨éƒ¨è®¢å•</strong></li>

                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('wait_buyer_pay_deposit')" <#if orderStates = 'wait_buyer_pay_deposit'>class="bltx-color"</#if> >
                                    å¾…ä»˜å®šé‡‘(${orderFuDingJin})
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('wait_buyer_pay')" <#if orderStates = 'wait_buyer_pay'>class="bltx-color"</#if> >
                                    å¾…ä»˜æ¬¾(${orderFuKuanCount})
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('wait_seller_send_goods')" <#if orderStates = 'wait_seller_send_goods'>class="bltx-color"</#if>>
                                    å¾…å‘è´§(${orderFaHuoCount})
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('wait_buyer_confirm_goods')" <#if orderStates = 'wait_buyer_confirm_goods'>class="bltx-color"</#if>>
                                    å¾…ç¡®è®¤æ”¶è´§(${orderConfirmCount})
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('wait_buyer_validate_goods')" <#if orderStates = 'wait_buyer_validate_goods'>class="bltx-color"</#if>>
                                    å¾…ç¡®è®¤éªŒè´§(${orderValidateCount})
                                </a>
                            </div>
                        </li>
                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('trade_finished')" <#if orderStates = 'trade_finished'>class="bltx-color"</#if>>
                                    äº¤æ˜“å®Œæˆ(${orderOverCount})
                                </a>
                            </div>
                        </li>
                        <li style="float: right;">
                            <div class="tyies-t">
                                <input type="text" class="order-query has_reset" id="search_input" value="${s}" maxlength="20" placeholder="è®¢å•å·/å•†å“åç§°/å•†å“æ¡ç ">
                                <input type="button" value="æŸ¥è¯¢" class="order-btn" onclick="searchOrder();">

                            </div>
                        </li>
                    <#--é¡µé¢æ ·å¼è°ƒæ•´-ç›¸åº”çŠ¶æ€çš„å¯ç‚¹å‡» Auth:zhangqiang Time:2015-11-19  End-->
                    </ul>
                </div>
            </div>
            <#--<div class="my_order_all">å…¨éƒ¨è®¢å•</div>-->
            <div class="tb-orders">

                <table width="100%" border="0" cellspacing="0" cellpadding="0" >
                    <tbody class="myorder_tit">
                    <tr>
                        <th width="40%">è®¢å•ä¿¡æ¯</th>
                        <th width="12%" align="center">æ”¶è´§äºº</th>
                        <th width="12%" align="center">åº”ä»˜é‡‘é¢</th>
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
                                    <#if orderStatusKey == "">
                                        <option value="wait_buyer_pay_deposit" <#if currStatus = 'wait_buyer_pay_deposit'>selected</#if>>ç­‰å¾…æ”¯ä»˜å®šé‡‘</option>
                                    </#if>
                                    </#if>
                                </#list>
                            </select>
                        </th>
                        <th width="128">æ“ä½œ</th>
                    </tr>
        <#if orderList?? && orderList?size &gt; 0>
                 <#assign isShowRecive = 0>
                 <#list orderList as order>
                    <tr class="tr-th">
                        <td colspan="6" class="tb-order-tit">
                            <span class="tcol1">
                                è®¢å•ç¼–å·:
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
                            ï¿¥${order.totalAmount}
                            <#if order.depositMoney?? && order.depositMoney &gt; 0><br>ï¼ˆ<font color="red">å®šé‡‘ï¼šï¿¥${order.depositMoney}</font>ï¼‰</#if>
                            <br>${order.paymentMethodName}<br>
                        </td>
                        <td align="center">
                            <span class="ftx-03">${order.createDate?string("yyyy-MM-dd")}
                                <br>${order.createDate?string("HH:mm:ss")}</span>
                            <input type="hidden" id="datasubmit-${order.id}"
                                   value="${order.createDate?string("yyyy-MM-dd")} ${order.createDate?string("HH:mm:ss")}">
                        </td>
                        <td align="center">
                            <#if '${order.orderStatus}' == 'wait_buyer_pay' || '${order.orderStatus}' == 'wait_buyer_pay_deposit' || '${order.orderStatus}' == 'unconfirm'>
                                <#if order.zhongChouStatus=='3'>
                                    <strong class="ftx-04 order-statu" state="ddfk">${orderStatusMapping['${order.orderStatus}']}</strong>
                                <#elseif order.zhongChouStatus=='4'>
                                    <strong class="ftx-04 order-statu" state="ddfk">ä¼—ç­¹å¤±è´¥</strong>
                                <#else>
                                    ä¼—ç­¹ä¸­
                                </#if>
                            <#else>
    ï»¿/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.plugins.setLang( 'a11yhelp', 'he',
{
	accessibilityHelp :
	{
		title : '×”×•×¨××•×ª × ×’×™×©×•×ª',
		contents : '×”×•×¨××•×ª × ×’×™×©×•×ª. ×œ×¡×’×™×¨×” ×œ×—×¥ ××¡×§×™×™×¤ (ESC).',
		legend :
		[
			{
				name : '×›×œ×œ×™',
				items :
						[
							{
								name : '×¡×¨×’×œ ×”×›×œ×™×',
								legend:
									'×œ×—×¥ ×¢×œ ${toolbarFocus} ×›×“×™ ×œ× ×•×•×˜ ×œ×¡×¨×’×œ ×”×›×œ×™×. ×¢×‘×•×¨ ×œ×›×¤×ª×•×¨ ×”×‘× ×¢× ××§×© ×”×˜××‘ (TAB) ××• ×—×¥ ×©×××œ×™. ×¢×‘×•×¨ ×œ×›×¤×ª×•×¨ ×”×§×•×“× ×¢× ××§×© ×”×©×™×¤×˜ (SHIFT) + ×˜××‘ (TAB) ××• ×—×¥ ×™×× ×™. ×œ×—×¥ ×¨×•×•×— ××• ×× ×˜×¨ (ENTER) ×›×“×™ ×œ×”×¤×¢×™×œ ××ª ×”×›×¤×ª×•×¨ ×”× ×‘×—×¨.'
							},

							{
								name : '×“×™××œ×•×’×™× (×—×œ×•× ×•×ª ×ª×©××•×œ)',
								legend :
									'×‘×ª×•×š ×“×™××œ×•×’, ×œ×—×¥ ×˜××‘ (TAB) ×›×“×™ ×œ× ×•×•×˜ ×œ×©×“×” ×”×‘×, ×œ×—×¥ ×©×™×¤×˜ (SHIFT) + ×˜××‘ (TAB) ×›×“×™ ×œ× ×•×•×˜ ×œ×©×“×” ×”×§×•×“×, ×œ×—×¥ ×× ×˜×¨ (ENTER) ×›×“×™ ×œ×©×œ×•×— ××ª ×”×“×™××œ×•×’, ×œ×—×¥ ××¡×§×™×™×¤ (ESC) ×›×“×™ ×œ×‘×˜×œ. ×‘×ª×•×š ×“×™××œ×•×’×™× ×‘×¢×œ×™ ××¡×¤×¨ ×˜××‘×™× (×œ×©×•× ×™×•×ª), ×œ×—×¥ ××œ×˜ (ALT) + F10 ×›×“×™ ×œ× ×•×•×˜ ×œ×©×•×¨×ª ×”×˜××‘×™×. × ×•×•×˜ ×œ×˜××‘ ×”×‘× ×¢× ×˜××‘ (TAB) ××• ×—×¥ ×©×××œ×™. ×¢×‘×•×¨ ×œ×˜××‘ ×”×§×•×“× ×¢× ×©×™×¤×˜ (SHIFT) + ×˜××‘ (TAB) ××• ×—×¥ ×©×××œ×™. ×œ×—×¥ ×¨×•×•×— ××• ×× ×˜×¨ (ENTER) ×›×“×™ ×œ×”×™×›× ×¡ ×œ×˜××‘.'
							},

							{
								name : '×ª×¤×¨×™×˜ ×”×”×§×©×¨ (Context Menu)',
								legend :
									'×œ×—×¥ ${contextMenu} ××• APPLICATION KEY×›×“×™ ×œ×¤×ª×•×— ××ª ×ª×¤×¨×™×˜ ×”×”×§×©×¨. ×¢×‘×•×¨ ×œ××¤×©×¨×•×ª ×”×‘××” ×¢× ×˜××‘ (TAB) ××• ×—×¥ ×œ××˜×”. ×¢×‘×•×¨ ×œ××¤×©×¨×•×ª ×”×§×•×“××ª ×¢× ×©×™×¤×˜ (SHIFT) + ×˜××‘ (TAB) ××• ×—×¥ ×œ××¢×œ×”. ×œ×—×¥ ×¨×•×•×— ××• ×× ×˜×¨ (ENTER) ×›×“×™ ×œ×‘×—×•×¨ ××ª ×”××¤×©×¨×•×ª. ×¤×ª×— ××ª ×ª×ª ×”×ª×¤×¨×™×˜ (Sub-menu) ×©×œ ×”××¤×©×¨×•×ª ×”× ×•×›×—×™×ª ×¢× ×¨×•×•×— ××• ×× ×˜×¨ (ENTER) ××• ×—×¥ ×©×××œ×™. ×—×–×•×¨ ×œ×ª×¤×¨×™×˜ ×”××‘ ×¢× ××¡×§×™×™×¤ (ESC) ××• ×—×¥ ×©×××œ×™. ×¡×’×•×¨ ××ª ×ª×¤×¨×™×˜ ×”×”×§×©×¨ ×¢× ××¡×§×™×™×¤ (ESC).'
							},

							{
								name : '×ª×¤×¨×™×˜×™× ×¦×¤×™× (List boxes)',
								legend :
									'×‘×ª×•×š ×ª×¤×¨×™×˜ ×¦×£, ×¢×‘×•×¨ ×œ×¤×¨×™×˜ ×”×‘× ×¢× ×˜××‘ (TAB) ××• ×—×¥ ×œ××˜×”. ×¢×‘×•×¨ ×œ×ª×¤×¨×™×˜ ×”×§×•×“× ×¢× ×©×™×¤×˜ (SHIFT) + ×˜××‘ (TAB) or ×—×¥ ×¢×œ×™×•×Ÿ. Press SPACE or ENTER to select the list option. Press ESC to close the list-box.'
							},

							{
								name : '×¢×¥ ××œ×× ×˜×™× (Elements Path)',
								legend :
									'×œ×—×¥ ${elementsPathFocus} ×›×“×™ ×œ× ×•×•×˜ ×œ×¢×¥ ×”××œ×× ×˜×™×. ×¢×‘×•×¨ ×œ×¤×¨×™×˜ ×”×‘× ×¢× ×˜××‘ (TAB) ××• ×—×¥ ×™×× ×™. ×¢×‘×•×¨ ×œ×¤×¨×™×˜ ×”×§×•×“× ×¢× ×©×™×¤×˜ (SHIFT) + ×˜××‘ (TAB) ××• ×—×¥ ×©×××œ×™. ×œ×—×¥ ×¨×•×•×— ××• ×× ×˜×¨ (ENTER) ×›×“×™ ×œ×‘×—×•×¨ ××ª ×”××œ×× ×˜ ×‘×¢×•×¨×š.'
							}
						]
			},
			{
				name : '×¤×§×•×“×•×ª',
				items :
						[
							{
								name : ' ×‘×™×˜×•×œ ×¦×¢×“ ××—×¨×•×Ÿ',
								legend : '×œ×—×¥ ${undo}'
							},
							{
								name : ' ×—×–×¨×” ×¢×œ ×¦×¢×“ ××—×¨×•×Ÿ',
								legend : '×œ×—×¥ ${redo}'
							},
							{
								name : ' ×”×“×’×©×”',
								legend : '×œ×—×¥ ${bold}'
							},
							{
								name : ' ×”×˜×™×™×”',
								legend : '×œ×—×¥ ${italic}'
							},
							{
								name : ' ×”×•×¡×¤×ª ×§×• ×ª×—×ª×•×Ÿ',
								legend : '×œ×—×¥ ${underline}'
							},
							{
								name : ' ×”×•×¡×¤×ª ×œ×™× ×§',
								legend : '×œ×—×¥ ${link}'
							},
							{
								name : ' ×›×™×•×•×¥ ×¡×¨×’×œ ×”×›×œ×™×',
								legend : '×œ×—×¥ ${toolbarCollapse}'
							},
							{
								name : ' ×”×•×¨××•×ª × ×’×™×©×•×ª',
								legend : '×œ×—×¥ ${a11yHelp}'
							}
						]
			}
		]
	}
});
                                                                                                                                                                                       ï»¿/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

/**
 * @fileOverview The "placeholder" plugin.
 *
 */

(function()
{
	var placeholderReplaceRegex = /\[\[[^\]]+\]\]/g;
	CKEDITOR.plugins.add( 'placeholder',
	{
		requires : [ 'dialog' ],
		lang : [ 'bg', 'cs', 'cy', 'da', 'de', 'el', 'en', 'eo', 'et', 'fa', 'fi', 'fr', 'he', 'hr', 'it', 'nb', 'nl', 'no', 'pl', 'pt-br', 'tr', 'ug', 'uk', 'vi', 'zh-cn' ],
		init : function( editor )
		{
			var lang = editor.lang.placeholder;

			editor.addCommand( 'createplaceholder', new CKEDITOR.dialogCommand( 'createplaceholder' ) );
			editor.addCommand( 'editplaceholder', new CKEDITOR.dialogCommand( 'editplaceholder' ) );

			editor.ui.addButton( 'CreatePlaceholder',
			{
				label : lang.toolbar,
				command :'createplaceholder',
				icon : this.path + 'placeholder.gif'
			});

			if ( editor.addMenuItems )
			{
				editor.addMenuGroup( 'placeholder', 20 );
				editor.addMenuItems(
					{
						editplaceholder :
						{
							label : lang.edit,
							command : 'editplaceholder',
							group : 'placeholder',
							order : 1,
							icon : this.path + 'placeholder.gif'
						}
					} );

				if ( editor.contextMenu )
				{
					editor.contextMenu.addListener( function( element, selection )
						{
							if ( !element || !element.data( 'cke-placeholder' ) )
								return null;

							return { editplaceholder : CKEDITOR.TRISTATE_OFF };
						} );
				}
			}

			editor.on( 'doubleclick', function( evt )
				{
					if ( CKEDITOR.plugins.placeholder.getSelectedPlaceHoder( editor ) )
						evt.data.dialog = 'editplaceholder';
				});

			editor.addCss(
				'.cke_placeholder' +
				'{' +
					'background-color: #ffff00;' +
					( CKEDITOR.env.gecko ? 'cursor: default;' : '' ) +
				'}'
			);

			editor.on( 'contentDom', function()
				{
					editor.document.getBody().on( 'resizestart', function( evt )
						{
							if ( editor.getSelection().getSelectedElement().data( 'cke-placeholder' ) )
								evt.data.preventDefault();
						});
				});

			CKEDITOR.dialog.add( 'createplaceholder', this.path + 'dialogs/placeholder.js' );
			CKEDITOR.dialog.add( 'editplaceholder', this.path + 'dialogs/placeholder.js' );
		},
		afterInit : function( editor )
		{
			var dataProcessor = editor.dataProcessor,
				dataFilter = dataProcessor && dataProcessor.dataFilter,
				htmlFilter = dataProcessor && dataProcessor.htmlFilter;

			if ( dataFilter )
			{
				dataFilter.addRules(
				{
					text : function( text )
					{
						return text.replace( placeholderReplaceRegex, function( match )
							{
								return CKEDITOR.plugins.placeholder.createPlaceholder( editor, null, match, 1 );
							});
					}
				});
			}

			if ( htmlFilter )
			{
				htmlFilter.addRules(
				{
					elements :
					{
						'span' : function( element )
						{
							if ( element.attributes && element.attributes[ 'data-cke-placeholder' ] )
								delete element.name;
						}
					}
				});
			}
		}
	});
})();

CKEDITOR.plugins.placeholder =
{
	createPlaceholder : function( editor, oldElement, text, isGet )
	{
		var element = new CKEDITOR.dom.element( 'span', editor.document );
		element.setAttributes(
			{
				contentEditable		: 'false',
				'data-cke-placeholder'	: 1,
				'class'			: 'cke_placeholder'
			}
		);

		text && element.setText( text );

		if ( isGet )
			return element.getOuterHtml();

		if ( oldElement )
		{
			if ( CKEDITOR.env.ie )
			{
				element.insertAfter( oldElement );
				// Some time is required for IE before the element is removed.
				setTimeout( function()
					{
						oldElement.remove();
						element.focus();
					}, 10 );
			}
			else
				element.replace( oldElement );
		}
		else
			editor.insertElement( element );

		return null;
	},

	getSelectedPlaceHoder : function( editor )
	{
		var range = editor.getSelection().getRanges()[ 0 ];
		range.shrink( CKEDITOR.SHRINK_TEXT );
		var node = range.startContainer;
		while( node && !( node.type == CKEDITOR.NODE_ELEMENT && node.data( 'cke-placeholder' ) ) )
			node = node.getParent();
		return node;
	}
};
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ÿØÿà JFIF   d d  ÿì Ducky     P  ÿî Adobe dÀ   ÿÛ „ 		

					ÿÀ " ÿÄ å             	
            
	 !1AQa"2q‘¡BR#3	±Áb4Ñr‚’$56ğáñÂÒCScV7¢s“Ód”Ô8T%ÕW²ƒ£³Dt¤´Uu…•&F–—X9 	   !1AQaq‘"2¡±ÁÑBğR#3ábr‚’STñ¢²ÂÒC$4sòƒ%5ÿÚ   ? öÃÈW–ZµHıK˜’Bé¢(v„ÒŸ!Q–()òĞƒHıNIBHòä9Pi¢)jÂY?¢*pÈÀiB– G¦œ(ÔM)òd‰ ÒŸ!D‘t§ÈQ#åJ|…A±¤&‘~Â‰J|…)	¤y
i€ÑÛ !?¢?
ŒH@iIüÑøPĞ¤~ˆ¨¶(B|R/K˜ 4#ôE)ÔbéOèÂ“`Sä)È@ºG¦„Sä) )ıM¹@Sä*/@)ò iO§]BÒŸ!R˜„ùÂ“a¤şhü*+ˆ¥?¢?
“ ÒŸ!Ba¥>Cğ¦¡dùÂˆa iOèÂœ0)ıøTSú#ğ A¥?¢?
z€iOèÂš•!&Şèü*hR…(OèÂ…Ä”‘úœ„	¡¢)ôĞ:Ø~„Sú"‰Bè§òRæJä*((OK$~j14Ñ)hŒ	¡'²>V¦¤M@$öH=û.ô6j²¹¼	·ÍæqØv£‹¾¹²Yc@µî µ:{)%=ƒÔh7ËœJë¬²ß&mU;%AÛıëî)]’›¹ÔŸ*Ÿ#îd‚ÑeöQ":Û“ÏÙÈeIqµöI)?. ÊÃ`ô	{tï@ĞiMÒ?
‡a¥?¢?
VbH4§ôGáQSú#ğ¡ iOèÂ‰`Sú#ğ¦˜”şˆü)€Y¢?
b‘j¦Z}Ôõ%ÀZˆ”u
|¤B€
9…M6Tä$Z
Z¡R…$‚‚aB
‹ ¤Ğ¤/M lP	¦Á¦’p0ÓG2]&„%.A…EÖ (€
 €
 (@Ø ¯…N! ¶&«`.š`-­í©$ #·…&i5†‘ãL	Â¥Ì(Âı©¦U0°ò ÂšI©UM&¦Bµ)&¥1j%Å¨´Oº€´ _Î” µ€P	è?`'ñ¨‚DÎ¿Qkôù·›Ëï|‚åår	Wösgã‚^Éd\Gıdş­»‹)Õû©ş’½Ú¾˜İØrÉäÇ%}h}Fò¦/’Úï+‹¶œu¥„cğÇT’—B‚S*zÒ«¢áA!(ìli¦QÇiuqèyï“¹¦¼ôıÕ¼rYsĞû¯ËqbÖN·^66:“ZÒÈ àdIz4gP§qM©öÚ}ĞIı$Ù6IöŠrKœmõ'ËœO’7aoŒÆ†ßÃüÁ“} Ü¥Ør½F–	ê{UVÇ[q@áñ=†únş$;7’¦ã¶o.D±·Dí,ã·CD£5Ók!à¢£Å ’Qç£¥òeÛµª#Ë§Ô5¨(ô#­ïÖàöñ½eZaQd *+PzJ§¸¢BŸ lKR’%Ui
 /åA
’-‰SÂ!B«c
HAM!‰R Å¡ L<i@H”äBÒR=›0QÀ&E¨ñ7ëRBâTé ¬T,4Å¨€Q À)¦PÜ€µ*#
 P	§Õ4 
­jLî©-j.À'_e@¦ EMZƒ©èh íS zMZ „*ëaS¨ÀÓ`Sk~ZKˆt·Zô=-@¤Q RE© —¦ "ã½ååŞ€ ¯¨®tÛÿ Oœc•ß¹–Ñ;$T m=¾T¼Mä©L°	ê’ãŠ
MK9˜™EåïËÏ'¼·mÜ¾w,åå<56ÒoÕ±'öL¶’‘r<ïrzjª«BÄÎ½ƒ·ÕéŠlé*b;™ÅqHB\p±@”¥@Ûâ6'µ¯Ş²ŞË™3Me¨9·œ~"UKˆ«Q¾†›uK$ÿ Ó„ºT}¦¶+w™,¡”eö›y†İ‘l·ÕéêF½H?¢/÷
›Z	2Ë¢f9å±(¬-»¥(q  ÛÇ° ıÕ[E’†èÈ:ÚÒ­¢º’	x±÷êëö‚Eæ=»ş_XRór±œÈù5ÍuÆT4Üò×úâ[ıÕ%J=I,“×ó;i¶Ö.Ô&»OcmogKÛÇ§~ÊÀÜ
E©×‰¨T›HPÂ—0@Za@T
Œ‡(Q%ö°Tˆsjp)Ô7 %À%yhb„…4˜¤J’‘mQæ˜‚„Ó ¤5Ä,M™]…2-‹jR8
OQ¤-B@(
$€
 *P]<¨å\^Ö£–T²“)Û@
iBTlÀ*,4Cb
r iBj6¤(¸©ÕÀ1/¤
”HŠª  (W=G•M( Z‡¨	ñ}Ô$TÀN:w¦Ÿe 'ÛÖ€)ésH±û¨O~¾û=¿uFî?Äß–UºyªÅ™lãÚjLmWC™|£MÊ}e7)Qm…2ÚOæ’à®†ÕEg¼g}Öİ˜Ü‰@ºÊV=8É6Ö¥ƒWSß§N¦¯d¨µ=wØ;^~ùúqËáÜÆ±++	Ñ/M€†AnÁO`H¸=Ís2åUgF˜›<è™°²˜œÄÖçãÃ=ÂûjBîB¤¨CúB·bË[)LË›«ÔÚdsÍâ`†ÚR £ŞMõ!D~pò­
ÈÍÉ©Îû’r§Èuç.V¢n‚oßÄğÒ³‘´0)Jî›÷ñğü<ißmÜŞS™Æçp²Ü‡—ÄJfn6RTP¦äÇXq—ì¤õó¥¡’©õáÁü™¸`òl4†ÿ µx¨ò§³ÓõS4JI·Ãï¥W’¸ù«Ëh Jµ!jOP¡0¦Ií
\£æ
±$Æ4Ò‘‰Qzó_0m~ãœÇ&oó¦`ğÏDŒä,chv[ÏM}1Ùm–Ö¶Ò¢V±ùÕ<xŞKr¡û´ş©·õú¹ôùƒÚQSµ1;MÇ–ÏHSÉÉGqqc>¸î2.ÚT…ÊBH¿\ğ*âçoY	[Óëoé—dd÷VÚÌr¾*>íÚ®Í?RòÜFF´*1Ğ‚
ƒ©Ğl{ÑM¾K$ã@“™şœÿ ‰>ÂŞkpä>¡w.×ãÂÆM¶¶æe•;²·^õ÷¼:Eˆğ«òí_¸›’íÍÓİ»_¼öìôäöÖ{ŞW“m*	~Íú­º„¨YH7+-¥8a¿üC~X}æŞöZ˜qM©hÚ™e$”	J„{mĞÖË_À„º¿‰¾dÙûwgíçåñT†c¯zårX\¢3Ì¬¸ê¤pS¥jÙI-º‰:{N»?u·Ä$Ïñúw ’Îø u'û%—ÿ Ùê–¿‡´‰ÕÙDÂcxÚG)9&şŒÏŒ{0İVIqıY-¦%ƒª‡@‚/~•J£˜•¿÷üâÏş®ù?ÿ íiuå­Ş½£DÊßÄ±ì6ôØ{xï&æ?.âêoub&ÆÈúnHİÑ[u
tè
"àİVÆ¬¦ÖSm³ O×ïøqß([Ãÿ åYuWåíŞ½¡2O\1Îûkœbç¦m­¹¹°1öóÌ±)[æ4ºãÉ+”»Õa#¹¯UäÆéÄ‰f¾¿ş’¶şk-·²Ü®Ì|¶tŒnN:qóœÉŠê™uhd¥@-$]$ƒáOò¹”‰Ê9WüP¶´ş|Ÿ·gJÁí¿§ø>¿Êï™±'»•œh%²Ó-¨z~³ª¸kİBMú‘W~Mª8Rt·ÿ d_èëÿ ­Öÿ şÿ ÌUg—¸rts—sÎ-¸ø«riğØIÃ’œ#?(’¦ƒÚ }*÷ÇO
§&+cq` ?¨oªËÅÙÁ|7³ö¾?qd¹^Pg&ôçBâ6ô¶cGS)o¢Š®é:¿DU¸p+ÕÙ¾ Øïçßªí¹À[£µò<i¾÷ôœ´‘v><¸ñÑê–ÒÛëzCZ€Ô ¥<X~b™H$çŒ¯ñ>ãM¿¹™ŞåŒ,WWéµ&~7_})S™‚}‚­[6ûP¤éß¦Ÿ©í£õE‚İfmmÅ·1{Z{8é/gÛŠßÌ¼óEßôsD€ €,¢H±éUåÄñ¸cNN”ªÆ äÛQªÔ¬Ô˜U`
ˆ4Ô„'µ •‰@ĞR´À/Bbh‰ó©7"b•6¨Rå  Ş¤Ğ?¶ô ·¸¥,§JIˆZÊJ¬{Pköñ¤v6íQlE%M¶,6ÃC[î ”£©$ÀsQrÆ|ƒs>znôåBÜò]L©{£sdòKq±t~ºJ½ /Ô¤a÷W^íQbGJpGÓk3&W=BeÅ$–İ[
?
€î³â€E¿8şms·{å]ØÙìœ³Ú¾:Ø6îß‡‹…2Ò@Õ­)+P°Ôéâ<<r“wâtmZÕègnÙ{
ãe1L¾ÒÁ›¥iEÇæ_ŞOØ’*õGMjÈ,‰ée(âFú
Áå›ö×Ï=…xÜ¦à¿’:X’ìºªuê9qüZ‘¶ÃNròÏÒW2qè‘'û<w&!€T©¸“ë8”ş’™ø­í­Øz¦,Œçî:^J)¯¼¾“¦G[Nº—¦l‹)'µ–“b-í®Šrr¬¹tz2¸}TT.~ä¯a£€Ò>ƒ?„şö‘—âó±¥¼•«gn/|mÆÊ¶Z•sã%”øÕÏİÕó&BèõR³$D(z •0§À‘Ä*R ¤‘`T¤APr0 >>¯6æ[ê#’x—é[eÄÃ9)­óÌ{‘„”#ƒaN±	!â
C¯¼‡Iï©±áÔkÛµ<Ğˆ³ÏO¥ş,Úù^GúŠåÌÆëä[[€s1×ˆw.DœÖtCÈent.keyCode == 13) {
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


        //æŒ‰é’®æƒé™æ£€æŸ¥
        initBtn();

        //å¸¸è§é—®é¢˜
        var totalheight = 0;
        $(window).scroll( function() {
            totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());     //æµè§ˆå™¨çš„é«˜åº¦åŠ ä¸Šæ»šåŠ¨æ¡çš„é«˜åº¦,å‡å»åº•éƒ¨é«˜åº¦
            if ($(document).height() <= totalheight)     //å½“æ–‡æ¡£çš„é«˜åº¦å°äºæˆ–è€…ç­‰äºæ€»çš„é«˜åº¦çš„æ—¶å€™ï¼Œå¼€å§‹åŠ¨æ€åŠ è½½æ•°æ®
            {
                $(".faq").css("bottom","525px");
            }else{
                $(".faq").css("bottom","51%");
            }
        });
    });
    /**
     * æ˜¾ç¤ºç‰©æµä¿¡æ¯
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
                        html += '<li><h2>è¿å•'+(k+1) + 'ï¼š' + v.no +'</h2></li>';
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
                            title : 'ç‰©æµä¿¡æ¯è¯¦æƒ…',
                            type:1,
                            skin: 'layui-layer-rim', //åŠ ä¸Šè¾¹æ¡†
                            area: ['650px', '400px'], //å®½é«˜
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
     * ç¡®è®¤æ”¶è´§
     * @param orderId è®¢å•Id
     */
    function confirmGoods(orderId) {
        layer.confirm('æ‚¨ç¡®å®šè¦è¿›è¡ŒéªŒè´§ç¡®è®¤å—ï¼Ÿ', {icon: 3, title:'æ¸©é¦¨æç¤º'}, function(index){
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
     * ç¡®è®¤åˆ°è´§
     * @param orderId è®¢å•Id
     */
    function validateGoods(orderId) {
        layer.confirm('æ‚¨ç¡®å®šè¦è¿›è¡Œåˆ°è´§ç¡®è®¤å—ï¼Ÿ', {icon: 3, title:'æ¸©é¦¨æç¤º'}, function(index){
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
     * å–æ¶ˆè®¢å•
     * @param orderId è®¢å•Id
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
                    layer.alert(data.message, {icon: 3, title: "æ¸©é¦¨æç¤º"});
                    window.location.reload();
                }
            }
        });
    }

    function cancleOrderError(){
        $("#orderpay").colorbox.close();
    }

    /**
     * åˆ é™¤è®¢å•
     * @param orderId
     */
    function deleteOrder(orderId) {
        layer.confirm('æ‚¨ç¡®å®šè¦åˆ é™¤è®¢å•å—ï¼Ÿ', {icon: 3, title:'æ¸©é¦¨æç¤º'}, function(index){
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
     * ä¹°å®¶ç¡®è®¤æ”¶åˆ°é€€æ¬¾
     * @param {string} orderId è®¢å•Id
     */
    var clickAllow = "true";
    function confirmReceivables(orderSn) {
        if(clickAllow=="true"){
            clickAllow = "false";
            layer.confirm('æ‚¨ç¡®è®¤æ”¶æ¬¾?',{icon:3},function(index){
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
     * Desc:ç‚¹å‡» å…¨éƒ¨è®¢å•-ä¾¿åˆ©æé†’-è®¢å•çŠ¶æ€æ˜¾ç¤ºç›¸å…³çŠ¶æ€çš„ è®¢å•
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
     * åˆ¤æ–­æ˜¯å¦æ˜¯ç©º
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
     * é€€æ¬¾å•é©³å›
     * @param orderSn é€€æ¬¾å•å·
     */
    function nextRefund(orderSn){
        $.ajax({
            type: "POST",
            url: "${base}/member/refund/refundurl/"+orderSn,
            datatype: 'json',
            success: function(data) {
                var size = data.size;
                if(size>=3){
                    layer.alert('é©³å›ä¸‰æ¬¡ï¼Œä¸èƒ½è¿›è¡Œæ­¤æ“ä½œ', {icon: 2, title: 'æ¸©é¦¨æç¤º'});
                    return false;
                }else{
                    window.location.href="${base}/member/refund/apply/"+ orderSn +".html";
                }
            }
        });
    }
    /**
     * è®¢å•éªŒè´§ç”³è¯‰
     * yuech
     * @param orderId è®¢å•Id
     * reason ç”³è¯‰å†…å®¹
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
                    layer.alert(data.message, {icon: 3, title: "æ¸©é¦¨æç¤º"});
                    window.location.reload();
                }
            }
        });
    }
    function cancleComplaint(){
        $("#orderpay").colorbox.close();
    }


    function initBtn(){
        //å–æ¶ˆè®¢å•
        judgeBtnAuth('${base}', 'cancleOrder', 'cancle_btn');
        //ä»˜æ¬¾
        judgeBtnAuth('${base}', 'pay', 'pay_btn');
        //ç¡®è®¤åˆ°è´§
        judgeBtnAuth('${base}', 'confirmArrival', 'arrival_btn');
        //ç¡®è®¤éªŒè´§
        judgeBtnAuth('${base}', 'confirmInspection', 'inspection_btn');
        //ç”³è¯‰
        judgeBtnAuth('${base}', 'appeal', 'appeal_btn');
        //è¯„ä»·
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
    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>