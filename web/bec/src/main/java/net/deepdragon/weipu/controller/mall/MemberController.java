����   2 �
 $ d
 e f	 # g
 h i j
  d k
  l
 h m F n o p ? q r
 # s
 # t
 h u v w
 # x y
  d z
  {
 | } ~
  
 h � � �
  d
 h �
  � � � yinzhangService BLcom/thinkgem/jeesite/modules/trafficcase/service/YinzhangService; RuntimeVisibleAnnotations 8Lorg/springframework/beans/factory/annotation/Autowired; <init> ()V Code LineNumberTable LocalVariableTable this ALcom/thinkgem/jeesite/modules/trafficcase/web/YinzhangController; get N(Ljava/lang/String;)Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang; id Ljava/lang/String; entity :Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang; StackMapTable j 8Lorg/springframework/web/bind/annotation/ModelAttribute; "RuntimeVisibleParameterAnnotations 6Lorg/springframework/web/bind/annotation/RequestParam; required     list �(Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lorg/springframework/ui/Model;)Ljava/lang/String; yinzhang request 'Ljavax/servlet/http/HttpServletRequest; response (Ljavax/servlet/http/HttpServletResponse; model Lorg/springframework/ui/Model; page .Lcom/thinkgem/jeesite/common/persistence/Page; LocalVariableTypeTable jLcom/thinkgem/jeesite/common/persistence/Page<Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang;>; 7Lorg/apache/shiro/authz/annotation/RequiresPermissions; value trafficcase:yinzhang:view 8Lorg/springframework/web/bind/annotation/RequestMapping;   form l(Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang;Lorg/springframework/ui/Model;)Ljava/lang/String; save �(Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang;Lorg/springframework/ui/Model;Lorg/springframework/web/servlet/mvc/support/RedirectAttributes;)Ljava/lang/String; redirectAttributes @Lorg/springframework/web/servlet/mvc/support/RedirectAttributes; trafficcase:yinzhang:edit delete �(Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang;Lorg/springframework/web/servlet/mvc/support/RedirectAttributes;)Ljava/lang/String; select ()Ljava/lang/String; mapper /Lcom/thinkgem/jeesite/common/mapper/JsonMapper; yinzhangList Ljava/util/List; LLjava/util/List<Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang;>; 6Lorg/springframework/web/bind/annotation/ResponseBody; 
