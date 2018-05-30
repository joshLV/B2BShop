<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<#include "app/xd/head.ftl">
    <style>
        .order-filter li {
            width: 19%;
            position: relative;
        }
        .sh_info .key {
            width: 30%;
            float: left;
            text-align: left;
            color: #888;
        }
        .detail{
            font-size: 10px;
            font-style: oblique;
            font-weight: normal;
            margin-left: 2px;
            color: #29A3FD;
        }
        .mui-checkbox input[type=checkbox], .mui-radio input[type=radio] {
            position: absolute;
            top: 10px;
            display: inline-block;
            width: 28px;
            height: 26px;
            border: 0;
            outline: 0 !important;
            background-color: transparent;
            -webkit-appearance: none;
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
            border-style: solid;
            font-size: 14px;
            border-radius: 4px;
            /*border-color: #999;*/
            color: #FFF!important;
            background-color: #FE0000;
        }

        .ribbon {
            width: 0!important;
            height: 22px;
            border-left: 16px solid red;
            border-right: 16px solid red;
            border-bottom: 18px solid transparent;
            margin: 0px 0px 0px 15px;
        }
    </style>

</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        报价单列表
    </div>
</header>
<div class="mui-content" style="padding-bottom:50px;background-color: #F1F1F5;">
    <div class="myorder" style="margin-top: 16px;">
    <#--新做订单列表-->
        <section class="order-con">
            <ul class="order-list">
                <li>
                    <h3 style="padding-top: 15px;"><a href="javascript:void(0);"
                                                      onclick="viewEnquiry('${enquiry.id}')">${enquiry.title} <sub
                            class="detail"><sub>询价单详情</sub></sub></a>
                    </h3>
                </li>
                <li>
                    <div class="order-box" style=" padding: 0px 0px;">
                        <div class="order-width">
                            <div class="sh_info">
                                <div class="key">报价单:</div>
                                <div class="val">(${countTotal}个)</div>
                            </div>
                            <div class="sh_info">
                                <div class="key">当前状态:</div>
                                <div class="val">${statusMap['${enquiry.enquiryState}']}</div>
                            </div>
                            <div class="sh_info">
                                <div class="key">报价截止还剩:</div>
                                <div class="val">${surplusDay} 天 ${surplusHour} 小时</div>
                            </div>
                            <div class="sh_info">
                                <div class="key">询价产品:</div>
                                <div class="val">${goodsNames}</div>
                            </div>
                            <div class="sh_info">
                                <div style="float: right; margin-right: 10px;">
                                <#if enquiry.enquiryState == '4'>
                                    <a href="javascript:void(0);" class="a_btn" onclick="delEnquiry('${enquiry.id}')">删除询价</a>
                                <#else>
                                    <a href="#${enquiry.id}" class="a_btn" >撤销询价</a>
                                </#if>
                                    <a href="javascript:void(0);" class="a_btn" onclick="addSimilarEnquiry('${enquiry.id}')">发布相似询价单</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </section>

        <div class="viewport" id="tabs"
             style=" padding-left: 0!important; padding-right:0!important; width: 100%!important;">


            <div id="order01" class="order_list01">
            <#list quotationList as quotation>
                <dl>
                    <div class="bh">
                        <div style="float:left;color: #888;width:30%;">报价供应商：</div>
                        <div style="float:right; padding-right:15px;"><a class="offer-name" target="_blank" href="${base}/shop/${quotation.urlAddress}" title="${quotation.merchantName}" style="color: #888;">${quotation.merchantName}</a></div>
                    </div>
                    <dt>
                        <p style="color:#888;font-size: 14px;"><label>报价总额：</label><label class="releaseTime">${quotation.totalCost?string("currency")}(含运费:${quotation.freightTotalCost?string("currency")})</label></p>
                    </dt>
                    <dt>
                        <p style="color:#888;font-size: 14px;"><label>报价时间：</label><label class="releaseTime">${quotation.createDate?string("yyyy-MM-dd HH:mm:ss")}</label></p>
                    </dt>
                    <dt>
                        <p style="color:#888;font-size: 14px;"><label>有效期至：</label><label class="offerEndTime">${quotation.quotationPeriod?string("yyyy-MM-dd HH:mm:ss")}</label></p>
                    </dt>
                    <#if quotation.isEnd >
                        <dt>
                            <p style="font-size: 16px;color: #888;margin:0 auto;">已过期</p>
                            <marquee bgcolor=pink>看到了吧？有底色！</marquee>
                        </dt>
                    </#if>

                    <#if quotation.isDownOrder == '2'>
                        <dt style="background-color: #F1F1F5; margin-left: -15px">
                            <div class="ribbon"></div><p style="font-size: 16px;color: #FE0000;margin-left: 10px">已下单</p>
                        </dt>
                    </#if>
                    <dd>
                        <div class="tools">
                            <a href="javascript:void(0);" class="a_btn" onclick="viewQuotation('${quotation.id}');">查看报价单详情</a>
                                <#if !quotation.isEnd && quotation.isDownOrder != '2'>
                                    <a href="#${quotation.id}" class="a_btn" id="a_btn_${quotation.id}">退回报价</a>
                                </#if>
                            <a href="javascript:void(0);" class="a_btn" onclick="delQuotation('${quotation.id}');">删除</a>
                        </div>
                    </dd>
                </dl>
            </#list>
            </div>
        </div>
        <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
        <input type="hidden" id="pageCount" value="${pager.pageCount}"/>
        <input type="hidden" id="pageSize" value="${pager.pageSize}"/>
        <input type="hidden" id="orderBy" value="${pager.orderBy}"/>
        <input type="hidden" id="orderType" value="${pager.orderType}"/>
        <input type="hidden" id="currStatus" value="${currStatus}"/>
    </div>
