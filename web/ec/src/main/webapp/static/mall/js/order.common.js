
 /**
  * è¿”å›textæ–‡æœ¬æ•°æ®
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
  * è¿”å›jsonæ•°æ®
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
 * è®¢å•å¼‚æ­¥æ“ä½œè¯·æ±‚æœåŠ¡å™¨Call
 * @param actionType è¯·æ±‚å‚æ•°ç±»å‹
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
		    //æœåŠ¡å™¨è¿”å›å¼‚å¸¸å¤„ç†,å¦‚æœæœ‰æ¶ˆæ¯divåˆ™æ”¾å…¥,æ²¡æœ‰åˆ™å¼¹å‡º
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
			//æˆåŠŸåå¦‚æœæœ‰divIDç›´æ¥æ”¾å…¥divï¼Œæ²¡æœ‰åˆ™è¿”å›ç»“æœ
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
			//alert("ç³»ç»Ÿç¹å¿™ï¼Œè¯·ç¨åå†è¯•ï¼");
			layer.alert("ç³»ç»Ÿç¹å¿™ï¼Œè¯·ç¨åå†è¯•ï¼", {icon: 7});
			return false;
		}
	});
	//å¦‚æœæ²¡æœ‰å¤„ç†ç»“æœåˆ™è¿”å›
	if(isReturn){
	   return result;
	}
	//å¦‚æœdivæˆåŠŸèµ‹å€¼ååˆ™è¿”å›ture
	if(isSuccess){
		return true;
	}
}

/**
 * åˆ¤æ–­æ˜¯å¦æ˜¯ç©º
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
 * åˆ¤æ–­æ˜¯å¦æ˜¯æ•°å­—
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
 * åªåŒ…å«ä¸­æ–‡å’Œè‹±æ–‡
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
 * æ£€æŸ¥é‚®ç®±æ ¼å¼
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
 * æ£€æŸ¥æ‰‹æœºå·ç 
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
 * éªŒè¯ç”µè¯å·ç ï¼Œå¸¦"(,),-"å­—ç¬¦å’Œæ•°å­—å…¶ä»–ä¸é€šè¿‡
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

 //è®¢å•æäº¤é¡µ-éªŒè¯é‚®æ”¿ç¼–ç 
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
 * éªŒè¯é“¶è¡Œè´¦æˆ·ï¼Œå¸¦"(, ),-"å­—ç¬¦å’Œæ•°å­—å…¶ä»–ä¸é€šè¿‡
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

//æ­£åˆ™
function trimTxt(txt){
 return txt.replace(/(^\s*)|(\s*$)/g, "");
}
/**
 * æ£€æŸ¥æ˜¯å¦å«æœ‰éæ³•å­—ç¬¦
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
 * æ£€æŸ¥æ•°é‡
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
 * é…ç½®å…¬å…±å‚æ•°
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
 * ä»urlé‡Œè·å–å¯¹åº”å‚æ•°å€¼
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
 * @modifiedDesciption é‡åˆ°ä¸­æ–‡ç”¨escapeå’Œunescapeè¿›è¡Œè½¬ç å’Œè§£ç ,ä¸ºäº†å’Œ.netå­˜å…¥cookieçš„ä¸­æ–‡ä¿æŒä¸€è‡´
 */
jQuery.jCookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set coX•æ•V`½Et¾K%\R©^‘€‡Ë¦ê2©ÊŞEi.iµíõjSé7¦rá~ëY÷X“¶ÇÚ÷¤î±ö¸ïßØc­D³RÀß”ºÅÃ ;9g¬Çiyî†¦Tø¿–+Œ7ö Í©¤º{`¯!íŠĞØ#Ñ`*Ñ“çL4Ğ#˜›SÁ¤dËq¦Â›ÒÀlê	Ì‹S™}ã,`6÷xî–TRïœó¹ƒ=mM%úş9Uø7F‹è~+Ï¤l,dfªSe€ä>E‹0…e;a£&ÏÌ>sÌBÓ:®0ñp—åÊ(Ë<Ïvø^’8ş	Š¢@¶¢Â`Å	ÃŠÊLQ²¡\éUJ®Íw9!ŠV}ifÂ:ÿQÅ÷¥–ÕzC[½÷lA8íu%„Kä@9@ı’V>e¨ÑÄ ¯ô‡e ôQB2ÈNjrÈ?·`+­,€l
 !‰ÃØ&±ô¤•ztşC‹'ºHËÄ¨ªäĞmn«r¸Â¶º.pº·×y}ÇaEáKÜßê†K)¢^ê¾Œš÷åGá