SourceFile YinzhangController.java +Lorg/springframework/stereotype/Controller; !${adminPath}/trafficcase/yinzhang ) * � � � % & � 0 1 8com/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang ,com/thinkgem/jeesite/common/persistence/Page ) � � � � � �  modules/trafficcase/yinzhangList  modules/trafficcase/yinzhangForm java/lang/Class � � O P Q � java/lang/String 保存公章成功 � � java/lang/StringBuilder 	redirect: � � � � Y /trafficcase/yinzhang/?repage � Y V � 删除公章成功 -com/thinkgem/jeesite/common/mapper/JsonMapper � � � � ?com/thinkgem/jeesite/modules/trafficcase/web/YinzhangController .com/thinkgem/jeesite/common/web/BaseController -com/thinkgem/jeesite/common/utils/StringUtils 
isNotBlank (Ljava/lang/CharSequence;)Z @com/thinkgem/jeesite/modules/trafficcase/service/YinzhangService R(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V findPage �(Lcom/thinkgem/jeesite/common/persistence/Page;Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang;)Lcom/thinkgem/jeesite/common/persistence/Page; org/springframework/ui/Model addAttribute D(Ljava/lang/String;Ljava/lang/Object;)Lorg/springframework/ui/Model; beanValidator E(Lorg/springframework/ui/Model;Ljava/lang/Object;[Ljava/lang/Class;)Z =(Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang;)V 
addMessage V(Lorg/springframework/web/servlet/mvc/support/RedirectAttributes;[Ljava/lang/String;)V append -(Ljava/lang/String;)Ljava/lang/StringBuilder; )com/thinkgem/jeesite/common/config/Global getAdminPath toString findList L(Lcom/thinkgem/jeesite/modules/trafficcase/entity/Yinzhang;)Ljava/util/List; toJson &(Ljava/lang/Object;)Ljava/lang/String; ! # $     % &  '     (     ) *  +   /     *� �    ,       $ -        . /    0 1  +   �      M+� � *� +� M,� � Y� M,�    ,       +  , 	 -  /  0  2 -          . /       2 3    4 5  6   	 �  7 '     8   9     :  ;Z <  = >  +   �     "*� � Y,-� +� 	:
�  W�    ,       8  9  : -   >    " . /     " ? 5    " @ A    " B C    " D E    F G  H       F I  '     J  K[ s L M  K[ s =s N  O P  +   O     ,+�  W�    ,   
    @ 
 A -         . /      ? 5     D E  '     J  K[ s L M  K[ s O  Q R  +   �     E*,+� � � 
*+,� �*� +� *-� YS� � Y� � � � � � �    ,       G  H  J  K * L -   *    E . /     E ? 5    E D E    E S T  6     '     J  K[ s U M  K[ s Q  V W  +   w     1*� +� *,� YS� � Y� � � � � � �    ,       R  S  T -        1 . /     1 ? 5    1 S T  '     J  K[ s U M  K[ s V  X Y  +   u     � Y�  L*� � Y� � !M+,� "�    ,       Z  [  \ -         . /     Z [    \ ]  H       \ ^  '     M  K[ s X _    `    a '     b   M  K[ s c                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              /**
 * jqGrid 封装类
 * @author ThinkGem@163.COM
 * @version 2015-5-4
 */
var DataGrid = function(options, $this){
	
	// 当前Grid对象元素，默认id：dataGrid
	var dataGrid = typeof $this != 'undefined' ? $this : options.dataGrid ? options.dataGrid : $("#dataGrid");
	
	// 当前Grid的分页元素，默认id：grid的id+Page为分页元素
	var dataGridPage = options.dataGridPage ? options.dataGridPage : $("#"+dataGrid.attr('id')+"Page");

	// 当前Grid的数据来源Form，默认id：searchForm
	var searchForm = options.searchForm ? options.searchForm : $("#searchForm");
	
	options = $.extend({
		// 数据表格参数
		url: searchForm.attr('action'),
		postData: searchForm.serializeArray(),
		mtype: "POST", datatype: "json",
		jsonReader: { 	// 自定义表格的JSON读取参数
			id: options.dataId, root: "list", page: "pageNo", userdata: "otherData",
			total: "totalPage", records: "count", subgrid: {root:"list"}
		},
		treeReader: {	// 自定义树表格JSON读取参数
			level_field: "sortGrade", parent_id_field: "parentCode", userdata: "otherData",
			leaf_field: "isLeaf", expanded_field: "isOpen", icon_field: "_icon"
		},
		prmNames: {		// 自定义Ajax请求参数
			page:"pageNo", rows:"pageSize", sort: "orderBy",
			order: "sord", search:"_search", nd:"nd", id:"id",
			oper:"oper",editoper:"edit",addoper:"add",deloper:"del", 
			subgridid:"id", npage: null, totalrows:"totalPage"
		},
		rowNum: -1, 		// 显示行数，-1为显示全部
		rownumWidth: 30,	// 序号列宽
//		multiboxonly: true,	// 单击复选框时在多选
		altRows: true, 		// 斑马线样式，交替行altclass
		tabPageId: '',		// 当前页签编号（作为addTabPage的参数）
		
		// 设置列模型参数
		columnModel: [], colNames: [], colModel: options.columnModel,

		// 数据表格扩展参数
		dataId: 'id', 		// 指定数据主键
		lazyLoad: false, 	// 是否懒加载Grid数据（仅对url远程请求数据有效），调用 dataGrid.refresh()时再进行加载
		shrinkToFit: true, 	// 按百分比自动调整列宽
		
		showRownum: true,	// 是否显示行号
		showCheckbox: false,// 是否显示复选框
		sortableColumn: true,// 列表是否允许排序
		
		autoGridHeight: true, // 自动表格高度
		autoGridHeightFix: 0,  // 自动表格高度宽度
		autoGridWidth: true,  // 自动表格宽度
		autoGridWidthFix: 0,  // 自动表格修复宽度
		
		// 窗体按钮绑定
		btnSearch: $("#btnSearch"), 					// 查询按钮
		btnRefreshTree: $("#btnRefreshTree"), 			// 刷新树按钮
		btnExpandTreeNode: $("#btnExpandTreeNode"), 	// 展开树节点按钮
		btnCollapseTreeNode: $("#btnCollapseTreeNode"), // 折叠树节点按钮

		// 树结构表格参数
		treeGrid: false,							// 启用树结构表格
		treeGridModel: 'adjacency',					// 启用简单结构模式
		ExpandColClick: true,						// 单击列可展开
		ExpandColumn: options.treeColumn,			// 要展开的列
		defaultExpandLevel: 0,						// 默认展开的层次
		initExpandLevel: options.defaultExpandLevel,// 保存初始化是设置的展开层次
		
		// 分页相关字段
		inputPageNo: $("#pageNo", searchForm),		// 当前页码字段
		inputPageSize: $("#pageSize", searchForm),	// 页面大小字段
		inputOrderBy: $("#orderBy", searchForm),	// 排序字段

//		// 设置多级表头
//		groupHeaders: {
//	 		twoLevel:[
//	 			{startColumnName: 'postCode', numberOfColumns: 2, titleText: '二级表头'},
//	 			{startColumnName: 'remarks', numberOfColumns:2, titleText:'二级表头2'}
//	 		],
//	 		threeLevel:[
//	 			{startColumnName: 'postCode', numberOfColumns:4, titleText:'三级表头'}
//	 		]
//		},
//		frozenCols: true, 	// 冻结列，在colModel指定frozen: true
//		showFooter: true,	// 是否显示底部合计行
		
        // 数据请求前调用方法
		beforeRequest: function(data){
			loading();
			// 如果是树结构表格
			if (options.treeGrid){
				// 一次性查询设置
				var postData = getParam('postData');
				if (postData.id){
					setParam({postData: {id: postData.id}});
				}else if (postData.nodeid){ // 树展开节点执行
//					setParam({postData: {parentCode: postData.nodeid}});
					var ps = searchForm.serializeArray();
					ps.push({name: "parentCode", value: postData.nodeid});
					setParam({postData: ps});
				}
				// 设置请求参数
				else{
					setParam({postData: searchForm.serializeArray()});
				}
			}else{
				// 设置请求参数
				setParam({postData: searchForm.serializeArray()});
			}
			
			// 请求加载前调用方法
			if (typeof options.ajaxLoad == 'function'){
				options.ajaxLoad(data);
			}

			resizeDataGrid();
			$('.btn').attr("disabled", true);
			$('.ui-jqgrid .loading').remove();
		},
		
		// 数据请求完成调用方法
		loadComplete: function(data){
			
			// 如果是树结构表格
			if (options.treeGrid){
				
				// 展开等待展开树节点
				if (dataGrid.expandNodeIds){
					setTimeout(function(){
						if (dataGrid.expandNodeIds.length > 0){
							$('#'+dataGrid.expandNodeIds.shift()+':visible .tree-plus', dataGrid).click();
						}else{
							if (dataGrid.currentLevel < dataGrid.expandLevel){
								dataGrid.currentLevel++;
								dataGrid.expandNodeIds = [];
								$('.jqgrow:visible .tree-plus', dataGrid).each(function(){
									var id = $(this).parents('.jqgrow').attr('id');
									dataGrid.expandNodeIds.push(id);
								});
								$('#'+dataGrid.expandNodeIds.shift()+':visible .tree-plus', dataGrid).click();
							}else{
								// 如果已经展开完成，则销毁展开ID队列
								dataGrid.expandNodeIds = null;
							}
						}
					}, 10);
				}
				// 树加载后的默认展开级别
				else if (options.defaultExpandLevel && options.defaultExpandLevel > 0){
					expandTreeNode(options.defaultExpandLevel);
					options.defaultExpandLevel = 0;
				}
				// 一次性查询，需清除对应参数
				setParam({postData: {id: '', nodeid: ''}});
			}else{
				// 显示分页代码
				if (data && data.html){
					dataGridPage.html(data.html);
				}
			}
			
			// 请求成功之后调用方法
			if (typeof options.ajaxSuccess == 'function'){
				options.ajaxSuccess(data);
			}
			
			// 绑定列表按钮事件
			if (typeof options.btnEventBind == 'function'){
				options.btnEventBind($('.btnList'));
			}
			
			// 如果有消息，则显示提示消息
			if (data && data.message){
				showMessage(data.message);
			}
			
			resizeDataGrid();
			$('.btn').attr("disabled", false);
			closeLoading();
		},
		loadError: function(data){
			if (typeof options.ajaxError == 'function'){
				options.ajaxError(data);
			}
			$('.btn').attr("disabled", false);
			if (data.responseText && data.responseText != ''){
				showMessage('操作失败，' + data.responseText + '！');
			}
			closeLoading(0, true);
		},
		gridComplete : function() {
			if (typeof options.complete == 'function'){
				options.complete();
			}
			resizeDataGrid();
		},
		onSortCol: function (index, iCol, sortorder) {
			if (options.inputOrderBy && options.inputOrderBy.length){
				options.inputOrderBy.val(index + ' ' + sortorder);
				//setParam({postData: searchForm.serializeArray()});
			}
        },
//		ondblClickRow: function(id, rownum, colnum, event){
////		$('.jqgrow td').attr('onselectstart', 'return false;').css('style', '-moz-user-select:none;');
//			if(document.selection && document.selection.empty) {
//		        document.selection.empty();
//		    }
//		    else if(window.getSelection) {
//		        var sel = window.getSelection();
//		        sel.removeAllRanges();
//		    }
//			$('#' + id + '.jqgrow a:first').click();
//		},
        // 按钮事件绑定
		btnEventBind: function(elements){ 
			elements.each(function(){
				var clickBinded = $(this).attr('data-click-binded');
				if (clickBinded == undefined){
					// 防止重复绑定
					$(this).attr('data-click-binded', true);
					// 绑定按钮单击事件
					$(this).click(function(){
						var se = $(this);
						var url = se.attr('href');
						var title = se.data('title');
						if (title == undefined){
							title = se.attr('title');
						}
						var confirm = se.data('confirm');
						if(confirm != undefined){
							confirmx(confirm, url, function(data){
								showMessage(data.message);
								if(data.result==Global.TRUE){
									var confirmSuccess = se.data('confirmSuccess');
									if (confirmSuccess != undefined){
										try{
											eval(confirmSuccess);
										}catch(e){
											Log.log('confirmSuccess error: ' + e);
										}
									}else{
										// 如果是树结构表格
										if (options.treeGrid){
											var row = getRowData(se.parents('.jqgrow').attr('id'));
											if (row && !isRoot(row.parentCode)){
												refreshTree(1, row.parentCode);
											}else{
												refreshTree();
											}
										}else{
											refresh();
										}
									}
								}
							}, "json");
						}else{
							addTabPage($(this), title, url, options.tabPageId);
						}
						return false;
					});
				}
			});
			return self;
		},
		ajaxLoad: function(data){ // 加载前执行方法
			
		},
		ajaxSuccess: function(data){ // 加载成功后执行方法
			
		},
		ajaxError: function(data){ // 加载失败后执行方法
			
		},
		complete: function(){ // 表格加载完成后执行
			
		}
    }, options);
	
	// 获取列标题
	options.colNames = [];
	for(var i=0; i<options.colModel.length; i++){
		options.colNames.push(options.colModel[i].header);
		// 如果是树结构表格
		if (options.treeGrid || !options.sortableColumn){
			options.colModel[i].sortable = false; // 是否排序列
		}
	}
	
	// 如果是树结构表格
	if (options.treeGrid){
		options.showRownum = false;	// 是否显示行号
		options.showCheckbox = false; // 是否显示复选框
	}
	
	// 显示序号
	if (options.showRownum){
		options.rownumbers = true;	// 显示序号
	}
	
	// 显示多选复选框
	if (options.showCheckbox){
		options.multiselect = true;	// 显示多选复选框
	}
	
	// 如果是本地数据
	if (options.datatype == 'local' && options.rowNum == -1){
		options.rowNum = 1000; // 设置一个最大行数为1000，否则会显示数据不全
	}
	
	// 是否懒加载Grid数据（仅对url远程请求数据有效），调用 dataGrid.refresh()时再进行加载
	if (options.lazyLoad && !options.treeGrid){
		options.datatype_bak = options.datatype;
		options.datatype = 'local';
	}
	
	// 如果设置了多级表头或冻结列
	if (options.groupHeaders || options.frozenCols || !options.shrinkToFit){
		options.shrinkToFit = false;// 不按百分比自适应列宽
	}else{
		options.shrinkToFit = true;	// 按百分比自适应列宽
	}
	
	// 是否显示合计行
	if (options.showFooter){
		options.footerrow = true; 		// 显示底部合计行
		options.userDataOnFooter = true; // 使用json数据中的otherData作为合计行数据。
	}

	// 添加分页及排序参数
	if(options.inputPageNo.length == 0){
		var pageNo = searchForm.data('pageNo');
		searchForm.append('<input id="pageNo" name="pageNo" type="hidden" value="'+(pageNo?pageNo:'')+'"/>');
		options.inputPageNo = $("#pageNo", searchForm);
	}
	if(options.inputPageSize.length == 0){
		var pageSize = searchForm.data('pageSize');
		searchForm.append('<input id="pageSize" name="pageSize" type="hidden" value="'+(pageSize?pageSize:'')+'"/>');
		options.inputPageSize = $("#pageSize", searchForm);
	}
	if(options.inputOrderBy.length == 0){
		var orderBy = searchForm.data('orderBy');
		searchForm.append('<input id="orderBy" name="orderBy" type="hidden" value="'+(orderBy?orderBy:'')+'"/>');
		options.inputOrderBy = $("#orderBy", searchForm);
	}
	
	// 绑定查询表单提交事件
	searchForm.submit(function(){
		refresh();
		return false;
	});
	
	// 绑定工具条上的按钮
	if (typeof options.btnEventBind == 'function'){
		
		// 绑定工具栏上的按钮
		options.btnEventBind($('.btnTool'));
		
		// 绑定查询按钮
		options.btnSearch.click(function(){
			searchForm.toggleClass('hide');
			resizeDataGrid();
			return false;
		});
		
		// 绑定刷新按钮
		options.btnRefreshTree.click(function(){
			$('input[type=reset]', searchForm).click();
			refreshTree();
			return false;
		});
		
		// 绑定全部展开按钮
		options.btnExpandTreeNode.click(function(){
			expandTreeNode(1);
			return false;
		});
		
		// 绑定全部折叠按钮
		options.btnCollapseTreeNode.click(function(){
			collapseTreeNode();
			return false;
		});
	};
	
	// 初始化jqGrid
	dataGrid.jqGrid(options);
	
	// 如果设置了多级表头
	if (options.groupHeaders && options.groupHeaders.twoLevel){

	 	// 设置三级表头
		if (options.groupHeaders.threeLevel){
		 	dataGrid.jqGrid('setComplexHeaders', {
		 	  complexHeaders:{
		 		defaultStyle:true,
		 		twoLevel: options.groupHeaders.twoLevel,
		 		threeLevel: options.groupHeaders.threeLevel
		 	  }
		 	});
		}
		
	 	// 设置二级表头
		else{
		 	dataGrid.jqGrid('setGroupHeaders', {
		 	  useColSpanStyle: true, 
		 	  groupHeaders: options.groupHeaders.twoLevel
		 	});
		}
		
	}
	
	// 是否冻结列
	if (options.frozenCols){
		dataGrid.jqGrid('setFrozenColumns'); // 冻结列，在colModel指定frozen: true
	}	
	
	// 自动调整表格大小
	$(window).resize(function(){
		resizeDataGrid();
	});
	resizeDataGrid();

	/**
	 * 自动调整表格大小
	 */ 
	function resizeDataGrid(){

		// 设置表格高度，最小高度150像素
		var setGridHeight = function(){
			if (!options.autoGridHeight){
				return;
			}
			var gridHeight = 0;
			if (typeof options.autoGridHeight == 'function'){
				gridHeight = options.autoGridHeight();
			}else{
				var tabContent = $(dataGrid).parents('.tab-content');
				if (tabContent.length > 0){
					var portlet = $(dataGrid).parents('.portlet.tabbable.autoHeight:not(.default)');
					if (portlet.length > 0){
						var headerHeight = $(dataGrid).parents('.ui-jqgrid').find('.ui-jqgrid-hdiv').height();
						if (headerHeight == 0){
							headerHeight = 43; // jqgrid标题的高度，如表单页jqgrid自动高度不对，需要修改此设置。
							if (options.groupHeaders && options.groupHeaders.twoLevel){
								if (options.groupHeaders.threeLevel){
									headerHeight *= 3;
								}else{
									headerHeight *= 2;
								}
							}
						}
						gridHeight = tabContent.height() - headerHeight - options.autoGridHeightFix;
					}else{
						gridHeight = 300;
					}
				}else{
					var gridHeight = $(dataGrid).height();
					var gridParent = $(dataGrid).parent();
					if (gridParent.length != 0){
						gridHeight = gridParent.height();
					}
					gridHeight = ($(window).height() - $('body').height() + gridHeight - options.autoGridHeightFix);
					if (gridHeight < 150){
						gridHeight = 150; // 最小高度
					}
					gridParent.height(gridHeight);
				}
			}
			if (gridHeight != 0){
				dataGrid.jqGrid('setGridHeight', gridHeight);
			}
		}
		setGridHeight();

		// 设置表格宽度，最小宽度500像素
		var setGridWidth = function(){
			if (!options.autoGridWidth){
				return;
			}
			var gridWidth = 0;
			if (typeof options.autoGridWidth == 'function'){
				gridWidth = options.autoGridWidth();
			}else{
				var jqGridParent = $(dataGrid).parents('.ui-jqgrid').parent();
				if (jqGridParent.is(':visible')){
					gridWidth = jqGridParent.width() - 2;
				}
			}
			if (gridWidth != 0){
				dataGrid.jqGrid('setGridWidth', gridWidth - options.autoGridWidthFix, (options.shrinkToFit && $(window).width() > 500));
			}
		};
		setGridWidth();

		// 解决弹出框或表单页面内的grid计算不正确问题
		setTimeout(function(){
			setGridHeight();
			setGridWidth();
		}, (!! navigator.userAgent.match(/MSIE 8.0/)) ? 200 : 100);
		
// 		// 底部合计行修正
//		if (options.showFooter){
//			setTimeout(function(){
//		 		$(".ui-jqgrid-bdiv>div").css({"height":"auto"});
//		 		$(".ui-jqgrid-bdiv").css({"padding-bottom":"24px"});
//		 		$(".ui-jqgrid-sdiv").width($(".ui-jqgrid-sdiv").width()-12);
//		 		$(".ui-jqgrid-sdiv").css({"position":"absolute","bottom":"12px"});
//		 		$(".ui-jqgrid-sdiv td").css({"border-bottom":"solid 1px #ddd"});
//		 		$(".ui-jqgrid-ftable td").not("td.jqgrid-rownum").css({"background":"#FFFFE7"});
//		 		$(".frozen-sdiv.ui-jqgrid-sdiv").css({"top":"auto","z-index":"1"});
//		 		$(".frozen-sdiv td:eq(2)").html("&nbsp;合计：");
//			}, 100);
//		}
	}

	/**
	 * 判断编号是否是根节点
	 */
	function isRoot(code){
		return !code || code == '' || code == '0';
	}
	
	/**
	 * 获取参数
	 */
	function getParam(paramName){
		return dataGrid.jqGrid('getGridParam', paramName);
	};

	/**
	 * 设置参数
	 */
	function setParam(params){
		dataGrid.jqGrid('setGridParam', params);
		return self;
	};
	
	/**
	 * 获取所有数据ID
	 */
	function getDataIDs(){
		return dataGrid.jqGrid("getDataIDs");
	};
	
	/**
	 * 获取参数
	 */
	function getRowData(id){
		return dataGrid.jqGrid("getRowData", id);
	};

	/**
	 * 获取选择行ID
	 */
	function getSelectRow(){
		return getParam("selrow");
	};
	
	/**
	 * 获取选择行数组ID
	 */
	function getSelectRows(){
		return getParam("selarrrow");
	};

	/**
	 * 设置选择行
	 */
	function setSelectRow(id, isCancel){
		if (id == undefined && isCancel == undefined){
			dataGrid.jqGrid("resetSelection");
		}else if(id != undefined && isCancel){
			dataGrid.jqGrid("resetSelection", id);
		}else{
			dataGrid.jqGrid("setSelection", id);
		}
		return self;
	};
	
	/**
	 * 刷新表格（带分页）
	 */
	function refresh(pageNo, pageSize){
		if(pageNo){
			options.inputPageNo.val(pageNo);
		}
		if(pageSize){
			options.inputPageSize.val(pageSize);
		}
		var params = {};
		if (options.inputPageNo.val() != ''){
			params.page = options.inputPageNo.val();
		}
		if (options.inputPageSize.val() != ''){
			params.rowNum = options.inputPageSize.val();
		}
		//params.postData = searchForm.serializeArray();
		// 如果是懒加载，则恢复datatype设置。
		if (options.lazyLoad){
			options.datatype = params.datatype = options.datatype_bak;
		}
		setParam(params);
		reloadGrid();
		return self;
	};
	
	/**
	 * 只刷新表格
	 */
	function reloadGrid(){
		dataGrid.trigger('reloadGrid');
	}
	
	/**
	 * 删除当前行
	 */
	function delRowData(id){
		dataGrid.jqGrid("delRowData", id);
		return self;
	};
	
	/**
	 * 删除树节点
	 */
	function delTreeNode(id){
		dataGrid.jqGrid("delTreeNode", id);
		return self;
	};

	/**
	 * 展开树节点
	 * @param level 一次展开的层次
	 */
	function expandTreeNode(level){
		loading();
		setTimeout(function(){
			
			// 一次展开的层次
			dataGrid.expandLevel = level;
			
			// 按层次展开节点
			dataGrid.currentLevel = 1;
			dataGrid.expandNodeIds = [];
			$('.jqgrow:visible .tree-plus', dataGrid).each(function(){
				var id = $(this).parents('.jqgrow')[0].id;
				dataGrid.expandNodeIds.push(id);
			});
			if (dataGrid.expandNodeIds.length > 100){
				showMessage("本次需要展开“" + dataGrid.expandNodeIds.length
						+ "”个节点，因为展开节点过多，执行取消。");
				dataGrid.expandNodeIds = [];
			}else{
				$('#'+dataGrid.expandNodeIds.shift()+':visible .tree-plus', dataGrid).click();
			}
			
			// 如果已加载，则直接展开
	 		for (var i=0; i<dataGrid.expandLevel; i++){
	 			$('.jqgrow:visible .tree-plus', dataGrid).click();
	 		}
			
			closeLoading();
		}, 10);
		return self;
	};
	
	/**
	 * 折叠树节点
	 */
	function collapseTreeNode(){
		loading();
		setTimeout(function(){
			$('.tree-minus', dataGrid).click();
			closeLoading();
		}, 10);
		return self;
	};
	
	/**
	 * 刷新树表格
	 */
	function refreshTree(expandLevel, parentCode){
		if (expandLevel){
			options.defaultExpandLevel = expandLevel;
		}
		if (!isRoot(parentCode)){
			setParam({postData: {id: parentCode}});
		}else if (parentCode != undefined){
			options.defaultExpandLevel = options.initExpandLevel;
		}
		reloadGrid();
		return self;
	};
	
	// public method
	var self = {
		
		/**
		 * 直接调用jqGrid对象方法
		 */
		jqGrid: function(option, value, v2, v3, v4, v5){
			return dataGrid.jqGrid(option, value, v2, v3, v4, v5);
		},
		
		/**
		 * 设置参数
		 */
		setParam: function(params){
			return setParam(params);
		},
		
		/**
		 * 获取参数
		 */
		getParam: function(paramName){
			return getParam(paramName);
		},
		
		/**
		 * 获取所有数据ID
		 */
		getDataIDs: function(){
			return getDataIDs();
		},
		
		/**
		 * 获取行数据
		 */
		getRowData: function(rowId){
			return getRowData(rowId);
		},
		
		/**
		 * 获取选择行ID
		 */
		getSelectRow: function(){
			return getSelectRow();  
		},
		
		/**
		 * 获取选择行数组ID
		 */
		getSelectRows: function(){
			return getSelectRows();  
		},
		
		/**
		 * 设置选择行
		 */
		setSelectRow: function(id, isCancel){
			return setSelectRow(id, isCancel);
		},
		
		/**
		 * 刷新表格（带分页）
		 */
		refresh: function(pageNo, pageSize){
			return refresh(pageNo, pageSize);
		},
		
		/**
		 * 只刷新表格
		 */
		reloadGrid: function(){
			return reloadGrid();
		},
		
		/**
		 * 删除当前行
		 */
		delRowData: function(id){
			return delRowData(id);
		},
		
		/**
		 * 删除树节点
		 */
		delTreeNode: function(id){
			return delTreeNode(id);
		},
		
		/**
		 * 展开树节点
		 * @param level 一次展开的层次
		 */
		expandTreeNode: function(level){
			return expandTreeNode(level);
		},

		/**
		 * 折叠树节点
		 */
		collapseTreeNode: function(){
			collapseTreeNode();
		},
		
		/**
		 * 刷新树表格
		 */
		refreshTree: function(expandLevel, parentCode){
			return refreshTree(expandLevel, parentCode);
		},
		
		/**
		 * 按钮事件绑定
		 */
		btnEventBind: function(elements){
			return btnEventBind(elements);
		}
	};
	
	return self;
};

/**
 * 封装为jQuery插件 ThinkGem
 */
$.fn.dataGrid = function (option, value, v2, v3, v4, v5) {
	var method_call;

	var $set = this.each(function () {
		var $this = $(this);
		var data = $this.data('dataGrid');
		var options = typeof option === 'object' && option;
		if (!data){
			data = new DataGrid(options, $this);
			window[$this.attr('id')] = data;
			$this.data('dataGrid', data);
		}
		if (typeof option === 'string' && typeof data[option] === 'function') {
			if(value instanceof Array) method_call = data[option].apply(data, value, v2, v3, v4, v5);
			else method_call = data[option](value, v2, v3, v4, v5);
		}
	});
	
	// 如果没有找到方法，则去jqGrid里查找
	if (method_call === undefined){
		var fn = $.jgrid.getMethod(option);
		if (fn) {
			var args = $.makeArray(arguments).slice(1);
			method_call = fn.apply(this, args);
		}
	}

	return (method_call === undefined) ? $set : method_call;
};

/**
 * 翻页方法
 */
function page(pageNo, pageSize, param){
	try{
		if (param && param != ''){
			if (dataGrids != undefined && dataGrids[param].refresh != undefined){
				dataGrids[param].refresh(pageNo, pageSize);
			}else{
				$('#' + param).dataGrid('refresh', pageNo, pageSize);
			}
		}else{
			if (dataGrid != undefined && dataGrid.refresh != undefined){
				dataGrid.refresh(pageNo, pageSize);
			}else{
				$('#dataGrid').dataGrid('refresh', pageNo, pageSize);
			}
		}
	}catch(e){ }
	return false;
}

/**
 * 覆盖jqGrid方法
 */
$.extend($.jgrid,{
	/**
	 * 去掉HTML标记
	 */
	stripHtml : function(v) {
		v = String(v);
    	return v.replace(/<[^>]*>/g, "");
	}
});

/**
 * 扩展jqGrid方法
 * @author ThinkGem@163.com
 * @version 2015-1-12
 * @param $
 */
(function($){
	$.jgrid.extend({
		// 根据树级别获取id数组
		getIdsByLevel: function(lvl) {
			var ids = [];
			this.each(function(){
				var $t = this;
				if( !$t.grid || !$t.p.treeGrid ) {return;}
				var expCol = $t.p.expColInd,
				expanded = $t.p.treeReader.expanded_field,
				isLeaf = $t.p.treeReader.leaf_field,
				level = $t.p.treeReader.level_field,
				icon = $t.p.treeReader.icon_field,
				loaded = $t.p.treeReader.loaded;
				var data = $t.p.data;
				for (var i=0; i<data.length; i++){
					if (!data[i][isLeaf] && data[i][level] == lvl){
						ids.push(data[i]._id_);
					}
				};
			});
			return ids;
		},
		// 树机构删除子节点
		delTreeChildNode : function (rowid) {
			return this.each(function () {
				var $t = this, rid = $t.p.localReader.id, i,
				left = $t.p.treeReader.left_field,
				right = $t.p.treeReader.right_field,
				expanded = $t.p.treeReader.expanded_field,
				loaded = $t.p.treeReader.loaded, myright, width, res, key;
				if(!$t.grid || !$t.p.treeGrid) {return;}
				var pos = $t.p._index[rernameCookie);
					if (StringUtils.isNotEmpty(currentMember.getRealName())) {
						loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, URLEncoder.encode(currentMember.getRealName().toLowerCase(), "UTF-8"));
						loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
						loginMemberNickeNameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
						response.addCookie(loginMemberNickeNameCookie);
					}
					rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, URLEncoder.encode("true".toLowerCase(), "UTF-8"));
					rememberMeCookie.setPath(request.getContextPath() + "/");
					rememberMeCookie.setMaxAge(-1);// 负数 - 当浏览器关闭时自动删除。
					response.addCookie(rememberMeCookie);


				}else if(list.get(0).getStatus() == 1 && list.get(0).getIsDelete() == 1){//审核不通过
					String errorMsg = "";
					Criteria criterias = new Criteria();
					criterias.add(Restrictions.eq("buyerId", list.get(0).getId()));
					criterias.add(Restrictions.eq("isDelete", 1));
					criterias.add(Restrictions.order("createDate", "DESC"));
					/**获取审核不通过的原因*/
					List<BuyerAudit> lists = buyerAuditService.getList(getParamMap(), criterias);
					if(lists.size() >0){
						errorMsg = lists.get(0).getAuditOpinion();
					}
					if(StringUtil.isEmpty(errorMsg)){
						errorMsg = "";
					}
					result.put(STATUS, FALSE);
					result.put("buyerId", lists.get(0).getBuyerId());
					result.put(MESSAGE, "此采购商审核未通过,原因:"+errorMsg);
					if(Global.WHICH_APP.equals(whichclient)){
						result.put("url",Global.TEMPLATE_APP + PATH + "/member/login");
					}else{
						result.put("url", "member/login");
					}
				}else if(list.get(0).getIsDelete() == 0){//被停用
					result.put(STATUS, FALSE);
					result.put(MESSAGE, "当前账户已被停用，请联系管理员！");
					if(Global.WHICH_APP.equals(whichclient)){
						result.put("url",Global.TEMPLATE_APP + PATH + "/member/login");
					}else{
						result.put("url", "member/login");
					}
				}else if(list.get(0).getIsDelete() == 1){//未审核
					Criteria criterias = new Criteria();
					criterias.add(Restrictions.eq("isDelete", 1));
					criterias.add(Restrictions.eq("tenantId", getTenantId()));
					criterias.add(Restrictions.eq("buyerId", list.get(0).getId()));

					List<BuyerCertificate> buyerCList = buyerCertificateService.getList(getParamMap(),criterias);
					if (buyerCList !=null && buyerCList.size() > 0){
						result.put(STATUS, ERROR);
						result.put(MESSAGE, "此采购商正在审核中!");
						if(Global.WHICH_APP.equals(whichclient)){
							result.put("url",Global.TEMPLATE_APP + PATH + "/member/login");
						}else{
							result.put("url", "member/login");
						}
					}else{
						result.put(STATUS, "regRep");
						result.put(MESSAGE, "此采购商未注册完毕!");
					}
					result.put("buyerId", list.get(0).getId());
				}
				/**判断当list.get(0).getStatus()为2 表示采购商审核通过，否则为不通过 不许登录，但是有提示 Auth:zhangqiang Time:2015-10-16 16:55:35 End */

				eclogRemark= "用户正常登录";
			} else {
				criteria.add(Restrictions.eq("isDelete",1));
				List<BuyerOperator> BuyerOperatorList = buyerOperatorService.getList(getParamMap(), criteria);
				if (CollectionUtils.isNotEmpty(BuyerOperatorList) && BuyerOperatorList.size() == 1) {
					BuyerOperator buyerOperators = BuyerOperatorList.get(0);
					if(buyerOperators.getIsvalid() != 1){
						result.put(STATUS, ERROR);
						result.put(MESSAGE, "此账号未启用,请联系管理员!");
					}else{
						Buyer buyers = buyerService.get(getParamMap(),buyerOperators.getBuyerId());

						result.put(STATUS, SUCCESS);
						if(Global.WHICH_APP.equals(whichclient)){
							if("shoppingCart".equals(type)){
								result.put("url","/cart/list?whichclient=whichapp");
							}else{
								result.put("url","/member/index?whichclient=whichapp");
							}
						}else{
							result.put("url", "member/index");
						}

						session.removeAttribute(Global.CURRENT_MERMBER);

						session.removeAttribute(Global.CURRENT_OPERATOR);

						session.setAttribute(Global.CURRENT_MERMBER, buyers);

						session.setAttribute(Global.CURRENT_OPERATOR, buyerOperators);
						//登录标识  operator:操作员
						session.setAttribute(Global.CURRENT_LOGIN_TYPE, LoginType.operator);
						//操作员角色
						session.setAttribute(Global.CURRENT_ROLE, buyerOperators.getRoleValue());

                        // 先清空cookie
						Cookie loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, null);
						loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
						response.addCookie(loginMemberUsernameCookie);
						Cookie loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, null);
						loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
						response.addCookie(loginMemberNickeNameCookie);
						Cookie rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, null);
						rememberMeCookie.setPath(request.getContextPath() + "/");
						response.addCookie(rememberMeCookie);

//						Cookie loginOperatorUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_OPERATOR_COOKIE_NAME, null);
//						loginOperatorUsernameCookie.setPath(request.getContextPath() + "/");
//						response.addCookie(loginOperatorUsernameCookie);
//						Cookie loginOperatorNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_OPERATORREALNAME_COOKIE_NAME, null);
//						loginOperatorNickeNameCookie.setPath(request.getContextPath() + "/");
//						response.addCookie(loginOperatorNickeNameCookie);
//						Cookie reOperatorCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_OPERATOR_COOKIE_NAME, null);
//						reOperatorCookie.setPath(request.getContextPath() + "/");
//						response.addCookie(reOperatorCookie);




                        // 登陆成功后根据当前浏览器的cookie 生成采购商购物车
						setMermberCart(buyers.getId(), request);


                        // 写入采购商登录Cookie
						loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, URLEncoder.encode(buyerOperators.getUserName().toLowerCase(), "UTF-8"));
						loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
						loginMemberUsernameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
						response.addCookie(loginMemberUsernameCookie);
						if (StringUtils.isNotEmpty(buyerOperators.getRealName())) {
							loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, URLEncoder.encode(buyerOperators.getRealName().toLowerCase(), "UTF-8"));
							loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
							loginMemberNickeNameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
							response.addCookie(loginMemberNickeNameCookie);
						}
						rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, URLEncoder.encode("true".toLowerCase(), "UTF-8"));
						rememberMeCookie.setPath(request.getContextPath() + "/");
						rememberMeCookie.setMaxAge(-1);// 负数 - 当浏览器关闭时自动删除。
						response.addCookie(rememberMeCookie);



//						loginOperatorUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_OPERATOR_COOKIE_NAME, URLEncoder.encode(buyerOperators.getUserName().toLowerCase(), "UTF-8"));
//						loginOperatorUsernameCookie.setPath(request.getContextPath() + "/");
//						loginOperatorUsernameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
//
//						if (StringUtils.isNotEmpty(buyerOperators.getRealName())) {
//							loginOperatorNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_OPERATORREALNAME_COOKIE_NAME, URLEncoder.encode(buyerOperators.getRealName().toLowerCase(), "UTF-8"));
//							loginOperatorNickeNameCookie.setPath(request.getContextPath() + "/");
//							loginOperatorNickeNameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
//							response.addCookie(loginOperatorNickeNameCookie);
//						}
//						reOperatorCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_OPERATOR_COOKIE_NAME, URLEncoder.encode("true".toLowerCase(), "UTF-8"));
//						reOperatorCookie.setPath(request.getContextPath() + "/");
//						reOperatorCookie.setMaxAge(-1);
//						response.addCookie(reOperatorCookie);
						return result;
					}
					eclogRemark= "已禁用账户尝试登录";
				}else{
					result.put(STATUS, ERROR);
					result.put(MESSAGE, "用户名或密码错误");
					eclogRemark= "错误用户名或密码登录";
				}

				if(Global.WHICH_APP.equals(whichclient)){
					result.put("url",Global.TEMPLATE_APP + PATH + "/member/login");
				}else{
					result.put("url", "member/login");
				}
			}


			// 保存登录日志信息
			Map<String, Object> ecLogParamMap = new HashMap<String, Object>(0);
			saveBecLog(request, BecLog.LogType.登录.toString(), eclogRemark, ecLogParamMap);
		} catch (Exception e) {
			logger.error("采购商登录校验时，发生异常", e);
			e.printStackTrace();
		}
		return result;
	}



	/**
	 * 采购商退出登录
	 *
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,
						 HttpServletResponse response, HttpSession session) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "采购商退出登录";
		setLogInfo(info);
		logger.debug(info);
		try {
			session.removeAttribute(Global.CURRENT_MERMBER);
			Cookie rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, "false");
			rememberMeCookie.setPath(request.getContextPath() + "/");
			rememberMeCookie.setMaxAge(0);// 0 - 立即删除
			response.addCookie(rememberMeCookie);
		} catch (Exception e) {
			logger.error("采购商退出,注销采购商信息时发生错误", e);
		}
		if(Global.WHICH_APP.equals(whichclient)){
			return "redirect:login?whichclient=whichapp";
		}else{
			return "redirect:" + "/index";
		}
	}

	/**
	 * 会员退出登录
	 *
	 * @return
	 */
	@RequestMapping(value = "/logoutForApp", method = {RequestMethod.POST})
	public
	@ResponseBody
	Object logoutForApp(HttpServletRequest request,
						HttpServletResponse response, HttpSession session) {
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		String info = "logoutForApp";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			session.removeAttribute(Global.CURRENT_MERMBER);
			result.put(STATUS, SUCCESS);
			return result;
		} catch (Exception e) {
			logger.error("会员退出,注销会员信息时发生错误", e);
			result.put(STATUS, ERROR);
			return result;
		}

	}

	/**
	 * 采购商中心主页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "index")
	public String index(Model model, HttpServletRequest request,
						HttpServletResponse response) {
		String info = "采购商中心主页面";
		setLogInfo(info);
		logger.debug(info);
		model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
		model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
		try {
			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  Start--------*/
			LoginType loginType = getLoginType(request);
			model.addAttribute("loginType", loginType);
			String operatorRole = getOperatorRole(request);
			BuyerOperator buyerOperator = getCurrentOperator(request);
			Buyer mb = getCurrentMember(request);
			if (LoginType.operator.equals(loginType)) {
				model.addAttribute("mp", buyerOperator);
				model.addAttribute("role", operatorRole);
			}
			/**-------------------Desc:判断登录方式 采购商登录还是操作员登录 Auth:zhangqiang Time:2016-02-19 11:10:08  End--------*/


			BuyerRank mbr = buyerRankService.get(getParamMap(), mb.getRankId());
			model.addAttribute("mbr", mbr);
			/**查看采购商 以及刷新时查询采购商当前积分 Auth:zhangqiang Time:2015-10-08 17:46:35 Start */
			List<String> memberIds = null;
			memberIds = Arrays.asList(mb.getId());
			List<Buyer> memberList = buyerService.findListByIds(getParamMap(), memberIds);
			if(memberList.size() > 0){
				mb = memberList.get(0);
			}
			/**查看采购商 以及刷新时查询采购商当前积分 Auth:zhangqiang Time:2015-10-08 17:46:35 End */
			model.addAttribute("mb", mb);
			/*Criteria criteria = new Criteria();
			List<Order.OrderStatus> orderStatusList = new ArrayList<Order.OrderStatus>();
			// orderStatusList.add(Order.OrderStatus.cancel);
			orderStatusList.add(Order.OrderStatus.deleted);
			orderStatusList.add(Order.OrderStatus.invalid);
			criteria.add(Restrictions.notIn("orderStatus", orderStatusList));
			criteria.add(Restrictions.eq("memberId", mb.getId()));
			criteria.add(Restrictions.eq("platform",getPlatform()));
			criteria.add(Restrictions.order("a.createDate","DESC"));
			criteria.add(Restrictions.eq("orderType",0));//订单类型：0_一般订单，1_众筹订单
			Pager pager = new Pager();
			pager.setPageSize(3);

			List<Order> orderList = (List<Order>)orderService.getPager(getParamMap(), criteria,pager).getList();

			List<Order> removeOrderList = new ArrayList<Order>();
			List<OrderItem> allOrderItemList = new ArrayList<OrderItem>();

			if(orderList!=null && orderList.size()>0) {
				for (Order order : orderList) {
					Integer isReview=1;
					criteria = new Criteria();
					criteria.add(Restrictions.eq("orderSn", order.getOrderSn()));
					criteria.add(Restrictions.limit("0", "3"));
					List<OrderItem> orderItemList = orderItemService.getList(getParamMap(), criteria);
					if(orderItemList != null && orderItemList.size() > 0) {
						for (OrderItem orderItem : orderItemList) {
							criteria = new Criteria();
							criteria.add(Restrictions.eq("goodsId", orderItem.getGoodsId()));
							criteria.add(Restrictions.limit("0", "1"));
							List<GoodsImages> goodsImagesList = goodsImagesService.getList(getParamMap(), criteria);
							if (goodsImagesList != null && goodsImagesList.size() > 0) {
								String pic = goodsImagesList.get(0).getPic();
								orderItem.setPic(pic);
							}
							allOrderItemList.add(orderItem);
							// 由于一单中多个商品有一个未评价，则为未评价 chenbin@2015-10-23
							if( isReview == 1){
								isReview=(orderItem.getIsReview()==0)?0:1;
							}
						}
					} else {
						removeOrderList.add(order);
					}

					order.setIsReview(isReview);
				}
				orderList.removeAll(removeOrderList);
			}*/

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("buyerId", mb.getId()));
			criteria.add(Restrictions.eq("isRead", "NO"));
			List<B2BGoodsReview> grs = goodsReviewService.getAllByCriteria(getParamMap(), criteria);
			model.addAttribute("unreadGoodsReviewCount", grs == null ? 0 : grs.size());

			//判断是否有账户信息，如果没有就插入
			Map<String,Object> mp=getParamMap();
			mp.put("userId",mb.getId());
			mp.put("userName",mb.getUserName());
			Account account=accountService.findAccountByUser(mp);
			if(account==null){
				account=new Account();
				account.setTenantId(this.getTenantId());
				account.setPlatform(this.getPlatform());
				account.setUserId(mb.getId());
				account.setUserName(mb.getUserName());
				account.setAccountTotal(0.00);
				account.setAccountBlock(0.00);
				account.setCreateUser(mb.getUserName());
				account.setCreateDate(new Date());
				account=accountService.save(this.getParamMap(),account);
			}

			setPublicDate2Model(model);
