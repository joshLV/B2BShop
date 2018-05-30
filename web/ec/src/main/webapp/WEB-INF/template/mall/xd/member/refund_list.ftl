<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>退款记录</title>
    <meta name="description" content="退款记录">
    <meta name="Keywords" content="退款记录">
    <link href="${base}/static/mall/xd/img/favicon.ico" rel="shortcut icon" />
    <link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/xd/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/css/addressDialog.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">window.pageConfig={compatible:true,navId:"orderlist"};</script>
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
            font-weight: 700;
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
            width: 1000px;
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
            border: 1px solid #e6e6e6; /*border-bottom:2px solid #c30000;*/
            height: 40px;
            line-height: 40px;
            margin-bottom: 10px;
            background: #F5F5F5;
        }

        .right .order-mt h2 {
            position: relative;
        }

        .right .order-mt h2 {
            color: #333333;
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
            margin-right: 25px;
            color: #999;
        }

        #order01 dt, #order01 dd {
            float: left;
        }

        .ftx-04 {
            color: #ff6600;
        }

        #orderlist, #orderlist .mc, #orderlist .tb-order, #orderlist .mt {
            overflow: visible;
            margin-top: -10px
        }

        #orderlist .mt {
            border-bottom: 2px solid #FFCCAA;
            padding-left: 6px;
        }

        #orderlist .taborder li {
            position: relative;
            float: left;
            z-index: 2;
        }

        #orderlist .taborder .tyies-t {
            line-height: 31px;
            background: url(${base}/static/mall/img/tab01.png) 0 -32px;
            height: 31px;
            padding-left: 15px;
            padding-right: 47px;
            position: relative;
            z-index: 3;
        }

        #orderlist .taborder li b, #orderlist .taborder li s {
            height: 31px;
            background: url(${base}/static/mall/img/tab01.png);
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
            margin-left: 1%;
            margin-bottom: 20px;
            width: 98%;
            padding-top: 20px;
        }

        #orderlist .tb-order table {
            border-collapse: collapse;
            border: 1px solid #E6E6E6; /* border-top: none;*/
        }

        #orderlist .tb-order th {
            background: #f7f7f7;
            height: 35px;
            color: #666666;
            font-weight: normal;
            border-right: 1px solid #E6E6E6;
            text-align: center;
        }

        #orderlist .tb-order td {
            border: 1px solid #E6E6E6;
            padding: 8px 4px;
            /*text-align: center*/
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
            color: #666666;
            margin: 0;
        }

        #orderlist .tr-td td {
            vertical-align: top;
            padding-top: 10px;
        }

        #orderlist .tr-td .img-list {
            width: 280px;
            overflow: hidden;
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
            background: #005aa0;
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

        /**退款记录/日志**/
        .log_table{
            border: 0 !important;
            background-color: #FAFAFA;
        }

        .logDiv {
            line-height: 20px;
            height: 20px;
        }

        .logDiv:hover {
            background-color: #F5F5F5;
        }

        .typeCls {
            color: red;
            font-size: 14px;
            font-weight: bold;
            width: 253px;
            border: 0 !important;
        }

        .infoCls {
            color: red;
            font-size: 14px;
            font-weight: bold;
            width: 505px;
            border: 0 !important;
            padding-left: 10px !important;
            padding-right: 10px !important;
        }

        .createDateCls {
            padding-right: 3px;
            width: 180px;
            border: 0 !important;
        }

        .typeCls2 {
            width: 253px;
            border: 0 !important;
        }

        .infoCls2 {
            padding-left: 90px;
            width: 505px;
            border: 0 !important;
            padding-left: 10px !important;
            padding-right: 10px !important;
        }

        .createDateCls2 {
            padding-right: 3px;
            width: 180px;
            border: 0 !important;
        }

        .one:hover {
            background-color: #E6E6E6;
        }

        #orderlist tbody i:hover {
            border: 1px solid darkred;
        }
    </style>
</head>
<body>
<#include "mall/xd/shortcut.ftl"/>
<#include "mall/xd/header.ftl"/>
<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;我的退款单<span></span></span>
	</div>
