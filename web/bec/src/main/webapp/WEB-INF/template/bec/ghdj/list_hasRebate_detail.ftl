<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
    <#include "bec/ghdj/top.ftl"/>

<!--main-->
<div class="z_main" id="product-list">
    <div class="list_search f-cb">
        <div class="f-cb">
            <div class="f-fl">
                <form name="" action="">
                    <span>商品搜索：</span>
                    <input type="hidden" name="basePath" id="basePath" value="${base}"/>
                    <input type="hidden" name="merchantId" id="cur_mid" value="${merchantId}"/>
                    <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
                    <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
                    <input type="hidden" name="orderBy" id="cur_orderBy" value="${pager.orderBy}"/>
                    <input type="hidden" name="orderType" id="cur_orderType" value="${pager.orderType}"/>
                    <input class="has_reset inp_search" type="text"  name="mn" id="merchantName" placeholder="供应商名称" value="${merchantName}">
                    <input class="has_reset inp_search" type="text"  name="goodsShortName" id="sn" placeholder="商品简称" value="${goodsShortName}">
                    <input class="has_reset inp_search" type="text"  name="barCode" id="bc" placeholder="商品条码" value="${barCode}">
                    <input class="has_reset inp_search" type="text"  name="goodsCategory" id="cl" placeholder="分类" value="${goodsCategory}">
                    <input type="button" name="" value="搜&nbsp;索" class="inp_btn" onclick="allG('${merchantId}',$('#mn').val(),$('#sn').val(),$('#cl').val(),$('#bc').val(),'viewType=list');">
                </form>
            </div>
            <div class="f-fr"> 共找到<em style="float: none;"><#if total != '' && total &gt; 0>${total}<#else>0</#if></em>个商品 </div>
        </div>
        <div class="f-cb w100 mt13">
            <div class="f-fl"> <span>排序：</span></div>
            <div class="f-fl">
                <ul class="pro_sort pro_sort2">
                    <li <#if pager.orderBy=="sales" && pager.orderType=="desc">class="on"<#elseif pager.orderBy=="sales" && pager.orderType=="asc">class="on"<#else></#if>>
                        <#if pager.orderBy=="sales" && pager.orderType=="desc">
                            <a class="" href="javascript:void(0)"  onclick="allG('${merchantId}','','','','','orderBy=sales&orderType=asc&pageNumber=${pager.pageNumber}&viewType=list')">销量</a>
                        <#elseif pager.orderBy=="sales" && pager.orderType=="asc">
                            <a class="arr_down" href="javascript:void(0)"  onclick="allG('${merchantId}','','','','','orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}&viewType=list')">销量</a>
                        <#else>
                            <a href="javascript:void(0)"  onclick="allG('${merchantId}','','','','','orderBy=sales&orderType=desc&pageNumber=${pager.pageNumber}&viewType=list')">销量</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="price" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="price" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="price" && pager.orderType=="desc">
                            <a href="javascript:void(0)"  onclick="allG('${merchantId}','','','','','orderBy=price&orderType=asc&pageNumber=${pager.pageNumber}&viewType=list')">价格</a>
                        <#elseif pager.orderBy=="price" && pager.orderType=="asc">
                            <a class="arr_down" href="javascript:void(0)"  onclick="allG('${merchantId}','','','','','orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}&viewType=list')">价格</a>
                        <#else>
                            <a href="javascript:void(0)"  onclick="allG('${merchantId}','','','','','orderBy=price&orderType=desc&pageNumber=${pager.pageNumber}&viewType=list')">价格</a>
                        </#if>
                    </li>
                    <li <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">class="on" <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">class="on" <#else></#if>>
                        <#if pager.orderBy=="scoreCount" && pager.orderType=="desc">
                            <a class="sort_3" href="javascript:void(0)"  onclick="allG('${merchantId}','','','','','orderBy=scoreCount&orderType=asc&pageNumber=${pager.pageNumber}&viewType=list')">评论数</a>
                        <#elseif pager.orderBy=="scoreCount" && pager.orderType=="asc">
                            <a class="sort_3 sort_3_down" href="javascript:void(0)"  onclick="allG('${merchantId}','','','','','orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}&viewType=list')">评论数</a>
                        <#else>
                            <a class="sort_3" href="javascript:void(0)"  onclick="allG('${merchantId}','','','','','orderBy=scoreCount&orderType=desc&pageNumber=${pager.pageNumber}&viewType=list')">评论数</a>
                        </#if>
                    </li>
                    <li><a href="javascript:void(0)" onclick="allG('${merchantId}','','','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&pageNumber=${pager.pageNumber}')" class="sort_4">普通模式</a></li>
                    <li class="on"><a href="javascript:void(0)" onclick="allG('${merchantId}','','','','','orderBy=${pager.orderBy}&orderType=${pager.orderType}&viewType=list')" class="sort_5">批发模式</a></li>
                </ul>
            </div>
        </div><#-- 排序  end -->
    </div>
    <div class="pro_pf_list f-cb" id="show">
        <input type="hidden" value="${isLogin}" id="isLogin">
        <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
            <ul id="goodsDataTable">
                <#list goodslist as goods>
                    <li>
                        <div class="pro_pf_info">
                            <#if goods.enableBatchPrice == '1' && goods.batchPrice != "0.00">
                                <input type="hidden" name="" value="${goods.batchPrice}" id="defStartBatchPrice_${goods.id}" />
                                <input type="hidden" name="goodsNumId" value="${goods.startBatchNum}" id="defStartBatchNum_${goods.id}" />
                            <#else >
                                <input type="hidden" name="" value="${goods.price?string("##0.00")}" id="defStartBatchPrice_${goods.id}" />
                                <input type="hidden" name="goodsNumId" value="${goods.startNum}" id="defStartBatchNum_${goods.id}" />
                            </#if>

                            <input type="hidden" name="goodsPackageModulus" value="<#if goods.packageModulus??>${(goods.packageModulus==0)?string("1",goods.packageModulus)}<#else>1</#if>" id="defPackageModulus_${goods.id}" />
                            <input type="hidden" name="goodsLimitNum" value="${goods.limitNum}" id="defLimitNum_${goods.id}" />
                        <#---->
                            <table border="0" cellspacing="0" cellpadding="0">
                                <tr height="50" class="pro_pf_tr">
                                    <td width="76">&nbsp;</td>
                                    <td width="400" class="textoverflow">
                                        <a href="${base}/item/${goods.id}.html" title="${goods.name}" target="_blank" >${goods.fullName}</a>
                                    </td>
                                    <td width="200" style="text-align:center">商品规格</td>
                                    <td width="229" style="text-align:center">会员价格</td>
                                    <td width="140" style="text-align:center">当前价格</td>
                                    <td width="155" style="text-align:center">数    量</td>
                                <#--20160505 dzz 隐藏库存显示-->
                                <#--<td width="114" style="text-align:center">库    存</td>-->
                                </tr>
                                <tr class="pro_pf_tr2">
                                    <td width="76" class="pro_checkbox">
                                        <input type="checkbox" id="checkbox_${goods.id}" value="${goods.id}"  <#if goods.stock<=0> disabled="true" <#else> name="cartId" shopid="${goods.shopId}" </#if>/>
                                        <label for="checkbox-1-1"></label></td>
                                    <td width="400"><div class="pro_name">
                                        <p><em>所属商家：</em><a href="javascript:void(0);" onclick="allG('${goods.shopId}','${goods.shopName}','','','','viewType=list')" >${goods.shopName}</a></p>
                                        <p class="textoverflow"><em>商品简称：</em><a href="javascript:void(0);" onclick="allG('${merchantId}','','${goods.shortName}','','','viewType=list')">${goods.shortName}</a></p>
                                        <p><em>商品条码：</em>${goods.barcode}</p>
                                    </div></td>
                                    <td width="180" class="pro_color" >
                                        <#if goodsSpList??>
                                            <#list goodsSpList["${goods.id}"]["goodsSpList"] as sp>
                                                <div class="f-cb" style="width: 180px; height: 32px;"><em>${sp.name}：</em>
                                                    <select name="goodsSp_${goods.id}" spid="${sp.id}" spname="${sp.name}">
                                                        <#list goodsSpList["${goods.id}"]["goodsSpItemList"] as item>
                                                            <#if item.specificationId == sp.id>
                                                                <option value="${sp.name}:${item.name}" <#if item_index==0>selected="selected"</#if>>${item.name}</option>
                                                            </#if>
                                                        </#list>
                                                    </select>
                                                </div>
                                            </#list>
                                        </#if>
                                    </td>
                                    <td width="229" class="pro_prices">
                                        <input type="hidden" value="${goods.enableBatchPrice}" name="name" id="ifBatchPriceId_${goods.id}" />
                                        <#if goods.enableBatchPrice == '1'>
                                            ￥${goods.batchPrice}
                                        <#else >
                                        ${goods.price?string("currency")}
                                        </#if>
                                    </td>
                                    <td width="140" class="pro_prices2" id="${goods.id}_nowPrice">
                                        <#if goods.batchPrice?? && goods.batchPrice != "0.00">
                                        ${goods.maxBatchPrice?string("currency")}
                                    <#else >
                                        ${goods.price?string("currency")}
                                        </#if>
                                    </td>
                                    <td width="155" class="pro_number">
                                        <div style="margin: 0 auto; width: 86px; padding-bottom: 2px;">
                                            <#if 0<goods.stock>
                                                <input type="text" name="textfield" id="textfield" value="-"
                                                       class="pro_minus" readonly="ture" onfocus="this.blur()"
                                                       onclick="javascript:reduce('${goods.id}');">
                                                <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}"
                                                       class="pro_mid" placeholder="1"
                                                       onblur="change('${goods.id}','${goods.price}')"
                                                       onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                       value="<#if goods.enableBatchPrice == '1'>${goods.startBatchNum}<#else>${goods.startNum}</#if>"
                                                       onchange="change('${goods.id}')">
                                                <input type="text" name="textfield3" id="textfield3" value="+"
                                                       class="pro_add" readonly="ture" onfocus="this.blur()"
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
                                        </div>


                                        <div style="float: none; text-align: center; padding-top: 5px; ">${goods.packageModulus}<#if goods.packageUnit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>个</#if>/<#if goods.unit?? && goods.unit != ''>${goods.unit}<#else>件</#if></div>
                                    </td>
                                <#--20160505 dzz 隐藏库存显示-->
                                <#--<td width="114" class="pro_kc">
                                    <#if goods.stock<=0>
                                        0<#if goods.packageUnit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>个</#if>
                                    <#else>
                                        ${goods.stock?string(',##0')}<#if goods.packageUnit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>个</#if>
                                    </#if>
                                </td>-->
                                </tr>
                            </table>
                        </div>
                        <div class="fanli_2" <#if goods.hasRebate=='no'>style="display:none;"</#if>>返利</div>
                    </li>
                </#list>
            </ul>
        </form>
    </div>
    <div class="all_checkbox f-cb"  id="shopping_total" >
        <div class="all_chk_left">
            <div class="chk">
                <input type="checkbox" id="checkall" value="全选"  name="cartIdAll" />
                <label for="checkbox-1-6"></label>
            </div>
            <em>全选</em>
        </div>
        <div class="f-fl moretip" id="tip_notice"><#if pager.pageCount &gt; 0 && pager.pageCount != pager.pageNumber>滚动鼠标滚轮加载更多...<#else>没有了...</#if></div>
        <a  href="javascript:;" onclick="judgeAuth('${base}','addCarts',goToGoodsCars.bind({}));" id="checkout_btn" >加入购物车</a> </div>