//			model.addAttribute("orderItemList", allOrderItemList);
//			model.addAttribute("orderList", orderList);
			model.addAttribute("orderStatusMapping", getOrderStatusMapping());
			model.addAttribute("cls","app_setting1");
			model.addAttribute("account","account");

			// 便利提醒统计数量
			getConvenientTips(model, request);
			getAllCatelog(model);
			// 写入Cookie
			writeCookie(request, response);

			//新品推荐
			getNewGoods(model, 5);

			//浏览历史
			getHistory(model, mb.getId(), 5);

			//关注商品
			getAttention(model, mb.getId(), 5);

		} catch (Exception ex) {
			logger.error("访问" + info + "时，发生异常", ex);
			ex.printStackTrace();
		}
		String whichclient = request.getParameter(Global.WHICHCLIENT);
		if(Global.WHICH_APP.equals(whichclient)){
			return Global.TEMPLATE_APP + PATH + "/member/index";
		}else{
			return Global.TEMPLATE_MALL + PATH + "/member/index";
		}

	}

	/**
	 * 获取我的关注
	 *  @param model
	 * @param buyerId
	 * @param pageSize
	 */
	private void getAttention(Model model, String buyerId, int pageSize) throws Exception {
		Pager pager = new Pager();
		Criteria criteria = new Criteria();

		criteria.add(Restrictions.eq("c.buyerId", buyerId));
		criteria.add(Restrictions.group("c.goodsId"));
		pager.setOrderType("DESC");
		pager.setOrderBy("c.createDate");
		pager.setPageSize( pageSize );
		pager = goodsAttentionService.getPager(getParamMap(), criteria, pager);
		model.addAttribute("attentionList", pager.getList());
	}

	/**
	 * 获取浏览历史
	 * @param model
	 * @param buyerId
	 * @param pageSize
	 * @throws Exception
     */
	private void getHistory(Model model, String buyerId, int pageSize) throws Exception {
		Pager pager = new Pager();
		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("c.buyerId", buyerId));
		criteria.add(Restrictions.group("d.goodsId"));
		criteria.add(Restrictions.order("c.createDate","DESC"));
		pager.setOrderType("DESC");
		pager.setOrderBy("c.createDate");
		pager.setPageSize( pageSize );
		pager = historyService.getPager(getParamMap(), criteria, pager);
		model.addAttribute("historyList", pager.getList());
	}

	/**
	 * 获取最新商品
	 * @param model
	 * @param pageSize
	 * @throws Exception
     */
	private void getNewGoods(Model model, int pageSize) throws Exception {
		Pager pager = new Pager();
		if(pager.getPageNumber() == null){
			pager.setPageNumber( 1 );
		}

		pager.setPageSize(pageSize);

		pager.setOrderBy("modifyDate");
		pager.setOrderType("desc");

		Criteria criteria = new Criteria();
		criteria.add(Restrictions.eq("o.tenantId", getTenantId()));
		criteria.add(Restrictions.ge("o.platform", 2));
		criteria.add(Restrictions.eq("o.isMarketable", 1));
		criteria.add(Restrictions.eq("o.status", 5));

		pager = goodsService.getPager4BEC(getParamMap(), criteria, pager);

		List<Goods> list = (List<Goods>) pager.getList();

		model.addAttribute("newGoods", list);
	}


	private void writeCookie(HttpServletRequest request,
							 HttpServletResponse response) throws UnsupportedEncodingException {

		LoginType loginType = getLoginType(request);
		Buyer currentMember = getCurrentMember(request);
		BuyerOperator buyerOperator = getCurrentOperator(request);

		// 先清空cookie
		Cookie loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, null);
		loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
		response.addCookie(loginMemberUsernameCookie);
		Cookie loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, null);
		loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
		response.addCookie(loginMemberNickeNameCookie);
		Cookie rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, null);
		rememberMeCookie.setPath(request.getContextPath() + "/");
		response.addCookie(rememberMeCookie);


		// 登陆成功后根据当前浏览器的cookie 生成采购商购物车

		if (LoginType.operator.equals(loginType)) {
			if (buyerOperator != null) {
				setMermberCart(currentMember.getId(), request);
				// 写入采购商登录Cookie
				loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, URLEncoder.encode(buyerOperator.getUserName().toLowerCase(), "UTF-8"));
				loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
				loginMemberUsernameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
				response.addCookie(loginMemberUsernameCookie);
				if (buyerOperator.getRealName() != null) {
					loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, URLEncoder.encode(buyerOperator.getRealName().toLowerCase(), "UTF-8"));
					loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
					loginMemberNickeNameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
					response.addCookie(loginMemberNickeNameCookie);
				}
				rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, URLEncoder.encode("true".toLowerCase(), "UTF-8"));
				rememberMeCookie.setPath(request.getContextPath() + "/");
				rememberMeCookie.setMaxAge(-1);
				response.addCookie(rememberMeCookie);


			}
		}else{
			if (currentMember != null) {
				setMermberCart(currentMember.getId(), request);
				// 写入采购商登录Cookie
				loginMemberUsernameCookie = new Cookie(UserCookie.LOGIN_MEMBER_USERNAME_COOKIE_NAME, URLEncoder.encode(currentMember.getUserName().toLowerCase(), "UTF-8"));
				loginMemberUsernameCookie.setPath(request.getContextPath() + "/");
				loginMemberUsernameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
				response.addCookie(loginMemberUsernameCookie);
				if (currentMember.getRealName() != null) {
					loginMemberNickeNameCookie = new Cookie(UserCookie.LOGIN_MEMBER_NICKNAME_COOKIE_NAME, URLEncoder.encode(currentMember.getRealName().toLowerCase(), "UTF-8"));
					loginMemberNickeNameCookie.setPath(request.getContextPath() + "/");
					loginMemberNickeNameCookie.setMaxAge(UserCookie.COOKIE_MAX_AGE);
					response.addCookie(loginMemberNickeNameCookie);
				}
				rememberMeCookie = new Cookie(UserCookie.LOGIN_MEMBER_ME4_COOKIE_NAME, URLEncoder.encode("true".toLowerCase(), "UTF-8"));
				rememberMeCookie.setPath(request.getContextPath() + "/");
				rememberMeCookie.setMaxAge(-1);
				response.addCookie(rememberMeCookie);
			}
		}


	}

	/**
	 * 帮助页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "help")
	public String hlep(Model model) {
		String info = "帮助页面";
		setLogInfo(info);
		logger.error(info);
		return Global.TEMPLATE_MALL + PATH + "/member/index_help";
	}

	/**
	 * 结算之前进行库存校验
	 * @param request
	 * @return
	 */
	@RequestMapping("/stockJudge")
	@ResponseBody
	public Object stockJudge(HttpServletRequest request){
		String info = "结算前库存校验";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 Start */
//		boolean success = true;
		String success = "success";
		/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 End */
		StringBuilder msg = new StringBuilder();
		String msgStr = "";

		String o = request.getParameter("o");//购物车数据ID集合
		Buyer currentMember = getCurrentMember(request);

		try {
			String[] orderIds = o.split(",");
			List<String> orderIdsList = new ArrayList<String>();
			for (String orderId : orderIds) {
				if (!StringUtils.isEmpty(orderId)) {
					orderIdsList.add(orderId);
				}
			}

			List<CartItem> cartItemList = null;

			/**
			 * Desc:createOrderType--》产生订单类型 值为1表示  由采购单生成订单 其它此参数不起作用
			 * Auth:zhangqiang
			 * Time:2016-02-29 10:45:35
			 */
			String createOrderType = request.getParameter("createOrderType");
			if(StringUtil.isNotEmpty(createOrderType) && "1".equals(createOrderType)){
				cartItemList = purchaseOrderDetailService.getListByBuyerIdAndIdsPurchaseOrder(getParamMap(), currentMember.getId(),orderIdsList);
			}else{
				cartItemList = getCartItemByLoginType(request, orderIdsList);
			}
			/*------------------------------------------------------------------------------------------------------------*/

			for( CartItem ci : cartItemList ){
				Goods goods = goodsService.get(getParamMap(), ci.getGoodsId());
				/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 Start */
				if(goods.getIsMarketable() != 1){
					success = "isMarketable";
					result.put("goodsId", ci.getGoodsId());
					msgStr = "商品【"+ci.getName()+"】 已下架,请删除此商品再结算!";
					break;
				}
				/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 End */
				if( ci.getQuantity() > goods.getStock() ){
					success = "false";
					msg.append("商品【" + ci.getName() + "】、");
				}
			}

			if( "success".equals(success) ){
				msg.append("库存校验成功");
				/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 Start */
			}else if("isMarketable".equals(success)){
				msg.append(msgStr);
				/**增加对商品是否上下架的判断 Auth:zhangqiang Time:2015-10-12 17:42:35 End */
			}else{
				msg = new StringBuilder(msg.substring(0, msg.length()-1)).append("库存不足，请联系商家");
			}

		}catch(Exception e){
			logger.error(info + "库存校验时，发生异常:" + e);
			e.printStackTrace();
			success = "false";
			result.put("success", success);
			result.put("msg", "系统异常，请联系管理员！");
			return result;
		}

		result.put("success", success);
		result.put("msg", msg);
		return result;
	}

	private List<CartItem> getCartItemByLoginType(HttpServletRequest request, List<String> orderIdsList) throws Exception{
		/**-------------------Desc:判断登录方式 采购商登录还是操作员登录Start--------*/
		LoginType loginType = getLoginType(request);
		if (LoginType.operator.equals(loginType)) {
			BuyerOperator buyerOperator = getCurrentOperator(request);
			if(StringUtil.isNotEmpty(buyerOperator.getId())){
				buyerOperator = buyerOperatorService.get(getParamMap(),buyerOperator.getId());
			}

				return cartItemService.getListByMemberIdAndIds(getParamMap(),buyerOperator .getId(),orderIdsList);

		}else{
			Buyer currentMember = getCurrentMember(request);
			return cartItemService.getListByMemberIdAndIds(getParamMap(), currentMember.getId(),orderIdsList);
		}
	}

	/**
	 * 采购单转订单
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("/purchaseOrderChangeOrder")
	public String purchaseOrderChangeOrder(Model model, HttpServletRequest request) {
		String info = "采购单转订单";
		setLogInfo(info);
		logger.debug(info);

		String o = request.getParameter("o");
		model.addAttribute("o", o);

		Buyer currentMember = getCurrentMember(request);
		BuyerRank buyerRank = null;
		try {
			buyerRank = buyerRankService.get(getParamMap(), currentMember.getRankId());
			model.addAttribute("memberRankScale", buyerRank.getScale()/100);

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("re.buyerId", currentMember.getId()));

			List<BuyerReceiver> receiverList = buyerReceiverService.getList(getParamMap(), criteria);
			model.addAttribute("receiverList", receiverList);
			Receiver ReceiverN=new Receiver();

			if (receiverList != null && receiverList.size() > 0) {
				for(BuyerReceiver receiver : receiverList){
					if(receiver.getIsDefault()==1){
						model.addAttribute("receiver", receiver);
						MyBeanUtils.copyBean2Bean(ReceiverN,receiver);
						break;
					}
				}
				model.addAttribute("receiverN", ReceiverN);
			}

			Map<String,String> invoiceInfo=new HashMap<String,String>();
			invoiceInfo.put("invoiceContent","no");
			invoiceInfo.put("invoiceTitle","");
			invoiceInfo.put("invoiceType","");
			BuyerInvoice buyerInvoice = buyerInvoiceService.getDefaultInvoiceInfo(getParamMap(), currentMember.getId());

			if(buyerInvoice!=null){
				invoiceInfo.put("invoiceContent","infos");
				invoiceInfo.put("invoiceTitle",buyerInvoice.getInvoiceTitle());
				invoiceInfo.put("invoiceType","normal");
			}else{
				buyerInvoice = new BuyerInvoice();
			}

			List<BuyerInvoice> buyerInvoicesList = buyerInvoiceService.findList(getParamMap(), "buyerId", currentMember.getId());
			if(buyerInvoicesList.isEmpty()){
				BuyerInvoice newInvoice= new BuyerInvoice();
				newInvoice.setInvoiceTitle("个人");
				newInvoice.setTenantId(getTenantId());
				newInvoice.setBuyerId(currentMember.getId());
				newInvoice.setIsDefault(1);
				newInvoice.setCreateUser(currentMember.getId());
				newInvoice.setCreateDate(new Date());
				buyerInvoiceService.save(getParamMap(), newInvoice);
				buyerInvoicesList.add(newInvoice);
			}

			/****
			 * OLD 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23
			 List<CartItem> cartItemList = cartItemService.getListByMemberId(getParamMap(), currentMember.getId());
			 */
			/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Start */
			String[] orderIds = o.split(",");
			List<String> orderIdsList = new ArrayList<String>();
			for(String orderId : orderIds ){
				if( !StringUtils.isEmpty( orderId )) {
					orderIdsList.add(orderId);
				}
			}

			List<CartItem> cartItemList = cartItemService.getListByMemberIdAndIds(getParamMap(), currentMember.getId(),orderIdsList);

			/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 End */

//			model.addAttribute("cartItemList", groupCartItemByShop(cartItemList));
			model.addAttribute("member", currentMember);
			//发票信息
			model.addAttribute("invoiceInfo",invoiceInfo);
			model.addAttribute("memberInvoice",buyerInvoice);
			model.addAttribute("memberInvoicesList",buyerInvoicesList);

			// 支付方式
			List<PaymentMethod> paymentMethods = getPaymentMethodList();
			model.addAttribute("paymentMethodList", paymentMethods);

			PaymentMethod paymentMethodsN=new PaymentMethod();

			model.addAttribute("paymentMethod", paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0):null);

			/**作为新对象开辟空间 防止在转换为json对象时引用其他对象地址 Liuxiaobing  2016-02-07 15:11:52 **/
			MyBeanUtils.copyBean2Bean(paymentMethodsN, paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0):null);
			model.addAttribute("paymentMethodN",paymentMethodsN);

//			if (!StringUtil.isEmpty(paymentMethodId)) {
//				model.addAttribute("paymentMethodIds", paymentMethodId);
//			}else{
				model.addAttribute("paymentMethodIds", paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0).getId():null);
//			}

			// 配送方式

			model.addAttribute("deliveryMethodList", getDeliveryMethodList());
			model.addAttribute("deliveryMethod", getDeliveryMethodList().get(0));

			// 送货时间
			model.addAttribute("deliveryTimeList", getDeliveryTimeList());

			model.addAttribute("deliveryTimeIds", getDeliveryTimeList().get(0).getId());

			model.addAttribute("deliveryTimeName", getDeliveryTimeList().get(0).getIntroduce());

			List<Map<String,Object>> items = groupCartItemByShop(cartItemList);

			/**从支付审核页面获取快递ID Auth:zhangqiang Time:2015-09-25 17:49:35 Start
			 * */
			String deliveryId = null;

			/******** 修改配送方式，获取默认的配送方式  TianYu 2016-1-18 10:08:57  New Start ***********/
			List<DeliveryMethod> deliveryMethods = getDeliveryMethodList();
			model.addAttribute("deliveryMethodList", getDeliveryMethodList());

			if( deliveryMethods!=null && deliveryMethods.size() > 0){
				DeliveryMethod defaultDeliveryMethod = null;
				for(DeliveryMethod dm : deliveryMethods){
					if( 0 == dm.getIsDefault() ){
						defaultDeliveryMethod = dm;
						break;
					}
				}

				if( defaultDeliveryMethod != null ){
					model.addAttribute("deliveryMethod", defaultDeliveryMethod);
					deliveryId = defaultDeliveryMethod.getId();
				}else{
					model.addAttribute("deliveryMethod", deliveryMethods.get(0));
					deliveryId = deliveryMethods.get(0).getId();
				}
			}else{
				throw new Exception("商城未设置配送方式");
			}
			/******** 修改配送方式，获取默认的配送方式  TianYu 2016-1-18 10:08:57  New End ***********/

			costCalculation(items,buyerRank.getScale()/100, ReceiverN, deliveryId, "no", "no");
			model.addAttribute("didFlag", deliveryId);
			/**从支付审核页面获取快递ID Auth:zhangqiang Time:2015-09-25 17:49:35 End
			 * */
			model.addAttribute("cartItemList", items);
			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 End */

			model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
			model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
			model.addAttribute("services", cacheData.getServices(getParamMap()));
		} catch (Exception e) {
			e.printStackTrace();
		}


		return Global.TEMPLATE_MALL + PATH + "/member/ordercheck";
	}


	/**
	 * 核对订单页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("/ordercheck")
	public String orderCheck(Model model, HttpServletRequest request) {
		String info = "订单核对页面";
		setLogInfo(info);
		logger.debug(info);

		String type=request.getParameter(Global.WHICHCLIENT);
		/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Start */
		String o = request.getParameter("o");//购物车数据ID集合
		if( StringUtils.isEmpty( o )){
			logger.error(info + "获取订单信息时，发生异常：无效的订单信息");
			if (Global.WHICH_APP.equals(type)){
				return "redirect:/cart/list?whichclient=whichapp";
			}else {
				return "redirect:/cart/list";
			}
		}else{
			model.addAttribute("o", o);
			model.addAttribute("platform", request.getParameter("platform"));
			model.addAttribute("quotationId", request.getParameter("quotationId"));
		}
		/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Old */

		Buyer currentMember = getCurrentMember(request);

		try {
			/** 获取会员等级 TianYu  2016-1-18 14:45:56 Start **/
			BuyerRank buyerRank = this.buyerRankService.get(getParamMap(), currentMember.getRankId());
			model.addAttribute("memberRankScale", buyerRank.getScale()/100);
			/** 获取会员等级 TianYu  2016-1-18 14:45:56 End **/

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("re.buyerId", currentMember.getId()));
			String receiverId=request.getParameter("receiverId");

			List<BuyerReceiver> receiverList = buyerReceiverService.getList(getParamMap(), criteria);
			model.addAttribute("receiverList", receiverList);
			Receiver receiverN=new Receiver();

			if (receiverList != null && receiverList.size() > 0) {
				if(null != receiverId && !"".equals(receiverId)){
					criteria.add(Restrictions.eq("re.id", receiverId));
					model.addAttribute("receiver", buyerReceiverService.getList(getParamMap(), criteria).get(0));
					/**作为新对象开辟空间 防止在转换为json对象时引用其他对象地址 Liuxiaobing  2016-02-07 15:11:52 **/
					MyBeanUtils.copyBean2Bean(receiverN, buyerReceiverService.getList(getParamMap(), criteria).get(0));
				}else{
					/*BuyerReceiver receiver = receiverList.get(0);
					model.addAttribute("receiver", receiver);// 默认第一个收货地址*/
					for(BuyerReceiver receiver : receiverList){
						if(receiver.getIsDefault()==1){
							model.addAttribute("receiver", receiver);
							MyBeanUtils.copyBean2Bean(receiverN,receiver);
							break;
						}
					}
				}
				model.addAttribute("receiverN", receiverN);
			}

			Map<String,String> invoiceInfo=new HashMap<String,String>();
			invoiceInfo.put("invoiceContent","no");
			invoiceInfo.put("invoiceTitle","");
			invoiceInfo.put("invoiceType","");
			BuyerInvoice buyerInvoice = buyerInvoiceService.getDefaultInvoiceInfo(getParamMap(), currentMember.getId());
			if(buyerInvoice!=null){
				invoiceInfo.put("invoiceContent","infos");
				invoiceInfo.put("invoiceTitle",buyerInvoice.getInvoiceTitle());
				invoiceInfo.put("invoiceType","normal");
			}else{
				buyerInvoice = new BuyerInvoice();
			}
			List<BuyerInvoice> buyerInvoicesList = buyerInvoiceService.findList(getParamMap(), "buyerId", currentMember.getId());
			if(buyerInvoicesList.isEmpty()){
				BuyerInvoice newInvoice= new BuyerInvoice();
				newInvoice.setInvoiceTitle("个人");
				newInvoice.setTenantId(getTenantId());
				newInvoice.setBuyerId(currentMember.getId());
				newInvoice.setIsDefault(1);
				newInvoice.setCreateUser(currentMember.getId());
				newInvoice.setCreateDate(new Date());
				buyerInvoiceService.save(getParamMap(), newInvoice);
				buyerInvoicesList.add(newInvoice);
			}
			/****
			 * OLD 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23
			 List<CartItem> cartItemList = cartItemService.getListByMemberId(getParamMap(), currentMember.getId());
			 */
			/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Start */
			String[] orderIds = o.split(",");
			List<String> orderIdsList = new ArrayList<String>();
			for(String orderId : orderIds ){
				if( !StringUtils.isEmpty( orderId )) {
					orderIdsList.add(orderId);
				}
			}

			List<CartItem> cartItemList = null;

			/**
			 * Desc:createOrderType--》产生订单类型 值为1表示  由采购单生成订单 其它此参数不起作用
			 * Auth:zhangqiang
			 * Time:2016-02-29 10:45:35
			 */
			String createOrderType = request.getParameter("createOrderType");
			if(StringUtil.isNotEmpty(createOrderType) && "1".equals(createOrderType)){
				cartItemList = purchaseOrderDetailService.getListByBuyerIdAndIdsPurchaseOrder(getParamMap(), currentMember.getId(),orderIdsList);
				model.addAttribute("createOrderType", "1");
			}else{
				cartItemList = getCartItemByLoginType(request, orderIdsList);
			}
			/*------------------------------------------------------------------------------------------------------------*/


			/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 End */

