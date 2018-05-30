/*function getRootPath(){
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPaht=curWwwPath.substring(0,pos);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}
var base=getRootPath()+'/';*/

function checkConsigneeName(){
    var errorFlag = false;
    var errorMessage ="";
    var value = $("#consigneeName").val();
    if (isEmpty(value)) {
        errorFlag = true;
        errorMessage = "请您填写收货人姓名";
    }else{
        if (value.length > 25) {
            errorFlag = true;
            errorMessage = "收货人姓名不能大于25位";
        }
        if (!is_forbid(value)) {
            errorFlag = true;
            errorMessage = "收货人姓名中含有非法字符";
        }
    }
    if(errorFlag){
        $("#consigneeNameNote").text(errorMessage);
        $("#consigneeNameNote").show();
    }else{
        $("#consigneeNameNote").hide();
    }
    return errorFlag;
}
/**
 * 校验邮箱
 * @return
 */
function checkEmail(){
    var errorFlag = false;
    var errorMessage ="";
    var value = $("#consigneeEmail").val();
    if(value){
        var myReg=/(^\s*)\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*(\s*$)/;
        if(!myReg.test(value)){
            errorFlag=true;
            errorMessage = "邮箱格式不正确";
        }
    }else{
        if (value.length > 50) {
            errorFlag = true;
            errorMessage = "邮箱长度不能大于50位";
        }
    }
    if(errorFlag){
        $("#emailNote").text(errorMessage);
        $("#emailNote").show();
    }else{
        $("#emailNote").hide();
    }
    return errorFlag;
}
function checkConsigneeAddress(){
    var errorFlag = false;
    var errorMessage = "";
    var value = $("#consigneeAddress").val();
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
    if(errorFlag){
        $("#consigneeAddressNote").text(errorMessage);
        $("#consigneeAddressNote").show();
    }else{
        $("#consigneeAddressNote").hide();
    }
    return errorFlag;
}
function checkMobile(){
    var errorFlag = false;
    var errorMessage ="";
    var value = $("#consigneeMobile").val();
    if (isEmpty(value)) {
        errorFlag = true;
        errorMessage = "请您填写收货人手机号码";
    } else {
        var regu = /^\d{11}$/;
        var re = new RegExp(regu);
        if(!re.test(value)){
            errorFlag = true;
            errorMessage = "手机号码格式不正确";
        }
    }
    if (!errorFlag) {
        value = $("#consigneePhone").val();
        if (!isEmpty(value)) {
            if (!is_forbid(value)) {
                errorFlag = true;
                errorMessage = "固定电话号码中含有非法字符";
            }
            if(value.length > 20){
                errorFlag = true;
                errorMessage = "固定电话号码过长";
            }
            var patternStr = "(0123456789-)";
            var  strlength=value.length;
            for(var i=0;i<strlength;i++){
                var tempchar=value.substring(i,i+1);
                if(patternStr.indexOf(tempchar)<0){
                    errorFlag = true;
                    errorMessage = "固定电话号码格式不正确";
                    break;
                }
            }
        }
    }
    if(errorFlag){
        $("#consigneeMobileNote").text(errorMessage);
        $("#consigneeMobileNote").show();
    }else{
        $("#consigneeMobileNote").hide();
    }
    return errorFlag;
}

function checkArea(){
    var errorFlag = false;
    var errorMessage="";
    var provinceId = $("#provinceDiv").find("option:selected").val();
    var cityId = $("#cityDiv").find("option:selected").val();
    var countyId = $("#countyDiv").find("option:selected").val();
    var townId = $("#townDiv").find("option:selected").val();
    // 验证地区是否正确
  //  if (isEmpty(provinceId) || isEmpty(cityId) || isEmpty(countyId) || provinceId==0 || cityId==0 || countyId==0
  //      || (!isEmpty($("#townDiv").html()) &&!$("#townDiv").is(":hidden") && (isEmpty(townId) || townId==0)))
    if (isEmpty(provinceId) || isEmpty(cityId) || provinceId==0 || cityId==0 ) {
        errorFlag = true;
        errorMessage = "请您填写完整的地区信息";
    }
    if(errorFlag){
        $("#areaNote").text(errorMessage);
        $("#areaNote").show();
    }else{
        $("#areaNote").hide();
    }
    return errorFlag;
}
function checkConsigneeAlias(){
    var errorFlag = false;
    var errorMessage="";
    var value = $("#consigneeAlias").val();
    var pattern =/^[1-9][0-9]{5}$/;
    if(value) {
        if (!pattern.test(value)) {
            errorFlag = true;
            errorMessage = "邮政编码格式不正确！";
        }
    }
    if(errorFlag){
        $("#consigneeAliasNote").text(errorMessage);
        $("#consigneeAliasNote").show();
    }else{
        $("#consigneeAliasNote").hide();
    }
    return errorFlag;
}
/**
 * 检查是否含有非法字符
 * @param temp_str
 * @returns {Boolean}
 */
