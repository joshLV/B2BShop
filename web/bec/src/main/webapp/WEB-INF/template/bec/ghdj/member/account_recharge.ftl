<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/account/recharge">资产中心</a></strong><span>&nbsp;&gt;&nbsp;账户充值<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="account_charge"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>账户充值</em></h1>
            <div class="user_right">
                    <table width="100%" style="table-layout:fixed;" cellpadding="0" cellspacing="0" class="pwd-table">
                        <tbody>
                        <tr>
                            <td width="20%" style="padding-left:50px;">
                                <span class="pwd-label">
                                    账户金额 :
                                </span>
                            </td>
                            <td width="80%">
                                <em>￥<#if account.accountTotal??>${account.accountTotal?string("##0.00")}<#else>0.00</#if></em>
                            </td>

                        </tr>
                        <tr>
                            <td width="20%" style="padding-left:50px;">
                                <span class="pwd-label">
                                   已冻结资金：
                                </span>
                            </td>
                            <td width="80%">
                                <em>￥<#if account.accountBlock??>${account.accountBlock?string("##0.00")}<#else>0.00</#if></em>
                            </td>

                        </tr>
                        <tr>
                            <td width="20%" style="padding-left:50px;">
                                <span class="pwd-label">
                                   可用金额：
                                </span>
                            </td>
                            <td width="80%">
                                <em>￥<#if account.accountTotal?? && account.accountBlock??>${(account.accountTotal-account.accountBlock)?string("##0.00")}<#else>0.00</#if></em>
                            </td>

                        </tr>
                        <tr>
                            <td width="100%" colspan="2" style="padding-left:50px;">
                                <em><a href="${base}/account/rechargeCheck"><font  class="recharge-btn">充值</font></a></em>
                            </td>
                        <#--    <td>
                                <font color="red"> <em><a href="${base}/account/cashCheck"><font color="red">提现</font></a></em></font>
                            </td>-->

                        </tr>

                        </tbody>
                    </table>
            </div>
        </div>
    </div>
</div>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>