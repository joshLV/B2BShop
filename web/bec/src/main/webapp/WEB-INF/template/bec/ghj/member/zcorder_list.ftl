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
    /* 支付 */
    .btn{display: block; width: 76px; height: 24px; line-height: 24px; background: #db0000;border-radius: 3px;color: #ffffff !important; margin-left:35px;}
    .btn:hover{background: #ed4548;}
    .bltx-color{color: #DB0000;}
</style>

<div id="container" class="f-cb">
    <#include "bec/ghj/top.ftl"/>
    <script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <div class="member_content f-cb" style="position: relative;">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/order/list.html?orderType_=1">订单中心</a></strong><span>&nbsp;&gt;&nbsp;众筹订单<span></span></span>
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
                    <#--页面样式调整-相应状态的可点击 Auth:zhangqiang Time:2015-11-19  Start-->
                        <li><strong class="ftx-04" style="color: #DB0000; border-bottom: 2px solid #DB0000; width:60px; text-align: center;  height: 38px; display: block;">全部订单</strong></li>

                        <li>
                            <div class="tyies-t">
                                <a onclick="submitOrderState('wait_buyer_pay_deposit')" <#if orderStates = 'wait_buyer_pay_deposit'>class="bltx-color"</#if> >
                                    待付定金(${orderFuDingJin})
                                </a>
                            </div>
                        </li>
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
                                    <#if orderStatusKey == "">
                                        <option value="wait_buyer_pay_deposit" <#if currStatus = 'wait_buyer_pay_deposit'>selected</#if>>等待支付定金</option>
                                    </#if>
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
                            ￥${order.totalAmount}
                            <#if order.depositMoney?? && order.depositMoney &gt; 0><br>（<font color="red">定金：￥${order.depositMoney}</font>）</#if>
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
                                    <strong class="ftx-04 order-statu" state="ddfk">众筹失败</strong>
                                <#else>
                                    众筹中
                                </#if>
                            <#else>
    ﻿/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.plugins.setLang( 'a11yhelp', 'he',
{
	accessibilityHelp :
	{
		title : 'הוראות נגישות',
		contents : 'הוראות נגישות. לסגירה לחץ אסקייפ (ESC).',
		legend :
		[
			{
				name : 'כללי',
				items :
						[
							{
								name : 'סרגל הכלים',
								legend:
									'לחץ על ${toolbarFocus} כדי לנווט לסרגל הכלים. עבור לכפתור הבא עם מקש הטאב (TAB) או חץ שמאלי. עבור לכפתור הקודם עם מקש השיפט (SHIFT) + טאב (TAB) או חץ ימני. לחץ רווח או אנטר (ENTER) כדי להפעיל את הכפתור הנבחר.'
							},

							{
								name : 'דיאלוגים (חלונות תשאול)',
								legend :
									'בתוך דיאלוג, לחץ טאב (TAB) כדי לנווט לשדה הבא, לחץ שיפט (SHIFT) + טאב (TAB) כדי לנווט לשדה הקודם, לחץ אנטר (ENTER) כדי לשלוח את הדיאלוג, לחץ אסקייפ (ESC) כדי לבטל. בתוך דיאלוגים בעלי מספר טאבים (לשוניות), לחץ אלט (ALT) + F10 כדי לנווט לשורת הטאבים. נווט לטאב הבא עם טאב (TAB) או חץ שמאלי. עבור לטאב הקודם עם שיפט (SHIFT) + טאב (TAB) או חץ שמאלי. לחץ רווח או אנטר (ENTER) כדי להיכנס לטאב.'
							},

							{
								name : 'תפריט ההקשר (Context Menu)',
								legend :
									'לחץ ${contextMenu} או APPLICATION KEYכדי לפתוח את תפריט ההקשר. עבור לאפשרות הבאה עם טאב (TAB) או חץ למטה. עבור לאפשרות הקודמת עם שיפט (SHIFT) + טאב (TAB) או חץ למעלה. לחץ רווח או אנטר (ENTER) כדי לבחור את האפשרות. פתח את תת התפריט (Sub-menu) של האפשרות הנוכחית עם רווח או אנטר (ENTER) או חץ שמאלי. חזור לתפריט האב עם אסקייפ (ESC) או חץ שמאלי. סגור את תפריט ההקשר עם אסקייפ (ESC).'
							},

							{
								name : 'תפריטים צפים (List boxes)',
								legend :
									'בתוך תפריט צף, עבור לפריט הבא עם טאב (TAB) או חץ למטה. עבור לתפריט הקודם עם שיפט (SHIFT) + טאב (TAB) or חץ עליון. Press SPACE or ENTER to select the list option. Press ESC to close the list-box.'
							},

							{
								name : 'עץ אלמנטים (Elements Path)',
								legend :
									'לחץ ${elementsPathFocus} כדי לנווט לעץ האלמנטים. עבור לפריט הבא עם טאב (TAB) או חץ ימני. עבור לפריט הקודם עם שיפט (SHIFT) + טאב (TAB) או חץ שמאלי. לחץ רווח או אנטר (ENTER) כדי לבחור את האלמנט בעורך.'
							}
						]
			},
			{
				name : 'פקודות',
				items :
						[
							{
								name : ' ביטול צעד אחרון',
								legend : 'לחץ ${undo}'
							},
							{
								name : ' חזרה על צעד אחרון',
								legend : 'לחץ ${redo}'
							},
							{
								name : ' הדגשה',
								legend : 'לחץ ${bold}'
							},
							{
								name : ' הטייה',
								legend : 'לחץ ${italic}'
							},
							{
								name : ' הוספת קו תחתון',
								legend : 'לחץ ${underline}'
							},
							{
								name : ' הוספת לינק',
								legend : 'לחץ ${link}'
							},
							{
								name : ' כיווץ סרגל הכלים',
								legend : 'לחץ ${toolbarCollapse}'
							},
							{
								name : ' הוראות נגישות',
								legend : 'לחץ ${a11yHelp}'
							}
						]
			}
		]
	}
});
                                                                                                                                                                                       ﻿/*
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ���� JFIF   d d  �� Ducky     P  �� Adobe d�   �� � 		

					�� " �� �             	
            
	 !1AQa"2q���BR#3	��b4�r��$56�����CScV7�s��d��8T%�W����Dt��Uu��&F��X9 	   !1AQaq��"2����B�R#3�br��ST���C$4s�%5��   ? ����W��Z�H�K��B��(v�ҟ!Q�()�ЃH�NIBH��9Pi�)j�Y?�*p��iB��G���(�M)�d��ҟ!D��t��Q#�J|�A��&�~J|�)	�y
i���� !?�?
�H@iI���P��~���(B|R/K� 4#�E)�b�O�`S�)�@�G���S�)�)�M�@S�*/@)� iO��]Bҟ!R���a��h�*+��?�?
� ҟ!Ba�>C𦞡d�a�iO�0)��TS�#�A�?�?
z�iO��!&���*hR�(O�Ĕ����	��)���:�~�S�"�B��R�J�*((OK$~j14�)h�	�'�>V��M@$�H=�.�6j���	����q�v�����Yc@�:{)%=��h7˜J묲�&mU;%A����)]���ԟ*�#�d��e�Q":ۓ���eIq��I)?�. ��`�	{t�@�iM��?
�a�?�?
VbH4��G�Q�S�#� iO�`S�#�����)�Y�?
b�j�Z�}��%�Z��u
|�B�
9�M6T�$Z
Z�R�$��aB
� �Ф/M lP	����p0�G2]&�%.A�E� (�
 �
 (@� ��N! �&�`.�`-��$ #��&i5���L	¥�(����U0��I�UM&�B�)&�1j%���O��� _Δ ��P	�?`'�DοQk������|���r	W�sg�^�d\G�d����)������ھ���r���%}h}F�/���+���u��c��T��B�S*z����A!(�li�Q�iuq�y�����ռrYs����qb�N�^66:�ZҎ� �dIz4gP�qM����}�I�$�6I��rK�m�'˜O��7ao����������} ܥ�r�F�	�{UV�[q@��=��n�$;7���o.D���D�,�CD�5�k!ࢣŞ��Q磥�e۵�#���5�(�#������eZaQd�*+PzJ����B� lKR�%Ui
 /�A
�-�S��!B�c
HAM!�R š�L<i@H��B�R=�0Q�&E��7�RB�T� �T,4Ũ�Q �)�P܀�*#
 P	��4�
�jL�-j.�'_e@� EMZ����h �S�zMZ �*�aS���`Sk~ZK�t�Z��=-@�Q RE� �� "���ހ ���t�� O�c�߹��;$T m=�T��M�L�	����
MK9����E����'���mܾw,��<56�oձ'�L���r<�rzj��B�ν����l�*b;��qHB\p�@��@��6'��޲�˙3Me�9��~"UK���Q���uK$� ӄ�T}��+w�,��e��y�ݑl����F�H?�/�
�Z	2ˢf9�(�-��(q ��ǰ ��[E����:�ҭ���	x������E�=��_XR�r����5�u�T�4�����[��%J=I,���;i��.�&�OcmogK�ǧ~����
E�׉�T�HP0@Z�a@T
��(Q%��T�sjp)�7 %�%yhb��4��J���mQ����� �5�,M�]�2-�jR8
OQ�-B@(�
$�
 *P]<��\^֣�T��)�@
iBTl�*,�4Cb
r iBj�6�(����1/�
�H��  (W�=G�M(�Z��	�}�$T�N�:w��e '�ր)�sH���O~��=�uF�?�ߖU�y�řl��jLmWC�|�M�}e7)Qm�2�O�ஆ�Eg�g�}�ݘ܉@��V=8�6֥�WSߧN��d��=w�;^~��q���Ʊ++	�/M��An�O`H�=�s2�UgF��<虰��������=���jB�B��C�B�b�[)L˛���ds��`��R ��M�!D~p�
��ɩ���r��u�.V�n�o���ҳ��0)J�����<i�m��S���p�܇��Jfn6RTP���Xq���������������`�l4�� �x����S4JI���W�����h J�!jOP�0�I��
\��
�$�4ґ�Qz��_0m~��&o�`��D��,chv[�M}1�m�ֶҢV���<x�Kr��������������QS�1;M�ǖ�HS��Gqqc>��2.�T��BH��\�*��oY	[��o�dd�V��r�*>�ڮ́?R��FF�*1Ђ
���l{�M�K$�@����� �>��kp�>�w.����M���e�;��^���:E����_������Ӂݻ_�������{�W�m*	~������YH7+-�8a��C~�X}���Z�qM�hڙe$�	J�{m�֏�_�������d��wg����T�c�z�rX\�3̬��pS�j��I-��:{N�?u��$����w ��� u'�%�� ���������D�cx�G)9&��ό{0�VIq�Y-�%����@�/~�J�����������?� �iu�޽�D��ı�6��{�x�&�?.��oub&���nH���[u
t�
"��VƬ��Sm���O���q�([�� �YuW��޽�2O\1��k�b�m����1��̱)[��4���+���a#��U���ĉf������k-��ܮ�|�t�nN:q�Ɋ�uhd�@-$]$��O����9W�P���|��gJ���>��'���h%��-�z~���k�BM��W~M�8Rt�� d_��� ��� ��� �Ug��rts�s�-���ri��I���#?(���� }*��O
�&+cq` ?�o�����|7���?qd�^Pg&��B�6��cGS)o����:�DU�p+�پ ���ߪ��[���<i������v�><�������zCZ�� �<X~b�H$猯�>�M�����,WW�&~7_})S��}��[6�P��ߦ����E���fmmŷ1{Z{8�/gۊ�̼�E��sD���,�H��U���cNN������Q�����U`
�4Ԅ'� ��@�R��/Bbh��7"b�6�R�  ޤ�?�� ���,�JI�Z��J�{Pk��v6�QlE%M��,6�C[� ���$��sQr�|�s>zn��B��]L�{�sd�Kq�t~�J� �/Ԥ�a�W^��QbGJpGӎk3&W=Be�$��[
?
���E�8�ms�{�]�����ھ:�6�߇��2�@խ)+P����<<r�w�tmZ��gn��{�
�e1L������iE��_�Oؒ*�GMj�,��e(�F�
�囐���=�xܦ��:X��캪u�9q�Z���Nr���W2q�'�<w&!�T����8���������z�,����:^J)������G[N������l�)'���b-�rr��tz2�}TT.~�a���>�?������󱥼��gn/|m�ʶZ�s�%�������&B��R�$D(z �0����*R ��`T�APr0�>>�6�[�#�x��[e��9)���{���#�aN�	!�
C���I况��k۵�<�Ј��O��,��^G�������[[�s1׈w.D��tC�ent.keyCode == 13) {
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
    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>