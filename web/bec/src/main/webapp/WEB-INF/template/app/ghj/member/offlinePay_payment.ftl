<div class="apiDetail">
<div>
	<h2><span>Boolean</span><span class="path">treeNode.</span>check_Focus</h2>
	<h3>概述<span class="h3_info">[ 依赖 <span class="highlight_green">jquery.ztree.excheck</span> 扩展 js ]</span></h3>
	<div class="desc">
		<p></p>
		<div class="longdesc">
			<p>用于设置节点的 checkBox / radio 的 focus 状态。<span class="highlight_red">[setting.check.enable = true 时有效]</span></p>
			<p class="highlight_red">zTree 内部使用，请勿进行初始化 或 随意修改</p>
			<p>默认值：false</p>
		</div>
	</div>
	<h3>Boolean 格式说明</h3>
	<div class="desc">
	<p>true 表示当前鼠标移动到输入框内</p>
	<p>false 表示当前鼠标移动到输入框外</p>
	</div>
</div>
</div>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       /*
 * Translated default messages for the jQuery validation plugin.
 * Locale: UK (Ukrainian; українська мова)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Це поле необхідно заповнити.",
		remote: "Будь ласка, введіть правильне значення.",
		email: "Будь ласка, введіть коректну адресу електронної пошти.",
		url: "Будь ласка, введіть коректний URL.",
		date: "Будь ласка, введіть коректну дату.",
		dateISO: "Будь ласка, введіть коректну дату у форматі ISO.",
		number: "Будь ласка, введіть число.",
		digits: "Вводите потрібно лише цифри.",
		creditcard: "Будь ласка, введіть правильний номер кредитної карти.",
		equalTo: "Будь ласка, введіть таке ж значення ще раз.",
		accept: "Будь ласка, виберіть файл з правильним розширенням.",
		maxlength: $.validator.format("Будь ласка, введіть не більше {0} символів."),
		minlength: $.validator.format("Будь ласка, введіть не менше {0} символів."),
		rangelength: $.validator.format("Будь ласка, введіть значення довжиною від {0} до {1} символів."),
		range: $.validator.format("Будь ласка, введіть число від {0} до {1}."),
		max: $.validator.format("Будь ласка, введіть число, менше або рівно {0}."),
		min: $.validator.format("Будь ласка, введіть число, більше або рівно {0}.")
	});
}(jQuery));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          <div class="sh_info">
                        <div class="keys">开户行:</div>
                        <div class="val">&nbsp;中国工商银行股份有限公司西安曲江支行</div>
                    </div>
                    <div class="sh_info">
                        <div class="keys">转账账号:</div>
                        <div class="val">&nbsp;<strong>3700051309100005336</strong></div>
                    </div>

                    <#if voucherType == 'order'>
                        <div class="sh_info" style="border-bottom: 0;">
                            <div class="keys">支付金额:</div>
                            <div class="val">&nbsp;<strong class="ftx-01">￥${(order.totalAmount - order.depositMoney)?number?string("##0.00")}</strong></div>
                        </div>
                    <#elseif  voucherType == 'deposit'>
                        <div class="sh_info" style="border-bottom: 0;">
                            <div class="keys">定金金额:</div>
                            <div class="val">&nbsp;<strong class="ftx-01">￥${order.depositMoney?number?string("##0.00")}</strong></div>
                        </div>
                    </#if>
                </div>
            </div>
        </li>
        <li>
            <div class="order-box" style="padding-bottom: 0;" id="uploadFileBlock">
                <div class="order-width">
                    <p class="border-bottom usr-name" style="padding-bottom: 3px; margin-bottom: 5px!important;"><b style="color: #333;font-size: 16px;"> 上传支付凭证</b></p>
                    <div class="sh_info">
                        <div class="key" style="margin-top: 5px;"><strong class="ftx-01">*</strong>凭证一</div>
                        <div class="file-box">
			    <input type='button' class='btn' value='请选择文件' style="color: #eee;background-color: red;"/> 
			    <input type="file" name="fileField" class="file" id="file1"  accept="image/*" /> 
			    <div></div>
			    <br><span style="display: none;width: 120px;" id="uploadfile1PreviewSpan" ><img id="uploadfile1Preview" width="100%" height="100%" data-preview-group="1" /><span onclick="showPic();">点击凭证图片可进行预览</span></span>
                        </div>
                    </div>
                    <div class="sh_info">
                        <div class="key" style="margin-top: 5px;">凭证二</div>
			<div class="file-box">
			    <input type='button' class='btn' value='请选择文件' style="color: #eee;background-color: red;"/> 
			    <input type="file" name="fileField" class="file" id="file2"  accept="image/*" /> 
			    <div></div>
			    <br><span style="display: none;width: 120px;" id="uploadfile2PreviewSpan" ><img id="uploadfile2Preview" width="100%" height="100%" data-preview-group="1"/><span onclick="showPic();">点击凭证图片可进行预览</span></span>
                        </div>
                    </div>
                    <div class="sh_info">
                        <div class="key" style="margin-top: 5px;">凭证三</div>
			<div class="file-box">
			    <input type='button' class='btn' value='请选择文件' style="color: #eee;background-color: red;"/> 
			    <input type="file" name="fileField" class="file" id="file3" accept="image/*" /> 
			    <div></div>
			    <br><span style="display: none;width: 120px;" id="uploadfile3PreviewSpan" ><img id="uploadfile3Preview" width="100%" height="100%" data-preview-group="1"/><span onclick="showPic();">点击凭证图片可进行预览</span></span>
                        </div>
                    </div>
                    <div class="sh_info" style="border-bottom: 0;">
                        <div><input type="button" class="inp_sub inp_sub2" id="inp_sub" value="上传" onclick="submitRefundApply()" style="height:35px; width:110px;color: #eee;background-color: red;"/></div>
                    </div>
                </div>
            </div>
        </li>
    </ul>
</div>
<form id='apply-form' action="${base}/payment/merge/addOfflinePayApp">
    <input type="hidden" id="uploadfile1" name="uploadfile1" />
    <input type="hidden" id="uploadfile2" name="uploadfile2" />
    <input type="hidden" id="uploadfile3" name="uploadfile3" />
    <input type="hidden" id="orderSn" name="orderSn" value="${order.orderSn}"/>
    <input type="hidden" id="voucherType" name="voucherType" value="${voucherType}"/>
    <input type="hidden" id="orderOfflinepayVoucherId" name="orderOfflinepayVoucherId" value="<#if orderOfflinepayVoucher.id??>${orderOfflinepayVoucher.id}<#else>-1</#if>"/>
</form>
<#include "app/ghj/tools.ftl">
<script src="${path}/js/lrimg3/lrz.mobile.min.js"></script>
<script src="${path}/js/mui.min.js"></script>
<script src="${path}/js/mui.zoom.js"></script>
<script src="${path}/js/mui.previewimage.js"></script>
<script>
 (function(mui, doc) {
    mui.init();
    mui.ready(function () {
    var voucherType="${voucherType}"
    var op=false;
	//查询凭证
	var url="${base}/payment/merge/findOfflinePayByOrderSn";
	jQuery.ajax({
		type: "post",
		url: url,
		data:{"orderSn":${order.orderSn}},
		dataType: "json",
		success: function (result){
			if (result.status) {
                if(result.data!=null){
                    result.data.forEach(function(obj){
                        console.log("obj.voucherType---->"+obj.voucherType);
                        if(voucherType=='order' && obj.voucherType=='order'){
                            jQuery('#orderOfflinepayVoucherId').val(obj.id);
                            op=true;
                            if(obj.voucherPic1!=null){
                                //凭证一
                                jQuery('#uploadfile1PreviewSpan').show();
                                jQuery('#uploadfile1Preview').prop('src', result.imgSrvAddr + obj.voucherPic1);
                                jQuery('#uploadfile1Preview').attr('data-preview-src',  result.imgSrvAddr + obj.voucherPic1);
                                jQuery('#uploadfile1').val(obj.voucherPic1);
                            }

                            if(obj.voucherPic2!=null) {
                                //凭证二
                                jQuery('#uploadfile2PreviewSpan').show();
                                jQuery('#uploadfile2Preview').prop('src', result.imgSrvAddr + obj.voucherPic2);
                                jQuery('#uploadfile2Preview').attr('data-preview-src', result.imgSrvAddr + obj.voucherPic2);
                                jQuery('#uploadfile2').val(obj.voucherPic2);
                            }
                            if(obj.voucherPic3!=null) {
                                jQuery('#uploadfile3PreviewSpan').show();
                                jQuery('#uploadfile3Preview').prop('src', result.imgSrvAddr + obj.voucherPic3);
                                jQuery('#uploadfile3Preview').attr('data-preview-src', result.imgSrvAddr + obj.voucherPic3);
                                jQuery('#uploadfile3').val(obj.voucherPic3);
                            }

                        }


                        if(voucherType=='deposit' && obj.voucherType=='deposit'){
                            jQuery('#orderOfflinepayVoucherId').val(obj.id);
                            op=true;
                            if(obj.voucherPic1!=null){
                                //凭证一
                                jQuery('#uploadfile1PreviewSpan').show();
                                jQuery('#uploadfile1Preview').prop('src', result.imgSrvAddr + obj.voucherPic1);
                                jQuery('#uploadfile1Preview').attr('data-preview-src',  result.imgSrvAddr + obj.voucherPic1);
                                jQuery('#uploadfile1').val(obj.voucherPic1);
                            }

                            if(obj.voucherPic2!=null) {
                                //凭证二
                                jQuery('#uploadfile2PreviewSpan').show();
                                jQuery('#uploadfile2Preview').prop('src', result.imgSrvAddr + obj.voucherPic2);
                                jQuery('#uploadfile2Preview').attr('data-preview-src', result.imgSrvAddr + obj.voucherPic2);
                                jQuery('#uploadfile2').val(obj.voucherPic2);
                            }
                            if(obj.voucherPic3!=null) {
                                jQuery('#uploadfile3PreviewSpan').show();
                                jQuery('#uploadfile3Preview').prop('src', result.imgSrvAddr + obj.voucherPic3);
                                jQuery('#uploadfile3Preview').attr('data-preview-src', result.imgSrvAddr + obj.voucherPic3);
                                jQuery('#uploadfile3').val(obj.voucherPic3);
                            }

                        }
                    })
                }

                /*if(result.data.voucherPic1!=null){
                    if(voucherType=='order' && result.data.voucherType=='order'){
                        op=true;
                        //凭证一
                        jQuery('#uploadfile1PreviewSpan').show();
                        jQuery('#uploadfile1Preview').prop('src', result.imgSrvAddr + result.data.voucherPic1);
                        jQuery('#uploadfile1Preview').attr('data-preview-src',  result.imgSrvAddr + result.data.voucherPic1);
                        jQuery('#uploadfile1').val(result.data.voucherPic1);
                    }
                    if(voucherType=='deposit' && result.data.voucherType=='deposit'){
                        op=true;
                        //凭证一
                        jQuery('#uploadfile1PreviewSpan').show();
                        jQuery('#uploadfile1Preview').prop('src', result.imgSrvAddr + result.data.voucherPic1);
                        jQuery('#uploadfile1Preview').attr('data-preview-src',  result.imgSrvAddr + result.data.voucherPic1);
                        jQuery('#uploadfile1').val(result.data.voucherPic1);
                    }

			   }
			   //凭证二
			   if(result.data.voucherPic2!=null){
                   if(voucherType=='order' && result.data.voucherType=='order'){
                       op=true;
                       jQuery('#uploadfile2PreviewSpan').show();
                       jQuery('#uploadfile2Preview').prop('src', result.imgSrvAddr + result.data.voucherPic2);
                       jQuery('#uploadfile2Preview').attr('data-preview-src',  result.imgSrvAddr + result.data.voucherPic2);
                       jQuery('#uploadfile2').val(result.data.voucherPic2);
                   }
                   if(voucherType=='deposit' && result.data.voucherType=='deposit'){
                       op=true;
                       jQuery('#uploadfile2PreviewSpan').show();
                       jQuery('#uploadfile2Preview').prop('src', result.imgSrvAddr + result.data.voucherPic2);
                       jQuery('#uploadfile2Preview').attr('data-preview-src',  result.imgSrvAddr + result.data.voucherPic2);
                       jQuery('#uploadfile2').val(result.data.voucherPic2);
                   }
			   }
			   //凭证三
			   if(result.data.voucherPic3!=null){
                   if(voucherType=='order' && result.data.voucherType=='order'){
                       op=true;
                       jQuery('#uploadfile3PreviewSpan').show();
                       jQuery('#uploadfile3Preview').prop('src', result.imgSrvAddr + result.data.voucherPic3);
                       jQuery('#uploadfile3Preview').attr('data-preview-src',  result.imgSrvAddr + result.data.voucherPic3);
                       jQuery('#uploadfile3').val(result.data.voucherPic3);
                   }
                   if(voucherType=='deposit' && result.data.voucherType=='deposit'){
                       op=true;
                       jQuery('#uploadfile3PreviewSpan').show();
                       jQuery('#uploadfile3Preview').prop('src', result.imgSrvAddr + result.data.voucherPic3);
                       jQuery('#uploadfile3Preview').attr('data-preview-src',  result.imgSrvAddr + result.data.voucherPic3);
                       jQuery('#uploadfile3').val(result.data.voucherPic3);
                   }

			   }*/
                mui.previewImage();
			   $(".mui-preview-header").append("<button style='float:left;' onclick='disableReturnButton()'>关闭</button>");
			   
			   $("#inp_sub").attr("value","更新凭证");
            }else{
			   $("#inp_sub").attr("value","上传凭证");
			}

            if(op){
                $("#inp_sub").attr("value","更新凭证");
            }else{
                $("#inp_sub").attr("value","上传凭证");
            }
        },
            error : function(error) {
                    //closeWaiting();
                   // popAlert("亲爱的用户请不要频繁点击, 请稍后重试...");
            }
         });


        jQuery('input[type="file"]').on('change', function () {
	    
            var inputImage = this;
	    showWaiting();
	    if(inputImage.files[0].size/(1024 * 1024)>=5){
	        popAlert("图片不符合规格,建议规格小于5MB!"); 
		closeWaiting();
		jQuery('input[type="file"]').val("");
		return false;
	    }
	   
            lrz(inputImage.files[0], {width: 400}, function (results) {
                console.log(results);
                setTimeout(function () {
                    //校验用，防止未完整接收
                    var data = {base64: results.base64, name:results.origin.name,size: results.base64.length};
                    var url="${base}/ajaxUploadFiles";
                    jQuery.ajax({
                        type: "POST", url: url, data: data, dataType:"json", success: function(data){
                            if ("success" == data.status) {
                                console.log(data.data);
                                jQuery('#upload'+inputImage.id+'PreviewSpan').show();
                                jQuery('#upload'+inputImage.id+'Preview').prop('src', data.data.imgSrvAddr + '/'+ data.data.projectName + '/' + data.data.path);
                                jQuery('#upload'+inputImage.id+'Preview').attr('data-preview-src',  data.data.imgSrvAddr + '/'+ data.data.projectName + '/' + data.data.path);
                                jQuery('#upload'+inputImage.id).val(data.data.projectName + '/' + data.data.path);
                                mui.previewImage();
				closeWaiting();
                                return false;  
                            }else{
                                popAlert(data.message);
                                return false;
                            }
                        },
                        error:function(){ //上传失败
                            popAlert('网络异常，上传失败，请稍候再试');
                        }
                    });    


                }, 100);
            })
        })
          
	jQuery('#uploadfile3Preview').on('click', function () {
	     //
	})
	
        
        submitRefundApply = function(){
            showWaiting();
            if($("#uploadfile1").val()==""){
            popAlert("请选择支付凭证一!");
            closeWaiting();
            return;
            }
	    $("#apply-form").submit();
        }
    })

    mui.back = function(){
	window.location.href="${base}/order/list?orderBy=a.createDate&orderType=desc&status=wait_buyer_pay&whichclient=whichapp&paymentStatus=unpaid#wait_buyer_pay";
    }
 }(mui, document));
 function toListPage(){
	window.location.href="${base}/order/list?orderBy=a.createDate&orderType=desc&status=wait_buyer_pay&whichclient=whichapp&paymentStatus=unpaid#wait_buyer_pay";
 }
 function disableReturnButton(){
	$("#__MUI_PREVIEWIMAGE").css("display","none");
	$("#__MUI_PREVIEWIMAGE").removeClass(" mui-preview-in");
	
 }
 function showPic(){
	$("#__MUI_PREVIEWIMAGE").css("display","block");
	$("#__MUI_PREVIEWIMAGE").addClass(" mui-preview-in");
 }
</script>
</body>
</html>