<#escape x as x?html>
	<#include "bec/gwq/header.ftl"/>
<div id="container">
	<#-- 20151130 dzz <!-- <#include "bec/gwq/top.ftl"/> -->
<div class="mflex">
	<p>
		<table>
			<tr>
				<td>*取消原因：</td>
				<td>
                    <select class="reason_select" id="cancelReason">
                        <option value="现在不想购买">现在不想购买</option>
                        <option value="商品价格较贵">商品价格较贵</option>
                        <option value="价格波动">价格波动</option>
                        <option value="商品缺货">商品缺货</option>
                        <option value="重复下单">重复下单</option>
                        <option value="添加或删除商品">添加或删除商品</option>
                        <option value="收货人信息有误">收货人信息有误</option>
                        <option value="发票信息有误">发票信息有误</option>
                        <option value="无法支付订单">无法支付订单</option>
                        <option value="0">其他原因</option>
                    </select>
				</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>*其他原因：</td>
				<td><textarea rows="5" cols="10" maxlength="50" id="otherReason" disabled></textarea></td>
                <td><span id="otherReason_span" style="color: red;display: none;">请填写原因</span></td>
			</tr>
		</table>
    </p>
	<div class="btns">
		<a id="cancelsuccess" href="javascript:void(0);" class="btn-h2 btn-success">确认取消</a>
		<a id="cancelerror" href="javascript:void(0);" class="btn-h2 btn-err">暂不取消</a>
	</div>
	<div class="tishi">
		温馨提示：
		<ul>
			<li>订单成功取消后无法恢复</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$("#cancelReason").change(function(){
		if( $(this).val() == '0' ){
			$("#otherReason").removeAttr("disabled");
		}else{
            $("#otherReason").attr("disabled", true);
		}
	});
	$("#cancelsuccess").click(function (){
		var orderId = '${orderId}';
		var reason = '';
		if($("#cancelReason").val() == '0'){
			if($.trim($("#otherReason").val()) == ''){
				$("#otherReason_span").show();
				return false;
			}else{
                $("#otherReason_span").hide();
            	reason = $("#otherReason").val();
			}
		}else{
            reason = $("#cancelReason").val();
		}
		parent.cancleOrder(orderId, reason);
	});
	
	$("#cancelerror").click(function (){
		parent.cancleOrderError();
	});
	
});
</script>
</div>
	<#--<#include "bec/gwq/service.ftl"/>-->
	<#-- 20151130 dzz <!-- <#include "bec/gwq/foot.ftl"/> &ndash;&gt;-->
</#escape>