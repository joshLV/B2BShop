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
    if(num>10){
        layer.alert("抱歉，地址信息最多可创建10条。",{icon:2});
        return;
    }

    //$("#order_receiverId").val("");
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
    index=layer.open({
        type: 1,
        title:'新增收货地址',
        area:["700px","350px"],
        scrollbar:false,
        content: $('#popupdiv') //这里content是一个DOM
    });

    $("#consignee_name").next('span').hide();
    $("#consignee_address").next('span').hide();
    $("#area_div_error").hide();
    $("#call_div_error").hide();
    return;
}

/**
 * 保存收货地址（包含保存常用人收货地址，根据id区分）
 */
function save_Consignee() {
    $("#consignee_name").next('span').show();
    $("#consignee_address").next('span').show();
    $("#area_div_error").show();
    $("#call_div_error").show();

    var num =parseInt($("#addressNum_top").text())+1;
    //if (checkMaxConsigneeSize("save_Consignee")) {
    //	return;
    //}

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
        refreshConsigneeContent(id); //使用已有的收货地址
    }else{
        var checkConsignee = true;

        if (!check_Consignee("name_div")) { // 验证收货人信息是否正确
            checkConsignee = false;
        }

        if (!check_Consignee("area_div")) { // 验证地区是否正确
            checkConsignee = false;
        }

        if (!check_Consignee("address_div")) { // 验证收货人地址是否正确
            checkConsignee = false;
        }

        if (!check_Consignee("call_mobile_div")) { // 验证手机号码是否正确
            checkConsignee = false;
        }

        // 验证邮箱
        //if (!check_Consignee("email_div")) {
        //    checkConsignee = false;
        //}

        // 验证邮政编码是否正确
        if (!check_Consignee("zipCode_div")) {
            checkConsignee = false;
        }
        // 验证电话是否正确
        //if (!check_Consignee("call_phone_div")) {
        //    checkConsignee = false;
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
            //清除收货地址选中
            $("#consignee-list li").each(function(){
                $(this).removeClass("address_on")
            });
        }
        //console.log("166  --->actionUrl:"+actionUrl);
        var receiver_id=$("#consignee_form_id").val();
        var consignee_name = $("#consignee_name").val();
        var areaPath = $(".areaSelect").val();
        var areaId = areaPath.substring(areaPath.lastIndexOf(',')+1,areaPath.length);
        var consignee_address = $("#consignee_address").val();
        var consignee_mobile = $("#consignee_mobile").val();
        var consignee_phone = $("#consignee_phone").val();
        //var consignee_email = $("#consignee_email").val();
        var consignee_zipCode = $("#consignee_zipCode").val();
        var param={"name":consignee_name,"id":receiver_id,"areaId":areaId,"areaPath":areaPath,"address":consignee_address,"mobile":consignee_mobile,"phone":consignee_phone,"zipCode":consignee_zipCode};

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
                    if(id=="") {
                        $("#order_receiverId").val(receiver.id);
                    }
                    refreshConsigneeItem(receiver);
                    $isReceiverSubmit.val('');

                    reloadThisPage();
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
    layer.close(index);
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
                    $(this).removeClass("address_on")
                    $(".btn_set_common").text("设置默认地址");
                });


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
    var valueContent = null;        // 获取相关文本框内容

    if (divId == "name_div") { // 验证收货人名称
        valueContent = $("#consignee_name").val();
        if (isEmpty(valueContent)) {
            errorFlag = true;
            errorMessage = "请您填写收货人姓名";
        }
        if (valueContent.length > 4||valueContent.length <2||!isChinese(valueContent)) {
            errorFlag = true;
            errorMessage = "请输入2到4个中文字符!";
        }
        if (!is_forbid(valueContent)) {
            errorFlag = true;
            errorMessage = "收货人姓名中含有非法字符";
        }
    } else if (divId == "email_div") { // 验证邮箱格式
        valueContent = $("#consignee_email").val();
        if (!isEmpty(valueContent)) {
            if (!check_email(valueContent)) {
                errorFlag = true;
                errorMessage = "邮箱格式不正确";
            }
        } else {
            if (valueContent.length > 50) {
                errorFlag = true;
                errorMessage = "邮箱长度不能大于50位";
            }
        }
    } else if (divId == "address_div") { // 验证收货人地址
        valueContent = $("#consignee_address").val();
        divId = "address_div";
        if (isEmpty(valueContent)) {
            errorFlag = true;
            errorMessage = "请您填写收货人详细地址";
        }
        if (!is_forbid(valueContent)) {
            errorFlag = true;
            errorMessage = "收货人详细地址中含有非法字符";
        }
        /*if(!isChinese(valueContent)){
            errorFlag = true;
            errorMessage = "收货人详细地址必须为汉字";
        }*/
        if (valueContent.length < 5) {
            errorFlag = true;
            errorMessage = "收货人详细地址过短";
        }
        if (valueContent.length>60) {
            errorFlag = true;
            errorMessage = "收货人详细地址过长";
        }
    }else if (divId == "zipCode_div") { // 验证邮政编码
        valueContent = $("#consignee_zipCode").val();
        if (!isEmpty(valueContent)) {
            //errorFlag = true;
            //errorMessage = "请您填写邮政编码";
            if (valueContent.length>6) {
                errorFlag = true;
                errorMessage = "邮政编码过长";
            }else{
                if (!is_postcode(valueContent)) {
                    errorFlag = true;
                    errorMessage = "邮政编码格式不正确";
                }
            }
        }
    } else if (divId == "call_mobile_div") { // 验证手机号码
        valueContent = $("#consignee_mobile").val();
        var valueContent2 = $("#consignee_phone").val();
        divId = "call_div";
        if (isEmpty(valueContent) && isEmpty(valueContent2)) {
            errorFlag = true;
            errorMessage = "请您填写收货人手机号码或固定电话!";
        }else if(!isEmpty(valueContent)) {
            if (!checkPhone1(valueContent)) {
                errorFlag = true;
                errorMessage = "手机号码格式不正确";
            }
        }
        if (!errorFlag) {
            valueContent = $("#consignee_phone").val();
            if (!isEmpty(valueContent)) {
                if (!is_forbid(valueContent)) {
                    errorFlag = true;
                    errorMessage = "固定电话号码中含有非法字符";
                }
                if (!checkPhone(valueContent)) {
                    errorFlag = true;
                    errorMessage = "固定电话号码格式不正确";
                }
            }
        }
    } else if (divId == "call_phone_div") { // 验证电话号码
        valueContent = $("#consignee_phone").val();
        divId = "call_div";
        if (!isEmpty(valueContent)) {
            if (!is_forbid(valueContent)) {
                errorFlag = true;
                errorMessage = "固定电话号码中含有非法字符";
            }
            if (!checkPhone(valueContent)) {
                errorFlag = true;
                errorMessage = "固定电话号码格式不正确";
            }
        }
        if (true) {
            valueContent = $("#consignee_mobile").val();
            if (isEmpty(valueContent)) {
                errorFlag = true;
                errorMessage = "请您填写收货人手机号码";
            } else {
                if (!check_mobile(valueContent)) {
                    errorFlag = true;
                    errorMessage = "手机号码格式不正确";
                }
            }
        }
    } else if (divId == "area_div") { // 验证地区是否完整
        valueContent = $(".areaSelect").val();
        if (isEmpty(valueContent)) {
            errorFlag = true;
            errorMessage = "请您选择完整的地区信息";
        } else {
            if($(".lSelect").size()>valueContent.split(",").length){
                errorFlag = true;
                errorMessage = "请您选择完整的地区信息";
            }
        }
    }

    if (errorFlag) {
        $(".Validform_right").html("");
        $("#" + divId + "_error").html(errorMessage);
        $("#" + divId).addClass("message");
        return false;
    } else {
        //alert("dsadsasad");
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
//手机号码校验
function checkPhone1(mobile){
    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
    if(!myreg.test(mobile)) {
        return false;
    }else{
        return true;
    }
}
//判断是否为汉字
function isChinese(value) {
    var reg = /[^\u4E00-\u9FA5]+/g;
    if(reg.test(value)) {
        return false;
    }
    return true;
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
function show_ConsigneeDetail(id,e) {
    $("#consignee_name").next('span').hide();
    $("#consignee_address").next('span').hide();
    $("#area_div_error").hide();
    $("#call_div_error").hide();

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
            //$("#consignee_email").val(data.receiver.email);
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
    e.stopPropagation();//阻止事件传播，主要是解决点击编辑页面的时候页面重新刷新，弹出编辑层消失
}



/**
 * 删除常用收货地址
 */
function delReceiver(id){
    var num =parseInt($("#addressNum_top").text())+1;
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
            alert("网络异常，请稍后重试！");
        }
    });
    //}
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


    if($("#consignee_radio_"+receiver.id)[0]){
        //常用收获地址中存在,刷新
        var label = "<p class=\"using_add\"> 默认地址 </p>"+
            "<div class=\"vcard\">"+
            "<p> <strong>"+ receiver.name+ "</strong>&nbsp;&nbsp;&nbsp;收 </p>"+
            "<p class=\"adr\"> <span class=\"street-address\"> <strong class=\"locality\">"+ receiver.areaName+ "</strong> <span class=\"street-address\">"+receiver.address+"</span> </p>"+
            "<p class=\"tel\"> "+ receiver.mobile+ "&nbsp;&nbsp;"+receiver.phone+" </p>"+
                /*"<p > "+ receiver.email+ "</p>"+*/
            "<p >"+ receiver.zipCode+ " </p></div>"+
            "<div class=\"edit_box clearfix\">"+
            "<button class=\"del_adr\" title=\"删除地址\" onClick=\"showTips('"+receiver.id+"');\"> 删除 </button>"+
            "<a class=\"aBlu btn_edit\" href=\"javascript:void(0)\" id=\"show\" onClick=\"show_ConsigneeDetail('"+receiver.id+"',event)\">编辑</a>"+
            "<a class=\"btn_set_common\" href=\"javascript:void(0)\" onclick=\"setDefault('"+receiver.id+"')\">设为默认地址</a> </div>"+
            "<div class=\"tips_del\" id=\"tips_"+receiver.id+"\">"+
            "<p class=\"txt\"> 确认删除该收货地址吗？ </p>"+
            "<div class=\"btn_box\">"+
            "<button onClick=\"delReceiver('"+receiver.id+"')\" class=\"btn_sure\"> <span>确认</span> </button>"+
            "<button class=\"btn_cancle\" onClick=\"hideTips('"+receiver.id+"');\"> <span>取消</span> </button>"+
            "</div></div>";
        $("#consignee_radio_"+receiver.id).html(label);
    }else{
        //常用收获地址中不存在,添加
        var $consigneeList=$("#consignee-list");
        var index=$("#consignee-list .item").size()-1;
        var itemHtml = "<li class=\"address_on\" id = \"consignee_radio_"+receiver.id+"\"  isDefault='false'>"+
            "<p class=\"using_add\"> 默认地址 </p>"+
            "<div class=\"vcard\" onclick=\"chooseCurrAddress('"+receiver.id+"')\">"+
            "<p> <strong>"+ receiver.name+ " </strong>&nbsp;&nbsp;&nbsp;收 </p>"+
            "<p class=\"adr\"> <span title=\"陕西 西安市\" class=\"street-address\"> <strong class=\"locality\">"+ receiver.areaName+ "</strong> <span title=\"西安外事学院\" class=\"street-address\">"+receiver.address+"</span> </p>"+
            "<p class=\"tel\"> "+ receiver.mobile+"&nbsp;&nbsp;"+receiver.phone+ " </p>"+
                /*"<p > "+ receiver.email+ "</p>"+*/
            "<p >"+ receiver.zipCode+ " </p></div>"+
            "<div class=\"edit_box clearfix\">"+
            "<button class=\"del_adr\" title=\"删除地址\" onClick=\"showTips('"+receiver.id+"');\"> 删除 </button>"+
            "<a class=\"aBlu btn_edit\" href=\"javascript:void(0)\" id=\"show\" onClick=\"show_ConsigneeDetail('"+receiver.id+"', event)\">编辑</a>"+
            "<a class=\"btn_set_common\" href=\"javascript:void(0)\" onclick=\"setDefault('"+receiver.id+"')\">设为默认地址</a></div>"+
            "<div class=\"tips_del\" id=\"tips_"+receiver.id+"\">"+
            "<p class=\"txt\"> 确认删除该收货地址吗？ </p>"+
            "<div class=\"btn_box\">"+
            "<button onClick=\"delReceiver('"+receiver.id+"')\" class=\"btn_sure\"> <span>确认</span> </button>"+
            "<button class=\"btn_cancle\" onClick=\"hideTips('"+receiver.id+"');\"> <span>取消</span> </button>"+
            "</div></div></li>";
        $consigneeList.children("li:last").before(itemHtml);

        //$("#use-new-address").removeClass("item-selected");
        $("#addressNum_top").val(parseInt($("#addressNum_top").val())+1);
        $("#consignee-list").show();

        $("#addresshtml").addClass("current");
        $(".mod_address_book .adr_list li").hover(function() {
                if ($(this) !== $(".mod_address_book .adr_list li:last-child")) {
                    $(this).addClass("hover_li");
                    if ($(this).find(".using_add").length > 0 && $(this).find(".using_add").is(":visible")) {
                        $(this).find(".edit_box a").eq(1).hide();
                    }
                }
            },
            function() {
                if( $(this).attr("isDefault") == "false" ){
                    $(this).removeClass("hover_li");
                }
            });
    }


}

