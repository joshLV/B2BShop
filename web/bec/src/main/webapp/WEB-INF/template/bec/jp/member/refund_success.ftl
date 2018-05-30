<#escape x as x?html>
    <#include "bec/jp/header.ftl"/>
    <#include "bec/jp/top.ftl"/>
<div class="content">
    <div class="breadcrumb">
        <strong><a href="${base}/order/list">退款中心</a></strong><span>&nbsp;&gt;&nbsp;订单：${order.orderSn}<span></span></span>
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
        <#assign cls5=''>
        <#assign tit1=''>
        <#assign tit2='2、等待卖家处理退款申请'>
        <#assign tit3='3、填写物流信息'>
        <#assign tit4='4、已退款，请查收'>
        <#assign tit5='5、退款成功'>
        <#if refund.status == "shipped">
            <#assign cls3='on' tit3='3、等待卖家收货'>
            <#assign cls4='' tit4='4、已退款，请查收'>
        </#if>
        <#if refund.status == "unrefund">
            <#assign cls3='on' tit3='3、卖家已收货,等待退款'>
            <#assign cls4='' tit4='4、已退款，请查收'>
        </#if>
        <#if refund.status == "refunded">
            <#assign cls3='' tit3='3、卖家已收货,等待退款'>
            <#assign cls4='on' tit4='4、已退款，请查收'>
        </#if>
        <#if refund.status == "success">
            <#assign cls3='' tit3='3、卖家已收货,等待退款'>
            <#assign cls4='' tit4='4、已退款，请查收'>
            <#assign cls5='on' tit5='5、退款成功'>
        </#if>
            <li id="one" class="step1">1、退款申请<b class="extra"></b></li>
            <li id="two" class="step2 ">2、等待卖家处理退款申请<b class="extra"></b></li>
            <li id="three" class="step3 ${cls3}">${tit3}<b class="extra"></b></li>
            <li id="four" class="step4 ${cls4}">${tit4}<b class="extra"></b></li>
            <li id="five" class="step5 ${cls5}">${tit5}<b class="extra"></b></li>
        </ol>
        <span class="clr"></span>
    </div>
    <form action="${base}/mall/member/refund" method="post" class="refund-form">
        <input type="hidden" name="orderSn" value="${order.orderSn}"/>
        <input type="hidden" name="shopId" value="${order.shopId}"/>
        <input type="hidden" name="amount" value="${order.totalAmount + order.deliveryFee}"/>
        <!--.form与头部搜索框样式互相影响，所以更改名称为form1 Auth:zhangqiang Time:2015-09-23 15:50:35 Start -->
        <div class="form1" id="b">
        <!--.form与头部搜索框样式互相影响，所以更改名称为form1 Auth:zhangqiang Time:2015-09-23 15:50:35 Start -->
            <div class="refund-item">
                <span class="label">退款编号：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.id}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
                <span class="label">申请退款时间：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.createDate?string("yyyy-MM-dd HH:mm:ss")}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
                <span class="label">退款类型：</span>
                <div class="fl">
                        <span class="ftx04"><b>
                        <#if "${refund.type}"== "unreceived">未收货  <#else>已收货</#if>
                        </b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
                <span class="label">需要退款金额：</span>
                <div class="fl">
                    <span class="ftx04"><b>￥${order.totalAmount}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
                <span class="label">退款原因：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.reason}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
                <span class="label">退款说明：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.info}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
        <#if "${refund.type}"=="received">
        <#--Desc:不需要一下信息 Auth:zhangqiang Time:2015-12-04 16:45:25 Start-->
            <#--<div class="refund-item">-->
                <#--<span class="label">收货人姓名：</span>-->

                <#--<div class="fl">-->
                    <#--<!-- text_error &ndash;&gt;-->
                    <#--<span class="ftx04"><b>${refund.shipName}</b></span>-->
                    <#--<span class="clr"></span>-->
                <#--</div>-->
            <#--</div>-->
            <#--<div class="refund-item">-->
                <#--<span class="label">收货地址：</span>-->

                <#--<div class="fl">-->
                    <#--<!-- text_error &ndash;&gt;-->
                    <#--<span class="ftx04"><b>${refund.shipAddress}</b></span>-->
                    <#--<span class="clr"></span>-->
                <#--</div>-->
            <#--</div>-->
            <#--<div class="refund-item">-->
                <#--<span class="label">邮编：</span>-->

                <#--<div class="fl">-->
                    <#--<!-- text_error &ndash;&gt;-->
                    <#--<span class="ftx04"><b>${refund.shipZipCode}</b></span>-->
                    <#--<span class="clr"></span>-->
                <#--</div>-->
            <#--</div>-->
            <#--<div class="refund-item">-->
                <#--<span class="label">收货电话：</span>-->

                <#--<div class="fl">-->
                    <#--<!-- text_error &ndash;&gt;-->
                    <#--<span class="ftx04"><b>${refund.shipPhone}</b></span>-->
                    <#--<span class="clr"></span>-->
                <#--</div>-->
            <#--</div>-->
            <#--<div class="refund-item">-->
                <#--<span class="label">收货手机号：</span>-->

                <#--<div class="fl">-->
                    <#--<!-- text_error &ndash;&gt;-->
                    <#--<span class="ftx04"><b>${refund.shipMobile}</b></span>-->
                    <#--<span class="clr"></span>-->
                <#--</div>-->
            <#--</div>-->
        <#--Desc:不需要一下信息 Auth:zhangqiang Time:2015-12-04 16:45:25 End-->
            <div class="refund-item">
                <span class="label">物流公司：</span>

                <div class="fl">
                    <!-- text_error -->
                    <span class="ftx04"><b>${refund.logisticsName}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="refund-item">
                <span class="label">物流单号：</span>

                <div class="fl">
                    <span class="ftx04"><b>${refund.logisticsNo}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <#--<div class="refund-item">-->
                <#--<span class="label">发货说明：</span>-->

                <#--<div class="fl">-->
                    <#--<span class="ftx04"><b>${refund.info}</b></span>-->
                    <#--<span class="clr"></span>-->
                <#--</div>-->
            <#--</div>-->
        </#if>
            <div class="refund-item">
                <span class="label">&nbsp;</span>
                <#--更改返回按钮事件 Auth:zhangqiang Time:2015-09-21 17:17:35 Start-->
                <#--<input class="btn" type="button" tabindex="4" <#if "${refund.status}"== "refunded"> value="确认收款" onclick="onNext(0);"<#else>value="返回" onclick="onNext(1);"</#if>   id="findPwdSubmit" class="btn-img btn-entry">-->
                <input class="btn" type="button" tabindex="4" <#if "${refund.status}"== "refunded"> value="确认收款" onclick="onNext(0);"<#else>value="返回" onclick="onNextBack();"</#if>   id="findPwdSubmit" class="btn-img btn-entry">
                <#--更改返回按钮事件 Auth:zhangqiang Time:2015-09-21 17:17:35 End-->
            </div>
        </div>
    </form>
</div>
</div>

<#include "bec/jp/service.ftl"/>
<#include "bec/jp/foot.ftl"/>

<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>


<script type="text/javascript">
    $(document).ready(function() {
    });
    var clickAllow = "true";
    function onNext(a){
        layer.confirm('您确定要收款吗？', {icon: 3, title:'温馨提示'}, function(index) {
            if(clickAllow=="true") {
                clickAllow = "false";
                if (a == 0) {
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
            }
            layer.close(index);
        },function(index){
            clickAllow = "true";
            layer.close(index);
        });
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