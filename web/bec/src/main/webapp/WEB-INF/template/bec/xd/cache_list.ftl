<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>缓存管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link href="${base}/static/assets/jquery-easyui-theme/default/easyui.css" rel="stylesheet" type="text/css"/>
<link href="${base}/static/assets/jquery-easyui-theme/icon.css" rel="stylesheet" type="text/css"/>
<link href="${base}/static/assets/icons/icon-all.css" rel="stylesheet" type="text/css"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${base}/static/assets/jquery-easyui-1.3.6/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${base}/static/assets/jquery-easyui-1.3.6/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
<script src="${base}/static/assets/jdirk/jquery.jdirk.min.js" type="text/javascript"></script>
<link href="${base}/static/assets/jeasyui-extensions/jeasyui.extensions.css" rel="stylesheet" type="text/css"/>
<script src="${base}/static/assets/release/jeasyui.extensions.all.min.js"></script>
<script src="${base}/static/assets/release/jeasyui.icons.all.min.js"></script>
<script src="${base}/static/assets/jeasyui-extensions/jeasyui.extensions.icons.js" type="text/javascript"></script>
<script src="${base}/static/js/base.js" type="text/javascript"></script>
<script src="${base}/static/js/syExtJavascript.js" type="text/javascript"></script>
</head>
<body>
<div class="easyui-layout" data-options="fit: true">
	<div data-options="region: 'north', split: false, border: false" style="height: 33px;background: #F4F4F4; border-bottom: 1px solid #dddddd;">
	    <div class="easyui-toolbar" style="float:left; border-bottom: 0px;">
	        <span>-</span>
	        <a id="btnDel" onclick="onDel()" class="easyui-linkbutton" data-options="plain: true, iconCls: 'icon-standard-delete', tooltip: '清除数据'">清除数据</a>
	        <span>-</span>
	    </div>
	</div>
	<div data-options="region: 'center', border: false" >
	    <div class="easyui-portal" data-options="fit: true, border: false">
	        <div width="100%">
				<table id="grid"></table>
	        </div>
	    </div>
	</div>
</div>
</body>
<script type="text/javascript">
var grid; 

$(function () {
//	grid = $("#grid").datagrid({
//		title: '缓存信息',
//		method: "get",
//		url: "${base}/cache/ajax?mid=1",
//		queryParams: {'property':'','keyword':''},
//		idField: 'id',
//		remoteSort: false,
//		frozenColumns: [[
//		    { field: 'id', checkbox: true }
//		]],
//		columns: [[
//		    { field: 'key', title: '缓存标识', width: 250 },
//		    { field: 'description', title: '缓存描述', minWidth: 300, width: 330 }
//		]],
//		onLoadSuccess:function(data){grid.datagrid('clearSelections');},
//	    pagination: false,
//	    pageSize : 16,
//		pageList : [ 8, 16, 32, 64, 128],
//	    autoEditing: false,//该属性启用双击行时自定开启该行的编辑状态
//	    extEditing: true,//该属性启用行编辑状态的 ExtEditing 风格效果，该属性默认为 true。
//	    singleEditing: true //该属性启用datagrid的只允许单行编辑效果，该属性默认为 true。
//	});
    
});

function getSelectedIds(rows){
	var ids = [];
	$.each(rows,function(index,value) {  
        ids.push(value.id);
    });
    return ids.join(',');
}
function onDel(){
//	var rows = grid.datagrid('getSelections');
//	if(rows.length==0){
//		$.easyui.messager.alert('操作提醒','请选择要清除缓存数据的记录！','warning');
//	}else{
        $.easyui.messager.confirm("操作提醒", "您确定要清除所选记录的缓存数据吗？", function (yes) {
            if(yes){
//				doDel(getSelectedIds(rows));
                doDel('');
            }
        });
//	}
}

function doDel(ids){
	$.ajax({
		type:"POST",
		async: true,
		url:"${base}/cache/delete",
		data:{'ids':ids},
		dataType:"json",
		success:function(data){
			if(data.status=='success'){
                $.easyui.messager.alert('操作提醒','清除完成！','success');
//				grid.datagrid('reload');
			}else{
				$.easyui.messager.alert('操作提醒',data.message,'error');
			}
		}
	});
}
</script>
</html>