</div>
<div class="content">
	<div class="left">
    <#import "mall/xd/member/menu.ftl" as memu>
		<@memu.menu id="wdtkd"/>
	</div>
	<div class="right">
		<div class="order-mt">
			<h2>我的退款单列表</h2>
		</div>
		<div class="m" id="orderlist">
			<div class="mc">
				<div class="tb-order">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr>
								<th width="150">订单编号</th>
								<th width="70">退款金额</th>
								<th width="136">退款状态</th>
								<th width="80">退款类型</th>
								<#--<th width="80">收货人</th>-->
								<#--<th width="90">收货手机</th>-->
								<th width="110">操作</th>
							</tr>
						</thead>
                        <tbody>
                        <#list orderRefundList as refundObj>
                        <i>
                            <tr class="one">
                                <td><a href="${base}/order/view/${refundObj.orderId}.html">${refundObj.orderSn}</a></td>
                                <td>${refundObj.amount}</td>
                                <td>${refundStatusMap[refundObj.status]}</td>
                                <td>${refundTypeMap[refundObj.type]}</td>
                                <#--<td>${refundObj.shipName}</td>-->
                                <#--<td>${refundObj.shipMobile}</td>-->
                                <td>
                                    <#if  refundObj.status != 'success'>
                                        <a href="javascript:void(0)" id="${refundObj.id}" onclick="getRefundLogs(this,'${refundObj.reason}。${refundObj.info}')">退款进度</a>
                                    <#else>
                                        <a href="javascript:void(0)" id="${refundObj.id}" onclick="getRefundLogs(this,'${refundObj.reason}。${refundObj.info}')">退款日志</a>|
                                    </#if>
                                    <#if refundObj.status == 'commit' || (refundObj.status == 'confirmed' && refundObj.type == 'unreceived')>|
                                        <a href="${base}/member/refund/applyfillwl/${refundObj.orderSn}.html" id="${refundObj.id}">查看</a>
                                    <#elseif refundObj.status == 'confirmed' && refundObj.type == 'received'>|
                                        <a href="${base}/member/refund/refundsuccess/${refundObj.orderSn}.html" id="${refundObj.id}">退货</a>
                                    <#elseif refundObj.status == 'shipped'>|
                                        <a href="${base}/member/refund/refundsuccess/${refundObj.orderSn}.html" id="${refundObj.id}">查看</a>
                                    <#elseif refundObj.status == 'unrefund'>|
                                        <a href="${base}/member/refund/refundsuccess/${refundObj.orderSn}.html" id="${refundObj.id}">查看</a>
                                    <#elseif refundObj.status == 'refunded'>|
                                        <a href="javascript:void(0)" onclick="getRefundSuccess('${refundObj.id}')" id="${refundObj.id}">确认收款</a>
                                    <#elseif refundObj.status == 'success'>
                                        <span id="${refundObj.id}" onclick="getRefundLogs(this,'${refundObj.reason}。${refundObj.info}')" style="color: forestgreen;font-weight: bold;cursor: pointer">已完成</span>
                                    </#if>
                                </td>
                            </tr>
                            <tr class="hide">
                                <td colspan="7" class="${refundObj.id}" style="background-color: #FAFAFA;"></td>
                            </tr>
                        </i>
                        </#list>
                        </tbody>
					</table>
				</div>
			</div>
		</div>
        <#-- 分页条 -->
        <div class="m clearfix">
            <div class="pagin fr">
            <#if pager.list?size &gt; 0>
                <#import "mall/xd/pager.ftl" as p>
                <@p.pager pager = pager baseUrl = "/member/refund/list.html" />
            <#else>
                <div class="noRecord">没有退款记录！</div>
            </#if>
            </div>
        </div>
	    <div class="clr"></div>
	</div>