//			model.addAttribute("cartItemList", groupCartItemByShop(cartItemList));
			model.addAttribute("member", currentMember);
			//发票信息
			model.addAttribute("invoiceInfo",invoiceInfo);
			model.addAttribute("memberInvoice",buyerInvoice);
			model.addAttribute("memberInvoicesList",buyerInvoicesList);
			// 支付方式
			List<PaymentMethod> paymentMethods = getPaymentMethodList();
			model.addAttribute("paymentMethodList", paymentMethods);

			String paymentMethodId = request.getParameter("paymentMethodId");

			/** APP端订单确认页面已选择支付方式后又重新请求 LiaoHanyin 2015-11-4 start*/
			String payMentId=request.getParameter("paymentMethodId");

			PaymentMethod paymentMethodsN=new PaymentMethod();
			if(StringUtil.isNotEmpty(payMentId)){
				/**  从原来的根据Id查询数据库改为遍历获取  TianYu  2015-12-08 15:11:52 Start */
				PaymentMethod paymentMethod = null;
				if(paymentMethods!=null && paymentMethods.size()>0){
					for( PaymentMethod pm : paymentMethods){
						if( payMentId.equals( pm.getId() ) ){
							paymentMethod = pm;
							break;
						}
					}
				}
				/**  从原来的根据Id查询数据库改为遍历获取  TianYu  2015-12-08 15:11:52 End */
				model.addAttribute("paymentMethod", paymentMethod);
				MyBeanUtils.copyBean2Bean(paymentMethodsN, paymentMethod);
				model.addAttribute("paymentMethodN",paymentMethodsN);
				if (!StringUtil.isEmpty(paymentMethodId)) {
					model.addAttribute("paymentMethodIds", paymentMethodId);
				}else{
					model.addAttribute("paymentMethodIds", paymentMethod.getId());
				}
			}else{
				model.addAttribute("paymentMethod", paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0):null);
				/**作为新对象开辟空间 防止在转换为json对象时引用其他对象地址 Liuxiaobing  2016-02-07 15:11:52 **/
				MyBeanUtils.copyBean2Bean(paymentMethodsN, paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0):null);
				model.addAttribute("paymentMethodN",paymentMethodsN);

				if (!StringUtil.isEmpty(paymentMethodId)) {
					model.addAttribute("paymentMethodIds", paymentMethodId);
				}else{
					model.addAttribute("paymentMethodIds", paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0).getId():null);
				}
			}

			// 配送方式

			model.addAttribute("deliveryMethodList", getDeliveryMethodList());
			model.addAttribute("deliveryMethod", getDeliveryMethodList().get(0));

			// 送货时间
			model.addAttribute("deliveryTimeList", getDeliveryTimeList());

			String deliveryTimeId = request.getParameter("deliveryTimeId");
			if (!StringUtil.isEmpty(deliveryTimeId)) {
				model.addAttribute("deliveryTimeIds", deliveryTimeId);
			}else{
				model.addAttribute("deliveryTimeIds", getDeliveryTimeList().get(0).getId());
			}

			String order_deliveryTimeName = request.getParameter("order_deliveryTimeName");
			if (!StringUtil.isEmpty(order_deliveryTimeName)) {
				model.addAttribute("deliveryTimeName", order_deliveryTimeName);
			}else{
				model.addAttribute("deliveryTimeName", getDeliveryTimeList().get(0).getIntroduce());
			}
			// 配送费用
//			model.addAttribute("deliveryFee", calculateGoodsDeliveryFee(getParamMap(), getDeliveryMethodList().get(0).getId(), cartItemList));

			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 Start */
			List<Map<String,Object>> items = null;
			if("1".equals(request.getParameter("platform")) && StringUtils.isNotEmpty(request.getParameter("quotationId"))) {
				String quotationId = request.getParameter("quotationId");
				//根据ID 获取报价单主单信息
				Quotation quotation = quotationService.get(getParamMap(),quotationId);
				//根据ID 获取报价单详细信息
				List<QuotationDetails> quotationDetailsList = quotationDetailsService.getListByQuotationId(getParamMap(), quotationId);

				model.addAttribute("quotation",quotation);
				/** 组装店铺商品总额、运费、总价等数据*/
				items = new ArrayList<Map<String, Object>>();
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("shopId",quotation.getMerchantId());
				if(StringUtil.isNotEmpty(quotation.getMerchantId())){
					Merchant merchant =  merchantService.find(getParamMap(), "id", quotation.getMerchantId());
					map.put("shopName", merchant.getShortName());
					map.put("shopUrl", merchant.getUrlAddress());
				}
				map.put("items",quotationDetailsList);
				items.add(map);
			}else{
				items = groupCartItemByShop(cartItemList);
			}

			/**从支付审核页面获取快递ID Auth:zhangqiang Time:2015-09-25 17:49:35 Start
			 * */
			String deliveryId = null;

			/******** 修改配送方式，获取默认的配送方式  TianYu 2016-1-18 10:08:57  New Start ***********/
			List<DeliveryMethod> deliveryMethods = getDeliveryMethodList();
			model.addAttribute("deliveryMethodList", getDeliveryMethodList());
			DeliveryMethod defaultDeliveryMethod = null;
			if( deliveryMethods!=null && deliveryMethods.size() > 0){
				for(DeliveryMethod dm : deliveryMethods){
					if( 0 == dm.getIsDefault() ){
						defaultDeliveryMethod = dm;
						break;
					}
				}
				if( defaultDeliveryMethod != null ){
					model.addAttribute("deliveryMethod", defaultDeliveryMethod);
					deliveryId = defaultDeliveryMethod.getId();
				}else{
					defaultDeliveryMethod = deliveryMethods.get(0);
					model.addAttribute("deliveryMethod", deliveryMethods.get(0));
					deliveryId = deliveryMethods.get(0).getId();
				}
			}else{
				throw new Exception("商城未设置配送方式");
			}
			/******** 修改配送方式，获取默认的配送方式  TianYu 2016-1-18 10:08:57  New End ***********/

			/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 Start****/
			model.addAttribute("isMemberPrice", "no");
			model.addAttribute("hasInsuranceFee", "no");
			/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 End****/

//			costCalculation(items);
			//根据配置文件配置的参数判断是否根据商品运费系数计算运费，pplication.calcFreightByModuls配置属性的值为enabled，则根据商品系数计算，否则按照以前的计算流程
			String calculatByModules = calcFreightByModuls();
			if("enabled".equals(calculatByModules)){
				costCalculationByModules(items,buyerRank.getScale()/100,receiverN,defaultDeliveryMethod,"no","no");
			}else{
				costCalculation(items,buyerRank.getScale()/100, receiverN, deliveryId,"no","no");
			}

			model.addAttribute("didFlag", deliveryId);
			/**从支付审核页面获取快递ID Auth:zhangqiang Time:2015-09-25 17:49:35 End
			 * */
			model.addAttribute("cartItemList", items);
			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 End */

			model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
			model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
			model.addAttribute("services", cacheData.getServices(getParamMap()));
		} catch (Exception e) {
			logger.error(info + "获取收货人、购物车等信息时，发生异常:" + e);
			e.printStackTrace();
		}
		if (Global.WHICH_APP.equals(type)){
			if("1".equals(request.getParameter("platform"))){
				return Global.TEMPLATE_APP + PATH +"/member/quotationcheck";
			}
			return Global.TEMPLATE_APP + PATH +"/member/ordercheck";
		}else {
			return Global.TEMPLATE_MALL + PATH + "/member/ordercheck";
		}
	}

	/**
	 * 当收货地址变更的时候 重新计算订单运费
	 *
	 * 核对订单页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("/reloadOrderCheck")
	public String reloadOrderCheck(Model model, HttpServletRequest request) {
		String info = "订单核对页面";
		setLogInfo(info);
		logger.debug(info);

		String type=request.getParameter(Global.WHICHCLIENT);
		/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Start */
		String o = request.getParameter("o");//购物车数据ID集合
		if( StringUtils.isEmpty( o )){
			logger.error(info + "获取订单信息时，发生异常：无效的订单信息");
			if (Global.WHICH_APP.equals(type)){
				return "redirect:/cart/list?whichclient=whichapp";
			}else {
				return "redirect:/cart/list";
			}
		}else{
			model.addAttribute("o", o);
			model.addAttribute("platform", request.getParameter("platform"));
			model.addAttribute("quotationId", request.getParameter("quotationId"));
		}
		/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Old */

		Buyer currentMember = getCurrentMember(request);

		try {
			/** 获取会员等级 TianYu  2016-1-18 14:45:56 Start **/
			BuyerRank buyerRank = this.buyerRankService.get(getParamMap(), currentMember.getRankId());
			model.addAttribute("memberRankScale", buyerRank.getScale()/100);
			/** 获取会员等级 TianYu  2016-1-18 14:45:56 End **/

			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("re.buyerId", currentMember.getId()));
			String receiverId=request.getParameter("receiverId");

			List<BuyerReceiver> receiverList = buyerReceiverService.getList(getParamMap(), criteria);
			model.addAttribute("receiverList", receiverList);
			Receiver receiverN=new Receiver();

			if (receiverList != null && receiverList.size() > 0) {//如果有收货地址ID，则把当前的收货地址ID设置为默认，其他的都设置为非默认
				if(null != receiverId && !"".equals(receiverId)){
					for(BuyerReceiver receiver : receiverList){
						if(receiver.getId().equals(receiverId)){
							receiver.setIsDefault(1);
							model.addAttribute("receiver", receiver);
							MyBeanUtils.copyBean2Bean(receiverN,receiver);
							//break;
						}else{
							receiver.setIsDefault(0);
						}
					}

					/**作为新对象开辟空间 防止在转换为json对象时引用其他对象地址 Liuxiaobing  2016-02-07 15:11:52 **/
					//MyBeanUtils.copyBean2Bean(receiverN, buyerReceiverService.getList(getParamMap(), criteria).get(0));
				}else{
					/*BuyerReceiver receiver = receiverList.get(0);
					model.addAttribute("receiver", receiver);// 默认第一个收货地址*/
					for(BuyerReceiver receiver : receiverList){
						if(receiver.getIsDefault()==1){
							model.addAttribute("receiver", receiver);
							MyBeanUtils.copyBean2Bean(receiverN,receiver);
							break;
						}
					}
				}
				model.addAttribute("receiverN", receiverN);
			}

			Map<String,String> invoiceInfo=new HashMap<String,String>();
			invoiceInfo.put("invoiceContent","no");
			invoiceInfo.put("invoiceTitle","");
			invoiceInfo.put("invoiceType","");
			BuyerInvoice buyerInvoice = buyerInvoiceService.getDefaultInvoiceInfo(getParamMap(), currentMember.getId());
			String invoiceContent = request.getParameter("invoiceContent");
			String invoiceTitle = request.getParameter("invoiceTitle");
			if(StringUtil.isNotEmpty(invoiceTitle)){
				buyerInvoice.setInvoiceTitle(invoiceTitle);
			}else{
				if(buyerInvoice == null){
					List<BuyerInvoice> list = buyerInvoiceService.findList(getParamMap(), "buyerId",currentMember.getId());
					if( list != null && list.size() > 0){
						BuyerInvoice defaultInvoice = list.get(0);
						defaultInvoice.setIsDefault(1);
						this.buyerInvoiceService.update(getParamMap() , defaultInvoice);
						invoiceTitle = defaultInvoice.getInvoiceTitle();
						buyerInvoice = defaultInvoice;
					}
				}else {
					invoiceTitle = buyerInvoice.getInvoiceTitle();
				}
			}
			if(buyerInvoice!=null){
				if(StringUtil.isNotEmpty(invoiceContent)){
					if("no".equals(invoiceContent)){
						invoiceInfo.put("invoiceContent","no");
						invoiceInfo.put("invoiceTitle","");
						invoiceInfo.put("invoiceType","");
					}else{
						invoiceInfo.put("invoiceContent",invoiceContent);
						invoiceInfo.put("invoiceTitle",invoiceTitle);
						invoiceInfo.put("invoiceType","normal");
					}
				}else{
					invoiceInfo.put("invoiceContent","infos");
					invoiceInfo.put("invoiceTitle",invoiceTitle);
					invoiceInfo.put("invoiceType","normal");
				}
			}else{
				buyerInvoice = new BuyerInvoice();
			}
			List<BuyerInvoice> buyerInvoicesList = buyerInvoiceService.findList(getParamMap(), "buyerId", currentMember.getId());
			if(buyerInvoicesList.isEmpty()){
				BuyerInvoice newInvoice= new BuyerInvoice();
				newInvoice.setInvoiceTitle("个人");
				newInvoice.setTenantId(getTenantId());
				newInvoice.setBuyerId(currentMember.getId());
				newInvoice.setIsDefault(1);
				newInvoice.setCreateUser(currentMember.getId());
				newInvoice.setCreateDate(new Date());
				buyerInvoiceService.save(getParamMap(), newInvoice);
				buyerInvoicesList.add(newInvoice);
			}
			/****
			 * OLD 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23
			 List<CartItem> cartItemList = cartItemService.getListByMemberId(getParamMap(), currentMember.getId());
			 */
			/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 Start */
			String[] orderIds = o.split(",");
			List<String> orderIdsList = new ArrayList<String>();
			for(String orderId : orderIds ){
				if( !StringUtils.isEmpty( orderId )) {
					orderIdsList.add(orderId);
				}
			}
//			List<CartItem> cartItemList = cartItemService.getListByMemberIdAndIds(getParamMap(), currentMember.getId(),orderIdsList);
			List<CartItem> cartItemList = null;

			/**
			 * Desc:createOrderType--》产生订单类型 值为1表示  由采购单生成订单 其它此参数不起作用
			 * Auth:zhangqiang
			 * Time:2016-02-29 10:45:35
			 */
			String createOrderType = request.getParameter("createOrderType");
			if(StringUtil.isNotEmpty(createOrderType) && "1".equals(createOrderType)){
				cartItemList = purchaseOrderDetailService.getListByBuyerIdAndIdsPurchaseOrder(getParamMap(), currentMember.getId(),orderIdsList);
				model.addAttribute("createOrderType", "1");
			}else{
				cartItemList = getCartItemByLoginType( request, orderIdsList);
			}
            /*------------------------------------------------------------------------------------------------------------*/

			/**** new 修复购物车中商品不能选择性结算BUG  TianYu 2015-6-23 End */

//			model.addAttribute("cartItemList", groupCartItemByShop(cartItemList));
			model.addAttribute("member", currentMember);
			//发票信息
			model.addAttribute("invoiceInfo",invoiceInfo);
			model.addAttribute("memberInvoice",buyerInvoice);
			model.addAttribute("memberInvoicesList",buyerInvoicesList);
			// 支付方式
			List<PaymentMethod> paymentMethods = getPaymentMethodList();
			model.addAttribute("paymentMethodList", paymentMethods);

			String paymentMethodId = request.getParameter("paymentMethodId");

			/** APP端订单确认页面已选择支付方式后又重新请求 LiaoHanyin 2015-11-4 start*/
			String payMentId=request.getParameter("paymentMethodId");

			PaymentMethod paymentMethodsN=new PaymentMethod();
			if(StringUtil.isNotEmpty(payMentId)){
				/**  从原来的根据Id查询数据库改为遍历获取  TianYu  2015-12-08 15:11:52 Start */
				PaymentMethod paymentMethod = null;
				if(paymentMethods!=null && paymentMethods.size()>0){
					for( PaymentMethod pm : paymentMethods){
						if( payMentId.equals( pm.getId() ) ){
							paymentMethod = pm;
							break;
						}
					}
				}
				/**  从原来的根据Id查询数据库改为遍历获取  TianYu  2015-12-08 15:11:52 End */
				model.addAttribute("paymentMethod", paymentMethod);
				MyBeanUtils.copyBean2Bean(paymentMethodsN, paymentMethod);
				model.addAttribute("paymentMethodN",paymentMethodsN);
				if (!StringUtil.isEmpty(paymentMethodId)) {
					model.addAttribute("paymentMethodIds", paymentMethodId);
				}else{
					model.addAttribute("paymentMethodIds", paymentMethod.getId());
				}
			}else{
				model.addAttribute("paymentMethod", paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0):null);
				/**作为新对象开辟空间 防止在转换为json对象时引用其他对象地址 Liuxiaobing  2016-02-07 15:11:52 **/
				MyBeanUtils.copyBean2Bean(paymentMethodsN, paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0):null);
				model.addAttribute("paymentMethodN",paymentMethodsN);

				if (!StringUtil.isEmpty(paymentMethodId)) {
					model.addAttribute("paymentMethodIds", paymentMethodId);
				}else{
					model.addAttribute("paymentMethodIds", paymentMethods!=null&&paymentMethods.size()>0?paymentMethods.get(0).getId():null);
				}
			}

			// 配送方式
			/** 添加默认配送方式 TianYu  2016-05-11 14:47:39  Start **/
			List<DeliveryMethod> deliveryMethodList =  getDeliveryMethodList();

			model.addAttribute("deliveryMethodList", deliveryMethodList);

			String selectDeliveryMethodId = request.getParameter("deliveryMethodId");
			DeliveryMethod selectedDeliveryMethod = deliveryMethodService.get(getParamMap(), selectDeliveryMethodId);
			model.addAttribute("deliveryMethod", selectedDeliveryMethod);

			/** 添加默认配送方式 TianYu  2016-05-11 14:47:39  Start **/

			// 送货时间
			model.addAttribute("deliveryTimeList", getDeliveryTimeList());

			String deliveryTimeId = request.getParameter("deliveryTimeId");
			if (!StringUtil.isEmpty(deliveryTimeId)) {
				model.addAttribute("deliveryTimeIds", deliveryTimeId);
			}else{
				model.addAttribute("deliveryTimeIds", getDeliveryTimeList().get(0).getId());
			}

			String order_deliveryTimeName = request.getParameter("order_deliveryTimeName");
			if (!StringUtil.isEmpty(order_deliveryTimeName)) {
				model.addAttribute("deliveryTimeName", order_deliveryTimeName);
			}else{
				model.addAttribute("deliveryTimeName", getDeliveryTimeList().get(0).getIntroduce());
			}
			// 配送费用
