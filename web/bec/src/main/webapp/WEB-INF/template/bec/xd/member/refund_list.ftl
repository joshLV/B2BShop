    <#include "bec/xd/header.ftl"/>
    <style type="text/css">
        .mymoney_back table td {
            border-bottom: 1px solid #E8E8E8;
            border-left: 1px solid #E8E8E8;
            text-align: center;
            line-height: 30px;
        }
        td, th {
            display: table-cell;
            vertical-align: inherit;
        }
        #orderlist .tb-order td {
            border: 1px solid #E6E6E6;
            padding: 8px 4px;
            text-align: center;
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
            width: 306px;
            border: 0 !important;
        }

        .infoCls {
            color: red;
            font-size: 14px;
            font-weight: bold;
            width: 561px;
            border: 0 !important;
            padding-left: 10px !important;
            padding-right: 10px !important;
        }

        .createDateCls {
            padding-right: 3px;
            width: 270px;
            border: 0 !important;
        }

        .typeCls2 {
            width: 306px;
            border: 0 !important;
        }

        .infoCls2 {
            padding-left: 90px;
            width: 561px;
            border: 0 !important;
            padding-left: 10px !important;
            padding-right: 10px !important;
        }

        .createDateCls2 {
            padding-right: 3px;
            width: 270px;
            border: 0 !important;
        }

        .one:hover {
            background-color: #E6E6E6;
        }

        #orderlist tbody i:hover {
            border: 1px solid darkred;
        }
    </style>
<div id="container" class="f-cb">
    <#include "bec/xd/top.ftl"/>
    <div class="member_content">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/order/list">订单中心</a></strong><span>&nbsp;&gt;&nbsp;我的退款单<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/xd/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="tkdlb"/>
            <!--leftMenu end-->
        </div>
        <div class="member_right">
            <div class="my_order">
                <h3>我的退款单列表</h3>
                <div class="mymoney_back">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr class="mymoney_back_tit">
                            <td class="mymoney_ordernumber">订单编号</td>
                            <td class="mymoney_sum">退款金额</td>
                            <td class="mymoney_state">退款状态</td>
                            <td class="mymoney_type">退款类型</td>
                            <#--<td class="mymoney_consignee">收货人</td>-->
                            <#--<td class="mymoney_tel">收货手机</td>-->
                            <td class="mymoney_operate">操作</td>
                        </tr>
                        <#list orderRefundList as refundObj>

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

                        </#list>
                    </table>
                </div>

            </div>
        <#--&lt;#&ndash; 分页条 &ndash;&gt;-->
            <#--<div class="m clearfix">-->
                <#--<div class="pagin fr">-->
                    <#--<#if pager.list?size &gt; 0>-->
                        <#--<#import "mall/gwq/pager.ftl" as p>-->
                        <#--<@p.pager pager = pager baseUrl = "/member/refund/list.html" />-->
                    <#--<#else>-->
                        <#--<div class="noRecord">没有退款记录！</div>-->
                    <#--</#if>-->
                <#--</div>-->
            <#--</div>-->
            <#--<div class="clr"></div>-->
        <#--</div>-->
            <div class="mymoney_pages">
                <#if pager.list?size &gt; 0>
                    <#import "mall/gwq/pager.ftl" as p>
                    <@p.pager pager = pager baseUrl = "/member/refund/list.html" />
                <#else>
                    <div class="noRecord">没有退款记录！</div>
                </#if>
                <#--<ul>-->
                    <#--<li><a href="#" class="prev_pages current">上一页</a></li>-->
                    <#--<li><a href="#">1</a></li>-->
                    <#--<li><a href="#">2</a></li>-->
                    <#--<li><a href="#" class="next_pages">下一页</a></li>-->
                <#--</ul>-->
            </div>
        </div>
    </div>
</div>
    <#include "bec/xd/service.ftl"/>
    <#include "bec/xd/foot.ftl"/>
<#--<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>-->
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

                            if (i == 0) {
                                html += "<tr class='logDiv'><td class='typeCls'>"+refundStatusMap[o.type]+"</td>";
                                html += "<td class='infoCls'>"+info+"</td>";
                                html += "<td class='createDateCls'>"+createDate+"</td></tr>";
                            } else {
                                html += "<tr class='logDiv'><td class='typeCls2'>"+refundStatusMap[o.type]+"</td>";
                                html += "<td class='infoCls2'>";
                                if(refundStatusMap[o.type] == '已提交'){
                                    html += "退款原因 : "+reason;
                                }else{
                                    html += info;
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