// cnool基本功能js
jQuery(document).ready(function($) {
	    //tab页
	    
		settabs('01');
		settabs('02');
		settabs('03');
		settabs('20');
		//settabs('21');
		settabsrandom21('activitydiv');
		//settabs('homebookmenu02');
		//settabs('homebookmenu03');
		//settabs('homebookmenu04');
		//settabs('homebookmenu05');
		//settabs('homebookmenu06');
		//settabs('homebookmenu07');
                //settabs('function');
                //settabsrandom('function');
		//setsearchtab();
		//setweather(0);

        //setstat();

    //$("#scrollDiv").textSlider({line:4,speed:500,timer:5000});
		 
		 t = setInterval('playnext(20)', 4000);
		 
		  $("div.homeBook-body20 a").mouseover(function() {
                clearInterval(t);
          
            });	
        $("div.homeBook-body20 a").mouseout(function() {
                t = setInterval('playnext(20)', 4000);
            });
            
           t1 = setInterval('playnext("03")', 4000);

			$("#nature201101").mouseover(function() {
                clearInterval(t1);
				//alert($("#homeBook-menu03+div>div").html());
          
            });	
			$("#nature201101").mouseout(function() {
                t1 = setInterval('playnext("03")', 4000);
            });

			
			$("#nature201102").mouseover(function() {
                clearInterval(t1);
				//alert($("#homeBook-menu03+div>div").html());
          
            });	
			$("#nature201102").mouseout(function() {
                t1 = setInterval('playnext("03")', 4000);
            });

			$("#homeBook-menu03 H2.homemenutitle SPAN").mouseover(function() {
                clearInterval(t1);
				//alert($("#homeBook-menu03+div>div").html());
          
            });		
    })
	function settabs(divid)
	{
	    //
	
		$("#homeBook-menu"+divid + " H2.homemenutitle SPAN:first").addClass("on");
		$("#homeBook-menu"+divid + " div.homemenubody:gt(0)").hide();
		//alert($("#"+divid + " H2.homemenutitle SPAN").html());
		$("#homeBook-menu"+divid + " H2.homemenutitle SPAN").mouseover(function(){
			//alert('aa');
			$(this).addClass("on").siblings(" H2.homemenutitle SPAN").removeClass();
			//alert($(this).index());
			//alert($(".homeBook-body"+divid+":eq("+$(this).index()+")").html());
			$("div.homeBook-body"+divid+":eq("+$(this).index()+")").show().siblings("div.homeBook-body"+divid).hide();
		});
	}
	
	// 播放图片的函数