//			model.addAttribute("deliveryFee", calculateGoodsDeliveryFee(getParamMap(), getDeliveryMethodList().get(0).getId(), cartItemList));

			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 Start */
			List<Map<String,Object>> items = null;
			if("1".equals(request.getParameter("platform")) && StringUtils.isNotEmpty(request.getParameter("quotationId"))) {
				String quotationId = request.getParameter("quotationId");
				//根据ID 获取报价单主单信息
				Quotation quotation = quotationService.get(getParamMap(),quotationId);
				//根据ID 获取报价单详细信息
				List<QuotationDetails> quotationDetailsList = quotationDetailsService.getListByQuotationId(getParamMap(), quotationId);

				model.addAttribute("quotation",quotation);
				/** 组装店铺商品总额、运费、总价等数据*/
				items = new ArrayList<Map<String, Object>>();
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("shopId",quotation.getMerchantId());
				if(StringUtil.isNotEmpty(quotation.getMerchantId())){
					Merchant merchant =  merchantService.find(getParamMap(), "id", quotation.getMerchantId());
					map.put("shopName", merchant.getShortName());
					map.put("shopUrl", merchant.getUrlAddress());
				}
				map.put("items",quotationDetailsList);
				items.add(map);
			}else{
				items = groupCartItemByShop(cartItemList);
			}

			/**从支付审核页面获取快递ID Auth:zhangqiang Time:2015-09-25 17:49:35 Start
			 * */

			/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 Start****/
			String isMemberPrice = request.getParameter("isMemberPrice");
			String hasInsuranceFee = request.getParameter("hasInsuranceFee");
			model.addAttribute("isMemberPrice", isMemberPrice);
			model.addAttribute("hasInsuranceFee", hasInsuranceFee);
			/******添加保价费计算和会员价判断 TianYu  2016-05-19 10:12:15 End****/


