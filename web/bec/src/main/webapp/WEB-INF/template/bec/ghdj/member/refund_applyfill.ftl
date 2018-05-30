<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
    <#include "bec/ghdj/top.ftl"/>
<div class="content">
    <div class="breadcrumb">
        <strong><a href="${base}/order/list">退款中心</a></strong><span>&nbsp;&gt;&nbsp;订单编号：${order.orderSn}<span></span></span>
    </div><!--breadcrumb end-->
</div>

<div class="content">
    <!--进度条-->
    <div id="mc">
        <ol class="processNav">
        <#assign cls1=''>
        <#assign cls2=''>
        <#assign cls3=''>
        <#assign cls4=''>
        <#assign tit1=''>
        <#assign tit2='2、等待卖家处理退款申请'>
        <#assign tit3='3、等待卖家退款'>
        <#assign tit4='4、已退款，请查收'>
        <#if refund.type="unreceived">
            <#if refund.status == "commit" ||refund.status == "returned"||refund.status == "confirmed">
                <#assign cls2='on' tit2='2、等待卖家处理退款申请'>
                <#assign cls3='' tit3='3、已退款，请查收'>
            <#elseif refund.status == "refunded">
                <#assign cls2='' tit2='2、等待卖家   处理退款申请'>
                <#assign cls3='on' tit3='3、已退款，请查收'>
            <#elseif "${refund.status}"== "unrefund">
                <#assign cls2='' tit2='2、等待卖家处理退款申请'>
                <#assign cls3='on' tit3='3、等待卖家退款'>
            <#elseif "${refund.status}"== "success">
                <#assign cls2='' tit2='2、等待卖家处理退款申请'>
                <#assign cls3='' tit3='3、等待卖家退款'>
                <#assign cls4='on' tit4='4、退款成功'>
            </#if>

            <li id="one" class="step1 ">1、退款申请<b class="extra"></b></li>
            <li id="two" class="step2 ${cls2}">${tit2}<b class="extra"></b></li>
            <li id="three" class="step3 ${cls3}">${tit3}<b class="extra"></b></li>
            <#if "${refund.status}"== "success">
            <li id="four" class="step4 ${cls4}">${tit4}<b class="extra"></b></li>
            </#if>
        </#if>
        <#if refund.type="received">
            <#assign cls2='on' tit2='2、等待卖家处理退款申请'>
            <#assign cls3='' tit3='3、填写物流信息'>
            <#assign cls4='' tit4='4、已退款，请查收'>

            <li id="one" class="step1 ">1、退款申请<b class="extra"></b></li>
            <li id="two" class="step2 ${cls2}">${tit2}<b class="extra"></b></li>
            <li id="three" class="step3 ${cls3}">${tit3}<b class="extra"></b></li>
            <li id="four" class="step4 ${cls4}">${tit4}<b class="extra"></b></li>
        </#if>


        <#--<li id="two" class="step2 on"><#if "${refund.status}" == "commit">2、等待卖家处理退款申请<#elseif "${refund.status}"== "unrefund" || "${refund.status}"== "returned">2、等待卖家处理退款申请<#elseif "${refund.status}"== "refunded">2、等待卖家退款</#if><b class="extra"></b></li>-->
        <#--<li id="three" class="step3"><#if "${refund.status}"== "unrefund">3、等待卖家退款<#elseif "${refund.status}"== "refunded">3、已退款，请查收<#else>3、退款成功</#if><b class="extra"></b></li>-->
        </ol>
        <span class="clr"></span>
    </div>
    <form action="${base}/mall/member/refund" method="post" class="refund-form">
        <input type="hidden" name="orderSn" value="${order.orderSn}"/>
        <input type="hidden" name="shopId" value="${order.shopId}"/>
        <input type="hidden" name="amount" value="${order.totalAmount + order.deliveryFee}"/>
        <div class="myform" id="b">
            <div class="refund-item">
                <span class="label">退款编号：</span>
                <div class="fl">
                    <span class="refund-ftx04"><b>${refund.id}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
                <span class="label">申请退款时间：</span>
                <div class="fl">
                    <span class="refund-ftx04"><b>${refund.createDate?string("yyyy-MM-dd HH:mm:ss")}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
                <span class="label">退款类型：</span>
                <div class="fl">
                        <span class="refund-ftx04"><b>
                        <#if "${refund.type}"== "unreceived">未收货  <#else>已收货</#if>
                        </b></span>
                    <span class="clr"></span>
                </div>
            </div>
        <#--<div class="item">
            <span class="label">退款状态：</span>
            <div class="fl">
                <span class="ftx04"><b>${refund.status}</b></span>
                <span class="clr"></span>
            </div>
        </div>-->
            <div class="refund-item">
                <span class="label">需要退款金额：</span>
                <div class="fl">
                    <span class="refund-ftx04"><b>￥${order.totalAmount}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
                <span class="label">退款原因：</span>
                <div class="fl">
                    <span class="refund-ftx04"><b>${refund.reason}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
                <span class="label">退款说明：</span>
                <div class="fl">
                    <span class="refund-ftx04"><b>${refund.info}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
            <#if size gte 3>
                <span class="label">&nbsp;</span>
                <!--<input class="btn" type="button" tabindex="4"  <#if refund.status == "commit">disabled class="disabled" value="等待卖家处理"<#elseif "${refund.status}"== "returned"> onclick="back();" value="被驳回次数达到上限，请返回" <#elseif "${refund.status}"== "refunded"> value="确认收款" onclick="onNext(0);"<#else>value="返回" onclick="onNext(1);"</#if> id="endsubmit" class="btn-img btn-entry">-->
                <#--<input class="btn" type="button" tabindex="4"  <#if refund.status == "commit">disabled class="disabled" value="等待卖家处理"<#elseif "${refund.status}"== "returned"> onclick="back();" value="被驳回次数达到上限，请返回" <#elseif "${refund.status}"== "refunded"> value="确认收款" onclick="onNext(0);" <#else>value="返回" onclick="onNextBack();"</#if> id="endsubmit" class="btn-img btn-entry">-->
                <input class="btn" type="button" tabindex="4"  <#if refund.status == "commit">disabled class="disabled" value="等待卖家处理"<#elseif "${refund.status}"== "returned"> onclick="back();" value="被驳回次数达到上限，请返回" <#elseif "${refund.status}"== "refunded"> value="确认收款" onclick="onNext(0);" <#elseif "${refund.status}"== "confirmed">value="下一步" onclick="fill_address()"<#else>value="返回" onclick="onNextBack();"</#if> id="endsubmit" class="btn-img btn-entry">
                <#--Desc:当退款申请被驳回两次以上 第三次同意时，退款状态为confirmed 应该显示下一步操作，但是判断状态中没有此状态，增加下一步状态。Auth:zhangqiang Time:2015-11-23 10:57:36  End-->
            <#else>
                <span class="label">&nbsp;</span>
                <!--<input class="btn" type="button" tabindex="4"<#if refund.status=="confirmed"&&refund.type="received">value="下一步" onclick="fill_address()"</#if>  <#if refund.status == "commit">disabled class="disabled" value="等待卖家处理" <#elseif refund.status== "returned"> value="请求被驳回，请重新申请" onclick="nextRefund()"  <#elseif refund.status== "refunded"> value="确认收款" onclick="onNext(0);"<#else>value="返回" onclick="onNext(1);"</#if>  id="findPwdSubmit" class="btn-img btn-entry">-->
                <input class="btn" type="button" tabindex="4"<#if refund.status=="confirmed"&&refund.type="received">value="下一步" onclick="fill_address()"</#if>  <#if refund.status == "commit">disabled class="disabled" value="等待卖家处理" <#elseif refund.status== "returned"> value="请求被驳回，请重新申请" onclick="nextRefund()"  <#elseif refund.status== "refunded"> value="确认收款" onclick="onNext(0);"<#else>value="返回" onclick="onNextBack();"</#if>  id="findPwdSubmit" class="btn-img btn-entry">
                <span style="color: #ff0000">最多只能提交3次退款申请</span>
            </#if>
            </div>
        </div>
    </form>
