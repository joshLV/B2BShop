<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/vmredenvelopaccount/getRedenvelopRecord">红包管理</a></strong><span>&nbsp;&gt;&nbsp;红包信息</span>
        </div>
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="redenvelopRecord_list"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>红包流水信息</em></h1>
            <input type="hidden" id="groupHiddenId" value="${groupId}" />
            <input type="hidden" id="redEnvelopTypeHiddenId" value="${redEnvelopType}" />
            <input type="hidden" id="redEnvelopAccessTypeHiddenId" value="${redEnvelopAccessType}" />
            <div class="user_right p10">
                <div class="fore0ss">
                    <div class="filter_div_red_d">
                        领取或支付日期: <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="startDate" name="startDate" value="${startDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" onchange="searchRedEnvelopDetail();" required><em class="bing-less"></em>
                        ~ <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="endDate" name="endDate" value="${endDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\',{d:+1})}'})" onchange="searchRedEnvelopDetail();" required><em class="bing-less"></em>
                    </div>
                    <div class="filter_div_red_c">
                        <select class="seles" id="redEnvelopTypeId" onchange="searchRedEnvelopDetail();">
                            <optgroup>
                                <option>请选择红包类型</option>
                                <option value="rebate">返利红包</option>
                                <option value="action">活动红包</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="filter_div_red_c">
                        <select class="seles" id="redEnvelopAccessTypeId" onchange="searchRedEnvelopDetail();">
                            <optgroup>
                                <option>请选择使用方式</option>
                                <option value="0">领取</option>
                                <option value="1">支付</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="filter_btn_div">
                        <a href="javascript:void(0)" class="search_btn_red" onclick="searchRedEnvelopDetail();" >查&nbsp;&nbsp;询</a>
                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div class="tb-void" style="margin-top: 30px;">
                    <input type="hidden" name="basePath" id="basePath" value="${base}"/>
                    <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
                    <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="redEnvelopDetailDataTable">
                        <tbody>
                        <tr>
                            <th width="50">红包类型</th>
                            <th width="50">使用方式</th>
                            <th width="100">交易金额</th>
                            <th width="100">订单编号</th>
                            <th width="100">领取或支付时间</th>
                        </tr>
                        <#if redenvelopRecordDetailList?? && redenvelopRecordDetailList?size &gt; 0 >

                            <#list redenvelopRecordDetailList as list>
                            <tr>
                                <td width="50">
                                    <#if list.redEnvelopType = "rebate">
                                        返利红包
                                    <#else>
                                        活动红包
                                    </#if>
                                </td>
                                <td width="50">
                                    <#if list.accessType = "1">
                                        支付
                                    <#else>
                                        领取
                                    </#if>
                                </td>
                                <td width="100" style="color: #ff0000;">
                                    ￥${list.amount?string("##0.00")}
                                </td>
                                <td width="100" class="redEnvelop_a">
                                    <#if list.orderId??>
                                        <a target="_blank" href="${base}/order/view/${list.orderId}.html">${list.orderSn}</a>
                                    <#else>
                                        ${list.orderSn}
                                    </#if>
                                </td>
                                <td width="100">${list.createTime?string("yyyy-MM-dd HH:mm")}</td>
                            </tr>
                            </#list>
                        <#else>
                        <tr>
                            <td colspan="5">
                                <div class="nocont-boxs nocont-orders">
                                    <b class="icon-orders"></b>你还没有红包！
                                </div>
                            </td>
                        </tr>
                        </#if>
                        </tbody>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="shopping_list" id="title_reminder" style="background: #f3f3f3;">
                            <#if redenvelopRecordDetailList?size==pager.totalCount>
                                <td colspan="5" align="center" style="color: #ff0000;">没有了...</td>
                            <#else>
                                <td colspan="5" align="center" style="color: #ff0000;">下拉加载更多数据!</td>
                            </#if>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<script src="${base}/static/js/uploadPreview.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/ghdj/js/red_envelop/ajaxRedEnvelopDetail.js" type="text/javascript"></script>
<script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var redEnvelopTypeId = $("#redEnvelopTypeHiddenId").val();
        if(!isEmpty(redEnvelopTypeId)){
            $("#redEnvelopTypeId").find("option[value='"+redEnvelopTypeId+"']").attr("selected",true);
        }else{
            $("#redEnvelopTypeId").find("option[text='请选择红包类型']").attr("selected",true);
        }

        var redEnvelopAccessTypeId = $("#redEnvelopAccessTypeHiddenId").val();
        if(!isEmpty(redEnvelopAccessTypeId)){
            $("#redEnvelopAccessTypeId").find("option[value='"+redEnvelopAccessTypeId+"']").attr("selected",true);
        }else{
            $("#redEnvelopAccessTypeId").find("option[text='请选择使用方式']").attr("selected",true);
        }
    });

    /**
     * Desc:查看红包明细
     * @param:id 红包ID
     * */
    function getRedEnvelopDetail(id){
        if(!isEmpty(id)){
            window.location="${base}/vmredenvelopaccount/getRedEnvelopDetail?groupId="+id;
        }else{
            layer.alert("查看失败!",{icon:2});
        }

    }

    /**
     * Desc:根据条件查询红包流水信息
     * */
    function searchRedEnvelopDetail(){
        var groupHiddenId = $("#groupHiddenId").val();
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        var redEnvelopType = $("#redEnvelopTypeId").val();
        var redEnvelopAccessType = $("#redEnvelopAccessTypeId").val();

        var url = "${base}/vmredenvelopaccount/getRedEnvelopDetail?groupId="+groupHiddenId+"&startDate="+startDate+"&endDate="+endDate;

        if(redEnvelopType != '请选择红包类型'){
            url += "&redEnvelopType="+redEnvelopType;
        }

        if(redEnvelopAccessType != '请选择使用方式'){
            url += "&redEnvelopAccessType="+redEnvelopAccessType;
        }
        window.location = url;
    }

</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>