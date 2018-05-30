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
.mflex textarea {
    width: 500px;
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
            <li style="list-style: none;">撤销询价后，本条询价单将不再接收到新报价；此前已经收到的报价不受影响</li>
        </ul>
    </div>
	<p>
		<table>
			<tr>
				<td colspan="3"><b>*请选择撤销询价的原因</b></td>
			</tr>
			<tr>
				<td>
					<input type="radio" id="reason1" name="reason" value="已收到合适的报价" checked="checked"/>已收到合适的报价
				</td>
				<td>
                    <input type="radio" id="reason2" name="reason" value="未收到合适的报价"/>未收到合适的报价
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					<input type="radio" id="reason3" name="reason" value="已通过其它渠道找到供应商"/>已通过其它渠道找到供应商
				</td>
				<td>
                    <input type="radio" id="reason4" name="reason" value="已取消采购计划"/>已取消采购计划
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					<input type="radio" id="reason5" name="reason" value="其他"/>其他
				</td>
				<td>
                    &nbsp;
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3"><b>补充说明</b></td>
			</tr>
			<tr>
				<td  colspan="3"><textarea rows="5" cols="10" maxlength="50" id="otherReason" ></textarea></td>
			</tr>
		</table>
    </p>
	<div class="btns">
		<a id="cancelsuccess" href="javascript:void(0);" class="btn-h2 btn-success">确认撤销</a>
		<a id="cancelerror" href="javascript:void(0);" class="btn-h2 btn-err">暂不撤销</a>
	</div>

</div>
<script type="text/javascript">
$(function(){

	$("#cancelsuccess").click(function (){
		var id = '${id}';
		var reason = $("input[name='reason']:checked").val()+'。'+$("#otherReason").val();

		parent.revokeEnquiry(id, reason);
	});
	
	$("#cancelerror").click(function (){
		parent.revokeEnquiryError();
	});
	
});
</script>
</body>
</html>