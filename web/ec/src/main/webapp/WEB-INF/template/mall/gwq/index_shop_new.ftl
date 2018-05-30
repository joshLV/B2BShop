<#escape x as x?html>
<style>
    .showattention {
        padding-top: 6px !important;
        padding-bottom: 7px !important;
        padding-left: 27px !important;
        background: url(/ec/static/mall/gwq/img/search.ele.png) no-repeat 10px -430px !important;
    }
    /*Desc:设置会员身份证号弹出框样式 Auth:zhangqiang Time:2015-01-30  Start*/
    .popGeneral_address .aptab_center_address label {width: 80px;display: inline-block;}
    .popGeneral_address .aptab_center_address .newaddress{margin-top: 20px; margin-left: 20px;}
    .popGeneral_address .aptab_center_address .newaddress li {margin-bottom: 10px;}
    .popGeneral_address .aptab_center_address .newaddress li input {height: 27px;line-height: 27px;padding-left: 5px;vertical-align: middle;border: 1px solid #e6e6e6;}
    .popGeneral_address .aptab_center_address .btn_save { width:116px; height:auto;  line-height:34px; margin: 10px 5px 0 85px; text-align: center; background: #db0000; border: none !important; color: #FFFFFF; border-radius: 3px;}
    .ms-tg{ width: 1200px; margin:0 auto; overflow: hidden;}
    .ms-tg li{ width:592px; height: 185px; float: left; margin-right: 16px;}
    .ms-tg li img{width:592px; height: 185px; float: left;}
    .ms-tg li:last-child{ margin-right: 0;}
    .check_error{color: #DB0000; margin-left: 10px;}
    /*Desc:设置会员身份证号弹出框样式 Auth:zhangqiang Time:2015-01-30  End*/
</style>
<ul class="ms-tg">
    <li><a href="${base}/promotions/ms.html" target="_blank"><img src="<#if msImge??>${msImge}<#else>${base}/static/mall/gwq/img/ms.jpg</#if>"></a></li>
    <li><a href="${base}/promotions/tg.html" target="_blank"><img src="<#if tgImge??>${tgImge}<#else>${base}/static/mall/gwq/img/tg.jpg</#if>"></a></li>
</ul>
<div class="goodsads">
    <div class="tagad">
        <div class="lt-line"></div>
        <div class="rb-line"></div>
        <div class="tabindex">
                <div class="tabs selected">
                    <a href="#tab0" onclick="return false;">
                        <div>
                            <span>今日特价</span>
                        </div>
                    </a>
                </div>
                <div class="dots">
                    <div class="dot"></div>
                </div>
            <div class="tabs">
                <a href="#tab1" onclick="return false;">
                    <div>
                        <span>热门商品</span>
                    </div>
                </a>
            </div>
            <div class="dots">
                <div class="dot"></div>
            </div>
            <div class="tabs">
                <a href="#tab2" onclick="return false;">
                    <div>
                        <span>爆款商品</span>
                    </div>
                </a>
            </div>
            <div class="dots">
                <div class="dot"></div>
            </div>
            <div class="tabs">
                <a href="#tab3" onclick="return false;">
                    <div>
                        <span>人气商品</span>
                    </div>
                </a>
            </div>
        </div>
        <div class="tabcon" id="tag_div">
            <div class="f-dn picbox" id="tab0" style="display: block; overflow: hidden; position: relative;width: 1198px;height: 280px;">
                <input type="hidden" id="specialoffer_pn" value="1">
                <input type="hidden" id="specialoffer_pc" value="1">
                <ul class="piclist mainlist" id="specialoffer_ul">

                </ul>
                <ul class="piclist swaplist"></ul>
                <div class="og_prev" onclick="ajaxGetIndexGoodsByTag('specialoffer', -1)"></div>
                <div class="og_next" onclick="ajaxGetIndexGoodsByTag('specialoffer', 1)"></div>
            </div>
            <div class="f-dn picbox" id="tab1" style="display: block; overflow: hidden; position: relative;width: 1198px;height: 280px;">
                <input type="hidden" id="hot_pn" value="1">
                <input type="hidden" id="hot_pc" value="1">
                <ul class="piclist mainlist" id="hot_ul">

                </ul>
                <ul class="piclist swaplist"></ul>
                <div class="og_prev" onclick="ajaxGetIndexGoodsByTag('hot', -1)"></div>
                <div class="og_next" onclick="ajaxGetIndexGoodsByTag('hot', 1)"></div>
            </div>
            <div class="f-dn picbox" id="tab2" style="display: block; overflow: hidden; position: relative;width: 1198px;height: 280px;">
                <input type="hidden" id="explosion_pn" value="1">
                <input type="hidden" id="explosion_pc" value="1">
                <ul class="piclist mainlist" id="explosion_ul">

                </ul>
                <ul class="piclist swaplist"></ul>
                <div class="og_prev" onclick="ajaxGetIndexGoodsByTag('explosion', -1)"></div>
                <div class="og_next" onclick="ajaxGetIndexGoodsByTag('explosion', 1)"></div>
            </div>
            <div class="f-dn picbox" id="tab3" style="display: block; overflow: hidden; position: relative;width: 1198px;height: 280px;">
                <input type="hidden" id="pop_pn" value="1">
                <input type="hidden" id="pop_pc" value="1">
                <ul class="piclist mainlist" id="pop_ul">

                </ul>
                <ul class="piclist swaplist"></ul>
                <div class="og_prev" onclick="ajaxGetIndexGoodsByTag('pop', -1)"></div>
                <div class="og_next" onclick="ajaxGetIndexGoodsByTag('pop', 1)"></div>
            </div>
        </div>
    </div>
    <div class="sjmp">
        <div class="title"><img src="${base}/static/mall/gwq/img/dot2.gif" width="4" height="5">世界名品<span class="en">WORLD FAMOUS</span><img src="${base}/static/mall/gwq/img/dot2.gif" width="4" height="5"></div>
        <div class="content f-cb">
            <div class="f-fl left"><a href="${base}/brandFlagshipStore.html"><img src="${base}/static/mall/gwq/img/sjmp-l.jpg" width="190" height="244"></a></div>
            <div class="f-fr right">
                <ul class="f-cb">
                    <#list indexShopList as indexShop>
                        <li><a href="javascript:void(0)" onclick="s('${indexShop.name}','');return false;"><img src="${indexShop.pic}@156w_68h.png" alt="${indexShop.name}" width="156" height="68"></a></li>
                        <#if indexShop_index==17><#break></#if>
                    </#list>
                </ul>
            </div>
        </div>
    </div>
</div>
</#escape>




<script type="text/javascript">
    $(function(){
        ajaxGetIndexGoodsByTag('specialoffer',0)
        ajaxGetIndexGoodsByTag('hot',0)
        ajaxGetIndexGoodsByTag('explosion',0)
        ajaxGetIndexGoodsByTag('pop',0)
    });

    /**
     *
     * @param tag 标签标识
     * @param addOrSub
     */
    function ajaxGetIndexGoodsByTag(tag, addOrSub){
        var pageNum = parseInt($("#"+tag+ '_pn').val()) + parseInt(addOrSub);
        var pageCount = parseInt($("#"+tag+ '_pc').val());
        if( pageNum < 1 ){
            pageNum = pageCount;
        }
        if( pageNum > pageCount ){
            pageNum = 1;
        }
        $.ajax({
            type: "post",
            url: "${base}/ajaxGetIndexGoodsByTag",
            data: {tag:tag, pageNumber: pageNum, pageSize: 6},
            success: function(data) {
                if (data.status == 'success') {
                    $("#"+tag+ '_pn').val(data.pageNumber);
                    $("#"+tag+ '_pc').val(data.pageCount);

                    var html = '';
                    $.each(data.list,function(k,v){
                        html += '<li class="goodlist">';
                        html += '<div class="goodlist_img">';
                        html += '<a href="${base}/item/'+ v.id+'.html" target="_blank"><img alt="'+v.fullName+'" src="'+ v.pic+'@196w_130h.png" width="196" height="130" class="goods-img"></a>';
                        html += '<div class="subtitle">';
                        html += '<div class="f-fl">';
                        if( '${priceHide}' == 'hide' ){
                            html += '<a onclick="forward();" href="javascript:void(0);"  class="btn-buy"><i></i>加入购物车</a>';
                        }else{
                            if( v.crossBorder == '1' ){
                                html += '<a onclick="addCart(\''+ v.id+'\',\'1\',\'1\');" href="javascript:void(0);" class="car">加入购入车</a>';
                            }else{
                                html += ' <a onclick="addCart(\''+ v.id+'\',\'1\',\'0\');" href="javascript:void(0);" class="car">加入购入车</a>';
                            }
                        }
                        html += '</div>';
                        html += '<div class="f-fr"> <a onclick="addGoodsAttention(\''+ v.id+'\',this);" href="javascript:void(0);" class="gz">关注</a> </div>';
                        html += '</div>';
                        html += '</div>';
                        html += '<span class="goodsname">';
                        html += '<a href="${base}/item/'+ v.id+'.html" target="_blank" title="'+ v.fullName+'">'+v.name+'</a>';
                        html += '</span>';
                        html += '<span class="goodsprice">'+v.price.formatMoney(2,"￥")+'</span>';
                        html += '<p class="pro_sp_info"> <span>成交<i>'+v.sales+'</i>笔</span> <span class="lase">评价数<i>'+v.scoreCount+'</i>条</span> </p>';
                        html += '</li>';
                    });

                    $("#" + tag + '_ul').html(html);
                    cartStyleAdd();
                }
            }
        });
    }
</script>
<!--鼠标放上出现购物车效果-->
<script type="text/javascript">
    function cartStyleAdd(){
        $(".goodlist_img").each(function(){
            var self = $(this), delay;
            self.unbind("mouseover");
            self.unbind("mouseover");

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


</script>