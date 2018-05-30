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
    return b && (a.width = a.widthB ? a.widthB: a.width, a.height = a.heightB ? a.heightB: a.height, a.src = a.srcB ? a.srcB: a.src),a;
};


/*Date: 2014-06-27 */
function login() {
	return location.href = base+"member/login?ReturnUrl=" + escape(location.href).replace(/\//g, "%2F");
}
function regist() {
	return location.href = base+"member/register?ReturnUrl=" + escape(location.href).replace(/\//g, "%2F");
}
function registAPP() {
	return location.href = base+"member/register?whichclient=whichapp";
}
function addToFavorite() {
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
	//
	//客户服务
	/*$("#khfw").Jdropdown({delay: 50}, function() {
	    $.ajax({
	        url: base+"khfw",
	        dataType: "script",
	        cache: !0
	    });
	});*/
	
	//导航条
	//$("#navitems-2013 li").Jdropdown();
	
	//商品分类
	//category.FN_Init();
	
	//购物车
//	if(null != MCART.DATA_Amount){
//		$("#shopping-amount").html(MCART.DATA_Amount);
//	}
	
	
    
});


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