<#list quotationList as quotation>
    <div id="${quotation.id}" class="mui-popover" style="height: 80%;width: 98%;display: none;z-index: 999">
        <div class="mui-popover-arrow"></div>
        <div class="mui-scroll-wrapper">
            <div class="mui-scroll" >
                <ul class="mui-table-view" style="border-radius:initial;">
                    <div onclick="closeReturnQuotationDialog('${quotation.id}')" class="mui-icon mui-icon-close" style="margin-right: 5px;float: right;"></div>
                    <div class="mui-input-row" style="margin-left: 15px;">
                        <p style="color: #000; margin-top: 20px;">请选择报价未被采用的原因：</p>
                        <div class="mui-checkbox f-cb" style="border-bottom: solid 1px #d8d8d8"><input id="reason1" name="reason" value="价格不合适" type="checkbox" checked="true"><label>价格不合适</label></div>
                        <div class="mui-checkbox f-cb" style="border-bottom: solid 1px #d8d8d8"><input id="reason2" name="reason" value="产品不合适" type="checkbox"><label>产品不合适</label></div>
                        <div class="mui-checkbox f-cb" style="border-bottom: solid 1px #d8d8d8"><input id="reason3" name="reason" value="公司资质能力不符" type="checkbox"><label>公司资质能力不符</label></div>
                        <div class="mui-checkbox f-cb"><input id="reason4" name="reason" value="其他" type="checkbox"><label>其他</label></div>
                        <div class="mui-checkbox f-cb" style="border-bottom: solid 1px #d8d8d8">
                        <textarea class="mui-textarea mui-btn-block" class="text" id="otherReason" name="otherReason"
                                  style="border:solid 1px #d8d8d8; border-radius:5px; resize:none; margin-top: -5px; margin-bottom: 10px" placeholder="补充说明"></textarea></div>
                    </div>

                    <div class="mui-input-row">
                        <div class="mui-checkbox f-cb" style="border-bottom: solid 1px #d8d8d8">
                            <label style="margin-left: 10%">允许供应商重新报价</label><input id="anewOffer" name="anewOffer" value="1" type="checkbox" checked="true" style="margin-right: 82%">
                        </div>
                    </div>

                    <div class="mui-input-row" style="margin-top: 5px;">
                            <a href="javascript:void(0);" style="margin-top:2px;float:left;margin-left:30%;padding:5px 12px;background: #E4393C;-webkit-border-radius: 3px; color: #fff;-moz-border-radius: 3px;border-radius: 3px;"
                               onclick="closeReturnQuotationDialog('${quotation.id}', '1');">退回</a>
                            <a href="javascript:void(0);" style="margin-top:2px;float:right;margin-right:30%;padding:5px 12px;background: #E4393C;-webkit-border-radius: 3px; color: #fff;-moz-border-radius: 3px;border-radius: 3px;"
                               onclick="closeReturnQuotationDialog('${quotation.id}', '0');">取消</a>
                    </div>

                </ul>
            </div>
        </div>
    </div>
