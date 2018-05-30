
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
 * Ajax获取采购单商品,并组装到HTML中(非平台商品)
 * zhangqiang
 * 2016-03-01 15:01:37
 */
function loadGoods(){
    //判断是否加载完
    if( flag && parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val())) {
        flag = false;
        $("#title_reminder").hide();
        //$("#goodsDataTable").append('<tr class="shopping_list" style="background: #f3f3f3;"><td colspan="4" align="center" style="color: #ff0000;">没有了...</td></tr>');
        $("#tip_notice").html("没有了...");
    }

    if( !flag ){//加载完了，不需要再加载
        return;
    }else{
        if( !isLoad ){//如果正在加载中，不执行
            return;
        }
        isLoad = false;
        var loadindex = layer.load();
        var pageNum = parseInt($("#cur_pageNumber").val()) + 1;
        $.ajax({
            type: "post",
            url: $("#basePath").val() + "/purchaseOrder/ajaxPurchaseOrderData",
            data: {
                othserId:$("#purchaseId_ss").val(),
                purchaseId:$("#otherPurchaseId_ss").val(),
                platform:1,
                pageNumber:pageNum
            },
            success: function(data) {
                if (data.status == 'success') {
                    $("#allcheckTop,#allCheckDown").prop("checked",false);
                    $("#cur_pageNumber").val( data.pager.pageNumber );//重置当前页页码
                    var html = '';
                    $.each(data.goodslist, function (goods_index, goods) {
                        html += '<tr>';

                        html +=   '<td width="75">';
                        html +=     '<input type="checkbox" id="checkbox_'+goods.id+'" onclick="ifAllCheck();" value="'+goods.id+'"  name="noPlatformGoodsId"/>';
                        html +=   '</td>';

                        html +=   '<td width="225">';
                        html +=      goods.goodsBarcode;
                        html +=   '</td>';

                        html +=   '<td width="270">';
                        html +=      goods.goodsName;
                        html +=   '</td>';

                        html +=   '<td width="150">￥';
                        html +=      goods.inputPrice.toFixed(2);
                        html +=   '</td>';

                        html +=   '<td width="150" class="shop_grey">';
                        html +=      '<input type="text" name="textfield" id="textfield" value="-" class="shop_add" readonly="ture" onfocus="this.blur()" onclick="javascript:reduce(\''+goods.id+'\');">&nbsp;';
                        html +=      '<input type="text" name="textfield2" id="nowGoodsNum_'+goods.id+'" class="shop_number" placeholder="1" onblur="change(\''+goods.id+'\')" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,\'\')}else{this.value=this.value.replace(/\D/g,\'\')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,\'\')}else{this.value=this.value.replace(/\D/g,\'\')}" value="'+goods.quantity+'" onchange="change(\''+goods.id+'\')"/>&nbsp;';
                        html +=      '<input type="text" name="textfield3" id="textfield3" value="+" class="shop_add" readonly="ture" onfocus="this.blur()" onclick="javascript:add(\''+goods.id+'\');">';
                        html +=   '</td>';
                        html += '</tr>';
                    });


                    //判断是否加载完
                    if( parseInt(data.pager.pageNumber) == parseInt(data.pager.pageCount)) {
                        flag = false;
                        $("#title_reminder").hide();
                        //html += '<tr class="shopping_list" style="background: #f3f3f3;"><td colspan="4" align="center" style="color: #ff0000;">没有了...</td></tr>';
                        $("#tip_notice").html("没有了...");
                    }
                    $("#goodsDataTable").append(html);
                }

                //重新绑定复选框
                //reBindCheckBox();
                //释放动态加载
                isLoad = true;
                layer.close(loadindex);
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
    var $allcheckTop = $("#allcheckTop");
    var $allCheckDown = $("#allCheckDown");// 全选复选框

    var $cartIds = $("#cartListForm input[name='noPlatformGoodsId']");// ID复选框
    // 全选
    $allcheckTop.on('click',function() {
        $cartIds.prop("checked", $(this).prop("checked"));
        $allCheckDown.prop("checked", $(this).prop("checked"));
    });
    $allCheckDown.on('click',function(){
        $cartIds.prop("checked", $(this).prop("checked"));
        $allcheckTop.prop("checked", $(this).prop("checked"));
    });
}