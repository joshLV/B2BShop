/*宽屏设置*/
pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");

function getTopBanner(d){
	var c = d.createElement("div"),
	o = d.getElementById("headerDiv"),
	h = d.getElementById("header");
	c.id = "top-banner";
	c.className = "content";
	c.style.height = "70px";
	c.style.margin = "2px auto 0";
	c.style.position = "relative";
	c.style.overflow = "hidden";
	
	var ad = null;
	$.ajax({
        type: "POST",
        url: base+"ad?sign=floor_6_2&&size=1",
        datatype: 'json',
        async:false,
        success: function(data) {
            if(data.imgs.length==0){
            	return;
            }
            $.each(data.imgs,function(i,v){
            	ad = {id: v.id,width: 1210,height: 70,src: v.pic,href: v.link,alt: "",widthB: 990,heightB: 70,srcB: v.pic};
            });
        }
    });
	
	if(ad==null){
		return;
	}
	ad = pageConfig.FN_GetCompatibleData(ad);
	c.innerHTML = "<a href='" + ad.href + "' target='_blank' ><img src='" + ad.src + "' width='" + ad.width + "' height='70' /></a><div id='adclose_'"+ad.id+" style='position:absolute;top:0px;right:0px;width:25px;height:25px;background:#fff;background:url("+base+"static/img/colorbox_close.png) no-repeat;cursor:pointer' onclick='document.getElementById(\"top-banner\").style.display=\"none\"'></div>";
	o.insertBefore(c, h);
	
}

$(function () {
	
	//TopBanner
	//getTopBanner(document);
	
	//轮播广告
	var item = {width: 740,height: 270,widthB: 550,heightB: 270};
	item = pageConfig.FN_GetCompatibleData(item);
	$("#adslide").find("img").css("width", item.width).css("height", item.height);
	$("#adslide").Slider();
	
	if(pageConfig.wideVersion && pageConfig.compatible){
		$("#hot-region-nav li").removeClass("hide");
		$(".products li").removeClass("hide");
	}
	$("#hot-region-nav li").mouseenter(function() {
		$(this).siblings().removeClass("cur");
		var index = $(this).addClass("cur").index();
		var _p = $("#hot-region .products").hide()
				.eq(index).show();
		var _pt = _p.find("textarea");
		if (_pt.length) {
			_p.html(_pt.val());
		}
	});
	
});


