/**
 * Created by gzj on 2015/11/6 0006.
 */
function getRootPath(){
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPaht=curWwwPath.substring(0,pos);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}
var base=getRootPath()+'/';
Number.prototype.formatMoney = function (places, symbol, thousand, decimal) {
    places = !isNaN(places = Math.abs(places)) ? places : 2;
    symbol = symbol !== undefined ? symbol : "$";
    thousand = thousand || ",";
    decimal = decimal || ".";
    var number = this,
        negative = number < 0 ? "-" : "",
        i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;
    return symbol + negative + (j ? i.substr(0, j) + thousand : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) + (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
};
$(function(){
    var userNameCookie = $.cookies.get("memberUsername");
    var rememberMeCookie = $.cookies.get("rememberMe4Member");
    var nicknameCookie = $.cookies.get("memberNickname");
    if (userNameCookie != null && userNameCookie != "" && rememberMeCookie != null && rememberMeCookie !="") {
        $("#offline").hide();
        $("#online").show();
        //$("#mainlevel_02").show();
        if(nicknameCookie!=null && nicknameCookie!=""){
            $("#userline").html('，'+nicknameCookie)
        }else{
            if(userNameCookie!=null && userNameCookie!=""){
                $("#userline").html('，'+userNameCookie)
            }
        }
    }else{
        $("#online").hide();
        $("#offline").show();
        //$("#mainlevel_02").hide();
        if(nicknameCookie!=null && nicknameCookie!=""){
            $("#useroff").html('，'+nicknameCookie)
        }else{
            if(userNameCookie!=null && userNameCookie!=""){
                $("#useroff").html('，'+userNameCookie)
            }
        }
    }
    rload();
    $("#shop_cart").mouseover(function() {
        if(!$("#shop_cart dl").hasClass("hover")){
            rload();
            $("#shop_cart dl").addClass("hover");
        }
    }).mouseout(function() {
        $("#shop_cart dl").removeClass("hover");
    });
    $("#settleup-url").attr("href", base+"cart/list?r="+Math.random());

    //初始化搜索类型 TianYu  2016-2-19 16:38:16
    initSearchType4Cookie();

    //input增加清空按钮
    if($(".has_reset").length > 0){
        $(".has_reset").addClear();
    }
});

/**
 * 全站搜索
 */
function s(key,param) {
    if (typeof(key) != "undefined" && key != "") {
        var search_type = $("#search_type").val();
        saveSearchType2Cookie();
        if(search_type == 'goods'){
            searchG(key, param);
        }else if(search_type == 'shop'){
            window.location.href = base+"shopExtend/list.html?s=top&name=" + encodeURI(encodeURI($.trim(key)));
        }
    }
}

function searchG(key,param){
    if (key != undefined && key != "") {
        $("#search_type").val('goods');
        saveSearchType2Cookie();
        if (param.length > 0 && param != null && param != "" && param != "undefined" && param != undefined && param != "null") {
            window.location.href = base + "search/s/" + encodeURI(encodeURI($.trim(key).replace(/\//g, '址达司杠').replace(/\./g, '址达司点号').replace(/\+/g, '址达司加号'))) + "?" + param;
        } else {
            window.location.href = base + "search/s/" + encodeURI(encodeURI($.trim(key).replace(/\//g, '址达司杠').replace(/\./g, '址达司点号').replace(/\+/g, '址达司加号')));
        }
    }
}
function searchGDetail(key,param){
    if (key != undefined && key != "") {
        $("#search_type").val('goods');
        saveSearchType2Cookie();
        if (param.length > 0 && param != null && param != "" && param != "undefined" && param != undefined && param != "null") {
            window.location.href = base + "search/detaillist/" + encodeURI(encodeURI($.trim(key).replace(/\//g, '址达司杠').replace(/\./g, '址达司点号').replace(/\+/g, '址达司加号'))) + "?" + param;
        } else {
            window.location.href = base + "search/detaillist/" + encodeURI(encodeURI($.trim(key).replace(/\//g, '址达司杠').replace(/\./g, '址达司点号').replace(/\+/g, '址达司加号')));
        }
    }
}

/**
 * 保存搜索类型到Cookie
 * TianYu
 * 2016-2-19 16:35:18
 */
function saveSearchType2Cookie() {
        $.cookies.set('search_type', $("#search_type").val(), {
            expires : 7
        });
}
/**
 * 从cookie中读取默认的搜索类型，设置默认值
 * TianYu
 * 2016-2-19 16:35:18
 */
function initSearchType4Cookie() {
    var search_type = $.cookies.get('search_type');
    if (typeof(search_type) != "undefined" && search_type != null) {
        $("#search_type").val(search_type);
    }
}

//
$(document).keyup(function(event) {
    if (event.keyCode == 13) {
        var keyword=$("#sear_text").val();
        if($.trim(keyword)!='') {
            //$("#sear_btn").trigger("click");
            s(keyword,'');
        }
    }
});

/*登陆*/
function login() {
    return location.href = base+"member/login?ReturnUrl=" + escape(location.href).replace(/\//g, "%2F");
}
/*注册*/
function regist() {
    return location.href = base+"member/register?ReturnUrl=" + escape(location.href).replace(/\//g, "%2F");
}
/*注册试用*/
function registShiYong() {
    return location.href = base+"member/register?buyerType=3&ReturnUrl=" + escape(location.href).replace(/\//g, "%2F");
}
/*动态刷新购物车*/
function rload(){
    $.ajax({
        type: "get",
        url: base+"cart/ajaxCartList?r="+Math.random(),
        success: function(data) {
            if(data.status=='success'){
                var json=eval(data.data);
                var data='';
                var totalshop=0;
                var totalmoney=0.0;
                var showBatch = 0;
                $.each(json,function(i,n){
                    var batchPrice = json[i].batchPrice;
                    if(batchPrice != '' && batchPrice!=null && batchPrice!=undefined && batchPrice!='undefined' && batchPrice!='null'){
                        showBatch = batchPrice;
                    }else{
                        showBatch = json[i].price;
                    }
                    data= data+'<ul>'+
                        '<li class="f-cb goods">'+
                        '<div class="f-fl p-img">'+
                        '<a href="'+base+'item/'+json[i].goodsId+'.html" target="_blank">'+
                        '<img src="'+(json[i].pic==undefined?'':json[i].pic)+'" width="50" height="50" alt="" />'+
                        '</a>'+
                        '</div>'+
                        '<div class="f-fl p-name">'+
                        '<a href="'+base+'item/'+json[i].goodsId+'.html" target="_blank">'+json[i].name+'</a>'+
                        '</div>'+
                        '<div class="f-fr p-detail">'+
                        '单价：￥'+showBatch+'<br>数量：'+json[i].quantity+'<br><a href="javascript:delCart(\''+json[i].id+'\');">删除</a>'+
                        '</div>'+
                        '</li>'+
                        '</ul>';
                    totalshop =	totalshop+ json[i].quantity;
                    totalmoney = totalmoney + showBatch*json[i].quantity;
                });
                var divshow = $("#cartlist");
                divshow.text("");// 清空数据
                //var divtotal =$("#carttotal");
                //divtotal.text("");// 清空数据
                $("#counts").text(totalshop);
                $("#total").text(totalmoney.formatMoney(2,"￥"));
                //var data1='共<span id="counts">'+totalshop+'</span>件商品　共计pan id="total">￥ '+totalmoney.toFixed(2)+'</span><br>'+'<a href="'+base+'cart/list" title="去购物车结算" id="btn-payforgoods">去购物车结算</a>';
                //divtotal.append(data1);
                if(data!=''){
                    divshow.append(data);
                }else{
                    $("#settleup-content").hide();
                }
                $("#shoppingcount").html(totalshop);
            }else{
                $("#shoppingcount").html('0');
            }
            if($("#shoppingcount").text() == 0) {
                $("#cartinfo .nogoods").show();
                $("#cartinfo .goodslist").hide();
            }
        }
    });
}
/*删除购物车中的商品*/
function delCart(cartItemid) {
    $.ajax({
        type: "get",
        url: base+"cart/ajaxDeleteCartId",
        data: "id="+cartItemid,
        success: function(data) {
            if(data.status=='success'){
                layer.msg('删除商品成功!', {icon: 6,time: 2000},function(){ rload();});
            }
            rload();
        }
    });
}
/*加入购物车*/
function addCart(goodsId, cnt, type) {
    if(cnt == 0) {
        layer.alert("购买数量不能为0！");
        return;
    }
    var sp = '';
    var flag = true;
    if($('input[name="goodsSp"]').length > 0){
        $('input[name="goodsSp"]').each(function(){
            if($(this).val() == ''){
                flag =false;
                layer.alert('请选择['+$(this).attr("spname")+']');
                return false;
            }else{
                sp += $(this).attr("spname")+':'+$(this).val() + ',';
            }
        });
    }
    if(sp != ''){
        sp = sp.substring(0,sp.length-1);
    }
    if(flag){
        if(type == 'add'){
            window.location.href = base+"cart/add?gid=" + goodsId + "&cnt=" +cnt + "&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href
        }else if(type=='goBuy'){
            window.location.href = base+"cart/goBuy?gid=" + goodsId + "&cnt=" +cnt + "&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href
        }
    }
}

/**
 * 校验手机号是否被注册
 * @param value
 */
function checkMobiles(){
    var checkMobile = $("#userName").val();
    var state = "1";
    if(!isEmpty(checkMobile)){
        $.ajax({
            type: "post",
            async: false,
            url: base+"member/checkMobile",
            data:{'mobile':checkMobile},
            datatype: 'json',
            error: function () {
            },
            success: function(result) {
                if("success"==result.status){
                    state = "0";
                }
            }
        });
        if(state=="1"){
            $("#showMOB").addClass("Validform_checktip Validform_wrong");
            $("#showMOB").show();
            $("#mob_mess_hide").find("span").eq(1).hide();
            $("#submits").attr("disabled", true);
            return false;
        }
        $("#submits").attr("disabled", false);
    }
}

/**
 * 校验邀请码
 * @param value
 */
function checkInvCode(){
    var invitationCode = $("#invitationCode").val();
    var state = "1";
    if(!isEmpty(invitationCode)){
        $.ajax({
            type: "post",
            async: false,
            url: base+"member/checkInvitCode",
            data:{'invitationCode':invitationCode},
            datatype: 'json',
            error: function () {
            },
            success: function(result) {
                if("success"==result.status){
                    state = "0";
                }
            }
        });
        if(state=="1"){
            $("#showYQM").addClass("Validform_checktip Validform_wrong");
            $("#showYQM").show();
            $("#submits").attr("disabled", true);
            return false;
        }
        $("#submits").attr("disabled", false);
        $("#showYQM").hide();
        $("#showYQMZQ").addClass("Validform_checktip Validform_right");
        $("#showYQMZQ").show();
    }else{
        $("#showYQM").hide();
        $("#submits").attr("disabled", false);
    }
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

/**
 * 数字百分比格式化
 * @param n 保留几位小数
 * @returns {string}
 */
Number.prototype.toPercent = function (n) {
    n = n || 0;
    var result = (Math.round(this * Math.pow(10, n + 2)) / Math.pow(10, n) ).toFixed(n);
    return !isNaN(result) ? result : 0;
}

// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

/**
 * 将价格类数值转成标准价格格式
 * @param price 价格
 */
function priceChangeFormat(price){
    var formatPrice = "￥"+parseFloat(price== undefined ? 0 : price).toFixed(2);
    return formatPrice;
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


/**
 * 校验数字类型，返回正确的数字
 * @param 要校验的数字
 * @param 小数位数
 * @param 不为数字时的默认值
 */
function floatFormat(val, digit, defaultVal){
    val = $.trim(val);
    digit = $.trim(digit);
    defaultVal = $.trim(defaultVal);

    if( typeof(digit) == 'undefined' || intFormat(digit) == '-1'){
        digit = 2;
    }
    digit = parseInt(digit);
    //小数位为0,即为 整数
    if(digit == 0){
        if( val == '' ){
            val = 0;
        }else {
            val = intFormat(val);
        }
    }else{
        if(val != ''){
            if( isNaN( val ) ){
                if( val.indexOf(".") >= 0 ){
                    var array = val.split(".");
                    val = intFormat(array[0]);
                    val += (val == '' ? 0 : '') +".";
                    val += intFormat(array[1]);
                }else{
                    val = intFormat(val);
                }
                val = val=='' ? 0 :val;
            }else{
                if( parseFloat(val) < 0 ){
                    val = -val;
                }
            }
        }else{
            val = 0;
            //赋默认值
            defaultVal += '';
            if( typeof(defaultVal) != 'undefined' && !isNaN(defaultVal) && defaultVal != '' && parseFloat(val) == 0 ){
                val = parseFloat(defaultVal);
            }
        }


        //如果小数位数超出设置，保留设置的小数位数
        val += '';
        if( val.indexOf(".") >= 0 && val.substr(val.indexOf('.')+1).length > digit ){
            val = parseFloat(val).toFixed(digit);
        }
    }

    //不能只输入0
    if( val.length > 1 && parseFloat(val) == 0 && val.indexOf(".") <= 0){
        val = 0;
    }

    return val;
}

/**
 * 判断是不是整数
 * @param val
 * @returns {*}
 */
function intFormat(val){
    if(val.length==1){
        val = val.replace(/[^0-9]/g,'');
    }else{
        val = val.replace(/\D/g,'');
    }
    return val == '' ? '-1' : val;
}

(function($){
    $.fn.extend({
        addClear: function(options) {
            var options =  $.extend({
                closeSymbol: "&#10006;",
                color: "#CCC",
                returnFocus: true,
                showOnLoad: false,
                onClear: null
            }, options);

            $(this).wrap("<span style='position:relative; display: inline-block;' class='add-clear-span'>");
            $(this).after("<a href='#clear'>"+options.closeSymbol+"</a>");
            $("a[href='#clear']").css({
                color: options.color,
                'text-decoration': 'none',
                display: 'none',
                'line-height': 1,
                'padding':0,
                'margin':0,
                overflow: 'hidden',
                border:0,
                height:'14px',
                position: 'absolute',
                top: '50%',
                "margin-top":'-7px'
            }, this);
            if($(this).css("text-align")!="right") {
                if ($(this).val().length >= 1 && options.showOnLoad === true &&  $(this).width() > 30) {
                    $(this).siblings("a[href='#clear']").show();
                    $(this).siblings("a[href='#clear']").css("left", ($(this).outerWidth() - 15) + "px");
                }

                $(this).keyup(function () {
                    if ($(this).val().length >= 1 &&  $(this).width() > 30) {
                        $(this).siblings("a[href='#clear']").show();
                        $(this).siblings("a[href='#clear']").css("left", ($(this).outerWidth() - 15) + "px");
                    } else {
                        $(this).siblings("a[href='#clear']").hide();
                    }
                });

                $(this).focus(function () {
                    if ($(this).val().length >= 1 && $(this).width() > 30) {
                        $(this).siblings("a[href='#clear']").show();
                        $(this).siblings("a[href='#clear']").css("left", ($(this).outerWidth() - 15) + "px");
                    } else {
                        $(this).siblings("a[href='#clear']").hide();
                    }
                });
            }
            $("a[href='#clear']").click(function(){
                $(this).siblings("input").val("");
                $(this).hide();
                if(options.returnFocus === true){
                    $(this).siblings("input").focus();
                }
                if (options.onClear){
                    options.onClear($(this).siblings("input"));
                }
                return false;
            });
            return this;
        }
    });
})(jQuery);