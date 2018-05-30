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

$(function(){

    if( flag  && (parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val()) || parseInt($("#cur_pageNumber").val()) > parseInt($("#cur_pageCount").val()))) {
        flag = false;
        //$("#goodsDataTable").append('<tr class="shopping_list"><td colspan="9" align="center">没有了...</td></tr>');
        //$("#notices").hide();
    }
});

/**
 * Ajax查询商品，并组装到页面
 * TianYu
 * 2016-2-18 15:34:13
 */
function loadGoods(){
    //判断是否加载完
    if( flag  && (parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val()) || parseInt($("#cur_pageNumber").val()) > parseInt($("#cur_pageCount").val()))) {
        flag = false;
        $("#goodsDataTable").append('<tr class="shopping_list"><td colspan="9" align="center">没有了...</td></tr>');
        $("#notices").hide();
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
        var data={
            cat:$("#catelogPath").val(),
            price: $("#priceFlag").val(),
            brand:$("#brandFlag").val(),
            goodsShortName:$("#goodsShortName").val(),
            shopName:$("#shopName").val(),
            pageNumber:pageNum,
            pageSize:$("#cur_pageSize").val(),
            orderBy:$("#cur_orderBy").val(),
            orderType:$("#cur_orderType").val()
        };

        $.ajax({
            type: "post",
            url: $("#basePath").val() + '/list/getGoodsList',
            data: data,
            success: function(data) {

                if (data.status == 'success') {

                    if( data.priceHide == 'hide' ){
                        layer.close(loadindex);
                        isLoad = true;
                        $("#cartLogin").trigger("click");
                        return;
                    }else {

                        $("#checkall").prop("checked",false);
                        $("#cur_pageNumber").val( data.pager.pageNumber );//重置当前页页码
                        var html = '';
                        $.each(data.pager.list, function (goods_index, goods) {
                            html += '<li>';
                            html += '<div class="pro_pf_info">';
                            if (goods.enableBatchPrice == '1') {
                                html += '<input type="hidden" name="" value="' + goods.batchPrice + '" id="defStartBatchPrice_' + goods.id + '" />';
                                html += '<input type="hidden" name="goodsNumId" value="' + goods.startBatchNum + '" id="defStartBatchNum_' + goods.id + '" />';
                            } else {
                                html += '<input type="hidden" name="" value="' + goods.price + '" id="defStartBatchPrice_' + goods.id + '" />';
                                html += '<input type="hidden" name="goodsNumId" value="' + goods.startNum + '" id="defStartBatchNum_' + goods.id + '" />';
                            }

                            html += '<input type="hidden" name="goodsPackageModulus" value="' + (goods.packageModulus==0?1:goods.packageModulus) + '" id="defPackageModulus_' + goods.id + '" />';
                            html += '<input type="hidden" name="goodsLimitNum" value="' + goods.limitNum + '" id="defLimitNum_' + goods.id + '" />';


                            html += '<table border="0" cellspacing="0" cellpadding="0">';
                            html += '<tr height="50" class="pro_pf_tr">';
                            html += '<td width="76">&nbsp;</td>';
                            html += '<td width="400" class="textoverflow">';
                                html += '<a href="' + $("#basePath").val() + '/item/' + goods.id + '.html" target="_blank" title="'+goods.name+'">';
                                html += goods.name;
                                html += '</a>';
                            html += '</td>';

                            html += '<td width="200" style="text-align:center">商品规格</td>';
                            html += '<td width="115" style="text-align:center">会员价格</td>';
                            html += '<td width="140" style="text-align:center">当前价格</td>';
                            html += '<td width="155" style="text-align:center">数    量</td>';
                            html += '<td width="114" style="text-align:center">库    存</td>';

                            html += '</tr>';

                            html += '<tr class="pro_pf_tr2">';
                            html += '<td width="76" class="pro_checkbox">';
                            html += '<input type="checkbox" id="checkbox_' + goods.id + '" value="' + goods.id + '" ';
                            if (goods.stock <= 0) {
                                html += ' disabled="true" ';
                            } else {
                                html += ' name="cartId" shopid="' + goods.shopId + '" />';
                            }
                            html += '<label for="checkbox-1-1"></label>';
                            html += '</td>';

                            html += '<td width="400"><div class="pro_name">';
                            html += '<p><em>所属商家：</em><a href="javascript:void(0);" onclick="$(\'#shopName\').val(\''+goods.shopName+'\');searchGoodsInfo();" >' + goods.shopName + '</a></p>';
                            html += '<p class="textoverflow"><em>商品简称：</em><a href="javascript:void(0);" onclick="$(\'#goodsShortName\').val(\''+goods.shortName+'\');searchGoodsInfo();">' + goods.shortName + '</a></p>';
                            html += '<p><em>商品条码：</em>'+ goods.barcode + '</p>';
                            html += '</div></td>';

                            html += '<td width="180" class="pro_color" >';
                            if (typeof(data.goodsSpList)  != "undefined" && data.goodsSpList != null ) {
                                $.each(data.goodsSpList, function (key, value) {
                                    if(goods.id == key){
                                        $.each(value.goodsSpList, function (sp_index, sp) {
                                            html += '<div class="f-cb" style="width: 180px; height: 32px;"><em>'+sp.name + ':</em>';
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
                                            html += '</select></div>';
                                        });
                                    }
                                });
                            }
                            html += '</td>';

                            html += '<td width="115" class="pro_prices">';
                            html += '<input type="hidden" value="' + goods.enableBatchPrice + '" name="name" id="ifBatchPriceId_' + goods.id + '" />';
                            if (goods.enableBatchPrice == '1') {
                                html += '￥' + goods.batchPrice;
                            } else {
                                html += '￥' + parseFloat(goods.price).toFixed(2);
                            }
                            html += '</td>';

                            html += '<td width="140" class="pro_prices2" id="' + goods.id + '_nowPrice">';
                            if (goods.batchPrice != '' && goods.batchPrice != "0.00") {
                                html += '￥' + parseFloat(goods.maxBatchPrice).toFixed(2);
                            } else {
                                html += '￥' + parseFloat(goods.price).toFixed(2);
                            }
                            html += '</td>';

                            html += '<td width="155" class="pro_number">';
                            html += '<div style="margin: 0 auto; width: 86px; padding-bottom: 2px;">';
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
                            html += ' </div><div style="float: none; text-align: center; padding-top: 5px; ">';
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
                            html += '</div>';
                            html += '</td>';

                            html += '<td width="114" class="pro_kc">';
                            if (goods.stock <= 0) {
                                html += '0';
                            } else {
                                html += goods.stock;
                            }
                            if (typeof(goods.packageUnit) != 'undefined' && goods.packageUnit != '') {
                                html += goods.packageUnit;
                            } else {
                                html += '个';
                            }
                            html += '</td>';
                            html += '</tr>';
                            html += '</table>';
                            html += '</div>';

                            html += '<div class="fanli_2" ';
                            if (goods.hasRebate == 'no') {
                                html += ' style="display:none;" ';
                            }
                            html += '>返利</div>';
                            html += '</li>';
                        });


                        //判断是否加载完
                        if( parseInt(data.pager.pageNumber) >= parseInt(data.pager.pageCount)) {
                            flag = false;
                            $("#tip_notice").text('没有了...');
                        }
                        $("#goodsDataTable").append(html);
                    }
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

