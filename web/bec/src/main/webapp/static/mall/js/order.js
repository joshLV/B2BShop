/*收货地址的处理 - start*/

/**
 * 选择常用收货人地址
 */
var index;
function chose_Consignee(id) {
	$("#consignee-form").hide();
	$("#use-new-address").attr("class", "item");
	$("#consignee_radio_" + id).attr("checked", "checked");
	set_CurrentConsignee(id);
}

/**
 * 设置当前常用收货地址变高亮，其他不亮
 */
function set_CurrentConsignee(id) {
	var parentDiv = $("#consignee_radio_" + id).parent();
	var indexNumCurrent = parentDiv.attr("index").split("_")[2];
	var consigneeList = $("#consignee-list");
	consigneeList.find(".item").each(function() {
		if ($(this).attr("index") == null) {
			$(this).attr("class", "item");
		} else {
			var indexNum = $(this).attr("index").split("_")[2];
			if (indexNumCurrent == indexNum) {
				$(this).attr("class", "item item-selected");
			} else {
				if (parseInt(indexNum) > 20) {//系统允许的收货人个数5
					$(this).attr("class", "item item-fore hide");
				} else {
					$(this).attr("class", "item");
				}
				try {
					$(this).find("span").eq(0).hide();
				} catch (e) {
				}
			}
		}
	});
	$("#consignee_radio_" + id).attr("checked", "checked");
	$("#consignee_radio_" + id).parents(".item").find(".item-action").show()
			.removeClass("hide");
}


/**
 * 删除收货人验证提示信息
 */
function removeConsingeeMessage() {
	$("#name_div").removeClass("message");
	$("#area_div").removeClass("message");
	$("#address_div").removeClass("message");
	$("#call_div").removeClass("message");
	$("#email_div").removeClass("message");
	$("#name_div_error").html("");
	$("#area_div_error").html("");
	$("#address_div_error").html("");
	$("#call_div_error").html("");
	$("#email_div_error").html("");
}

/**
 * 使用新收货人地址
 */
function use_NewConsignee() {
	//if (checkMaxConsigneeSize("use_NewConsignee")) {
	//	return;
	//}
    var num =$("#addressNum_top").val();
    if(num>5){
        alert("抱歉，地址信息最多可创建6条。");
        return;
    }
    
    $("#order_receiverId").val("");
	removeConsingeeMessage();
	// 地区选择菜单
    $(".lSelect").remove();//移除之前生成的
    $(".areaSelect").val("");
	$(".areaSelect").lSelect({
		url: base+"area/ajaxChildren"// Json数据获取url
	});
	
	$("#use-new-address").attr("class", "item");
	$("#addNumLimitNote").css("display", "none");
	$("#consignee_radio_new").attr("checked", "checked");
	$("#consignee-form").show();
	
	$("#consignee_name").val("");
    $("#consignee_form_id").val("");
    $("#consignee_phone").val("");
    $("#consignee_mobile").val("");
    $("#consignee_address").val("");
    $("#consignee_email").val("");
    $("#consignee_zipCode").val("");

	// #高亮选中
	$("#use-new-address").attr("class", "item item-selected");
	var consigneeList = $("#consignee-list");
	consigneeList.find(".item").each(function() {
		var indexNum = $(this).attr("index").split("_")[2];
		if (parseInt(indexNum) > 20) {//系统允许的收货人个数5
			$(this).attr("class", "item item-fore hide");
		} else {
			$(this).attr("class", "item");
		}
	});
	return;
}

/**
 * 保存收货地址（包含保存常用人收货地址，根据id区分）
 */
