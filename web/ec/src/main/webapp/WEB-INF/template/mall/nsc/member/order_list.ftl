<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>我的订单</title>
    <meta name="description" content="我的订单">
    <meta name="Keywords" content="我的订单">
    <link href="${base}/static/img/favicon.ico" rel="shortcut icon"/>
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/reset.css"/>
    <link rel="stylesheet" href="${base}/static/mall/nsc/css/function.css"/>
    <link href="${base}/static/mall/nsc/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/mall/nsc/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript">
        window.pageConfig = {
            compatible: true,
            navId: "orderlist"
        };
    </script>
</head>
<body>
<#assign path="mall/nsc" />
<div class="g-doc">
    <div class="g-hd">
    <#include "${path}/shortcut.ftl"/>
        <#include "${path}/header.ftl"/>
    </div>
    <div class="g-bd">
<style>
    .breadcrumb {
        height: 20px;
        padding: 0 0 4px 6px;
        margin-bottom: 10px;
        overflow: hidden;
        line-height: 20px;
        vertical-align: baseline;
    }

    .breadcrumb strong, .breadcrumb h1 {
        display: inline;
        font-weight: 700;
        line-height: 20px;
        font-size: 18px;
        font-family: "microsoft yahei";
    }

    .left {
        float: left;
        width: 150px;
        margin-right: 10px;
    }

    .right {
        float: right;
        width:1030px;
    }

    .widepage .right {
        width: 980px;
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
        border-bottom: 2px solid #2e970f;
        height: 33px;
        line-height: 33px;
        margin-bottom: 10px;
        margin-top: 10px;
    }

    .right .order-mt h2 {
        position: relative;
    }

    .right .order-mt h2 {
        color: #2e970f;
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
    }

    #order01 dd {
        margin-right: 25px;
        color: #999;
    }

    #order01 dt, #order01 dd {
        float: left;
    }

</style>

