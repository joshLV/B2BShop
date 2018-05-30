<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
<#include "app/gwq/head.ftl">
    <style>
        .order-filter li {
            width: 19%;
            position: relative;
        }
        .dates{
            margin: 5px 0px 5px 0px;
        }

        .count{
             font-size: 10px;
             font-style: normal;
             font-weight: normal;
             margin-left: 0;
             color: #29A3FD;
         }
        .detail{
            font-size: 10px;
            font-style: oblique;
            font-weight: normal;
            margin-left: 2px;
            color: #29A3FD;
        }
        .a_btn{
            display: inline-block;
            vertical-align: top;
            margin: 0 0 8px 8px;
            padding: 3px 6px;
            height: 25px;
            overflow: hidden;
            line-height: 25px;
            text-align: center;
            border-width: 0px!important;
            border-style:solid;
            font-size: 14px;
            border-radius: 4px;
            /*border-color: #999;*/
            color: #FFF!important;
            background-color: #FE0000;
            box-shadow:2px -2px 8px #666;
        }
        .a_btn:active{
            color:#666;
        }
        .layermcont{text-align: left !important}
    </style>

</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        我的询价单
    </div>
</header>
<div class="mui-content" id="content" style="padding-bottom:50px;background-color: #F1F1F5;">
    <div class="myorder" style="margin-top: 16px;">
    <#--新做订单列表-->


        <div class="viewport" id="tabs"
             style=" padding-left: 0!important; padding-right:0!important; width: 100%!important;">
            <ul class="order-filter">
                <li><a name="formMap.status.-1" class="mui-control-item <#if formMap.status == '-1'>current</#if>"
                       href="#">所有<sup class="count">(${countMap["-1"]})</sup></a></li>
                <li><a name="formMap.status.1" class="mui-control-item <#if formMap.status == '1'>current</#if>"
                       href="#">报价中<sup class="count">(${countMap["1"]})</sup></a></li>
                <li><a name="formMap.status.2"
                       class="mui-control-item <#if formMap.status == '2'>current</#if>"
                       href="#">已截止<sup class="count">(${countMap["2"]})</sup></a></li>
                <li><a name="formMap.status.4"
                       class="mui-control-item <#if formMap.status == '4'>current</#if>"
                       href="#">已撤销<sup class="count">(${countMap["4"]})</sup></a></li>
                <li><a name="formMap.status.3"
                       class="mui-control-item <#if formMap.status == '3'>current</#if>"
                       href="#">已完结<sup class="count">(${countMap["3"]})</sup></a></li>
            </ul>
            <div id="order01" class="order_list01">

            <#list enquiryList as enquiry>
                <dl>
                    <div class="bh">
                        <div style="float:left;"><a href="${base}/enquiry/detail/${enquiry.id}?whichclient=whichapp"
                                                    title="${enquiry.title}"
                                                    style="font-size: 18px;font-weight: bold;">${enquiry.title}<#--<sub
                                class="detail"><sub>详情</sub></sub>--></a>
                        </div>
                        <div style="float:right; padding-right:15px; color:#888;">${statusMap['${enquiry.enquiryState}']}</div>
                    </div>
                    <dt style="padding-right: 0">
                        <div class="order-state" style="width:65%;color: #888;"><span
                                style="color: #888;">收到的报价：</span><label><#if enquiry.quotationCount == 0 >
                            暂未收到报价<#else>${enquiry.quotationCount}</#if></label></div>
                        <div class="order-state" style="color: #888;width: 35%"><span
                                style="color: #888;">查看次数：</span><label>${enquiry.viewCount}次</label>
                        </div>
                    </dt>
                    <dt>
                        <p style="color:#888;font-size: 14px;"><label>报价时间：</label><label>${enquiry.releaseDateTime?string("yyyy-MM-dd HH:mm:ss")}</label></p>
                    </dt>
                    <dt>
                        <p style="color:#888;font-size: 14px;"><label>有效期至：</label><label>${enquiry.offerEndDateTime?string("yyyy-MM-dd HH:mm:ss")}</label></p>
                    </dt>
                    <#if enquiry.enquiryState == 4 >
                        <div style="clear:both;font-size: 14px;color: #888;">
                            ${enquiry.cxContent?substring('${enquiry.cxContent?index_of("原因：")}'?number)} <#--${statusMap['${enquiry.enquiryState}']}-->
                        </div>
                    </#if>
                    <dd>
                        <div class="tools">
                            <a href="javascript:void(0);" class="a_btn"
                               onclick="viewQuotation('${enquiry.id}');">查看报价</a>
                        <#-- 判断报价单状态,在已完成或者撤销报价单时删除报价单 -->
                            <#if enquiry.enquiryState == '4' || enquiry.enquiryState == '3'>
                                <a href="javascript:void(0);" class="a_btn"
                                   onclick="delEnquiry('${enquiry.id}');">删除</a>
                            <#else>
                                <a href="javascript:void(0);" class="a_btn"
                                   onclick="revokeEnquiry('${enquiry.id}');">撤销询价</a>
                            </#if>
                            <a href="javascript:void(0);" class="a_btn"
                                    onclick="addSimilarEnquiry('${enquiry.id}')">发布相似询价</a>
                        </div>
                    </dd>
                </dl>
            </#list>
            </div>
        </div>

    <#--加载更多订单-->

        <div class="checkout_btn">
            <a id="loadmore" class="gray_btn mui-control-item" href="#buttom" style="background-color:#F4F4F4;">上拉加载更多</a>
        <#-- <br/>
         <a id="backToTop" class="gray_btn mui-control-item"href="#tabs">回到顶部</a>-->
        </div>
        <div id="buttom"></div>

        <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
        <input type="hidden" id="pageCount" value="${pager.pageCount}"/>
        <input type="hidden" id="pageSize" value="${pager.pageSize}"/>
        <input type="hidden" id="orderBy" value="${pager.orderBy}"/>
        <input type="hidden" id="orderType" value="${pager.orderType}"/>
        <input type="hidden" id="currStatus" value="${currStatus}"/>

        <div class="viewport" id="tabs"
             style=" padding-left: 0!important; padding-right:0!important; width: 100%!important;">
            <div id="order01" class="order_list01">
                <div id="template" style="display:none">
                    <dl>
                        <div class="bh">
                            <div style="float:left;"><a href="#" title="testsekts" style="font-size: 18px;font-weight: bold;">询价单Title<sub
                                    class="detail"><sub>详情</sub></sub></a>
                            </div>
                            <div style="float:right; padding-right:15px; color:#888;">询价单Status</div>

                        </div>
                        <dt>
                        <div class="order-state" style="width:65%;color: #888;"><span style="color: #888;">收到的报价：</span><label>1</label>
                        </div>
                        <div class="order-state" style="color: #888;"><span style="color: #888;">查看次数：</span><label>3次</label></div>

                        </dt>
                        <dt>
                            <p style="color:#888;font-size: 14px;"><label>报价时间：</label><label class="releaseTime">2015-11-30 17:03:11</label></p>
                        </dt>
                        <dt>
                            <p style="color:#888;font-size: 14px;"><label>有效期至：</label><label class="offerEndTime">2015-12-31 17:03:11</label></p>
                        </dt>
                        <dd>
                            <div class="tools">
                                <#--<a href="javascript:void(0);" class="JS_order_btn" onclick="alert(1);">查看报价</a>
                                <a href="javascript:void(0);" class="JS_order_btn" onclick="alert(2);">删除</a>
                                <a href="#" class="JS_order_btn pay">发布相似询价</a>-->
                            </div>
                        </dd>
                    </dl>

                </div>
            </div>
        </div>
    </div>


    <div id="contentHtml" style="display: none">
        <dl>
            <dt>
            <li class="mui-input-row mui-radio mui-left f-cb" style="padding-bottom: 5px;font-size: 12px;color: red">
                <label style="float: left;line-height:20px;padding-left:0;font-size: 12px;color: red;padding-right: 0;">温馨提示：撤销询价后，本条询价单将不再接收到新报价;此前已经收到的报价不受影响</label>
            </li>
            </dt>
            <dt>
            <li class="mui-input-row mui-radio mui-left f-cb" style="padding-bottom: 5px;">
                <input style="left: 0px;top: 0" class="mui-radio" type="radio" id="reason1" name="reason"
                       value="已收到合适的报价" checked="checked"/><label
                    style="float: left;line-height:5px;padding-left:35px;">已收到合适的报价</label>
            </li>
            </dt>
            <dt>
            <li class="mui-input-row mui-radio mui-left f-cb" style="padding-bottom: 5px;">
                <input style="left: 0px;top: 0" class="mui-radio" type="radio" id="reason2" name="reason"
                       value="未收到合适的报价"/><label style="float: left;line-height:5px;padding-left:35px;">未收到合适的报价</label>
            </li>
            </dt>
            <dt>
            <li class="mui-input-row mui-radio mui-left f-cb" style="padding-bottom: 5px;">
                <input style="left: 0px;top: 0" class="mui-radio" type="radio" type="radio" id="reason3" name="reason"
                       value="已通过其它渠道找到供应商"/><label
                    style="float: left;line-height:5px;padding-left:35px;">已通过其它渠道找到供应商</label>
            </li>
            </dt>
            <dt>
            <li class="mui-input-row mui-radio mui-left f-cb" style="padding-bottom: 5px;">
                <input style="left: 0px;top: 0" class="mui-radio" type="radio" id="reason4" name="reason"
                       value="已取消采购计划"/><label style="float: left;line-height:5px;padding-left:35px;">已取消采购计划</label>
            </li>
            </dt>
            <dt>
            <li class="mui-input-row mui-radio mui-left f-cb" style="padding-bottom: 5px;">
                <input style="left: 0px;top: 0" class="mui-radio" type="radio" id="reason5" name="reason"
                       value="其他"/><label style="float: left;line-height:5px;padding-left:35px;">其他</label>
            </li>
            <li class="mui-input-row mui-radio mui-left f-cb" style="padding-bottom: 5px;">
                <textarea class="mui-textarea mui-btn-block" class="text" id="layer_cancelReason" name="layer_cancelReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; padding: 0;margin: 0" >&nbsp;</textarea>
            </li>
            </dt></dl>
    </div>


    <div class="return">
        <a id="backToTop" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
    </div>

