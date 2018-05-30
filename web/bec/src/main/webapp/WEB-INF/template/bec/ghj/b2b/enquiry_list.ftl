<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
<div id="container" style="background: #f7f7f7;">
    <#include "bec/ghj/top.ftl"/>
    <div class="member_content f-cb" style="margin-bottom: 0px !important;">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/enquiry/list.html">询价单</a></strong><span>&nbsp;&gt;&nbsp;所有询价单<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/ghj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="xjdlb"/>
            <!--leftMenu end-->
        </div>
        <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="${base}/static/bec/project/ghj/css/inquiry_sheet.css" rel="stylesheet" type="text/css" media="all"/>
        <link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghj/css/xunjia_list.css">
        <script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
        <div class="member_right">
            <div class="zyf_xunjia_list2">
                <h1 style="border-right: none; border-top: none;"><em>我的询价单列表</em></h1>
                <div id="zzjs_net_1">
                    <ul class="tab1" id="tab0">
                        <li <#if formMap.status == '-1'>class="hover"</#if> onclick="setTab('-1')"> <span class="xj_nav">所有询价</span> <em class="xj_tab_em">(${countMap["-1"]})</em> <span class="xj_line">|</span> </li>
                        <li <#if formMap.status == '1'>class="hover"</#if>  onclick="setTab('1')"> <span class="xj_nav">接受报价中</span> <em class="xj_tab_em">(${countMap["1"]})</em> <span class="xj_line">|</span> </li>
                        <li <#if formMap.status == '2'>class="hover"</#if>  onclick="setTab('2')"> <span class="xj_nav">报价已截止</span> <em class="xj_tab_em">(${countMap["2"]})</em> <span class="xj_line">|</span> </li>
                        <li <#if formMap.status == '4'>class="hover"</#if>  onclick="setTab('4')"> <span class="xj_nav">询价已撤销</span> <em class="xj_tab_em">(${countMap["4"]})</em> <span class="xj_line">|</span> </li>
                        <li <#if formMap.status == '3'>class="hover"</#if>  onclick="setTab('3')"> <span class="xj_nav">询价已完结</span> <em class="xj_tab_em">(${countMap["3"]})</em> <span class="xj_line">|</span> </li>
                    </ul>
                    <div class="tabcon" id="tabcon0">
                        <ul class="block">
                            <li>
                                <div class="xj_ss">
                                <span class="xj_sear">
                                    <form action="${base}/enquiry/list.html" method="post" id="searchForm">
                                        <input type="hidden" id="status" name="status" value="${formMap.status}">
                                        <input type="text" class="sear_field" id="title" name="title" placeholder="请输入询价单名称" value="${formMap.title}">
                                        <input readonly class="go-input-datepicker gmt-receive" id="releaseDateTimeS" name="releaseDateTimeS" type="text" value="${formMap.releaseDateTimeS}" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'releaseDateTimeE\',{d:-1})}'})" placeholder="发布时间[起]">
                                        <em class="bing-less" style="display: none;"></em>
                                        <span class="xj_date_text f-fl m10">至</span>
                                        <input readonly class="go-input-datepicker gmt-receive" id="releaseDateTimeE" name="releaseDateTimeE" type="text" value="${formMap.releaseDateTimeE}" onclick="WdatePicker({minDate:'#F{$dp.$D(\'releaseDateTimeS\',{d:+1})}'})" placeholder="发布时间[止]">
                                        <em class="bing-less" style="display: none;"></em>
                                        <button class="sear_btn" type="submit">搜索</button>
                                    </form>
                                </div>
                    </div>
                    <div class="xj_con">
                        <table class="go-tab-frame manage-table" width="100%" cellpadding="0" cellspacing="0" style="width: auto !important;">
                            <tbody>
                            <tr class="go-tab-head" style="width: auto !important;">
                                <td class="cell-a">询价单</td>
                                <td class="cell-b">发布时间</td>
                                <td class="cell-b">报价截止时间</td>
                                <td class="cell-d accept-quotation">状态</td>
                                <td class="cell-a receive-quotation-num">收到的报价</td>
                                <td class="cell-b">查看次数</td>
                                <td class="cell-b cell-op">操作</td>
                            </tr>
                            </tbody>
                        </table>
                        <table id="buyoffer-content" class="go-tab-frame manage-table" width="100%" cellpadding="0" cellspacing="0" style=" width: ">
                            <tbody>
                                <#if enquiryList?? && enquiryList?size &gt; 0>
                                <#list enquiryList as enquiry>
                                <tr>
                                    <td class="cell-a title">
                                        <#--${enquiry.id}--${enquiry.enquiryState}<br>-->
                                        <div class="quotation-name"> <a class="offer-name" target="_blank" href="${base}/enquiry/detail/${enquiry.id}" title="${enquiry.title}">${enquiry.title}</a> </div>
                                    </td>
                                    <td class="cell-b"><p>${enquiry.releaseDateTime?string("yyyy-MM-dd")}</p>
                                        <p>${enquiry.releaseDateTime?string("HH:mm:ss")}</p></td>
                                    <td class="cell-b"><p>${enquiry.offerEndDateTime?string("yyyy-MM-dd")}</p>
                                        <p>${enquiry.offerEndDateTime?string("HH:mm:ss")}</p></td>
                                    <td class="cell-d accept-quotation">
                                        <#if enquiry.enquiryState == 4 >
                                            <div class="ts_info">
                                                <a href="#"class="ts">提示</a>
                                                <div class="mess_box">${enquiry.cxContent?substring('${enquiry.cxContent?index_of("原因：")}'?number)}</div>
                                                <span class="status-enabled">${statusMap['${enquiry.enquiryState}']}</span>
                                            </div>
                                        <#else>
                                            <span class="status-enabled">${statusMap['${enquiry.enquiryState}']}</span>
                                        </#if>
                                    </td>
                                    <td class="cell-a cell-s receive-quotation-num">

                                                <#--<div class="ts_info">
                                                    <a href="#"class="ts">提示</a>
                                                    <div class="mess_box">111</div>
                                                    <span class="go-less"><#if enquiry.quotationCount == 0 >暂未收到报价<#else>${enquiry.quotationCount}</#if></span>
                                                </div>-->
                                                    <#if enquiry.quotationCount == 0 >暂未收到报价<#else>${enquiry.quotationCount}</#if>
                                    </td>
                                    <td class="cell-b">${enquiry.viewCount}次</td>
                                    <td class="cell-b cell-op"><dl>
                                        <dd><a class="sear_btn quotation-detail-btn go-btn-g-s" href="${base}/quotation/list.html?enquiryId=${enquiry.id}" target="_blank">查看报价</a></dd>
                                        <#if enquiry.enquiryState == '4' || enquiry.enquiryState == '3' || enquiry.enquiryState == '2'><!-- 判断报价单状态,在已完成或者撤销报价单时删除报价单 -->
                                            <dd><a href="${base}/enquiry/popupDel.html?id=${enquiry.id}" class="enquiryDel">删除</a></dd>
                                        <#else>
                                            <dd><a href="${base}/enquiry/popupRevoke.html?id=${enquiry.id}" class="preclose-btn enquiryRevoke">撤销询价</a></dd>
                                        </#if>

                                        <dd><a href="${base}/enquiry/publish.html?enquiryId=${enquiry.id}" target="_blank">发布相似询价单</a></dd>
                                    </dl></td>
                                </tr>
                                </#list>

                                <#else>
                                    <tr>
                                       <td class="no-date" colspan="7">暂无数据！</td>
                                    </tr>
                                </#if>
                            </tbody>
                        </table>
                    </div>
                <#-- 分页条 -->
                    <div class="clearfix">
                        <div class="pagin fr">
                            <#if pager!false && pager.list?size &gt; 0>
                                <#import "bec/ghj/pager.ftl" as p>
                                <@p.pager pager = pager baseUrl = "/enquiry/list.html?releaseDateTimeS=${formMap.releaseDateTimeS}&releaseDateTimeE=${formMap.releaseDateTimeE}&status=${formMap.status}&currtitle=${formMap.title}" />
                            <#else>
                                <div class="noRecord">你还没有询价单！</div>
                            </#if>
                        </div>
                    </div>
                    <div class="clr"></div>
                    </li>
                    </ul>
                </div>
            </div>
        </div>
        </div>
    </div>


    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $(".enquiryDel").colorbox({iframe:true, innerWidth:520, innerHeight:150, opacity: 0.15,overlayClose:false});
        $(".enquiryRevoke").colorbox({iframe:true, innerWidth:600, innerHeight:400, opacity: 0.15,overlayClose:false});
        $(".ts_info a").mouseover(function(){
            $(this).nextAll(".mess_box").show();
        }).mouseout(function(){
            $(this).nextAll(".mess_box").hide();
        });
    });

    function setTab(status){
        $("#status").val(status);
        $("#title").val('');
        $("#releaseDateTimeS").val('');
        $("#releaseDateTimeE").val('');
        $("#searchForm").submit();
    }

    /**
     * 删除
     * @param orderId 订单Id
     */
    function delEnquiry(id) {
        $("#orderpay").colorbox.close();
        $.ajax({
            type: 'post',
            url: '${base}/enquiry/del/' + id,
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

    function delEnquiryError(){
        $("#orderpay").colorbox.close();
    }

    /**
     * 撤销
     * @param orderId 订单Id
     */
    function revokeEnquiry(id,reason) {
        $("#orderpay").colorbox.close();
        $.ajax({
            type: 'post',
            url: '${base}/enquiry/revoke/' + id + '/'+encodeURI(encodeURI(reason)),
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

    function revokeEnquiryError(){
        $("#orderpay").colorbox.close();
    }

</script>
</#escape>