<style>
    .ftx-04 {
        color: #ffffff;
    }

    #orderlist, #orderlist .mc, #orderlist .tb-order, #orderlist .mt {
        overflow: visible;
    }

    #orderlist .mt {
        border-bottom: 2px solid #2e970f;
        padding-left: 6px;
        overflow: hidden;
    }

    #orderlist .taborder li {
        position: relative;
        float: left;
        z-index: 2;
    }

    #orderlist .taborder .tyies-t {
        line-height: 31px;
        background: #2e970f;
        height: 31px;
        padding-left: 15px;
        padding-right: 47px;
        position: relative;
        z-index: 3;
        margin-top: 10px;
    }

    #orderlist .taborder li b, #orderlist .taborder li s {
        height: 31px;

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
        background: #f7f7f7 url(${base}/static/mall/img/tb-th.bg.gif) repeat-x;
        height: 31px;
        color: #666666;
        font-weight: normal;
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
        text-align: left
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
    .pagin{margin-top: 10px;}
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
        color: #2e970f;
    }

    .pagin a:hover, .pagin a:active {
        background: #2e970f;
        color: #fff;
        text-decoration: none;
    }

    .pagin .current, .pagin .current:link, .pagin .current:visited {
        color: #ffffff;
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

</style>

<div class="content">
    <div class="breadcrumb">
        <strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;个人主页<span></span></span>
    </div>
    <!--breadcrumb end-->
</div>

<div class="content">
    <div class="left">
    <#include "mall/jd/member/menu.ftl"/>
    </div>
    <!--left end-->
    <div class="right">
        <div class="order-mt">
            <h2>我的订单</h2>

            <div class="extra"><!--<a href="${base}/order/recycle">订单回收站</a>--></div>
        </div>
        <!--order-mt end-->
        <div class="m" id="order01">
            <div class="mc">
                <dl>
                    <dt>便利提醒：</dt>
                    <dd class="ftx-03" id="ordercount-waitPay">待付款(${orderFuKuanCount})</dd>
                    <dd class="ftx-03" id="ordercount-waitPick">待发货(${orderFaHuoCount})</dd>
                    <dd class="ftx-03" id="ordercount-waitReceive">待确认收货(${orderConfirmCount})</dd>
                </dl>
            </div>
        </div>
        <div class="m" id="orderlist">
            <div class="mt">
                <ul class="taborder">
                    <li>
                        <div class="tyies-t"><strong class="ftx-04">全部订单</strong><s></s><b></b></div>
                    </li>
                </ul>
                <div class="clr"></div>
            </div>
            <div class="mc">
                <div class="tb-order">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <th width="286">订单信息</th>
                            <th width="80">收货人</th>
                            <th width="110">应付金额</th>
                            <th width="100">
                                <select id="submitDate" name="" class="sele">
                                    <option value="" selected>全部时间</option>
                                <#assign startYear = .now?date?string('yyyy')?number>
                                <#assign lastYear = .now?date?string('yyyy')?number - 3>
                                <#assign yearSeq = startYear..lastYear>
                                <#list yearSeq as y>
                                    <option value="${y}">${y}年</option>
                                </#list>
                                </select>
                            </th>
                            <th width="100">
                                <select id="orderState" name="" class="sele">
                                <#list orderStatusMapping?keys as orderStatusKey>
                                    <option value="${orderStatusKey}"
                                            <#if currStatus??>selected</#if>>${orderStatusMapping[orderStatusKey]}</option>
                                </#list>
                                </select>
                                <script type="text/javascript">$("#orderState").val("${currStatus}");</script>
                            </th>
                            <th width="128">操作</th>
                        </tr>
                        </tbody>
                    <#list orderList as order>
                        <tbody id="tb-order-${order.id}" class="parent-1637764313">
                        <tr class="tr-th">
                            <td colspan="6">
									<span class="tcol1">
										订单编号: 
										<a name="orderIdLinks" id="idUrl${order.orderSn}" target="_blank"
                                           href="${base}/order/view/${order.id}.html">${order.orderSn}</a>
									</span>
                            </td>
                        </tr>
                        <tr id="track${order.id}" oty="0,4" class="tr-td">
                            <td>
                                <div class="img-list">
                                    <#list orderItemList as orderitem>
                                        <#if order.orderSn == orderitem.orderSn>
                                        <#--<#if orderitem_index gt 0>-->
                                            <a href="${base}/item/${orderitem.goodsId}.html" target="_blank"
                                               class="img-box"><img src="${orderitem.pic}"
                                                                    title="${orderitem.goodsName}" height="50"
                                                                    width="50"></a>
                                        <#--</#if>-->
                                        </#if>
                                    </#list>
                                </div>
                            </td>
                            <td>
                                <div class="u-name">${order.shipName}</div>
                            </td>
                            <td>
                                ￥${order.totalAmount}<br>${order.paymentMethodName}<br>
                            </td>
                            <td>
                                <span class="ftx-03">${order.createDate?string("yyyy-MM-dd")}
                                    <br>${order.createDate?string("HH:mm:ss")}</span>
                                <input type="hidden" id="datasubmit-${order.id}"
                                       value="${order.createDate?string("yyyy-MM-dd")} ${order.createDate?string("HH:mm:ss")}">
                            </td>
                            <td>
                                <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                    <strong class="ftx-04 order-statu"
                                            state="ddfk">${orderStatusMapping['${order.orderStatus}']}</strong>
                                <#else>
                                    <span class="ftx-03">${orderStatusMapping['${order.orderStatus}']}</span>
                                </#if>
                            </td>
                            <td id="operate${order.orderSn}" class="order-doi" width="100">
                                <#if '${order.orderStatus}' == 'wait_buyer_pay'>
                                    <a class="btn btn-4" target="_blank"
                                       href="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}"><s></s>付&nbsp;款</a><br>
                                <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                                    <a href="javascript:void(0)" onclick="confirmGoods('${order.id}')">确认收货</a><br/>
                                <#elseif '${order.orderStatus}' == 'trade_finished'>
                                    <a href="${base}/order/review.html?sn=${order.orderSn}">评价</a><br/>
                                </#if>
                                    <a target="_blank" href="${base}/order/view/${order.id}.html">查看</a>
                                <#if (order.paymentMethodName == '在线支付' && order.orderStatus == 'wait_buyer_pay') || (order.paymentMethodName == '货到付款' && order.orderStatus == 'wait_seller_send_goods')>
                                    <a href="javascript:void(0)" onclick="cancleOrder('${order.id}')">取消订单</a>
                                </#if>
                                <#if '${order.paymentStatus}'== 'paid'>
                                    <a href="javascript:void(0)" onclick="checkurl('${order.orderSn}');">退款</a>
                                </#if>
                                <#if '${order.paymentStatus}'== 'refunding'>
                                    <a href="javascript:void(0)" id="${order.orderSn}"  onclick="confirmReceivables('${order.orderSn}');">确认收款</a>
                                </#if>
                                <#if '${order.paymentStatus}'== 'refunded'>
                                    <a href="javascript:void(0)"target="_blank">已退款</a>
                                </#if>
                            </td>
                        </tr>
                        </tbody>
                    </#list>
                    </table>
                </div>
            </div>
        </div>
        <#-- 分页条 -->
        <div class="m clearfix">
            <div class="pagin fr">
            <#if pager!false && pager.list?size &gt; 0>
                <#import "${path}/pager.ftl" as p>
                <@p.pager pager = pager baseUrl = "/order/list.html" />
            <#else>
                <div class="noRecord">你还没有订单！</div>
            </#if>
            </div>
        </div>
        <div class="clr"></div>
    </div>
</div>
    </div>
<#include "${path}/service.ftl"/>
<#include "${path}/footer.ftl"/>
</div>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">
    //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {
        $(".u-category").hide();
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });

        $("#orderState").change(function () {
            var st = $(this).val();
            location.href = "${base}/order/list?status=" + st;
        });
    });

    /**
     * 确认收货
     * @param orderId 订单Id
     */
    function confirmGoods(orderId) {
        $.ajax({
            type: 'post',
            url: '${base}/order/confirmGoods/' + orderId,
            success: function (data) {
                if (data.status == 'success') {
                    window.location.reload();
                }
            }
        });
    }

    /**
     * 取消订单
     * @param orderId 订单Id
     */
    function cancleOrder(orderId) {
        $.ajax({
            type: 'post',
            url: '${base}/order/cancle/' + orderId,
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

    /**
     * 删除订单
     * @param orderId
     */
    function deleteOrder(orderId) {
        $.ajax({
            type: 'post',
            url: '${base}/order/delete/' + orderId,
            success: function (data) {
                if (data.status == 'success') {
                    window.location.reload();
                }
            }
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
    /**
     * 买家确认收到退款
     * @param {string} orderId 订单Id
     */
    var clickAllow = "true";
    function confirmReceivables(orderSn) {
        if(clickAllow=="true"){
            clickAllow = "false";
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
        }
    }
</script>
</body>
</html>