<#include "app/gwq/tools.ftl">
    <script>
        (function (mui, doc) {
            mui.back = function () {
                jumpto(fullpath + "/member/index?whichclient=whichapp");
            };
            mui.init({
                swipeBack: true,
                statusBarBackground: '#ffffff'
            });
            if (ismobile) {
                mui.plusReady(function () {
                    //关闭等待框
                    plus.nativeUI.closeWaiting();
                    //显示当前页面
                    plus.webview.currentWebview().show();
                });
            }
            fmoney = function (s, n) {
                if (!jQuery.isNumeric(s)) {
                    return "0.00";
                }
                n = n > 0 && n <= 20 ? n : 2;
                s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
                return s;
            };
            decodeStatus = function (orderStatus) {
                if (orderStatus == "1")  return "接受报价中";
                if (orderStatus == "2")  return "报价已截止";
                if (orderStatus == "3")  return "已完结";
                if (orderStatus == "4")  return "询价已撤销";
            };
            leftPad = function (tbl) {
                return function (num, n) {
                    return (0 >= (n = n - num.toString().length)) ? num : (tbl[n] || (tbl[n] = Array(n + 1).join(0))) + num;
                }
            }([]);pageNumber
            dateFormat = function (now, type) {
                var date = new Date(now)
                var year = date.getFullYear();
                var month = date.getMonth() + 1;
                var day = date.getDate();
                var hour = date.getHours();
                var minute = date.getMinutes();
                var second = date.getSeconds();
                if (type == '1') {
                    return year + "-"
                            + leftPad(month, 2) + "-"
                            + leftPad(day, 2);
                } else if (type == '2') {
                    return leftPad(hour, 2) + ":"
                            + leftPad(minute, 2) + ":"
                            + leftPad(second, 2);
                } else {
                    return year + "-"
                            + leftPad(month, 2) + "-"
                            + leftPad(day, 2) + " "
                            + leftPad(hour, 2) + ":"
                            + leftPad(minute, 2) + ":"
                            + leftPad(second, 2);
                }
            }

            jQuery(".order-filter a").bind("tap", function (e) {
                showWaiting();

                var pageNumber = parseInt(jQuery("#pageNumber").val());
                var pageCount = parseInt(jQuery("#pageCount").val());
                var pageSize = parseInt(jQuery("#pageSize").val());
                var orderBy = parseInt(jQuery("#orderBy").val());
                var orderType = parseInt(jQuery("#orderType").val());


                var e_target = e.target;
                if (typeof(e_target) == 'undefined') {
                    closeWaiting();
                    return;
                }
                if (!jQuery(e_target).is("a")) {
                    if (jQuery(e_target).parent().is("a")) {
                        e_target = jQuery(e_target).parent();
                    } else {
                        closeWaiting();
                        return;
                    }
                }
                if (jQuery(e_target).hasClass("current")) {
                    closeWaiting();
                    return;
                }
                jQuery.each(jQuery(".order-filter a"), function (index, filter) {
                    jQuery(filter).removeClass("current");
                    jQuery(filter).removeClass("mui-action");
                });
                jQuery(e_target).addClass("current");
                var e_target_name = jQuery(e_target).attr('name');
                var array = e_target_name.split(".");
                jumpto(fullpath + "/enquiry/list?status=" + array[2] + "&whichclient=whichapp");
            });

            loadData = function () {
                loadop=false;
                jQuery("#loadmore").html("<img src='${base}/static/app/gwq/images/loading.gif'>");
                var pageNumber = parseInt(jQuery("#pageNumber").val());
                var pageCount = parseInt(jQuery("#pageCount").val());
                var pageSize = parseInt(jQuery("#pageSize").val());
                var orderBy = parseInt(jQuery("#orderBy").val());
                var orderType = parseInt(jQuery("#orderType").val());
                var e_target_name = jQuery('.current').prop('name');
                var array = e_target_name.split(".");
                var currStatus = array[2];

                pageNumber = pageNumber + 1;
                var url = fullpath + "/enquiry/ajax/loadmore";
                jQuery.ajax({
                    type: "post",
                    url: url,
                    data: {
                        'pageNumber': pageNumber,
                        'pageSize': pageSize,
                        'orderBy': orderBy,
                        'orderType': orderType,
                        'status': currStatus
                    },
                    datatype: 'json',
                    success: function (data) {

                        if (data.status == 'success') {
                            if (typeof(data.data) == 'undefined') {
                                jQuery("#loadmore").attr("style","background-color:#ddd")
                                jQuery("#loadmore").html("没有更多询价单了");
                                loadop=false;
                                return;
                            }
                            jQuery("#loadmore").html("上拉加载更多");
                            jQuery("#pageNumber").val(data.pager.pageNumber);
                            jQuery("#pageCount").val(data.pager.pageCount);
                            jQuery("#pageSize").val(data.pager.pageSize);
                            jQuery("#orderBy").val(data.pager.orderBy);
                            jQuery("#orderType").val(data.pager.orderType);


                            jQuery.each(data.data, function (index, enquiry) {
                                // -----create templatedl-----
                                var templatedl = jQuery("#template > dl").clone();
                                jQuery(templatedl).find('.bh').find('a')
                                        .prop('href',fullpath + '/enquiry/detail/' + enquiry.id + '?whichclient=whichapp')
                                        .prop('title', enquiry.title)
                                        .html(enquiry.title + '<sub class="detail"><sub>详情</sub></sub>');
                                jQuery(templatedl).find('.bh').find('div').last().html(decodeStatus(enquiry.enquiryState));
                                if(parseInt(enquiry.quotationCount) == 0 ){
                                    jQuery(templatedl).find('.order-state').first().find('label').html('暂未收到报价');
                                }else{
                                    jQuery(templatedl).find('.order-state').first().find('label').html(enquiry.quotationCount);
                                }
                                jQuery(templatedl).find('.order-state').last().find('label').html(enquiry.viewCount);
                                jQuery(templatedl).find('.releaseTime').html(dateFormat(enquiry.releaseDateTime));
                                jQuery(templatedl).find('.offerEndTime').html(dateFormat(enquiry.offerEndDateTime));
                                if(parseInt(enquiry.enquiryState) == 4){
                                    var reason = '';
                                    if(enquiry.cxContent.indexOf('原因：') >= 0 ){
                                        reason = enquiry.cxContent.substring(enquiry.cxContent.indexOf('原因：'));
                                    }
                                    jQuery(templatedl).find('.dates').after('<div style="clear:both;font-size: 14px;color: #888;">'
                                    + reason + decodeStatus(enquiry.enquiryState) + '</div>')
                                }
                                var lasttools = jQuery(templatedl).find(".tools");

                                jQuery("<a />").addClass("a_btn")
                                        .prop("href", "javascript:void(0)")
                                        .html("查看报价")
                                        .bind('tap', function(){viewQuotation(enquiry.id);})
                                        .appendTo(jQuery(lasttools));
                                if (enquiry.enquiryState == '4' || enquiry.enquiryState == '3'){
                                    jQuery("<a />").addClass("a_btn")
                                            .prop("href", "javascript:void(0)")
                                            .html("删除")
                                            .bind('tap', function(){delEnquiry(enquiry.id);})
                                            .appendTo(jQuery(lasttools));
                                }else{
                                    jQuery("<a />").addClass("a_btn")
                                            .prop("href", "javascript:void(0)")
                                            .html("撤销询价")
                                            .bind('tap', function(){revokeEnquiry(enquiry.id);})
                                            .appendTo(jQuery(lasttools));
                                }
                                jQuery("<a />").addClass("a_btn").addClass("pay")
                                        .prop("href", "javascript:void(0)")
                                        .html("发布相似询价")
                                        .bind('tap', function(){addSimilarEnquiry(enquiry.id);})
                                        .appendTo(jQuery(lasttools));
                                jQuery("#order01 > dl").last().after(templatedl);

                            });
                            loadop = true;
                        } else {
                            jQuery("#loadmore").attr("style","background-color:#ddd")
                            jQuery("#loadmore").html("加载失败，稍后再试");
                        }
                    },
                    error: function (data) {
                        jQuery("#loadmore").attr("style","background-color:#ddd")
                        jQuery("#loadmore").html("加载失败，稍后再试");
                    }
                });
            };

            jQuery('#backToTop').bind("tap", function () {
                jQuery('html,body').animate({scrollTop: '0px'}, 800);
            });
            /**
             * 查看报价单列表
             * @param id 询价单Id
             */
            viewQuotation = function (id) {
                jumpto(fullpath + '/quotation/list.html?whichclient=whichapp&enquiryId=' + id);
            };
            /**
             * 删除
             * @param id 询价单Id
             */
            var clickAllow = "true";
            delEnquiry = function (id) {
                if (clickAllow == "true") {
                    clickAllow = "false";

                    var layer_confrim = layer.open({
                        title:'提示：',
                        content:'确认删除该询价单?',
                        btn: ['确认', '取消'],
                        shadeClose: false,
                        yes: function(){
                            layer.close(layer_confrim);
                            showWaiting();
                            jQuery.ajax({
                                type: 'post',
                                url: '${base}/enquiry/del/' + id,
                                success: function (data) {
                                    closeWaiting();
                                    clickAllow = "true";
                                    if (data.status == 'success') {
                                        var name = jQuery('.current').prop('name');
                                        jumpto(fullpath + "/enquiry/list?whichclient=whichapp&status=" + name.split('.')[2]);
                                    } else {
                                        popAlert(data.message);
                                    }
                                },
                                error:function(data){
                                    clickAllow = "true";
                                    closeWaiting();
                                    popAlert(data.message);
                                }
                            });
                        },
                        no: function(){
                            clickAllow = "true";
                            layer.close(layer_confrim);
                        }
                    });
                }
            };
            /**
             * 撤销
             * @param id 询价单Id
             */
            revokeEnquiry = function (id) {
                if (clickAllow == "true") {
                    clickAllow = "false";


                    var conrentHtml=$("#contentHtml").html();



                    var cancelReason = "";
                    var layer_confrim = layer.open({
                        title: '确认撤销该询价单?',
                        content: conrentHtml /*'<textarea class="mui-textarea mui-btn-block" class="text" id="layer_cancelReason" name="layer_cancelReason" style="border:solid 1px #d8d8d8; border-radius:3px; resize:none; margin: -20px 0px -15px 0px;padding: 10px 20px 10px 20px;" placeholder="请输入取消原因"></textarea> '*/,
                        btn: ['确认', '取消'],
                        shadeClose: false,
                        yes: function () {
                            cancelReason = jQuery(".layermmain").find("input[name='reason']:checked").val()+jQuery(".layermmain").find("#layer_cancelReason").val()<#--必须在close之前获取-->
                            if(cancelReason == ''){
                                cancelReason = '用户主动撤销';
                            }
                            layer.close(layer_confrim);
                            showWaiting();
                            jQuery.ajax({
                                type: 'post',
                                url: '${base}/enquiry/revoke/' + id + '/' + encodeURI(encodeURI(cancelReason)),
                                success: function (data) {
                                    clickAllow = "true";
                                    if (data.status == 'success') {
                                        var name = jQuery('.current').prop('name');
                                        jumpto(fullpath + "/enquiry/list?whichclient=whichapp&status=" + name.split('.')[2]);
                                    } else {
                                        clickAllow = "true";
                                        popAlert(data.message);
                                    }
                                },
                                error: function (data) {
                                    clickAllow = "true";
                                    closeWaiting();
                                    popAlert(data.message);
                                }
                            });
                        },
                        no: function () {
                            clickAllow = "true";
                            layer.close(layer_confrim);
                        }
                    });
                }
            };
            /**
             * 发布相似询价单
             * @param id 询价单Id
             */
            addSimilarEnquiry = function(id){
                jumpto(fullpath + '/enquiry/publish.html?whichclient=whichapp&enquiryId=' + id);
            };

            var loadop=true;
            var screenheight = window.screen.availHeight; //获取屏幕高
            $(window).scroll(function(){
                if ($(window).scrollTop()>100){
                    $("#backToTop").fadeIn(500);
                }else{
                    $("#backToTop").fadeOut(500);
                }
                var scr = $(window).scrollTop();
                var conH=document.getElementById("content").offsetHeight;//获取内如高度
                if(screenheight+scr>conH-100){
                    if(loadop){
                        loadData();
                    }
                }
            });
        }(mui, document));

    </script>
</body>
</html>