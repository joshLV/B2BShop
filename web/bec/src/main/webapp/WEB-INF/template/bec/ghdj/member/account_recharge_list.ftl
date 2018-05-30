<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/account/recharge">账户管理</a></strong><span>&nbsp;&gt;&nbsp;账户充值记录<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="account_chargeList"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>充值记录</em></h1>
            <div class="user_right">
                <div class="tb-void">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <th width="180">交易类型</th>
                            <th width="125">交易时间</th>
                            <th width="125">交易金额</th>

                        </tr>
                            <#if accountLogList?? && accountLogList?size &gt; 0 >
                                <#list accountLogList as accountLog>
                                <tr>
                                    <td width="180">
                                        <#if accountLog.payMethod==0>充值</#if>
                                        <#if accountLog.payMethod==1>冻结</#if>
                                        <#if accountLog.payMethod==2>解冻</#if>
                                        <#if accountLog.payMethod==3>提现</#if>
                                        <#if accountLog.status==0><font color="#e12f45">[失败]</font></#if>
                                        <#if accountLog.status==1><font color="green">[成功]</font></#if>
                                    </td>
                                    <td width="125">${accountLog.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                                    <td width="125">${accountLog.account}</td>

                                </tr>
                                </#list>
                            <#else>
                            <tr>
                                <td colspan="5">
                                    <div class="nocont-box nocont-order">
                                        <b class="icon-order"></b>您还没有充值记录
                                    </div>
                                </td>
                            </tr>
                            </#if>
                        </tbody>
                    </table>
                </div>
            </div>
        <#-- 分页条 -->
            <div class="clearfix">
                <div class="pagin fr" style="margin-top: 5px;">
                    <#if pager!false && pager.list?size &gt; 0>
                        <#import "bec/ghdj/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/account/rechargeList" />
                    <#else>
                        <div class="noRecord">你还没有充值记录！</div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>