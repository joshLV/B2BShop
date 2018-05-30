
 /**
  * 返回text文本数据
  * @param url
  * @param param
  * @param successDivId
  * @param messageDivId
  * @return
  */
function callText(url,param,successDivId,messageDivId){
	return call("text",url,param,successDivId,messageDivId);
}

/**
  * 返回json数据
  * @param url
  * @param param
  * @param successDivId
  * @param messageDivId
  * @return
  */
 function callJson(url, param, successDivId, messageDivId) {
     return call("json", url, param, successDivId, messageDivId);
 }
 /**
 * 订单异步操作请求服务器Call
 * @param actionType 请求参数类型
 * @param url
 * @param param
 * @param successDivId
 * @param messageDivId
 */
function call(callType,url,param,successDivId,messageDivId){
	var isReturn = true;
	var isSuccess = false;
	var result = null;
	if(url.indexOf("?") == -1){
		url = url + "?rid="+Math.random();
	}
	else{
		url = url + "&rid="+Math.random();
	}
	jQuery.ajax({ 
		type : "POST",
		dataType : callType,
		url : url,
		data : param,
		async: false,
		success : function(dataResult,textStatus) {
		    //服务器返回异常处理,如果有消息div则放入,没有则弹出
			if(textStatus == 5000){
				if(messageDivId != null){
					isReturn = false;
				    $("#"+messageDivId).html(dataResult);
				}else{
					//alert(dataResult);
					layer.alert(dataResult, {icon: 7});
					isReturn = false;
				}
			}
			//成功后如果有divID直接放入div，没有则返回结果
			else{
				if(successDivId != null){
					isReturn = false;
					$("#"+successDivId).html(dataResult);
					isSuccess = true;
				}
				else{
					result =  dataResult;
				}
			}
		},
		error:function(XMLHttpResponse){
			//alert("系统繁忙，请稍后再试！");
			layer.alert("系统繁忙，请稍后再试！", {icon: 7});
			return false;
		}
	});
	//如果没有处理结果则返回
	if(isReturn){
	   return result;
	}
	//如果div成功赋值后则返回ture
	if(isSuccess){
		return true;
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
		value = value.replace(/\s/g,"");
		if(value == ""){
			return true;
		}
		return false;
	}
}

/**
 * 判断是否是数字
 */
function isNumber(value){
	if(isNaN(value)){
		return false;
	}
	else{
		return true;
	}
}

/**
 * 只包含中文和英文
 * @param cs
 * @returns {Boolean}
 */
function isGbOrEn(value){
    var regu = "^[a-zA-Z\u4e00-\u9fa5]+$";
    var re = new RegExp(regu);
    if (value.search(re) != -1){
      return true;
    } else {
      return false;
    }
}

/**
 * 检查邮箱格式
 * @param email
 * @returns {Boolean}
 */
function check_email(email){  
   if(email){
   var myReg=/(^\s*)\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*(\s*$)/;
   if(!myReg.test(email)){return false;}
   return true;
   }
   return false;
}

/**
 * 检查手机号码
 * @param mobile
 * @returns {Boolean}
 */
function check_mobile(mobile){
  var regu = /^\d{11}$/;
  var re = new RegExp(regu);
  if(!re.test(mobile)){
	 return  false;
  }
  return true;
}

/**
 * 验证电话号码，带"(,),-"字符和数字其他不通过
 * @param str
 * @returns {Boolean}
 */
function checkPhone(str){
   if(str.length > 20){
    return false;
   }
   var patternStr = "(0123456789-)";
   var  strlength=str.length; 
   for(var i=0;i<strlength;i++){ 
        var tempchar=str.substring(i,i+1); 
		if(patternStr.indexOf(tempchar)<0){
		    return false;
		}
   } 
   return true ; 
}

 //订单提交页-验证邮政编码
 function is_postcode(postcode) {
	 if ( postcode == "") {
		 return false;
	 } else {
		 if (! /^[0-9][0-9]{5}$/.test(postcode)) {
			 return false;
		 }
	 }
	 return true;
 }

 /**
 * 验证银行账户，带"(, ),-"字符和数字其他不通过
 * @param str
 * @returns {Boolean}
 */
function checkBankCount(str){
   if(str.length > 50){
    return false;
   }
   var patternStr = "(0123456789- )";
   var  strlength=str.length; 
   for(var i=0;i<strlength;i++){ 
        var tempchar=str.substring(i,i+1); 
		if(patternStr.indexOf(tempchar)<0){
		    return false;
		}
   } 
   return true ; 
}

//正则
function trimTxt(txt){
 return txt.replace(/(^\s*)|(\s*$)/g, "");
}
/**
 * 检查是否含有非法字符
 * @param temp_str
 * @returns {Boolean}
 */
