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
            <h1><em>红包信息</em></h1>
            <input type="hidden" id="redEnvelopTypeHiddenId" value="${redEnvelopType}" />
            <div class="user_right p10">
                <div class="fore0ss" style="border-left: none !important; border-right: none !important;">
                    <div class="filter_div_red">
                        失效日期: <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="startDate" name="startDate" value="${startDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endDate\',{d:-0})}'})" onchange="searchRedEnvelop();" required><em class="bing-less"></em>
                        ~ <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="endDate" name="endDate" value="${endDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\',{d:+0})}'})" onchange="searchRedEnvelop();" required><em class="bing-less"></em>
                    </div>
                    <div class="filter_div_red_b">
                        <input type="text" class="filter_input_red" name="search_merchantName" id="search_merchantName" onblur="searchRedEnvelop();" placeholder="发放方" value="${merchantName}"/>
                        <a href="javascript:void(0)" class="mn_del" style="top: 12px; right: 0px; display: block;" onclick="$('#search_merchantName').val('');searchRedEnvelop();"></a>
                    </div>
                    <div class="filter_div_red_c">
                        <select class="seles" id="redEnvelopTypeId" onchange="searchRedEnvelop();">
                            <optgroup>
                                <option>请选择红包类型</option>
                                <option value="rebate">返利红包</option>
                                <option value="action">活动红包</option>
                            </optgroup>
                        </select>
                    </div>
                    <div class="filter_btn_div">
                        <a href="javascript:void(0)" class="search_btn_red" onclick="searchRedEnvelop();" >查&nbsp;&nbsp;询</a>
                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div class="tb-void" style="margin-top: 30px;">
                    <input type="hidden" name="basePath" id="basePath" value="${base}"/>
                    <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
                    <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" id="redEnvelopDataTable">
                        <tbody>
                        <tr>
                            <th width="40">红包类型</th>
                            <th width="80">可用金额</th>
                            <th width="85">订单使用限值</th>
                            <th width="85">单笔交易最大使用金额</th>
                            <th width="100">发放方</th>
                            <th width="80">失效时间</th>
                            <th width="50">操作</th>
                        </tr>
                        <#if redenvelopRecordList?? && redenvelopRecordList?size &gt; 0 >

                            <#list redenvelopRecordList as list>
                            <tr>
                                <td width="40">
                                    <#if list.redEnvelopType = "rebate">
                                        返利红包
                                    <#else>
                                        活动红包
                                    </#if>
                                </td>
                                <td width="80" style="color: #ff0000;">
                                    ￥${list.amount?string("##0.00")}
                                </td>
                                <td width="85">
                                    ￥${list.limitation?string("##0.00")}
                                </td>
                                <td width="85">
                                    ￥${list.singleMaximum?string("##0.00")}
                                </td>
                                <td width="100">
                                    ${list.merchantName}
                                </td>
                                <td width="80">${list.expiryTime?string("yyyy-MM-dd HH:mm")}</td>
                                <td width="50">
                                    <input class="btn-5ss" type="button" value="查看流水" onclick="getRedEnvelopDetail('${list.groupId}');">
                                </td>
                            </tr>
                            </#list>
                        <#else>
                        <tr>
                            <td colspan="7">
                                <div class="nocont-boxs nocont-orders">
                                    <b class="icon-orders"></b>没有符合条件的红包！
                                </div>
                            </td>
                        </tr>
                        </#if>
                        </tbody>
                    </table>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="shopping_list" id="title_reminder" style="background: #f3f3f3;">
                            <#if redenvelopRecordList?size==pager.totalCount>
                                <td colspan="7" align="center" style="color: #ff0000;">没有了...</td>
                            <#else>
                                <td colspan="7" align="center" style="color: #ff0000;">下拉加载更多数据!</td>
                            </#if>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<script src="${base}/static/js/uploadPreview.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/ghdj/js/red_envelop/ajaxRedEnvelop.js" type="text/javascript"></script>
<script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        var redEnvelopTypeId = $("#redEnvelopTypeHiddenId").val();
        if(!isEmpty(redEnvelopTypeId)){
            $("#redEnvelopTypeId").find("option[value='"+redEnvelopTypeId+"']").attr("selected",true);
        }else{
            $("#redEnvelopTypeId").find("option[text='请选择红包类型']").attr("selected",true);
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
     * Desc:根据条件查询红包
     * */
    function searchRedEnvelop(){
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        var merchantName = $("#search_merchantName").val();
        var redEnvelopType = $("#redEnvelopTypeId").val();

        var url = "${base}/vmredenvelopaccount/getRedenvelopRecord?startDate="+startDate+"&endDate="+endDate+"&merchantName="+merchantName;
        if(redEnvelopType != '请选择红包类型'){
            url += "&redEnvelopType="+redEnvelopType;
        }
        window.location = url;
    }

</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>