function save_Consignee() {
	//if (checkMaxConsigneeSize("save_Consignee")) {
	//	return;
	//}
	
	var $isReceiverSubmit = $("#isReceiverSubmit");
	if($isReceiverSubmit.val()=='true'){
		layer.alert("正在提交信息，请勿重复提交！");
		return;
	}
	
	var isHidden = $("#consignee-form").is(":hidden");// 是否隐藏
	var id = $("input[name='consignee_radio']:checked").val();// 获取收货人id
	if(id==undefined){
		layer.alert("请选择收货人地址!",{icon:2});
		layer.close(index);
		return;
	}

	$isReceiverSubmit.val('true');
	if(id!="userNew" && isHidden){
		//使用已有的收货地址
		refreshConsigneeContent(id);
	}else{
		var checkConsignee = true;
		// 验证收货人信息是否正确
		if (!check_Consignee("name_div")) {
			checkConsignee = false;
		}
		// 验证地区是否正确
		if (!check_Consignee("area_div")) {
			checkConsignee = false;
		}
		// 验证收货人地址是否正确
		if (!check_Consignee("address_div")) {
			checkConsignee = false;
		}
		// 验证邮政编码是否正确
		if (!check_Consignee("zipCode_div")) {
			checkConsignee = false;
		}
		// 验证手机号码是否正确
		if (!check_Consignee("call_mobile_div")) {
			checkConsignee = false;
		}
		// 验证电话是否正确
		if (!check_Consignee("call_phone_div")) {
			checkConsignee = false;
		}
		// 验证邮箱是否正确
		if (!check_Consignee("email_div")) {
			checkConsignee = false;
		}
		if (!checkConsignee) {
			$isReceiverSubmit.val('');
			return;
		}
		
		$("#saveConsigneeTitleDiv").html("&nbsp;&nbsp;正在提交信息&nbsp;&nbsp;");
		
		var actionUrl = base+"receiver/update";
		if(id!="userNew" && !isHidden ){
			actionUrl = base+"receiver/update";
		}
		if(id=="userNew"){
			actionUrl = base+"receiver/save";
		}
		//console.log("166  --->actionUrl:"+actionUrl);
		var receiver_id=$("#consignee_form_id").val();
		var consignee_name = $("#consignee_name").val();
        var areaPath = $(".areaSelect").val();
        var areaId = areaPath.substring(areaPath.lastIndexOf(',')+1,areaPath.length);
	    var consignee_address = $("#consignee_address").val();
	    var consignee_mobile = $("#consignee_mobile").val();
	    var consignee_phone = $("#consignee_phone").val();
	    var consignee_email = $("#consignee_email").val();
	    var consignee_zipCode = $("#consignee_zipCode").val();
        var param={"name":consignee_name,"id":receiver_id,"areaId":areaId,"areaPath":areaPath,"address":consignee_address,"mobile":consignee_mobile,"email":consignee_email,"phone":consignee_phone,"zipCode":consignee_zipCode};
	    
        //console.log("176  --->actionUrl:"+actionUrl);
        //console.log(param);
        
        $.ajax( {
	        type : "POST",
	        dataType : "json",
	        url : actionUrl,
	        data : param,
	        cache : false,
	        async : false,//设置同步
	        success : function(data) {
	        	//console.log("返回结果data");
	        	//console.log(data);
	        	
				if(data.status=="success"){
					var receiver=data.receiver;
					
					//console.log("186 receiver");
					//console.log(receiver);
					
					refreshConsigneeItem(receiver);
					refreshConsigneeContent(receiver.id);
					$isReceiverSubmit.val('');
	            }else{
	            	alert(data.message);
					$isReceiverSubmit.val('');
	            }
	        },
	        error : function(XMLHttpResponse) {
	        	alert("网络异常，请稍后重试！");
	        }
	    });
		
	}
	
	$("#saveConsigneeTitleDiv").html("保存收货人信息");
	$("#consignee-form").hide();
	
	save_Module("consignee");
	
	$("#editConsignee").show();
	$("#saveConsigneeTitleMinDiv").hide();
	$("#consignee-content").show();
	$("#consignee-edit-div").hide();
	
	$isReceiverSubmit.val('false');
}

function isEmpty(value){
	return 0==value.length;
};

/**
 * 验证收货地址消息提示
 */
