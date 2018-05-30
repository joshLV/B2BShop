/*æ”¶è´§åœ°å€çš„å¤„ç† - start*/

/**
 * é€‰æ‹©å¸¸ç”¨æ”¶è´§äººåœ°å€
 */
var index;
function chose_Consignee(id) {
    $("#consignee-form").hide();
    $("#use-new-address").attr("class", "item");
    $("#consignee_radio_" + id).attr("checked", "checked");
    set_CurrentConsignee(id);
}

/**
 * è®¾ç½®å½“å‰å¸¸ç”¨æ”¶è´§åœ°å€å˜é«˜äº®ï¼Œå…¶ä»–ä¸äº®
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
                if (parseInt(indexNum) > 20) {//ç³»ç»Ÿå…è®¸çš„æ”¶è´§äººä¸ªæ•°5
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
 * åˆ é™¤æ”¶è´§äººéªŒè¯æç¤ºä¿¡æ¯
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
 * ä½¿ç”¨æ–°æ”¶è´§äººåœ°å€
 */
function use_NewConsignee() {
    var num =parseInt($("#addressNum_top").val())+1;
    if(num>10){
        layer.alert("æŠ±æ­‰ï¼Œåœ°å€ä¿¡æ¯æœ€å¤šå¯åˆ›å»º10æ¡ã€‚",{icon:2});
        return;
    }

    //$("#order_receiverId").val("");
    removeConsingeeMessage();
    // åœ°åŒºé€‰æ‹©èœå•
    $(".lSelect").remove();//ç§»é™¤ä¹‹å‰ç”Ÿæˆçš„
    $(".areaSelect").val("");
    $(".areaSelect").lSelect({
        url: base+"area/ajaxChildren"// Jsonæ•°æ®è·å–url
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

    // #é«˜äº®é€‰ä¸­
    $("#use-new-address").attr("class", "item item-selected");
    var consigneeList = $("#consignee-list");
    consigneeList.find(".item").each(function() {
        var indexNum = $(this).attr("index").split("_")[2];
        if (parseInt(indexNum) > 20) {//ç³»ç»Ÿå…è®¸çš„æ”¶è´§äººä¸ªæ•°5
            $(this).attr("class", "item item-fore hide");
        } else {
            $(this).attr("class", "item");
        }
    });
    index=layer.open({
        type: 1,
        title:'æ–°å¢æ”¶è´§åœ°å€',
        area:["700px","350px"],
        scrollbar:false,
        content: $('#popupdiv') //è¿™é‡Œcontentæ˜¯ä¸€ä¸ªDOM
    });

    $("#consignee_name").next('span').hide();
    $("#consignee_address").next('span').hide();
    $("#area_div_error").hide();
    $("#call_div_error").hide();
    return;
}

/**
 * ä¿å­˜æ”¶è´§åœ°å€ï¼ˆåŒ…å«ä¿å­˜å¸¸ç”¨äººæ”¶è´§åœ°å€ï¼Œæ ¹æ®idåŒºåˆ†ï¼‰
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
        alert("æ­£åœ¨æäº¤ä¿¡æ¯ï¼Œè¯·å‹¿é‡å¤æäº¤ï¼");
        return;
    }

    var isHidden = $("#popupdiv").is(":hidden");// æ˜¯å¦éšè—
    var id = $("#consignee_form_id").val();// è·å–æ”¶è´§äººid
    if(id==undefined){
        alert("è¯·é€‰æ‹©æ”¶è´§äººåœ°å€!");
        return;
    }

    $isReceiverSubmit.val('true');
    if(id!="" && isHidden){
        refreshConsigneeContent(id); //ä½¿ç”¨å·²æœ‰çš„æ”¶è´§åœ°å€
    }else{
        var checkConsignee = true;

        if (!check_Consignee("name_div")) { // éªŒè¯æ”¶è´§äººä¿¡æ¯æ˜¯å¦æ­£ç¡®
            checkConsignee = false;
        }

        if (!check_Consignee("area_div")) { // éªŒè¯åœ°åŒºæ˜¯å¦æ­£ç¡®
            checkConsignee = false;
        }

        if (!check_Consignee("address_div")) { // éªŒè¯æ”¶è´§äººåœ°å€æ˜¯å¦æ­£ç¡®
            checkConsignee = false;
        }

        if (!check_Consignee("call_mobile_div")) { // éªŒè¯æ‰‹æœºå·ç æ˜¯å¦æ­£ç¡®
            checkConsignee = false;
        }

        // éªŒè¯é‚®ç®±
        //if (!check_Consignee("email_div")) {
        //    checkConsignee = false;
        //}

        // éªŒè¯é‚®æ”¿ç¼–ç æ˜¯å¦æ­£ç¡®
        if (!check_Consignee("zipCode_div")) {
            checkConsignee = false;
        }
        // éªŒè¯ç”µè¯æ˜¯å¦æ­£ç¡®
        //if (!check_Consignee("call_phone_div")) {
        //    checkConsignee = false;
        //}

        if (!checkConsignee) {
            $isReceiverSubmit.val('');
            return;
        }
        //$("#saveConsigneeTitleDiv").html("&nbsp;&nbsp;æ­£åœ¨æäº¤ä¿¡æ¯&nbsp;&nbsp;");

        var actionUrl = base+"receiver/update";
        if(id!="" && !isHidden ){
            actionUrl = base+"receiver/update";
        }
        if(id==""){
            actionUrl = base+"receiver/save";
            //æ¸…é™¤æ”¶è´§åœ°å€é€‰ä¸­
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
            async : false,//è®¾ç½®åŒæ­¥
            success : function(data) {
                //console.log("è¿”å›ç»“æœdata");
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
                alert("ç½‘ç»œå¼‚å¸¸ï¼Œè¯·ç¨åé‡è¯•ï¼");
            }
        });

    }
    layer.close(index);
    $isReceiverSubmit.val('false');
}

/**
 * è®¾ç½®é»˜è®¤æ”¶è´§åœ°å€
 */

function setDefault(id){
    $.ajax( {
        type : "POST",
        dataType : "json",
        url : base+"receiver/setDefault",
        data : {"isDefault":1,"receiverId":id},
        cache : false,
        async : false,//è®¾ç½®åŒæ­¥
        success : function(data) {
            if(data.status=="success"){
                var receiver=data.receiver;
                $("#consignee-list li").each(function(){
                    $(this).removeClass("address_on")
                    $(".btn_set_common").text("è®¾ç½®é»˜è®¤åœ°å€");
                });


                //æ¸…é™¤åŸé»˜è®¤åœ°å€çš„æ ·å¼
                $("#consignee-list").find("li").each(function(){
                    $(this).attr("isDefault","false");
                    $(this).removeClass("hover_li");
                });


                $("#consignee_radio_"+id).addClass("address_on hover_li");
                $("#consignee_radio_"+id).attr("isDefault","true");
                $("#order_receiverId").val(receiver.id);

                $("#consignee_radio_"+id+" .btn_set_common").text("é»˜è®¤åœ°å€");
            }else{
                alert(data.message);
            }
        },
        error : function(XMLHttpResponse) {
            alert("ç½‘ç»œå¼‚å¸¸ï¼Œè¯·ç¨åé‡è¯•ï¼");
        }
    });
}

function isEmpty(value){
    return 0==value.length;
};

/**
 * éªŒè¯æ”¶è´§åœ°å€æ¶ˆæ¯æç¤º
 */
function check_Consignee(divId) {
    var errorFlag = false;
    var errorMessage = null;
    var valueContent = null;        // è·å–ç›¸å…³æ–‡æœ¬æ¡†å†…å®¹

    if (divId == "name_div") { // éªŒè¯æ”¶è´§äººåç§°
        valueContent = $("#consignee_name").val();
        if (isEmpty(valueContent)) {
            errorFlag = true;
            errorMessage = "è¯·æ‚¨å¡«å†™æ”¶è´§äººå§“å";
        }
        if (valueContent.length > 4||valueContent.length <2||!isChinese(valueContent)) {
            errorFlag = true;
            errorMessage = "è¯·è¾“å…¥2åˆ°4ä¸ªä¸­æ–‡å­—ç¬¦!";
        }
        if (!is_forbid(valueContent)) {
            errorFlag = true;
            errorMessage = "æ”¶è´§äººå§“åä¸­å«æœ‰éæ³•å­—ç¬¦";
        }
    } else if (divId == "email_div") { // éªŒè¯é‚®ç®±æ ¼å¼
        valueContent = $("#consignee_email").val();
        if (!isEmpty(valueContent)) {
            if (!check_email(valueContent)) {
                errorFlag = true;
                errorMessage = "é‚®ç®±æ ¼å¼ä¸æ­£ç¡®";
            }
        } else {
            if (valueContent.length > 50) {
                errorFlag = true;
                errorMessage = "é‚®ç®±é•¿åº¦ä¸èƒ½å¤§äº50ä½";
            }
        }
    } else if (divId == "address_div") { // éªŒè¯æ”¶è´§äººåœ°å€
        valueContent = $("#consignee_address").val();
        divId = "address_div";
        if (isEmpty(valueContent)) {
            errorFlag = true;
            errorMessage = "è¯·æ‚¨å¡«å†™æ”¶è´§äººè¯¦ç»†åœ°å€";
        }
        if (!is_forbid(valueContent)) {
            errorFlag = true;
            errorMessage = "æ”¶è´§äººè¯¦ç»†åœ°å€ä¸­å«æœ‰éæ³•å­—ç¬¦";
        }
        /*if(!isChinese(valueContent)){
            errorFlag = true;
            errorMessage = "æ”¶è´§äººè¯¦ç»†åœ°å€å¿…é¡»ä¸ºæ±‰å­—";
        }*/
        if (valueContent.length < 5) {
            errorFlag = true;
            errorMessage = "æ”¶è´§äººè¯¦ç»†åœ°å€è¿‡çŸ­";
        }
        if (valueContent.length>60) {
            errorFlag = true;
            errorMessage = "æ”¶è´§äººè¯¦ç»†åœ°å€è¿‡é•¿";
        }
    }else if (divId == "zipCode_div") { // éªŒè¯é‚®æ”¿ç¼–ç 
        valueContent = $("#consignee_zipCode").val();
        if (!isEmpty(valueContent)) {
            //errorFlag = true;
            //errorMessage = "è¯·æ‚¨å¡«å†™é‚®æ”¿ç¼–ç ";
            if (valueContent.length>6) {
                errorFlag = true;
                errorMessage = "é‚®æ”¿ç¼–ç è¿‡é•¿";
            }else{
                if (!is_postcode(valueContent)) {
                    errorFlag = true;
                    errorMessage = "é‚®æ”¿ç¼–ç æ ¼å¼ä¸æ­£ç¡®";
                }
            }
        }
    } else if (divId == "call_mobile_div") { // éªŒè¯æ‰‹æœºå·ç 
        valueContent = $("#consignee_mobile").val();
        var valueContent2 = $("#consignee_phone").val();
        divId = "call_div";
        if (isEmpty(valueContent) && isEmpty(valueContent2)) {
            errorFlag = true;
            errorMessage = "è¯·æ‚¨å¡«å†™æ”¶è´§äººæ‰‹æœºå·ç æˆ–å›ºå®šç”µè¯!";
        }else if(!isEmpty(valueContent)) {
            if (!checkPhone1(valueContent)) {
                errorFlag = true;
                errorMessage = "æ‰‹æœºå·ç æ ¼å¼ä¸æ­£ç¡®";
            }
        }
        if (!errorFlag) {
            valueContent = $("#consignee_phone").val();
            if (!isEmpty(valueContent)) {
                if (!is_forbid(valueContent)) {
                    errorFlag = true;
                    errorMessage = "å›ºå®šç”µè¯å·ç ä¸­å«æœ‰éæ³•å­—ç¬¦";
                }
                if (!checkPhone(valueContent)) {
                    errorFlag = true;
                    errorMessage = "å›ºå®šç”µè¯å·ç æ ¼å¼ä¸æ­£ç¡®";
                }
            }
        }
    } else if (divId == "call_phone_div") { // éªŒè¯ç”µè¯å·ç 
        valueContent = $("#consignee_phone").val();
        divId = "call_div";
        if (!isEmpty(valueContent)) {
            if (!is_forbid(valueContent)) {
                errorFlag = true;
                errorMessage = "å›ºå®šç”µè¯å·ç ä¸­å«æœ‰éæ³•å­—ç¬¦";
            }
            if (!checkPhone(valueContent)) {
                errorFlag = true;
                errorMessage = "å›ºå®šç”µè¯å·ç æ ¼å¼ä¸æ­£ç¡®";
            }
        }
        if (true) {
            valueContent = $("#consignee_mobile").val();
            if (isEmpty(valueContent)) {
                errorFlag = true;
                errorMessage = "è¯·æ‚¨å¡«å†™æ”¶è´§äººæ‰‹æœºå·ç ";
            } else {
                if (!check_mobile(valueContent)) {
                    errorFlag = true;
                    errorMessage = "æ‰‹æœºå·ç æ ¼å¼ä¸æ­£ç¡®";
                }
            }
        }
    } else if (divId == "area_div") { // éªŒè¯åœ°åŒºæ˜¯å¦å®Œæ•´
        valueContent = $(".areaSelect").val();
        if (isEmpty(valueContent)) {
            errorFlag = true;
            errorMessage = "è¯·æ‚¨é€‰æ‹©å®Œæ•´çš„åœ°åŒºä¿¡æ¯";
        } else {
            if($(".lSelect").size()>valueContent.split(",").length){
                errorFlag = true;
                errorMessage = "è¯·æ‚¨é€‰æ‹©å®Œæ•´çš„åœ°åŒºä¿¡æ¯";
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
//æ‰‹æœºå·ç æ ¡éªŒ
function checkPhone1(mobile){
    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
    if(!myreg.test(mobile)) {
        return false;
    }else{
        return true;
    }
}
//åˆ¤æ–­æ˜¯å¦ä¸ºæ±‰å­—
function isChinese(value) {
    var reg = /[^\u4E00-\u9FA5]+/g;
    if(reg.test(value)) {
        return false;
    }
    return true;
}
/**
 * ç‚¹å‡»ä¿å­˜å…¬å…±æ–¹æ³•,æ˜,mergeOption:function(t){o.merge(this.option,t,!0)},get:function(t,e){if(!t)return this.option;"string"==typeof t&&(t=t.split("."));for(var i=this.option,n=this.parentModel,o=0;o<t.length&&(!t[o]||(i=i&&"object"==typeof i?i[t[o]]:null,null!=i));o++);return null==i&&n&&!e&&(i=n.get(t)),i},getShallow:function(t,e){var i=this.option,n=null==i?i:i[t],o=this.parentModel;return null==n&&o&&!e&&(n=o.getShallow(t)),n},getModel:function(t,e){var i=this.get(t,!0),o=this.parentModel,r=new n(i,e||o&&o.getModel(t),this.ecModel);return r},isEmpty:function(){return null==this.option},restoreData:function(){},clone:function(){var t=this.constructor;return new t(o.clone(this.option))},setReadOnly:function(t){r.setReadOnly(this,t)}},r.enableClassExtend(n);var a=o.mixin;a(n,i(130)),a(n,i(127)),a(n,i(131)),a(n,i(129)),t.exports=n},function(t,e){function i(t){var e={},i={},n=t.match(/Firefox\/([\d.]+)/),o=t.match(/MSIE\s([\d.]+)/)||t.match(/Trident\/.+?rv:(([\d.]+))/),r=t.match(/Edge\/([\d.]+)/),a=/micromessenger/i.test(t);return n&&(i.firefox=!0,i.version=n[1]),o&&(i.ie=!0,i.version=o[1]),r&&(i.edge=!0,i.version=r[1]),a&&(i.weChat=!0),{browser:i,os:e,node:!1,canvasSupported:!!document.createElement("canvas").getContext,touchEventsSupported:"ontouchstart"in window&&!i.ie&&!i.edge,pointerEventsSupported:"onpointerdown"in window&&(i.edge||i.ie&&i.version>=10)}}var n={};n="undefined"==typeof navigator?{browser:{},os:{},node:!0,canvasSupported:!0}:i(navigator.userAgent),t.exports=n},function(t,e,i){"use strict";function n(t,e,i,n,o){var r=0,a=0;null==n&&(n=1/0),null==o&&(o=1/0);var s=0;e.eachChild(function(l,u){var h,c,d=l.position,f=l.getBoundingRect(),p=e.childAt(u+1),g=p&&p.getBoundingRect();if("horizontal"===t){var m=f.width+(g?-g.x+f.x:0);h=r+m,h>n||l.newline?(r=0,h=m,a+=s+i,s=f.height):s=Math.max(s,f.height)}else{var v=f.height+(g?-g.y+f.y:0);c=a+v,c>o||l.newline?(r+=s+i,a=0,c=v,s=f.width):s=Math.max(s,f.width)}l.newline||(d[0]=r,d[1]=a,"horizontal"===t?r=h+i:a=c+i)})}var o=i(1),r=i(8),a=i(4),s=i(9),l=a.parsePercent,u=o.each,h={},c=h.LOCATION_PARAMS=["left","right","top","bottom","width","height"];h.box=n,h.vbox=o.curry(n,"vertical"),h.hbox=o.curry(n,"horizontal"),h.getAvailableSize=function(t,e,i){var n=e.width,o=e.height,r=l(t.x,n),a=l(t.y,o),u=l(t.x2,n),h=l(t.y2,o);return(isNaN(r)||isNaN(parseFloat(t.x)))&&(r=0),(isNaN(u)||isNaN(parseFloat(t.x2)))&&(u=n),(isNaN(a)||isNaN(parseFloat(t.y)))&&(a=0),(isNaN(h)||isNaN(parseFloat(t.y2)))&&(h=o),i=s.normalizeCssArray(i||0),{width:Math.max(u-r-i[1]-i[3],0),height:Math.max(h-a-i[0]-i[2],0)}},h.getLayoutRect=function(t,e,i){i=s.normalizeCssArray(i||0);var n=e.width,o=e.height,a=l(t.left,n),u=l(t.top,o),h=l(t.right,n),c=l(t.bottom,o),d=l(t.width,n),f=l(t.height,o),p=i[2]+i[0],g=i[1]+i[3],m=t.aspect;switch(isNaN(d)&&(d=n-h-g-a),isNaN(f)&&(f=o-c-p-u),isNaN(d)&&isNaN(f)&&(m>n/o?d=.8*n:f=.8*o),null!=m&&(isNaN(d)&&(d=m*f),isNaN(f)&&(f=d/m)),isNaN(a)&&(a=n-h-d-g),isNaN(u)&&(u=o-c-f-p),t.left||t.right){case"center":a=n/2-d/2-i[3];break;case"right":a=n-d-g}switch(t.top||t.bottom){case"middle":case"center":u=o/2-f/2-i[0];break;case"bottom":u=o-f-p}a=a||0,u=u||0,isNaN(d)&&(d=n-a-(h||0)),isNaN(f)&&(f=o-u-(c||0));var v=new r(a+i[3],u+i[0],d,f);return v.margin=i,v},h.positionElement=function(t,e,i,n,a){var s=!a||!a.hv||a.hv[0],l=!a||!a.hv||a.hv[1],u=a&&a.boundingMode||"all";if(s||l){var c;if("raw"===u)c="group"===t.type?new r(0,0,+e.width||0,+e.height||0):t.getBoundingRect();else if(c=t.getBoundingRect(),t.needLocalTransform()){var d=t.getLocalTransform();c=c.clone(),c.applyTransform(d)}e=h.getLayoutRect(o.defaults({width:c.width,height:c.height},e),i,n);var f=t.position,p=s?e.x-c.x:0,g=l?e.y-c.y:0;t.attr("position","raw"===u?[p,g]:[f[0]+p,f[1]+g])}},h.mergeLayoutParam=function(t,e,i){function n(n){var o={},s=0,l={},h=0,c=i.ignoreSize?1:2;if(u(n,function(e){l[e]=t[e]}),u(n,function(t){r(e,t)&&(o[t]=l[t]=e[t]),a(o,t)&&s++,a(l,t)&&h++}),h!==c&&s){if(s>=c)return o;for(var d=0;d<n.length;d++){var f=n[d];if(!r(o,f)&&r(t,f)){o[f]=t[f];break}}return o}return l}function r(t,e){return t.hasOwnProperty(e)}function a(t,e)ÿØÿà JFIF      ÿÛ C 		

		ÿÛ C			ÿÂ ôf ÿÄ             	
ÿÚ     ú“
NbI¨8I¥Á"ùmg|Û=nĞzøÒI8ëº™ßfÀ_å~^b%PÅ1¨à…¦Ô¿3KZ€`kuÜJI‘Iúï$p5‹cd’4¢K§ûè½»I9Úò¿²`/×_,îÎÚî»Š¨ö×¬ù™òÿ !’hi`kCZÚÄ¤RH¢
“õØÒsPMr	5bzqR”SóŒÆfvjI>=}Cİ49Ú£æJXêú/}å<%ªÕéf}½¥øDÄSPkCSC[T”‰ ”ŠRşºãsRLL!Å‰ —"L{œ²xùnì¢À“åü²»°Úí)óO%${ÍÏâ4¾jŒ~wİmï?O-ùéjH5 Ö¦µ 6©(( dıt° ƒ€ {ÓŒ’:GÏ4O“e¹5®wŸñ°‹û)çBüáÈ>—ÒnÍw¡}N-y-‡½ü÷•Ë~xZJ 515¡¢°)BE$dıqÆˆ	¤šˆ!‘§ÌLóS«|'“ÃÅsÛô?Sç’XÅEsgÈ9Çç¥á´6‡‚ÛÚ×Gú¬4^kÙnÌ_ŒôÆ¢Zš˜`®’FO×
1÷1¬jœ:}{£ôíi¦q"ùééçüŸ¨ÊøÌ,ûH¶JÜÑÀrı]ë9ÇnkM1ê1ü>wg3ÉzŸ€p¢ ©­h 6°I"’E$¥ıo°&–±"AC9 Ä\dÔ<{jìÏ€:=ÅÑ˜O–^?É?jÊÉ0ü×ÁVöeRåÍ©¯µ¤Æb±·ı”¾{?ğšE¨ ĞšZ b$A ¥'ër¹{%$eÈâ”ráyÉ‹’ĞÈhã¾‚ôUÔ¼ŸŠ“iÚËó—	[Ø]s‡æİ‰ãµ†r–¼™ë‹¿q	À @LMA!"’JOÖ¤e"ÔR)€Æ²7©<.‘ñXªo–DÔ˜Ê¸¿Cõ®Ò^WÂM´®¥á¹ç†ïûŠ£¢½·šğ9:¸¨Ué)Íñ»Î’‚h45ª(“‚)$BOÖ“S\ ’÷«°£&½ÕŞGFŒ2Hœ#¥†ï~¯KÌëùv~I-k ¸“Øz{ªôø?3b
q²TÛ?|i!5 ˜ZÔÔÖ@JA’!KúĞŒ—½Òâ9'²jDÒó­|˜ÀbêS¦_"E•ñ[êø^o]O²òèj-Åû(ä‡ŠÉã±¯Š60¹KòS\’šj 545”‘	"’~³"Á¸¹óÏ¤9×Ñj±4ºMOå<îJ¥Z>gÌ~ëï»^c]I³sj¾›Ò¼wï1Ò7èc`lq½)¾SjtäÔ@ &&¶ZJ$’“õÖ”Jt“yÎOÕ˜½İÕ!isµ†Åc+V§Bªš¦çğ?N{}y}ekez†Ôš[ó²µ±66ã$¿åî”€šƒSA­à’H ¥ıb ˆpsä³¢y:ø]ÕØÕ 	õõ^ˆÆâéW«K‰×”^kÒêÏ¬ËÍê¹vw¥^?Yé~JÍ[ÆØZÖF_ó?A¢Zhj	©°Š2~±!NMq–Z¼¡¬l2£ºv­r]ÖX¬*†.JôñŞsZJñs÷``u+¶w¨ZçÂiNSÌÚ	‘1Kşps˜r	¥©ˆ l ¤I$”Ÿ¬’N|–<W$ã'mL~¬÷µXR8yˆÄbñôqÔ«VÇy}e3Ôiş„.á4û6‡®ƒÍé.XÌYI±DØZ™I—ç2 h	¡ !$PDSÿ W±—M>”æ«3ˆ+bğ±´ªFÒï=á±Xœf>®6Zô¼v¯ÊXïºû7§!ÚÙš&–åü½‚YL‰ª(Â2p)‡”Ğ€±„’I$¤ı\Æù]Ìz’ôÂ*õ±~¿=]h“—˜ñØÌ^.…lu:Uëxc;›,Ù^’óš‚®ÌØÍÍÍ9k(66FÈÚØšTœ'ÈhjA¨
!$ˆIIú¸‰ÒMäÏ1nVGz˜Ï7ô¨ÕŒ8ù/ÆchV¥FXµ–³Í†•«}¥åõ5-‡²ü¶š‡OrÖ^Ã”l‰‘ÆkŸÄ|j€A¥„†–ÆÔRR~­[$Şw“(Ù•±Ö†
xÌ_Ò¼exÓ—Šóøüv2…z”jTRkyˆmJ¿I¾ùIKßm{«¨xî7ËÚA¬61¬ˆËÆüF	„&€hLb$’I	¿VŠOÊêÃ”1Á^½,V[¿h×ˆ¸øL>:†6ZÔé×‹Hø3(i±=/„ÓXÿ q¶u¶ÈùN!ÌYJ1MŒ2”œ“ÂM% Paj 5‰„¥ı\-wÌöf{[0ÁZßö½
íOv»ÇcñôhU¯Vœh_eÌ¨~´uˆ¡£q^Óqhï5Ÿæ-12&0G"nUà@J    ™I$’E	WzËœlJğÈ¢‚(*RÁî~°¡»§¡BX*Ô†>wó3Ğ}eë„ªhL?¯Ü¼¿aén ÌÙ@DØÙ Y?2|÷A4„ÔšÔ R	$’—ôëÎ$-dqAPU£‚èîˆ£Sâğ”¨ÑÇÒ©^½X™ÌøI!oĞŞÌ÷éCÏş{ÖìÍqsf­†FØØÖÂlówÎÖ’‚jI©¨ I$Aıü®ò¢Š8`iĞÀõ¦á§êxÊ4iR£N*À9c,ıÜòt=ôÎ{ó9üÏ“É|]™²Ô¢…¡‚8š„ÜõóˆšÒĞšÄ‘ˆ~+ ØâŠc†½J¶}İ(˜ŸGÉRÇÓ§F¤U‰¼¤ú+°êG³¶û›ÏgêèÛé.ã,Å¤ÑI±ˆâidúæ°$ ’  ƒ@j ’I	AÌqÅPC5 Çy¿ J1"ìo—§J:5+ÁR½^CÚÿ C³5+›ûçØ.wğã$ï_¿¸36ƒ[`1±ÄfÒŸ2ØäÔ A¨$’„Ÿ ªA‘CPÅÃæ²øªüW¥N:5+W¥GsEZ¼o“Ûôù§Åd].ÛÛ5È9‹!­0Ö¶8’ê—í% €Z-Aˆ”¤ıSca†(#Š(£˜¼ßÚ¼-8Z]‰ÁR§F¥
uiã(ï­ŸR¼Q¶Imt¦{˜plVz+×ğŸ#åì…ZÆµ±ÆƒeÖ+ZäH-@! AA$ÿ Ğe&GpCQ…ÌZwz}^ÄÕ„añ¨Ñ©F…,nG~åë±jK±v®œğ}_‘àQÌN[€26¦¶Oòy®sP@ @H"R	$’ş‚i2( 5²sf‹=Wô‡Z0ƒÇS¡J;Gbíãbb&VO€èMoæ"Y®·ÏŞZÌÙQµŒjk#bb“Çü’isP-!©4 €™®$@JOĞM&ÅDÒıÍs7¸{‹Z$_„£OF†/!´òQF˜BR‘æ½Ê•ÒöıB~yó&fÂ­‰²6†'ùÏí$   @Xi"
_ĞM&E10Ë©yÃãú+ÔØºÌ	ØJô±ø¸}¯§8ØEò®méJQ5Åm¾ƒ_;9¯1`FÔÆ²0…øşÂB	 ¡Yi	’
OĞMGQ©|‹
?©{ŸY \úONclm	8É3¹WØ”à ®€Ü«ç;åì5¡±†±¨Ñøõ\@@ZZ•°€’“ôJ8ë°ISƒğ6æe°ŞŸY­
¥vä¤`	€ù,.T×{C¦èÀÁêŠ>jhL¼á¡¬kljhLøíIÈš@   j)5&ıĞdP	,q>¯·jHëı¸ÅcákY$*F aN|öqü¥æ+ïåF¼mˆv¯¢24†ZdĞÖ1¢6†°üwÆ' 5 Sm9&”ZARşè2ëË¶ìÎè=GØüÖ—µ¡.’k¾7—*:‡Ilš0FÈ¬÷5ÁòÛQeg 5‘&5¬ji›äq@€€ ±¶¤AIKú¦ÈEÁRZ–Açú…¥ZÇ‚Ğ’k‘Åİ!¡mK3®³Ô`c ½ÜyüŸ×yI“cbkDlYùäœB kPSî°X\.Æc1´¢›ôJ(äÏ¯)niRgOıÄU­kÁb¹I-ª\ÇânÌ+a»¢âdK°vo’ş/'"‘55¬kZÓ/Ê?Š@$Ğ€5«ª7*´¨ÅZ¼A¥õŞŒJnXæù¦{ıíÙW cS‚9Î}›zÏ››jCIûCR26{n³Ê/+‘&²0ÔÆÆSş[êòä @4´µ ÁÑıJ\mX+AP/¬øæóòI%—xô—Hf(P®Æ5 à	sç±[œ5¥ë/-ƒíú‹R8ÚÔı©±~vyËïJ65ØŸ15p	&†¤ MbŞİUJ¥|~2µx`‚!õ“ÃÁúã9Ğ½ĞyšUêÁmh@”âù§³¨yù–§qc+c·NñÅÓc sîú.SÀÜ²6 #1ü×Ò%À"ÄƒRb 7oöJµ¨béÕŠ!W1b<AîÑzĞÅÔœçKb×Œç3jy
`Š®3§}î6Úƒ¥µæ|¹MakDA	ÿ ;yô9$ 	¨& ÖìÚ©Z½v.¬0Cû’ôv€&ÇmkPjÒÉ$ö0œû­-Ï)@5ÔÃöã¨ÂÆ‚é-_æŒ=©L1­cSeùıÍEÁ ƒRMA©7×w¥ZĞĞ¡ˆ£0DÏ¹\cm	4$¤³bÎ/Dj;ò kb†Œ½¿„©h':ÖCšqv^È“ZšÆÆ“ƒyq9© @ –ú!Z´iá±pÃíì ƒCKJ	>Õü‘ÔòÙ‘É ĞÈã­Ù3‹§CK¬5cl¾&†¦±66´!7r‹^ÔSSKPIŒ—èê«V­\N¬PBß·p ZÒHMEÓy½#¯îÙ•á ÚÖElWJmlmHƒB&ŞGšhNæ…264!'ò2sCšƒR  Ğ¬ÍZÕêãpXÈàˆ}¸®hp- &:Lo9ãnsigneeDetail('"+receiver.id+"', event)\">ç¼–è¾‘</a>"+
            "<a class=\"btn_set_common\" href=\"javascript:void(0)\" onclick=\"setDefault('"+receiver.id+"')\">è®¾ä¸ºé»˜è®¤åœ°å€</a></div>"+
            "<div class=\"tips_del\" id=\"tips_"+receiver.id+"\">"+
            "<p class=\"txt\"> ç¡®è®¤åˆ é™¤è¯¥æ”¶è´§åœ°å€å—ï¼Ÿ </p>"+
            "<div class=\"btn_box\">"+
            "<button onClick=\"delReceiver('"+receiver.id+"')\" class=\"btn_sure\"> <span>ç¡®è®¤</span> </button>"+
            "<button class=\"btn_cancle\" onClick=\"hideTips('"+receiver.id+"');\"> <span>å–æ¶ˆ</span> </button>"+
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

    //ç›´æ¥ä¸‹è®¢å•ä¸é‡‡è´­å•å•†å“ä¸‹è®¢å• æ ‡è¯†ï¼Œ  1ï¼šé‡‡è´­å•å•†å“ä¸‹å•
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
 * åˆ·æ–°æ”¶è´§åœ°å€æ˜¾ç¤ºå†…å®¹
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
            alert("ç½‘ç»œå¼‚å¸¸ï¼Œè¯·ç¨åé‡è¯•ï¼");
        }
    });
}

/*æ”¶è´§åœ°å€çš„å¤„ç† - end*/


/*æ”¯ä»˜æ–¹å¼ã€é…é€æ–¹å¼çš„å¤„ç† - start*/




/*æ”¯ä»˜æ–¹å¼ã€é…é€æ–¹å¼çš„å¤„ç† - end*/

