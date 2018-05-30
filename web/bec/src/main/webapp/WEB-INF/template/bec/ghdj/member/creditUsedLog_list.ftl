<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/credit/list">资产中心</a></strong><span>&nbsp;&gt;&nbsp;授信使用记录</span>
        </div>
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="creditUsedLog"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>授信操作记录</em></h1>
            <div class="fore0ss" style="border-left: 1px solid #E6E6E6; border-right: 1px solid #E6E6E6;">
                <div style="position: relative; left:10px; z-index: 30;">
                    <div class="filter_div">
                        <input type="text" class="filter_input" name="bankName" id="bankName" placeholder="银行名称" value="${bankName}"/>
                    </div>
                    <div style="margin-top: 3px; float: left;">
                    开始日期: <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="startDate" name="startDate" value="${startDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"  required><em class="bing-less"></em>
                    结束日期: <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="endDate" name="endDate" value="${endDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\',{d:+1})}'})"  required><em class="bing-less"></em>&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                        <input id="button_show" class="btn-5-new_po"  type="button" onclick="searchCredit();" value="查询" />
                </div>
            </div>
            <div class="user_right p10">
                <div class="tb-void">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <th width="80">银行名称</th>
                            <th width="120">对应支行名称</th>
                            <th width="80">授信金额(元)</th>
                         <#--   <th width="170">累计已放款金额</th>
                            <th width="80">已用金额</th>-->
                            <th width="80">放款(+)/使用(-)金额(元)</th>
                            <th width="120">操作时间</th>
                            <th width="80">操作说明</th>

                        </tr>
                            <#if creditUsedList?? && creditUsedList?size &gt; 0 >
                                <#list creditUsedList as list>
                                <tr>
                                    <td width="80">${list.bankName}</td>
                                    <td width="120">${list.bankDept}</td>
                                    <td width="100">${list.creditAmount?string('##0')}</td>
                                    <td width="80">${list.amount?string('##0.00')}</td>
                                    <td width="120">${(list.usedTime?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                    <td width="80">${list.remark}</td>
                                </tr>
                                </#list>
                            </#if>
                        </tbody>
                    </table>

                </div>

                <div class="mymoney_pages f-cb" >
                    <div class="pagin fr">
                        <#if pager!false && pager.list?size &gt; 0>
                            <#import "bec/ghdj/pager.ftl" as p>
                            <@p.pager pager = pager baseUrl = "/credit/useList" />
                        <#else>
                            <div class="noRecord">你还没有授信使用记录！</div>
                        </#if>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">

    /**
     * Desc:根据用申请状态或申请时间查询授信申请
     * */
    function searchCredit(){
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        var bankName = $("#bankName").val();
        window.location="${base}/credit/useList?startDate="+startDate+"&endDate="+endDate+"&bankName="+bankName;
    }
</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>