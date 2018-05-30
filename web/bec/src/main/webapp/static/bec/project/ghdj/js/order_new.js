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
 * 点击保存公共方法,�,mergeOption:function(t){o.merge(this.option,t,!0)},get:function(t,e){if(!t)return this.option;"string"==typeof t&&(t=t.split("."));for(var i=this.option,n=this.parentModel,o=0;o<t.length&&(!t[o]||(i=i&&"object"==typeof i?i[t[o]]:null,null!=i));o++);return null==i&&n&&!e&&(i=n.get(t)),i},getShallow:function(t,e){var i=this.option,n=null==i?i:i[t],o=this.parentModel;return null==n&&o&&!e&&(n=o.getShallow(t)),n},getModel:function(t,e){var i=this.get(t,!0),o=this.parentModel,r=new n(i,e||o&&o.getModel(t),this.ecModel);return r},isEmpty:function(){return null==this.option},restoreData:function(){},clone:function(){var t=this.constructor;return new t(o.clone(this.option))},setReadOnly:function(t){r.setReadOnly(this,t)}},r.enableClassExtend(n);var a=o.mixin;a(n,i(130)),a(n,i(127)),a(n,i(131)),a(n,i(129)),t.exports=n},function(t,e){function i(t){var e={},i={},n=t.match(/Firefox\/([\d.]+)/),o=t.match(/MSIE\s([\d.]+)/)||t.match(/Trident\/.+?rv:(([\d.]+))/),r=t.match(/Edge\/([\d.]+)/),a=/micromessenger/i.test(t);return n&&(i.firefox=!0,i.version=n[1]),o&&(i.ie=!0,i.version=o[1]),r&&(i.edge=!0,i.version=r[1]),a&&(i.weChat=!0),{browser:i,os:e,node:!1,canvasSupported:!!document.createElement("canvas").getContext,touchEventsSupported:"ontouchstart"in window&&!i.ie&&!i.edge,pointerEventsSupported:"onpointerdown"in window&&(i.edge||i.ie&&i.version>=10)}}var n={};n="undefined"==typeof navigator?{browser:{},os:{},node:!0,canvasSupported:!0}:i(navigator.userAgent),t.exports=n},function(t,e,i){"use strict";function n(t,e,i,n,o){var r=0,a=0;null==n&&(n=1/0),null==o&&(o=1/0);var s=0;e.eachChild(function(l,u){var h,c,d=l.position,f=l.getBoundingRect(),p=e.childAt(u+1),g=p&&p.getBoundingRect();if("horizontal"===t){var m=f.width+(g?-g.x+f.x:0);h=r+m,h>n||l.newline?(r=0,h=m,a+=s+i,s=f.height):s=Math.max(s,f.height)}else{var v=f.height+(g?-g.y+f.y:0);c=a+v,c>o||l.newline?(r+=s+i,a=0,c=v,s=f.width):s=Math.max(s,f.width)}l.newline||(d[0]=r,d[1]=a,"horizontal"===t?r=h+i:a=c+i)})}var o=i(1),r=i(8),a=i(4),s=i(9),l=a.parsePercent,u=o.each,h={},c=h.LOCATION_PARAMS=["left","right","top","bottom","width","height"];h.box=n,h.vbox=o.curry(n,"vertical"),h.hbox=o.curry(n,"horizontal"),h.getAvailableSize=function(t,e,i){var n=e.width,o=e.height,r=l(t.x,n),a=l(t.y,o),u=l(t.x2,n),h=l(t.y2,o);return(isNaN(r)||isNaN(parseFloat(t.x)))&&(r=0),(isNaN(u)||isNaN(parseFloat(t.x2)))&&(u=n),(isNaN(a)||isNaN(parseFloat(t.y)))&&(a=0),(isNaN(h)||isNaN(parseFloat(t.y2)))&&(h=o),i=s.normalizeCssArray(i||0),{width:Math.max(u-r-i[1]-i[3],0),height:Math.max(h-a-i[0]-i[2],0)}},h.getLayoutRect=function(t,e,i){i=s.normalizeCssArray(i||0);var n=e.width,o=e.height,a=l(t.left,n),u=l(t.top,o),h=l(t.right,n),c=l(t.bottom,o),d=l(t.width,n),f=l(t.height,o),p=i[2]+i[0],g=i[1]+i[3],m=t.aspect;switch(isNaN(d)&&(d=n-h-g-a),isNaN(f)&&(f=o-c-p-u),isNaN(d)&&isNaN(f)&&(m>n/o?d=.8*n:f=.8*o),null!=m&&(isNaN(d)&&(d=m*f),isNaN(f)&&(f=d/m)),isNaN(a)&&(a=n-h-d-g),isNaN(u)&&(u=o-c-f-p),t.left||t.right){case"center":a=n/2-d/2-i[3];break;case"right":a=n-d-g}switch(t.top||t.bottom){case"middle":case"center":u=o/2-f/2-i[0];break;case"bottom":u=o-f-p}a=a||0,u=u||0,isNaN(d)&&(d=n-a-(h||0)),isNaN(f)&&(f=o-u-(c||0));var v=new r(a+i[3],u+i[0],d,f);return v.margin=i,v},h.positionElement=function(t,e,i,n,a){var s=!a||!a.hv||a.hv[0],l=!a||!a.hv||a.hv[1],u=a&&a.boundingMode||"all";if(s||l){var c;if("raw"===u)c="group"===t.type?new r(0,0,+e.width||0,+e.height||0):t.getBoundingRect();else if(c=t.getBoundingRect(),t.needLocalTransform()){var d=t.getLocalTransform();c=c.clone(),c.applyTransform(d)}e=h.getLayoutRect(o.defaults({width:c.width,height:c.height},e),i,n);var f=t.position,p=s?e.x-c.x:0,g=l?e.y-c.y:0;t.attr("position","raw"===u?[p,g]:[f[0]+p,f[1]+g])}},h.mergeLayoutParam=function(t,e,i){function n(n){var o={},s=0,l={},h=0,c=i.ignoreSize?1:2;if(u(n,function(e){l[e]=t[e]}),u(n,function(t){r(e,t)&&(o[t]=l[t]=e[t]),a(o,t)&&s++,a(l,t)&&h++}),h!==c&&s){if(s>=c)return o;for(var d=0;d<n.length;d++){var f=n[d];if(!r(o,f)&&r(t,f)){o[f]=t[f];break}}return o}return l}function r(t,e){return t.hasOwnProperty(e)}function a(t,e)���� JFIF      �� C 		

		�� C			�� �f ��             	
��     ��
NbI�8I��"�mg|�=n�z��I8뺙�f�_�~^b%P�1����Կ3KZ�`ku�JI�I��$p5�cd�4�K��轻I9����`/�_,�����׬����� !�hi`kCZ�ĤRH�
����sPMr	5�bzqR�S��fvjI>=}C�49ڣ�JX��/}�<%���f}���D�SPkCSC[T�� ��R���sRLL!ŉ��"L�{��x�n�����������)�O%${���4�j�~w�m�?O-��jH5 ֦��6�(�(�d�t� �� {ӌ�:G�4O�e�5�w���)��B���>��n�w�}N-y-������~xZJ 515���)BE$d�qƈ	���!���L�S�|'���s��?S�X��Esg�9���6�����G��4^k�n�_���ƢZ��`��FO�
1��1�j�:}{���i�q"����������,�H�J���r�]�9�nkM1�1�>wg3�z��p� ��h 6�I"�E$��o�&��"AC9���\d�<{j�ϐ�:=�јO�^?�?j��0���V�eR�ͩ����b�����{?�E� КZ b$A �'�r�{%$e���r�y�ɋ���h㾂�UԼ���i���	[�]s��݉㵆r������q	� @LM�A!"�JO֤e"�R)�Ʋ7�<.��X�o�DԘʸ�C���^W�M���������������9:��U�)��Β�h45�(��)$BO֓S\� �����&���GF�2H�#���~�K���v~I-k����z�{���?3b
q�T�?|i!5 �Z���@JA�!K�Ќ�����9'�jD��|��b�S�_"E��[��^o]O���j-��(䇊�㱯�60�K�S\���j 545���	"�~�"����Ϥ9��j�4�MO�<�J�Z>g��~��^c]I�sj��Ҽw�1�7�c`lq�)�Sjt��@ &&�ZJ$����֔Jt�y�O՘����!is���c+V�B�����?N{}y}ekez�Ԛ[����66�$������SA����H���b �ps䳢y�:�]��� 	��^����W�K�ה^k��Ϭ���vw�^?Y�~J�[��Z�F_�?A�Zhj	����2~�!NMq�Z���l2���v�r]��X�*�.�J���sZJ�s�``u+�w�Z��iNS��	�1�K�ps�r	��� l ��I$����N|�<W$�'mL~���XR8�y��b��qԫV�y}e3�i��.�4�6�����.X�YI�D�Z�I��2 h	� !$PDS� W��M>��3�+b����F��=�X�f>�6�Z��v���X��7�!�ٚ&������YL��(�2p)��Ѐ���I$��\ƞ�]�z���*��~�=]h������^.�lu:U�xc;�,�^�󚂮�����9k(66F��ؚT�'�h�jA�
!$�II����M���1nVGz��7��Ռ8�/��chV�F�X����͆��}���5-������Or�^Ôl���k��|j�A������R�R~�[$�w�(ٕ�ֆ
x�_Ҽexӗ����v2�z�jT�Rky�mJ�I����IK�m{��x�7��A��61�����F	�&�hLb$�I	�V�O��Ô1�^�,V[�h׈��L>:�6�Z��׋H�3(i��=/��X� q�u���N!�YJ1M�2����M% Paj 5�����\-w��f{[0�Z����
�Ov��c��hU�V�h_ę~�u���q^�qh�5��-12&0G"nU�@J    �I$�E	Wz˜lJ�Ȣ�(*R��~�������B�X*Ԇ>w�3�}e넪hL?�ܼ�a�n ��@D��� Y?2|�A4�Ԛ� �R	$�����$-dqAPU���S����ҩ^�X���I!o�����C��{���qsf��F����l�w�֒�jI�� I$A����8`�i������x�4iR�N*�9c,���t=��{�9�ϓ�|]��Ԣ���8�������Кđ�~�+ ��c��J�}�(��G�R�ӧF�U�����+��G�����g����.�,Ť�I���id��$ �  �@j �I	A�q�PC5��y��J1"�o��J�:5+�R�^C�� C�5+����.w��$�_����36�[`1��fҟ2��� A�$�����A�CP�Î������W��N�:5+W�GsEZ�o������d].��5�9�!��0ֶ8����%��Z-A����Sca�(#�(�����ڼ-8Z]��R�F�
ui�(ﭟR�Q�Imt�{�plVz+��#��ZƵ�ƃe�+Z�H-@! AA$� �e&GpCQ��Zwz}^�Մa��ѩF�,nG~�뱍j�K�v���}_���Q�N[��26��O�y�sP@ @H"R	$���i2(��5�sf�=W�Z0���S�J�;Gb��bb&VO��Mo�"Y����Z��Q��jk#bb����isP-!�4 ���$@JO�M&�D���s7�{�Z$_��OF�/!��QF�BR��ʕ���B~y�&f���6�'�ϐ�$ �  @Xi"
_�M&E10˩y���+�غ�	�J����}���8�E�m�JQ5�m��_;9�1`F�Ʋ0����B	 �Yi	�
O�MGQ�|�
?�{�Y�\�ONclm	8�3�Wؔ� ��ܫ�;��5����������\�@@ZZ�������J8�IS��6�e�ޟY�
�v�`	��,.T�{C����Ꝋ>jhL�ᡬkljhL��I��@   j)5&��dP	,q>��jH����c�kY$*F�aN|�q���+��F�m�v��24�Zd��1�6���w�' 5 Sm9&�ZAR���2�˶���=G��֗��.�k�7�*:�Il�0FȬ�5���Qeg 5�&5�ji���q@�� ���AIK���E��RZ�A�����ZǂВk����!�mK3���`c ��y���yI�cbkDlY��B kPS�X\.��c1����J(�ϯ)niRgO��U��k�b�I-�\��n�+a����dK�vo��/'"�55�kZ�/�?�@$Ѐ5��7�*���Z�A���ތJnX���{����W cS�9�}�zϛ�jCI�CR26{n��/+��&�0���S�[��� @4�� ���J�\mX+AP/�����I%�x��Hf(P��5 �	s�[�5��/-����R8�����~vy��J65���15p	&�� Mb��UJ�|~2�x`�!������9н�y�U��mh@������y���qc+c�N���c s��.S�ܐ�6 #�1���%�"ăRb 7o�J��b�Պ!W1�b<A��z�����Kb׌�3jy
`��3�}�6ڃ����|�MakDA�	� ;y�9$ 	�&���کZ�v.�0C���v��&�mkPj��$�0���-�)@5������Ƃ�-_�=�L1�cSe���E� �RMA�7�w�Z�С��0DϹ\cm	4$��b�/Dj;� kb������h':�C�qv^ȓZ�����yq9� @ ��!Z�i�p��� �CKJ	>�����ّ� ��㭎ٝ3��CK���5cl�&���66�!7r�^�SSKPI����V�\N�PB߷p Z�HME�y�#��ٕ���ElWJmlmH�B&�G�hN�264!'�2sC��R  Ь�Z���pX���}��hp- &�:Lo9�nsigneeDetail('"+receiver.id+"', event)\">编辑</a>"+
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

