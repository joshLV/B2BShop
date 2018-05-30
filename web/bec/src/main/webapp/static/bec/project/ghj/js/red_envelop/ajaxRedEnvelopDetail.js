
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
        $("#redEnvelopDetailDataTable").append('<tr class="shopping_list" style="background: #f3f3f3;"><td colspan="5" align="center" style="color: #ff0000;">没有了...</td></tr>');
    }

    if( !flag ){//加载完了，不需要再加载
        return;
    }else{
        if( !isLoad ){//如果正在加载中，不执行
            return;
        }
        isLoad = false;
        var pageNum = parseInt($("#cur_pageNumber").val()) + 1;
        var redEnvelopTypeId = $("#redEnvelopTypeId").val();
        var redEnvelopAccessTypeId = $("#redEnvelopAccessTypeId").val();

        if(redEnvelopTypeId == '请选择红包类型'){
            redEnvelopTypeId = '';
        }

        if(redEnvelopAccessTypeId == '请选择使用方式'){
            redEnvelopAccessTypeId = '';
        }
        $.ajax({
            type: "post",
            url: $("#basePath").val() + "/vmredenvelopaccount/ajaxRedenvelopRecordDetailData",
            data: {
                groupId:$("#groupHiddenId").val(),
                startDate:$("#startDate").val(),
                endDate:$("#endDate").val(),
                redEnvelopType:redEnvelopTypeId,
                redEnvelopAccessType:redEnvelopAccessTypeId,
                pageNumber:pageNum
            },
            success: function(data) {
                $("#cur_pageNumber").val(data.pageNumber);
                if (data.status == 'success') {
                    var html = '';
                    $.each(data.goodslist, function (goods_index, goods) {
                        html += '<tr>';

                        html +=   '<td width="50">';
                                    if(goods.redEnvelopType == 'rebate'){
                                        html += '返利红包';
                                    }else{
                                        html += '活动红包';
                                    }
                        html +=   '</td>';

                        html +=   '<td width="50">';
                                    if(goods.accessType == '1'){
                                        html += '支付';
                                    }else{
                                        html += '领取';
                                    }
                        html +=   '</td>';

                        html +=   '<td width="100" style="color: #ff0000;">';
                        html +=     priceChangeFormat(goods.amount);
                        html +=   '</td>';

                        html +=   '<td width="100" class="redEnvelop_a">';
                                    if(!isEmpty(goods.orderId)){
                                        html += '<a target="_blank" href="'+$("#basePath").val()+'/order/view/'+goods.orderId+'.html">'+goods.orderSn+'</a>';
                                    }else{
                                        html += goods.orderSn;
                                    }
                        html +=   '</td>';

                        html +=   '<td width="100">';
                        html +=     new Date(goods.createTime).Format("yyyy-MM-dd hh:mm");
                        html +=   '</td>';

                        html += '</tr>';
                    });


                    //判断是否加载完
                    if( parseInt(data.pager.pageNumber) == parseInt(data.pager.pageCount)) {
                        flag = false;
                        $("#title_reminder").hide();
                        html += '<tr class="shopping_list" style="background: #f3f3f3;"><td colspan="5" align="center" style="color: #ff0000;">没有了...</td></tr>';
                    }
                    $("#redEnvelopDetailDataTable").append(html);
                }

                //释放动态加载
                isLoad = true;
            }
        });
    }
}