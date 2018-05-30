
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
 * Ajax获取采购单商品,并组装到HTML中(平台商品)
 * zhangqiang
 * 2016-03-01 15:01:37
 */
function loadGoods(){
    //判断是否加载完
    if( flag && parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val())) {
        flag = false;
        $("#title_reminder").hide();
        //$("#goodsDataTable").append('<tr class="shopping_list" style="background: #f3f3f3;"><td colspan="9" align="center" style="color: #ff0000;">没有了...</td></tr>');
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
                othserId:$("#otherPurchaseId_ss").val(),
                purchaseId:$("#purchaseId_ss").val(),
                platform:0,
                pageNumber:pageNum
            },
            success: function(data) {
                if (data.status == 'success') {
                    $("#allcheckTop,#allCheckDown").prop("checked",false);
                    $("#cur_pageNumber").val( data.pager.pageNumber );//重置当前页页码
                    var html = '';
                    $.each(data.goodslist, function (goods_index, goods) {
                        html += '<tr>';

                        if(goods.batchPrice != null && goods.batchPrice != "0.00"){
                            html += '<input type="hidden" name="" value="'+goods.maxBatchPrice+'" id="defStartBatchPrice_'+goods.id + '_' + goods.categoryId+'" />';
                            html += '<input type="hidden" name="goodsNumId" value="'+goods.startBatchNum+'" id="defStartBatchNum_'+goods.id + '_' + goods.categoryId+'" />';
                        }else{
                            html += '<input type="hidden" name="" value="'+goods.price+'" id="defStartBatchPrice_'+goods.id + '_' + goods.categoryId+'" />';
                            html += '<input type="hidden" name="goodsNumId" value="'+goods.startBatchNum+'" id="defStartBatchNum_'+goods.id + '_' + goods.categoryId+'" />';
                        }

                        html +=   '<td width="75">';
                        html +=   '  <input type="hidden" name="goodsPackageModulus" value="'+goods.packageModulus+'" id="defPackageModulus_'+goods.id+ '_' + goods.categoryId+'" />';
                        html +=   '  <input type="hidden" name="purchaseOrderDetailIds" value="'+goods.categoryId+'" id="purchaseOrderDetailIds_'+goods.id+ '_' + goods.categoryId+'" />';
                        html +=   '  <input type="hidden" name="goodsLimitNum" value="'+goods.limitNum+'" id="defLimitNum_'+goods.id+ '_' + goods.categoryId+'" />';
                        html +=   '  <input type="checkbox" id="checkbox_'+goods.id+'" value="'+goods.id+'" pdId="' + goods.categoryId+'" ';
                                     if(goods.stock<=0){
                                        html +=' disabled="true" ';
                                     }else{
                                        html +=' class="col_checkbox" name="cartId" onclick="ifAllCheck();" shopid="'+goods.merchantId+'" ';
                                     }
                        html +=      '/>';
                        html +=   '</td>';

                        html +=   '<td width="250">';
                                   if(goods.hasRebate == 'yes'){
                        html +=      '<a class="has_rebate_ico" title="返利商品" href="javascript:void(0)"></a>';
                                   }
                        html +=      '<a href="'+$("#basePath").val()+'/item/'+goods.id+'.html" target="_blank">'+goods.name+'</a>';
                        html +=   '</td>';

                        /*html +=   '<td width="130">';
                        html +=      goods.shopName;
                        html +=   '</td>';

                        html +=   '<td width="130">';
                        html +=      goods.shortName;
                        html +=   '</td>';*/

                        html +=   '<td width="200">';
                            if (typeof(data.goodsSpList)  != "undefined" && data.goodsSpList != null ) {
                                $.each(data.goodsSpList, function (key, value) {
                                    if(goods.id == key){
                                        $.each(value.goodsSpList, function (sp_index, sp) {
                                            html += sp.name + ':';
                                            html += '<select name="goodsSp_' + goods.id+ '_' + goods.categoryId + '" spid="' + sp.id + '" spname="' + sp.name + '">';
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
                        html +=   '</td>';

                        /*html +=   '<td width="130">';
                                  if(goods.batchPrice != null && goods.batchPrice != "0.00~0.00"){
                        html +=     '<input type="hidden" value="1" name="name" id="ifBatchPriceId_'+goods.id+'" />￥'+goods.batchPrice+'0';

                                  }else{
                        html +=     '<input type="hidden" value="0" name="name" id="ifBatchPriceId_'+goods.id+'" />￥'+goods.price+'0';
                                  }
                        html +=   '</td>';*/

                        html += '<td width="100">';
                        html += '￥<input type="text" class="input_price" value="'+goods.inputPrice.toFixed(2)+'" name="input_price" id="inputPrice_'+goods.id+ '_' + goods.categoryId+'"';
                        html += '        onblur="changeInputPrice(\''+goods.id+'\',\''+goods.categoryId+'\')"';
                        html += '        onkeyup="this.value = floatFormat( this.value, 2 );"';
                        html += '        onafterpaste="this.value = floatFormat(this.value, 2  );" />';
                        html += '<input type="hidden" id="oldTotal_'+goods.id+ '_' + goods.categoryId+'" value="'+(goods.inputPrice*goods.hits)+'">';
                        html += '</td>';

                        var price = 0;

                        html +=   '<td width="100">';
                                        if(goods.enableBatchPrice == "1") {
                        html +=     '<input type="hidden" value="1" name="name" id="ifBatchPriceId_'+goods.id+ '_' + goods.categoryId+'" />';
                        html +=     '<input type="hidden" value="' + goods.keywords + '" name="price" id="price_'+goods.id+ '_' + goods.categoryId+'" />';
                        html +=      '<span id="'+goods.id+ '_' + goods.categoryId+'_nowPrice">';
                                            html += '￥' + goods.keywords + '0';
                                            price = parseFloat(goods.keywords);
                        html +=      '</span>';
                                        }else{
                        html +=     '<input type="hidden" value="0" name="name" id="ifBatchPriceId_'+goods.id+ '_' + goods.categoryId+'" />';
                        html +=     '<input type="hidden" value="' + goods.price + '" name="price" id="price_'+goods.id+ '_' + goods.categoryId+'" />';
                        html +=      '<span id="'+goods.id+ '_' + goods.categoryId+'_nowPrice">';
                        html +=             '￥'+goods.price.toFixed(2);
                                            price = goods.price.toFixed(2)
                        html +=       '</span>';
                                        }
                        html +=   '<input type="hidden" id="ptTotal_'+goods.id+ '_' + goods.categoryId+'" value="'+(price*goods.hits)+'">';
                        html +=   '</td>';

                        html += '<td><span id="priceCha_'+goods.id+'">';
                        html +=     (goods.inputPrice.toFixed(2) - price).toFixed(2);
                        html += '</span></td>';


                        html +=   '<td width="155" class="shop_grey">';
                                   if(goods.stock > 0){
                           html +=      '<input type="text" name="textfield" id="textfield" value="-" class="shop_add" readonly="ture" onfocus="this.blur()" onclick="javascript:reduce(\''+goods.id+'\',\''+goods.categoryId+'\');">&nbsp;';
                           html +=      '<input type="text" name="textfield2" id="nowGoodsNum_'+goods.id+ '_' + goods.categoryId+'" class="shop_number" placeholder="1" onblur="change(\''+goods.id+'\',\''+goods.categoryId+'\')" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,\'\')}else{this.value=this.value.replace(/\D/g,\'\')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,\'\')}else{this.value=this.value.replace(/\D/g,\'\')}" value="'+goods.hits+'" onchange="change(\''+goods.id+'\')"/>&nbsp;';
                           html +=      '<input type="text" name="textfield3" id="textfield3" value="+" class="shop_add" readonly="ture" onfocus="this.blur()" onclick="javascript:add(\''+goods.id+'\',\''+goods.categoryId+'\');">';
                                   }else{
                           html +=      '<input type="text" name="textfield" id="textfield" value="-" class="shop_add" readonly="ture" onfocus="this.blur()">&nbsp;';
                           html +=      '<input type="text" name="textfield2" id="nowGoodsNum_'+goods.id+ '_' + goods.categoryId+'" class="shop_number" placeholder="1" readonly="ture" value="0" onfocus="this.blur()">&nbsp;';
                           html +=      '<input type="text" name="textfield3" id="textfield3" value="+" class="shop_add" readonly="ture" onfocus="this.blur()">';
                                   }
                           html +=      '<br>';
                           html +=      '<span class="package_desc_span" style="padding-left: 20px;height: 20px;line-height: 20px;vertical-align: bottom;">';
                           html +=         goods.packageModulus;
                               if(goods.packageUnit != null && goods.packageUnit != ''){
                           html +=        goods.packageUnit;
                               }else{
                           html +=        '个/';
                               }
                               if(goods.unit != null && goods.unit != ''){
                           html +=        goods.unit;
                               }else{
                           html +=        '件';
                               }

                           html +=      '</span>';

                        html +=   '</td>';

                        /*html +=   '<td width="70" class="shop_grey">';
                               if(goods.stock<=0){
                        html +=           0;
                               }else{
                        html +=           goods.stock;
                               }
                        html +=   '</td>';*/

                        html +=   '<td width="70" class="shop_grey">';
                        if(goods.enableBatchPrice == "1") {
                            var chae = ((goods.inputPrice - parseFloat(goods.keywords)) * goods.hits);
                            html +=  chae.toFixed(2);
                            html += '<input type="hidden" name="chae_input" id="chae_'+goods.id+ '_' + goods.categoryId+'" value="'+chae.toFixed(2)+'">';
                        }else{
                            var chae = ((goods.inputPrice - goods.price) * goods.hits);
                            html +=  chae.toFixed(2);
                            html += '<input type="hidden" name="chae_input" id="chae_'+goods.id+ '_' + goods.categoryId+'" value="'+chae.toFixed(2)+'">';
                        }

                        html +=   '</td>';

                        html += '</tr>';
                    });


                    //判断是否加载完
                    if( parseInt(data.pager.pageNumber) == parseInt(data.pager.pageCount)) {
                        flag = false;
                        $("#title_reminder").hide();
                        //html += '<tr class="shopping_list" style="background: #f3f3f3;"><td colspan="9" align="center" style="color: #ff0000;">没有了...</td></tr>';
                        $("#tip_notice").html("没有了...");
                    }
                    $("#goodsDataTable").append(html);
                    calcChaETotal();
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
    //var $checkall = $("#checkall");
    var $allcheck1 = $("#allcheck");// 全选复选框
    var $cartIds = $("#cartListForm input[name='cartId']");// ID复选框
    // 全选
    $allcheck1.on('click',function() {
        $cartIds.prop("checked", $(this).prop("checked"));
        //$checkall.prop("checked", $(this).prop("checked"));
    });
    //$checkall.on('click',function(){
    //    $cartIds.prop("checked", $(this).prop("checked"));
    //    $allcheck1.prop("checked", $(this).prop("checked"));
    //});
}