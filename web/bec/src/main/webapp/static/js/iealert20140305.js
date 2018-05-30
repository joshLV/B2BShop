/*
 * IE Alert! jQuery plugin
 * version 1
 * author: David Nemes http://nmsdvid.com
 * http://nmsdvid.com/iealert/
 */

(function($){
	$("#goon").live("click", function(){
			$("#ie-alert-overlay").hide();	
			$("#ie-alert-panel").hide();						  
	});
	function initialize($obj, title, text){
	
		var panel = "<span>"+ title +"</span>"
				  + "<p> "+ text +"</p>"
			      + "<div class='browser'>"
			      + "<ul>"
			      + "<li><a class='chrome' href='https://www.google.com/chrome/' target='_blank'></a></li>"
			      + "<li><a class='firefox' href='http://www.mozilla.org/en-US/firefox/new/' target='_blank'></a></li>"
			      //+ "<li><a class='ie9' href='http://windows.microsoft.com/en-US/internet-explorer/downloads/ie/' target='_blank'></a></li>"
			      + "<li><a class='safari' href='http://www.apple.com/safari/download/' target='_blank'></a></li>"
			      + "<li><a class='opera' href='http://www.opera.com/download/' target='_blank'></a></li>"
			      + "<ul>"
			      + "</div>"; 

		var overlay = $("<div id='ie-alert-overlay'></div>");
		var iepanel = $("<div id='ie-alert-panel'>"+ panel +"</div>");
		var docHeight = $(document).height();
		overlay.css("height", docHeight + "px");
		
		if ($.browser.msie || ($.browser.mozilla && $.browser.version == '11.0')) {
			$obj.prepend(iepanel);
			$obj.prepend(overlay);
		}
		
		if ($.browser.msie  && parseInt($.browser.version, 10) === 6) {
			$("#ie-alert-panel").css("background-position","-626px -116px");
			$obj.css("margin","0");
		}

	}; //end initialize function

	$.fn.iealert = function(options){
		var defaults = { 
			title: "\u60a8\u77e5\u9053\u60a8\u7684\u6d4f\u89c8\u5668\u5176\u5b9e\u53ef\u4ee5\u6362\u6362\u4e86\u5417?", // title text
			text: "\u4e3a\u4e86\u5f97\u5230\u6700\u597d\u7684\u4f53\u9a8c\u6548\u679c,\u6211\u4eec\u5efa\u8bae\u60a8\u4f7f\u7528\u4ee5\u4e0b\u6d4f\u89c8\u5668\u8fdb\u884c\u8bbf\u95ee.<br /><br /><h1 id='goon' style='font-size:20px;cursor:pointer;'>>>>\u7EE7\u7EED\u8BBF\u95EE</h1>"
		};
		
		var option = $.extend(defaults, options);

		return this.each(function(){
			var $this = $(this);  
			initialize($this, option.title, option.text);
		});      
		
	};
})(jQuery);