function is_forbid(temp_str){
    temp_str=trimTxt(temp_str);
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
 * 检查数量
 * @param txtObj
 * @returns {Number}
 */
function checkLength(txtObj){
	var val=txtObj;
	var valLength=0;
	for(var ii=0;ii<val.length;ii++){
		var word=val.substring(ii,1);
		if(/[^\x00-\xff]/g.test(word)){
			valLength+=2;
		}else{
			valLength++;
		}
	}
	return valLength;
}
/**
 * 配置公共参数
 * @returns {OrderAppConfig}
 */
function OrderAppConfig(){
}
OrderAppConfig.Domain = "http://trade.jd.com";
OrderAppConfig.DynamicDomain = "http://trade.jd.com/dynamic";
OrderAppConfig.AsyncDomain = "http://trade.jd.com/async";
OrderAppConfig.LoginUrl = "http://passport.jd.com/new/login.aspx?ReturnUrl="+OrderAppConfig.Domain+"/order/getOrderInfo.action";
OrderAppConfig.LoginLocUrl = "http://passport.jd.com/new/login.aspx?ReturnUrl="+OrderAppConfig.Domain+"/order/getLocOrderInfo.action";
OrderAppConfig.Module_Consignee = "consignee";
OrderAppConfig.Module_PayAndShip = "payment-ship";
OrderAppConfig.Module_Shipment = "shipment";
OrderAppConfig.Module_Coupon = "coupons";
OrderAppConfig.Module_GiftCard = "gift";
OrderAppConfig.Module_GiftECard = "ecard";
OrderAppConfig.Module_Invoice = "part-invoice";
OrderAppConfig.Module_SkuList="span-skulist";
/**
 * 从url里获取对应参数值
 * @param paramName
 * @returns {String}
 */
function getParam(paramName)
{
    var paramValue = "";
    isFound = false;
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=")>1)
    {
        arrSource = unescape(this.location.search).substring(1,this.location.search.length).split("&");
        i = 0;
        while (i < arrSource.length && !isFound)
        {
            if (arrSource[i].indexOf("=") > 0)
            {
                 if (arrSource[i].split("=")[0].toLowerCase()==paramName.toLowerCase())
                 {
                    paramValue = arrSource[i].split("=")[1];
                    isFound = true;
                 }
            }
            i++;
        }   
    }
	return paramValue;
}


/**
 * Get the value of a cookie with the given name.
 *
 * @example $.jCookie('the_cookie');
 * @desc Get the value of a cookie.
 *
 * @param String name The name of the cookie.
 * @return The value of the cookie.
 * @type String
 *
 * @name $.jCookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 * 
 * @modifiedBy jizhou
 * @modifiedDate 2012/1/6
 * @modifiedDesciption 遇到中文用escape和unescape进行转码和解码,为了和.net存入cookie的中文保持一致
 */
jQuery.jCookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set coX��V`�Et��K%\R�^���˦�2���Ei.i���jS�7�r�~�Y�X���ڞ�������c��D�R�ߔ��à;9g��iyT���+�7��ͩ��{`�!���#�`*ѓ�L4�#��S��d�q���l�	̋S�}�,`6�x�TR��=mM%��9U�7F��~+Ϥl,df�Se��>E�0�e;a�&��>s�B�:�0�p���(�<�v�^�8�	��@���`�	���LQ��\�UJ��w9!�V}if�:�Q������z�C[��lA8�u%�K�@�9@���V>e��� ��e �QB�2�Njr�?�`+�,�l
 !����&����zt�C�'�H�Ĩ���mn�r��¶�.p���y}�aE�K���K)�^꾌���G�
�tÕ��*�չ?	���0������B��JIBVe�We�aUvV�����gM�-�����\� .��H���#�x]J�M)�2� � y�$(R&'fH7.�cVڠ��E0��u��*���;�)��s��cp��.(�Y��������څ�$��ki��ܔ��,m*�X�*3��J�́Q�\�)�`�2�S��"�ͼ9�K��1+�-O+����\�z��#��:
��э��W����=IB]H.&/$�A?e9�����r�V�� �޸-�����b���3������C��+�P.q�Q�U������ۥ��z/�u���0N����:R���Ki ��D���&��f�d';�S�a��8��2.�ʡ�߾Y��(��т�I�ΏK���n��a�q�\�-9
�x]_�~Z�N�n�;�^�,<wv� ͒v��ǽKWޑ�Q�ry�����^@܁BFi�s�H2m$�-t����*[a���);`�r	�W����B�V+��:�*X�\��k%>�)=+���T�Y�c�BJB'��|��K/c��b�'`�YڡH��T�$��1��y4F�����w�ڿ�앿�đ�����]�)/��=��-J��a��*2�=:v�R��o����*�D�g�Z���_s��=������5ѽ��~��-�Vv�C�Cq�6�	�S,��P��{a��֒�lP�C�� lQ��Cp��0ܬ<j��o�'`]þE�*p��.c����]V�V�����S2I��K-t�hL��&�{�k�����<@�>H����$fT��)j������삂U���y���G������^&���rgi���W�����0@9@@=A�IR��0@y����Q�%v�*�`��L����a�r�T�4*/� ���Xk��P�����p��W���~c��t�q0����u�:\G��3	 ^o9�,�k��sL8�������z��Je�R��N< SJ��'V�t࠼ڇ�W��I
y+���_�2����}�S���_&�KdLL�𲐥�N)ŏ�������"�|����P�������|��p!ͯT�!5��Dd�;�|�R�Ĺ��f���oěh���@�*�գ�����N���>�����P��}����0��~Jv��O�N�����>w7u:A�%����RV$��R����#�:�P�-�|�w