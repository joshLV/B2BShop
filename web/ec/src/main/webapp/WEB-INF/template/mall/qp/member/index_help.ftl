<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><@spring.message "project_name"/></title>
<meta name="description" content="<@spring.message "project_name"/>">
<meta name="Keywords" content="<@spring.message "project_name"/>">
<link href="${base}/static/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
<link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/mall/css/index.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"home"
};
</script>
</head>
<body>
<#include "mall/qp/shortcut.ftl"/>
<#include "mall/qp/header.ftl"/>
<#include "mall/qp/member/showcase.ftl"/>
<#include "mall/qp/service.ftl"/>
<#include "mall/qp/footer.ftl"/>


</body>
</html>