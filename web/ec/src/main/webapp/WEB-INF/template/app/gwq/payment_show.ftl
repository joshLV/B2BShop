
<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/gwq/head.ftl">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="HandheldFriendly" content="true"/>
    <style>
        .mui-card {
            overflow: hidden;
            margin: 0 0 0 0px;
            border: 1px solid #ddd;
            border-radius: 0px;
            background-color: #fff;
            background-clip: padding-box
        }
        .f-fr2 {
            padding-left: 20px;
            color: #E4393C;
            background-size: 17px;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">核对支付信息</h1>
</header>
<div class="mui-content" style="margin-top:20px;">
        <ul class="mui-table-view" >
            <li class="mui-table-view-cell mui-collapse">
                总支付金额:<span class="f-fr2"  style="color:#F00">￥${total}元</span>
            </li>
            <#list orders as order>
            <li class="mui-table-view-cell" index="${order_index + 1}" >
                <div class="mui-collapse-content">
                    <p><span style="">订单：</span>${order.orderSn}<span class="f-fr2" style="color: #E4393C;">￥${order.totalAmount}元</span></p>
                </div>
            </li>
            </#list>
            <li class="mui-table-view-cell"  >
                <div class="mui-collapse-content">
                    <p style="font-size: 15px;">付款时需跳转至${payType["name"]}平台完成支付</p>
                </div>
            </li>
            <li class="mui-table-view-cell"  >
                <div class="mui-collapse-content">
                    <label><img width="125" height="28" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
                </div>
            </li>
            <li class="mui-table-view-cell">请支付 <span class="f-fr2" style="color:#E4393C; font-weight: bold;">￥${total}元</span></li>
            <a href="${base}/payment/popupconfirm?whichclient=whichapp" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单支付" id="orderpay"></a>

        </ul>
    <div class="mui-content-padded">
       <#-- <button class="mui-btn mui-btn-positive mui-btn-block mui-btn-primary" id = "payBtn">确认支付</button>-->
        <button class="mui-btn mui-btn-positive mui-btn-block mui-btn-primary" style="display: none1" onclick="payApp('${orderSn}','${payType["sign"]}')" id="payBtn_app">确认支付</button>
    </div>
    <div id="outLine" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; margin-top: 10px; font-size: 12px"></div>

    <form id="paymentConfirm" method="POST" action="${base}/payment/confirm?whichclient=whichapp" style="display: none">
        <input id="whichclient" name="whichclient" type="text" value="whichapp" /><br><!--用于判断是移动端支付-->
        <input id="orderId" name="orderId" type="text" value="${order.id}" /><br>
        <input id="orderSn" name="orderSn" type="text" value="${orderSn}" /><br>
        <input id="payType" name="payType" type="text" value="${payType["sign"]}" />
        <input type="hidden" id="total" name="total" value="${total}"/>
    </form>
</div>
<script type="application/javascript" src="${path}/js/pay/pay_base.js"></script>
<#include "app/gwq/tools.ftl">
<script>
/*
    (function(mui, doc) {
        mui.init();
        // 检测是否安装支付服务
        checkServices = function(pc){
            if(!pc.serviceReady){
                var txt=null;
                switch(pc.id){
                    case "alipay":
                        txt="检测到系统未安装“支付宝快捷支付服务”，无法完成支付操作，是否立即安装？";
                        break;
                    default:
                        txt="系统未安装“"+pc.description+"”服务，无法完成支付，是否立即安装？";
                        break;
                }
                plus.nativeUI.confirm(txt,function(e){
                    if(e.index==0){
                        pc.installService();
                    }
                },pc.description);
            }
        };

        var pays = {};
        var isPayChannelOK = false;

        var w = null;
        //var PAYSERVER= fullpath + '/payment/app/';
        var PAYSERVER='http://demo.dcloud.net.cn/payment/';
        var alipayTestUrl = "http://218.77.183.189:8090/javapay/payservice?total=1";
        // 支付
        pay = function (id){
            if(!ismobile){return ;}
            checkServices(pays[id]);
            if( !isPayChannelOK ){
                outSet("App暂不支持" + jQuery("#payType").val() + "支付");
            }

            if( w ){ return; }//检查是否请求订单中
            outSet("----- 请求支付 -----");
            var url = PAYSERVER;
            if(id == 'alipay'|| id == 'wxpay'){
                url += id;
            }else{
                popAlert("不支持此支付通道！");
                return;
            }
            url += '/?total=';

            w = plus.nativeUI.showWaiting();
            // 请求支付订单
            // var amount = document.getElementById('total').value;
            var amount = 1;
            var xhr=new XMLHttpRequest();
            xhr.onreadystatechange=function(){
                switch(xhr.readyState){
                    case 4:
                        w.close();
                        w = null;
                        if(xhr.status==200){
                            outLine("----- 请求订单成功 -----");
                            outLine( xhr.responseText );
                            var order=xhr.responseText;
                            plus.payment.request(pays[id],order,function(result){
                                outLine("----- 支付成功 -----");
                                plus.nativeUI.alert("支付成功：感谢你的支持，祝你购物愉快。",function(){
                                    back();
                                },"付款");
                                jumpto(fullpath + "/order/view/${order.id}?whichclient=whichapp");
                            },function(e){
                                outLine("----- 支付失败 -----");
                                outLine("["+e.code+"]："+e.message);
                                plus.nativeUI.alert("支付失败：请联系管理员。",null,"付款");
                                jumpto(fullpath + "/order/view/${order.id}?whichclient=whichapp");
                            });
                        }else{
                            outLine("----- 请求订单失败 -----");
                            outLine( xhr.status );
                            outLine( xhr.responseText );
                            plus.nativeUI.alert("获取订单信息失败！",null,"付款");
                        }
                        break;
                    default:
                        break;
                }
            }
            xhr.open('GET',url + amount);
            outLine("请求支付订单：" + url + amount);

            xhr.send();
        };
        if(ismobile) {
            mui.plusReady(function () {
                // 获取支付通道
                plus.payment.getChannels(function(channels){
                    isPayChannelOK = true;
                    jQuery.each(channels, function(i, channel){
                        var txt = "id:"+channel.id+",,";
                        txt += "description:" + channel.description + ",";
                        txt += "serviceReady:" + channel.serviceReady + ";";
                        console.log(txt);
                        pays[channel.id] = channel;

                        if(channel.id == jQuery("#payType").val()){
                            isPayChannelOK = true;
                        }
                    });

                },function(e){
                    outSet("获取支付通道失败："+e.message);
                });

                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }

        jQuery("#payBtn").bind("tap",function(){
            /!*jQuery("#paymentConfirm").submit();
            jQuery("#orderpay").trigger("click");*!/
            pay(jQuery("#payType").val());
        });
    }(mui, document));
*/

</script>
</body>
</html>