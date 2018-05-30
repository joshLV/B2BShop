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
	$(".Validform_checktip").html("");
	$(".Validform_checktip").removeClass("Validform_right");
	//$("#name_div").removeClass("message");
	//$("#area_div").removeClass("message");
	//$("#address_div").removeClass("message");
	//$("#call_div").removeClass("message");
	//$("#email_div").removeClass("message");
	//$("#name_div_error").html("");
	//$("#area_div_error").html("");
	//$("#address_div_error").html("");
	//$("#call_div_error").html("");
	//$("#email_div_error").html("");
}

/**
 * 使用新收货人地址
 */
function use_NewConsignee() {
    var num =parseInt($("#addressNum_top").val())+1;
    if(num>6){
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
	//show('popupdiv');
	index=layer.open({
		type: 1,
		title:'新增收货地址',
		area:["700px","372px"],
		scrollbar:false,
		content: $('#popupdiv') //这里content是一个DOM
	});

	$("#consignee_name").removeClass('Validform_error');
	$("#consignee_name").next('span').hide();
	$("#consignee_address").next('span').hide();
	$("#consignee_address").removeClass('Validform_error');
	$("#area_div_error").hide();
	$("#call_div_error").hide();
	$("#zipCode_div_error").hide();
	return;
}

/**
 * 保存收货地址（包含保存常用人收货地址，根据id区分）
 */
function save_Consignee() {
	//if (checkMaxConsigneeSize("save_Consignee")) {
	//	return;
	//}
	$("#consignee_name").next('span').show();
	$("#consignee_address").next('span').show();
	$("#area_div_error").show();
	$("#call_div_error").show();
	$("#zipCode_div_error").show();
	
	var $isReceiverSubmit = $("#isReceiverSubmit");
	if($isReceiverSubmit.val()=='true'){
		alert("正在提交信息，请勿重复提交！");
		return;
	}
	
	var isHidden = $("#popupdiv").is(":hidden");// 是否隐藏
	var id = $("#consignee_form_id").val();// 获取收货人id
	if(id==undefined){
		alert("请选择收货人地址!");
		return;
	}

	$isReceiverSubmit.val('true');
	if(id!="" && isHidden){
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
		// 验证手机号码是否正确
		if (!check_Consignee("call_mobile_div")) {
			checkConsignee = false;
		}
		// 验证邮箱
		if (!check_Consignee("email_div")) {
			checkConsignee = false;
		}
		// 验证邮政编码是否正确
		if (!check_Consignee("zipCode_div")) {
			checkConsignee = false;
		}

		// 验证电话是否正确
		//if (!check_Consignee("call_phone_div")) {
		//	checkConsignee = false;
		//}
		//// 验证邮箱是否正确
		//if (!check_Consignee("email_div")) {
		//	checkConsignee = false;
		//}
		if (!checkConsignee) {
			$isReceiverSubmit.val('');
			return;
		}
		//$("#saveConsigneeTitleDiv").html("&nbsp;&nbsp;正在提交信息&nbsp;&nbsp;");
		
		var actionUrl = base+"receiver/update";
		if(id!="" && !isHidden ){
			actionUrl = base+"receiver/update";
		}
		if(id==""){
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
					//refreshConsigneeContent(receiver.id);
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
	//closeDiv('popupdiv');
	layer.close(index);
	//$("#saveConsigneeTitleDiv").html("保存收货人信息");
	//$("#consignee-form").hide();
	
	//save_Module("consignee");
	
	//$("#editConsignee").show();
	//$("#saveConsigneeTitleMinDiv").hide();
	//$("#consignee-content").show();
	//$("#consignee-edit-div").hide();
	
	$isReceiverSubmit.val('false');
}

/**
 * 设置默认收货地址
 */

function setDefault(id){
	$.ajax( {
		type : "POST",
		dataType : "json",
		url : base+"receiver/setDefault",
		data : {"isDefault":1,"receiverId":id},
		cache : false,
		async : false,//设置同步
		success : function(data) {
			if(data.status=="success"){
				var receiver=data.receiver;
				$("#consignee-list li").each(function(){
					$(this).removeClass("address_on");
					$(".btn_set_common").text("设置默认地址");
				});
				/*$("#addrDefaultTxt").attr("style", "display: block;");
				$("#addrSetTxt").attr("style", "display: none;");*/

				//清除原默认地址的样式
				$("#consignee-list").find("li").each(function(){
					$(this).attr("isDefault","false");
					$(this).removeClass("hover_li");
				});


				$("#consignee_radio_"+id).addClass("address_on hover_li");
				$("#consignee_radio_"+id).attr("isDefault","true");
				$("#order_receiverId").val(receiver.id);

				$("#consignee_radio_"+id+" .btn_set_common").text("默认地址");
			}else{
				alert(data.message);
			}
		},
		error : function(XMLHttpResponse) {
			alert("网络异常，请稍后重试！");
		}
	});
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
			//errorMessage = "请您填写收货人姓名";
		}
		if (value.length < 2) {
			errorFlag = true;
			//errorMessage = "收货人姓名不能小于2位";
		}
		if (value.length > 20) {
			errorFlag = true;
			//errorMessage = "收货人姓名不能大于20位";
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
		if (!isEmpty(value)) {
			//errorFlag = true;
			//errorMessage = "请您填写邮政编码";
			if (value.length>6) {
				errorFlag = true;
				errorMessage = "邮政编码过长";
			}else{
				if (!is_postcode(value)) {
					errorFlag = true;
					errorMessage = "邮政编码中含有非法字符";
				}
			}


			//}else{
			//    alert('y2');
			//    if (!is_postcode(value)) {
			//        alert('y3');
			//        errorFlag = true;
			//        errorMessage = "邮政编码中含有非法字符";
			//    }
			//    if (value.length>7) {
			//        alert('y4');
			//        errorFlag = true;
			//        errorMessage = "邮政编码过长";
			//    }
		}
	}
	// 验证手机号码
	else if (divId == "call_mobile_div") {
		value = $("#consignee_mobile").val();
		var value2 = $("#consignee_phone").val();
		divId = "call_div";
		if (isEmpty(value) && isEmpty(value2)) {
			errorFlag = true;
			errorMessage = "请您填写收货人手机号码或固定电话!";
		}else if(!isEmpty(value)) {
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

				if(value.length > 12){
					errorFlag = true;
					errorMessage = "固定电话号码长度错误";
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
	$("#consignee_name").removeClass('Validform_error');
	$("#consignee_name").next('span').hide();
	$("#consignee_address").next('span').hide();
	$("#consignee_address").removeClass('Validform_error');
	$("#area_div_error").hide();
	$("#call_div_error").hide();
	$("#zipCode_div_error").hide();
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
	//show('popupdiv');
	index=layer.open({
		type: 1,
		title:'编辑收货地址',
		area:["700px","372px"],
		scrollbar:false,
		content: $('#popupdiv') //这里content是一个DOM
	});
	// 隐藏20个数量的限制的提示
	//$("#addNumLimitNote").css("display", "none");

	$("#consignee-form").show();
	// 设置收货地址详细值
	$("#consignee_radio_" + id).attr("checked", "checked");
		
}

/**
 * 弹出编辑收货地址弹出窗
 */
function show(popupdiv)
{
	var Idiv=document.getElementById(popupdiv);
	Idiv.style.display="block";
	Idiv.style.left=(document.documentElement.clientWidth-Idiv.clientWidth)/2+document.documentElement.scrollLeft+"px";
	Idiv.style.top=(document.documentElement.clientHeight-Idiv.clientHeight)/2+document.documentElement.scrollTop-50+"px";
	var procbg = document.createElement("div");
	procbg.setAttribute("id","mybg");
	procbg.style.background = "#000000";
	procbg.style.width = "100%";
	procbg.style.height = "100%";
	procbg.style.position = "fixed";
	procbg.style.top = "0";
	procbg.style.left = "0";
	procbg.style.zIndex = "500";
	procbg.style.opacity = "0.7";
	procbg.style.filter = "Alpha(opacity=70)";

	document.body.appendChild(procbg);
	document.body.style.overflow = "hidden";
	var posX;
	var posY;
	Idiv.onmousedown=function(e)
	{
		if(!e) e = window.event;
		posX = e.clientX - parseInt(Idiv.style.left);
		posY = e.clientY - parseInt(Idiv.style.top);
		document.onmousemove = mousemove;
	}
	document.onmouseup = function()
	{
		document.onmousemove = null;
	}
	function mousemove(ev)
	{
		if(ev==null) ev = window.event;
		Idiv.style.left = (ev.clientX - posX) + "px";
		Idiv.style.top = (ev.clientY - posY) + "px";
	}
}

/**
 * 关闭编辑收货地址弹出窗
 */
function closeDiv(popupdiv)
{
	var Idiv=document.getElementById(popupdiv);
	Idiv.style.display="none";
	document.body.style.overflow = "auto";
	var body = document.getElementsByTagName("body");
	var mybg = document.getElementById("mybg");
	body[0].removeChild(mybg);
	$("#consignee_form_id").val('');
	$("#order_receiverId").val($("#order_receiverId_back").val());
}

/**
 * 删除常用收货地址
 */
function delReceiver(id){
	//if(confirm("确定要删除吗？")){
	    $.ajax( {
	        type : "POST",
	        dataType : "json",
	        url : base + "receiver/delete",
	        data : {"receiverId":id},
	        cache : false,
	        success : function(data) {
	            if(data.status=="success"){
					//delConsigneeItem(id);
					$("#addressNum_top").val(parseInt($("#addressNum_top").val())-1);
					$("#consignee_radio_"+id).remove();//页面上删除常用收货地址Item
	            }
	        },
	        error : function(XMLHttpResponse) {
	          <td class="span2">
                                                    <input class="span2"  name="batchPrice" type="text"   step="0.01" min="0" max="999999999" value="$!goodsPrice.batchPrice" $!shreadonly   placeholder="区间价格" title="区间价格" />
                                                </td>
                                                <td class="span2">
                                                    <input class="span2"  name="batchOrder" type="text"   step="1" min="0" max="999999999" value="$!goodsPrice.batchOrder" style="width: 70px;" $!shreadonly   placeholder="顺序" title="顺序" />
                                                </td>
                                                #if($!PAGE_TYPE!='DETAIL')
                                                    <td class="span1">
                                                        <input class="btn btn-mini btn-danger" style="width: 30px;" value="删除" onclick="delRow('$!goodsPrice.id')"/>
                                                    </td>
                                                #end
                                            </tr>
                                        #end
                                    </table>
                                </div>
                                <!--增加区间价--------------------------------------------------------------------end-->
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="fullName" class="span2">商品全称:</label>
                                <input class="span8" id="fullName" name="fullName" readonly type="text" data-max="256" value="$!pd.fullName" required data-min="1" data-max="256" placeholder="这里输入全名称" title="全名称" />
                            </td>
                            <td>
                                <label for="isPost" class="span2">是否包邮:#if($!PAGE_TYPE!='DETAIL')<span style="color: red;font-weight: bold; font-size: 15px;">*</span>#end</label>
                                <input id="isPost" name="isPost" type="radio"  value="1" #if("$!shreadonly" != "") disabled #end #if($!pd.isPost=='1')checked="true"#end />是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="isPost" name="isPost" type="radio"  value="0" #if("$!shreadonly" != "") disabled #end #if("$!pd.isPost"==""||$!pd.isPost=='0')checked="true"#end />否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>


                        ##                        <td>
                        ##                            <label for="indexOrder" class="span2">首页排序:</label>
                        ##                            <input class="span4" id="indexOrder" name="indexOrder" $!shreadonly type="number" #if($!pd.isIndex != 1) disabled #end  value="$!pd.indexOrder" placeholder="这里输入首页排序" title="首页排序" />&nbsp;&nbsp;
                        ##                            <input id="isIndex" name="isIndex" type="checkbox" $!shreadonly #if($!pd.isIndex == 1) checked   value="1" #else value="0"  #end placeholder="选择是否在首页显示" title="选择是否在首页显示"/>&nbsp;&nbsp;首页展示
                        ##                        </td>

                        ##商家信息  end
                        ## </td>
                        </tr>
                    ##                    #if($!whichSys=='ECM')
                        #if($!PAGE_TYPE!='ADD')
                            <tr>
                                <td colspan="2" id="goodsTag">
                                    <label for="tag" class="span2">商城标签:</label>
                                    <input id="goodTagsvalue" name="goodTagsvalue" type="hidden">
                                #*#foreach($!tag in $!tagEcmList)
                                    <input id="$!tag.id" name="$!tag.name" type="checkbox" disabled
                                        #foreach($!checktag in $!checkedtagList)
                                            #if($!tag.id==$!checktag.tagId)
                                           checked
                                            #end
                                        #end
                                          title="选择$!tag.name" value="$!tag.id" />&nbsp;&nbsp;$!tag.name &nbsp;&nbsp;
                                #end*#
                                    #foreach($!checktag in $!checkedEcmtagList)
                                        $!checktag.name &nbsp;&nbsp;&nbsp;&nbsp;
                                    #end
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" id="goodsTag">
                                    <label for="tag" class="span2">商家标签:</label>
                                    <input id="goodTagsvalue" name="goodTagsvalue" type="hidden">
                                #*#foreach($!tag in $!tagMcmList)
                                    <input id="$!tag.id" name="$!tag.name" type="checkbox" disabled
                                        #foreach($!checktag in $!checkedtagList)
                                            #if($!tag.id==$!checktag.tagId)
                                           checked
                                            #end
                                        #end
                                           title="选择$!tag.name" value="$!tag.id" />&nbsp;&nbsp;$!tag.name &nbsp;&nbsp;
                                #end*#
                                    #foreach($!checktag in $!checkedMcmtagList)
                                        $!checktag.name &nbsp;&nbsp;&nbsp;&nbsp;
                                    #end
                                </td>
                            </tr>
                        #end
                        <tr>
                            <td>
                                <label for="keywords" class="span2">搜索关键字:</label>
                                <input class="span8" id="keywords" name="keywords" $!shreadonly data-max="256" type="text" value="$!pd.keywords" placeholder="这里输入搜索关键字" title="搜索关键字" />
                            </td>
                            <td>
                                <label for="volume" class="span2">商品体积:<span style="color: red;font-weight: bold; font-size: 15px;">*</span></label>
                                <input class="span4" id="volume" name="volume" $!shreadonly  type="text" value="$!pd.volume" placeholder="这里输入商品体积" title="商品体积" />(单位:m³)
                            </td>

                        </tr>
                    </table>
                </div>
            </section>
        </div>


    ##将涉及到文本框类型为 number的改