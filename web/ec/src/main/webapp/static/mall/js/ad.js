
$().ready( function() {
		
	/* ---------- leftAd ---------- */
	var leftAdHtml = ''+
	'<div id="leftAdLayer" class="adLayer leftAdLayer">'+
		'<div id="leftAdMain" class="adMain">'+
			'<div class="middle clearfix">'+
				'<img src="'+base+'static/mall/img/leftFloatingAd.png" />'+
			'</div>'+
			'<div id="closeLeftAdMain" class="bottom clearfix" title="关 闭"></div>'+
		'</div>'+
	'</div>';
	$("body").append(leftAdHtml);
	var $leftAdLayer = $("#leftAdLayer");
	var $leftAdMain = $("#leftAdMain");
	var $closeLeftAdMain = $("#closeLeftAdMain");

	var lastScrollY = 60;

	$leftAdLayer.show();
	$leftAdMain.show();

	function moveadLayer() {
		var diffY;
		if (document.documentElement && document.documentElement.scrollTop) {
			diffY = document.documentElement.scrollTop;
		} else if (document.body) {
			diffY = document.body.scrollTop;
		}

		percent = .1 * (diffY - lastScrollY);
		if(percent > 0) {
			percent = Math.ceil(percent);
		} else {
			percent = Math.floor(percent);
		}
		$leftAdLayer.css("top", (isNaN(parseInt($leftAdLayer.css("top"))) ? 0 : parseInt($leftAdLayer.css("top"))) + percent);
		lastScrollY = lastScrollY + percent;
	}
	
	window.setInterval(moveadLayer, 20);

	$closeLeftAdMain.click( function() {
		$leftAdLayer.remove();
	});
	
});