<#escape x as x?html>
    <#include "mall/gwq/top.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<style>
    .breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
    .breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

    .left {float: left;width: 150px;margin-right: 10px;}
    .right {float: right;width: 830px;}
</style>
<style>
    /**状态、提示**/
    #orderstate{border:1px solid #EED97C;padding:0 5px;background:#FFFCEB;}#orderstate{color:#333;}#orderstate .mt{padding:4px 8px;height:25px;line-height:25px;border-bottom:1px dotted #EED97C;}#orderstate .mt strong{float:left;font-size:14px;}.mt{cursor:default}.m{margin-bottom:10px;overflow:hidden;zoom:1;}.ftx14,.flk14 a:link,.flk14 a:visited,a.flk14:link,a.flk14:visited{color:#12A000}.fr{float:right}#orderstate .btn{width:46px;height:25px;margin:0 4px;background:url(${base}/static/img/btn0330.jpg) no-repeat 0 0;color:#fff;}.btn-img{cursor:pointer;margin:0;padding:0;border:0;text-align:center;}#orderstate .mc{padding:10px 8px;}.toolbar .btn-40 {display: inline-block;padding: 0 13px 0 13px;background-color: #FFBA01;background: url(${base}/static/img/btn_bg.png) no-repeat;background-position: -20px;color: white;border-radius: 3px;}
    /**跟踪、付款信息**/
    #ordertrack{border:1px solid #EED97C;padding:0 5px;position:relative}#ordertrack td{vertical-align:top}#ordertrack .i-ordertrack s,.post01 .fore .fr s{float:left;width:9px;height:16px;font-size:0;line-height:0;margin-right:5px;background:url(i/od-icon.png)}.post01 .fore .fr s{margin-top:4px}#ordertrack .i-ordertrack a{color:#005AA0}#ordertrack .tab{height:30px;line-height:30px;border-bottom:1px solid #EED97C;background:#FFFCEB;overflow:visible;}#ordertrack .tab li{border-right:1px solid #EED97C;cursor:pointer}#ordertrack .tab li h2{float:left;height:30px;padding:0 8px;color:#999;}#ordertrack .tab .curr h2{position:relative;height:31px;background:#fff;color:#333;}#ordertrack .mc{padding:5px 8px;}#ordertrack .mc .extra{margin-top:10px;}#ordertrack th strong{display:block;padding-bottom:3px;margin-bottom:5px;border-bottom:1px solid #DBDBDB;text-align:left;}*html #ordertrack .tab{overflow:hidden;}
    /**订单信息**/
    #orderinfo{border:1px solid #DADADA;padding:0 5px 10px;background:#EDEDED;overflow:visible;}#orderinfo .mt{padding:0 8px;height:30px;line-height:30px;font-size:14px;}
    #orderinfo .mc{/*padding:5px 8px;*/background:#fff;overflow:visible;}
    #orderinfo .mc dl{padding:10px 5px;border-top:1px solid #EDEDED;}#orderinfo .mc dl.fore{border-top:0;}#orderinfo .mc dt{margin-bottom:4px;font-weight:bold;}#orderinfo .p-list{overflow:hidden;margin-right:-1px;border-left:1px solid #DEDEDE;}#orderinfo .p-list table{border-collapse:collapse;margin-left:-1px;border:solid #DEDEDE;border-width:0 1px;}#orderinfo .p-list th{padding:5px;background:#F0F0F0;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;font-weight:normal;}#orderinfo .p-list td{padding:5px;background:#fff;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;text-align:center;}#barcode{position:relative;height:20px;padding:0 5px;}#barcode ul{position:absolute;left:5px;padding:6px 10px;border:1px solid #ccc;background:#fff;z-index:1}#orderinfo .total{padding:15px 10px 0;overflow:hidden;zoom:1;font-family:arial;}#orderinfo .total ul{float:right;padding:0 20px 10px 0;overflow:hidden;font-size:14px;}#orderinfo .total li{overflow:hidden;line-height:20px;}#orderinfo .total li span{float:left;width:150px;text-align:right;}#orderinfo .total .extra{float:right;padding:10px 20px 0 0;border-top:1px solid #ccc;font-size:16px;font-weight:bold;}#orderinfo .total .extra b{font-size:24px;}a.flk13:link,a.flk13:visited{color:#005AA0;}.img-list .img-box:hover{border-color:#EDD28B;}.img-list .img-box{border:1px solid #e1e1e1;display:block;margin:0 auto;width:50px;height:50px;}
    .processNav .extra {BACKGROUND: url(${base}/static/mall/gwq/img/cartscbgv.png) no-repeat 0px 0px}
    .processNav {MARGIN: 0px 0px 0px; BACKGROUND: #fff; FLOAT: left; COLOR: #404040; FONT-WEIGHT: 700;/*margin-bottom: 30px*/}
    .processNav LI {POSITION: relative; TEXT-ALIGN: center; LINE-HEIGHT: 26px; BACKGROUND: #e4e4e4; FLOAT: left; HEIGHT: 26px; FONT-SIZE: 14px}
    .processNav .step1 {Z-INDEX: 5; WIDTH: 300px}
    .processNav .step2 {Z-INDEX: 4; WIDTH: 300px}
    .processNav .step3 {Z-INDEX: 3; WIDTH: 300px}
    .processNav .step4 {Z-INDEX: 1; WIDTH: 300px}
    .processNav .on {BACKGROUND: #86c226; COLOR: #fff}
    .processNav .extra {POSITION: absolute; WIDTH: 18px; HEIGHT: 26px; TOP: 0px; RIGHT: -15px}
    .processNav .on .extra {BACKGROUND-POSITION: 0px -30px}
    .myform {width: 582px;overflow: hidden;margin: 20px auto;/*padding-left: 100px;*/}
    .btn-entry {width: 68px;height: 25px;line-height: 25px;background: url(${base}/static/mall/img/bg-btn-entry.jpg) no-repeat;font-size: 14px;font-weight: bold;}
    .item {/*padding-top: 5px;*/height: 55px;line-height: 55px;}
    .item b{font-weight: normal;}
    .label {width: 140px;text-align: right;font-size: 14px;float: left;}
    .btn {display: border: 0 none;font-size: 20px;font-weight:bold;text-align: center;color: #FF0000;}
    .btn {width: 250px;height: 36px;color: #ffffff;font-size:15px;font-weight: 800;overflow: hidden; background: #86c226; border: none; border-radius: 3px;}
    .btn:hover{background: #86c226}
    .refund-form{border: 1px solid #E8E8E8; border-top: 2px solid #86c226; margin-top:20px; margin-bottom: 30px; background: #ffffff;}
</style>
    <#include "mall/gwq/header_new.ftl"/>



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
            <div class="item">
                <span class="label">退款编号：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.id}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="item">
                <span class="label">申请退款时间：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.createDate?string("yyyy-MM-dd HH:mm:ss")}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="item">
                <span class="label">退款类型：</span>
                <div class="fl">
                        <span class="ftx04"><b>
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
            <div class="item">
                <span class="label">需要退款金额：</span>
                <div class="fl">
                    <span class="ftx04"><b>￥${order.totalAmount}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="item">
                <span class="label">退款原因：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.reason}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <div class="item">
                <span class="label">退款说明：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.info}</b></span>
                    <span class="clr"></span>
                </div>
            </div>
            <#if  refund.status == "returned" >
                <div class="item">
                    <span class="label">驳回原因：</span>
                    <div class="fl">
                        <span class="ftx04"><b>${refundLog.info}</b></span>
                        <span class="clr"></span>
                    </div>
                </div>
            </#if>
            <div class="item">
                <#if size gte 3>
                    <span class="label">&nbsp;</span>
                    <!--<input class="btn" type="button" tabindex="4"  <#if refund.status == "commit">disabled class="disabled" value="等待卖家处理"<#elseif "${refund.status}"== "returned"> onclick="back();" value="被驳回次数达到上限，请返回" <#elseif "${refund.status}"== "refunded"> value="确认收款" onclick="onNext(0);"<#else>value="返回" onclick="onNext(1);"</#if> id="endsubmit" class="btn-img btn-entry">-->
                <#--Desc:当退款申请被驳回两次以上 第三次同意时，退款状态为confirmed 应该显示下一步操作，但是判断状态中没有此状态，增加下一步状态。Auth:zhangqiang Time:2015-11-23 10:57:36  Start-->
                <#--<input class="btn" type="button" tabindex="4"  <#if refund.status == "commit">disabled class="disabled" value="等待卖家处理"<#elseif "${refund.status}"== "returned"> onclick="back();" value="被驳回次数达到上限，请返回" <#elseif "${refund.status}"== "refunded"> value="确认收款" onclick="onNext(0);" <#else>value="返回" onclick="onNextBack();"</#if> id="endsubmit" class="btn-img btn-entry">-->
                    <input class="btn" type="button" tabindex="4"  <#if refund.status == "commit">disabled class="disabled" value="等待卖家处理"<#elseif "${refund.status}"== "returned"> onclick="back();" value="被驳回次数达到上限，请返回" <#elseif "${refund.status}"== "refunded"> value="确认收款" onclick="onNext(0);" <#elseif "${refund.status}"== "confirmed">value="下一步" onclick="fill_address()"<#else>value="返回" onclick="onNextBack();"</#if> id="endsubmit" class="btn-img btn-entry">
                <#--Desc:当退款申请被驳回两次以上 第三次同意时，退款状态为confirmed 应该显示下一步操作，但是判断状态中没有此状态，增加下一步状态。Auth:zhangqiang Time:2015-11-23 10:57:36  End-->
                <#else>
                    <span class="label">&nbsp;</span>
                    <!--<input class="btn" type="button" tabindex="4"<#if refund.status=="confirmed"&&refund.type="received">value="下一步" onclick="fill_address()"</#if>  <#if refund.status == "commit">disabled class="disabled" value="等待卖家处理" <#elseif refund.status== "returned"> value="请求被驳回，请重新申请" onclick="nextRefund()"  <#elseif refund.status== "refunded"> value="确认收款" onclick="onNext(0);"<#else>value="返回" onclick="onNext(1);"</#if>  id="findPwdSubmit" class="btn-img btn-entry">-->
                    <input class="btn" type="button" tabindex="4"<#if refund.status=="confirmed"&&refund.type="received">value="下一步" onclick="fill_address()"</#if>  <#if refund.status == "commit">disabled class="disabled" value="等待卖家处理" <#elseif refund.status== "returned"> value="请求被驳回，请重新申请" onclick="nextRefund()"  <#elseif refund.status== "refunded"> value="确认收款" onclick="onNext(0);"<#else>value="返回" onclick="onNextBack();"</#if>  id="findPwdSubmit" class="btn-img btn-entry">
                </#if>
            </div>
        </div>
    </form>
</div>



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
    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>
</#escape>