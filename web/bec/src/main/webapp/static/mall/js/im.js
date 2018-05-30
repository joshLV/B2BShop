
$().ready( function() {
		
	/* ---------- InstantMessaging ---------- */
	var instantMessagingHtml = ''+
	'<div id="instantMessagingLayer" class="instantMessagingLayer rightInstantMessagingLayer">'+
		'<div id="instantMessagingMin" class="instantMessagingMin"></div>'+
		'<div id="instantMessagingMain" class="instantMessagingMain">'+
			'<div class="top clearfix"></div>'+
			'<div class="middle clearfix">'+
				'<dl>'+
					'<dt>在线客服</dt>'+
					'<dd>'+
						'<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=37638928&site=qq&menu=yes" >'+
							'<img src="http://wpa.qq.com/pa?p=2:47497516:45" alt="客服QQ" align="absmiddle" /> 客服QQ'+
						'</a>'+
					'</dd>'+
					'<dd>'+
					'<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=37638928&site=qq&menu=yes">'+
						'<img src="http://wpa.qq.com/pa?p=2:47497516:45" alt="客服QQ" align="absmiddle" /> 客服QQ'+
					'</a>'+
				'</dd>'+
				'</dl>'+
			'</div>'+
			'<div id="closeInstantMessagingMain" class="bottom clearfix" title="关 闭"></div>'+
		'</div>'+
	'</div>';
	
	$("body").append(instantMessagingHtml);
	var $instantMessagingLayer = $("#instantMessagingLayer");
	var $instantMessagingMin = $("#instantMessagingMin");
	var $instantMessagingMain = $("#instantMessagingMain");
	var $closeInstantMessagingMain = $("#closeInstantMessagingMain");
	
	var lastScrollY = 60;
	
	$instantMessagingLayer.show();
	
	function moveInstantMessagingLayer() {
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
		$instantMessagingLayer.css("top", (isNaN(parseInt($instantMessagingLayer.css("top"))) ? 0 : parseInt($instantMessagingLayer.css("top"))) + percent);
		lastScrollY = lastScrollY + percent;
	}
	
	window.setInterval(moveInstantMessagingLayer, 20);
	
	$instantMessagingMin.mouseover( function() {
		$instantMessagingMin.hide();
		$instantMessagingMain.show();
	});
	
	$closeInstantMessagingMain.click( function() {
		$instantMessagingMain.hide();
		$instantMessagingMin.show();
	});
});