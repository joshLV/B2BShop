function getRootPath(){
    var curWwwPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    var localhostPaht=curWwwPath.substring(0,pos);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}
var base=getRootPath()+'/';

window.pageConfig = window.pageConfig || {},
pageConfig.wideVersion = function() {return screen.width >= 1210;}(),
pageConfig.FN_GetCompatibleData = function(a) {
    var b = screen.width < 1210;
    
    //b=true;
    console.log("base.js使用窄屏"+b);
    
    return b && (a.width = a.widthB ? a.widthB: a.width, a.height = a.heightB ? a.heightB: a.height, a.src = a.srcB ? a.srcB: a.src),a;
};


/*Date: 2014-06-27 */
function login() {
	alert("Login");
	return location.href = base+"member/login?ReturnUrl=" + escape(location.href).replace(/\//g, "%2F");
}
function regist() {
	alert("Regist");
	return location.href = base+"member/register?ReturnUrl=" + escape(location.href).replace(/\//g, "%2F");
}
function addToFavorite() {
	alert("addToFavorite");
	var a = base;
    var b = "微铺电子商务网站";
    if (document.all) {
        window.external.AddFavorite(a, b);
    } else if (window.sidebar) {
        window.sidebar.addPanel(b, a, "");
    } else {
        alert("对不起，您的浏览器不支持此操作!\n请您使用菜单栏或Ctrl+D收藏本站。");
    }
}

$(function () {
	
	//$.browser.mozilla = /firefox/.test(navigator.userAgent.toLowerCase());
	//$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
	//$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
	//$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());
	
	$("img[data-lazyload]").Jlazyload({type: "image",placeholderClass: "err-product"});
	
	//客户服务
	$("#khfw").Jdropdown({delay: 50}, function() {
	    $.ajax({
	        url: base+"index/khfw",
	        dataType: "script",
	        cache: !0
	    });
	});
	
	//导航条
	$("#navitems-2013 li").Jdropdown();
	
	//商品分类
	category.FN_Init();
	
	//购物车
//	if(null != MCART.DATA_Amount){
//		$("#shopping-amount").html(MCART.DATA_Amount);
//	}
	
	$("#settleup-2013 dl").Jdropdown({delay: 200},function() {
		//MCART.FN_Refresh(),
		$("#settleup-url").attr("href", "http://cart.jd.com/cart/cart.html?r=" + +new Date);
	});
	
    
});

var validateRegExp = {
    intege: "^-?[1-9]\\d*$", //整数
    intege1: "^[1-9]\\d*$", //正整数
    intege2: "^-[1-9]\\d*$", //负整数
    num: "^([+-]?)\\d*\\.?\\d+$", //数字
    num1: "^[1-9]\\d*|0$", //正数（正整数 + 0）
    num2: "^-[1-9]\\d*|0$", //负数（负整数 + 0）
    ascii: "^[\\x00-\\xFF]+$", //仅ACSII字符
    chinese: "^[\\u4e00-\\u9fa5]+$", //仅中文
    date: "^\\d{4}(\\-|\\/|\.)\\d{1,2}\\1\\d{1,2}$", //日期
    email: "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$", //邮件
    letter: "^[A-Za-z]+$", //字母
    letter_l: "^[a-z]+$", //小写字母
    letter_u: "^[A-Z]+$", //大写字母
    mobile: "^0?(13|15|18|14)[0-9]{9}$", //手机
    notempty: "^\\S+$", //非空
    password: "^.*[A-Za-z0-9\\w_-]+.*$", //密码
    fullNumber: "^[0-9]+$", //数字
    tel: "^[0-9\-()（）]{7,18}$", //电话号码的函数(包括验证国内区号,国际区号,分机号)
    url: "^http[s]?:\\/\\/([\\w-]+\\.)+[\\w-]+([\\w-./?%&=]*)?$", //url
    username: "^[A-Za-z0-9_\\-\\u4e00-\\u9fa5]+$" //用户名
};

function strTrim(str) {
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

//验证规则
var validateRules = {
	isNull: function (str) {
		return (str == "" || typeof str != "string");
	},
	betweenLength: function (str, _min, _max) {
	    return (str.length >= _min && str.length <= _max);
	},
	isUid: function (str) {
	    return new RegExp(validateRegExp.username).test(str);
	},
	fullNumberName: function (str) {
	    return new RegExp(validateRegExp.fullNumber).test(str);
	},
	isEmail: function (str) {
	    return new RegExp(validateRegExp.email).test(str);
	},
	isTel: function (str) {
	    return new RegExp(validateRegExp.tel).test(str);
	},
	isMobile: function (str) {
	    return new RegExp(validateRegExp.mobile).test(str);
	},
	checkType: function (element) {
	    return (element.attr("type") == "checkbox" || element.attr("type") == "radio" || element.attr("rel") == "select");
	}
};

Function.prototype.overwrite = function(f) {
    var result = f;
    if (!result.original) {
        result.original = this;
    }
    return result;
};
Date.prototype.toString = Date.prototype.toString.overwrite(function(format) {
    var result = new String();
    if (typeof (format) == "string") {
        result = format;
        result = result.replace(/yyyy|YYYY/, this.getFullYear());
        result = result.replace(/yy|YY/, this.getFullYear().toString().substr(2, 2));
        result = result.replace(/MM/, this.getMonth() >= 9 ? this.getMonth() + 1 : "0" + (this.getMonth() + 1));
        result = result.replace(/M/, this.getMonth());
        result = result.replace(/dd|DD/, this.getDate() > 9 ? this.getDate() : "0" + this.getDate());
        result = result.replace(/d|D/, this.getDate());
        result = result.replace(/hh|HH/, this.getHours() > 9 ? this.getHours() : "0" + this.getHours());
        result = result.replace(/h|H/, this.getHours());
        result = result.replace(/mm/, this.getMinutes() > 9 ? this.getMinutes() : "0" + this.getMinutes());
        result = result.replace(/m/, this.getMinutes());
        result = result.replace(/ss|SS/, this.getSeconds() > 9 ? this.getSeconds() : "0" + this.getSeconds());
        result = result.replace(/s|S/, this.getSeconds());
    }
    return result;
});
String.prototype.format = function() {
    var result = this;
    if (arguments.length > 0) {
        parameters = $.makeArray(arguments);
        $.each(parameters,function(i, n) {
		    result = result.replace(new RegExp("\\{" + i + "\\}", "g"), n);
		});
    }
    return result;
};
function StringBuilder() {
    this.strings = new Array();
    this.length = 0;
}
StringBuilder.prototype.append = function(string) {
    this.strings.push(string);
    this.length += string.length;
};
StringBuilder.prototype.toString = function(start, length) {
    return this.strings.join("").substr(start, length);
};

var weakPwdArray = ["123456","123456789","111111","5201314","12345678","123123","password","1314520","123321","7758521","1234567","5211314","666666","520520","woaini","520131","11111111","888888","hotmail.com","112233","123654","654321","1234567890","a123456","88888888","163.com","000000","yahoo.com.cn","sohu.com","yahoo.cn","111222tianya","163.COM","tom.com","139.com","wangyut2","pp.com","yahoo.com","147258369","123123123","147258","987654321","100200","zxcvbnm","123456a","521521","7758258","111222","110110","1314521","11111111","12345678","a321654","111111","123123","5201314","00000000","q123456","123123123","aaaaaa","a123456789","qq123456","11112222","woaini1314","a123123","a111111","123321","a5201314","z123456","liuchang","a000000","1314520","asd123","88888888","1234567890","7758521","1234567","woaini520","147258369","123456789a","woaini123","q1q1q1q1","a12345678","qwe123","123456q","121212","asdasd","999999","1111111","123698745","137900","159357","iloveyou","222222","31415926","123456","111111","123456789","123123","9958123","woaini521","5201314","18n28n24a5","abc123","password","123qwe","123456789","12345678","11111111","dearbook","00000000","123123123","1234567890","88888888","111111111","147258369","987654321","aaaaaaaa","1111111111","66666666","a123456789","11223344","1qaz2wsx","xiazhili","789456123","password","87654321","qqqqqqqq","000000000","qwertyuiop","qq123456","iloveyou","31415926","12344321","0000000000","asdfghjkl","1q2w3e4r","123456abc","0123456789","123654789","12121212","qazwsxedc","abcd1234","12341234","110110110","asdasdasd","123456","22222222","123321123","abc123456","a12345678","123456123","a1234567","1234qwer","qwertyui","123456789a","qq.com","369369","163.com","ohwe1zvq","xiekai1121","19860210","1984130","81251310","502058","162534","690929","601445","1814325","as1230","zz123456","280213676","198773","4861111","328658","19890608","198428","880126","6516415","111213","195561","780525","6586123","caonima99","168816","123654987","qq776491","hahabaobao","198541","540707","leqing123","5403693","123456","123456789","111111","5201314","123123","12345678","1314520","123321","7758521","1234567","5211314","520520","woaini","520131","666666","RAND#a#8","hotmail.com","112233","123654","888888","654321","1234567890","a123456"];
