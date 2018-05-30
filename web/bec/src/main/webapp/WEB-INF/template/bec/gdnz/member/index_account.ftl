<#escape x as x?html>
    <#include "bec/gdnz/header.ftl"/>
<div id="container">
    <#include "bec/gdnz/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong> <a href="${base}/member/info.html">账户管理</a></strong><span>&nbsp;&gt;&nbsp;账户充值/提现<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/gdnz/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="account_charge"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list">
            <h1>账户充值/提现</h1>
            <div class="user_right">
                <ul class="navi_list clearfix" style="margin-top: 30px;">
                    <li><a href="${base}/account/account/recharge">账户充值&nbsp;/&nbsp;提现</a></li>
                    <li><a href="${base}/account/rechargeList">账户充值记录</a></li>

                    <li><a href="${base}/account/cashList)">账户提现记录</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
    <#include "bec/gdnz/service.ftl"/>
    <#include "bec/gdnz/foot.ftl"/>
</#escape>