function check_Consignee(divId) {
	var errorFlag = false;
	var errorMessage = null;
	var value = null;
	// 验证收货人名称
	if (divId == "name_div") {
		value = $("#consignee_name").val();
		if (isEmpty(value)) {
			errorFlag = true;
			errorMessage = "请您填写收货人姓名";
		}
		if (value.length > 25) {
			errorFlag = true;
			errorMessage = "收货人姓名不能大于25位";
		}
		if (!is_forbid(value)) {
			errorFlag = true;
			errorMessage = "收货人姓名中含有非法字符";
		}
	}
	// 验证邮箱格式
	else if (divId == "email_div") {
		value = $("#consignee_email").val();
		if (!isEmpty(value)) {
			if (!check_email(value)) {
				errorFlag = true;
				errorMessage = "邮箱格式不正确";
			}
		} else {
			if (value.length > 50) {
				errorFlag = true;
				errorMessage = "邮箱长度不能大于50位";
			}
		}
	}
	// 验证收货人地址
	else if (divId == "address_div") {
		value = $("#consignee_address").val();
		if (isEmpty(value)) {
			errorFlag = true;
			errorMessage = "请您填写收货人详细地址";
		}
		if (!is_forbid(value)) {
			errorFlag = true;
			errorMessage = "收货人详细地址中含有非法字符";
		}
		if (value.length>50) {
			errorFlag = true;
			errorMessage = "收货人详细地址过长";
		}
	}
	// 验证邮政编码
	else if (divId == "zipCode_div") {
		value = $("#consignee_zipCode").val();
		if (isEmpty(value)) {
			errorFlag = true;
			errorMessage = "请您填写邮政编码";
		}else{
			if (!is_postcode(value)) {
				errorFlag = true;
				errorMessage = "邮政编码中含有非法字符";
			}
			if (value.length>7) {
				errorFlag = true;
				errorMessage = "邮政编码过长";
			}
		}
	}
	// 验证手机号码
	else if (divId == "call_mobile_div") {
		value = $("#consignee_mobile").val();
		divId = "call_div";
		if (isEmpty(value)) {
			errorFlag = true;
			errorMessage = "请您填写收货人手机号码";
		} else {
			if (!check_mobile(value)) {
				errorFlag = true;
				errorMessage = "手机号码格式不正确";
			}
		}
		if (!errorFlag) {
			value = $("#consignee_phone").val();
			if (!isEmpty(value)) {
				if (!is_forbid(value)) {
					errorFlag = true;
					errorMessage = "固定电话号码中含有非法字符";
				}
				if (!checkPhone(value)) {
					errorFlag = true;
					errorMessage = "固定电话号码格式不正确";
				}
			}
		}
	}
	// 验证电话号码
	else if (divId == "call_phone_div") {
		value = $("#consignee_phone").val();
		divId = "call_div";
		if (!isEmpty(value)) {
			if (!is_forbid(value)) {
				errorFlag = true;
				errorMessage = "固定电话号码中含有非法字符";
			}
			if (!checkPhone(value)) {
				errorFlag = true;
				errorMessage = "固定电话号码格式不正确";
			}
		}
		if (true) {
			value = $("#consignee_mobile").val();
			if (isEmpty(value)) {
				errorFlag = true;
				errorMessage = "请您填写收货人手机号码";
			} else {
				if (!check_mobile(value)) {
					errorFlag = true;
					errorMessage = "手机号码格式不正确";
				}
			}
		}
	}
	// 验证地区是否完整
	else if (divId == "area_div") {
		value = $(".areaSelect").val();
		if (isEmpty(value)) {
			errorFlag = true;
			errorMessage = "请您选择完整的地区信息";
		} else {
			if($(".lSelect").size()>value.split(",").length){
				errorFlag = true;
				errorMessage = "请您选择完整的地区信息";
			}
		}
	}
		
	if (errorFlag) {
		$("#" + divId + "_error").html(errorMessage);
		$("#" + divId).addClass("message");
		return false;
	} else {
		$("#" + divId).removeClass("message");
		$("#" + divId + "_error").html("");
	}
	return true;
}

function check_Phone(divId){
	 if($("#consignee_mobile").val().length == 11) {
		 var value = $("#consignee_mobile").val();
		 if (check_mobile(value)) {
			 $("#call_div_error").hide();
		 } else {
			 $("#call_div_error").show();
		 }
	 }
}

