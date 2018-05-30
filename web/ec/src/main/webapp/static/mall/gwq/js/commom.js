

$(function(){
	var rMenu = $(".r_menu ul .s_li");
	var rSlide = $(".r_menu .sliBox");
	var rIndex;
	rMenu.hover(function(){
		rIndex = rMenu.index($(this));
			rSlide.eq(rIndex).stop().animate({right:"50px"},250);
	},function(){
			if( $(this).attr("class").indexOf("wx") >= 0 ){
				rSlide.eq(rIndex).stop().animate({right:"-260px"},250);
			}else{
				rSlide.eq(rIndex).stop().animate({right:"-150px"},250);
			}
	})
	rSlide.hover(function(){
		$(this).stop().animate({right:"50px"},300);
	},function(){
		if( $(this).attr("class").indexOf("wxBox") >= 0 ){
			$(this).stop().animate({right:"-260px"},300);
		}else{
			$(this).stop().animate({right:"-150px"},300);
		}
	})
	
	/*下一屏-上一屏*/
	$(".r_menu .up").click(function(){
		$('html,body').animate({scrollTop:0},2000);
	})
	$(".r_menu .down").click(function(){
		$('html,body').animate({scrollTop:$('footer').offset().top},2000);
	})
	


	/*收起菜单*/
	var rBox = $(".r_menu ul");
	var rClose = $(".r_menu .close")
	rClose.click(function(){
		if(rBox.css("right")=="0px"){
			rBox.stop().animate({right:"-50px"});
			rClose.css("background","url("+base+"/static/mall/gwq/img/icons.png) -32px -640px no-repeat")
		}else{
			rBox.stop().animate({right:"0px"});
			rClose.css("background","url("+base+"/static/mall/gwq/img/icons.png) 0px -640px no-repeat")
		}
		
	})




})