</#list>
    <div id="${enquiry.id}" class="mui-popover" style="height: 80%;width: 98%;display: none;z-index: 999">
        <div class="mui-popover-arrow"></div>
        <div class="mui-scroll-wrapper">
            <div class="mui-scroll" >
                <ul class="mui-table-view" style="border-radius:initial;">
                    <div onclick="closeRevokeEnquiryDialog('${enquiry.id}')" class="mui-icon mui-icon-close" style="margin-right: 5px;float: right;"></div>
                    <div class="mui-input-row" style="margin-left: 15px;">
                        <p style="color: #000; margin-top: 20px;">请选择撤销询价的原因：</p>
                        <div class="mui-checkbox f-cb" style="border-bottom: solid 1px #d8d8d8"><input id="reason1" name="reason" value="已收到合适的报价" type="checkbox" checked="true"><label>已收到合适的报价</label></div>
                        <div class="mui-checkbox f-cb" style="border-bottom: solid 1px #d8d8d8"><input id="reason2" name="reason" value="未收到合适的报价" type="checkbox"><label>未收到合适的报价</label></div>
                        <div class="mui-checkbox f-cb" style="border-bottom: solid 1px #d8d8d8"><input id="reason3" name="reason" value="已通过其它渠道找到供应商" type="checkbox"><label>已通过其它渠道找到供应商</label></div>
                        <div class="mui-checkbox f-cb" style="border-bottom: solid 1px #d8d8d8"><input id="reason3" name="reason" value="已取消采购计划" type="checkbox"><label>已取消采购计划</label></div>
                        <div class="mui-checkbox f-cb"><input id="reason4" name="reason" value="其他" type="checkbox"><label>其他</label></div>
                        <div class="mui-checkbox f-cb" style="border-bottom: solid 1px #d8d8d8">
                        <textarea class="mui-textarea mui-btn-block" class="text" id="otherReason" name="otherReason"
                                  style="border:solid 1px #d8d8d8; border-radius:5px; resize:none; margin-top: -5px; margin-bottom: 10px" placeholder="补充说明"></textarea></div>
                    </div>

                    <div class="mui-input-row" style="margin-top: 5px;">
                        <a href="javascript:void(0);" style="margin-top:2px;float:left;margin-left:30%;padding:5px 12px;background: #E4393C;-webkit-border-radius: 3px; color: #fff;-moz-border-radius: 3px;border-radius: 3px;"
                           onclick="closeRevokeEnquiryDialog('${enquiry.id}', '1');">撤销</a>
                        <a href="javascript:void(0);" style="margin-top:2px;float:right;margin-right:30%;padding:5px 12px;background: #E4393C;-webkit-border-radius: 3px; color: #fff;-moz-border-radius: 3px;border-radius: 3px;"
                           onclick="closeRevokeEnquiryDialog('${enquiry.id}', '0');">取消</a>
                    </div>

                </ul>
            </div>
        </div>
    </div>