//			costCalculation(items);
			//根据配置文件配置的参数判断是否根据商品运费系数计算运费，pplication.calcFreightByModuls配置属性的值为enabled，则根据商品系数计算，否则按照以前的计算流程
			String calculatByModules= calcFreightByModuls();//PropertiesUtil.getValue("applicationContext.properties","application.calcFreightByModuls");
			if("enabled".equals(calculatByModules)){
				costCalculationByModules(items,buyerRank.getScale()/100,receiverN,selectedDeliveryMethod, isMemberPrice, hasInsuranceFee);
			}else{
				costCalculation(items,buyerRank.getScale()/100, receiverN,selectDeliveryMethodId, isMemberPrice, hasInsuranceFee);
			}

			model.addAttribute("didFlag", selectDeliveryMethodId);
			/**从支付审核页面获取快递ID Auth:zhangqiang Time:2015-09-25 17:49:35 End
			 * */
			model.addAttribute("cartItemList", items);
			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 End */

			model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
			model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
			model.addAttribute("services", cacheData.getServices(getParamMap()));
		} catch (Exception e) {
			logger.error(info + "获取收货人、购物车等信息时，发生异常:" + e);
			e.printStackTrace();
		}
		if (Global.WHICH_APP.equals(type)){
			if("1".equals(request.getParameter("platform"))){
				return Global.TEMPLATE_APP + PATH +"/member/quotationcheck";
			}
			return Global.TEMPLATE_APP + PATH +"/member/ordercheck";
		}else {
			return Global.TEMPLATE_MALL + PATH + "/member/ordercheck";
		}
	}
	/**
	 * 核对报价单页面
	 *
	 * @param model
	 * @return
	 */
	@RequestMapping("/quitationcheck")
	public String quitationCheck(Model model, HttpServletRequest request) {
		String info = "报价单核对页面";
		setLogInfo(info);
		logger.debug(info);

		String type=request.getParameter(Global.WHICHCLIENT);
		String quotationId = request.getParameter("quotationId");//报价单id

		Buyer currentMember = getCurrentMember(request);

		try {
			Criteria criteria = new Criteria();
			criteria.add(Restrictions.eq("re.buyerId", currentMember.getId()));
			String receiverId=request.getParameter("receiverId");
			List<BuyerReceiver> receiverList = buyerReceiverService.getList(getParamMap(), criteria);
			model.addAttribute("receiverList", receiverList);
			BuyerReceiver ReceiverN = new BuyerReceiver();

			if(null != receiverId && !"".equals(receiverId)){
				criteria.add(Restrictions.eq("re.id", receiverId));
				MyBeanUtils.copyBean2Bean(ReceiverN, buyerReceiverService.getList(getParamMap(), criteria).get(0));
				model.addAttribute("receiver", ReceiverN);
			}else{
				int index = 0;
				if (receiverList != null && receiverList.size() > 0) {
					for(BuyerReceiver receiver:receiverList){

						if(receiver.getIsDefault() == 1){
							MyBeanUtils.copyBean2Bean(ReceiverN,receiver );
							model.addAttribute("receiver", ReceiverN);
							break;
						}
						++index;
					}
					if( index == receiverList.size()){
						MyBeanUtils.copyBean2Bean(ReceiverN,receiverList.get(0) );
						model.addAttribute("receiver", ReceiverN);
					}
				}
			}



			Map<String,String> invoiceInfo=new HashMap<String,String>();
			invoiceInfo.put("invoiceContent","no");
			invoiceInfo.put("invoiceTitle","");
			invoiceInfo.put("invoiceType","");


			//根据ID 获取报价单主单信息
			Quotation quotation = quotationService.get(getParamMap(), quotationId);
			//根据ID 获取报价单详细信息
			List<QuotationDetails> quotationDetailsList = quotationDetailsService.getListByQuotationId(getParamMap(), quotationId);

			//报价单报价时，如果不提供发票，下单时，在订单确认页面无法进行发票信息编辑
			if( quotation.getInvoiceType().equals(2)){

				BuyerInvoice buyerInvoice = buyerInvoiceService.getDefaultInvoiceInfo(getParamMap(), currentMember.getId());
				if(buyerInvoice!=null){
					invoiceInfo.put("invoiceContent","infos");
					invoiceInfo.put("invoiceTitle",buyerInvoice.getInvoiceTitle());
					invoiceInfo.put("invoiceType","normal");
				}else{
					buyerInvoice = new BuyerInvoice();
				}
				List<BuyerInvoice> buyerInvoicesList = buyerInvoiceService.findList(getParamMap(), "buyerId", currentMember.getId());
				if(buyerInvoicesList.isEmpty()){
					BuyerInvoice newInvoice= new BuyerInvoice();
					newInvoice.setInvoiceTitle("个人");
					newInvoice.setTenantId(getTenantId());
					newInvoice.setBuyerId(currentMember.getId());
					newInvoice.setIsDefault(1);
					newInvoice.setCreateUser(currentMember.getId());
					newInvoice.setCreateDate(new Date());
					buyerInvoiceService.save(getParamMap(), newInvoice);
					buyerInvoicesList.add(newInvoice);
				}
				model.addAttribute("memberInvoice",buyerInvoice);
				model.addAttribute("memberInvoicesList",buyerInvoicesList);
			}

//			model.addAttribute("cartItemList", groupCartItemByShop(cartItemList));
			model.addAttribute("quotation",quotation);
			model.addAttribute("member", currentMember);
			//发票信息
			model.addAttribute("invoiceInfo",invoiceInfo);

			// 支付方式
			model.addAttribute("paymentMethodList", getPaymentMethodList());
			model.addAttribute("paymentMethod", getPaymentMethodList().get(0));
			// 配送方式
			model.addAttribute("deliveryMethodList", getDeliveryMethodList());
			model.addAttribute("deliveryMethod", getDeliveryMethodList().get(0));
			// 送货时间
			model.addAttribute("deliveryTimeList", getDeliveryTimeList());
			model.addAttribute("deliveryTime", getDeliveryTimeList().get(0));
			// 配送费用
//			model.addAttribute("deliveryFee", calculateGoodsDeliveryFee(getParamMap(), getDeliveryMethodList().get(0).getId(), cartItemList));

			/** 组装店铺商品总额、运费、总价等数据*/
//			List<Map<String,Object>> items = groupCartItemByShop(quotationDetailsList);
			List<Map<String,Object>> items = new ArrayList<Map<String, Object>>();
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("shopId",quotation.getMerchantId());
			if(StringUtil.isNotEmpty(quotation.getMerchantId())){
				Merchant merchant =  merchantService.find(getParamMap(), "id", quotation.getMerchantId());
				map.put("shopName", merchant.getShortName());
				map.put("shopUrl", merchant.getUrlAddress());
			}
			map.put("items",quotationDetailsList);
			items.add(map);
			/**从支付审核页面获取快递ID Auth:zhangqiang Time:2015-09-25 17:49:35 Start
			 * */
			String deliveryId = request.getParameter("deliveryId");
			if(StringUtil.isEmpty(deliveryId)){
				deliveryId = "0";
			}
//			costCalculation(items);
//			costCalculation(items, deliveryId);
			model.addAttribute("didFlag", deliveryId);
			/**从支付审核页面获取快递ID Auth:zhangqiang Time:2015-09-25 17:49:35 End
			 * */
			model.addAttribute("cartItemList", items);
			StringBuffer buffer = new StringBuffer();
			for( Map<String,Object> mapItem : items){
				for( QuotationDetails qd :(ArrayList<QuotationDetails>) mapItem.get("items")){
					buffer.append(qd.getId());
					buffer.append(",");
				}

			}
			model.addAttribute("o", buffer.toString());
			/** 组装店铺商品总额、运费、总价等数据 Tianyu 2015-8-19 End */

			model.addAttribute("middlenavigationList", cacheData.getMiddleNavigation(getParamMap()));
			model.addAttribute("bottomnavigationList", cacheData.getBottomNavigation(getParamMap()));
			model.addAttribute("services", cacheData.getServices(getParamMap()));
		} catch (Exception e) {
			logger.error(info + "获取收货人、购物车等信息时，发生异常:" + e);
			e.printStackTrace();
		}
		if (Global.WHICH_APP.equals(type)){
			return Global.TEMPLATE_APP + PATH +"/member/quotationcheck";
		}else {
			return Global.TEMPLATE_MALL + PATH + "/member/quitationcheck";
		}
	}

	/**
	 * 保存新增发票信息
	 * */
	@RequestMapping("/saveInvoice")
	@ResponseBody
	public Object saveInvoice(HttpServletRequest request){
		String info = "保存发票抬头信息";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = true;
		StringBuilder msg = new StringBuilder();
		msg.append(info);
		try {
			Buyer currentMember = getCurrentMember(request);
			String invoiceTitle = request.getParameter("invoiceTitle");
			BuyerInvoice newInvoice = new BuyerInvoice();
			newInvoice.setInvoiceTitle(invoiceTitle);
			newInvoice.setTenantId(getTenantId());
			newInvoice.setBuyerId(currentMember.getId());
			newInvoice.setIsDefault(1);
			newInvoice.setCreateUser(currentMember.getId());
			newInvoice.setCreateDate(new Date());
			newInvoice=buyerInvoiceService.save(getParamMap(), newInvoice);
			buyerInvoiceService.updateDefault(getParamMap(), currentMember.getId(), newInvoice.getId());
			result.put("id",newInvoice.getId());
			msg.append("成功！");
		}catch (Exception e) {
			logger.error(info + "时，发生异常:" + e);
			success=false;
			msg.append("时，发生异常!");
			e.printStackTrace();
		}
		result.put("success", success);
		result.put("msg", msg);
		return result;
	}

	/**
	 *保存发票信息设置
	 * */
	@RequestMapping("/saveInvoiceSetting")
	@ResponseBody
	public Object saveInvoiceSetting(HttpServletRequest request){
		String info = "保存发票抬头信息设置";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = true;
		StringBuilder msg = new StringBuilder();
		msg.append(info);
		String invoiceContent = request.getParameter("invoiceContent");
		try {
			Buyer currentMember = getCurrentMember(request);
			if (invoiceContent.equals("no")) {
				memberInvoiceService.updateDefault(getParamMap(), currentMember.getId(), null);
			} else {
				MemberInvoice newInvoice = new MemberInvoice();
				String invoiceTitle = request.getParameter("invoiceTitle");
				String id=request.getParameter("id");
				newInvoice.setId(id);
				newInvoice.setInvoiceTitle(invoiceTitle);
				newInvoice.setTenantId(getTenantId());
				newInvoice.setMemberId(currentMember.getId());
				newInvoice.setIsDefault(1);
				newInvoice.setModifyUser(currentMember.getId());
				newInvoice.setModifyDate(new Date());
				memberInvoiceService.update(getParamMap(),newInvoice);
				memberInvoiceService.updateDefault(getParamMap(), currentMember.getId(), id);
			}
			msg.append("成功！");
		}catch (Exception e) {
			logger.error(info + "时，发生异常:" + e);
			success=false;
			msg.append("时，发生异常!");
			e.printStackTrace();
		}
		result.put("success", success);
		result.put("msg", msg);
		return result;
	}

	/**
	 * 删除发票信息
	 * */
	@RequestMapping("/deleteInvoice")
	@ResponseBody
	public Object deleteInvoice(HttpServletRequest request){
		String info = "删除发票抬头信息";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = true;
		StringBuilder msg = new StringBuilder();
		msg.append(info);
		try{
			String id = request.getParameter("id");
			buyerInvoiceService.delete(getParamMap(),id);
			msg.append("成功！");
		}catch (Exception e) {
			logger.error(info + "时，发生异常:" + e);
			success=false;
			msg.append("时，发生异常!");
			e.printStackTrace();
		}
		result.put("success", success);
		result.put("msg", msg);
		return result;
	}

	/**
	 * 修改发票信息
	 * */
	@RequestMapping("/editInvoice")
	@ResponseBody
	public Object editInvoice(HttpServletRequest request) {
		String info = "修改发票抬头信息";
		setLogInfo(info);
		logger.debug(info);
		Map<String, Object> result = new HashMap<String, Object>();
		boolean success = true;
		StringBuilder msg = new StringBuilder();
		msg.append(info);
		try{
			String id = request.getParameter("id");
			Buyer currentMember = getCurrentMember(request);
			String invoiceTitle = request.getParameter("invoiceTitle");
			BuyerInvoice newInvoice = new BuyerInvoice();
			newInvoice.setId(id);
			newInvoice.setInvoiceTitle(invoiceTitle);
			newInvoice.setModifyUser(currentMember.getId());
			newInvoice.setModifyDate(new Date());
			buyerInvoiceService.update(getParamMap(), newInvoice);
			msg.append("成功！");
		}catch (Exception e) {
			logger.error(info + "时，发生异常:" + e);
			success=false;
			msg.append("时，发生异常!");
			e.printStackTrace();
		}
		result.put("success", success);
		result.put("msg", msg);
		return result;
	}
	/**
	 * * 添加方法，list()中调用
	 * 按照商品所属商家对商品进行分组
	 * 返回Map的key：
	 * 1、shopId:String
	 * 2、shopName:String
	 * 3、shopUrl:String
	 * 4、items：List<CartItem>
	 * @param cartItems
	 * @return
	 * @author TianYu
	 * @Date 2015-8-19
	 */
	private List<Map<String,Object>> groupCartItemByShop(List<CartItem> cartItems) {
		if( cartItems == null || cartItems.size() == 0 ){
			return null;
		}
		List<Map<String,Object>> list = new ArrayList<Map<String, Object>>();

		//获取所有的商家ID
		Set<String> merchants = new HashSet<String>();
		for(CartItem ci : cartItems ){
			merchants.add( ci.getMerchantId() );
		}

		//组装数据
		for(String mid : merchants ){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("shopId",mid);

			Iterator<CartItem> it = cartItems.iterator();
			List<CartItem> items = new ArrayList<CartItem>(0);
			while(it.hasNext()){
				CartItem ci = it.next();
				if( mid.equals( ci.getMerchantId() ) ){
					if( !map.containsKey( "shopName" ) && !map.containsKey( "shopUrl" )){
						map.put("shopName", ci.getMerchantShortName());
						map.put("shopUrl", ci.getMerchantUrlAddress() );
					}

					//组装规格
					installSp(ci);

					items.add( ci );
					it.remove();
				}
			}

			map.put("items",items);
			list.add( map );
		}

		return list;
	}

	/**
	 * 组装商品规格
	 * @param ci
	 * TianYu
	 * 2015-9-14
	 */
	private void installSp(CartItem ci){
		if( StringUtil.isNotEmpty(ci.getSpecification()) ){
			if( ci.getSpecification().indexOf(")X") > 0 ){
				int count = 0;
				String[] sps = ci.getSpecification().split(";");
				for(int i = 0; i< sps.length; i++){
					if( i < sps.length-1 ) {
						count += Integer.parseInt(sps[i].substring(sps[i].lastIndexOf("X")+1) );
					}

				}
				ci.setSpecification(ci.getSpecification() + "X" + ( ci.getQuantity() - count));
			} else {
				ci.setSpecification(ci.getSpecification() + "X" + ci.getQuantity());
			}
		}
	}

	/**
	 * 	 * 新增方法：分店铺计筇	�ŉb�n�<6k�1?����\'E���C7��cȡSa���,�JgC?����j0�!J�t	\B����.���
�����d�������E��#q�IT(�'}�*��;�Ԭ�D���I��q���";侧	�0}&�ik�G�H:䶨��YrT�]�����3mw�a幱n�h��o�C������<�S�2% ,-�,��fT��Q�+�<rL����uv�zy����E���r��pr����,�1�ڞ7h���lca�>�F�1���9��'�����<��g��p-=7ӳ���t"�b������'�]h�v-8��U�v���3	�b�ip-��s��:�뙸�����FA&�;��R�hN�x�q��0����B��_�@��fl2�"������ODNi��=�N삉E�>�垞y/��Ba���y����Z7��g���f��Ѹ�]�{�C�S&�����zJ� ����	 ��v�ȦWa(��v�u�3�b[�6��Zz���{�H�[4t�\ĦF��P�M\s@#h����,�t
�^j��0^�`�dR���Բq�=l���L�K,6��f�%V>4���
-�tA/��u_�R�B�!r	6E~��<yO���!?1�2]�*��M4����6�?�ۄN�y6p�|�f%8�~j�2������E=�3�,�R�B��I����0���l�d���N؈ߜ��B��_���Dh�iĲ%>,��b���+cx��0Hg[%��l<W�i���3j��4F�8��!��F+�Dl�=��y��>���	
������:�.�O��4�L�ÔP��I��R���Y��x���N3�{'\��`3�Kq��m���5��-��o�+���\eW�a�r�����0��ZGb,���t=,,�3tQ�d��N�>�&>��zR��,�Le�m1�ZL�S��z/�f�K����Z�u�K�x��~-�6�%6�'���In.q&����;m�+��^�á{@��R�6�(e���6�uBB�3�P�sY�΃B�(R~�zmRJ,�J,�Jl�ªR��܉r�������r��a��[3������񺁥�F��c�[lx���g�5�7^#���6���L��6���9X��WW�����n����89��ڪ,�\��r�r�-���h�.�RZV�em�7u#�f9�15�v��(�n��3�2v�P=m���ݬp�;����l�!z��z�����ݦ�1�1E���-pA���]�Q�ޙT�w�Ƚ�Ƚ��Y���Q����j.[��I+�{����I&����i��8��]�P�1O{�wl���X��e���~�V���ð@y��g`��,�<�)/�)�+p��*�Ry�Rށ�w��p��lU���?A��gخ<�*O�N�)���X0���+�M��	��Ry3�Wp��*W����wp��.[g�X��:'�nP������	�N�N4M�éq��.y�1D�~��b9�xFhX�alg����T(���(�Ʊ�Ű�Òtc'��.�u0h.=V٠�F��'�x���c��)����y��*���O����s`~p��������V|c|[����`�҅��%&�iܮ�m��:ń�#3�V�\@�&I�W�n�܁�_��p;2!ߑe�?�Y�4z�IW�	���wrs�)�i6���<����]΢��팊�¨�0������������#��%��#�!�9�B�#
0�1f;�l��X��X���&��� Es3��X�o61�aa��w��X������z`�cLw��a:��t���<��t���l>�3����&��3����qqm�c�r���y'��Q�������9%���(e��#J���^r�bd��k7�s�� �(#���#=�}+�Z�P���(��Ja����`��tLշ6���ֻL��x!^$�H����*k��,�Zej��tM�7��[阍_�L����L��O\�{y�,W��'}�6�]�c�~��]X����0/Ɵ��J��</�͙��!���4˟���_�/ML�L]/�Y%E�p���N��\׉��$p�&ǝx�p��oJ=9��w���l���tjp�������B�8�q#��.�}"�I�Ou�_��L�8\��a4��b�~?	%x��i=�P�z����x���3�ܬ��PK
   ��GD���  �  4   org/springframework/web/servlet/HandlerMapping.class�S�r�P]��mm�J��^����Z/)��1P&�T���br�����#g���������ᬜ����쵓���~pj�	0���|id�悂�/��(.+�J�)�"�k�+�!�[o�q�a��Z{M�
z�.��eC3��Z.�'�jY���ji��kg��y���UD�����%�bQ��/�p*eifiw�	�d�+����l�yY�����VMݶ�b�P-ͮ���.Zew��o���-Ε͕�ռN�]Ԗu�w�!�&�ox<dx������x��q�k	�
�T�����H,d�N��E���U���N�&��׶3�5�^�
���[��)	m���Dq�eP����h:Se�w�a�p}^�k<���GL���u�ؕ��~��t���6��������a�0ǐ��K��Ʊ��"�'� R���5W�\���$ɨC8�p([#����SX���C?�#R;�u}v��ׅ�>�_��v�ir8�]����ꄮ�=J�'�m����ŧ�������]⊼�:�8�3��OVj��d2o�ڞCl�?��9�9Q����D�Q{�̿>�5����������P�":[T��)��c�9Io)�Z��x���>��pd���q��O�n��$�b��N�#���o`Ͽ`drtc��3�e��P���%1��(�ae�@90����a��@��Dd8M�Y ��Oq��-4�E����oPK
   ��G���	    ;   org/springframework/web/servlet/HandlerExecutionChain.class�X�{�~';���LHX�� �����&Y0"5FbbR�PMA&�Cva���nH��^���ڋU��X5�"�@@j��V+�}�<��Ey��=3��&�p�#���3�|�;��~����G�h�
�<p�A��C�}O��������z�V�?�`�O��'��~�����?�3��'��S?���
�_��s�񼂝B�n�X�]ح`O*�K/y��Cn�J�-�q�����s�7^��ư�}ݍ߻��^oJpœ���!�ߙ4zCZJG�P8�חL�Cb1��u&{o��D�D$.���[��Z(�q����z8�e5���FXOe�FZݦ�tʠ�-�֧$�m��'�֍�q=j��u��5��tFB�uZ&�
v�zZ���%�MZ^>�sWPii����>(A� E�c�Xf�_�Tص�%ȭ��(�%���}=��N�낦dX��׌���'�L4Fz�^��+�0�%�Q-���w�1cF\ۋ�F�.��v~we��UZʴ��mF��Wϴ�9���6��gi�H�v"���QE�\=KfG�!��jfL���;�Dnh�O��q@��������0�fi�T|h��[��Za4���dR�v>�������:!]T,�b��o����c�0�����$�[����e�Ǌ��\9( 2=�
�	��0����G�j���A�%Y���)��.����I(�05Y�[�Џ�ɾe�SB�W�h<��t��;��Fֽ��uQ#9 J,җw��?*�O��uI��t��#�7=a��\��=r%�J��P"<�.�tQG��=y�ȝIve���eК��{$TLY��?���y�Z���vOq�+=]�~�;/o�oU܂��cP��X�&;�&��w�X�%�l㵪�0�!Q�T,�2�p��*���*nD��oc��wTĈ�C*cT�G��pL��8.���+������g�*>�I��1'F����l���A��.�L����Xh*�����7�������c	s�q1{h���[�'��x|*!�ѿE��#�X¯]0T`����@�@,�'���l��l!7��F�c�~N��Y�ys�Oh�K���s���N?�ل������/-y��ǌ��d<NKx���$IW��F�n�/�O��K�,��qQ�Z̚ظ���DLs�c�[4����m�K��Ke�X�yɫ�tRr�KK[6T��4��᢭-�8�O�4y���=��e�7[%�4O#�y��3ǫwj����(�O*��?{�ϼ�_�Mn�C_��ӵ����c��!2=0mvLj�����'֋8O��ϫ��ڀ����;I~b啟_�q���ܦ�YM�[.��M�����i�_�X���|�=�#�h�|��l�٭�{�9n��s������� �@P:�
��9s�&rwG�$���H�(�Qq������d�;���<�.�<��@�\���}�!��3E�w�9��~�8RuQ,�q��4B5�	��&��PV���wИvB� �oq��_�M���C5%[���et� �H�V@M�����;�+b��ލl�!��&'�U�g�r����3UK�>I�E����)-hTIЬ�(J
�a2����9��Y�U�"*A�]Xck�5��t7f��c�(��n��Y&�MPp��r��g���<H&H>.�rǧ8�A1���S���"g�O�L,�a��D���Y3�(�2�@g�nA�t�6�ϡn�m�mH��..��i#�jg
�x�I,�fxF1G���l�0�-[��O�$�w?m�9?4�|��6�fD	���z��e�&�'�{�>���Y���VFQ.c7���F0ױ7���;di��iyo֖ �<&�9Hv��c>�@�d�>E�<���A�1�\A�c�N�0=����ךug+�a0I�ߥ�N�.v�ȼp�C	C\�U
6������2����f���$w*|7	��r�l�T���H���܃�
��llvU�,����ʉ�����3�����h��d}'��ֲ��Nڵ�D�N��\�\U���)N�"k�"k���Q�<���(0�&F��ϒ�\t�Aa��ʨ�-�=]3a���TpNcv����ί���qXh��~?X��M�����5�f̿N�7(��R{��7i�0K�����f1-߂^r᷽�B�Ǹh�rі�-�E�*frqku�ϡLpq����n��m
�b� >�΢�,���*���t�	V�Gs�S���t��?��]h���M�2Q��$�(�,����Br��U����i�)��}�ͅ�e�Y6��!Z�f�Q��J�K�ߣ�	J�O��3vG�߇٘
���p?�-G�����b2�7�,��,��lބs�f���+(�%]Ղ,I�0���vE�,@���{�~mg�[C�b^��x����
z�֢U�FP��0g�W�	z�%��Y5[�1A~�P���N���g쌟�f~A �ʩ��m�^V��Ϫ��(�|�5
�30hZhr�e��0Bo��fW�z�|����PK
   ��G�\Ӧ�  '  P   org/springframework/web/servlet/FrameworkServlet$RequestBindingInterceptor.class�VoSE�m�� m���JZ5�!�^�T�Q���� ��o.aM�w���G�;�%:�m��Wu�~"��g/�J�$��E���}����}�l�|��o fq7�Q̍�p=��xE��QJ��y5|��5|��3�qy��3�٪'�����NX���'v�=^3}.v.ͥ��z{�L��mז׳���d�*�g8W�]�ں_�bê9���zu�ٴ���ᢦ�2���-�˛��E�]�E�7�'�e���X��I��7�̉��o�)�W«s���=��G���)�X�%�]�5����궵k�-i;J����ҬX��<�fXp��>����#���l��i9�����^d��48Auٖ��p����ػr*�����}��8����76�t~l]Z����\gY��%[�P��7Jm �r���6����+X����h��e�"�K���)��UJ��#U%�d����n�u�d�h�W�LpE���f���[�Z��l���_V��|4pIc8��
�dO��㖁ϱ�p������X6p_�b��*V��wm�a�פ���n=�yXG���&M������*��A����e{5Z��J���(Ou+�B����j-��
Z���1|sz7oW�T����h�]��j���`QJa�ZR���j�ח��Fq��	~u;{��!*B���+3[�j�c����}��s/�n]+p����ߎ%�����!�^���b�M��?!�{��G4�!Ec�t�q�N��d$��Thx㤥~��3���Oi?�L�C[�~�|>�����`x=��k�1��b�Q@J���4������	�AQss�7�w�6�4e.���wi�R���ir�=��������2$�����I\��BYL��@�ʡ�!�Jڸ�gq�͞"q�:��h0�	�4�X�"Ƅ�LG<�!O%�'�cdY1�1N��x��IP��A�E+C*`������ֈ��aR:�@*`&H����5���*F�S�y�N'�PK
   ��Gl	  �  4   org/springframework/web/servlet/HandlerAdapter.class�PMK�@}�Ƥ֏����.x���"��o�d���캻m�7�;��(qc�R�{�ao�{;�o� .Џp�б��q�pz���R�RV����9u��#!��*+��&��e�,ى�sZ�|��{~Y�u�N�ժ���(��MQ�S#��V�I�<وݪ��a�=\Ǆ��*e�
��G���i��ӂ3��Ro���c�0)_�NFߧ0�Lj�f�l�2oo�������QH �мv@h# |�C��ȣ�����'�-~PK
   ��Gzwg1�   �  ;   org/springframework/web/servlet/LocaleContextResolver.class���J1�����U���>��tP�=
�aAhA�.�5&k�n{��<� >�4ˢP)�&�2�?�����p���G	�	gN�յd6WZn�	����l�j�d/���9����1i����Ňt�YW��\i�'�^ea��-�ˋk�k�p�%��{��n�3_Y�%�oW�Bb�.��Ra�����F�=�j}!�߾6�ɛr��|?�I'��a��N����N���>����+PK
   ��G�UE��   +  A   org/springframework/web/servlet/RequestToViewNameTranslator.class}N�N�P=��jqA����7q�5ƅф��f���[�(����SQ�9�<��̙��}x�M��	aP��Jn_�'�����ح	�7�yi̳�츘�j�A���T�.L&�������97R�:�(�����TV*}�{:u��֡���C'�ߝ/Lh:��WB���iy~r�axv�6_r.����d�O ��E�D�/u������PK
   ��G��Po�  A  2   org/springframework/web/servlet/ModelAndView.class�V�sU��|t�ml�h�A���%��E�*`��JK+_�Y�B��dC��|�;㣎/<�GGG�G�G� }�gG=���v�&Ъ/w�޽�w~��9w���� l���E&�nL��`F�	��h8���/�4���9f#ȣ���4<B1�v�����/gx������\���y�5\���y���)㌑����c�S�=(�-d͜���Bq&]�+Z��Ec֜/O��Vz���s�W�ΙF��
��-ۭ�e��'7M��!�(�6b�ͱ�l�,N���n�Fn�(Z���I�$����y3�.��39�v���g')�Е�1n�� {q�cP��!�)yCO�cm\�V��8+e�ʥ����nM ^{$g�ǲ�v�����d�:nӧi�4�i&]�[3y�.	��kϔ�_�q-��d,0�����iI��n�K};ʈʹ�q�,o�)Z2�IW���[grS#Ujʄf3�Y��.S�I��Q	REF���Y4��䳝 e��m��7��;�4<Z��~�A��*�V����Mx׶�PՆ2cd��\L\?��S^i�h5l�ʔm�I�*�}�ȕiaO�����)]QSۙ�/��"�f�c�H.�JV�!([9I�*흝��
D��P����.�+e�,�l�fq��$�/����>�{X���f�ӱw���X����^��8� �փS#\N	�H`�@�d��%���+^�q�����&A�P�1lKp }:��hm�Zb	���k'1o�'y����:���M�${���T|���Ι��%�R��x�*h0!3�k:�bH�%��9�j-��腶8��]�>)t��Z[�:�TA�����޺�"��K6��!r9B�
���Jǖ�?0�ܜ�'�4��h����.�����C�?c=�ʭ��D?|\4��J���!��h�Ho�i]�3����_������U��@ [�N$�MwvcR�d�>��Y����"��.ÿ# �a7L��Hȸc� y֏e��+?���	|�	�:�����ߣ'G�]�z��@�)���nA�O)O������������[�ó�"_[�s䕻i����@��j�W�}�v����v�`[Pl��3�H��&l��Y�A/���*qy����k٦�*h�Z�_A�+���EtQWg�)��wO4N����>{�����|��|�I��"�o7�]=�F�w�հC	��N���y|ף����)�Q��q|
�7��ʳ��}���XV{���]�{�ʛ3��׹��Er���4? �6�Y-���טfȥjD���i҇��,�=
Z^� D��:�O=��� |�]l?��mQx!u�����/=P!�v�������}��:�o=�Ae����ߊ"q@J�2�\ê�����e���~O������=�=a%uʥ$�-ԓ��$�GJ�#\�.{K5}*�����gz���&�+��t*U���#�ǩ3;�CJ|Q�]A�R�_� �(0�BG% Gx�*�u�A���� �h8E�Nx���M3�\���!��ܧ������"8i���S�HBCP�a������������0��:X�a�Bc���&B �wI�q��r'A�Hj�5����v���$�Q�1} 3��@��X��F����uV��qT�����G���n^\m?V�����-�R���(g�.fL�]�:�����)l���<����!Z��^�m�?ѫ�8���2)�?PK
   ��G;P��  �  8   org/springframework/web/servlet/HandlerInterceptor.class���N1�O q�+��&lge���$,ܕ��88��-�����'�AVڤ?�����}}{~�C'�A�C��6�2ɉ!9L�B,�%����{�4��eX��8'뢭1���T�x.d�o�S�]Խc/�1i��H���ZY�ɰ�{��2)��d2�1�B�^�x�ֵJ(?��(�"��b�Ȝ���מ���0��u�>h¡���.��_�U�̕�eJ�Ӳ����?+:�G�p4j(G��PG���ʽ� �N�w��=�a�PK
   ��GЀC    *   org/springframework/web/servlet/View.class�S]oA=�.��Bk��mU��U�O%M(�i��ݒ�,0ҭ��uw��?˘�D�?�x�b��'�a��s��=s��� ���K�ᾂi<Ċt�x,��(�(K��⩴��1ۺ��jz�0k�ѭ�f{gk���C����j�lw���ݭ���N��S�j�â�7������[MSo�]s�����{��0?��a�T�ہɀ�0X�1	���Y���=�B;\hB��6-�h�ſ�B�sC�Q�0���>��M��
Cʰ��%���O�Ϊ]����j߱][l2�KHԽ	�5l�7��L���6�(��tR��Td��i�[��PU3а̰�C-�%�>����|�Nx�R�<J��^���qZ���\�!�Ba�$�E�z[�-qб[�"jN���;�/����g0/����V
�+4��R�&tݱA��j�z
�|���a�4ۤ�);/�*�1��Z�=�8��N�+�[������P �.`1\'4A�i	7h�H7�L�-�=B������|��3\�'i9���4��`����&�d�Mk��딲J��zg$��oPK
   ��G�*�VK.  Vz  7   org/springframework/web/servlet/DispatcherServlet.class�|	|����33��}�y!d9W�9A� �r 	 (�%Y��d7�n8l=꭭ֻ�>�z�J R�Z<j=��zW��V{Z����g�w߼{%����c����g���sͱ<��Ï�q�T��.'��C)7��ᔌ�d$%�(qS�c��Mɱ���d,%�(OI%(ɧ�@�+UyQ/�%Di"%���q|�ʧ8a����F�t�Ϡ�L��gi|��f�|��ˈ�����2���y���|�V�|��/��x_��%��v�d^�䵼N�K������k����5��ڮT��_����v��O��_4�Fc�T~
}k����Pv�ʛ4��ƛ5��x��:��h��h�T~Z_��Tޮq��x�V��1H�CN�N��o"�6S�-N~:���!�;C�gj�,��MM��s4~���S��N8�%8/H���b~�����D�j�2��T�k��4~%�J�W�k��+~���-��J��4��o��:�o���N8��@%7n7�7��-�����(���ݑu|��I��E�_��n'\j��=T�^��>��O�NJv9��A�=D�ݔ�d����8��>��R㏐(<��ǜp3��'�ٓT�W��)z������Ӕ<��g������?O��R�����H�^v�N�;*y�J^��k��C�o�߫�i������'�wU��{_�����P�i�OT�1%���}����?��/��_5��ƿ����`"�E���^�����_*��ʿt���?�|����*�&��h��4ڃ*?��o5~�	�,�<��b$'�&82&D�
6,)���h8F��	�&��]�D�&hb�&2�� ����4X ��`��Q�`Mq��(y"�	�E�.~J���F����p�1B#�9JnM��њ8Vc41V�41^yN1A䫢@�N6P9E�(Q�DUL��qN�%&;Y6ߠ�)�*���h�B���5˫���/kh\VY_W��rY�������J�էy6zJ�<����p��o�� �"��=��
O[���������2!�܆E�5��\��k�W㷚�K�j&,+�_��!�ݘHY��K��j��������u�+�*W�ύ��k�����Q����~�����K�YY9�����(��T��6T���X�а�j������bѱ6���/����WU�tyCc_���u��&��4�M{��X���I�-���X]���Z��n�*�m~�r���z�?VU�7.-oX�r��i�������@K�7��]��x:<M�ޒ�@{;�QI�X�`%�A��u�ζ0ʚ'�m�6d�3�k+Ytx�a���s��aoS���m������x::��a��7{:�� ��-�������e�P�m��4ت����d+n6YM���L2r��eS�����(_��U���:�QM���|�`8B��T	I��4k]�����/��][bU.��m�C�h�y{MLJ(�nl�`{R�p���F��O�Ha`k,�������X)������;������}v=���l��L�Q�5IH����P}���]enD���fA�?��	�9}�\�����+�,�Ц�"P5�G�ۤ>).�nBB�1Z������"G�2�������	+(҆��>����}�7��Y��%_C���ѻ�Q	�����}v;����Ѳ�/�si^�fMػ9\�һ�������Y�0��">s6%*b0�(i�1y��,%o5u��R���MP�H`]�z1��,k�Â�:��X*u�.���$�7C\զ��mV/���(ٝC}����w3����a�J�y�Po����;�Z����uD���!��{���4I��U
*U��1���cC�E͢oq��Nr�y�4D�УbX;�����1��<e�m�hQ}t�㣺�1�����(o���}�h��#l<&R�JUz���������b��o�^���XP|d֚�	�},q�_�ɂX�4��k�K}�3؄2Z�7!!�N�el��n6RH��ӓ��;��l!�i�?�0X~�FΆ�\f͚`�R��44���.��U�E�qM8C�pO���X7-��b*���xʾ�.&`jL���Ƚ�{��P:��<���@Y����ѱ�"��y� �L��*�%�QD+�AV�6ɦ�;΅���e��hm,�{��Fce�Z>�
/T�4ULW�v��L�g�����<%���A���{��e�%?�9@!��$~Y���ٲ��pG�"L�(δ{�����դ׈00<�l�b�y��1w��,N��~����Me���1�$hvΠ�јl��?���ao�������t���Ӳ����#š�GE�@�>{������*�[�(��� ���@$�f�#�@�o��`g�1�o��[����zÖ���5��o쏣B�޶r3��Q`vn��6���������yYdf1����6�>���>�={�:�ȷz|��`ۊ^_�	� ���o�|��}.L�+����F ���7����9�(S�~����g���Pڶ��	���S��v�,2�L>�4v����[��rV�lD	eRڐֈx�z{$,�KbE-Uq<���N_[���և��D�0%"�I3�%Q�i���[\�D�����w�_s�an^�z��w/�\F�R�&�	�dU��1,�=���ܷ�b�� �����6�u��y�Ƴ��������`p���\q�&ք#5˹�6�(��5h�S�^3���|s&��~���B�]��kMC;YƮ�oє��S��yQ��{<���4&�4@�wN^2�m�"�s��i���n�*�0h�Ş��&���}���8�?���9�R�ݮ�@{�Iջ���_K�F%�|�/�*� ��A�gľ�k0����g�*?�`�B8��[�s����#j��'r�`i�5*��Fo��˭�9ΗQ����H7������5�Ū�<��eg'�NO��1'Nd��۾����/q�H|3v��nj3w�i9dn�$>Qj��+��U�RO�B�Ȟ��H�Ҫ:����il�,��z15��l6Gg��Ng���M�d%�)�A�LJj�r�5�Su�L����(YOI�����N�(9���`�C�`�Q�F�b�.�J���Y�X�&�b�.�*b�jE�d�]�C�ꎣ�>I��J�qu�F5�Vub)�f�q��A�r?�2��7�ǰ7����H�=>�t|��p[���Z�-C	�E}ʹ�*>2�D91���p������qS��v�+��))��������.!r���XUk�Ul�E��3������Eo��],�������KTz��.�.���Lb�*N��*�#��B(|'�5:��]�`lm�s"�^G����w������Q�K����l����
�#<YllDN.��Pw3�v�-`O?�	z�P�;��lÙ:֐�^*���'a�5��[��u"��&�
�� G���1"Tr���:[̖��4P�)$$j␈�d}�){���F��"��g����X�aA�Ƙ�p�`O��tO�).�s?n���r{7c�-�I�Ȧ9BD`ͳ�I����&t��ͺ��u:�ĎSE�.Z�O��b�h��v]�E@�� �[���	tu�v�Q�+�m�h��n�%��8�Ǉ,,-^�;Mՠ5�|C�h�o�#$��i�i:��֔��A�h7d�(Y�1��6{;h1��d�7���͆��(6�b�.���U�]�P���9�8��涶����	:o����FH�E�r��9	��t������ŏ��⫋sĹ�����D�.����,pq�Y#�ŨkŦ���Bq�..�����':ˆ��Rq���a��$���ُt�Sq��&P�+ĕ:�g���W�uV@�����
��
w��-�����>T�l|�t�1U��{Wg��O1>^X٠�kHF�E���uq������E��k�<�1�����/Tꦠ�縰���9k+�kMsJ�&2�Ul��ub�.�7��e�;]�(n���腝�^a�����1�&�栊2]܌ �/i�o�I�G��#���4sB��n��	U���L�㭺�Mܮ�?��tqq�9�B;ػ�㵝mmn;9�pgЏ���Cħ�MEm�l'�v��&c}�tb�DDK܉��!�[�V0&�b�%ROݏ�D����[����k�S�����|E�s{ڂ^O����K;w�۷NT���M�`s��nN��[:|8`4�A�Q��+hw{�fs���=m=�qqE(#����m)%��&(���o�\�F�B�\�۶Χ66����8Yr;��΃�YjjSg0H8"k��Ջ����d|�%E���=����Z�!u��$F�~�-�إ�ă������B�F�"��`�4`?D�*��2��p�
�.���:+au��hb��n��f�C�-jhXjH6_���"�nZ�M�KJ�/s��L�ʝj�F�W�|#I�ٰwu��G��K���S��GD;��X�<�:�%�<�����S�!!��7���`*�h���Z:�cP3B��36�PUb�K�ՃA@gGG �z"���G���c��j�VS��[�jye�j�<����4r���ō����^O��I�+]<%~���$lO����ξb_�d��L&�:�l掷��QB����Q���1�jҬ����AX6�#�7�.�^l�.0vX� �Ɠ��%��14��V1��]�J���+�L-J��9^(\����C�e��x�aUT���.^/S�����D[.S<�M�k��t�*XZ�y��[s��tq�e~���;��(��>�Y{c�Afq�E}�b�~����-*+^j�}���t�x#�E��8��7�:���d�T��u��V$��޷��'v�jk�x���b�j��6�����9���m���}����6܀�0Iv�_p���*�x?=jw]C�Q1��yk��ۯ-�~�4	��{	G�u��w�E�Z>7(�=xT�	Z�e��0ӟ}�(��iJ�o���t�׃�^�ᥴ��N���S��qh�wmgK��-h���W#�MB'�E	x�?�37kg�ԷN����Ȳ,;/�A����C1LDy��������G;Y�n]'6�Y�y��I�`�I���ɒ�j6���z���c�b_���#�q��3�07�^�"���ɼK��K\B�O�Δ֯.�l��yL	UB���e�&/�0�z [@�e5�7�˘��k��H�`M�7Os[��1�����־~|��|�{��V�c���Hhq��E��ʫJ�4�}��_d1H�F�;Nظ~�ì$�oh��b
�(�J�|o���6�VL����'�1�5M�� _�^5�y��X�":�Kʦ�gr�b�g@;�6�$�)�$�ZU^m]�IF��2r2G�0�;ÁM���M\�"2X�D��u��K�B�+�2t�V^J5L�ؼ���{;s�DQޯ1����W�w��K�'�
j�`#�R�Z�yw2�2���`����Zm�Q�N��;��(�}�u 2R�����ێ��&�q �k���w�MǕ�4HbH���K�F�".::��	Ŀw�i�CQ'���䠠����,�h�P�|�����f��N�ܣ$M�������8�9�g�E�.Y=��.�ʋ�村��RpT��zTG��}d7�@^�k��Ž�:�#.az:T�/JƗ�F����BNA]�I����ͻ#�d7Ѐ 
G08�����{�*�#JOC�빪�߻G;*��E��^B�$�87�Ym�z�$5��6kP�@��\b��?���[Z���M�e�5GsI�.��BGu�U Cƈa���Sч�韣�0��1��ݯ���&1�y��	�U�Y���Q~5�ʝe(D��d�/�~lz�����ʟ}��B+=A��]لo�g/Ň(�yI��ʬ�����z�_5y/.��[�4U�l��L�m3g�wsG �M�m'�����)�Qzu�7m�wJ�P�J9y�5L�Z�]�EIsGK�c��_�G}~OFy	�f��Ӛ���'���.DW�~a7�B��K��n�5� 7(Sp}S���ˢ}uL��[�70�ml��>��eU�AV��k�B���LI���O�$�p��$Gʑ�XS�l�kc�h.W�f�}��w�9능}��1�\v�B�6�c ���p��l06�8�����X|i{���Q���������+�}���ߏ��W���{-���w��8�9�|��	�3�|��B�Y�C���PVl{π�t6���t�E~�̦��T�9�|N7�3��L�Y�f��l6G>����9��c?�d�����+�o��}!�-bU2��-��j[yb���a�����c�� �Wv��D��AIJ��*�]��	�������T6����� ��V��)l��Ҭ�5���]nv�n9�I~�H=�~/���~b���/N��~�e�~��~)���D^;��29(39H�����᤯�J��*��V��V��:1-%��v�u}ZSMZ'%�別u�ڑ��4��ɉi���ډ�v%�5ݤ�&1-5��cH��$�f��NILK���"�z)	�����٩q�
��K���fZ�V�j�h]`�*&�L�D�$����$��A�dR���g>�
�=��}��P>����!��G(�B����'P�>��Tl�Tl���f��ӛ�������̜���0D��0x7��?�n47��S~[��g�肑����2ݘ�c�a4���g�P>s�,�%���ñ �x�A*��0����_P��|��d_�b��`�þ�cq#��h�l��ZkTk�Q�9+�P>Oe��q�>k��Q����9������r�1J?�y5�He\��NaB
Ip�*���Pγ`>ס��z>y�˳m8�Y8�g�p^BP~��	p��,0q(���FQd��0��('�����H�a␏8�F� c�q�C�Q�>�[l�p-	l	r'��Ẳ���j
��8�`X�>��
ߦ0�S��%{a�Q�9=s���Ě�½0�w�RCu��2gb�4Z%D����Y�Ȝ��L��e��"�Y �����SA�����g�H^
%|6L�e0���B>��X��#bK`5�/�����'H��q�9pkc��BИ�$��Z^kb�azY��İE~qL�'"����`b\��X�kY�R�9\��,3q-��:��u��k��uN2\�!��ד�5��)�k#�z*�qmF\[�Vĵq=q݀���F\7%�5���µ3	�-\k����X�y}�J5�#�Vd�3q����ĵ��u�ĵ<�����b�D\�B\�����������^��^��^��^
e�2�����U�����ۭ��6��:���$�nb����$؞n��om6�2s��тݰ0���0�M\ mbo��P������; ��@�D�x�Ň�.ރv�>D�~��;�.�>j������9L�r��9���#rV����pID��r�ؔ�%R�'C�������PΞ@��D9���S(g�QΞA9����(c/�������2�:��(co����D�~��藌��D��J(c��u&>u�ai2N0$di2��2��eI($���P���~�2�	��?P�>C�+"�9��(c�<JD��M,�(Z�g6Nq�аCa�=;q� &O/~��d
������dX����a��KL��PwZ�s
}N�ɳB���Z��Q�%���0Z�Y[��1�����"��D,��D�N�=��"эb;%�d���>��*ra�p�h1��ᖬa?n��Ȝr�U���pa-���<�]l�]�e��� LQُ�%�O��K�eƘ0>P ��H,�> 'a@wr��R����֔:H�]�G��)�).G��R���i�9�9�-p�K�I=���rffwA�^8��.��.����k9����iv����@�bRdC˕��=]�5���^��T���W��}p6X�a������rh���Q D!d�"*�a�(��bT��`����֊��,������Q��O�
9M���TC�)NI,�E���
���(�W�+1w�ss�Lv�b?�eײ��􏃛�$��X���5�/�����ϱ�@��mŜ"�����`P�Ĥ&EA
�JH9ǁSeשl�ʮW���Q(0e��aԌ���0��]e7�����7��d�VKG� �d��q��� �@�!�¦h'Xf+Z�N�Ɲ.�5�l�������a��}(�**��f�N.��.l-�c827��m_��AB�
c�\w2�����6�S�GV�_7o��}�i�^�M~��T�~H}O�����dg�m��rd��go��"�����q�sj��g
�s��u�y��|ZF^.��Q��B�v�|!�]��/`�� ,��T�Ǒ�?��"��E�Jm��d�.70�bL(�c�����;`xi�U���F�+�]x>��"�Y=M�:F�b�,N��b������&h��^�(����.�p�����4�m�-:`�� �� �/B��b#�X���F��Y�8�Mg�Rq+粅����J̟*.��-�HX�vHE�F�;1�@�f���/Ȣ������=$Z���݇R�������[�N��T2�����Q�AӶN��a����� We�l�A�_@��O�*�ڢ�=�0���^���;�H��ԍ�(��ԲRELs�$���R��j��tUmQ���*+ai>����ħ��.��i(�/�Y�֕�S�2�h�K�o?��9�$Ш��w��]��4Ր�Rg�6���MK�I�Y��.߶�Y��Y��0]�iX�]�n�)ˍ�ֻঈ�샛W�[��[!?'m+��M��m��U7���d�v�G-��}���2��;v@ji�+1'�.ե큻�dn��\Kd��dv�ť��b��^�ê���{���l��ןk՟F�'��'��s0���C �sP���'�d�,K>���`�I���^��^��^��^Y�jYN�>��e=|�z��z��zT��8�`=zR=��z���s/{J>?e��'��Ce;�"�4���5�ŵ��؊�z;�H�C��	����o�"q;��;�i�
���P#ހ��m8Y������.�Nq?ڝ�p����p�x^��l�7l�ol��x�	��DK�,�*&^gn�ڞ�Y	�M��T��O�,_�嫱��}X�O���5�(����s��;O<�.�aWc��X�f�7�߉���߲���),{�^Ʋ���},�T��>/�c�A�:g��&����+^���x�6	�M�oe�io����a�g;˔{���N�K|��{�M�4v�/{K�s�c�qt���?��4�03T���0w{�\,?>b?1g�O����9�W�M�j��=�~�FN���~���$�4{R������"UFϪ�9��C��U�[�� (r9�Sqa���ўb[����!�S1`��9f_�et5>)y��=�!&h�X �0E�	+�,7����!O3�"������:y�6��b����^��O M|�r��-ʱB������ULvT߯�W������%{�4������	عFȍ�]h< ��xvv����<��;�X\�~�Fh�]��LL��B�QdQwo�!�0(`����~)��=;`r�e�^[h�m��̘b+(�$���0�/�KT��@��
F��!W�3�A)�R��E�WQ�4��T8Cq���@�[�(ٰSɁ=�+$���5��UB�z��^S|)GB+d��Wd�uT~���@A6�w(8B>s�Uٛa0�s�`��3ʻ����\w��C�1�"�'`�VD��az�_b��YE�9��,q���T��\e���f�5���8"b������6�n�<�����"�\��1�sV^���^xb��Õ���y�_����M��_o5���e��O#�=l�$h�鐭̀�L(Pf�Le,T�a�Ric��b���6�[0�74��w��r�e��8<^�Z�N�`���VD�Ȥ	Sj�:�,EȖ�t�e��2��	�{�}S��*#���?�M�I��m�i��2�M��H�Wc�7�O�5T�y�:Ѯ
�5V�2_�YnH�x�C��7�wT��;�j���.�I���0AY��8�+�S�Q�@��Z�fT��kЈ��5i{G�b�sO�o�F�fC>���,�� ,Qٟ��5J�?�����2Qj} ^���X��ld������}�ӊE�
�}��*#����U(�ot��{���bWw�[�y��>J Ҕ�l���,UBP��a��	�(���ms�j���R�VC��QK��'�5�8�l��l������x�}���g��Ȍ�cf��9GN�C��]k[�=����(���:��\���`�r4(��_��K�������зXC�"�^�D��� ��'�]������dz�ۘ\��KJS\)&
y��0̣����"Z����r@);��ïRv-���B.=?�J��d;��rEq�6O2��h�k��]E:2\��d텏]��.�+���l�\c��8�F��܄�r�Qn�y�m����\���.T�_�O�:�{�j�~�Aى^�A��"�}fa��׸���6K�n���mg!s0�F���h��,P� �|T�����Q��9���ȠA���#׀��	�	��?���[a����ť�G�+��4��2��!S���}��$bX�7��{˿G��T�����fk�}��������� �����
����)6Z�������4���u�>F1X���'@W�D�k�<��30Iyj���T�EX��땗��w�]y�Tބו��C))���ʻ��{l��>��1��x�#+�(�)�o��8W���r�Shά��<<0�#q�2G�"@g��?�?q����)$�!� ����Y*���:[�Lc-��?��:���itP�&�?�>�mC[���|�,)N3]���W�k��Ⱦ�l��Ϥ�C�FJ�K9��K�$�\~%h����RѼ��zv��2�88:Lr(0ő���h����,�;Cn_δ����57���<y�a(d����6
�փ�yƍi�wyQ(�������D3�e��bp���)���-����8��Ȑ�b4��hه��}hE��������0��+�a0||�*����:"l9�-G[2�q�t���E%*Y+3hX��Xn�6�bm8g�£� d�sS*eL�R��sJ�v��*n7E��}�_�ۃ�[���m��E$M��p��KEh�e��ʢn:���]�%wg���`�K�{�+� u(�#����u����8ܽ��y�D�8��!ÑC`�#�� �:���1�:���16;����p�c&\�(������C�el2n��<E�2�0I~#�o��Ղ�V��ȱ�u\�B�W�֞���S�ZN�����v2T�f�p��A�Fi?%r���o`��Ȟ9��I���W���ch~1����ip�w3�A�-�7Dl.�X9��<�u̷ٕ�rd�������p����	N�X������o|�N㙑��l��@`���6ٲ��p¹qE)�����H�qEZ��¸��H�%qE�H�O��"E?�+�#Ee���l��T����XFf�6hI�^�� ���]��eG|uˑ��6=3"���%|Ͳ̙+�ex���a�'����
¿��A<�d��_�!�%����߰�,��f�Py�Ʒo`��x%�+�Z�G���b����l��#R���PK
   ��G-@K�   "  2   org/springframework/web/servlet/ViewResolver.class�NMk�@}ccbc���	�ל�)T��}cX�f�f���z��Gw�6W����������<&H	ϖ�;�)�?�	�<?�N
-�Rl�UU�ݘ�)-rSH��"7�M��{c�D�{Ѱ�4;>f�t}.�v�TM���[�ڂߕ�Z/a��������7��`v�?r���/#�������G��>ߏ0�PK
   ��G�|7VL  �  =   org/springframework/web/servlet/NoHandlerFoundException.class�SmO�P~.�(t����[٨�*�/	D�c&�K��m��X��u���h"#����2��NBF5�4}ι'�s�O{����֒��@�A
9>Ja>�ǜfr
ơ�`y�B�IJ���;�o��t��<2�t�ƞ�YN�HO~�ʎ�n�,�lI�!���|���F�ͬ}�<�Ǯ���nF���H�xn9��R`'{�}D�JmsU���ېeˑ��aMzo͚-�nݴ��g�_��-��ވ�,kFGzG��[2��-�m��4^��e۷\�N2֔~�]�l.�0��^�La�۲���qʞ���r���g�2�" 0=8�fײ����LV\�ʵ}�z���X���_�W�U�`�ū*&pM�u�4n�����<��9o/��,ׄ�nK��-D�0�8�S;�u�����%2(j�*�誌�%�������D��q�`LN��1�7����0���_�7=L��$AP�!�C�#��)=�Q�p
���0M8�a�䰊E�a�xF�M���&���@��p"�x�� �cT����xEf�_�|>�*�Ak5$�[܍��_E�gq/B���"�Z���PK
   ��Gg��;�   b  3   org/springframework/web/servlet/ThemeResolver.class���AEoy��B|:���X��A�1=���m>�G��XP���n���\Og T��	5�Z�	���偿e�����?
�*	و�1����=�����ۼ��Џ����P�lކ����M�2��~3�Bٓ{5��*����?z�ک�В*:NeW;H��>�&��g8]������Y� [�(X��:�7PK
   ��G           &   org/springframework/web/servlet/theme/ PK
   ��GU\�k  �  B   org/springframework/web/servlet/theme/ThemeChangeInterceptor.class�U[oE�&��&���Л)�.�Il�]���.��(I��4^��=����.��$?��@*�H��J ΌW�S,9��s9>s�������/�X�z9�pps
�4&�^�c9�
>p��>����9|�[��k����5�7�n7��H���r/�a��Q�;5��f&��j�=�0s����3+~�:��Rq��jFm��n���������G-�q��{*�T�Oꛑ�xI��="��(�O�#��%BBy�+����f������%bI�&B�{���ҿYhpn�ڙ��(�ӱ<lk�������R��A�N_p_|����UKb���9�b��h�Z�k
��GJQp($�76 ���#�@O��aJ����L񓧮��<Y+)2�#�X�(�z��c�m5+ٵc�7��9���;Q�2���x_��ڑ�9�ΰ�_j��6��Ō������A��4.� t7D�DA�b��vT8�£����0R?,�ª��\��B��+����	\��X�Zc�4�^���F��J�`���e��J��p�d�S�C�������Kh��pT���NzqI奞h)q�(?��1G^_b��i����m����'��9sWh��h�O 3`x��&�GeLg�d���������S���䏰�7ޠ5K;p���p�Nn_gq�v�󸐚����͔�#,,æ/��p���ZЧY��7S[��v�X�Le��:� ���HK?~F`3�W���ϰ'P����Z�	�������38_�O=��oy�|=OjYַ�lҸ�D?P��hR�V��9X�6�3���P'7�	�ۤmk�N\F� �P:�1�+�wɺ�E\#���f�/,8Xt���bUL�S�_���PK
   ��G�rG�    A   org/springframework/web/servlet/theme/AbstractThemeResolver.class�R]oA=Sv��R[Ah�����&�d�$��J��IKy%�0��.�fv������� ���B�|ع��=s���� ^�{)�Q�`���p�P>���t[��}ںrz�އ�Y{�m��r�-�q���ؾT�����0�T��S��3�|�ލ��.��<�O5�j��8G�n;^ �Ӊ+d�������}.=]/AC�x�;'�c;���^K����Ξ׎���B�J7�[n�$.�_�(�gB��|$�Ɋ�Be�H�b~����R]w�e8�Cq�i���^�mYl"�����0���,,���9wo�P1�������o�FDq)�)���@�>jBy�0rN�Uo	g7k�`�\�+���G�Z�x�mʲ*v�"M��L������\�pH��Bq�Z*�̊M�4PXj�q��/0>=H%c��F�#Ř��PK
   ��G��t�  R  >   org/springframework/web/servlet/theme/FixedThemeResolver.class�SMo�@}��uj���|ץ��`�B��CT��T�I&�����:�
.T	��(���j�4R#|�����f<3���_ �7]�㖃�e�qQĚ��:��� 
��bm뀡�w��r#�h/�I��v�=�F����9�Β��Y#}_&"��=��t�O�!�}Ib��Հ���c���I2G$��"��O���G>��c�@���E+s4�sJRշl��﷔I�	��2l�H�P��NН��s�dG��g�4�.������9Â:)�:�n+NE�v3�ճMd0��P�]l�>����d�$�P�}���*��7�%�`x�ã(V^g��ɳ�x�T�ǽn�둠H�~;�� =�4���������ݘ��mRv�z�O�5�x��rm�"�Ԧ���%90_�tQKW�|���s�G`ߴQ�-�s-+Y .����a1?պ`��Q�:޴�Y@6�Tm�%,�4M]SIk�'���#����z`����c.7�2�J���*���n9n�PK
   ��G�٘@  [  @   org/springframework/web/servlet/theme/SessionThemeResolver.class�TYSA�&�LX���X�ˀAP�H��jFX]�qw����hRZe�䃿�R{fW�e�a{zz���������' �1m��v8c��m,gqNY�s\0�D�㢁K��6W����k��'��l)_*M�-���噩�{��l1W�3����K��ڵy�$}�6?��6��9����gH�{s��kک�bc�"��]q�r���{�����	��CӞ?ou�ط�s�j=+��+�%Ģ�J"�VV�x���B���^$w�����b`Aʺ5I�fĳ��`o����2�n��]�G�,I���`�u��	3r��V���ZP�j�ܚ��Fҏ��0B��� 9D�CU7�Q�~UL8�m{�5b@�H��D7vp��(��wj&n �1fb7M�1����Kcǝ>�����[&&�31��4�z�M�A�F�5�\%��]���N��>�S�U� �D�!�z *�h���3/d�kNR�*Iޅ���s��t��DT�4�(7�c��n��t��s9ь��^���;(�T���&4QԠYn���mkj�Ut�[�];P�(�0�6�^�9��f���)�"$��p�W�;Q����.H�ig��hݖ}�LJ;I�i�i�"i��{"�}��K���9��U�?#Q����<��mo�,���	\F�j�#�_����8@���A��!9�=����#�N��'hM����h{	��	�
��5���J~���ѳ��Z�t]i�p\sMkq��
b?��	�'9N):1���J�� (5I%�U���ɇ�ў2Vб3�Ib��!���^�s$3�'�?PK
   ��G�@���  x
  ?   org/springframework/web/servlet/theme/CookieThemeResolver.class�VmWE~6/l�@��V����(B���&A�B���&B`ɦ�������մ�s<~����/=��nB� �fg����s��w���+��^aAĢ�u����a��"]XATD�[V�Xú_��q$�-�6��K>l�Hy�Âid�,�����m������R|g%[��3;��h"��\JD���ʑR�r1�6�R����UC)[�Zc�Z��f6���,e2���l���o G66�7�����T#��YR9$���R�d,
pNLn	pE�Y{�2K�sL�(9�qRZ^Q���׶�e앪�qM/��NuW'�'�~z�r�*ӏTf�~`(�i%f�bUM=b:e�2c�����*p��b;����v����1-�a�i�ڞaTBk4�-C�=���n�>��u�K��K�	�4ZTϛRP%��t◞6��AB��zS	�x @"�Z2*\6�ݪ�1n/�G��\|��DQ�y�.0oZ��y+��jS�U�{�.����(�$sO�F%�ˇ���p�"I��Pe��Q�d�JP�#�%��� �aW�$d	E�I(a_�TWNc,�Jj��"%�y��
���٪C8/��QR�|VY�銡Q.��t8����D�Ducͭ¹y���z��[2(�\͠��v��b����</�����5��,��/='��8[����p:��<t����h���d!ٴ�=��aO�s�&�1[������N��:�B���¥��}�J:;ԎXn��p<��2�*U�5�d�YJ�����
����64˄���8�R��o�4�J��8iMJ�a޲�m��v�=	4�O�5����/!�>�Op��ᮣ�،���:0O�x��>,�Y$+71N_�Lب���g�Sx��5�Q�3-/�����>�X!s���zք�0��"�&�)��?I7}cS�!��ǁ�Й��;�lJ���
]����]���=:�]�����;	x�'�t�y��	�w��#?�I�$�C����*~���ջK/�
vM���f]R�\�X3���T�I�i�Ax2a�Љ�~�o�1��D�y��6>�����8\0h�䜃&g9@����n����:���ٌ���7�ZʦLk�.�J*�Lֲ�����٧��a�8k����>x(�F�m�>��/�m���稣��� u\y����y�'�3Ko�%l���PK
   ��G           $   org/springframework/web/servlet/mvc/ PK
   ��G��Ƭ  D  C   org/springframework/web/servlet/mvc/UrlFilenameViewController.class�VYS�V�d�����͐fi�mp��,%Y�Ӥ�ma;��tM�}o�;��oyM:��43�>�3�M�Ε� c&��x�ޣ�s���O��?���W '�q�/��Sl�H���4{H�h�ʆ�V��n�,2�|x���u^��mx���y6��%Dd[�cs�2|؋+̱Ȭ�n0kQ@Y�oE�J���nH�R�,)�p��JJa������}�$�$�%yR�e�5o�(��q�B���RA�S��Ûߞ�
�ue��;WRJ����~R�[�J��0������e�qUsR9#i%�l/�F��s8?�j��^a�1^Q�����벶\����r.<��/�ʲB�3��IU14�\�5�]6��*=[�2j�)C�-�ެ䖘sYX��5p���<e������3�ƗTmF�iʺ�a�F`�a_4�J8JC��`{�4�&hk8ǚ�!�M�D˫�&�銬�-�`gj�d�Н][��^�����}v*OS�@�nH��b�WYҍ���I/���9쬨:)��d]�8���jj9�}`}�~�!FK� �s����8�C����ͩJ��4Y1���"}z��8��"FqV�y�PETpH�M���7/�abY�
V�.��𦈷�	���̆wpK�mܡ��x�x��q譇�0K弬�8�a����)�9���3�d|$�[ߑp����;5CO��JJ�H�
�p8�����s�t4���F�.���#�d,qy>�N��&f�ɯ��� R�F�+k�u:{Cα3q�q�@jQ�dҷ����jަo\�j vmG�r�i3D�b;]����L�yo�J8���f��n�,�z4�(���CI����4po��+JZĨ�$�6�tO/l# � /h�5�"XK�MVuV�����/���.��N�IbM�PkK�����p�FA���
��Y 	g���lj)4he<Y@�!�@������sm���>�p�
Zp<����A�g�O1D3�0��S,P����@�w���Xi�[l��z=�D,��5w�YlG%�3p����]4�bm�Yg�s�if|<�����Z��7�8�O=�0_Ox�'�!|�9§��	g�I��vp����#��%UѺ�Qc�#���s����<F�K�s��Eأ������Ghs�7����h���U�A);�{�8�Q�����5����I�o�m��1+-���_��ԡ��&�9Ų��#��f���-ﰶ��ކa�s����n�ܢ\��w�G�U���uf!�YȒ�#�>��M�5f��(�C�`�]Ů�����ݣ��*v������Қ�<��W��^�/�}�^|E�k����CiЦ�ErN�Qꥪ�H��bZp�,ޢ)����F7ǍS�b7�M��]����{�!����_�bw�L?MU�՗��
����[����Z��� PK
   ��G�mA��  �  C   org/springframework/web/servlet/mvc/ServletWrappingController.class�W�sU�m�v�t[�PZP��� M[�@�R@�*)�R��m�����~���
�3:���O:#�`g�7�(�sv�I��ig�tz�ݻ���9�{�9����O xԄp%B�$��F��dLEЀk�s��i�q#�&�'�f�C�1A+����9Û"�Y~���kj2nEЅ��P�����a��˸#Òa�p$(��!�]�maK�:#t�U�Ȧ�5�g�4f�,	��3�Jh��ΫI]5�IwkPBSJ��S�������C$��\Ts$-J9%�V�Мq�"	GXd�ӓ*8���̼�M����Pi��;j؎j�i���ZL�/�~8��x�-I�{&%�F�#�i��X��kB��]�̴�O�����fș�ȧ�c��M�y�y�]]0���1S���O�ټj��<	��e꺰]���:J;�U�����Xʯ��U%��Jk	ۣgG��il����t��������E�C�w��,i�$S��%���Լ�l��bZ��4(�
�ќjdtqY�)�| C�%܏W�ۜ���i��57��dK�lxR���a#3��:��,H8�IW(-ߜ����#KҶ�%bGM��mw���IHŷ�\=��U`��dg���|6v��K�EgP�|��Q�x�EV]
")�`��9�smO]�^VW��!XTG��$ȷ�Z�
���葰�D��ER����0�bjK�Y^%c��d�,�a+�玚��XRpН�<��M�˽�e��
>�=ᾄWo�!2v�1cZ.�v*��U�"6���z}�7|��
>��
��W-Nw����?P�>W�*x��>�%[�f�g�~�i�\1YK���$��ZJ�U���[���\C5U����	}+�Ѩ�\=��[��_��R����ުĥ��2��l�y�WB,����V�~$�i��m�W Eu�2s���uj��02��jMU[�5࢙]kj�.�ޚڕ!J_��/��i���V���Ի����of�.�t�\I�_iЩ:�uZdUg��>�Z܍ �`/b���z	�;5���O�]S�t���3��I��'���4DH�m���h�ZA�cH��4Fh&�4��J���2^��n5^#	���e�Cf�`���������+/�cEt�9X��uZ�����eV��~��ʝ:V�����D-���	k�s�XC��
Wb�#���`���:E��1�I3v�w�OѲ���hd�E�ZF����U�҉m��-��{�Ut;��`�>Es��0��v��1:�s]S	i;�`W �c;@�b���������+��k���2��_.����eIa�A�����8M�������]"A�[����O�e���H����󄋔���t-��<FI�dF�^��1�V�c3O��c��b��,��g�-��1�$}�f��d��9Q�܀��E�0P����&�����;�s��f`H������>f�@��~����PK
   ��G�o�o    G   org/springframework/web/servlet/mvc/ParameterizableViewController.class�W�se�}�t�tX���営�p[Bm�R�ڤEP��dI����	�+8���X�ǧ�8΀�G_pƿ�q<g�mb��0>�|����\���~��n\`=�[�<^�0!!��8�� �)&'x�Z���V��7�q& /�J�`ƙ��Da�D+�H���B�s|��0@'�j8ϻLt��!!#!+��k�%����J^	늑�%ΫI{@ `ي��3)U`�h�L�����s�2�^ʘ�3��#sX�Bc����8-�tP34���7�3EK�V�j���&T3�$t�!d��>����K�=�Y�u�_RaK5�j�g����_٪�]f�)�l0c�fF�U���Z�͗Q�X��9f��؜_di�� -�J-k�=���(�'���eZ@r���u�4[c%���A�ԐU!%X��<냫N4ckK�Wt��k��l�T'��iV(kV�-����H��z1�Z��A�5]�j)�E��fJ����lV6cX���Q;An�#�r�d�<o
U�隣H7
�3[aY`Ǔ!�a@}9TH�Y[#�.�9�əIuX�6�~l��`�2�b���(����67Rq2��I�fl���e��CL�ʰ�SBNF�b���4��P���:�m�izJ%��xGƻ��=\�pU���@F�u~��>��۟$d>��)>��9��a��xQ�>����a$����e�JҮ\]��bF65�w�7��S(L��u�&�b�c���t,�OƦ#���������������9bSR9����y�~�´���=��<��C�fU#%��Ps����Y�N^�s�3QFh�6�wT��c�GԈ9:6=8�E��"��V�	��rY�r�lƴ�n,9�j���5ֺ��눑��úb��c"p�ѡ�&G��$�3WI�"�^BG��X�p�a#��XO?j���X�����Y��i@�� �S�VA����/[�&�rz��%�a;���>D�����OY:���%�}������wa�t��qu�p�t�ށ�Ox��ƻ?���O�r\*#;X���ջ�><k�HdZ�Th��^�����1S�o�����a���K��j�g��%`r�Mށ�VUZպi=�#5@��ES5��$c.�+�Ә����* �:@|���E�b��駻��EHQ"���RD���F�O���E�!�C�rm7�� +N��J>�
ѧ��(=��<B�K�����گ��N����Et�Af[�/n=@')y������]E<s��{��GJ���n�-�9V4I����+WA?� �Y~z�d\��]�T}�����|EO����\�������?�'4{K�/F�&U���x�(L~��4��t��^� r��C�#S'p7x��G�p�9!�Q'��)樓��PK
   ��Gd׎C�  �
  C   org/springframework/web/servlet/mvc/AbstractUrlViewController.class�V�SU�.,���R"J�ZK���Z��^�h�c�\�����?�w�_茅Vf������͂�q&sr��s���������~�!��1-#�@�;�&f�6+Ĝ�q,$��	�[+O���0�ua+2�&Ѓ�8�����X�cM��b?/����2�Al�ؔ�Õ�5��~u��wn�l��y�kX�-W��=����xQ|�������2�)���X�A��˜�'gX|%����MZ���%�,�!��Eɯã�.=����j�%-[�|W/�Ġ`�Y��]�4C}��������B`�	?�)H]��n�M�N�/��;��!�Z�5{���Q�M���3�-6�u��hj�˄S�MV΀L��.����n�M�ʿ��/=��M�S�m}Wqת�;�"���Bt"s���ؖ�3�y]�p�Y�,RF�d��a�T�n��|�1��i�;�S�voxN3u��������%N+D��`��K;˺���C�C!2X���#ޙ��p���Ě�%�`��iYғ⨂\gH_<�
���
��-cB���9a���W-�W�\��d|��|�@��
��C��Q�QRPq<}���0ˢ:�W��-�"��E�Q[�0\U�lW��Bu��J3���*�ء�s��a*��������p�2�&Oǃ�z3�0IY��vd
�
���?�PO�ۼ5݉z�`��0w\ʍ�3�JEpQ�.��T�Zɮը4�IZ�u7��݆7ǋAe�P�9�Ș�8ܢǉTzg������Gq�K5m����G��$���R��c��$�/�<ܫ��%�	�S�����.ٹa��$q�������
�z�˜ѻ���8���$Uz�B;i@2} �>D���_B����p��x�)HH�Ҕ�=����:;�ʒ���L�
ix�A��!�@�0�(��.3�\�4\��fZ��#��p�i�%�{��v7��n1�S�{�t�Dк)��:bȣ�T�5���&�!�j��C���..>o�G#��P����:�?��Gb|]+i��}����F7�O��!z(��ޫ���H�^#1!�>����6bpcH�70$ȴ�dB'�J����[l�'����N���y|Dk,��P���T��a%1�OI�p������c�I���auM�1x�PK
   ��GY��)�    ?   org/springframework/web/servlet/mvc/WebContentInterceptor.class�X�{g�M��lv�+\�T�H9ٖ��4&!G�:ٝl���LgfIB[��֫-���jU<��
��"U[�Z<�Q���A���f��M6$�S}x2������}�����s����g�bD�he8TE�m*n��"��C��#w
�����P�G��(>�]�;�{�q����O
ʧ"hħýa�'�� ���>��V�P��Ca<,ޏ��G#d{,��	��a<!�>��IA�B_��T|Y���|5������(��7U|KŷU<�`^�M���`��vWAc�����Vj��3ư�Ň��x�7��݅�-O�A�Kw�{
t��/���5S��g]C�Ż�ϴn�⽾��R@�f�F�J6$�Pi��Sm\S�F��3�G�ʍ�e������)��IC�hZFw6�o����4)՝vBO��)�sĐ?h�D-3:�3܃iÏg&�{��6�[�0�M�o�x�ߚ�G�ݞ�%���#v�~a�"}���_�F)zz���We'����k_K̄^�V��ڂ���6Y}��${ȑ�UO��e��h�ïnC��L�V6c��oږ/���3���J�l��0���C4^2�8�`>��S�$u��2-K�i�ѡ[I�88b$�A�w�|���ƭY��[fe������H�-u��0
��Q�����T0��9��4(O�0g��Hڶ��N�|�,�^暕d��(G�0�ʵ��,gL<�<�i+X[;=g�J�2~��2=���LQs�I�w�̱="B������X��V+�g�2��LE��׆����>�����������I')����#
���f<z�,��S�j��NHjx��Ͻ?	�M��l��-�C�X������i5ce�Z�]@C6j،v�E�b����,ۏ�1�X�qc8�⤆qlRqJ�i|�F��pF��q��sjNkx?��C�~��\^`�4-^�9?�y/j�	ΰCN��)k���hWv��H�e���ΘTWl�vc7k�)^�ԸE��L����0��Z'=*$�/Y�S�}[��
�Vp�\f\����Zs�4�^�o���Hz6�T�2~��w��DDK_�+���?j���Z����⬊�i�;�����=�9�g����c�~��V��FH��M:�In�ʥ%'#Y\���̗[��6�%*P�3W�G+*3���6�	O/���̚�Wt=SP�H:mXRjƓ�	>Fsc���n�A�`P��l�hO�ؓw2���e��9"�֕�Q��{N�����D=���Ǝ�r�Do��#&�s)�ӂ����b�;'�w�\{tI+�v*%�<&���'�L��:.6����Ksp���f�?�j�ĵ(It^����9�,�s�M÷�Ԑ��H
ML�>��T�~)�����p���Ƅ�1C�=�����î7zn����7V��3a����r����j������<a3���Ot����u��x{���ʹ܆׌X����ȡ�X�_��B�u(��X�m�v.c���z�8�����������SB�{m}�	(��Q��ʏ#�e��ǡr��8"G%�;�\Ɵ� `U/��T�����j$nBߊ��9u��.㻪�B+���ȍ��1�N	�,`́��l%�"n3�iS��n�p�rp۩0����i��Nb~}�0�8��P��ZU^�$j'�r����L#�q,P�0��]��X����Z�Y,�MMcXrKǱ�{����� $-X	��a�>BkF��������;�E��]����ios޶f��Ц��yv���\��.RvKϔ]�|}���CNs��s"S�s�s7����v��@�}��=�*�L�J��_޴!�U�8.��J�Oc����7�aeM���+�Cl��P/Ho�PQS��
Dㅢ��h�����4HC��^��֎��Zf2�n&�@�>�4S.]���c&�OW�� �A&�C��Ìף���1<�{�8����6ɻ�<nƻeE��-x�t�y�/�:#-���#Aw�.B�E4�H^�fƢ�*&�H#��w�\T_"�(�"���P�Ll�j<��A�6)L�u
�������j��2T��Ů)�N���	�A��z��;��=�Ly�8�B9��0�$<�>��'���< �$�w�	{1D�H���A�.@����T���_$*��
RKf�8�2���ҍ�K]��yJ��J��J��beáM^��.��T]x]�|d��:(q��PK
   ��G̨��   S  4   org/springframework/web/servlet/mvc/Controller.class�O�n�0�J(mE%~.X�5�
���w�,!���6	��W|@?���"8��>f5������<F���%<m�N�y`�	_��V��(�R�����qf�7i�0�q<��	W�\gk+w\�)*^]�S��z��2�*&tߎ	>�/��&��+&��F{k�b;� �n�ߕ���ϵN(�31[m9	O�����6��@m�"4�
�.�:��G�n��PK
   ��G��#&�   �   6   org/springframework/web/servlet/mvc/LastModified.classU���@��﫸�-p���."�>��������*���<�h#�0�L2���u X���q�%b��4v[�*R�c7���	úLي��'����{>_���dC�{�E�R)F��Y!�s�*�#-3��(���Y���z)R��b�'���@-j�h�	���PK
   ��G��ˋz  �  <   org/springframework/web/servlet/mvc/AbstractController.class�U]oE=c�=�㒦_�JӐ4v�l������$�E�Q!��fo���qOH|?���HP>@���?�pf��������{g��;�^����? x�s�� ���8��||��9��I�='�Ĝ����B���0x[]�*��(���00ғ�g)ZUC� TWZ5��y�5+��5V<�}G�z�U"���M�k7����"��n��+��P����݅Zl�盥(4:j4�.���T�$�L^������ɗ��׽p��^Vo�Tlޝ���6����1M���mEY�	��Q�r�gl��Xc!\]	�#�l��ڶ	�܆��Wk7�o�Q�;�Oܛ@��`�թ>�ا;�zg�"�X5����5�{M
g^�,q^�	VG�⶯���b�g��#�/�F��kW�Z�W�[#w_����~<�� �g�)���9���<���屈%���KyL� p�ա@�����lFڸ���=�BsY�J{&��~��v7��u
L�w���_L�]������-�K۽r����u�KZ5=M\��n���sk;��8zw�����2A���+�RCwL/�;t�>!����ag��u ��'ek��8�5K��!�����7���H}�]
��x��0W�6q�r�q�c���-��B�>7Gۨ��L���HǖKi�dJ_!�E�T6Q���H�cF�A���'YI�X�:]�	��p���1=����L����o��w
�k�	�Y��rk>�w!�c[s���O���2MV�&L)��{�l>���>�>�O��e|�0�%�1�{�Ȭ��x�شe�M�"���$�E��(����/��J�I<&1.1!q�?��?f�0�K�cG
W]��I��PK
   ��G�rv�j  �  C   org/springframework/web/servlet/mvc/HttpRequestHandlerAdapter.class�T�n�@=c'qI��t	{�l��/%T!PU� ���9�4q��f<I�<�T�'TP��G�c��R�2�3s�9�.��o�� �3�3�a��(4�2p{1�ſG?9y�D�vl��A���bO�&g���ݮs�Ҫw�d��6�κ%�`�d��W]�2}O�NkCXۼ�-����E�å��k��Rz5���}�l9�KM˓\�F���B�L��i�,�c9-�E}�7d9���h�A��#�Gx��6��p��W������P7�s����34�U�bg�i�ۼO�r2̝R�DD�gIeH>�ipOڴ5P�F���Z�$A��͛���ϟy�0�פ��Z��h�knW4�3;�dO��B ��(R���w4:���f�~O3�,��\2L.��0��S�0��2��Z�9��=���\8-h~��O���1��)ZӴ3�2���'����a�ք:�a��T�	�%Ko(���E�ZpW<���PpIgB�(8x�ƌ����0���* =��Xڃ��}�%�=}_AB�d�qAQ�q��wZ��%|��Y\�ts��q���a���Xqq��H�ҍ��ǔ�"<��+��Z9`��3�S#� �M��J��PK
   ��G@x�\l  �  H   org/springframework/web/servlet/mvc/SimpleControllerHandlerAdapter.class�TIo�@��v�Ҹ]�^(�,�Q/,��JUU
RS���I��[�6�I���#��JpB��+?
x^H! �
,y��m���<ϗ��>X�9�s��q+�u�ICC6�-yt�����3,ٮ-1�s�-mūs�Ѳ����V��M��f���,g�v�O��l�Ó�'f��ml���<�k��p�q�4[��Y�[��W<W
�q�X��:���K.J�A��=!)��\y��X�c��Eu��d)��Ao�A!�������&���hJ雫�Tb���,�������Z�:��Yv�[6�#r��1�}����� ��%T���׸/m��(�i6�,[�$B����Kg�ϯu�1W�U�]��d�*^[��3;������0����D��g��O��������R��ކ�QEo���ݓ���û�cJ^��>����e�[��ʡQ��G#I�K�0�L��d*��}(�u Rf1J�;`�I�ύ�$�I%�����	.D���!	�&1afp�la�M�Ċ�揠��PU��ɶe��~�l.�Rd7pW",#BPq5���Ӹ�P�䣆�����b�x�p����I�E�PG"�{�q�
~�߈#��.z&�T�#�g㤜�
��PK
   ��G�yC��  �
  E   org/springframework/web/servlet/mvc/ServletForwardingController.class�V�S�T��݅lwS
�B�*�rY.Q+ި-����BKE�6�9���6��^f��w�?�tFA쨏�O����$�-P`Fgg���|�����v��~�����p��.
�N�ĥ4.cP��$$1"��$��:�B=�ͫiL��0|7�&��Jb:�������L�)\Ǎ4�pS��%|Ȑv��broJ+s�LnI[�TS����Vq�!��|��hX�w�!��5ǐ�u�=�3,>U-�s]˛>�]��9�1�{���J��0�����V��C�������RQ�+u6x��U��IuĶ<�6M���{��ě;�2�x�pD?a���YO+,Oj��XsI�t���;U�z��K3>@�"b%ϫ�WI��C��C�܊m�|��УOR@�!K�3�*�SrG�B�rBw���1���m�~:j��+�(�Rck^�2���W]>a̪(���=hT��Y����!ҥP}T��6/�U�Y!n�c	�ȸ���I�!Xt$�ӻ+i�j�:wZ�l%�SV���zR:d�Q`8ա�|�ZAWK�����M:� �)��I񓱈��	K2�A��	çG��s���U:y/Òa�HC5�v�.H�ȸG�+�/��dx�(Cy�s��Wk��g(F��.����U�;v��R��R�'wRV�Ȧb4%�F}�tv��-�P�Z����S�����k	��7�&�Z��-j�ާ�S���=;آ��ܫ(f��ݒ��[��N�Ӏ4G�M�XU��U4:�Z��eRQ�Gr��l��`�ކ;����%���&��u���5˧�K����Š�?����a�7y��t�4n�X3�s��X"�G�Lt����<�����3��A�~4|�b���Ck��L"y��TZ���n��諽H��ߜ�K$�@��N+�t�Ɨ|x��v��؎u��-���#�Z!�x���k!���x�'�!��}�$K�k�%4����D�d}�nߒ5�YzI��iz0[�u$��M��0���Q?�����c�H���d�$�!o����u4�ǵ��M���t7��p���}���d�ϧ�M4�� W|��'`.�>�!�P�$]4�h͠�~�Q��b�0�O�>�7���|�?��l�(z[���9���x��ր����!"ڀ�����cL?�� !�&I�J��۴�En��3�A�c>+N'% �>bTڷ>%����DLZB&ݾE�1>(��-����PK
   ��Giَ�   '  E   org/springframework/web/servlet/mvc/ServletWrappingController$1.class�M1N�@�	�8��5�У�R 
ԗc16�;k�8K�xT�E�������f~O� �X((�9!/÷X�֎	�%���u��6���cyh�`7�޺������A*;I�1-�|��u�t;X�������yϲq&F������~�7l{��E��u���M1K<�u�Y�<i�,(�?PK
   ��G���S�  F  [   org/springframework/web/servlet/mvc/ServletWrappingController$DelegatingServletConfig.class�V[S�@��`/!B��"�U+�VH[�w��0�Af���u��4�lR.��!u�q|���x6K��rv����s���&�~� ���R2i
(ø4�4Y䤙a2��2ݷ���0�lQќ�0�ʦЫ|���./i;&w��NY+6�B����-Wئ��4I����1,%��]g���o8CO���j�Z��^2�+�e�\ׅ!׾�Sn���27yEwI�W'�M� �XySwN���2L����]��[%]���haK��5S�*Zѕ!	�{���|�e��н�,�F-J�*�.�v�`I��o2R��FV�V��fq��jm����̪W���ۖ-Kw�D���͜�67�#�w��J����-���&˰ض�R��̟�3o���5Qэ*.�����x�i3�U1��T,bX����K�R_�Ћ�/S7�׊a��:1t$e�g�ҡb��2w�D6CGXl��i�Z����/&�?^�p2����{#ׄ]��5�Ca�Z������t�n�}q��(�g`Ѩ�U����K�(�&i�QI�?#�:D