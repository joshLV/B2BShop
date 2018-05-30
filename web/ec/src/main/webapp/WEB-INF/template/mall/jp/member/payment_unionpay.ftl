<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>银联在线支付</title>
</head>
<body>
<form id = "pay_form" action="${requestOrder.requestUrl}" method="post">
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
<script type="text/javascript">
    document.all.pay_form.submit();
</script>
</body>
</html>