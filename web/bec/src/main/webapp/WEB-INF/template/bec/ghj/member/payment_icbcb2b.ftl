<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>工行ICBC支付</title>
</head>
<body>
<form name="payform" action="${serverUrl }" method="post">
    <input type="hidden" name="APIName" value="${APIName}"/>
    <input type="hidden" name="APIVersion" value="${APIVersion}"/>
    <input type="hidden" name="Shop_code" value="${Shop_code}"/>
    <!--若不正确，将无银行反馈信息，注意不能省略"http://"-->
    <input type="hidden" name="MerchantURL" value="${MerchantURL}"/>
    <input type="hidden" name="ContractNo" value="${ContractNo}"/>
    <!--金额为不带小数点的到分的一个字符串，即“112390”代表的是“1123.90元”-->
    <input type="hidden" name="ContractAmt" value="${ContractAmt}"/>
    <input type="hidden" name="Account_cur" value="${Account_cur}"/>
    <input type="hidden" name="JoinFlag" value="${JoinFlag}"/>
    <input type="hidden" name="Mer_Icbc20_signstr" value="${Mer_Icbc20_signstr}"/>
    <input type="hidden" name="Cert" value="${Cert}"/>
    <input type="hidden" name="SendType" value="${SendType}"/>
    <input type="hidden" name="TranTime" value="${TranTime}"/>
    <input type="hidden" name="Shop_acc_num" value="${Shop_acc_num}"/>
    <input type="hidden" name="PayeeAcct" value="${PayeeAcct}"/>
    <input type="hidden" name="GoodsCode" value="${GoodsCode}"/>
    <input type="hidden" name="GoodsName" value="${GoodsName}"/>
    <input type="hidden" name="Amount" value="${Amount}"/>
    <input type="hidden" name="TransFee" value="${TransFee}"/>
    <input type="hidden" name="ShopRemark" value="${ShopRemark}"/>
    <input type="hidden" name="ShopRem" value="${ShopRem}"/>


<input type="submit" value="确认付款，到通联支付去啦"/>
</form>

<script type="text/javascript">
//document.payform.submit();
</script>
</body>
</html>