<#include "app/xd/tools.ftl">
    <script>
        (function (mui, doc) {
            mui.back = function () {
                jumpto(fullpath + "/enquiry/list?whichclient=whichapp");
            };
            mui.init({
                swipeBack: true,
                statusBarBackground: '#ffffff'
            });
            mui('.mui-scroll-wrapper').scroll();
            mui('body').on('shown', '.mui-popover', function(e) {
                console.log('shown', e.detail.id);//detail为当前popover元素
            });
            mui('body').on('hidden', '.mui-popover', function(e) {
                console.log('hidden', e.detail.id);//detail为当前popover元素
            });
            if (ismobile) {
                mui.plusReady(function () {
                    //关闭等待框
                    plus.nativeUI.closeWaiting();
                    //显示当前页面
                    plus.webview.currentWebview().show();
                });
            }

            jQuery("input[name=reason]").on('change', function(event){
                var _this = event.target;
                if(_this.checked == true){
                    jQuery.each(jQuery("input[name=reason]"), function(index, chkbox){
                        if( _this.id != chkbox.id){
                            chkbox.checked = false;
                        }
                    });
                }

            });

            //关闭退回报价弹出框
            closeReturnQuotationDialog = function (id, type){
                jQuery("#"+id).hide();
                jQuery(".mui-active").hide();
                jQuery("#"+id).removeClass('mui-active');
                console.log('hidden', id, type);
                if(type == '1'){
                    console.log('hidden', id, type,jQuery("#"+id).find('#anewOffer').prop("checked"));
                    var reason = jQuery("#"+id).find("input[name='reason']:checked").val()+'。';
                    var otherRea = jQuery("#"+id).find("#otherReason").val();
                    var anewOffer = 2;
                    if(jQuery("#"+id).find("input[name='anewOffer']:checked").prop("checked")){
                        anewOffer = 1;
                    }
                    returnQuotation(id, anewOffer, reason, otherRea);
                }
            };
            /**
             * 退回报价
             * @param id 报价单Id
             */
            returnQuotation = function (id, anewOffer, reason, otherRea){
                jQuery.ajax({
                    type: 'post',
                    url: '${base}/quotation/returnQ/' + id + '/' + anewOffer + '/'+encodeURI(encodeURI(reason)) + '/'+encodeURI(encodeURI(otherRea)),
                    success: function (data) {
                        if (data.status == 'success') {
                            jumpto(fullpath + "/quotation/list.html?whichclient=whichapp&enquiryId=${enquiry.id}" );
                        } else {
                            popAlert(data.message);
                        }
                    }
                });
            };


            /**
             * 查看询价单详情
             * @param id 询价单Id
             */
            viewEnquiry = function (id) {
                jumpto(fullpath + '/enquiry/detail/' + id + '?whichclient=whichapp');
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
                        title: '提示：',
                        content: '确认删除该询价单?',
                        btn: ['确认', '取消'],
                        shadeClose: false,
                        yes: function () {
                            layer.close(layer_confrim);
                            showWaiting();
                            jQuery.ajax({
                                type: 'post',
                                url: '${base}/enquiry/del/' + id,
                                success: function (data) {
                                    closeWaiting();
                                    clickAllow = "true";
                                    if (data.status == 'success') {
                                        jumpto(fullpath + "/enquiry/list.html?whichclient=whichapp");
                                    } else {
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

            //关闭撤销询价单弹出框
            closeRevokeEnquiryDialog = function (id, type){
                jQuery("#"+id).hide();
                jQuery(".mui-active").hide();
                jQuery("#"+id).removeClass('mui-active');
                console.log('hidden', id, type);
                if(type == '1'){
                    console.log('hidden', id, type,jQuery("#"+id).find('#anewOffer').prop("checked"));
                    var reason = jQuery("#"+id).find("input[name='reason']:checked").val()+'。';
                    var otherRea = jQuery("#"+id).find("#otherReason").val();

                    revokeEnquiry(id, reason+'。'+otherRea);
                }
            };


            /**
             * 撤销询价单
             * @param id 询价单Id
             */
            revokeEnquiry = function (id, reason) {
                showWaiting();
                jQuery.ajax({
                    type: 'post',
                    url: '${base}/enquiry/revoke/' + id + '/' + encodeURI(encodeURI(reason)),
                    success: function (data) {
                        closeWaiting();
                        if (data.status == 'success') {
                            jumpto(fullpath + "/enquiry/list?whichclient=whichapp");
                        } else {
                            clickAllow = "true";
                            popAlert(data.message);
                        }
                    },
                    error: function(){
                        closeWaiting();
                    }
                });
            };
            /**
             * 发布相似询价单
             * @param id 询价单Id
             */
            addSimilarEnquiry = function(id){
                jumpto(fullpath + '/enquiry/publish.html?whichclient=whichapp&enquiryId=' + id);
            };

            /**
             * 查看报价单详情
             * @param id 报价单Id
             */
            viewQuotation = function (id) {
                jumpto(fullpath + '/quotation/list_detail.html?whichclient=whichapp&quotationId=' + id);
            };


            /**
             * 删除报价
             * @param id 报价单Id
             */
            delQuotation = function (id){

                if (clickAllow == "true") {
                    clickAllow = "false";

                    var layer_confrim = layer.open({
                        title: '提示：',
                        content: '确认删除该询价单?',
                        btn: ['确认', '取消'],
                        shadeClose: false,
                        yes: function () {
                            layer.close(layer_confrim);
                            showWaiting();
                            jQuery.ajax({
                                type: 'post',
                                url: '${base}/quotation/del/' + id,
                                success: function (data) {
                                    if (data.status == 'success') {
                                        jumpto(fullpath + "/quotation/list.html?whichclient=whichapp&enquiryId=${enquiry.id}" );
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
        }(mui, document));

    </script>
</body>
</html>