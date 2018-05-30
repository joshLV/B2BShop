
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
 * Ajax获取操作员,并组装到HTML中
 * zhangqiang
 * 2016-03-08 15:01:37
 */
function loadGoods(){
    //判断是否加载完
    if( flag && parseInt($("#cur_pageNumber").val()) == parseInt($("#cur_pageCount").val())) {
        flag = false;
        $("#title_reminder").hide();
        $("#buyerOperatorDataTable").append('<tr class="shopping_list" style="background: #f3f3f3;"><td colspan="7" align="center" style="color: #ff0000;">没有了...</td></tr>');
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
            url: $("#basePath").val() + "/buerOperator/ajaxBuyerOperatorData",
            data: {
                search_userName:$("#search_userName").val(),
                search_realName:$("#search_realName").val(),
                pageNumber:pageNum
            },
            success: function(data) {
                $("#cur_pageNumber").val(data.pageNumber);
                if (data.status == 'success') {

                    var html = '';
                    $.each(data.goodslist, function (goods_index, goods) {
                        html += '<tr>';

                        html +=   '<td width="80">';
                        html +=     goods.userName;
                        html +=   '</td>';

                        html +=   '<td width="80">';
                        html +=     goods.realName;
                        html +=   '</td>';

                        html +=   '<td width="120">';
                        html +=     goods.email;
                        html +=   '</td>';

                        html +=   '<td width="50">';
                                   if(goods.isvalid == '1'){
                        html +=       '启用';
                                   }else{
                        html +=       '未启用';
                                   }
                        html +=   '</td>';

                        html +=   '<td width="170">';
                        html +=     goods.roleNameChn;
                        html +=   '</td>';

                        html +=   '<td width="100">';
                        html +=     goods.changeTime;
                        html +=   '</td>';

                        html +=   '<td width="100">';
                        html +=     '<input class="btn-5ss" type="button" value="编辑" onclick="updateBuyerOperator(\''+goods.id+'\');">&nbsp;&nbsp;';

                                    if(goods.isvalid != '1'){

                        html +=       '<input class="btn-5ssr" type="button" value="删除" onclick="deleteBuyerOperator(\''+goods.id+'\',\''+goods.isvalid+'\');">';
                                    }
                        html +=   '</td>';

                        html += '</tr>';
                    });


                    //判断是否加载完
                    if( parseInt(data.pager.pageNumber) == parseInt(data.pager.pageCount)) {
                        flag = false;
                        $("#title_reminder").hide();
                        html += '<tr class="shopping_list" style="background: #f3f3f3;"><td colspan="7" align="center" style="color: #ff0000;">没有了...</td></tr>';
                    }
                    $("#buyerOperatorDataTable").append(html);
                }

                //释放动态加载
                isLoad = true;
            }
        });
    }
}