</div>
<#include "mall/xd/service.ftl"/>
<#include "mall/xd/footer.ftl"/>
</body>
</html>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/js/layer.js" type="text/javascript"></script>
<script type="text/javascript">
    var refundStatusMap = ${refundStatusJSONMap};
    $(function () {
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });
    });

    function getRefundLogs(obj,reason) {
        var id = $(obj).attr("id");
        var logDiv = $("." + id);
        if (logDiv.parent().attr("class") == "hide") {
            $.ajax({
                type: "post",
                url: "${base}/member/refund/listRefundLog/" + id + ".html",
                success: function (data) {
                    if (data != null && data != "") {
                        var html = "<table class='log_table'>";
                        $.each(data, function (i, o) {
                            var id = o.id;
                            var info = o.info;
                            var type = o.type;
                            var createDate = formatDate(o.createDate, 'Y-m-d H:i:s');
                            var t="";
                            if(o.type == 'commit'){
                                t= "退款原因 : ";
                            }else if(o.type == 'confirmed'|| o.type == 'unrefund' || o.type == 'returned'){
                                t= "商家受理意见: ";
                            }else if(o.type == 'refunded'){
                                t= "商城受理意见: ";
                            }
                            if (i == 0) {
                                html += "<tr class='logDiv'><td class='typeCls'>"+refundStatusMap[o.type]+"</td>";
                                html += "<td class='infoCls' style='text-align:left;'>"+t+info+"</td>";
                                html += "<td class='createDateCls'>"+createDate+"</td></tr>";
                            } else {
                                html += "<tr class='logDiv'><td class='typeCls2'>"+refundStatusMap[o.type]+"</td>";
                                html += "<td class='infoCls2' style='text-align:left;'>";
                                if(o.type == 'commit'){
                                    html += t+reason;
                                }else{
                                    html += t+info;
                                }
                                html += "</td>";
                                html += "<td class='createDateCls2'>"+createDate+"</td></tr>";
                            }
                        });
                        logDiv.html(html+"</table>");
                        logDiv.parent().removeClass("hide");
                    } else {
                        layer.alert("还没有退款记录日志！", {icon: 5, title:"温馨提示"});
                    }
                }
            });
        } else {
            logDiv.parent().addClass("hide");
        }
    }

    /**
     * 买家确认收到退款
     * @param {string} refundId 退款单Id
     */
    var clickAllow = "true";
    function getRefundSuccess(refundId) {
        layer.confirm('您确定要收款吗？', {icon: 3, title:'温馨提示'}, function(index) {
            if (clickAllow == "true") {
                clickAllow = "false";
                $.ajax({
                    type: 'post',
                    url: '${base}/member/refund/applyfillupdate/' + refundId + '.html',
                    success: function (data) {
                        if (data.status == 'success') {
                            location.reload();
                        } else {
                            clickAllow == "true"
                            layer.alert(data.message, {icon: 2, title: "温馨提示"});
                        }
                    }
                });
            }
            layer.close(index);
        },function(index){
            clickAllow = "true";
            layer.close(index);
        });
    }

    /**
     * 时间戳格式化函数
     * @param  {int}    timestamp 要格式化的时间 默认为当前时间
     * @param  {string} format    格式
     * @return {string}           格式化的时间字符串
     * 例：Y-m-d 结果是 2012-10-11
     *     Y-m-d H:i:s 结果是 2012-10-12 22:37:33
     */
    function formatDate(timestamp, format) {
        var a, jsdate = ((timestamp) ? new Date(timestamp) : new Date());
        var pad = function (n, c) {
            if ((n = n + "").length < c) {
                return new Array(++c - n.length).join("0") + n;
            } else {
                return n;
            }
        };
        var txt_weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        var txt_ordin = {1: "st", 2: "nd", 3: "rd", 21: "st", 22: "nd", 23: "rd", 31: "st"};
        var txt_months = ["", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        var f = {
            // Day
            d: function () {
                return pad(f.j(), 2)
            },
            D: function () {
                return f.l().substr(0, 3)
            },
            j: function () {
                return jsdate.getDate()
            },
            l: function () {
                return txt_weekdays[f.w()]
            },
            N: function () {
                return f.w() + 1
            },
            S: function () {
                return txt_ordin[f.j()] ? txt_ordin[f.j()] : 'th'
            },
            w: function () {
                return jsdate.getDay()
            },
            z: function () {
                return (jsdate - new Date(jsdate.getFullYear() + "/1/1")) / 864e5 >> 0
            },

            // Week
            W: function () {
                var a = f.z(), b = 364 + f.L() - a;
                var nd2, nd = (new Date(jsdate.getFullYear() + "/1/1").getDay() || 7) - 1;
                if (b <= 2 && ((jsdate.getDay() || 7) - 1) <= 2 - b) {
                    return 1;
                } else {
                    if (a <= 2 && nd >= 4 && a >= (6 - nd)) {
                        nd2 = new Date(jsdate.getFullYear() - 1 + "/12/31");
                        return date("W", Math.round(nd2.getTime() / 1000));
                    } else {
                        return (1 + (nd <= 3 ? ((a + nd) / 7) : (a - (7 - nd)) / 7) >> 0);
                    }
                }
            },

            // Month
            F: function () {
                return txt_months[f.n()]
            },
            m: function () {
                return pad(f.n(), 2)
            },
            M: function () {
                return f.F().substr(0, 3)
            },
            n: function () {
                return jsdate.getMonth() + 1
            },
            t: function () {
                var n;
                if ((n = jsdate.getMonth() + 1) == 2) {
                    return 28 + f.L();
                } else {
                    if (n & 1 && n < 8 || !(n & 1) && n > 7) {
                        return 31;
                    } else {
                        return 30;
                    }
                }
            },

            // Year
            L: function () {
                var y = f.Y();
                return (!(y & 3) && (y % 1e2 || !(y % 4e2))) ? 1 : 0
            },
            //o not supported yet
            Y: function () {
                return jsdate.getFullYear()
            },
            y: function () {
                return (jsdate.getFullYear() + "").slice(2)
            },

            // Time
            a: function () {
                return jsdate.getHours() > 11 ? "pm" : "am"
            },
            A: function () {
                return f.a().toUpperCase()
            },
            B: function () {
                // peter paul koch:
                var off = (jsdate.getTimezoneOffset() + 60) * 60;
                var theSeconds = (jsdate.getHours() * 3600) + (jsdate.getMinutes() * 60) + jsdate.getSeconds() + off;
                var beat = Math.floor(theSeconds / 86.4);
                if (beat > 1000) beat -= 1000;
                if (beat < 0) beat += 1000;
                if ((String(beat)).length == 1) beat = "00" + beat;
                if ((String(beat)).length == 2) beat = "0" + beat;
                return beat;
            },
            g: function () {
                return jsdate.getHours() % 12 || 12
            },
            G: function () {
                return jsdate.getHours()
            },
            h: function () {
                return pad(f.g(), 2)
            },
            H: function () {
                return pad(jsdate.getHours(), 2)
            },
            i: function () {
                return pad(jsdate.getMinutes(), 2)
            },
            s: function () {
                return pad(jsdate.getSeconds(), 2)
            },
            //u not supported yet

            // Timezone
            //e not supported yet
            //I not supported yet
            O: function () {
                var t = pad(Math.abs(jsdate.getTimezoneOffset() / 60 * 100), 4);
                if (jsdate.getTimezoneOffset() > 0) t = "-" + t; else t = "+" + t;
                return t;
            },
            P: function () {
                var O = f.O();
                return (O.substr(0, 3) + ":" + O.substr(3, 2))
            },
            //T not supported yet
            //Z not supported yet

            // Full Date/Time
            c: function () {
                return f.Y() + "-" + f.m() + "-" + f.d() + "T" + f.h() + ":" + f.i() + ":" + f.s() + f.P()
            },
            //r not supported yet
            U: function () {
                return Math.round(jsdate.getTime() / 1000)
            }
        };

        return format.replace(/[\\]?([a-zA-Z])/g, function (t, s) {
            if (t != s) {
                // escaped
                ret = s;
            } else if (f[s]) {
                // a date function exists
                ret = f[s]();
            } else {
                // nothing special
                ret = s;
            }
            return ret;
        });
    }
</script>
