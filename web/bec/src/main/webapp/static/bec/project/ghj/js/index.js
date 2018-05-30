// JavaScript Document
$(function(){
	'use strict';
	$("#kinMaxShow").kinMaxShow({
		height:'450',
		intervalTime: '3',
		imageAlign:'center center',
		button:{
			showIndex:false,
			normal:{background:'url('+base+'/static/bec/project/ghj/img/button.png) no-repeat -14px 0', width:'14px', height:'14px',marginRight:'9px',border:'0',right:'50%',bottom:'25px'},
			focus:{background:'url('+base+'/static/bec/project/ghj/img/button.png) no-repeat 0 0',border:'0'}
		}
	});
	$(".tabbtn").click(function() {
		var id=$(this).attr("link");
        $(".tabbtn").removeClass("active");
		$(this).addClass("active");
		$(".tab:visible").hide();
		$(id).delay(100).show();
    });
	$($(".tabbtns .active").attr("link")).fadeIn();
});
function hello(){
	var now,hour;
	now = new Date();
	hour = now.getHours(); 
	if(hour < 6){document.write("凌晨好！");} 
	else if (hour < 9){document.write("早上好！");} 
	else if (hour < 12){document.write("上午好！");} 
	else if (hour < 14){document.write("中午好！");} 
	else if (hour < 17){document.write("下午好！");} 
	else if (hour < 19){document.write("傍晚好！");} 
	else if (hour < 22){document.write("晚上好！");} 
	else {document.write("夜里好！");} 
}