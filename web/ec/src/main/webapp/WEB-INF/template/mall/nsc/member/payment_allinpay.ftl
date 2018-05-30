<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>通联支付</title>
</head>
<body>
<form name="payform" action="${serverUrl }" method="post">
<input type="hidden" name="inputCharset" value="${inputCharset}"/>
<input type="hidden" name="pickupUrl" value="${pickupUrl}"/>
<input type="hidden" name="receiveUrl" value="${receiveUrl}"/>
<input type="hidden" name="version" value="${version }"/>
<input type="hidden" name="language" value="${language }"/>
<input type="hidden" name="signType" value="${signType}"/>
<input type="hidden" name="merchantId" value="${merchantId}"/>
<input type="hidden" name="payerName" value="${payerName}"/>
<input type="hidden" name="payerEmail" value="${payerEmail}"/>
<input type="hidden" name="payerTelephone" value="${payerTelephone}"/>
<input type="hidden" name="payerIDCard" value="${payerIDCard }" />
<input type="hidden" name="pid" value="${pid}"/>
<input type="hidden" name="orderNo" value="${orderNo}"/>
<input type="hidden" name="orderAmount" value="${orderAmount}"/>
<input type="hidden" name="orderCurrency" value="${orderCurrency}"/>
<input type="hidden" name="orderDatetime" value="${orderDatetime}"/>
<input type="hidden" name="orderExpireDatetime" value="${orderExpireDatetime}"/>
<input type="hidden" name="productName" value="${productName}"/>
<input type="hidden" name="productPrice" value="${productPrice}"/>
<input type="hidden" name="productNum" value="${productNum }"/>
<input type="hidden" name="productId" value="${productId}"/>
<input type="hidden" name="productDesc" value="${productDesc}"/>
<input type="hidden" name="ext1" value="${ext1}"/>
<input type="hidden" name="ext2" value="${ext2}"/>
<input type="hidden" name="payType" value="${payType}"/>
<input type="hidden" name="issuerId" value="${issuerId}"/>
<input type="hidden" name="pan" value="${pan}"/>
<input type="hidden" name="tradeNature" value="${tradeNature}"/>
<input type="hidden" name="signMsg" value="${signMsg}"/>

<!--<input type="submit" value="确认付款，到通联支付去啦"/>-->
</form>

<script type="text/javascript">
document.payform.submit();
</script>
</body>
</html>