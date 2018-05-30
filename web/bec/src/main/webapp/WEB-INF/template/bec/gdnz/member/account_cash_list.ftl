<#escape x as x?html>
    <#include "bec/gwq/header.ftl"/>
<div id="container">
    <#include "bec/gwq/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/account/recharge">账户管理</a></strong><span>&nbsp;&gt;&nbsp;账户提现记录<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/gdnz/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="account_cashList"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list">
            <h1>提现记录</h1>
            <table cellpadding="0" cellspacing="0" width="100%">
                <thead style="height: 50px">
                <tr>
                    <th>提现金额</th>
                    <th>提现人姓名</th>
                    <th>提现人时间</th>
                    <th>提现方式</th>
                    <th>提现帐号</th>
                    <th>手机号码</th>
                    <th>提现状态</th>
                </tr>
                </thead>
                <tbody style="height: 100px">
                    <#list accountCashList as accountcash>
                        <tr>
                            <td>${accountcash.cashAccount}</td>
                            <td>${accountcash.cashName}</td>
                            <td>${accountcash.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                            <td>
                                <#if accountcash.cashType==0>支付宝</#if>
                                <#if accountcash.cashType==1>银行卡</#if>
                            </td>
                            <td>
                                <#if accountcash.cashType==1>
                                   <span>提现银行：</span>${accountcash.bankName}
                                </#if>
                                <span><#if accountcash.cashType==0>支付宝</#if><#if accountcash.cashType==1>银行卡</#if>号：</span>
                                ${accountcash.cashNo}
                            </td>
                            <td>${accountcash.cashPhone}</td>
                            <td>
                                <#if accountcash.status==0>[未审核]</#if>
                                <#if accountcash.status==1>[审核通过]</#if>
                                <#if accountcash.status==2>[未审核通过]</#if>
                                <#if accountcash.status==3>[转账中]</#if>
                                <#if accountcash.status==4>[已转账]</#if>
                            </td>
                        </tr>
                    </#list>
                </tbody>
        </table>
        </div>
        <div class="mymoney_pages f-cb" >
            <div class="pagin fr">
                <#if pager!false && pager.list?size &gt; 0>
                    <#import "bec/gdnz/pager.ftl" as p>
                    <@p.pager pager = pager baseUrl = "/account/cashList.html" />
                <#else>
                    <div class="noRecord">你还没有提现记录！</div>
                </#if>
            </div>
        </div>
    </div>
</div>
    <#include "bec/gwq/service.ftl"/>
    <#include "bec/gwq/foot.ftl"/>
</#escape>