/**
 * 点击保存公共方法,显示修改操作
 */
function save_Module(name) {

	var actionBefore = $("#" + name + "_back_action").html();
	$("#" + name + "_edit_action").html(actionBefore);
	// 设置关闭变灰
	set_CloseLight(name);
	removeMessageTip();
}

/**
 * 关闭高亮选中
 */
function set_CloseLight(step) {
	if (step == OrderAppConfig.Module_Consignee) {
		$("#step-1").removeClass("step-current");
		$("#"+OrderAppConfig.Module_PayAndShip+"_edit_action").html("<a onclick='edit_Payment(false)' href='javascript:void(0);'>[修改]</a>");
		$("#"+OrderAppConfig.Module_Invoice+"_edit_action").html("<a onclick='edit_Invoice()' href='javascript:void(0);'>[修改]</a>");
		$("#submit_check_info_message").html("").hide();
		$("#order-submit").attr("class", "checkout-submit");
	} else if (step == OrderAppConfig.Module_PayAndShip) {
		$("#step-2").removeClass("step-current");
		$("#"+OrderAppConfig.Module_Consignee+"_edit_action").html("<a onclick='edit_Consignee()' href='javascript:void(0);'>[修改]</a>");
		$("#"+OrderAppConfig.Module_Invoice+"_edit_action").html("<a onclick='edit_Invoice()' href='javascript:void(0);'>[修改]</a>");
		$("#submit_check_info_message").html("").hide();
		$("#order-submit").attr("class", "checkout-submit");
	} else if (step == OrderAppConfig.Module_Invoice) {
		$("#step-3").removeClass("step-current");
		$("#"+OrderAppConfig.Module_PayAndShip+"_edit_action").html("<a onclick='edit_Payment()' href='javascript:void(0);'>[修改]</a>");
		$("#"+OrderAppConfig.Module_Consignee+"_edit_action").html("<a onclick='edit_Consignee()' href='javascript:void(0);'>[修改]</a>");	
		$("#submit_check_info_message").html("").hide();
		$("#order-submit").attr("class", "checkout-submit");
	}
}

function removeMessageTip(){
	$("#save-payAndShip-tip").html("");
	$("#save-consignee-tip").html("");
	$("#save-invoice-tip").html("");
}

/**
 * 编辑收货人地址
 */
function edit_Consignee() {
	$("#step-1").addClass("step-current");
	$("#editConsignee").hide();
	$("#saveConsigneeTitleMinDiv").show();
	$("#consignee-content").hide();
	$("#consignee-edit-div").show();
}

/**
 * 编辑常用收货地址,展开对应信息
 */
function show_ConsigneeDetail(id) {
    var actionUrl =base + "receiver/edit";
    $.ajax({
        type : "POST",
        dataType : "json",
        url : actionUrl,
        data : {"receiverId":id},
        cache : false,
        async : false,//设置同步
        success : function(data) {
            $("#consignee_name").val(data.receiver.name);
            $("#consignee_form_id").val(data.receiver.id);
            $("#consignee_phone").val(data.receiver.phone);
            $("#consignee_mobile").val(data.receiver.mobile);
            $("#consignee_address").val(data.receiver.address);
            $("#consignee_zipCode").val(data.receiver.zipCode);
            $("#consignee_email").val(data.receiver.email);
            $(".areaSelect").val(data.receiver.areaPath);

            removeConsingeeMessage();
		},
        error : function(XMLHttpResponse) {
        	alert("网络异常，请稍后重试！");
        }
    });
    
    // 地区选择菜单
    $(".lSelect").remove();//移除之前生成的
	$(".areaSelect").lSelect({
		url: base+"area/ajaxChildren"// Json数据获取url
	});
	
	// 隐藏20个数量的限制的提示
	$("#addNumLimitNote").css("display", "none");

	$("#consignee-form").show();
	// 设置收货地址详细值
	$("#consignee_radio_" + id).attr("checked", "checked");
		
}

