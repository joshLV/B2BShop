﻿(function ($) {

    $.util.namespace("mainpage.nav");
    $.util.namespace("mainpage.favo");
    $.util.namespace("mainpage.mainTabs");
    
    var homePageTitle = "主页", homePageHref = null, navMenuList = "#navMenu_list",
        navMenuTree = "#navMenu_Tree", mainTabs = "#mainTabs", navTabs = "#navTabs", favoMenuTree = "#favoMenu_Tree",
        mainLayout = "#mainLayout", northPanel = "#northPanel", themeSelector = "#themeSelector",
        westLayout = "#westLayout", westCenterLayout = "#westCenterLayout", westFavoLayout = "#westFavoLayout",
        westSouthPanel = "#westSouthPanel", homePanel = "#homePanel",
        btnShopView = "#btnShopView", btnFullScreen = "#btnFullScreen", btnExit = "#btnExit", btnEditPassword = "#btnEditPassword";
    
    //  按照指定的根节点菜单 id，加载其相应的子菜单树面板数据；该方法定义如下参数：
    //      id: 表示根节点菜单的 id；
    window.mainpage.loadMenu = function (id) {
        $(navMenuList).find("a").attr("disabled", true);
        $.easyui.loading({ locale: westCenterLayout });
        var t = $(navMenuTree), root = $.extend({}, $.array.first(window.mainpage.navMenusData, function (val) { return val.id == id; }));
        
        $.get(base+"merchant/navmenu/"+id+"/data", function (menus) {
        	root.children = $.array.likeArrayNotString(menus) ? menus : [];
            t.tree("loadData", [root]);
        }, "json");
        
    };
    
    //  将指定的根节点数据集合数据加载至左侧面板中“导航菜单”的 ul 控件中；该方法定义如下参数：
    //      callback:  为一个 Function 对象；表示家在完成菜单数据后调用的回调函数
    window.mainpage.loadNavMenus = function (callback) {
        var ul = $(navMenuList).empty();
        $.get(base+"merchant/navmenu", function (menus) {
            $.each(window.mainpage.navMenusData = menus = $.array.filter(menus, function (item) {
                return item.disabled ? false : true;
            }), function (i, item) {
                var li = $("<li></li>").appendTo(ul);
                var pp = $("<div></div>").addClass("panel-header panel-header-noborder").appendTo(li);
                var a = $("<a></a>").attr({ href: "javascript:void(0);", target: "_self" }).hover(function () {
                    a.addClass("tree-node-selected");
                }, function () {
                    if (!a.hasClass("selected")) { $(this).removeClass("tree-node-selected"); }
                }).click(function () {
                    if (a.is(".tree-node-selected.selected") || a.attr("disabled")) { return; }
                    ul.find("a").removeClass("tree-node-selected selected");
                    a.addClass("tree-node-selected selected");
                    window.mainpage.loadMenu(item.id);
                }).appendTo(pp);
                $.data(a[0], "menu-item", item);
                //var span = $("<span></span>").addClass("nav-menu").appendTo(a);
                //$("<span></span>").addClass("nav-menu-icon" + (item.iconCls ? " " + item.iconCls : "")).text(item.text).appendTo(span);
                $("<span class=\"l-btn-left l-btn-icon-left nav-menu\">" +
                    "<span class=\"l-btn-text\">" + (item.text ? item.text : "无标题菜单导航") + "</span>" +
                    "<span class=\"l-btn-icon" + (item.iconCls ? " " + item.iconCls : "") + "\"></span></span>").appendTo(a);
            });
            var layout = $(westLayout), south = layout.layout("panel", "south"), southOpts = south.panel("options");
            southOpts.minHeight = 7 + Math.min(menus.length, 3) * 27; southOpts.maxHeight = 7 + menus.length * 27;
            layout.layout("resize");
            if ($.isFunction(callback)) { callback.call(ul, menus); }
        }, "json");
    };

    window.mainpage.instTreeStatus = function (target) {
        var t = $(target), array = t.tree("getRoots");
        $.each(array, function (i, n) {
            var cc = t.tree("getChildren", n.target);
            t.tree("expand", n.target);
            $.each(cc, function (l, c) { t.tree("collapseAll", c.target); });
        });
    };

    //  初始化 westSouthPanel 位置的“导航菜单”区域子菜单 ul 控件(仅初始化 easyui-tree 对象，不加载数据)。
    window.mainpage.instNavTree = function () {
        var t = $(navMenuTree);
        if (t.isEasyUI("tree")) { return; }
        t.tree({
            animate: true,
            lines: true,
            toggleOnClick: true,
            selectOnContextMenu: true,
            showOption: true,
            onClick: function (node) {
                window.mainpage.addModuleTab(node);
            },
            onLoadSuccess: function (node, data) {
                $(navMenuList).find("a").removeAttr("disabled");
                window.mainpage.instTreeStatus(t);
                $.easyui.loaded(westCenterLayout);
            },
            contextMenu: [
                {
                    text: "打开/转到", iconCls: "icon-standard-application-add",
                    disabled: function (e, node) { return node.attributes && node.attributes.href ? false : true; },
                    handler: function (e, node) {
                        window.mainpage.addModuleTab(node);
                    }
                },
                "-",
                { text: "添加至个人收藏", iconCls: "icon-standard-feed-add", disabled: function (e, node) { return !t.tree("isLeaf", node.target); }, handler: function (e, node) { window.mainpage.nav.addFavo(node.id); } },
                "-",
                { text: "刷新", iconCls: "icon-cologne-refresh", handler: function (e, node) { window.mainpage.nav.refreshTree(); } }
            ],
            onAfterEdit: function (node) { window.mainpage.nav.rename(node.id, node.text); }
        });
    };

    //  初始化应用程序主界面左侧面板中“导航菜单”的数据，并加载特定的子菜单树数据。
    window.mainpage.instMainMenus = function () {
        window.mainpage.loadNavMenus(function () {
            window.mainpage.instNavTree();
            var selectId = 11;
            if (window.mainpage.navMenusData.length) {
                var list = $(navMenuList).find("a");
                if (!list.length) { return; }
                var menu = list.filter(function () { var item = $.data(this, "menu-item"); return item && item.id == selectId; }),
                    target = menu.length ? menu : list.eq(0);
                target.click();
            }
        });
    };
    
    //  初始化 westSouthPanel 位置“个人收藏”的 ul 控件(仅初始化 easyui-tree 对象，不加载数据)。
    window.mainpage.instFavoTree = function () {
        var t = $(favoMenuTree);
        if (t.isEasyUI("tree")) { return; }
        t.tree({
            method: "get",
            animate: true,
            lines: true,
            dnd: true,
            toggleOnClick: true,
            showOption: true,
            onBeforeDrop: function (target, source, point) {
                var node = $(this).tree("getNode", target);
                if (point == "append" || !point) {
                    if (!node || !node.attributes || !node.attributes.folder) { return false; }
                }
            },
            selectOnContextMenu: true,
            onClick: function (node) {
                window.mainpage.addModuleTab(node);
            },
            onLoadSuccess: function (node, data) {
                window.mainpage.instTreeStatus(t);
                $.easyui.loaded(westFavoLayout);
            },
            contextMenu: [
                {
                    text: "打开/转到", iconCls: "icon-standard-application-add", handler: function (e, node) { window.mainpage.addModuleTab(node); }
                }, "-",
                { text: "从个人收藏删除", iconCls: "icon-standard-feed-delete", handler: function (e, node) { window.mainpage.favo.removeFavo(node.id); } }, "-",
                { text: "刷新", iconCls: "icon-cologne-refresh", handler: function (e, node) { window.mainpage.favo.refreshTree(); } }
            ],
            onAfterEdit: function (node) { window.mainpage.favo.rename(node.id, node.text); }
        });
    };

    //  将指定的根节点数据集合数据加载至左侧面板中“个人收藏”的 ul 控件中；该方法定义如下参数：
    //      menus:  为一个 Array 对象；数组中的每一个元素都是一个表示根节点菜单数据的 JSON-Object。
    window.mainpage.loadFavoMenus = function () {
        $.easyui.loading({ locale: westFavoLayout });
        $(favoMenuTree).tree("load", base+"merchant/favomenu/data");
    };
    
    //  初始化应用程序主界面左侧面板中“个人收藏”的数据。
    window.mainpage.instFavoMenus = function () {
        window.mainpage.instFavoTree();
        window.mainpage.loadFavoMenus();
    };
    
    window.mainpage.instTimerSpan = function () {
        var timerSpan = $("#timerSpan"), interval = function () { timerSpan.text($.date.toLongDateTimeString(new Date())); };
        interval();
        window.setInterval(interval, 1000);
    };

    window.mainpage.bindToolbarButtonEvent = function () {
        
        $("#btnHideNorth").click(function () { window.mainpage.hideNorth(); });
        var btnShow = $("#btnShowNorth").click(function () { window.mainpage.showNorth(); });
        var l = $(mainLayout), north = l.layout("panel", "north"), panel = north.panel("panel"),
            toolbar = $("#toolbar"), topbar = $("#topbar");
        opts = north.panel("options"), onCollapse = opts.onCollapse, onExpand = opts.onExpand;
        opts.onCollapse = function () {
            if ($.isFunction(onCollapse)) { onCollapse.apply(this, arguments); }
            btnShow.show();
            toolbar.insertBefore(panel).addClass("top-toolbar-topmost");
        };
        opts.onExpand = function () {
            if ($.isFunction(onExpand)) { onExpand.apply(this, arguments); }
            btnShow.hide();
            toolbar.insertAfter(topbar).removeClass("top-toolbar-topmost");
        };

        var themeName = $.cookie("themeName");
		$(themeSelector).combobox({
		    width: 140, editable: false,
		    data: window.mainpage.themeData,
		    valueField: "path", textField: "name",
		    value: themeName || window.mainpage.themeData[0].path,
		    onSelect: function (record) {
		        var opts = $(this).combobox("options");
		        window.mainpage.setTheme(record[opts.valueField], true);
		    }
		});
        
		$(btnShopView).click(function () {
            var shopURL=$(this).attr("href");
            window.open(shopURL);
        });
		
        $(btnFullScreen).click(function () {
            if ($.util.supportsFullScreen) {
                if ($.util.isFullScreen()) {
                    $.util.cancelFullScreen();
                } else {
                    $.util.requestFullScreen();
                }
            } else {
                $.easyui.messager.show("当前浏览器不支持全屏 API，请更换至最新的 Chrome/Firefox/Safari 浏览器或通过 F11 快捷键进行操作。");
            }
        });

        $(btnExit).click(function () {
            $.easyui.messager.confirm("操作提醒", "您确定要退出当前程序吗？", function (c) {
                if (c) { 
                	//$.util.closeWindowNoConfirm();
                	window.location.href=base+"merchant/logout"; 
                }
            });
        });
        
        $(btnEditPassword).click(function () {
        	$.easyui.showDialog({
        		title: "修改密码",
        		width: 400,
        		height: 200,
        		modal: true,
                topMost: false,
                href: base+"merchant/merchantuser/editPassword",
                saveButtonText: "保存",
                closeButtonText: "取消",
                enableApplyButton: false,
                onSave: function (d) {
                	var validate = d.form("validate");
                    if (validate) {
                    	$.ajax({
                    		type:"POST",
                    		async: true,
                    		url: base+"merchant/merchantuser/updatePasswd",
                    		data: d.form("getData"),
                    		dataType:"json",
                    		success:function(data){
                    			if(data.status=='success'){
                    				return true;
                    			}else{
                    				$.easyui.messager.alert('操作提醒',data.message,'error');
                    				return false;
                    			}
                    		}
                    	});
                    } else {
                        return false;
                    }
                }
            });
        	
        	
        });
        
    };

    window.mainpage.search = function (value, name) { $.easyui.messager.show($.string.format("您设置的主题为：value: {0}, name: {1}", value, name)); };
    
    window.mainpage.themeData = $.array.filter($.easyui.theme.dataSource, function (val) {
        return val.disabled ? false : true;
    });

    //  设置当前系统主界面的界面皮肤风格；该方法提供如下参数：
    //      theme:      界面皮肤风格名称
    //      setCookie:  可选参数，boolean 类型，表示是否将 theme 保存至 cookie 名为 themeName
    window.mainpage.setTheme = function (theme, setCookie) {
        if (setCookie == null || setCookie == undefined) { setCookie = true; }
        $.easyui.theme(true, theme, function (item) {
            if (setCookie) {
                $.cookie("themeName", theme, { expires: 30 });
                //var msg = $.string.format("您设置了新的系统主题皮肤为：{0}，{1}。", item.name, item.path);
                //$.easyui.messager.show(msg);
            }
        });
    };

    window.mainpage.bindMainTabsButtonEvent = function () {
        $("#mainTabs_jumpHome").click(function () { window.mainpage.mainTabs.jumpHome(); });
        $("#mainTabs_toggleAll").click(function () { window.mainpage.togglePanels(); });
        $("#mainTabs_jumpTab").click(function () { window.mainpage.mainTabs.jumpTab(); });
        $("#mainTabs_closeTab").click(function () { window.mainpage.mainTabs.closeCurrentTab(); });
        $("#mainTabs_closeOther").click(function () { window.mainpage.mainTabs.closeOtherTabs(); });
        $("#mainTabs_closeLeft").click(function () { window.mainpage.mainTabs.closeLeftTabs(); });
        $("#mainTabs_closeRight").click(function () { window.mainpage.mainTabs.closeRightTabs(); });
        $("#mainTabs_closeAll").click(function () { window.mainpage.mainTabs.closeAllTabs(); });
    };

    window.mainpage.bindNavTabsButtonEvent = function () {
        $("#navMenu_refresh").click(function () { window.mainpage.refreshNavTab(); });

        $("#navMenu_Favo").click(function () { window.mainpage.nav.addFavo(); });
        $("#navMenu_Rename").click(function () { window.mainpage.nav.rename(); });
        $("#navMenu_expand").click(function () { window.mainpage.nav.expand(); });
        $("#navMenu_collapse").click(function () { window.mainpage.nav.collapse(); });
        $("#navMenu_collapseCurrentAll").click(function () { window.mainpage.nav.expandCurrentAll(); });
        $("#navMenu_expandCurrentAll").click(function () { window.mainpage.nav.collapseCurrentAll(); });
        $("#navMenu_collapseAll").click(function () { window.mainpage.nav.expandAll(); });
        $("#navMenu_expandAll").click(function () { window.mainpage.nav.collapseAll(); });

        $("#favoMenu_Favo").click(function () { window.mainpage.favo.removeFavo(); });
        $("#favoMenu_Rename").click(function () { window.mainpage.favo.rename(); });
        $("#favoMenu_expand").click(function () { window.mainpage.favo.expand(); });
        $("#favoMenu_collapse").click(function () { window.mainpage.favo.collapse(); });
        $("#favoMenu_collapseCurrentAll").click(function () { window.mainpage.favo.expandCurrentAll(); });
        $("#favoMenu_expandCurrentAll").click(function () { window.mainpage.favo.collapseCurrentAll(); });
        $("#favoMenu_collapseAll").click(function () { window.mainpage.favo.expandAll(); });
        $("#favoMenu_expandAll").click(function () { window.mainpage.favo.collapseAll(); });
    };

    window.mainpage.hideNorth = function () { $(mainLayout).layout("collapse", "north"); };

    window.mainpage.showNorth = function () { $(mainLayout).layout("expand", "north"); };

    window.mainpage.togglePanels = function () { $(mainLayout).layout("toggleAll", "collapse"); };

    window.mainpage.addModuleTab = function (node) {
    	if(node.attributes.href == "#"){return;};
        var n = node || {}, attrs = node.attributes || {}, opts = $.extend({}, n, { title: n.text }, attrs);
        if (!opts.href) { return; }
        window.mainpage.mainTabs.addModule(opts);
    };

    //  判断指定的选项卡是否存在于当前主页面的选项卡组中；
    //  返回值：返回的值可能是以下几种：
    //      0:  表示不存在于当前选项卡组中；
    //      1:  表示仅 title 值存在于当前选项卡组中；
    //      2:  表示 title 和 href 都存在于当前选项卡组中；
    window.mainpage.mainTabs.isExists = function (title, href) {
        var t = $(mainTabs), tabs = t.tabs("tabs"), array = $.array.map(tabs, function (val) { return val.panel("options"); }),
            list = $.array.filter(array, function (val) { return val.title == title; }), ret = list.length ? 1 : 0;
        if (ret && $.array.some(list, function (val) { return val.href == href; })) { ret = 2; }
        return ret;
    };

    window.mainpage.mainTabs.tabDefaultOption = {
        title: "新建选项卡", href: "", iniframe: true, closable: true, refreshable: true, iconCls: "icon-standard-application-form", repeatable: true, selected: true
    };
    window.mainpage.mainTabs.parseCreateTabArgs = function (args) {
        var ret = {};
        if (!args || !args.length) {
            $.extend(ret, window.mainpage.mainTabs.tabDefaultOption);
        } else if (args.length == 1) {
            $.extend(ret, window.mainpage.mainTabs.tabDefaultOption, typeof args[0] == "object" ? args[0] : { href: args[0] });
        } else if (args.length == 2) {
            $.extend(ret, window.mainpage.mainTabs.tabDefaultOption, { title: args[0], href: args[1] });
        } else if (args.length == 3) {
            $.extend(ret, window.mainpage.mainTabs.tabDefaultOption, { title: args[0], href: args[1], iconCls: args[2] });
        } else if (args.length == 4) {
            $.extend(ret, window.mainpage.mainTabs.tabDefaultOption, { title: args[0], href: args[1], iconCls: args[2], iniframe: args[3] });
        } else if (args.length == 5) {
            $.extend(ret, window.mainpage.mainTabs.tabDefaultOption, { title: args[0], href: args[1], iconCls: args[2], iniframe: args[3], closable: args[4] });
        } else if (args.length == 6) {
            $.extend(ret, window.mainpage.mainTabs.tabDefaultOption, { title: args[0], href: args[1], iconCls: args[2], iniframe: args[3], closable: args[4], refreshable: args[5] });
        } else if (args.length >= 7) {
            $.extend(ret, window.mainpage.mainTabs.tabDefaultOption, { title: args[0], href: args[1], iconCls: args[2], iniframe: args[3], closable: args[4], refreshable: args[5], selected: args[6] });
        }
        return ret;
    };

    window.mainpage.mainTabs.createTab = function (title, href, iconCls, iniframe, closable, refreshable, selected) {
        var t = $(mainTabs), i = 0, opts = window.mainpage.mainTabs.parseCreateTabArgs(arguments);
        while (t.tabs("getTab", opts.title + (i ? String(i) : ""))) { i++; }
        t.tabs("add", opts);
    };

    //  添加一个新的模块选项卡；该方法重载方式如下：
    //      function (tabOption)
    //      function (href)
    //      function (title, href)
    //      function (title, href, iconCls)
    //      function (title, href, iconCls, iniframe)
    //      function (title, href, iconCls, iniframe, closable)
    //      function (title, href, iconCls, iniframe, closable, refreshable)
    //      function (title, href, iconCls, iniframe, closable, refreshable, selected)
    window.mainpage.mainTabs.addModule = function (title, href, iconCls, iniframe, closable, refreshable, selected) {
        var opts = window.mainpage.mainTabs.parseCreateTabArgs(arguments), isExists = window.mainpage.mainTabs.isExists(opts.title, opts.href);
        switch (isExists) {
            case 0: window.mainpage.mainTabs.createTab(opts); break;
            case 1: window.mainpage.mainTabs.createTab(opts); break;
            case 2: window.mainpage.mainTabs.jumeTab(opts.title); break;
            default: break;
        }
    };

    window.mainpage.mainTabs.jumeTab = function (which) { $(mainTabs).tabs("select", which); };

    window.mainpage.mainTabs.jumpHome = function () {
        var t = $(mainTabs), tabs = t.tabs("tabs"), panel = $.array.first(tabs, function (val) {
            var opts = val.panel("options");
            return opts.title == homePageTitle && opts.href == homePageHref;
        });
        if (panel && panel.length) {
            var index = t.tabs("getTabIndex", panel);
            t.tabs("select", index);
        }
    };

    window.mainpage.mainTabs.jumpTab = function (which) { $(mainTabs).tabs("jumpTab", which); };

    window.mainpage.mainTabs.closeTab = function (which) { $(mainTabs).tabs("close", which); };

    window.mainpage.mainTabs.closeCurrentTab = function () {
        var t = $(mainTabs), index = t.tabs("getSelectedIndex");
        return t.tabs("closeClosable", index);
    };

    window.mainpage.mainTabs.closeOtherTabs = function (index) {
        var t = $(mainTabs);
        if (index == null || index == undefined) { index = t.tabs("getSelectedIndex"); }
        return t.tabs("closeOtherClosable", index);
    };

    window.mainpage.mainTabs.closeLeftTabs = function (index) {
        var t = $(mainTabs);
        if (index == null || index == undefined) { index = t.tabs("getSelectedIndex"); }
        return t.tabs("closeLeftClosable", index);
    };

    window.mainpage.mainTabs.closeRightTabs = function (index) {
        var t = $(mainTabs);
        if (index == null || index == undefined) { index = t.tabs("getSelectedIndex"); }
        return t.tabs("closeRightClosable", index);
    };

    window.mainpage.mainTabs.closeAllTabs = function () {
        return $(mainTabs).tabs("closeAllClosable");
    };

    window.mainpage.mainTabs.updateHash = function (index) {
        var opts = $(mainTabs).tabs("getTab", index).panel("options");
        window.location.hash = opts.href ? opts.href : "";
    };

    window.mainpage.mainTabs.loadHash = function (hash) {
        while (hash.left(1) == "#") { hash = hash.substr(1); }
        if (String.isNullOrWhiteSpace(hash)) { return; }
        //$.get(base+"static/assets/common/nav-api-menu-data.json", function (menus) {
        $.get(base+"merchant/navmenu/data/all", function (menus) {
            var array = $.fn.tree.extensions.cascadeToArray(menus),
                node = $.array.first(array, function (val) { return val.attributes && val.attributes.href == hash; });
            if (node) {
                window.mainpage.addModuleTab(node);
            } else {
                $.easyui.messager.show("hash is not exists");
            }
        }, "json");
    };


    window.mainpage.refreshNavTab = function (index) {
        var t = $(navTabs);
        if (index == null || index == undefined) { index = t.tabs("getSelectedIndex"); }
        if (index == 0) {
            window.mainpage.nav.refreshNav();
        } else {
            window.mainpage.favo.refreshTree();
        }
    };
    
    window.mainpage.nav.refreshNav = function () { window.mainpage.instMainMenus(); };

    window.mainpage.nav.refreshTree = function () {
        var menu = $(navMenuList).find("a.tree-node-selected.selected"), item = $.data(menu[0], "menu-item");
        if (item && item.id) { window.mainpage.loadMenu(item.id); }
    };

    window.mainpage.nav.addFavo = function (id) {
        var t = $(navMenuTree), node = arguments.length ? t.tree("find", id) : t.tree("getSelected");
        if (!node) {
        	return $.easyui.messager.show("请先选择一行数据");
        }else{
        	$.ajax({
        		type:"POST",
        		async: true,
        		url: base+"merchant/favomenu/save",
        		data:{'moduleId':node.id, 'mid':node.id},
        		dataType:"json",
        		success:function(data){
        			if(data.status=='success'){
        				//$.easyui.messager.alert('操作提醒','收藏成功。','info');
        				$(favoMenuTree).tree('reload');
        			}else{
        				$.easyui.messager.alert('操作提醒',data.message,'error');
        			}
        		}
        	});
        }
	};
    
    window.mainpage.nav.rename = function (id, text) {
        var t = $(navMenuTree), node;
        if (!arguments.length) {
            node = t.tree("getSelected");
            if (!node) { return $.easyui.messager.show("请先选择一行数据"); }
            t.tree("beginEdit", node.target);
        } else { }
    };

    window.mainpage.nav.expand = function (id) {
        var t = $(navMenuTree), node;
        if (id == null || id == undefined) {
            node = t.tree("getSelected");
            if (!node) { return $.easyui.messager.show("请先选择一行数据"); }
        } else {
            node = t.tree("find", id);
            if (!node) { return $.easyui.messager.show("请传入有效的参数 id(菜单标识号)"); }
        }
        t.tree("expand", node.target);
    };

    window.mainpage.nav.collapse = function (id) {
        var t = $(navMenuTree), node;
        if (id == null || id == undefined) {
            node = t.tree("getSelected");
            if (!node) { return $.easyui.messager.show("请先选择一行数据"); }
        } else {
            node = t.tree("find", id);
            if (!node) { return $.easyui.messager.show("请传入有效的参数 id(菜单标识号)"); }
        }
        t.tree("collapse", node.target);
    };

    window.mainpage.nav.expandCurrentAll = function (id) {
        var t = $(navMenuTree), node;
        if (id == null || id == undefined) {
            node = t.tree("getSelected");
            if (!node) { return $.easyui.messager.show("请先选择一行数据"); }
        } else {
            node = t.tree("find", id);
            if (!node) { return $.easyui.messager.show("请传入有效的参数 id(菜单标识号)"); }
        }
        t.tree("expandAll", node.target);
    };

    window.mainpage.nav.collapseCurrentAll = function (id) {
        var t = $(navMenuTree), node;
        if (id == null || id == undefined) {
            node = t.tree("getSelected");
            if (!node) { return $.easyui.messager.show("请先选择一行数据"); }
        } else {
            node = t.tree("find", id);
            if (!node) { return $.easyui.messager.show("请传入有效的参数 id(菜单标识号)"); }
        }
        t.tree("collapseAll", node.target);
    };

    window.mainpage.nav.expandAll = function () { $(navMenuTree).tree("expandAll"); };

    window.mainpage.nav.collapseAll = function () { $(navMenuTree).tree("collapseAll"); };


    window.mainpage.favo.refreshTree = function () { window.mainpage.loadFavoMenus(); };

    window.mainpage.favo.removeFavo = function (id) {
        var t = $(favoMenuTree), node = arguments.length ? t.tree("find", id) : t.tree("getSelected");
        if (!node) {
        	return $.easyui.messager.show("请先选择一行数据");
        }else{
        	$.ajax({
        		type:"POST",
        		async: true,
        		url: base+"merchant/favomenu/delete",
        		data:{'ids':node.id, 'mid':node.moduleId},
        		dataType:"json",
        		success:function(data){
        			if(data.status=='success'){
        				//$.easyui.messager.alert('操作提醒','收藏成功。','info');
        				t.tree("remove", node.target);
        				//t.tree("reload");
        			}else{
        				$.easyui.messager.alert('操作提醒',data.message,'error');
        			}
        		}
        	});
        }
    };

    window.mainpage.favo.rename = function (id, text) {
        var t = $(favoMenuTree), node;
        if (!arguments.length) {
            node = t.tree("getSelected");
            if (!node) { return $.easyui.messager.show("请先选择一行数据"); }
            t.tree("beginEdit", node.target);
        } else { }
    };

    var folderId = 20;
    window.mainpage.favo.addFolder = function (node) {
        var t = $(favoMenuTree);
        node = node || t.tree("getSelected");
        $.easyui.messager.prompt("请输入添加的目录名称：", function (name) {
            if (name == null || name == undefined) { return; }
            if (String(name).trim() == "") { return $.easyui.messager.show("请输入目录名称！"); }
            if (node) {
                t.tree("insert", { after: node.target, data: { id: folderId++, text: name, iconCls: "icon-hamburg-folder", attributes: { folder: true } } });
            } else {

            }
        });
    };

    window.mainpage.favo.expand = function (id) {
        var t = $(favoMenuTree), node;
        if (id == null || id == undefined) {
            node = t.tree("getSelected");
            if (!node) { return $.easyui.messager.show("请先选择一行数据"); }
        } else {
            node = t.tree("find", id);
            if (!node) { return $.easyui.messager.show("请传入有效的参数 id(菜单标识号)"); }
        }
        t.tree("expand", node.target);
    };

    window.mainpage.favo.collapse = function (id) {
        var t = $(favoMenuTree), node;
        if (id == null || id == undefined) {
            node = t.tree("getSelected");
            if (!node) { return $.easyui.messager.show("请先选择一行数据"); }
        } else {
            node = t.tree("find", id);
            if (!node) { return $.easyui.messager.show("请传入有效的参数 id(菜单标识号)"); }
        }
        t.tree("collapse", node.target);
    };

    window.mainpage.favo.expandCurrentAll = function (id) {
        var t = $(favoMenuTree), node;
        if (id == null || id == undefined) {
            node = t.tree("getSelected");
            if (!node) { return $.easyui.messager.show("请先选择一行数据"); }
        } else {
            node = t.tree("find", id);
            if (!node) { return $.easyui.messager.show("请传入有效的参数 id(菜单标识号)"); }
        }
        t.tree("expandAll", node.target);
    };

    window.mainpage.favo.collapseCurrentAll = function (id) {
        var t = $(favoMenuTree), node;
        if (id == null || id == undefined) {
            node = t.tree("getSelected");
            if (!node) { return $.easyui.messager.show("请先选择一行数据"); }
        } else {
            node = t.tree("find", id);
            if (!node) { return $.easyui.messager.show("请传入有效的参数 id(菜单标识号)"); }
        }
        t.tree("collapseAll", node.target);
    };

    window.mainpage.favo.expandAll = function () { $(favoMenuTree).tree("expandAll"); };
    
    window.mainpage.favo.collapseAll = function () { $(favoMenuTree).tree("collapseAll"); };
    
    //******2014-06-07 15:00:00 start******//
    var allDatagrid={};//记录所有list页面中的datagrid对象
    window.mainpage.addNewTab = function (title,href,datagrid,parentHref) {
    	var node = { "text": title, "attributes": { "href": href } };
    	window.mainpage.addModuleTab(node);
    	allDatagrid[parentHref]=datagrid;
    };
    
    window.mainpage.getDatagrid = function (href) {
    	return allDatagrid[href];
    };
    
    //覆盖上面的isExists,除去href(路径)中包含的参数
    window.mainpage.mainTabs.isExists4Refresh = function (href) {
    	return allDatagrid[href];
    };
    
    //******2014-06-07 15:00:00 end******//
    
})(jQuery);