(function ($) {
	
    var hash = window.location.hash, start = new Date();

    $(function () {
        window.mainpage.instMainMenus();
        window.mainpage.instFavoMenus();
        window.mainpage.instTimerSpan();
        window.mainpage.bindNavTabsButtonEvent();
        window.mainpage.bindToolbarButtonEvent();
        window.mainpage.bindMainTabsButtonEvent();
        
        var portal = $("#portal"), layout = $("#mainLayout"), navTabs = $("#navTabs"), themeCombo = $("#themeSelector");

        $.util.exec(function () {
            var theme = $.easyui.theme(), themeName = $.cookie("themeName");
            if (themeName && themeName != theme) { window.mainpage.setTheme(themeName, false); }

            layout.removeClass("hidden").layout("resize");

            $("#maskContainer").remove();

            var size = $.util.windowSize();
            //  判断当浏览器窗口宽度小于像素 1280 时，右侧 region-panel 自动收缩
            if (size.width < 1280) { layout.layout("collapse", "east"); }
            
            window.mainpage.mainTabs.loadHash(hash);
            
            //--- 2014-06-06 18:52:00 为选项卡注册选中事件 ---//
            $(mainTabs).tabs({
            	//onLoad:function(panel){alert("onLoad");},
            	onSelect:function(title,index){
	            	//alert(title+' 被选中   index:'+index);
	            	//alert($(this).tabs("getSelected"));
	            	//var opts = $(this).tabs("getSelected").currentPanel().panel("options");
	                //alert(opts.title+"   "+opts.href);
	                
	            	//alert(window.location.href);
	            	
	            	//alert($(this).tabs("getSelected").currentPanel());
	            	//$(this).tabs("getSelected").currentPanel().panel('refresh', 'http://www.baidu.com');
	                //$(this).tabs("getSelected").currentPanel().panel('refresh');
            	}
            });
            //--- end ---//
            
            var stop = new Date();
            $.easyui.messager.show({ msg: "当前页面加载耗时(毫秒)：" + $.date.diff(start, "ms", stop), position: "bottomRight" });
        });
        
        $.util.namespace("mainpage.util");
       
    });
    
})(jQuery);