function is_forbid(temp_str){
    temp_str=temp_str.replace(/(^\s*)|(\s*$)/g, "");
    temp_str = temp_str.replace('*',"@");
    temp_str = temp_str.replace('--',"@");
    temp_str = temp_str.replace('/',"@");
    temp_str = temp_str.replace('+',"@");
    temp_str = temp_str.replace('\'',"@");
    temp_str = temp_str.replace('\\',"@");
    temp_str = temp_str.replace('$',"@");
    temp_str = temp_str.replace('^',"@");
    temp_str = temp_str.replace('.',"@");
    temp_str = temp_str.replace(';',"@");
    temp_str = temp_str.replace('<',"@");
    temp_str = temp_str.replace('>',"@");
    temp_str = temp_str.replace('"',"@");
    temp_str = temp_str.replace('=',"@");
    temp_str = temp_str.replace('{',"@");
    temp_str = temp_str.replace('}',"@");
    var forbid_str=new String('@,%,~,&');
    var forbid_array=new Array();
    forbid_array=forbid_str.split(',');
    for(i=0;i<forbid_array.length;i++){
        if(temp_str.search(new RegExp(forbid_array[i])) != -1)
            return false;
    }
    return true;
}

/**
 * 判断是否是空
 * @param value
 */
function isEmpty(value){
    if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
        return true;
    }
    else{
        value = (value+"").replace(/\s/g,'');
        if(value == ""){
            return true;
        }
        return false;
    }
}
function addAddress(){
    if(	checkConsigneeName() || checkConsigneeAddress()|| 	checkConsigneeAlias() || 	checkMobile()){
        return;
    }
    var consigneeName=$("#consigneeName").val();
    var consigneeAddress = $("#consigneeAddress").val();
    var mobile = $("#consigneeMobile").val();
    var phone =  $("#consigneePhone").val();
    var areaPath = $(".areaSelect").val();
    var areaId = areaPath.substring(areaPath.lastIndexOf(',')+1,areaPath.length);
    var receiverId= $("#receiverId").val();
    var consigneeAddressAlias = $("#consigneeAlias").val();
    var param={"name":consigneeName,"id":receiverId,"areaId":areaId,"areaPath":areaPath,"address":consigneeAddress,"mobile":mobile,"phone":phone,"zipCode":consigneeAddressAlias};
    var actionUrl="";
    if(""!=receiverId){
        actionUrl = base+"receiver/update";
    }else{
        actionUrl = base+"receiver/save";
    }
    jQuery.ajax( {
        type : "POST",
        dataType : "json",
        url : actionUrl,
        data :param,
        cache : false,
        success : function() {
            $("#LoginBox").fadeOut("fast");
            $("#mask").css({ display: 'none' });
            window.location.href=base+"member/receiver";
        },
        error : function(XMLHttpResponse) {
        }
    });

}
function alertDelAddressDiag(addressId){
    if(confirm("确定要删除吗？")){
        delAddress(addressId);
    }else
    {
        return false;
    }
}
function delAddress(addressId){
    var actionUrl =base + "receiver/delete";
    jQuery.ajax( {
        type : "POST",
        dataType : "json",
        url : actionUrl,
        data : "receiverId=" + addressId,
        cache : false,
        success : function(dataResult) {
            if(dataResult.status=="success"){
                //隐藏删除的地址
                $("#addresssDiv-"+addressId).hide();
                //修改页面的显示数量
                var addressNum = parseInt($("#addressNum_top").text());
                if(addressNum>0){
                    addressNum=addressNum-1;
                }
                $("#addressNum_top").text(addressNum);
                $("#addressNum_botton").text(addressNum);
                //如果是最后一个地址，把最下面的添加新地址删除
                if(addressNum==0){
                    $("#addAddressDiv_bottom").hide();
                }
            }
        },
        error : function(XMLHttpResponse) {
        }
    });
}
function alertUpdateAddressDiag(addressId) {
    var actionUrl =base + "receiver/edit";
    jQuery.ajax( {
        type : "POST",
        dataType : "json",
        url : actionUrl,
        data : {"receiverId":addressId},
        cache : false,
        success : function(dataResult) {
                $("#consigneeName").attr("value",dataResult.receiver.name);
                $("#consigneeAddress").attr("value",dataResult.receiver.address);
                $("#consigneeMobile").attr("value",dataResult.receiver.mobile);
                $("#consigneePhone").attr("value",dataResult.receiver.phone);
                $("#consigneeAlias").attr("value",dataResult.receiver.zipCode);
                $("#receiverId").attr("value",dataResult.receiver.id);
                $(".areaSelect").val(dataResult.receiver.areaPath);


                alertAddAddressDiag();
        },
        error : function(XMLHttpResponse) {
        }
    });
}
/**
 * 删除收货人验证提示信息
 */
function removeConsingeeMessage() {
    $("#consigneeName").val("");
    $("#consigneeNameNote").val("");
}
