<#escape x as x?html>
    <#include "mall/gwq/top.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<style>
    .breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
    .breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

    .left {float: left;width: 150px;margin-right: 10px;}
    .right {float: right;width: 830px;}
    .f-cb:after{display:block;clear:both;visibility:hidden;height:0;overflow:hidden;content:".";zoom:1;}
    .item .fl{width:430px; line-height: 20px;}
</style>
<style>
    /**状态、提示**/
    #orderstate{border:1px solid #EED97C;padding:0 5px;background:#FFFCEB;}#orderstate{color:#333;}#orderstate .mt{padding:4px 8px;height:25px;line-height:25px;border-bottom:1px dotted #EED97C;}#orderstate .mt strong{float:left;font-size:14px;}.mt{cursor:default}.m{margin-bottom:10px;overflow:hidden;zoom:1;}.ftx14,.flk14 a:link,.flk14 a:visited,a.flk14:link,a.flk14:visited{color:#12A000}.fr{float:right}#orderstate .btn{width:46px;height:25px;margin:0 4px;background:url(${base}/static/img/btn0330.jpg) no-repeat 0 0;color:#fff;}.btn-img{cursor:pointer;margin:0;padding:0;border:0;text-align:center;}#orderstate .mc{padding:10px 8px;}.toolbar .btn-40 {display: inline-block;padding: 0 13px 0 13px;background-color: #FFBA01;background: url(${base}/static/img/btn_bg.png) no-repeat;background-position: -20px;color: white;border-radius: 3px;}
    /**跟踪、付款信息**/
    #ordertrack{border:1px solid #EED97C;padding:0 5px;position:relative}#ordertrack td{vertical-align:top}#ordertrack .i-ordertrack s,.post01 .fore .fr s{float:left;width:9px;height:16px;font-size:0;line-height:0;margin-right:5px;background:url(i/od-icon.png)}.post01 .fore .fr s{margin-top:4px}#ordertrack .i-ordertrack a{color:#005AA0}#ordertrack .tab{height:30px;line-height:30px;border-bottom:1px solid #EED97C;background:#FFFCEB;overflow:visible;}#ordertrack .tab li{border-right:1px solid #EED97C;cursor:pointer}#ordertrack .tab li h2{float:left;height:30px;padding:0 8px;color:#999;}#ordertrack .tab .curr h2{position:relative;height:31px;background:#fff;color:#333;}#ordertrack .mc{padding:5px 8px;}#ordertrack .mc .extra{margin-top:10px;}#ordertrack th strong{display:block;padding-bottom:3px;margin-bottom:5px;border-bottom:1px solid #DBDBDB;text-align:left;}*html #ordertrack .tab{overflow:hidden;}
    /**订单信息**/
    #orderinfo{border:1px solid #DADADA;padding:0 5px 10px;background:#EDEDED;overflow:visible;}#orderinfo .mt{padding:0 8px;height:30px;line-height:30px;font-size:14px;}#orderinfo .mc{padding:5px 8px;background:#fff;overflow:visible;}#orderinfo .mc dl{padding:10px 5px;border-top:1px solid #EDEDED;}#orderinfo .mc dl.fore{border-top:0;}#orderinfo .mc dt{margin-bottom:4px;font-weight:bold;}#orderinfo .p-list{overflow:hidden;margin-right:-1px;border-left:1px solid #DEDEDE;}#orderinfo .p-list table{border-collapse:collapse;margin-left:-1px;border:solid #DEDEDE;border-width:0 1px;}#orderinfo .p-list th{padding:5px;background:#F0F0F0;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;font-weight:normal;}#orderinfo .p-list td{padding:5px;background:#fff;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;text-align:center;}#barcode{position:relative;height:20px;padding:0 5px;}#barcode ul{position:absolute;left:5px;padding:6px 10px;border:1px solid #ccc;background:#fff;z-index:1}#orderinfo .total{padding:15px 10px 0;overflow:hidden;zoom:1;font-family:arial;}#orderinfo .total ul{float:right;padding:0 20px 10px 0;overflow:hidden;font-size:14px;}#orderinfo .total li{overflow:hidden;line-height:20px;}#orderinfo .total li span{float:left;width:150px;text-align:right;}#orderinfo .total .extra{float:right;padding:10px 20px 0 0;border-top:1px solid #ccc;font-size:16px;font-weight:bold;}#orderinfo .total .extra b{font-size:24px;}a.flk13:link,a.flk13:visited{color:#005AA0;}.img-list .img-box:hover{border-color:#EDD28B;}.img-list .img-box{border:1px solid #e1e1e1;display:block;margin:0 auto;width:50px;height:50px;}
    .processNav .extra {BACKGROUND: url(${base}/static/mall/gwq/img/cartscbgv.png) no-repeat 0px 0px}
    .processNav {MARGIN: 0px 0px 0px; BACKGROUND: #fff; FLOAT: left; COLOR: #404040; FONT-WEIGHT: 700;margin-bottom: 30px}
    .processNav LI {POSITION: relative; TEXT-ALIGN: center; LINE-HEIGHT: 26px; BACKGROUND: #e4e4e4; FLOAT: left; HEIGHT: 26px; FONT-SIZE: 14px}
    .processNav .step1 {Z-INDEX: 5; WIDTH: 240px}
    .processNav .step2 {Z-INDEX: 4; WIDTH: 240px}
    .processNav .step3 {Z-INDEX: 3; WIDTH: 240px}
    .processNav .step4 {Z-INDEX: 2; WIDTH: 240px}
    .processNav .step5 {Z-INDEX: 1; WIDTH: 140px}
    .processNav .on {BACKGROUND: #86c226; COLOR: #fff}
    .processNav .extra {POSITION: absolute; WIDTH: 18px; HEIGHT: 26px; TOP: 0px; RIGHT: -15px}
    .processNav .on .extra {BACKGROUND-POSITION: 0px -30px}
    /*.form与头部搜索框样式互相影响，所以更改名称为form1 Auth:zhangqiang Time:2015-09-23 15:50:35 Start */
    /*.form {width: 582px;overflow: hidden;margin: 0 auto;padding-left: 100px;}*/
    .form1 {width: 582px;overflow: hidden;margin: 0 auto;padding-left: 100px;}
    /*.form与头部搜索框样式互相影响，所以更改名称为form1 Auth:zhangqiang Time:2015-09-23 15:50:35 End */
    .btn-entry {width: 68px;height: 25px;line-height: 25px;background: url(${base}/static/mall/img/bg-btn-entry.jpg) no-repeat;font-size: 14px;font-weight: bold;}
    .item {padding-top: 5px;height: 55px;line-height: 26px;}
    .label {width: 140px;text-align: right;font-size: 14px;float: left;}
    .select{border:1px solid green; position:absolute; overflow:hidden}
    .btn {display: border: 0 none;font-size: 20px;font-weight:bold;text-align: center;color: #FF0000;}
    .btn {width: 250px;height: 36px;color: #ffffff;font-size:15px;font-weight: 800;overflow: hidden; background: #86c226; border: none; border-radius: 3px;}
    .btn:hover{background: #86c226}
    .refund-form{border: 1px solid #E8E8E8; border-top: 2px solid #86c226; background: #ffffff;}
</style>
    <#include "mall/gwq/header_new.ftl"/>



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
            <div class="item f-cb">
                <span class="label">退款编号：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.id}</b></span>
                </div>
            </div>
            <div class="item f-cb">
                <span class="label">申请退款时间：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.createDate?string("yyyy-MM-dd HH:mm:ss")}</b></span>
                </div>
            </div>
            <div class="item f-cb">
                <span class="label">退款类型：</span>
                <div class="fl">
                        <span class="ftx04"><b>
                            <#if "${refund.type}"== "unreceived">未收货  <#else>已收货</#if>
                        </b></span>
                </div>
            </div>
            <div class="item f-cb">
                <span class="label">需要退款金额：</span>
                <div class="fl">
                    <span class="ftx04"><b>￥${order.totalAmount}</b></span>
                </div>
            </div>
            <div class="item f-cb">
                <span class="label">退款原因：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.reason}</b></span>
                </div>
            </div>
            <div class="item f-cb">
                <span class="label">退款说明：</span>
                <div class="fl">
                    <span class="ftx04"><b>${refund.info}</b></span>
                </div>
            </div>
            <#if "${refund.type}"=="received">

            <#-- <div class="item">
                 <span class="label">收货人姓名：</span>

                 <div class="fl">
                     <!-- text_error &ndash;&gt;
                     <span class="ftx04"><b>${refund.shipName}</b></span>
                     <span class="clr"></span>
                 </div>
             </div>
             <div class="item">
                 <span class="label">收货地址：</span>

                 <div class="fl">
                     <!-- text_error &ndash;&gt;
                     <span class="ftx04"><b>${refund.shipAddress}</b></span>
                     <span class="clr"></span>
                 </div>
             </div>
             <div class="item">
                 <span class="label">邮编：</span>

                 <div class="fl">
                     <!-- text_error &ndash;&gt;
                     <span class="ftx04"><b>${refund.shipZipCode}</b></span>
                     <span class="clr"></span>
                 </div>
             </div>
             <div class="item">
                 <span class="label">收货电话：</span>

                 <div class="fl">
                     <!-- text_error &ndash;&gt;
                     <span class="ftx04"><b>${refund.shipPhone}</b></span>
                     <span class="clr"></span>
                 </div>
             </div>
             <div class="item">
                 <span class="label">收货手机号：</span>

                 <div class="fl">
                     <!-- text_error &ndash;&gt;
                     <span class="ftx04"><b>${refund.shipMobile}</b></span>
                     <span class="clr"></span>
                 </div>
             </div>-->
                <div class="item f-cb">
                    <span class="label">物流公司：</span>
                    <div class="fl">
                        <!-- text_error -->
                        <span class="ftx04"><b>${refund.logisticsName}</b></span>
                    </div>
                </div>
                <div class="item f-cb">
                    <span class="label">物流单号：</span>
                    <div class="fl">
                        <span class="ftx04"><b>${refund.logisticsNo}</b></span>
                    </div>
                </div>
            <#--Desc:数据库中没有发货说明字段 Auth:zhangqiang Time:2015-11-11 15:54:35 Start-->
            <#--<div class="item">-->
            <#--<span class="label">发货说明：</span>-->

            <#--<div class="fl">-->
            <#--<span class="ftx04"><b>${refund.info}</b></span>-->
            <#--<span class="clr"></span>-->
            <#--</div>-->
            <#--</div>-->
            <#--Desc:数据库中没有发货说明字段 Auth:zhangqiang Time:2015-11-11 15:54:35 End-->
            </#if>
            <div class="item">
                <span class="label">&nbsp;</span>
            <#--更改返回按钮事件 Auth:zhangqiang Time:2015-09-21 17:17:35 Start-->
            <#--<input class="btn" type="button" tabindex="4" <#if "${refund.status}"== "refunded"> value="确认收款" onclick="onNext(0);"<#else>value="返回" onclick="onNext(1);"</#if>   id="findPwdSubmit" class="btn-img btn-entry">-->
                <input class="btn" type="button" tabindex="4" <#if "${refund.status}"== "refunded"> value="确认收款" onclick="onNext(0);"<#else>value="返回" onclick="onNextBack();"</#if>   id="findPwdSubmit" class="btn-img btn-entry">
            <#--更改返回按钮事件 Auth:zhangqiang Time:2015-09-21 17:17:35 End-->
            </div>
        </div>
    </form>
</div>



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
    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>
</#escape>