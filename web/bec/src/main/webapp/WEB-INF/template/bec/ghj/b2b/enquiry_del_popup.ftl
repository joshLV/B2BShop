<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>取消订单弹出窗口</title>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
window.pageConfig={
	compatible:true,
	navId:"memberpopuplogin"
};
</script>
<style>
.mflex {padding: 10px 20px;font-size: 12px;}
.mflex p {margin-bottom: 16px;text-align: center;}
.mflex .reason_select {
    width: 300px;
}
.mflex textarea {
    width: 300px;
}
.mflex a {color: #005EA7;margin-right: 10px;}
.mflex .btns {text-align: center;margin-bottom: 20px;padding-left: 0;font-size: 20px;}
.tishi{
    color: red;
}
.tishi ul{
	color: red;
}

.btn-err:link, .btn-err:visited, .btn-err:hover, .btn-success:link, .btn-success:visited, .btn-success:hover {color: #333;}
.btn-h2 {
	line-height: 28px;
	font-weight: bold;
	font-size: 14px;
	display: inline-block;
	text-decoration: none;
	padding-left: 11px;
	padding-right: 11px;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	vertical-align: middle;
	border: 1px solid;
	overflow: hidden;
	cursor: pointer;
}

.btn-success {
	background: #F5FBEF;
	border-color: #BFD6AF;
	color: #333333;
	background-image: -webkit-gradient(linear,from(#F5FBEF),to(#EBF6E2));
	background-image: -moz-linear-gradient(top,#F5FBEF,#EBF6E2);
	-ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#F5FBEF',endColorstr='#EBF6E2');
	background-image: -o-linear-gradient(top,#F5FBEF,#F3F2F2);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#F5FBEF',endColorstr='#EBF6E2');
}

.btn-err {
	background: #F3F2F2;
	border-color: #DDDDDD;
	color: #333333;
	background-image: -webkit-gradient(linear,from(#F7F7F7),to(#F3F2F2));
	background-image: -moz-linear-gradient(top,#F7F7F7,#F3F2F2);
	-ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#F7F7F7',endColorstr='#F3F2F2');
	background-image: -o-linear-gradient(top,#F7F7F7,#F3F2F2);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#F7F7F7',endColorstr='#F3F2F2');
}

</style>
</head>
<body>
<div class="mflex">
	<div class="tishi">
		温馨提示：
		<ul>
			<li>删除询价后，本条询价单将不可恢复</li>
		</ul>
	</div>
	<div class="btns">
		<a id="cancelsuccess" href="javascript:void(0);" class="btn-h2 btn-success">确认删除</a>
		<a id="cancelerror" href="javascript:void(0);" class="btn-h2 btn-err">暂不删除</a>
	</div>
</div>
<script type="text/javascript">
$(function(){

	$("#cancelsuccess").click(function (){
		parent.delEnquiry('${id}');
	});
	
	$("#cancelerror").click(function (){
		parent.delEnquiryError();
	});
	
});
</script>
</body>
</html>