
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
 * Ajax查询商品，并组装到页面
 * TianYu
 * 2016-2-18 15:34:13
 */
function loadGoods(){
    //判断是否加载完
    if( flag && parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val())) {
        flag = false;
        $("#goodsDataTable").append('<tr class="shopping_list"><td colspan="9" align="center">没有了...</td></tr>');
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
            url: $("#basePath").val() + "/ajaxAllG",
            data: {
                mid: $("#cur_mid").val(),
                mn:$("#mn").val(),
                sn:$("#sn").val(),
                pageNumber:pageNum,
                orderBy:$("#cur_orderBy").val(),
                orderType:$("#cur_orderType").val()
            },
            success: function(data) {
                if (data.status == 'success') {
                    $("#cur_pageNumber").val( data.pager.pageNumber );//重置当前页页码
                    var html = '';
                    $.each(data.goodslist, function (goods_index, goods) {
                        html += '<tr class="shopping_list" id="product_' + goods.id + '">';
                        html += '<td width="75">';
                        if (goods.enableBatchPrice == '1') {
                            html += '<input type="hidden" name="" value="' + goods.batchPrice + '" id="defStartBatchPrice_' + goods.id + '" />';
                            html += '<input type="hidden" name="goodsNumId" value="' + goods.startBatchNum + '" id="defStartBatchNum_' + goods.id + '" />';
                        } else {
                            html += '<input type="hidden" name="" value="' + goods.price + '" id="defStartBatchPrice_' + goods.id + '" />';
                            html += '<input type="hidden" name="goodsNumId" value="' + goods.startNum + '" id="defStartBatchNum_' + goods.id + '" />';
                        }

                        html += '<input type="hidden" name="goodsPackageModulus" value="' + goods.packageModulus + '" id="defPackageModulus_' + goods.id + '" />';
                        html += '<input type="hidden" name="goodsLimitNum" value="' + goods.limitNum + '" id="defLimitNum_' + goods.id + '" />';
                        html += '<input type="checkbox" id="checkbox_' + goods.id + '" value="' + goods.id + '" ';
                        if (goods.stock <= 0) {
                            html += ' disabled="true" ';
                        } else {
                            html += ' name="cartId" shopid="' + goods.shopId + '" />';
                        }
                        html += '</td>';

                        html += '<td width="300">';
                        html += '<a ';
                        if (goods.hasRebate == 'yes') {
                            html += 'class="has_rebate_ico"';
                        }
                        html += ' href="' + $("#basePath").val() + '/item/' + goods.id + '.html" target="_blank">';
                        html += goods.name + '&nbsp;&nbsp;&nbsp;';
                        html += goods.packageModulus;
                        if (typeof(goods.packageUnit) != 'undefined' && goods.packageUnit != '') {
                            html += goods.packageUnit;
                        } else {
                            html += '个';
                        }
                        html += '/';
                        if (typeof(goods.unit) != 'undefined' && goods.unit != '') {
                            html += goods.unit;
                        } else {
                            html += '件';
                        }
                        html += '</a>';
                        html += '</td>';

                        html += '<td width="130" class="dd_search" >';
                        html += '   <a href="javascript:void(0);" onclick="allG(\'' + goods.shopId + '\',\'' + goods.shopName + '\',\'\',\'vt=list\')" >' + goods.shopName + '</a>';
                        html += '</td>';

                        html += '<td width="130" class="dd_search" >';
                        html += '    <a href="javascript:void(0);" onclick="allG(\'' + $("#cur_mid").val() + '\',\'' + goods.shortName + '\',\'\',\'vt=list\')">' + goods.shortName + '</a>';
                        html += '</td>';

                        html += '<td width="200">';
                        if (typeof(data.goodsSpList)  != "undefined" && data.goodsSpList != null ) {
                            $.each(data.goodsSpList, function (key, value) {
                                if(goods.id == key){
                                    $.each(value.goodsSpList, function (sp_index, sp) {
                                        html += sp.name + ':';
                                        html += '<select name="goodsSp_' + goods.id + '" spid="' + sp.id + '" spname="' + sp.name + '">';
                                        $.each(value.goodsSpItemList, function (item_index, item) {
                                            if (item.specificationId == sp.id) {
                                                html += '<option value="' + sp.name + ':' + item.name + '" ';
                                                if (item_index == 0) {
                                                    html += 'selected="selected"';
                                                }
                                                html += '>' + item.name + '</option>'
                                            }
                                        });

                                        html += '</select><br>';
                                    });
                                }
                            });
                        }
                        html += '</td>';

                        html += '<td width="130">';
                        html += '<input type="hidden" value="' + goods.enableBatchPrice + '" name="name" id="ifBatchPriceId_' + goods.id + '" />';
                        if (goods.enableBatchPrice == '1') {
                            html += '￥' + goods.batchPrice;
                        } else {
                            html += '￥' + parseFloat(goods.price).toFixed(2);
                        }
                        html += '</td>';

                        html += '<td width="100">';
                        html += '<span id="' + goods.id + '_nowPrice">';
                        if (goods.batchPrice != '' && goods.batchPrice != "0.00") {
                            html += '￥' + parseFloat(goods.maxBatchPrice).toFixed(2);
                        } else {
                            html += '￥' + parseFloat(goods.price).toFixed(2);
                        }
                        html += '</span>';
                        html += '</td>';

                        html += '<td width="105" class="shop_grey">';
                        if (0 < goods.stock) {
                            html += '<input type="text" name="textfield" id="textfield" value="-"';
                            html += '       class="shop_add" readonly="ture" onfocus="this.blur()"';
                            html += '       onclick="javascript:reduce(\'' + goods.id + '\');">';
                            html += '<input type="text" name="textfield2" id="nowGoodsNum_' + goods.id + '"';
                            html += '       class="shop_number" placeholder="1"';
                            html += '       onblur="change(\'' + goods.id + '\',\'' + goods.price + '\')"';
                            html += '       onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,\'\')}else{this.value=this.value.replace(/\\D/g,\'\')}"';
                            html += '       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,\'\')}else{this.value=this.value.replace(/\\D/g,\'\')}"';
                            html += '       value="';
                            if (goods.enableBatchPrice == '1') {
                                html += goods.startBatchNum;
                            } else {
                                html += goods.startNum;
                            }
                            html += '"';
                            html += '       onchange="change(\'' + goods.id + '\')" ;>';
                            html += '<input type="text" name="textfield3" id="textfield3" value="+"';
                            html += '       class="shop_add" readonly="ture" onfocus="this.blur()"';
                            html += '       onclick="javascript:add(\'' + goods.id + '\');">';
                        } else {
                            html += '<input type="text" name="textfield" id="textfield" value="-"';
                            html += '       class="shop_add" readonly="ture" onfocus="this.blur()">';
                            html += '<input type="text" name="textfield2" id="nowGoodsNum_' + goods.id + '"';
                            html += '       class="shop_number" placeholder="1" readonly="ture"';
                            html += '       value="0" onfocus="this.blur()">';
                            html += '<input type="text" name="textfield3" id="textfield3" value="+"';
                            html += '       class="shop_add" readonly="ture" onfocus="this.blur()">';
                        }
                        html += '</td>';

                        html += '<td width="70" class="shop_grey">';
                        if (goods.stock <= 0) {
                            html += '0';
                        } else {
                            html += goods.stock;
                        }
                        html += '</td>';

                        html += '</tr>';
                    });


                    //判断是否加载完
                    if( parseInt(data.pager.pageNumber) == parseInt(data.pager.pageCount)) {
                        flag = false;
                        html += '<tr class="shopping_list"><td colspan="9" align="center">没有了...</td></tr>';
                    }
                    $("#goodsDataTable").append(html);
                }

                //重新绑定复选框
                reBindCheckBox();
                //释放动态加载
                isLoad = true;
            }
        });
    }
}

/**
 * 重新绑定复选框
 * TianYu
 * 2016-2-18 15:33:37
 */
function reBindCheckBox(){
    var $allcheck1 = $("#allcheck");// 全选复选框
    var $cartIds = $("#product-list input[name='cartId']");// ID复选框
    // 全选
    $allcheck1.unbind("click");
    $allcheck1.click( function() {
        var $this = $(this);
        $cartIds.prop("checked", $this.prop("checked"));
    });
}