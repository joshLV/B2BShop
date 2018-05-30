<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
<div id="container">
    <#include "bec/ghj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/credit/list">资产中心</a></strong><span>&nbsp;&gt;&nbsp;放款申请</span>
        </div>
        <div class="member_left">
            <#import "bec/ghj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="creditReply_list"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>放款申请</em></h1>
            <div class="user_right p10">
                <div class="tb-void">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <th width="80">申请放款时间</th>
                            <th width="120">申请放款金额</th>
                            <th width="120">实际放款金额</th>
                            <th width="50">放款人</th>
                            <th width="120">放款时间</th>
                            <th width="80">放款状态</th>
                           <#-- <th width="80">备注信息</th>-->

                        </tr>
                            <#if creditLoanLog?? && creditLoanLog?size &gt; 0 >
                                <#list creditLoanLog as list>
                                <tr>
                                    <td width="80">${(list.applyLoanTime?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                    <td width="120">${list.applyLoanAmount}</td>
                                    <td width="120">${list.actualLoanAmount}</td>
                                    <td width="100">${list.loanUser}</td>
                                    <td width="100">${(list.actualLoanTime?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                    <td width="100">
                                    <#if '${list.loanStatus}'== 'apply_loaning'>
                                        <font color="blue">申请放款中</font>
                                    </#if>
                                    <#if '${list.loanStatus}'== 'apply_loan_success'>
                                    <font color="green">  放款申请成功</font>
                                    </#if>
                                    <#if '${list.loanStatus}'== 'apply_loan_fail'>
                                        <font color="red"> 放款申请失败</font>
                                    </#if>
                                    </td>
                                   <#-- <td width="80">${list.remark}</td>-->
                                </tr>
                                </#list>

                            </#if>
                        </tbody>
                    </table>

                </div>

                <div class="mymoney_pages f-cb" >
                    <div class="pagin fr">
                        <#if pager!false && pager.list?size &gt; 0>
                            <#import "bec/ghj/pager.ftl" as p>
                            <@p.pager pager = pager baseUrl = "/credit/list" />
                        <#else>
                            <div class="noRecord">你还没有放款历史记录！</div>
                        </#if>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
</script>
    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>