<#escape x as x?html>
    <#include "bec/gwq/header.ftl"/>

<style type="text/css">
    .searchTip {
        border: 1px solid #f7eae7;
    }

    .searchTip .searchTipContent {
        padding-left: 30px;
    }

    .searchTip .searchTipContent h2 {
        color: #333;
        font-size: 14px;
        font-weight: 700;
        line-height: 38px;
    }
    .searchTip .searchTipContent h2 {
        line-height: 36px;
    }

    #searchTipSugg {
        list-style: outside none none;
    }
    #searchTipSugg li {
        width: auto;
        list-style: inside none decimal;
        margin-bottom: 5px;
    }
    .search_wangwang {
        float: right;
        border-left: 1px solid #e8e8e8;
        width: 100px;
        text-align: center;
        height: 28px;
        padding: 7px 0;
    }
</style>

<div id="container">
    <#include "bec/gwq/top.ftl"/>
    <div class="search_page">
        <div class="search_list">

            <div id="filter">
                <div class="cls"></div>
                <div class="fore1">
                    <dl class="order">
                        <dt>排序：</dt>
                        <dd <#if orderBy=="sales" && order=="desc">class="arrow_write_bottom" <#elseif orderBy=="sales" && order=="asc">class="curr" <#else>class="arrow"</#if>>
                            <#if orderBy=="sales" && order=="desc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','listStyle=${listStyle}&orderBy=sales&order=asc&pageNumber=${pageNumber}')">销量</a><b></b>
                            <#elseif orderBy=="sales" && order=="asc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','listStyle=${listStyle}&orderBy=sales&order=desc&pageNumber=${pageNumber}')">销量</a><b></b>
                            <#else>
                                <a href="javascript:void(0)"  onclick="s('${keyword}','listStyle=${listStyle}&orderBy=sales&order=asc&pageNumber=${pageNumber}')">销量</a><b></b>
                            </#if>
                        </dd>
                        <dd <#if orderBy=="price" && order=="desc">class="arrow_write_bottom" <#elseif orderBy=="price" && order=="asc">class="curr" <#else>class="arrow"</#if>>
                            <#if orderBy=="price" && order=="desc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','listStyle=${listStyle}&orderBy=price&order=asc&pageNumber=${pageNumber}')">价格</a><b></b>
                            <#elseif orderBy=="price" && order=="asc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','listStyle=${listStyle}&orderBy=price&order=desc&pageNumber=${pageNumber}')">价格</a><b></b>
                            <#else>
                                <a href="javascript:void(0)"  onclick="s('${keyword}','listStyle=${listStyle}&orderBy=price&order=asc&pageNumber=${pageNumber}')"">价格</a><b></b>
                            </#if>
                        </dd>
                        <dd <#if orderBy=="scoreCount" && order=="desc">class="arrow_write_bottom" <#elseif orderBy=="scoreCount" && order=="asc">class="curr" <#else>class="arrow"</#if>>
                            <#if orderBy=="scoreCount" && order=="desc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','listStyle=${listStyle}&orderBy=scoreCount&order=asc&pageNumber=${pageNumber}')">评论数</a><b></b>
                            <#elseif orderBy=="scoreCount" && order=="asc">
                                <a href="javascript:void(0)"  onclick="s('${keyword}','listStyle=${listStyle}&orderBy=scoreCount&order=desc&pageNumber=${pageNumber}')">评论数</a><b></b>
                            <#else>
                                <a href="javascript:void(0)"  onclick="s('${keyword}','listStyle=${listStyle}&orderBy=scoreCount&order=asc&pageNumber=${pageNumber}')">评论数</a><b></b>
                            </#if>
                        </dd>
                    </dl>
                    <#--<div style="float: left;">-->
                        <#--<input type="button" value="转换" class="change-button-search"-->
                               <#--onclick="s('${keyword}','pageNumber=${pageNumber}')"/>-->
                    <#--</div>-->
                    <div class="goods-search">
                        <dl>
                            <dd>
                                <em>商品简称</em>
                                <input type="text" class="goods-names" value="" name="search_shortName" id="search_shortName">
                            </dd>
                            <dd>
                                <em>商家名称</em>
                                <input type="text" class="goods-names" value="" name="search_shopName" id="search_shopName">
                                <input type="button" value="搜索" class="search-button" onclick="javascript:searchGoodsInfo();"/>
                            </dd>
                            <dd>
                                <input type="button" value="转为缩略图" class="change-button"
                                       onclick="s('${keyword}','pageNumber=${pageNumber}')"/>
                            </dd>
                        </dl>
                    </div>
                    <div class="total">
                        <span>共<strong><#if totalResult != '' && totalResult &gt; 0>${totalResult}<#else>0</#if></strong>个商品</span>
                    </div>
                    <span class="clr"></span>
                </div>
            </div>

            <div class="search_list">
                <div id="show">
                    <div class="categories_box1">
                        <input type="hidden" value="${isLogin}" id="isLogin">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="55">
                                    <input type="checkbox" id="allcheck" class="s_checkbox">全选
                                </td>
                                <td width="270">商品信息</td>
                                <td width="145">商品简称</td>
                                <td width="145">所属商家</td>
                                <td width="130">商品规格</td>
                                <td width="125">会员价</td>
                                <td width="100">当前价格</td>
                                <td width="105" style="text-align: center; padding-left: 0;">数量</td>
                                <td width="50">库存</td>
                            </tr>
                        </table>
                    </div>
                    <div class="categories_box2" id="product-list">
                        <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
                            <table border="0" cellpadding="0" cellspacing="0">
                                <#list list as goods>
                                    <tr class="shopping_list" id="product_${goods.id}">
                                        <#if goods.ypice != null && goods.ypice != "0.00">
                                            <input type="hidden" name="" value="${goods.ypice}" id="defStartBatchPrice_${goods.id}" />
                                        <#else >

                                            <input type="hidden" name="" value="${goods.price?string("currency")}" id="defStartBatchPrice_${goods.id}" />
                                        </#if>
                                        <td width="55">
                                            <input type="hidden" name="goodsNumId" value="${goods.total}" id="defStartBatchNum_${goods.id}" />
                                            <input type="checkbox" id="checkbox_${goods.id}" value="${goods.id}"  <#if goods.stock<=0> disabled="true" <#else> name="cartId" shopid="${goods.merchantId}" </#if>/>
                                        </td>
                                        <td width="270">
                                            <a href="${base}/item/${goods.id}.html" target="_blank">
                                                <#--<img src="${goods.image}@67w_66h.png" width="67" height="66" alt="${goods.name}" class="shop_imgs"/>-->
                                                <a href="${base}/item/${goods.id}.html" target="_blank">${goods.name}</a>

                                                <div id="sp_${goods.id}" style="color:#666; margin-top: 5px;">
                                                <#--${goods.specification}-->
                                                </div>
                                        </td>
                                        <td width="145">
                                              ${goods.shortName}
                                        </td>
                                        <td width="145">
                                              ${goods.shopName}
                                        </td>
                                        <td width="130">
                                            <#if goodsSpList??>
                                                <#list goodsSpList["${goods.id}"]["goodsSpList"] as sp>
                                                ${sp.name}:
                                                    <select name="goodsSp_${goods.id}" spid="${sp.id}" spname="${sp.name}">
                                                        <#list goodsSpList["${goods.id}"]["goodsSpItemList"] as item>
                                                            <#if item.specificationId == sp.id>
                                                                <option value="${sp.name}:${item.name}" <#if item_index==0>selected="selected"</#if>>${item.name}</option>
                                                            </#if>
                                                        </#list>
                                                    </select><br>
                                                </#list>
                                            </#if>
                                        </td>
                                        <td width="125">
                                            <#if goods.batchPrice != null && goods.batchPrice != "0.00~0.00">
                                                <input type="hidden" value="1" name="name" id="ifBatchPriceId_${goods.id}" />
                                                ￥${goods.batchPrice}
                                            <#else >
                                                <input type="hidden" value="0" name="name" id="ifBatchPriceId_${goods.id}" />
                                                ${goods.price?string("currency")}
                                            </#if>
                                        </td>
                                        <td width="100">
                                                    <span id="${goods.id}_nowPrice">
                                                        <#if goods.ypice != null && goods.ypice != "0.00">
                                                            ￥${goods.ypice}
                                                        <#else >
                                                        ${goods.price?string("currency")}
                                                        </#if>
                                                    </span>
                                        </td>
                                        <td width="105" class="shop_grey">
                                            <#if 0<goods.stock>
                                                <input type="text" name="textfield" id="textfield" value="-"
                                                       class="shop_add" readonly="ture" onfocus="this.blur()"
                                                       onclick="javascript:reduce('${goods.id}');">
                                                <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}"
                                                       class="shop_number" placeholder="1"
                                                       onblur="change('${goods.id}','${goods.price}')"
                                                       onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                       value="${goods.total}"
                                                       onchange="change('${goods.id}')" ;>
                                                <input type="text" name="textfield3" id="textfield3" value="+"
                                                       class="shop_add" readonly="ture" onfocus="this.blur()"
                                                       onclick="javascript:add('${goods.id}');">
                                            <#else>
                                                <input type="text" name="textfield" id="textfield" value="-"
                                                       class="shop_add" readonly="ture" onfocus="this.blur()">
                                                <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}"
                                                       class="shop_number" placeholder="1" readonly="ture"
                                                       value="0" onfocus="this.blur()">
                                                <input type="text" name="textfield3" id="textfield3" value="+"
                                                       class="shop_add" readonly="ture" onfocus="this.blur()">
                                            </#if>

                                        </td>
                                        <td width="50" class="shop_grey">
                                            <#if goods.stock<=0>
                                                0
                                            <#else>
                                            ${goods.stock}
                                            </#if>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </form>

                    </div>
                    <div class="categories_box3">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="shop_box3_left">
                                    <span id="showinfo" style="color: red;"></span>
                                </td>
                                <td class="shop_box3_right" colspan="2">
                                    <div style="float:right; padding: 10px 20px 0px 0px">
                                        <a href="#" class="shop_settlement" id="toSettlement">加入购物车</a>
                                        <a href="${base}/member/popuplogin"
                                           title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin"></a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="clearfix">
                <div class="pagin fr">
                    <#if (pager.list?size > 0)>
                        <#import "bec/gwq/pager.ftl" as p>
                        <@p.pager pager = pager baseUrl = "/search/s/${keyword}?listStyle=${listStyle}" />
                    <#else>
                        <div class="searchTip" style="min-height: 390px; padding-top: 12px;">
                            <div class="searchTipContent">
                                <h2>尚未发布任何信息!</h2>
                                <h3>建议您：</h3>
                                <ol id="searchTipSugg">
                                    <li>
                                        看看输入的文字是否有误
                                    </li>
                                    <li>
                                        调整关键词，如“全铜花洒套件”改成“花洒”或“花洒 套件”
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </#if>
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            var $allcheck1 = $("#allcheck");// 全选复选框
            var $cartIds = $("#product-list input[name='cartId']");// ID复选框
            // 全选
            $allcheck1.click( function() {
                var $this = $(this);
                $cartIds.prop("checked", $this.prop("checked"));

            });

            $("#toSettlement").on('click', goToGoodsCars);
        });

        function goToGoodsCars(){
            //判断是否存在选中的商品，如果无，不进入结算页面
            var selected = $("input[name='cartId']:checked");

            if(selected != 'undefined' && selected != null && selected.length != 0){
                try {
                    var goodsIds = '';
                    var i = 0;
                    $(selected).each(function(){
                        if(i > 0){
                            goodsIds += '--';
                        }
                        goodsIds += $(this).val();
                        goodsIds += "_"+$("#nowGoodsNum_"+$(this).val()).val();

                        //组装规格
                        if( $('select[name="goodsSp_'+ $(this).val() +'"]').length > 0 ){
                            var sp = '';
                            var j = 0;
                            $("select[name='goodsSp_"+ $(this).val() +"']").each(function(){
                                if(j > 0){
                                    sp += ","
                                }
                                sp += $(this).val();
                                j++;
                            });
                            goodsIds += '_' + sp;
                        }

                        i++;
                    });
                    window.location.href = "${base}/cart/addBatch?goodsIds=" + goodsIds + "&backurl=" + window.location.href

                }catch (e) {
                }
            }else{
                layer.alert("请至少选中一件商品!",{icon:7});
            }
        }

        /**
         * Desc:商品数量执行减去操作
         * @param goodsId
         * @param goodsPrice
         */
        function reduce(goodsId) {
            //默认起批数量
            var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
            //默认起批价格
            var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
            //当前商品数量
            var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
            //减1之后的商品数量
            var reduceGoodsNum = parseInt(nowGoodsNum) - 1;
            //是否有批发价 1:有 0:无
            var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

            if(ifBatchPrice == '1'){//有批发价时
                //判断减去之后的数量是否小于起批数量
                if(reduceGoodsNum <defStartBatchNum){
                    layer.alert("商品数量不能小于起批数量!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                    $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                    return;
                }else{
                    $.ajax({
                        type: "get",
                        url: "${base}/cart/ajaxGetGoodsBatchPrice",
                        data: "id="+goodsId+"&quantity="+reduceGoodsNum+"&r="+ new Date(),
                        success: function(data) {
                            if(data.status=='success'){
                                $("#nowGoodsNum_"+goodsId).val(reduceGoodsNum);
                                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                            }
                        }
                    });
                }
            }else{//无批发价时
                if(reduceGoodsNum <1){
                    layer.alert("商品数量不能小于1!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(1);
                    return;
                }else{
                    $("#nowGoodsNum_"+goodsId).val(parseInt(reduceGoodsNum));
                }
            }
        }

        /**
         * Desc:商品数量执行改变操作
         * @param goodsId
         * @param goodsPrice
         */
        function change(goodsId) {
            //默认起批数量
            var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
            //默认起批价格
            var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
            //当前商品数量
            var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
            //是否有批发价 1:有 0:无
            var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

            if(ifBatchPrice == '1'){//有批发价时
                //判断改变之后的数量是否小于起批数量
                if(parseInt(nowGoodsNum) <defStartBatchNum){
                    layer.alert("商品数量不能小于起批数量!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                    $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                    return;
                }else if(parseInt(nowGoodsNum) >100000){
                    layer.alert("商品数量不能大于于100000!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                    $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                    return;
                }else{
                    $.ajax({
                        type: "get",
                        url: "${base}/cart/ajaxGetGoodsBatchPrice",
                        data: "id="+goodsId+"&quantity="+parseInt(nowGoodsNum)+"&r="+ new Date(),
                        success: function(data) {
                            if(data.status=='success'){
                                $("#nowGoodsNum_"+goodsId).val(parseInt(nowGoodsNum));
                                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                            }
                        }
                    });
                }
            }else{//无批发价时
                if(parseInt(nowGoodsNum) <1){
                    layer.alert("商品数量不能小于1!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(1);
                    return;
                }else if(parseInt(nowGoodsNum) >100000){
                    layer.alert("商品数量不能大于100000!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(1);
                    return;
                }else{
                    $("#nowGoodsNum_"+goodsId).val(parseInt(nowGoodsNum));
                }
            }
        }

        function add(goodsId) {
            //默认起批数量
            var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
            //默认起批价格
            var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
            //当前商品数量
            var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
            //加1之后的商品数量
            var addGoodsNum = parseInt(nowGoodsNum) + 1;
            //是否有批发价 1:有 0:无
            var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

            if(ifBatchPrice == '1'){//有批发价时
                //判断减去之后的数量是否小于起批数量
                if(addGoodsNum >100000){
                    layer.alert("商品数量不能大于于100000!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                    $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                    return;
                }else{
                    $.ajax({
                        type: "get",
                        url: "${base}/cart/ajaxGetGoodsBatchPrice",
                        data: "id="+goodsId+"&quantity="+parseInt(addGoodsNum)+"&r="+ new Date(),
                        success: function(data) {
                            if(data.status=='success'){
                                $("#nowGoodsNum_"+goodsId).val(parseInt(addGoodsNum));
                                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                            }
                        }
                    });
                }
            }else{//无批发价时
                if(addGoodsNum >100000){
                    layer.alert("商品数量不能大于100000!", {icon: 7});
                    $("#nowGoodsNum_"+goodsId).val(1);
                    return;
                }else{
                    $("#nowGoodsNum_"+goodsId).val(parseInt(addGoodsNum));
                }
            }
        }

        /**
         * Desc:搜索商品信息
         * Auth:zhangqiang
         * Time:2016-01-30
         */
        function searchGoodsInfo(){
            //获取商品简称
            var goodsShortName = $("#search_shortName").val();
            //获取商家名称
            var shopName = $("#search_shopName").val();

            if(isEmpty(goodsShortName) && isEmpty(shopName)){
                layer.alert("请输入要搜索的内容!", {icon: 7});
                return;

            }else{
                if(goodsShortName.length > 20){
                    layer.alert("商品简称长度不能超过20个字符!", {icon: 7});
                    return;
                }

                if(shopName.length > 10){
                    layer.alert("商家名称长度不能超过10个字符!", {icon: 7});
                    return;
                }

            }
            var url = "listStyle=detailList&pageNumber=${pageNumber}&goodsShortName="+goodsShortName+"&shopName="+shopName;
            s('${keyword}',url);

        }

        /**
         * 判断是否是空
         * @param value
         */
        function isEmpty(value){
            if(value == null || value == "" || value == "undefined" || value == undefined || value == "null"){
                return true;
            }
            else{
                value = (value+"").replace(/\s/g,'');
                if(value == ""){
                    return true;
                }
                return false;
            }
        }
    </script>
    <#include "bec/gwq/service.ftl"/>
    <#include "bec/gwq/foot.ftl"/>
</#escape>