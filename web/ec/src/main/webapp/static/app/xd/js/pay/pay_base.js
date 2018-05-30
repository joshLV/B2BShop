/* app支付相关 */

var pays = {};
var isPayChannelOK = false;
var w = null;
var payUrlMap = {
    wxpay: base + '/payment/app/wxpay',
    alipay: base + '/payment/app/alipay',
    unionpay: base + '/payment/app/unionpay',
};
(function(mui, doc) {
    if (ismobile) {
        mui.plusReady(function() {
            // 获取支付通道
            plus.payment.getChannels(function(channels) {
                isPayChannelOK = true;
                jQuery.each(channels, function(i, channel) {
                    var txt = "id:" + channel.id + ", description:" + channel.description + ", serviceReady:" + channel.serviceReady + ";";
                    console.log(txt);
                    pays[channel.id] = channel;
                    console.log(channel.id +'----------->'+jQuery("#payType").val())
                    if (channel.id == jQuery("#payType").val()) {
                        isPayChannelOK = true;
                    }
                });
            }, function(e) {
                popAlert("获取支付通道失败：" + e.message);
            });
        });
    }
}(mui, document));

function paySuccess() {
    console.log('-----------paySuccess-------------', jQuery('#orderId').val());
    if (jQuery('#orderId').val()) {
        redirectTo('order_detail.html?id=' + jQuery('#orderId').val());
    }
}

function payFail() {
    console.log('-----------payFail----------------', jQuery('#orderId').val());
    if (jQuery('#orderId').val()) {
        redirectTo('order_detail.html?id=' + jQuery('#orderId').val());
    }
}


    var checkServices = function(pc) {
        if (!pc.serviceReady) {
            var txt = null;
            switch (pc.id) {
                case "alipay":
                    txt = "检测到系统未安装“支付宝快捷支付服务”，无法完成支付操作，是否立即安装？";
                    break;
                default:
                    txt = "系统未安装“" + pc.description + "”服务，无法完成支付，是否立即安装？";
                    break;
            }
            plus.nativeUI.confirm(txt, function(e) {
                if (e.index == 0) {
                    pc.installService();
                }
            }, pc.description);
        }
    };
    var payApp = function(orderId, payType) {
        console.log('-----------------payApp--------------------', payType);
        if (!ismobile) {
            popAlert('当前环境不支持APP方式支付!');
            return;
        }
        if ('unionpay' != payType) {
            console.log("pays------------->"+pays[payType])
            checkServices(pays[payType]);
            if (!isPayChannelOK) {
                console.log("App暂不支持" + jQuery("#payType").val() + "支付");
            }
        }
        console.log("payUrl" ,payUrlMap[payType]);
        plus.nativeUI.showWaiting( "加载中..." );
        jQuery.ajax({
            type: "post",
            url: payUrlMap[payType],
            data: jQuery("#paymentConfirm").serialize(),
            datatype: 'json',
            success: function(result) {
                console.log("result.success", result.success)
                if (result.success) {
                    plus.nativeUI.closeWaiting();
                    console.log(result);
                    if ('unionpay' == payType) {
                        console.log(result.html);
                        var web = plus.webview.create('', "beecloudPay");
                        web.setJsFile(path+'/js/pay/95516.js');
                        web.addEventListener('loaded', function() {
                            if (!web.isVisible()) {
                                web.show();
                            }
                        });
                        setTimeout(function() {
                            var fullScreen = layer.open({
                                type: 1,
                                content: jQuery("#layerHtml").html(),
                                style: "position:fixed; left:0; top:0; width:100%; height:100%; border:none;"
                            });
                            jQuery(".layermbox").css("opacity", "0.9");
                        }, 3000);
                        web.loadData(result.html);
                    } else {

                        var channel = pays[payType];
                        var txt = "id:" + channel.id + ", description:" + channel.description + ", serviceReady:" + channel.serviceReady + ";";
                        console.log(payType, txt);

                        console.log("result.data", result.data);
                        plus.payment.request(channel, result.data, function(res) {
                            plus.nativeUI.closeWaiting();
                            console.log("----- 支付成功 -----");
                            plus.nativeUI.alert("支付成功：感谢你的支持，祝你购物愉快。", function() {
                                redirectTo("order_detail.html?id=" + orderId);
                            }, "付款");
                        }, function(e) {
                            plus.nativeUI.closeWaiting();
                            console.log("----- 支付失败 -----");
                            console.log("[" + e.code + "]：" + e.message);
                            plus.nativeUI.alert("支付失败：请联系管理员。", function() {
                                redirectTo("order_detail.html?id=" + orderId);
                            }, "付款");
                        });

                        setTimeout(function() {
                            plus.nativeUI.closeWaiting();
                        }, 10000);
                    }
                } else {
                    popAlert(result.data);
                    closeWaiting();
                }
            },
            error: function(err) {
                console.log('error:', err.message);
                closeWaiting();
            }
        });

}