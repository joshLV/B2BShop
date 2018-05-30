// JavaScript Document
$(function(){
	'use strict';
	$(".menu").mouseover(function(){
		$(this).find(".menu-list").show();
	}).mouseout(function() {
        $(this).find(".menu-list").hide();
    });

	$(".cart").mouseover(function() {
    	$("#cartinfo").show();
		$(".shoppingcart").addClass("shoppingcart2");
		$(".cart,#cartinfo").addClass("shadow");    
    }).mouseout(function() {
        $("#cartinfo").hide();
		$(".shoppingcart").removeClass("shoppingcart2");
		$(".cart,#cartinfo").removeClass("shadow");
    });
	$("#cartinfo").on('click','.del',function(){
		$(this).parents(".goods").remove();
	});
});
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

function Linkto(url){
	window.location.href=url;
}
function reloadWeb(){
	window.location.reload();
}
function closeWeb(){
	if (navigator.userAgent.indexOf("MSIE") > 0) {  
		if (navigator.userAgent.indexOf("MSIE 6.0") > 0) {  
			window.opener = null; window.close();  
		}  
		else {  
			window.open('', '_top'); window.top.close();  
		}  
	}  
	else if (navigator.userAgent.indexOf("Firefox") > 0) {  
		window.location.href = 'about:blank '; 
	}  
	else {  
		window.opener = null;   
		window.open('', '_self', '');  
		window.close();  
	}  
}