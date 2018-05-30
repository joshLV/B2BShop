// JavaScript Document
$(function(){
	'use strict';
	var navon=$(".navinfo .on");
	$(".navinfo li").mouseover(function() {
        navon.removeClass("on");
    }).mouseout(function() {
        navon.addClass("on");
    });
});