</div><#-- main end -->
<a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin" ></a>

<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/ghdj/js/list3HasRebate/ajaxList.js" type="text/javascript"></script>
<script type="text/javascript">
    var priceHide = '${priceHide}';
    var _mid= '${merchantId}';
    var _mn= '${merchantName}';
    $(function () {
        $("#product-list").on("click","input[name='cartId']",function(){
            if($("#product-list input[name='cartId']").length > 0){
                var checked = true;
                $("#product-list input[name='cartId']").each(function(){
                    if(!$(this).prop("checked")){
                        checked = false;
                        return;
                    }
                });
                $("#checkall").prop("checked", checked);
            }
        });
        $("#checkall").on("click",function(){
            $("#product-list input[name='cartId']").prop("checked", $(this).prop("checked"));
            $("#checkall").prop("checked", $(this).prop("checked"));
        });
        $("#toSettlement").on('click', function(){
            judgeAuth('${base}','addCarts',goToGoodsCars.bind({}));
        });
        $("#cartLogin").hide();
        $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});
        if(!isLogin()) {
            $("#cartLogin").trigger("click");
        }
        changeShoppingCartTotal();
        $(window).scroll(function(){
            changeShoppingCartTotal();
        });

    });



    //购物车结算效果
    function changeShoppingCartTotal(){
        var wh=$(window).height();
        var top=$(window).scrollTop();
        //console.log($(window).height()+" "+$(window).scrollTop());
        var it=$("#show").offset().top;
        var ih=$("#show").height();
        if(((wh+top)-(it+ih+100))>0){
            $("#shopping_total").css("position","static");
        }else{
            $("#shopping_total").css({"position":"fixed","bottom":"-28px","z-index":"99999"});
        }
    }





    /** -------------------------加入购物车  Start -------------------------------*/


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
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = $("#defPackageModulus_"+goodsId).val();
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId).val());
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
        //默认起批价格
        var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
        //当前商品数量
        var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
        //减1之后的商品数量
        var reduceGoodsNum = parseInt(nowGoodsNum) - parseInt(defPackageModulus);
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(reduceGoodsNum % defPackageModulus != 0){
            reduceGoodsNum = (parseInt(reduceGoodsNum / defPackageModulus) + 1) * defPackageModulus;
        }

        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && reduceGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId).val(defLimitNum);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
            return;
        }

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
            if(reduceGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能小于起批数量"+defStartBatchNum+"!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val( defStartBatchNum );
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
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = parseInt($("#defPackageModulus_"+goodsId).val());
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId).val());

        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
        //默认起批价格
        var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId).val());
        //当前商品数量
        var nowGoodsNum = parseInt($("#nowGoodsNum_"+goodsId).val());
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(nowGoodsNum % defPackageModulus != 0){
            nowGoodsNum = (parseInt(nowGoodsNum / defPackageModulus) + 1) * defPackageModulus;
        }

        /**
         * 如果限购数量为零，说明启用了限购数量
         *  超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
         *  TianYu 2016-2-17 10:17:17
         */
        if( defLimitNum != 0 && nowGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId).val(defLimitNum);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断改变之后的数量是否小于起批数量
            if(nowGoodsNum <defStartBatchNum){
                layer.alert("商品数量不能小于起批数量!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                return;
            }else if(nowGoodsNum >100000){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                $("#"+goodsId+"_nowPrice").text("￥"+parseInt(defStartBatchPrice).toFixed(2));
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+nowGoodsNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#nowGoodsNum_"+goodsId).val(nowGoodsNum);
                            $("#"+goodsId+"_nowPrice").text("￥"+parseInt(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
        }else{//无批发价时
            if(nowGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能小于起批数量"+defStartBatchNum+"!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val( defStartBatchNum );
                return;
            }else{
                $("#nowGoodsNum_"+goodsId).val(parseInt(nowGoodsNum));
            }
        }
    }

    function add(goodsId) {
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = parseInt($("#defPackageModulus_"+goodsId).val());
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId).val());
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId).val());
        //默认起批价格
        var defStartBatchPrice = $("#defStartBatchPrice_"+goodsId).val();
        //当前商品数量
        var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
        //加1之后的商品数量
        //修改默认值为1的情况下 手动输入和点击加号算法不一致的情况  yuech 2016-02-23 14:23
        var addGoodsNum = parseInt(nowGoodsNum) + defPackageModulus;
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(addGoodsNum % defPackageModulus != 0){
            var i = parseInt(addGoodsNum / defPackageModulus);
            addGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
        }

        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && addGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId).val(defLimitNum);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(data.batchPrices).toFixed(2));
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断减去之后的数量是否小于起批数量
            if(addGoodsNum >100000){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                $("#nowGoodsNum_"+goodsId).val(defStartBatchNum);
                $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(defStartBatchPrice).toFixed(2));
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+parseInt(addGoodsNum)+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#nowGoodsNum_"+goodsId).val(parseInt(addGoodsNum));
                            $("#"+goodsId+"_nowPrice").text("￥"+parseFloat(data.batchPrices).toFixed(2));
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

    /** -------------------------加入购物车  end -------------------------------*/


    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
    }

    function highlight(key) {
        var html=$("#plist").html();
        var key = key.split('|');
        for (var i=0; i<key.length; i++) {
            var content = html.replace(key[i],"<font style='color:red'>" + key[i]+ "</font>");
        }
        $("#plist").html(content);
    }
    function addCart(goodsId, cnt) {
        window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=" +cnt + "&backurl=" + window.location.href
    }

    function allG(mid,mn,sn,cl,bc,param) {
        if(!isLogin()) {
            $("#cartLogin").trigger("click");
            return false;
        }
        if( mn == '' ){
            mn = $("#mn").val();
        }
        if( sn == '' ){
            sn = $("#sn").val();
        }
        if( cl == '' ){
            cl = $("#cl").val();
        }
        if( bc == '' ){
            bc = $("#bc").val();
        }
        //如果存在用供应商ID查询的精准查询，需要判断供应商名称是否和查询条件中的一致，
        // 如果不一致，说明查询条件已修改,查询时不组装此条件
        if( _mid != '' && _mn != $.trim(mn)){
            _mid = '';
            mid = '';
        }

        //组装查询条件
        var filter = '';
        if($.trim(mn) != ''){
            filter += "merchantName=" + encodeURI(encodeURI($.trim(mn)));
        }
        if($.trim(sn) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "goodsShortName=" + encodeURI(encodeURI($.trim(sn)));
        }
        if($.trim(cl) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "goodsCategory=" + encodeURI(encodeURI($.trim(cl)));
        }
        if($.trim(bc) != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "barCode=" + encodeURI(encodeURI($.trim(bc)));
        }
        if( mid != ''){
            if(filter!=''){
                filter += '&';
            }
            filter += "merchantId=" + mid;
        }

        if(filter != '' && param != ''){
            filter += '&' + param;
        }else if(filter == '' && param != ''){
            filter += param;
        }

        if(filter != ''){
            filter = '?' + filter;
        }
        window.location.href = "${base}/promotionGoods/listPromotion.html" + filter;
    }


    function goToOrder(){
        loadGoods();
    }

    /**
     * 判断是否登录
     * @returns {Boolean}
     */
    function isLogin(){
        if(priceHide != 'hide'){
            return true;
        }else{
            return false;
        }
    }
    /**
     * 设置登录标记
     * @param flag
     */
    function setLogin(flag){
        priceHide = flag ? "" : "hide";
    }
    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
    }

</script>


    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>