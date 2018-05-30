var totalheight = 0;     //定义一个总的高度变量
var flag = true;//数据是否加载完了 true 未完  false  完了
var isLoad = true;//是否加载中， true 未加载  false  正在加载中
$(window).scroll( function() {
    totalheight = parseFloat($(window).height()) + parseFloat($(window).scrollTop())+500;     //浏览器的高度加上滚动条的高度,减去底部高度

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
            pageNumber:pageNum,
            orderBy:$("#cur_orderBy").val(),
            order:$("#cur_orderType").val()
        };
        var loadindex = layer.load();


        $.ajax({
            type: "post",
            url: $("#basePath").val() + "/search/getSearchResult/" + encodeURI(encodeURI($.trim($("#keyword_input").val()).replace(/\//g, '址达司杠').replace(/\./g, '址达司点号'))),
            data: data,
            success: function(data) {

                if (data.status == 'success') {
                        $("#cur_pageNumber").val(data.pager.pageNumber);
                        $("#cur_pageCount").val(data.pager.pageCount)
                        $("#checkall").prop("checked",false);
                        $("#show").show();
                        $("#shopping_total").parent("div").delay(300).fadeIn();
                        $("#totalResult").text(data.totalResult);
                        var html = '';
                        if(data.totalResult>0) {
                            $.each(data.list, function (goods_index, goods) {
                                if((goods_index+1)%5==0){
                                    html +=  '<li class="lase">';
                                }else{
                                    html +=  '<li>';
                                }
                                html+='<div class="pro_info"><div class="showbox">';
                                html += '<a target="_blank" href="'+ $("#basePath").val() +'/item/'+goods.id+'.html">';
                                html += '<img src="';
                                if( typeof(goods.pic) != 'undefined' && goods.pic != '' ){
                                    html += goods.pic  +'@210w_210h.png';
                                }
                                html += '" width="210" height="210" alt="'+goods.name+'" title="'+goods.name+'">';
                                html += '</a>';
                                if(priceHide == "hide"){
                                    html += ' <div class="subtitle" style="display: none;"> ';
                                }else{
                                    html += ' <div class="subtitle"> ';
                                }
                                html+=' <div class="f-fl"> <a onclick="judgeAuth(\''+$("#basePath").val()+'\',\'addCarts\',addCart.bind({},\'' + goods.id + '\',1))" class="car">加入购物车</a> </div>';
                                html+='<div class="f-fr"> <a onclick="judgeAuth(\''+$("#basePath").val()+'\',\'addAttention\',addGoodsAttention.bind({},\'' + goods.id + '\',this));" class="gz_on">关注</a> </div>';
                                html+='</div></div>';
                                html+='<p class="pro_price">';
                                if(priceHide == "hide"){
                                    html += '<span>会员可见!</span>';
                                }else{
                                    html += '<i>商城价：</i>';
                                    if (goods.enableBatchPrice == '1') {
                                        html +='￥'+goods.batchPrice;
                                    } else {
                                        html += '￥'+goods.price.toFixed(2);
                                    }
                                }
                                html+='</p">';
                                html+='<p class="pro_price red">';
                                if(priceHide == "hide"){
                                    html += '<span>会员可见!</span>';
                                }else{
                                    html += '<i>会员价：</i>';
                                    html +="￥"+(goods.price*(1 - goods.defaultPrice/100)).toFixed(2);
                                }
                                html+='</p">';
                                html+='<p class="pro_tit"><a target="_blank" href="" title='+goods.name+'>'+goods.name+'</a></p>';
                                html+='<p class="pro_tit">条码：'+goods.barcode+'</p>';
                                if(goods.sales==null||goods.sales<=0){
                                    html+='<p class="pro_sp_info"><span>月成交<i>0';
                                }else{
                                    html+='<p class="pro_sp_info"><span>月成交<i>'+transformNumber(goods.sales);
                                }

                                html+='笔</i></span>';
                                html+= '<span class="lase">评价数<i>'+goods.becScoreCount+'条</i></span>'
                                html+= '</p></div>';
                                if(goods.hasRebate=='no'){
                                    html+='<div class="fanli_2" style="display:none;">返利</div>';
                                }else{
                                    html+='<div class="fanli_2">返利</div>';
                                }
                                html += '</li>';
                                });
                        }else{
                            html="<li>未搜索到相关商品，请换个关键字试试！</li>";
                        }
                        //changeShoppingCartTotal();
                        //判断是否加载完
                        if( parseInt(data.pager.pageNumber) >= parseInt(data.pager.pageCount)) {
                            flag = false;
                            $("#tip_notice").text('没有了...');
                        }
                        $("#goodsDataTable").append(html);
                        $(".showbox").each(function(){
                            var self = $(this), delay;
                            self.mouseover(function(){
                                delay = setTimeout(function(){ delay = null; self.find(".subtitle").stop().animate({"bottom":0}, 300);},300);
                            }).mouseout(function(){
                                if(delay){
                                    clearTimeout(delay);
                                }else{
                                    setTimeout(function(){self.find(".subtitle").stop().animate({"bottom":-40}, 300);},300);
                                }
                            });
                        });

                }
                //释放动态加载
                isLoad = true;
                layer.close(loadindex);
            }
        });
    }
}
function transformNumber(number){
    if(number>10000){
        return (number/10000).toFixed(2)+"万";
    }else{
        return number;
    }
}
