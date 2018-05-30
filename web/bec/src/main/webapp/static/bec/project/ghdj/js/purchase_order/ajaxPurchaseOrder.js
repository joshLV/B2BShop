
var totalheight = 0;     //定义一个总的高度变量
var flag = true;//数据是否加载完了 true 未完  false  完了
var isLoad = true;//是否加载中， true 未加载  false  正在加载中
$(window).scroll( function() {
    totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop());     //浏览器的高度加上滚动条的高度,减去底部高度

    if ($(document).height() <= totalheight)     //当文档的高度小于或者等于总的高度的时候，开始动态加载数据
    {
        //加载数据
        loadGoods();
    }
});

/**
 * Ajax获取采购单,并组装到HTML中
 * zhangqiang
 * 2016-03-01 15:01:37
 */
function loadGoods(){
    //判断是否加载完
    if( flag && parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val())) {
        flag = false;
        $("#title_reminder").hide();
        $("#goodsDataTable").append('<tr class="shopping_list" style="background: #f3f3f3;"><td colspan="4" align="center" style="color: #ff0000;">没有了...</td></tr>');
    }

    if( !flag ){//加载完了，不需要再加载
        return;
    }else{
        if( !isLoad ){//如果正在加载中，不执行
            return;
        }
        isLoad = false;
        var pageNum = parseInt($("#cur_pageNumber").val()) + 1;
        $.ajax({
            type: "post",
            url: $("#basePath").val() + "/purchaseOrder/ajaxPurchaseOrderData",
            data: {
                platform:'parent',
                title:$("#title").val(),
                startDate:$("#startDate").val(),
                endDate:$("#endDate").val(),
                pageNumber:pageNum
            },
            success: function(data) {
                if (data.status == 'success') {
                    var html = '';

                    $.each(data.goodslist, function (key, goodslist) {
                        var length = goodslist.length;
                        if( length > 1 ){
                            $.each(goodslist, function (goods_index, goods) {
                                if(goods_index == 0){
                                    html += '<tr>';

                                    html +=   '<td width="150" rowspan="'+length+'">';
                                    html +=     goods.title;
                                    html +=   '</td>';

                                    html +=   '<td width="100" rowspan="'+length+'">';
                                    html +=     goods.changeTime;
                                    html +=   '</td>';

                                    html +=   '<td width="100">';
                                    if(goods.type=='1'){
                                        html +=  parseFloat(goods.preferentialRatio).toFixed(2)+'%';
                                    }else{
                                        html +=   '-';
                                    }
                                    html +=   '</td>';

                                    html +=     '<td width="50">';
                                    if(goods.type == '1') {
                                        html += '<input class="btn-5ss" type="button" value="平台采购单" onclick="getPurchaseOrderDetail(\''+goods.id+'\',\''+goods.type+'\');">';
                                    }else if(goods.type == '2') {
                                        html += '<input class="btn-5ss" type="button" value="非平台采购单" onclick="getPurchaseOrderDetail(\''+goods.id+'\',\''+goods.type+'\');">';
                                    }else{
                                        html += '<input class="btn-5ss" type="button" value="平台非认证供应商采购单" onclick="getPurchaseOrderDetail(\''+goods.id+'\',\''+goods.type+'\');">';
                                    }
                                    html += '</td>';

                                    html += '</tr>';
                                }else{
                                    html += '<tr>';

                                    html +=   '<td width="100">';
                                    if(goods.type=='1'){
                                        html +=  parseFloat(goods.preferentialRatio).toFixed(2)+'%';
                                    }else{
                                        html +=   '-';
                                    }
                                    html +=   '</td>';

                                    html +=     '<td width="50">';
                                    if(goods.type == '1') {
                                        html += '<input class="btn-5ss" type="button" value="平台采购单" onclick="getPurchaseOrderDetail(\''+goods.id+'\',\''+goods.type+'\');">';
                                    }else if(goods.type == '2') {
                                        html += '<input class="btn-5ss" type="button" value="非平台采购单" onclick="getPurchaseOrderDetail(\''+goods.id+'\',\''+goods.type+'\');">';
                                    }else{
                                        html += '<input class="btn-5ss" type="button" value="平台非认证供应商采购单" onclick="getPurchaseOrderDetail(\''+goods.id+'\',\''+goods.type+'\');">';
                                    }
                                    html += '</td>';

                                    html += '</tr>';
                                }

                            });
                        }else{
                            $.each(goodslist, function (goods_index, goods) {
                                html += '<tr>';

                                html +=   '<td width="150">';
                                html +=     goods.title;
                                html +=   '</td>';

                                html +=   '<td width="100">';
                                html +=     goods.changeTime;
                                html +=   '</td>';

                                html +=   '<td width="100">';
                                if(goods.type=='1'){
                                    html +=  parseFloat(goods.preferentialRatio).toFixed(2)+'%';
                                }else{
                                    html +=   '-';
                                }
                                html +=   '</td>';

                                html +=     '<td width="50">';
                                if(goods.type == '1') {
                                    html += '<input class="btn-5ss" type="button" value="平台采购单" onclick="getPurchaseOrderDetail(\''+goods.id+'\',\''+goods.type+'\');">';
                                }else if(goods.type == '2') {
                                    html += '<input class="btn-5ss" type="button" value="非平台采购单" onclick="getPurchaseOrderDetail(\''+goods.id+'\',\''+goods.type+'\');">';
                                }else{
                                        html += '<input class="btn-5ss" type="button" value="平台非认证供应商采购单" onclick="getPurchaseOrderDetail(\''+goods.id+'\',\''+goods.type+'\');">';
                                }
                                html += '</td>';

                                html += '</tr>';
                            });
                        }
                    });


                    //判断是否加载完
                    if( parseInt(data.pager.pageNumber) == parseInt(data.pager.pageCount)) {
                        flag = false;
                        $("#title_reminder").hide();
                        html += '<tr class="shopping_list" style="background: #f3f3f3;"><td colspan="4" align="center" style="color: #ff0000;">没有了...</td></tr>';
                    }
                    $("#goodsDataTable").append(html);
                }

                //重新绑定复选框
                //reBindCheckBox();
                //释放动态加载
                isLoad = true;
            }
        });
    }
}

/**
 * 重新绑定复选框
 * zhangqiang
 * 2016-03-01 15:01:37
 */
function reBindCheckBox(){
    var $checkall = $("#checkall");
    //var $allcheck1 = $("#allcheck");// 全选复选框
    var $cartIds = $("#cartListForm input[name='noPlatformGoodsId']");// ID复选框
    // 全选
    //$allcheck1.on('click',function() {
    //    $cartIds.prop("checked", $(this).prop("checked"));
    //    $checkall.prop("checked", $(this).prop("checked"));
    //});
    $checkall.on('click',function(){
        $cartIds.prop("checked", $(this).prop("checked"));
        //$allcheck1.prop("checked", $(this).prop("checked"));
    });
}