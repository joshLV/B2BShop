<!DOCTYPE html>
<html>
<head>
<#assign path="${base}/static/app/gwq"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>银联在线支付</title>
    <style>
        html,body{ height:100%; margin:0; padding:0; font-size:14px;}
        .mask{height:100%; width:100%; position:fixed; _position:absolute; top:0; z-index:1000; }
        .opacity{ opacity:0.3; filter: alpha(opacity=30); background-color:#d8d8d8; }
        .content{ overflow:auto; margin:60% auto auto 46%; z-index:1001; word-wrap: break-word; padding:3px;}
    </style>
</head>
<body>
<#--<div class="mask opacity"></div>
<div class="content"><img style="zoom:1;" src="${base}/static/app/gwq/images/loading.gif"/></div>-->
<form id = "pay_form" action="${requestOrder.requestUrl}" method="post" style="display: none">
    <input type="hidden" name="version" id="version" value="${requestOrder.version}"/>
    <input type="hidden" name="encoding" id="encoding" value="${requestOrder.encoding}"/>
    <input type="hidden" name="signMethod" id="signMethod" value="${requestOrder.signMethod}"/>
    <input type="hidden" name="txnType" id="txnType" value="${requestOrder.txnType}"/>
    <input type="hidden" name="txnSubType" id="txnSubType" value="${requestOrder.txnSubType}"/>
    <input type="hidden" name="bizType" id="bizType" value="${requestOrder.bizType}"/>
    <input type="hidden" name="channelType" id="channelType" value="${requestOrder.channelType}"/>
    <input type="hidden" name="frontUrl" id="frontUrl" value="${requestOrder.frontUrl}"/>
    <input type="hidden" name="backUrl" id="backUrl" value="${requestOrder.backUrl}"/>
    <input type="hidden" name="accessType" id="accessType" value="${requestOrder.accessType}"/>
    <input type="hidden" name="merId" id="merId" value="${requestOrder.merId}"/>
    <input type="hidden" name="orderId" id="orderId" value="${requestOrder.orderId}"/>
    <input type="hidden" name="txnTime" id="txnTime" value="${requestOrder.txnTime}"/>
    <input type="hidden" name="txnAmt" id="txnAmt" value="${requestOrder.txnAmt}"/>
    <input type="hidden" name="currencyCode" id="currencyCode" value="${requestOrder.currencyCode}"/>
    <input type="hidden" name="certId" id="certId" value="${requestOrder.certId}"/>
    <input type="hidden" name="signature" id="signature" value="${requestOrder.signature}"/>
</form>
<script src="${path}/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${path}/js/layer/layer.js"></script>
<script>
    layer.open({type: 2});
    document.all.pay_form.submit();
</script>
</body>
</html>