<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container" style="background: #f7f7f7;">
    <#include "bec/ghdj/top.ftl"/>
    <div class="member_content f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a></strong><span>&nbsp;&gt;&nbsp;个人主页<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <!-- leftMenu-->
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="xjdlb"/>
            <!--leftMenu end-->
        </div>
        <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="${base}/static/bec/project/ghdj/css/inquiry_sheet.css" rel="stylesheet" type="text/css" media="all"/>
        <link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghdj/css/baojia_list.css">
        <script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
        <div class="member_right">

            <div class="baojia_list">
                <h1><em>报价单列表</em></h1>
                <div id="bjzzjs_net_1">
                    <div class="bjtabcon" id="bjtabcon0">
                        <ul class="block">
                            <li>
                                <div class="bj_ss">
                                <span class="bj_sear">
                                   <table class="go-tab-bjframe manage-bjtable go-tab-pad" >
                                       <tr class="go-tab-bjtit">
                                           <td align="left" colspan="2">询价单</td>
                                           <td  class="cell-a">
                                           </td>
                                       </tr>
                                       <tr>
                                           <td  class="cell-b">标题：</td>
                                           <td class="cell-a">${enquiry.title}</td>
                                           <td  class="cell-a">
                                               已收报价单：${countTotal}个
                                           </td>
                                       </tr>
                                       <tr>
                                           <td  class="cell-b">当前状态：</td>
                                           <td  class="cell-a">${statusMap['${enquiry.enquiryState}']}</td>

                                           <td  class="cell-a">
                                               <dd><a class="sear_btn quotation-detail-btn go-bjbtn-g-s" href="${base}/enquiry/detail/${enquiry.id}" target="_blank">查看询价单详情</a></dd>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td class="cell-b">报价截止还剩：</td>
                                           <td class="cell-a">${surplusDay} 天 ${surplusHour} 小时</td>

                                           <td class="cell-a">
                                               <#if enquiry.enquiryState == '4'>
                                                   <dd><a href="${base}/enquiry/popupDel.html?id=${enquiry.id}" class="enquiryDel">删除询价单</a></dd>
                                               <#else>
                                                   <dd><a href="${base}/enquiry/popupRevoke.html?id=${enquiry.id}" class="preclose-btn enquiryRevoke">撤销询价</a></dd>
                                               </#if>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td class="cell-b">询价产品：</td>
                                           <td class="cell-a">${goodsNames}</td>

                                           <td class="cell-a">
                                               <dd><a href="${base}/enquiry/publish.html?enquiryId=${enquiry.id}" target="_blank">发布相似询价单</a></dd>
                                           </td>
                                       </tr>
                                   </table>
                                </div>
                    </div>
                    <div class="bj_con">
                        <table class="go-tab-bjframe manage-bjtable" width="100%" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr class="go-tab-bjhead">
                                <td class="cell-gys">报价供应商</td>
                                <td class="cell-ze">报价总额（含运费）</td>
                                <td class="cell-times">报价时间</td>
                                <td class="cell-times">有效期至</td>
                                <td class="cell-cz cell-op" style="padding-left: 0px; width: 152px;">操作</td>
                            </tr>
                            </tbody>
                        </table>
                        <table id="buyoffer-content" class="go-tab-bjframe manage-bjtable" width="100%" cellpadding="0" cellspacing="0" style="border-top: none; padding-top: 0px;">
                            <tbody>
                                <#if quotationList?? && quotationList?size &gt; 0>
                                <#list quotationList as quotation>
                                <tr>
                                    <td class="cell-gys title"><div class="quotation-name"> <a class="offer-name" target="_blank" href="${base}/shop/${quotation.urlAddress}" title="${quotation.merchantName}">${quotation.merchantName}</a> </div></td>
                                    <td class="cell-ze"><p>${quotation.totalCost?string("currency")}<span class="hyf_color">（含运费：${quotation.freightTotalCost?string("currency")}）</span></p></td>
                                    <td class="cell-times"><p>${quotation.createDate?string("yyyy-MM-dd")}
                                            ${quotation.createDate?string("HH:mm:ss")}</p></td>
                                    <td class="cell-times">
                                        <p>${quotation.quotationPeriod?string("yyyy-MM-dd")}
                                    ${quotation.quotationPeriod?string("HH:mm:ss")}<#if quotation.isEnd><p><b>(<font style="color:red">已过期</font>)</b></p></#if></p>
                                    </td>
                                    <td class="cell-cz cell-op"><dl >
                                        <#if quotation.isDownOrder == '2'>
                                            <dd><span class="cell-single" >已下单</span></dd>
                                            <div id="triangle-down"></div>
                                        </#if>
                                        <dd><a class="sear_btn quotation-detail-btn go-bjbtn-g-s" href="${base}/quotation/list_detail.html?quotationId=${quotation.id}" target="_blank">查看报价单详情</a></dd>
                                        <#if !quotation.isEnd && quotation.isDownOrder != '2'>
                                            <dd><a href="${base}/quotation/popupReturn.html?id=${quotation.id}" class="preclose-btn quotationRevoke">退回报价</a></dd>
                                        </#if>
                                        <dd><a href="${base}/quotation/popupDel.html?id=${quotation.id}" class="quotationDel">删除</a></dd>
                                    </dl></td>
                                </tr>
                                </#list>
                                <#else>
                                <tr>
                                    <td colspan="5" style="height: 44px;line-height: 44px;vertical-align: middle;text-align: center;">您还没有收到报价单！</td>
                                </tr>
                                </#if>
                            </tbody>
                        </table>
                    </div>
                <#-- 分页条 -->
                    <div class="m clearfix">
                        <div class="pagin fr">
                            <#if pager!false && pager.list?size &gt; 0>
                                <#import "bec/ghdj/pager.ftl" as p>
                                <@p.pager pager = pager baseUrl = "/quotation/list.html?releaseDateTimeS=${formMap.releaseDateTimeS}&releaseDateTimeE=${formMap.releaseDateTimeE}&status=${formMap.status}&currtitle=${formMap.title}" />
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
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>


