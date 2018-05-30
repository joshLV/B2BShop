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
	
	//客户服务
	$("#khfw").Jdropdown({delay: 50}, function() {
	    $.ajax({
	        url: base+"khfw",
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
	
	
    
});