êtÃ•Çà*ÄÕ¹?	”áá0”‘¯Œ†BÅ•JIBVe³WeçaUvV•–‡éügMË-Œƒ½î«ñ\ã .¯©H¸í®­#‡x]J¥M)—2 œ yÊ$(R&'fH7.ècVÚ ˆèE0šäuş«*‹‡è;)§sˆcp½€.(µYª£¤£¢¤íÚ…¥$Ö½kiïÜ”ˆ˜,m*å„Xä*3ˆ·J¤ÌQÊ\ğ)ó`œ2ÎSØè"ÇÍ¼9ˆKä—1+·-O+Ÿéü—\çz¼î›“Ğ#áï:
»ÖÑŒ’Wºõƒ=IB]H.&/$—A?e9±ºÂ†±ˆÀráVÉÌ ĞŞ¸-™‘¸İbæ¢Ë3ãÌÒÙÍÆCÔÉ+ğ•P.qËQ¸U¢Õ¹åıüÛ¥±‚z/Úu¸Íá0N›”µâ:R»õĞKi ÒDÖ€Ê&²ŞfÀd';ˆS†aœÛ8»†2.íÊ¡óß¾Y¹ê(ëÊÑ‚µIÒÎKÛın¸aõqØ\á-9
ıx]_¶~Z×Nënï†;è^­,<wvÂ Í’v×ÚÇ½KWŞ‘§Qæry„°ÖÙç^@ÜBFi¡s‡H2m$•-tö»Æ*[a’²¦);`–r	ÌW¾µÊå°B¹V+×À:å*X¯\›•k%>ó)=+¢ÄÌT°YÔcßBJB'¿„|‹ÖK/c¢×b¡'`³YÚ¡H³ÁTÉ$ô¼1ÃÁy4Fæ»ÃİñwÖÚ¿˜ì•¿˜Ä‘•¨İı]Â)/™Ó=´„-JªÇa¸·*2€=:v¹R¤¸o§ïöÑ*¾DÜgé•Z®şŸ_s‰Ó=Ğ×Á¶ß5Ñ½‰ô~™æ-àVv“CÛCqá6Š	·S,¸“P½ê”{a©²Ö’÷lPöC“ò lQ„ÊCpò0Ü¬<j£›oá'`]Ã¾Eè*p³….c¶ËÖÈ]V¦V–™—ÃS2IèÆK-t³hL£™&¯{Šk¼¿Şç¾ü<@€>Hı¡…ä$fTºá‘)jš÷ıàì‚‚UìÿúyÏêê†G»¾ş¡üØ^&Âçáñrgi‘³¾WäŒûØÙä0@9@@=AâIRÃÃ0@yŠÌïŒQ%v¦*Ï`ÏÃLå©à°a¹ršTğ4*/Ù û¶ûXkùãP‹—áå´Ûp˜ƒWà•¤~c ¯Âtäq0¯•·©u”:\G©ƒ3	 ^o9œ,õkä°æsL8êÜû»áûêz£ç†JeŠR øN< SJò£'Vîtà ¼Ú‡ W‰ûI
y+óôÊ_2ûƒÌ}¶SÁ®¯_&ÜKdLLòğ²¥¼N)Å ¿òæ›äÙß"ã|›ŒóÇP¡ü„âãÏà|åçp!Í¯TŞ!5ú…Ddñ;ˆ|úR¸Ä¹­f¥²¡oÄ›h¯ş°@Ş*“Õ£¯íû¿´N¿Åë>˜ìû»áP­Ï}˜’½0Úç~JvûÜOËNÏıŒì>w7u:Aõ%ª«ÒÂRV$‚ÎR¤œ…é#í:˜PÊ-§|”w