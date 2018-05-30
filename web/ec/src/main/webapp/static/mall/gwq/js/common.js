// JavaScript Document
$(function(){
	$("#keyword").focus(function(e) {
		if($(this).val()=="搜一搜"){
        	$(this).val("");
			$(this).css("color","#000000");
		}
    }).blur(function(e) {
        if($(this).val()==""){
			$(this).val("搜一搜");
			$(this).css("color","#d4d4d4");
		}
    });	
	$(".nav li").mouseover(function(e) {
		var left=($(this).width())/2-5;
		$(this).find(".jt").css("left",left+"px");
        $(this).find(".menu").show();
		$(this).find(".jt").show();
    }).mouseout(function(e) {
        $(this).find(".menu").hide();
		$(this).find(".jt").hide();
    });;
});