function chooseCurrAddress(id){
    if ($("#consignee_radio_"+id).attr("isdefault") == "true") {
        return;
    }
    $("#order_receiverId").val(id);
    reloadThisPage();
}

function reloadThisPage(){
    $("#consignee-list li").each(function(){
        $(this).removeClass("address_on")
    });
    var receiverId = $("#order_receiverId").val();
    $("#consignee_radio_"+receiverId).addClass("address_on");

    var order_deliveryTimeName = $("#order_deliveryTimeName").val();
    var paymentMethodId=$("#order_paymentMethodId").val();
    var deliveryTimeId=$("#order_deliveryTime").val();

    var paymentMethodLabel=$("#pay-method-label-"+paymentMethodId).html();
    $(".payment-selected").html(paymentMethodLabel);

    var deliveryMethodId=$("#order_deliveryMethodId").val();
    var deliveryMethodLabel=$("#delivery-method-label-"+deliveryMethodId).html();
    $(".delivery-selected").html(deliveryMethodLabel);

    $("#step-2").removeClass("step-current");
    $("#editPayAndShip").show();
    $("#savePayAndShipTitleMinDiv").hide();
    $("#payAndShip-content").show();
    $("#payAndShip-edit-div").hide();

    var invoiceTitle = $("#invoiceTitle").val();
    var invoiceContent = $("#invoiceContent").val();
    var deliveryId = $("#order_deliveryMethodId").val();
    var isMemberPrice = $("#isMemberPrice").val();
    var hasInsuranceFee = $("#hasInsuranceFee").val();

    //直接下订单与采购单商品下订单 标识，  1：采购单商品下单
    var createOrderType = $("#createOrderType").val();

    /*window.location.href = base + "member/reloadOrderCheck?o="+$("#order_cartItemIds").val()+"&deliveryMethodId="+deliveryId+"&paymentMethodId="
        +paymentMethodId+"&deliveryTimeId="+deliveryTimeId+"&order_deliveryTimeName="+order_deliveryTimeName+"&receiverId="+receiverId+"&invoiceContent="+invoiceContent+"&invoiceTitle="+invoiceTitle+"&createOrderType="+createOrderType+"&isMemeberPrice="+isMemeberPrice+"&hasInsuranceFee="+hasInsuranceFee;
*/
    installReloadForm($("#order_cartItemIds").val(),deliveryMethodId,paymentMethodId,deliveryTimeId,order_deliveryTimeName,receiverId,invoiceContent,invoiceTitle,createOrderType,isMemberPrice,hasInsuranceFee);
    $("#reloadForm").submit();
}
    function installReloadForm(o,deliveryMethodId,paymentMethodId,deliveryTimeId,order_deliveryTimeName,receiverId,invoiceContent,invoiceTitle,createOrderType,isMemberPrice,hasInsuranceFee){
        var html = '';
        html += '<input type="hidden" name="o" id="rf_o" value="' + o + '" >';
        html += '<input type="hidden" name="deliveryMethodId" id="rf_deliveryMethodId" value="' + deliveryMethodId + '" >';
        html += '<input type="hidden" name="paymentMethodId" id="rf_paymentMethodId" value="' + paymentMethodId + '" >';
        html += '<input type="hidden" name="deliveryTimeId" id="rf_deliveryTimeId" value="' + deliveryTimeId + '" >';
        html += '<input type="hidden" name="order_deliveryTimeName" id="rf_order_deliveryTimeName" value="' + order_deliveryTimeName + '" >';
        html += '<input type="hidden" name="receiverId" id="rf_receiverId" value="' + receiverId + '" >';
        html += '<input type="hidden" name="invoiceContent" id="rf_invoiceContent" value="' + invoiceContent + '" >';
        html += '<input type="hidden" name="invoiceTitle" id="rf_invoiceTitle" value="' + invoiceTitle + '" >';
        html += '<input type="hidden" name="createOrderType" id="rf_createOrderType" value="' + createOrderType + '" >';
        html += '<input type="hidden" name="isMemberPrice" id="rf_isMemberPrice" value="' + isMemberPrice + '" >';
        html += '<input type="hidden" name="hasInsuranceFee" id="rf_hasInsuranceFee" value="' + hasInsuranceFee + '" >';
        $("#reloadForm").html( html );

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