/**
 * 删除常用收货地址
 */
function delReceiver(id){
	if(confirm("确定要删除吗？")){
	    $.ajax( {
	        type : "POST",
	        dataType : "json",
	        url : base + "receiver/delete",
	        data : {"receiverId":id},
	        cache : false,
	        success : function(data) {
	            if(data.status=="success"){
					delConsigneeItem(id);
					$("#consignee_radio_"+id).parent().remove();//页面上删除常用收货地址Item
	            }
	        },
	        error : function(XMLHttpResponse) {
	        	alert("网络异常，请稍后重试！");
	        }
	    });
    }
}

/**
 * 删除常用收货地址Item
 */
function delConsigneeItem(id){
	if($("#consignee_radio_"+id)[0]){
		$("#consignee_radio_"+id).parent();
	}
}

/**
 * 刷新常用收货地址Item
 */
function refreshConsigneeItem(receiver){
	
	//console.log("497 refreshConsigneeItem start");
	
	if($("#consignee_radio_"+receiver.id)[0]){
		//常用收获地址中存在,刷新
		var label = "<b>"+receiver.name+"</b>&nbsp;"+receiver.areaName+receiver.address+" &nbsp; "+receiver.zipCode+" &nbsp; "+receiver.mobile+" &nbsp;";
		$("#consignee_radio_"+receiver.id).next().html(label);
	}else{
		//常用收获地址中不存在,添加
		var $consigneeList=$("#consignee-list");
		var index=$("#consignee-list .item").size()+1;		
		var itemHtml = "<div class=\"item item-selected\" index=\"consignee_index_"+index+"\">"+
						"<input type=\"radio\" class=\"hookbox\" checked=\"\" name=\"consignee_radio\" id=\"consignee_radio_"+receiver.id+"\" value=\""+receiver.id+"\" onclick=\"chose_Consignee('"+receiver.id+"')\">"+
						"<label for=\"consignee_radio_"+receiver.id+"\" onclick=\"chose_Consignee('"+receiver.id+"')\">"+
						"	<b>"+receiver.name+"</b>&nbsp; "+receiver.areaName+receiver.address+" &nbsp; "+receiver.mobile+" &nbsp;"+
						"</label>"+
						"<span class=\"item-action hide\" style=\"display: inline;\">	"+			
							"<a href=\"javascript:void(0);\" onclick=\"show_ConsigneeDetail('"+receiver.id+"')\">编辑</a> &nbsp; "+
							"<a href=\"javascript:void(0);\" onclick=\"delReceiver('"+receiver.id+"')\">删除</a>&nbsp;"+
						"</span>"+
					"</div>";
		$consigneeList.append(itemHtml);
		
		$("#use-new-address").removeClass("item-selected");
		$("#addressNum_top").val($("#addressNum_top").val()+1);
		$("#consignee-list").show();
	}
	
	//console.log("497 refreshConsigneeItem end");
	
}

/**
 * 刷新收货地址显示内容
 */
function refreshConsigneeContent(id){
	//console.log("532 refreshConsigneeContent start id "+id);
	
	$.ajax({
        type : "POST",
        dataType : "json",
        url : base + "receiver/info",
        data : {"receiverId":id},
        cache : false,
        success : function(data) {
            if(data.status=="success"){
				var content = "<p>"+data.receiver.name+" &nbsp; "+data.receiver.mobile+" &nbsp;  &nbsp; "+
							"<br>"+data.receiver.areaName+" &nbsp;"+data.receiver.address+" &nbsp;"+data.receiver.zipCode+"</p>";
				$("#consignee-content").html(content);
				$("#order_receiverId").val(data.receiver.id);
				
				//console.log("547 refreshConsigneeContent start end");
				
            }else{
            	alert(data.message);
            }
        },
        error : function(XMLHttpResponse) {
        	alert("网络异常，请稍后重试！");
        }
    });
}

/*收货地址的处理 - end*/


/*支付方式、配送方式的处理 - start*/




/*支付方式、配送方式的处理 - end*/