</div>
</div>

<#include "bec/ghdj/service.ftl"/>
<#include "bec/ghdj/foot.ftl"/>

<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>

<script type="text/javascript">
    function fill_address(){
        window.location.href="${base}/member/refund/refundsuccess/${refund.orderSn}";
    }
    function nextRefund(){
        $.ajax({
            type: "POST",
            url: "${base}/member/refund/refundurl/${refund.orderSn}",
            datatype: 'json',
            success: function(data) {
                var size = data.size;
                if(size>=3){
                    layer.msg('驳回三次，不能进行此操作', {icon: 2});
                    return false;
                }else{
                    window.location.href="${base}/member/refund/apply/"+"${refund.orderSn}"+".html";
                }
            }
        });
    }
    function back(){
        window.location.href="${base}/member/refund/list";
    }
    var clickAllow = "true";
    var clickAllow = "true";
    function onNext(a){
        if(a==0) {
            layer.confirm('您确定要收款吗？', {icon: 3, title:'温馨提示'}, function(index) {
                if (clickAllow == "true") {
                    clickAllow = "false";
                    $.ajax({
                        type: "POST",
                        url: "${base}/member/refund/applyfillupdate/" + "${refund.id}",
                        datatype: 'json',
                        success: function (data) {
                            if (data.status == 'success') {
                                window.location.href = "${base}/member/refund/list";
                            } else {
                                clickAllow == "true"
                                layer.alert(data.message, {icon: 2, title: "温馨提示"});
                                window.location.href = "${base}/member/refund/list";
                            }
                        }
                    });
                } else {
                    window.location.href = "${base}/member/refund/list";
                }
                layer.close(index);
            },function(index){
                clickAllow = "true";
                layer.close(index);
            });
        }
    }

    /**
     * 返回退款列表
     * @return
     */
    function onNextBack(){
        window.location.href = "${base}/order/list";
    }
</script>

</#escape>