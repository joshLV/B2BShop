<#escape x as x?html>
    <#include "bec/xd/header.ftl"/>
<div id="container">
    <#include "bec/xd/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/member/info.html">账户中心</a></strong><span>&nbsp;&gt;&nbsp;积分记录<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/xd/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="memberScore"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list">
            <h1>积分记录</h1>
            <div class="user_right">
                <div class="tb-void">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <th width="180">时间</th>
                            <th width="125">涉及订单号</th>
                            <th width="125">类型</th>
                            <th width="125">积分</th>
                            <th>备注</th>
                        </tr>
                        <#if vantagesList?? && vantagesList?size &gt; 0 >
                        <#list vantagesList as list>
                        <tr>
                            <td width="180">${(list.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                            <td width="125"><a href="${base}/order/view/${list.orderId}.html">${(list.orderSn)!}</td>
                            <td width="125">${(list.flag==1)?string('购买商品','退款')}</td>
                            <td width="125">${(list.score)!}</td>
                            <td>${(list.description)!}</td>
                        </tr>
                        </#list>
                        <#else>
                        <tr>
                            <td colspan="5">
                                <div class="nocont-box nocont-order">
                                    <b class="icon-order"></b>你买的东西太少了，这里空空的，快去挑选合适的商品吧！
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
                <div class="pagin fr">
                    <#if pager!false && pager.list?size &gt; 0>
                        <#import "bec/xd/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/member/vantages/list.html" />
                    <#else>
                        <div class="noRecord">你还没有积分记录！</div>
                    </#if>
                </div>
            </div>
            <div class="clr"></div>



        </div>
    </div>
</div>
    <#include "bec/xd/service.ftl"/>
    <#include "bec/xd/foot.ftl"/>
</#escape>