<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>工行ICBC支付</title>
</head>
<body>
<form name="payform" action="${serverUrl }" method="post">
<input type="hidden" name="interfaceName" value="${interfaceName}"/>
<input type="hidden" name="interfaceVersion" value="${interfaceVersion}"/>
<input type="hidden" name="tranData" value="${tranData}"/>
<input type="hidden" name="merSignMsg" value="${merSignMsg}"/>
<input type="hidden" name="merCert" value="${merCert }"/>

<input type="submit" value="确认付款，到通联支付去啦"/>
</form>

<script type="text/javascript">
//document.payform.submit();
</script>
</body>
</html>