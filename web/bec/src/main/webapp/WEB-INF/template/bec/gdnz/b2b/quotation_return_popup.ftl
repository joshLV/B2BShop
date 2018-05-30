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
	<p>
		<table>
			<tr>
				<td colspan="3"><b>本次报价未被采用，原因是（必选，对应原因会通知到供应商）：</b></td>
			</tr>
			<tr>
				<td>
					<input type="radio" id="reason1" name="reason" value="价格不合适" checked="checked"/>价格不合适
				</td>
				<td>
                    <input type="radio" id="reason2" name="reason" value="产品不合适"/>产品不合适
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
					<input type="radio" id="reason3" name="reason" value="公司资质能力不符"/>公司资质能力不符
				</td>
				<td>
					<input type="radio" id="reason4" name="reason" value="其他"/>其他
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3"><b>补充说明</b></td>
			</tr>
			<tr>
				<td  colspan="3"><textarea rows="5" cols="10" maxlength="50" id="otherReason" ></textarea></td>
			</tr>
			<tr>
				<td>
                    <input type="checkbox" id="anewOffer" name="anewOffer" value="1" checked="true"/>允许供应商重新报价
				</td>
				<td>
                    &nbsp;
				</td>
				<td>&nbsp;</td>
			</tr>
		</table>
    </p>
	<div class="btns">
		<a id="cancelsuccess" href="javascript:void(0);" class="btn-h2 btn-success">确认退回</a>
		<a id="cancelerror" href="javascript:void(0);" class="btn-h2 btn-err">暂不退回</a>
	</div>

</div>
<script type="text/javascript">
$(function(){

	$("#cancelsuccess").click(function (){
		//Desc:将退回原因与补充说明放开,便于MCM显示换行 Auth:zhangqiang Time:2015-11-26 11:36:25 Start
        var reason = $("input[name='reason']:checked").val()+'。';
		/** 修复当otherRea为空时URL找不到的BUG  田彧  2015-12-30 14:55:49 Start */
		var otherRea = $.trim($("#otherReason").val());

		if(otherRea == ''){
            otherRea = '无';
		}
		/** 修复当otherRea为空时URL找不到的BUG  田彧  2015-12-30 14:55:49 End */

        //Desc:将退回原因与补充说明放开,便于MCM显示换行 Auth:zhangqiang Time:2015-11-26 11:36:25 End

		var $anewOffer = $("input[name='anewOffer']:checked");
        var anewOffer = 2;
		if($anewOffer.length > 0){
            anewOffer = 1;
		}
		parent.returnQuotation('${id}', anewOffer,reason,otherRea);
	});
	
	$("#cancelerror").click(function (){
		parent.returnQuotationError();
	});
	
});

/**
 * 判断是否是空
 * @param value
 */
//function isEmpty(value){
//    if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
//        return true;
//    }
//    else{
//        value = (value+"").replace(/\s/g,'');
//        if(value == ""){
//            return true;
//        }
//        return false;
//    }
//}
</script>
</body>
</html>