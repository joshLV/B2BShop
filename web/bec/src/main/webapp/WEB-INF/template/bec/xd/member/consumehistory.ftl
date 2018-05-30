<#escape x as x?html>
    <#include "bec/xd/header.ftl"/>
<div id="container">
    <#include "bec/xd/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/member/info.html">账户中心</a></strong><span>&nbsp;&gt;&nbsp;消费记录</span>
        </div>
        <div class="member_left">
            <#import "bec/xd/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="xfjl"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>消费记录</em></h1>
            <div class="user_right p10">
                <div class="user_t">
                    <div class="xiaofei">
                        <#assign totalPrice = 0>
                        <#list orderList as list>
                            <#assign price = (list.totalAmount?number)>
                            <#assign totalPrice = totalPrice+price>
                        </#list>
                        最近20笔消费金额总数：<strong class="num">￥${totalPrice}</strong>
                    <#--<a href="">查看您的会员级别</a>-->
                    </div>
                    <div class="user_mt">
                        <ul class="extra-l">
                            <li class="fore-1"><s></s><b></b><a class="curr" href="">最近20条消费记录</a></li>
                        </ul>
                    </div>
                </div>
                <div class="tb-void">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <th width="200">时间</th>
                            <th width="150">订单号</th>
                            <th width="150">消费金额</th>
                            <th>备注</th>
                        </tr>
                        <#if orderList?? && orderList?size &gt; 0 >

                            <#list orderList as list>
                            <tr>
                                <td width="200">${(list.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                <td width="150"><a href="${base}/order/view/${list.id}.html" style="color: #e9314a;">${(list.orderSn)!}</a></td>
                                <td width="150">￥${(list.totalAmount)!}</td>
                                <td>订单${(list.orderSn)!}完成</td>
                            </tr>
                            </#list>
                        <#else>
                        <tr>
                            <td colspan="4">
                                <div class="nocont-box nocont-order">
                                    <b class="icon-order"></b>你买的东西太少了，这里空空的，快去挑选合适的商品吧！
                                </div>
                            </td>
                        </tr>
                        </#if>
                        </tbody>
                    </table>
                </div>

                <div class="mymoney_pages f-cb" >
                    <div class="pagin fr">
                        <#if pager!false && pager.list?size &gt; 0>
                            <#import "bec/xd/pager.ftl" as p>
                            <@p.pager pager = pager baseUrl = "/member/consumehistory/list.html" />
                        <#else>
                            <div class="noRecord">你还没有订单！</div>
                        </#if>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
    <#include "bec/xd/service.ftl"/>
    <#include "bec/xd/foot.ftl"/>
</#escape>