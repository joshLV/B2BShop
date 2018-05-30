<!DOCTYPE html>
<html class="ui-page-login">
<head>
<#include "app/xd/head.ftl">
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
    <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-collapse">
            总支付金额:<span class="f-fr2" style="color:#F00">￥${total}元</span>
        </li>
	<#list orders as order>
        <li class="mui-table-view-cell" index="${order_index + 1}">
            <div class="mui-collapse-content">
                <p><span style="">订单：</span>${order.orderSn}<span class="f-fr2" style="color: #E4393C;">￥${order.totalAmount}元</span>
                </p>
            </div>
        </li>
	</#list>
        <li class="mui-table-view-cell">
            <div class="mui-collapse-content">
                <p style="font-size: 15px;">付款时需跳转至${payType["name"]}平台完成支付</p>
            </div>
        </li>
        <li class="mui-table-view-cell">
            <div class="mui-collapse-content">
                <label><img width="125" height="28" alt="${payType["name"]}"
                            src="${base}/static/img/${payType["logo"]}"></label>
            </div>
        </li>
        <li class="mui-table-view-cell">请支付 <span class="f-fr2" style="color:#E4393C; font-weight: bold;">￥${total}
            元</span></li>
        <a href="${base}/payment/popupconfirm?whichclient=whichapp" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单支付"
           id="orderpay"></a>

    </ul>
    <div class="mui-content-padded">
        <button class="mui-btn mui-btn-positive mui-btn-block mui-btn-primary" id="payBtn">确认支付</button>
        <button class="mui-btn mui-btn-positive mui-btn-block mui-btn-primary" style="display: none" onclick="payApp('${orderSn}','${payType["sign"]}')" id="payBtn_app">确认支付</button>
    </div>
    <form id="paymentConfirm" style="display: none">
        <!--用于判断是移动端支付-->
        <input id="whichclient" name="whichclient" type="text" value="whichapp">
        <input id="orderId" name="orderId" type="text" value="${orderIds}">
        <input id="orderSn" name="orderSn" type="text" value="${order.orderSn}">
        <input id="payType" name="payType" type="text" value="${payType.sign}">
        <input id="total" name="total" type="text" value="${total}">
    </form>
</div>
<#include "app/xd/tools.ftl">
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script>
    (function (mui, doc) {
        /**
         *是否是微信浏览器
         */
        isWeiXin = function () {
            var ua = window.navigator.userAgent.toLowerCase();
            if (ua.match(/MicroMessenger/i) == 'micromessenger') {
                return true;
            } else {
                return false;
            }
        };

        if (!isWeiXin()) {
//            popAlert('当前环境不支持微信支付,请在微信浏览器中支付!');
            jQuery("#payBtn").hide();
            loadJsFile('${path}/js/pay/pay_base.js')
            jQuery("#payBtn_app").show();
        }
        mui.init();

        jQuery("#payBtn").bind("tap", function () {
            if (!isWeiXin()) {
//                popAlert('当前环境不支持微信支付,请在微信浏览器中支付!');
//                return;
                loadJsFile('${path}/js/pay/pay_base.js')
            }else{
                //如果是微信浏览器那么就使用微信JS-SDK支付
                showWaiting();
                jQuery.ajax({
                    type: "post",
                    url: "${base}/payment/wxprepay",
                    data: "orderNo=${orderSn}&money=${total}",
                    success: function (result) {
                        closeWaiting();
                        if (result.status == 'success') {
                            WeixinJSBridge.invoke(
                                    'getBrandWCPayRequest', {
                                        "appId": result.data.appId,   				//公众号名称，由商户传入
                                        "timeStamp": result.data.timeStamp,         //时间戳，自1970年以来的秒数
                                        "nonceStr": result.data.nonceStr,		    //随机串
                                        "package": result.data.package,				//prepay_id 通过微信支付统一下单接口拿到
                                        "signType": result.data.signType,         	//微信签名方式
                                        "paySign": result.data.paySign 		        //微信签名
                                    },
                                    function (res) {
                                        if (res.err_msg.indexOf("ok") > 0 ) {
                                            // 使用以上方式判断前端返回,微信团队郑重提示：res.err_msg将在用户支付成功后返回    ok，但并不保证它绝对可靠。
                                            layer.open({type: 2});
                                            setTimeout(function(){
                                                jumpto(fullpath +  "/order/view/${order.id}?whichclient=whichapp");
                                            }, 500);
                                        }else{
                                            popAlert('支付遇到问题，请稍后再试!');
                                        }
                                    }
                            );
                        }else{
                            popAlert(result.message);
                        }
                    },
                    error: function (data) {
                    }
                });
            }

        });
    }(mui, document));

    function loadJsFile(path){
        var oHead = document.getElementsByTagName('HEAD').item(0);
        var oScript= document.createElement("script");
        oScript.type = "text/javascript";
        oScript.src=path;
        oHead.appendChild(oScript);
    }

</script>
</body>
</html>