<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<#--<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>-->
<#--<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>-->
<script type="text/javascript">
    $(function () {

        $(".quotationDel").colorbox({iframe:true, innerWidth:520, innerHeight:150, opacity: 0.15,overlayClose:false});
        $(".quotationRevoke").colorbox({iframe:true, innerWidth:600, innerHeight:400, opacity: 0.15,overlayClose:false});
        $(".enquiryRevoke").colorbox({iframe:true, innerWidth:600, innerHeight:400, opacity: 0.15,overlayClose:false});
        $(".enquiryDel").colorbox({iframe:true, innerWidth:520, innerHeight:150, opacity: 0.15,overlayClose:false});

        //左侧菜单折叠操作
        $("#leftMenu dt").click(function(){
            $parent=$(this).parent();
            if($parent.hasClass("close")){
                $parent.removeClass("close");
            }else{
                $parent.addClass("close");
            }
        });
    });


    /**
     * 删除
     * @param orderId 订单Id
     */
    function delQuotation(id) {
        $("#orderpay").colorbox.close();
        $.ajax({
            type: 'post',
            url: '${base}/quotation/del/' + id,
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

    function delQuatationError(){
        $("#orderpay").colorbox.close();
    }

    /**
     * 撤销
     * 修改：
     *     Desc:将退回原因与补充说明放开,便于MCM显示换行
     *     Auth:zhangqiang
     *     Time:2015-11-26 11:36:25 Start
     * @param orderId 订单Id
     */
    function returnQuotation(id,anewOffer,reason,otherRea) {
        $("#orderpay").colorbox.close();
        $.ajax({
            type: 'post',
            url: '${base}/quotation/returnQ/' + id + '/' + anewOffer + '/'+encodeURI(encodeURI(reason)) + '/'+encodeURI(encodeURI(otherRea)),
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

    function returnQuotationError(){
        $("#orderpay").colorbox.close();
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
                    window.location.href = "${base}/enquiry/list.html";
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