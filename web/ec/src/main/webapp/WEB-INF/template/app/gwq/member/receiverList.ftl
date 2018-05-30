<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
<head>
<#include "app/gwq/head.ftl">
</head>
<body>
<style>
    h2, h3 {font-size: 14px;}
    .ftx-03 {font-size: 12px;margin-left: 5px;font-weight: normal;color: #999999;}
    .ftx-04 {color: #ff6600;}
    a:link, a:visited, a:hover, a:active {color: #333;text-decoration: none;font-size: 12px;}
    .m .mt {padding-left: 10px;line-height: 35px;height: 35px;position: relative;overflow: visible;}
    .m4 .mt {border-bottom: 1px solid #e6e6e6;height: 34px;line-height: 34px;padding-left: 16px; border-top: 1px solid #e6e6e6; background: #fbfbfb;}
    .m4 .mt h3 {float: left;color: #666666;}
    .extra {float: right;margin: 0 10px 0 0;}
    .extra {float: right;}
    .extra a {color: #005ea7;margin: 0 0 0 20px;}
    .m .mt {line-height: 35px;}
    .m .mt h3 .ftx-03 {font-size: 12px;margin-left: 5px;font-weight: normal;}
    .m .mc {padding: 10px;line-height: 22px;width: 99%;}
    .m .mc .new-items {position: relative;display: table;}
    .m .mc {line-height: 22px;}
    .m .mc .item-lcol {width: 450px;border-right: 1px dashed #e5e5e5;}
    .label{float: left;width: 70px;color: #999;text-align: right; font-size: 12px;}
    .m .mc .item-lcol .fl {width: 80%;}
    .fl {float: left; font-size: 12px;}
    .hide{display: none;}

    /*收货地址*/
    .add_address {
        background: #7c7171;
        text-align: center;
        padding: 34px 0;
    }
    .add_address span {
        font-size: 17px;
        color: #fff;
    }
    .add_address i,.add_address span {
        height: 24px;
        line-height: 24px;
        display: inline-block;
        vertical-align: top;cursor: pointer;
    }
    .add_address i {
        width: 18px;
        height: 18px;
        overflow: hidden;
        background:url(${path}/images/jia.png) no-repeat;
        background-size: cover;
        margin: 4px 5px 0 0;
    }

    .address_item_lits {
        margin-bottom: 10px;
        border-top: solid 1px #d8d8d8;
        border-bottom: solid 1px #d8d8d8;
        background: #fff;
        padding: 15px 0 15px 15px;
        color: #333;
    }
    .address_item_lits dt{font-size:15px;display:-webkit-box;display:-moz-box;display:-o-box;display:-ms-box;padding-right:15px; border-bottom:dotted 1px #d7d6da; padding-bottom:8px;}
    .address_item_lits div{width:50%;}
    .address_item_lits .phone{text-align:right;}
    .address_item_lits dd{margin-top:8px;}
    .address_item_lits dd p{padding-right:15px; font-size:14px; color:#555; line-height:1.7;}
    .address_item_lits dd .tools{height:22px;margin-top:12px;border-top: dotted 1px #d7d6da;padding:15px 15px 0 0;}
    .address_item_lits dd .tools li{width:50%;height:22px;float:left;}
    .address_item_lits dd .tools .send label{display:block;height:22px;line-height:22px;}
    .address_item_lits dd .tools li:last-child{text-align:right;}
    .address_item_lits dd .tools a{display:inline-block;vertical-align:top;font-size:14px;height:22px;line-height:22px;}
    .address_item_lits dd .tools a:before{display:inline-block;vertical-align:top;content:'';}
    .address_item_lits dd .tools .send:before{width:19px;height:19px;background:url(${path}/images/sc.png) center center no-repeat;background-size:cover;margin:1px 5px 0 0;}
    .address_item_lits dd .tools .edit{margin-right:25px;}
    .address_item_lits dd .tools .edit:before{width:19px;height:18px;background:url(${path}/images/xg.png) center center no-repeat;background-size:cover;margin-right:5px;}




</style>
<#assign path="mall/nsc" />
<header class="mui-bar mui-bar-nav">
    <#--<#if to == "">-->
    <#--<a href="${base}/member/index?whichclient=whichapp"><button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button></a>-->
        <#--<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>-->
    <#--</#if>-->
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <div class="mui-center mui-title ">
        我的收货地址
    </div>
</header>
<div class="mui-content" style="padding-bottom:50px;">
    <div class="myorder" style="margin-top: 14px!important;">
        <#--新的收货地址-->
        <div class="add_address"  id="addReceiver">
            <i></i><span>添加收货地址</span>

        </div>
            <span style="line-height:34px; padding-left: 18px; text-align: center;" class="ftx-03">您已创建<span class="ftx-04" id="addressNum_top">${receiverList?size} </span>个收货地址，最多可创建<span class="ftx-04">6</span>个</span>
        <#list receiverList as receiver>
        <div id="div${receiver.id}">
            <dl class="address_item_lits">
                <dt>
                <div class="name">${receiver.name}</div>
                <div class="phone">${receiver.mobile}</div>
                </dt>
                <dd>
                    <p>收货地址：${receiver.areaName}${receiver.address}</p>
                    <p>固定电话：${receiver.phone}</p>
                    <p>邮箱地址：${receiver.email}</p>
                    <p>邮政编码：${receiver.zipCode}</p>

                    <ul class="tools">
                        <li style="width: 100%">
                            <#if receiver.isDefault==1>
                                <a href="javascript:;"  style="float: left; font-weight: bold; color:gray">当前默认</a>
                            <#else>
                                <a href="javascript:;"  style="float: left; font-weight: bold;" onclick="setDefault('${receiver.id}');">设为默认</a>
                            </#if>

                            <#if to != ''>
                                <#if to == 'promotions'>
                                    <a href="javascript:window.location.href='${base}/promotions/ordercheck/${promotionsId}/${goodsId}?dealNum=${dealNum}&sp=${sp}&receiverId=${receiver.id}&o=${o}&paymentId=${paymentId}&deliveryId=${deliveryId}&whichclient=whichapp';" >选择</a>
                                <#else>
                                    <a href="javascript:window.location.href='${base}/member/ordercheck?whichclient=whichapp&receiverId=${receiver.id}&o=${o}&paymentId=${paymentId}&deliveryId=${deliveryId}';" >选择</a>
                                </#if>
                            </#if>
                            <a href="javascript:;" onclick="updateReceiver('${receiver.id}');" class="edit" style="margin-left: 15px;">修改</a>
                            <a href="javascript:;" class="del" id="del" onclick="alertDelAddressDiag('${receiver.id}')">删除</a>
                        </li>
                    </ul>
                </dd>
            </dl>
        </div>
        </#list>
    </div>
</div>
<#if to == "">
<#include "app/gwq/tools.ftl">
</#if>
<script>
    (function(mui, doc) {
        mui.back = function(){
            var url="";
            if("${to!''}"=="orderCheck"){
                url=fullpath+'/member/ordercheck?whichclient=whichapp&to=${to}&o=${o}&paymentId=${paymentId}&deliveryId=${deliveryId}';
            }else if("${to!''}"=="promotions"){
                url=fullpath+'/promotions/ordercheck/${promotionsId}/${goodsId}?dealNum=${dealNum}&sp=${sp}&receiverId=${receiver.id}&o=${o}&paymentId=${paymentId}&deliveryId=${deliveryId}&whichclient=whichapp';
            }else{
                url=fullpath+"/member/index?whichclient=whichapp";
            }
            jumpto(url);
        };
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }
        jQuery("#addReceiver").bind("click",function(){
            var num =$("#addressNum_top").text();
            if(num>5){
                popAlert("抱歉，地址信息最多可创建6条。");
                return;
            }
            window.location.href="${base}/receiver/toUpdate/add?to=${to}&o=${o}&paymentId=${paymentId}&deliveryId=${deliveryId}&promotionsId=${promotionsId}&goodsId=${goodsId}&dealNum=${dealNum}";
        });

    }(mui, document));

    function updateReceiver(id){
        window.location.href="${base}/receiver/toUpdate/update?receiverId="+id+"&to=${to}&o=${o}&paymentId=${paymentId}&deliveryId=${deliveryId}&promotionsId=${promotionsId}&goodsId=${goodsId}&dealNum=${dealNum}";
    }

    function alertDelAddressDiag(id){

        var layer_confrim = layer.open({
            title:'提示',
            content: '删除收货地址，确认？',
            btn: ['确认', '取消'],
            shadeClose: false,
            yes: function(){

                layer.close(layer_confrim);
                showWaiting();
                var actionUrl ="${base}/receiver/delete";
                jQuery.ajax( {
                    type : "POST",
                    dataType : "json",
                    url : actionUrl,
                    data : "receiverId=" + id,
                    cache : false,
                    success : function(dataResult) {
                        if(dataResult.status=="success"){
                            var num=jQuery("#addressNum_top");
                            num.text(num.text()-1)//总收货地址数量-1
                            jQuery("#div"+id).remove();//移除已删除的收货地址div
                            closeWaiting();
                            popAlert("删除成功！");
                        }else{
                            popAlert("删除失败！");
                        }
                    },
                    error : function() {
                        closeWaiting();
                    }
                });
            },
            no: function(){
                closeWaiting();
            }
        });

    }

    function setDefault(id){
        showWaiting();
        jQuery.ajax( {
            type : "POST",
            dataType : "json",
            url : "${base}/receiver/setDefault",
            data : {"isDefault":1,"receiverId":id},
            cache : false,
            async : false,//设置同步
            success : function(data) {
                if(data.status=="success"){
                    var receiver = data.receiver;
                    jumpto(fullpath + "/member/receiver?whichclient=whichapp&receiverId="+id+"&to=${to}&o=${o}&paymentId=${paymentId}&deliveryId=${deliveryId}&promotionsId=${promotionsId}&goodsId=${goodsId}&dealNum=${dealNum}");
                }else{
                    popAlert(data.message);
                }
                closeWaiting();

            },
            error : function() {
                closeWaiting();
                popAlert("网络异常，请稍后重试！");
            }
        });
    }

</script>
</body>
</html>