//	var imgPlay = function() {
//		next = curr + 1;
//                // 若当前图片播放到最后一张，这设置下一张要播放的图片为第一张图片的下标
//		if(curr == count-1) next=0;
//		play(next);
// 
//		curr++;
//                // 在当前图片的下标加1后，若值大于最后一张图片的下标，则设置下一轮其实播放的图片下标为第一张图片的下标，而next永远比curr大1
//		if(curr > count-1) { curr=0; next = curr +1; }
//	};
	
    function playnext(divid)
	{
		//$("#homeBook-menu"+divid + " H2.homemenutitle SPAN:first").addClass("on");
		//$("#homeBook-menu"+divid + " div.homemenubody:gt(0)").hide();
		//alert($("#"+divid + " H2.homemenutitle SPAN").html());
		//$("#homeBook-menu"+divid + " H2.homemenutitle SPAN").mouseover(function(){
			//alert('aa');
		var length = $("#homeBook-menu"+divid + " H2.homemenutitle SPAN").length;
		var index = $("#homeBook-menu"+divid + " H2.homemenutitle SPAN[class='on']").index();
		var newindex = index + 1;
		if(newindex == length) newindex =0;
		
		//alert(newindex + ","+index);
		$("#homeBook-menu"+divid + " H2.homemenutitle SPAN:eq("+newindex+")").addClass("on").siblings(" H2.homemenutitle SPAN").removeClass();
		$(".homeBook-body"+divid+":eq("+newindex+")").show().siblings("div.homeBook-body"+divid).hide();
			//$(this).addClass("on").siblings(" H2.homemenutitle SPAN").removeClass();
			//alert($(this).index());
			//alert($(".homeBook-body"+divid+":eq("+$(this).index()+")").html());
			
		//});
	}		
	function settabsrandom(divid)
	{
	    //获取总数-1
        var licount = $("#"+divid + " H2.homemenutitle SPAN").length -1;
        //获取随机数
	    var i =Math.round(Math.random()*licount);
		//$("#"+divid + " ul.homemenutitle li:last").addClass("on");
		//$("#"+divid + " div.homemenubody:gt(0)").hide();
		$("#"+divid + " H2.homemenutitle SPAN:eq("+i+")").addClass("on").siblings(" H2.homemenutitle SPAN").removeClass();
        $("#"+divid + " div.homemenubody:eq("+i+")").show().siblings("div.homemenubody").hide();
		
		$("#"+divid + " H2.homemenutitle SPAN").mouseover(function(){
			$(this).addClass("on").siblings(" H2.homemenutitle SPAN").removeClass();
			$("#"+divid + " div.homemenubody:eq("+$(this).index()+")").show().siblings("div.homemenubody").hide();
		});
	}

    function settabsrandom21(divid) {
        //获取总数-1
        var licount = $("#"+divid + " H2.homemenutitle SPAN").length -1;
        //获取随机数
	    var i =Math.round(Math.random()*licount);
		//$("#"+divid + " ul.homemenutitle li:last").addClass("on");
	    //$("#" + divid + " div.homeBook-body21:gt(0)").hide();
		$("#"+divid + " H2.homemenutitle SPAN:eq("+i+")").addClass("on").siblings(" H2.homemenutitle SPAN").removeClass();
		$("#" + divid + " div.homeBook-body21:eq(" + i + ")").show().siblings("div.homeBook-body21").hide();
		
		$("#"+divid + " H2.homemenutitle SPAN").mouseover(function(){
			$(this).addClass("on").siblings(" H2.homemenutitle SPAN").removeClass();
			$("#"+divid + " div.homeBook-body21:eq("+$(this).index()+")").show().siblings("div.homeBook-body21").hide();
        });
    }
    function mousePosition(ev)
    {
        if(ev.pageX || ev.pageY)
        {
            return {x:ev.pageX, y:ev.pageY};
        }
        
        yScroll1 = document.body.scrollTop;
        yScroll2 = document.body.clientTop
        
       if(yScroll1 == 0)
       {
            yScroll1 = document.documentElement.scrollTop;
            yScroll2 = document.documentElement.clientTop;
       }
      
        return {x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,y:ev.clientY + yScroll1  - yScroll2};
    }
    
    function closediv()
    {
        if($("#id_menu_profile").html() != null)
　      {
　          $("#id_menu_profile").remove();
　      }
    }
    
    function setstat()
	{
		$("a").click(function(){
		    var newsid = $(this).attr("id");

		    if(IsNum(newsid))
		    {
		    var title = $(this).attr("title");
		    var url = $(this).attr("href");
    
		        $.ajax({ 
                    async:false, 
                    url: "http://header.cnool.net/Stat/Stat.ashx?newsid="+newsid+"&title="+escape(title)+"&url="+escape(url)+"&"+new Date().getTime(),  // 跨域URL
                    type: 'GET', 
                    dataType: 'jsonp',  //跨域必须是jsonp
                    jsonp: 'jsoncallback', //默认callback
                    timeout: 5000, 
                    success: function (json) { 
                    }, 
                    error: function(xhr){ 
                       
                    } 
                });

		    }
		});
	}
	
	function IsNum(s)
    {
        if (s!=null && s!="")
        {
            return !isNaN(s);
        }
        return false;
    }
    
    $.fn.reorder = function() {
 
  function randOrd() { return(Math.round(Math.random())-0.5); }
 
  return($(this).each(function() {
    var $this = $(this);
    var $children = $this.children();
    var childCount = $children.length;
 
    if (childCount > 1) {
      $children.remove();
 
      var indices = new Array();
      for (i=0;i<childCount;i++) { indices[indices.length] = i; }
      indices = indices.sort(randOrd);
      $.each(indices,function(j,k) { $this.append($children.eq(k)); });
 
    }
  }));
}

    
    
    

     
