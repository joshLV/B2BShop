<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
<style type="text/css">
    /*购物车结算 2-19*/
    .shopping_total { width:868px; height:72px;  z-index:10; margin:20px auto 20px 5px; padding:0 50px; background:#f3f3f3;/* position:relative; */ float: left;   border: 1px solid #e8e8e8;}
    .shopping_total .shopping_total_left {  line-height:72px; width:488px; /*position:relative;*/}
    .shopping_total .shopping_total_left a { margin-left:28px;}
    .shopping_total .shopping_total_left a.checknow { margin:0 6px 0 0;}
    .shopping_total .shopping_total_left span { margin-left:80px;}
    .shopping_total .shopping_total_right { float:right; margin:18px 0 0; width:600px; position:relative;}
    .shopping_total .total_btn { float:right; display:block; width:116px; height:38px; font:bold 15px/38px "Microsoft Yahei"; color:#fff; background-color:#E4393C; border-radius:8px; text-align:center; margin-top:4px;}
    .shopping_total .total_btn:hover { text-decoration:none; background-color:#F00;}
    .shopping_total .unable, .shopping_total .unable:hover { cursor:default; background-color:#e1e1e1;}
    .shopping_total .subtotal { padding-right:30px; line-height:24px; float:right;}
    .shopping_total .subtotal span { display:inline-block;}
    .shopping_total .subtotal .cartsum { width:114px; text-align:right; padding:0 8px 0 0;}
    .shopping_total .subtotal .price { font-size:18px; color:#E4393C;}
    #show .input_price{
        width: 70px;
        height: 20px;
        border: 1px solid #e8e8e8;
    }
</style>
<div id="container">
    <#include "bec/ghj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/purchaseOrder/list">采购单管理</a></strong><span>&nbsp;&gt;&nbsp;采购单</span>
        </div>
        <div class="member_left">
            <#import "bec/ghj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="purchaseOrder_list"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>${title}-平台采购单</em></h1>
            <div class="user_right p10" id="bindallcheckclickId">
                <#if type = 'inPlatformGoods'>
                    <#if purchaseId != 'undefined'>
                        <div class="user_t">
                            <div class="user_mt">
                                <ul class="extra-l">
                                    <li class="fore-1">
                                        <input class="btn-5-new" type="button" onclick="getOtherPurchaseOrderDetail('${purchaseId}','${otherPurchaseId}');" name="" value="查看非平台采购单" />
                                </ul>
                            </div>
                        </div>
                    </#if>

                </#if>

                <div class="tb-void" id="show">
                    <input type="hidden" name="basePath" id="basePath" value="${base}"/>
                    <input type="hidden" name="purchaseId_ss" id="purchaseId_ss" value="${otherPurchaseId}"/>
                    <input type="hidden" name="otherPurchaseId_ss" id="otherPurchaseId_ss" value="${purchaseId}"/>
                    <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
                    <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
                    <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
                        <input type="hidden" name="o" id="o" value=""/>
                    <#--产生订单类型标识，只有采购单生成订单此参数有用 值为1-->
                        <input type="hidden" name="createOrderType" id="createOrderType" value="1"/>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="goodsDataTable">
                            <tbody>
                            <tr>
                                <td width="75">
                                    <input type="checkbox" id="allcheckTop">
                                </td>
                                <td width="250">商品信息</td>
                            <#--<td width="200">所属商家</td>-->
                            <#--<td width="130">商品简称</td>-->
                                <td width="200">商品规格</td>
                                <td width="100">录入价格</td>
                                <td width="100">当前价格</td>
                                <td width="100">单价差额</td>
                                <td width="155" style="text-align: center; padding-left: 0;">数量</td>
                            <#--20160505 dzz 隐藏库存显示-->
                            <#--<td width="70">库存</td>-->
                                <td width="70">单品采购总差额</td>
                            </tr>
                                <#if goodsList?? && goodsList?size &gt; 0 >

                                    <#assign chaeTotal=0>
                                    <#assign oldTotal=0>
                                    <#assign ptTotal=0>
                                    <#list goodsList as goods>
                                    <tr>
                                        <#if goods.enableBatchPrice == "1">
                                            <input type="hidden" name="" value="${goods.maxBatchPrice}" id="defStartBatchPrice_${goods.id}_${goods.categoryId}" />
                                            <input type="hidden" name="goodsNumId" value="${goods.startBatchNum}" id="defStartBatchNum_${goods.id}_${goods.categoryId}" />
                                        <#else >
                                            <input type="hidden" name="" value="${goods.price?string("##0.00")}" id="defStartBatchPrice_${goods.id}_${goods.categoryId}" />
                                            <input type="hidden" name="goodsNumId" value="${goods.startBatchNum}" id="defStartBatchNum_${goods.id}_${goods.categoryId}" />
                                        </#if>
                                        <td width="75">
                                            <input type="hidden" name="goodsPackageModulus" value="${goods.packageModulus}" id="defPackageModulus_${goods.id}_${goods.categoryId}" />
                                            <input type="hidden" name="purchaseOrderDetailIds" value="${goods.categoryId}" id="purchaseOrderDetailIds_${goods.id}_${goods.categoryId}" />
                                            <input type="hidden" name="goodsLimitNum" value="${goods.limitNum}" id="defLimitNum_${goods.id}_${goods.categoryId}" />
                                            <#if goods.isMarketable != 1 || goods.status != 5 || goods.isDelete != 1>
                                                <input type="checkbox" id="checkbox_${goods.id}_${goods.categoryId}" value="${goods.id}" pdId="${goods.categoryId}" disabled="true"/>
                                            <#else>
                                                <input type="checkbox" id="checkbox_${goods.id}_${goods.categoryId}" value="${goods.id}" pdId="${goods.categoryId}" class="col_checkbox"  <#if goods.stock<=0> disabled="true" <#else> name="cartId" onclick="ifAllCheck();" shopid="${goods.merchantId}" </#if>/>
                                            </#if>
                                        </td>
                                        <td width="250" style="word-break:break-all;">
                                            <#if goods.isMarketable != 1 || goods.status != 5 || goods.isDelete != 1>
                                                <span style="font-weight: bold;color: #ff0000;">已下架</span>
                                            </#if>
                                            <#if goods.hasRebate == 'yes'><a class="has_rebate_ico" title="返利商品" href="javascript:void(0)"></a></#if>
                                            <a href="${base}/item/${goods.id}.html" target="_blank">${goods.name}</a>

                                        </td>
                                    <#--<td width="200" class="dd_search" style="word-break:break-all;">
                                        ${goods.shopName}
                                    </td>-->
                                    <#--<td width="130" class="dd_search" style="word-break:break-all;">
                                        ${goods.shortName}
                                    </td>-->
                                        <td width="200">
                                            <#if goodsSpList??>
                                                <#list goodsSpList["${goods.id}"]["goodsSpList"] as sp>
                                                ${sp.name}:
                                                    <select name="goodsSp_${goods.id}_${goods.categoryId}" spid="${sp.id}" spname="${sp.name}">
                                                        <#list goodsSpList["${goods.id}"]["goodsSpItemList"] as item>
                                                            <#if item.specificationId == sp.id>
                                                                <option value="${sp.name}:${item.name}" <#if item_index==0>selected="selected"</#if>>${item.name}</option>
                                                            </#if>
                                                        </#list>
                                                    </select><br>
                                                </#list>
                                            </#if>
                                        </td>
                                        <td width="100">
                                            ￥<input type="text" class="input_price" value="${goods.inputPrice?string("##0.00")}" name="input_price" id="inputPrice_${goods.id}_${goods.categoryId}"
                                                    onblur="changeInputPrice('${goods.id}','${goods.categoryId}')"
                                                    onkeyup="this.value = floatFormat( this.value, 2 );"
                                                    onafterpaste="this.value = floatFormat(this.value, 2  );" />
                                            <input type="hidden" id="oldTotal_${goods.id}_${goods.categoryId}" value="${goods.inputPrice*goods.hits}">
                                        </td>
                                        <td width="100">
                                            <#assign goodPrice = 0>
                                            <#if goods.enableBatchPrice == "1">
                                                <input type="hidden" value="1" name="name" id="ifBatchPriceId_${goods.id}_${goods.categoryId}" />
                                                <input type="hidden" value="${goods.keywords}" name="price" id="price_${goods.id}_${goods.categoryId}" />
                                            <span id="${goods.id}_nowPrice">
                                                <#assign goodPrice = goods.keywords>
                                                ￥${goods.keywords}
                                                </span>
                                            <#else >
                                                <input type="hidden" value="0" name="name" id="ifBatchPriceId_${goods.id}_${goods.categoryId}" />
                                                <input type="hidden" value="${goods.price}" name="price" id="price_${goods.id}_${goods.categoryId}" />
                                            <span id="${goods.id}_${goods.categoryId}_nowPrice">
                                                <#assign goodPrice = goods.price>
                                                ￥${goods.price?string("##0.00")}
                                            </span>
                                            </#if>
                                            <input type="hidden" id="ptTotal_${goods.id}_${goods.categoryId}" value="${goodPrice*goods.hits}">
                                        </td>
                                        <td>
                                        <span id="priceCha_${goods.id}">
                                        ${(goods.inputPrice?number-goodPrice?number)}
                                        </span>
                                        </td>
                                        <td width="155" class="shop_grey">
                                            <#if 0<goods.stock>
                                                <#if goods.isMarketable != 1 || goods.status != 5 || goods.isDelete != 1>
                                                    <input type="text" name="textfield" id="textfield" value="-"
                                                           class="shop_add" readonly="true" onfocus="this.blur()">
                                                    <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}_${goods.categoryId}"
                                                           class="shop_number" placeholder="1" readonly="true"
                                                           value="${goods.hits}" onfocus="this.blur()">
                                                    <input type="text" name="textfield3" id="textfield3" value="+"
                                                           class="shop_add" readonly="true" onfocus="this.blur()">
                                                <#else>
                                                    <input type="text" name="textfield" id="textfield" value="-"
                                                           class="shop_add" readonly="true" onfocus="this.blur()"
                                                           onclick="javascript:reduce('${goods.id}','${goods.categoryId}');">
                                                    <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}_${goods.categoryId}"
                                                           class="shop_number" placeholder="1"
                                                           onblur="change('${goods.id}','${goods.categoryId}')"
                                                           onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                           onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                                           value="${goods.hits}"
                                                           onchange="change('${goods.id}','${goods.categoryId}')" ;>
                                                    <input type="text" name="textfield3" id="textfield3" value="+"
                                                           class="shop_add" readonly="true" onfocus="this.blur()"
                                                           onclick="javascript:add('${goods.id}','${goods.categoryId}');">
                                                </#if>

                                            <#else>
                                                <input type="text" name="textfield" id="textfield" value="-"
                                                       class="shop_add" readonly="true" onfocus="this.blur()">
                                                <input type="text" name="textfield2" id="nowGoodsNum_${goods.id}_${goods.categoryId}"
                                                       class="shop_number" placeholder="1" readonly="true"
                                                       value="0" onfocus="this.blur()">
                                                <input type="text" name="textfield3" id="textfield3" value="+"
                                                       class="shop_add" readonly="true" onfocus="this.blur()">
                                            </#if>
                                            <br>
                                        <span class="package_desc_span" style="padding-left: 20px;height: 20px;line-height: 20px;vertical-align: bottom;">
                                            ${goods.packageModulus}<#if goods.unit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>个</#if>/<#if goods.packageUnit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>件</#if>
                                        </span>

                                        </td>
                                    <#--20160505 dzz 隐藏库存显示-->
                                    <#--<td width="70" class="shop_grey">
                                        <#if goods.stock<=0>
                                            0
                                        <#else>
                                        ${goods.stock?string(',##0')}
                                        </#if>
                                    </td>-->
                                        <td width="70" class="shop_grey">
                                            <#if goods.enableBatchPrice == "1">
                                                <input type="hidden" name="chae_input" id="chae_${goods.id}_${goods.categoryId}" value="${(goods.inputPrice - goods.keywords?number) * goods.hits}">
                                                <span id="chae_span_${goods.id}_${goods.categoryId}">${(goods.inputPrice - goods.keywords?number) * goods.hits}</span>
                                                <#assign chaeTotal = chaeTotal + ((goods.inputPrice - goods.keywords?number) * goods.hits)>
                                                <#assign oldTotal = oldTotal + (goods.inputPrice * goods.hits)>
                                                <#assign ptTotal = ptTotal + (goods.keywords?number * goods.hits)>
                                            <#else >
                                                <input type="hidden" name="chae_input" id="chae_${goods.id}_${goods.categoryId}" value="${(goods.inputPrice - goods.price) * goods.hits}">
                                                <span  id="chae_span_${goods.id}_${goods.categoryId}">${(goods.inputPrice - goods.price) * goods.hits}</span>
                                                <#assign chaeTotal = chaeTotal + ((goods.inputPrice - goods.price) * goods.hits)>
                                                <#assign oldTotal = oldTotal + (goods.inputPrice * goods.hits)>
                                                <#assign ptTotal = ptTotal + (goods.price * goods.hits)>
                                            </#if>
                                        </td>
                                    </tr>
                                    </#list>
                                <#--<tr class="shopping_list" id="title_reminder" style="background: #f3f3f3;">-->
                                <#--<#if goodsList?size==pager.totalCount>-->
                                <#--<td colspan="9" align="center" style="color: #ff0000;">没有了...</td>-->
                                <#--<#else>-->
                                <#--<td colspan="9" align="center" style="color: #ff0000;">下拉加载更多数据!</td>-->
                                <#--</#if>-->
                                <#--</tr>-->
                                <#else>
                                <tr>
                                    <td colspan="9">
                                        <div class="nocont-box nocont-order">
                                            <b class="icon-order"></b>你还没有采购单！
                                        </div>
                                    </td>
                                </tr>
                                </#if>
                            </tbody>
                        </table>
                    <#--<table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="shopping_list" id="title_reminder" style="background: #f3f3f3;">
                            <#if goodsList?size==pager.totalCount>
                                <td colspan="9" align="center" style="color: #ff0000;">没有了...</td>
                            <#else>
                                <td colspan="9" align="center" style="color: #ff0000;">下拉加载更多数据!</td>
                            </#if>
                        </tr>
                    </table>-->
                    </form>

                </div>

                <div id="hide_div" style="height:0px;visibility:hidden;"></div>
                <div style="">
                    <div class="all_checkbox f-cb"  id="shopping_total" style="width:962px;position: static; z-index:8888;">
                        <div style="display: inline-flex;width: 100%;">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 25%;text-align: right;">
                                        <span class="fr" id="oldTotal_span" style="height: 30px;line-height: 30px;margin-right: 10px;font-size: 14px;font-weight: bold;color: red;">￥${oldTotal?string("##0.00")}</span>
                                        <span class="fr" style="height: 30px;line-height: 30px;font-size: 14px;font-weight: bold;">原采购金额总计：</span>
                                    </td>
                                    <td style="width: 25%;text-align: right;">
                                        <span class="fr" id="ptTotal_span" style="height: 30px;line-height: 30px;margin-right: 10px;font-size: 14px;font-weight: bold;color: red;">￥${ptTotal?string("##0.00")}</span>
                                        <span class="fr" style="height: 30px;line-height: 30px;font-size: 14px;font-weight: bold;">平台采购金额总计：</span>
                                    </td>
                                    <td style="width: 25%;text-align: right;">
                                        <span class="fr" id="chaeTotal_span" style="height: 30px;line-height: 30px;margin-right: 10px;font-size: 14px;font-weight: bold;color: red;">￥${chaeTotal?string("##0.00")}</span>
                                        <span class="fr" style="height: 30px;line-height: 30px;font-size: 14px;font-weight: bold;">采购单总差额：</span>
                                    </td>
                                    <td style="width: 20%;text-align: right;">
                                        <span class="fr" id="chaeBFB_span" style="height: 30px;line-height: 30px;margin-right: 10px;font-size: 14px;font-weight: bold;color: red;">${(chaeTotal/oldTotal*100)?string("##0.00")}%</span>
                                        <span class="fr" style="height: 30px;line-height: 30px;font-size: 14px;font-weight: bold;">优惠比例：</span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <div class="all_chk_left" >
                            <#-- <div class="chk">
                                 <input type="checkbox" id="checkall" value="全选"  name="cartIdAll" />
                                 <label for="checkbox-1-6"></label>
                             </div>-->
                                <div class="shopping_total_left" id="J_leftBar">
                                    <input type="checkbox" id="allCheckDown" value="全选"  style="margin-right: 20px;/*margin-top: 29px;*/float: left;">
                                    全选
                                </div>
                            </div>
                            <div class="f-fl moretip" id="tip_notice" style="margin-left: 80px;"><#if pager.pageCount &gt; 0 && pager.pageCount != pager.pageNumber>滚动鼠标滚轮加载更多...<#else>没有了...</#if> </div>
                            <div style="float: left;">
                                <a href="javascript:;" id="checkout_buy" dd_name="立即购买">
                                    立即购买
                                </a>
                                <a  href="javascript:;" <#--onclick="judgeAuth('${base}','addCarts',goToGoodsCars.bind({}));"--> id="checkout_addCar"  dd_name="加入购物车" >加入购物车</a>
                                <a  href="javascript:;" id="checkout_export"  dd_name="导出采购单" >导出采购单</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script src="${base}/static/bec/project/ghj/js/purchase_order/ajaxPurchaseOrderInPlatform.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $("#bindallcheckclickId").on("click","#allcheckTop,#allCheckDown",function(){
            $("#cartListForm input[name='cartId']").prop("checked", $(this).prop("checked"));
            $("#allcheckTop,#allCheckDown").prop("checked", $(this).prop("checked"));
            calcChaETotal();
        });
        $("#bindallcheckclickId").on("click",".col_checkbox",function(){
            calcChaETotal();
        });

        //立即购买
        $("#checkout_buy").on('click', nowBuy);

        //加入购物车
        $("#checkout_addCar").on('click', addCars);

        //导出非平台采购单
        $("#checkout_export").on('click', exportPurchaseOrder);

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

    /**
     * Desc:加入购物车
     * */
    function addCars(){
        //判断是否存在选中的商品，如果无，不进入结算页面
        var selected = $("input[name='cartId']:checked");

        if(selected != 'undefined' && selected != null && selected.length != 0){
            try {
                var goodsIds = '', pdId = '';
                var i = 0;
                $(selected).each(function(){
                    if(i > 0){
                        goodsIds += '--';
                    }
                    goodsIds += $(this).val();
                    pdId = $(this).attr("pdId");
                    goodsIds += "_"+$("#nowGoodsNum_"+$(this).val()+'_'+pdId).val();

                    //组装规格
                    if( $('select[name="goodsSp_'+ $(this).val()+'_'+pdId +'"]').length > 0 ){
                        var sp = '';
                        var j = 0;
                        $("select[name='goodsSp_"+ $(this).val()+'_'+pdId +"']").each(function(){
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
                window.location.href = "${base}/cart/addBatch?goodsIds=" + goodsIds + "&backurl=${base}/purchaseOrder/list";

            }catch (e) {
            }
        }else{
            layer.alert("请至少选中一件商品!",{icon:7});
        }
    }

    /**
     * Desc:立即购买
     * */
    function nowBuy(){
        //判断是否存在选中的商品，如果无，不进入结算页面
        var selected = $("input[name='cartId']:checked");

        if(selected != 'undefined' && selected != null && selected.length != 0){
            try {
                var goodsIds = '';
                var pdId = '';
                var oid = '';
                var i = 0;

                $(selected).each(function(){
                    if(i > 0){
                        goodsIds += '--';
                        oid += ',';
                    }
                    goodsIds += $(this).val();
                    pdId = $(this).attr("pdId");
                    oid += $("#purchaseOrderDetailIds_"+$(this).val()+'_'+pdId).val();
                    goodsIds += "_"+$("#nowGoodsNum_"+$(this).val()+'_'+pdId).val();

                    //组装规格
                    if( $('select[name="goodsSp_'+ $(this).val()+'_'+pdId +'"]').length > 0 ){
                        var sp = '';
                        var j = 0;
                        $("select[name='goodsSp_"+ $(this).val()+'_'+pdId +"']").each(function(){
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

                if(!isEmpty(oid) && !isEmpty(goodsIds)){
                    $("#o").val(oid);
                    //1.先修改采购单明细的数量与规格
                    $.ajax({
                        type: "post",
                        async: false,
                        url: ${base}/+"purchaseOrder/ajaxUpdatePurchaseOrderDetails",
                        data:{'goodsIds':goodsIds,'oid':oid},
                        datatype: 'json',
                        error: function () {
                            layer.alert('立即购买失败！',{icon: 7});
                        },
                        success: function(result) {
                            //2.校验库存是否大于购买的数量
                            $.post("${base}/member/stockJudge",{o:oid,createOrderType:1},function(d){
                                if( d.success == "success" ){
                                    if("SUCCESS"==result.status){
                                        //3.执行结算功能
                                        $("#cartListForm").attr("action",$("#cartListForm").attr("action") + "?r="+Math.random());
                                        window.setTimeout('$("#cartListForm").submit()',3000);
                                        $("#cartListForm").submit();

                                    }
                                }else if(d.success == "isMarketable" ){
                                    layer.alert( d.msg );
                                }else{
                                    layer.alert( d.msg );
                                }
                            });
                        }
                    });



                }
            } catch (e) {
            }
        }else{
            layer.alert('请至少选中一件商品！',{icon: 7});
        }
    }

    /**
     * Desc:导出采购单
     * */
    function exportPurchaseOrder(){
        //判断是否存在选中的商品，如果无，不进入结算页面
        var selected = $("input[name='cartId']:checked");
        debugger;
        if(selected != 'undefined' && selected != null && selected.length != 0){
            try {
                var pdIds = '';
                var i = 0;
                $(selected).each(function(){
                    if(i > 0){
                        pdIds += '--';
                    }
                    pdIds += $(this).attr("pdId");

                    i++;
                });

                if(!isEmpty(pdIds)){
                    $("#checkout_export").text('拼命导出中...');
                    $("#checkout_export").attr("disabled", true);

                    var loadindex = layer.load();

                    $("#checkout_export").attr("disabled", false);
                    $("#checkout_export").text('导出采购单');

                    window.location.href = "${base}/purchaseOrder/exportPurchaseOrder?type=1&purchasOrdereId=${otherPurchaseId}&purchaseIdNum=" + pdIds ;
                    layer.close(loadindex);
                }else{
                    layer.alert("导出失败!",{icon:7});
                }

            }catch (e) {
            }
        }else{
            $("#checkout_export").attr("disabled", false);
            $("#checkout_export").text('导出采购单');
            window.location.href = "${base}/purchaseOrder/exportPurchaseOrder?type=1&purchasOrdereId=${otherPurchaseId}";
        }
    }

    /**
     * Desc:查看采购单明细
     * */
    function getOtherPurchaseOrderDetail(id,otherId){
        if(!isEmpty(id)){
            window.location="${base}/purchaseOrder/getPurchaseOrder?type=2&purchaseId="+id+"&othserId="+otherId;
        }else{
            layer.alert("查看失败!",{icon:2});
        }

    }


    /**
     * Desc:商品数量执行减去操作
     * @param goodsId
     */
    function reduce(goodsId, pdId) {
        //包装系数 TianYu 2016-2-17 09:19:00
        var defPackageModulus = $("#defPackageModulus_"+goodsId+'_'+pdId).val();
//        alert('包装系数='+defPackageModulus);
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId+'_'+pdId).val());
//        alert('限购数量='+defLimitNum);
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId+'_'+pdId).val());
//        alert('起批数量='+defStartBatchNum);
        //默认起批价格
        var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId+'_'+pdId).val());
        //当前商品数量
        var nowGoodsNum = $("#nowGoodsNum_"+goodsId+'_'+pdId).val();
//        alert('当前商品数量='+nowGoodsNum);
        //减1之后的商品数量
        var reduceGoodsNum = parseInt(nowGoodsNum) - parseInt(defPackageModulus);
//        alert('减1之后的商品数量='+reduceGoodsNum);
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId+'_'+pdId).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍
        if(reduceGoodsNum % defPackageModulus != 0){
            reduceGoodsNum = (parseInt(reduceGoodsNum / defPackageModulus) + 1) * defPackageModulus;
        }

        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && reduceGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId+'_'+pdId).val(defLimitNum);
            changeInputPrice(goodsId,pdId);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+'_'+pdId+"_nowPrice").text("￥"+parseFloat(data.batchPrices).toFixed(2));
                            $("#price_"+goodsId+'_'+pdId+"").val(parseFloat(data.batchPrices).toFixed(2));
                            changeInputPrice(goodsId, pdId);
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断减去之后的数量是否小于起批数量
            if(reduceGoodsNum < defStartBatchNum){
               4d��7dT����'������2�\r��SvJ�v:31a����� �K������7H}���Kut�4o���g��z�>Bƾ��X�g��˸6-��e����z+?FƥKuBXݐɦS�":||{/���p'��2v���+�#?�w���rRu�c~t���č�w5>�����\��,,�i�!�J��%>�S�L���F��)��/�=9.��v���a��/��;9.��/�q^�R&:_�W�"������c��2Ζ������,�exp1u��,�2.\J�!G(����_�';���Kw`<g���ۮr�7��5P�qHN��z|��K����2K|+~���b�`f<�����ķ��^D������{���wy0{ɩ��=2��[dJ�Lg&3咫�}|F/bȣJK� iIL��v�!<2����cu�4�G����_g�ď��$�R��Od��5k�'���֟r�!?�IK�l��82�"L�9\�FY��X�|�\�0�:���d����eX�YP�W�|@#��_�\���7�j���-�2#Z���.`w&]������!�2hW�ǀ͡foeZT�]ٟ+kV��Ǽ����$4�,"W�z�� (�忿G՜K�L��\Y�@n��"�:7tngx�TN�S�-�B��(�?n��G���BeA���ٱ��Ⓘ���}J3�Y��q��w�I�X���@�rUj��0��-e[����RU7�Z�2W�q�+F�`�+�&rP2;�g���s窖���6,sCqC$Q��\����d�2-8�k����L���D��Խ�V�ٰ}�ܷ����J�yr�,�*�����'����J����uHT"⡒������S�i��gg�y�� �0����d��������%�������&��J#�՛}Kc�<Wo�]�)��>�w�j�ꭾϐ�ڨ�3N`��;;��,s�h�='kS�<׊+��c�oG��e�D;��:W�4Xœ�L0��Ů/�܁���˔�Bn#|���ɬ�8���פo%��CƩ��?�;�X��N
i��iWAx�1�pH��`Qng�C���^I��΄�����}-���@r�e�y�I��jذ!��u�v˼ط9�2t��b3.!co���5�g>��Rt/��7 �EƁC��8+��q�2��(~�2���7���p��d�_��;ml�=��b:�7\��3/��'��,ˋ���	2��EuW6�l�v����8
�~�{��9�
��S6�_j��}Eris�0��I;w��]ߓ�����'��r�ئ��e^>�o,�P�ͅ�WJ�A��A壢�x��¹����t���.-�j�͸������}�븹�J	J�[���2�B��K���Ue�*�M�z˼��tqɧ�p��8	�DZ�}���d9f��(T"�!ye��F�M�,3�B%V9����c}�(��}RI�V�I�Qᒲa�
�R59��$�V`N�;�` �bɖ7餻s^�>�s���ұb2?�q2'd.�v}�_�5����ud�oӗ�LG�IA�I]���y�*:U�e�7��-3���N�;)�*��C&�.1NI����y=nZ/_�����E���+��U�@�P�eR�Y⍩L1U�&���˸�����S�K)T`��7�(
��{���'��a�]\ː���>������7�p�Ç��w��kv2.�8���y�W*�yO2vR���^�L��Ȕ��Xf��Ĳԝk;���7�xP?GU����>�9��ʧ�g��<����u��b���'Y��P�	�R~�6������Q�B���}01g�:����A��!mb�u�e�[����uqɪ��?D����x?�/�=p3Zf+��d��:��g`�RJ�^����P�t"��~a�X'��j�/��S������d\��.�׈b��.���w���#���;jO���j%������vt�t��~�nqKM�N�
k�� W�֥��i�<R��~Yv_�Φ���~ ������s�e�e�@����wBo���@���G�@�a��Lz�v��,�!�}���E1��Pz���h��� �mCnB`���R���<�{��j6��G-��-�2pD@9������V校Q6�iG�}�"����Ǉ��kO�/��e7���2��\_-0֓���&�'O&�B1t8��oO!�$�J�|*�x��4L�0��v�h�OG%��'�t�d�/�R�b��i�D���e/�k�ϊ��e�����B?�C�s�Ur���K(aTd��g,���S�Wv�\[5���-w�B�ƣ;��5q	��(q^��]Zo�y�z!���(��m�H�C�+��ؿ�r~	��9�)�i|t� /Ez��طw�e�Ɩ��m�}9�v����*��H�^��`Q�����H5�(�2(���Y��|o5_=x^�1I�^�{<��7�k/����בq�J�B_Ͻ�Z�CyJf(�@����)�ϭ�߸��լ�2�4�6`Jκ޼��Pt�˨x�e�:#���=�Vw�7�oC���^��o'c��;�[	��;ȸjy}��m��+���d��h���P�;�.��c�Ͻ:�|7"g������{�s~��S0k��������y���wp6|�����F���s��� j|�[c�������J��A2��Bpߘ�Tl~��U�B�NB��d�H+�~ⴝ���R>�҅�ڧ�!7HW�:��8+'�y�}������w�a��@��H�mnR~��&p>-���_���,��r�:;o	�D+�����~\�<ꗥ�����	+� K�$ⴘ��_$�d�a\3ӗ�X�~�.�^� _fu�X�26½v��@��_������C�����d��8��LY?�~^���n����.��ܓ��4PTd��F~an��-צ[�禝z�u��mJ��+�ǚ(&��v���k�����s��F���}x�ew����w��5��B�ޘh���#�OY׊�p��%�B����ka��Fu�f�x�՜������H��yL��^k�;��V�63rTͽ�q�ޘ�7;m%m�gG�-��ˏ�?���z��n�13rc���N/q#6x�ݼ�����u��~�>\����0�(�7�$#��$�8�I-���� Z��Rw�jB���B������"�1l��,H��G�37�j�v��9,I�A�Ę}K�x�6@>=@^ ���v4N<*�<-F�� �7Fƴp�֯I��
%=DP(7�����z�"-j�d���������Nv����Q"����lemk}4Z�� tCT½r`9؆�$^�fF�h���׭�3��qk�|dZO}�Vo�]]����Z]*����~�m�d�%����f�Vlf���֚m�v���K;��-�{T�V�=�?�ڴ9,r$N�^@��Q6W;a���z����CC�jؤ�S��HY�F[ܳn�lj���l��َ�)(�6EZ<�B-	+s`���l��0��o���7뭆�ʻR[�p�q��H��F���n��iaMM��mUw��^S^��T��;�Z+&:�5�O���l��k]ׁ.n��=����ʛ�U����nCM~J��;[�:6���]�,ݺ��0����EHOFbP��'��&"�����T�m���m9I�%m[�i��S�l�g�Ր<���T\�qBMk}Q"4�X����nc�q)a앲F��I�׶5e��D�l�Z�^��o̕����x)�XPv��u��9$�bz��6%^h��2��m��~��t�����X-��2�t�ZR9m�G��"�i���d�sN���'ܯ����}��&;WcD��؇�k�xW��Ɛd$Q�N�G�4G�x�BD�i��=��F0`H6 ���s��G/h���?�6<����EݮJO7�$҉�d��l��ưH߈Pun�;��u�
zm6Z3���c=%	��8�5c=��U��!j49Xim��S1�3�n֠D�P-^,�',V� e��f]��:@�o�q�y�)��j��3�Q?�i��]�=A�?<�肾f�;7��ۑ5N�홞6���1'���uNnp����.��FS>jܼ�<>\o!ŗY�'���K
C��(�s(=t=&�����ۙk�����p�٭/�j]�=�v7�tsVf���{ӽF_OᲤ^���'u�d�8�S���׸9��^������:���m����>V>=@^�~ԉ��n�w�� �-���n��'�Џذ�	����6�'%V��ݏ�D�I��ܚp��c1�Ģ�cK�[���%,�����4tѱ�,�%fYj�{�y֢���R��U#r�6b� ,�UiD�v�J�+/01�vD*�`d���X.K�9q�W��.`��+ p���&��h�T��u���9Ts��K��	�����jX�6anv&��+P��{L�����ཐ��P���WA�w���Y�x�Pڶ-��Mp,Z���o��C�[p�S#I��:1גDu���kBk>��i>�]�މJ���" �7kܟR�����e���'�3��9�~H��߰L��!�M�0��R����H����c�{��!���j����R�3�\�&(P��+*6�H�R���RHz�m�t�V6JI'��'8"=���s�(���b�,���t�����l턷i�(:@����6�Y����������������b]Ge�R?9�S�ES��H�xZD8�_Nc�0�Y�������y�%l͙�Cf_��qN��o�3�Ze��ol��Ed���tZ�4V����Ǫ�F�9Wk��LgA����BW��ʣ������'�!LUϯ���l���d-��g�/B�v^y��WW�G^���c�iY���սN�q���Nv�ȣ�2�ֹ�M]L�X\;���zs�)�7���L�ճ�#\�?i���� F"گ5[LM`+v�0�
�6c������U�ë��0|2�Z�������� ���M���|�[�Ogx�w�ہ�dx�Y�|�;��e�<�!������/b�b�K�x���#����e�	�G���������3|� ��᫁�a�.�we8	<�p
8Ͱ<��$�A�3��2|p��p�(xx
�z���%�������a�#����������kO��n0|x��c�M�o�����m����73��1�^`�8�-� ���� ߗ��ߟ� ?��?�� ?��?��G ?��G?��� ?���?��' ?��'?�� ?��?��g ?��g?��� ?���?�� ������ ������W ���W���� �������7 ���7��� ������w ���;�������f�=��e���1�~�0�A�1�a��0�Q��1�q�O0|'�'����g��������
�W�����7����w���������	�O�����/����o���������_�����?����}L����a0(�� ^��I����W3��d���c��S^���������Ӏ�2|:�6�� ����;>�l�������1<|>� _��E�3|	��fxx7�{�/c8<���^���g�r�+�� �W_��5�wa���I�ǁS��m�'�'>�a�Z����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������!�&��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/��`�/���� ����/�����?!�_	�n����Kn3@�R�U��IJ�Q��]�(�׈��_�SZ��PK
    :k�6f����  	  &   org/apache/xmlbeans/XmlException.class�Vis�V=�K���NBq)!!ނ)]��B�	�� ͞nT1��%F���O鯠3m��'>�G1��$�JbC��}۽��������pT����Y\V1�9#���\��5�*zq�w����X`q�ŭn��bQ�KC�ᚺ�n����k�bQ���؞����n5�$��P��YV��ņoZŊ��s=WL���
�e�CK�k��5��\v] Qr��6�6�ۆ��o[�3Rq��N��:�L�;&MV�Vԟ����[������uka�j<��m�u9D*���Jdgu�u~g:������e����tu��%u�2o�ޯ*p���s��P�R��2�2���,�xg�B����o֍v�pt���@���5�_�9��j�Lg_S��f�E��8�j�4���u�-4|��,�X�h��{<�+���;,�@ѵ᯻���/�hXŚ�H+Xװ������T�𣆟����ED1�64��5����N�ǚ��W�:%����ѹe����LE����cR��~Nd���Pî;�G�����0g��'TQ*���yz�z��7<��{��g��3��E<�-�$~������4����BƐ�1���\�՜�}�G=D�Z]���=��ğR���8�OI�� t��$��9�L�8��Pr��b��h"Pi)!Ϧ�,&!g:�?�x��k���	qJHH�T.����m0U]��R0�L!�\�70 f_�g�A�k4�K�\�lƜ
cn��%I!$�C�t���7���ޭ�=����7Rm��y��/�"�N�;��N���-�4fq.�.���q��9c����
M7
��}^��5��`��o��c+R��+�T�ψn�����_��kr�������� )��*�C1����������_'ꪤ���V�#ReQ�$��A���5b�l%�.�PK
    :k�6ׁ�~    6   org/apache/xmlbeans/XmlFactoryHook$ThreadContext.class��_OA�ϰm�][����*l�����/M�F!D|�n���v��.?���II$1�����w�+B5Z_��ܹ�7g��o�?���Ʊd������U\QIǂ�����P�c�.��t�୭(z�0���o�����|#�x���dP��T������=�M���}�6��D򝪣�L=j	�b�ų�^S��(3���\�j�&�8j'/D�a�)����@HzBI�JYqFQR�%-]�PMyn���1������G�Q��Ä�~�B�ǂ����\@�M�/Hﲶ��M_�1u�oU9bc�l��*��_,bX��spmW�����k��*��/����(e��0L����	e����ݠ�u�i�ƛR�U�Ʒ�e.�n�"�8����SOk_a���j}dN��@��果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && addGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            $("#nowGoodsNum_"+goodsId+'_'+pdId).val(defLimitNum);
            changeInputPrice(goodsId, pdId);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+'_'+pdId+"_nowPrice").text("￥"+parseFloat(data.batchPrices).toFixed(2));
                            $("#price_"+goodsId+'_'+pdId+"").val(parseFloat(data.batchPrices).toFixed(2));
                            changeInputPrice(goodsId, pdId);
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//有批发价时
            //判断减去之后的数量是否小于起批数量
            if(nowGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                $("#nowGoodsNum_"+goodsId+'_'+pdId).val(defStartBatchNum);
                $("#"+goodsId+'_'+pdId+"_nowPrice").text("￥"+parseFloat(defStartBatchPrice).toFixed(2));
                $("#price_"+goodsId+'_'+pdId+"").val(parseFloat(defStartBatchPrice).toFixed(2));
                changeInputPrice(goodsId, pdId);
                return;
            }else{
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+parseInt(addGoodsNum)+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#nowGoodsNum_"+goodsId+'_'+pdId).val(parseInt(addGoodsNum));
                            $("#"+goodsId+'_'+pdId+"_nowPrice").text("￥"+parseFloat(data.batchPrices).toFixed(2));
                            $("#price_"+goodsId+'_'+pdId+"").val(parseFloat(data.batchPrices).toFixed(2));
                            changeInputPrice(goodsId, pdId);
                        }
                    }
                });
            }
        }else{//无批发价时
            if(addGoodsNum >100000){
                layer.alert("商品数量不能大于100000!", {icon: 7});
                $("#nowGoodsNum_"+goodsId+'_'+pdId).val(1);
                changeInputPrice(goodsId, pdId);
                return;
            }else{
                $("#nowGoodsNum_"+goodsId+'_'+pdId).val(parseInt(addGoodsNum));
                changeInputPrice(goodsId, pdId);
            }
        }
    }

    /**
     * 勾选checkbox判断是否为所有全选
     */
    function ifAllCheck(){
        var flag = true;
        $("#cartListForm input[name='cartId']").each(function(){
            if(!$(this).prop("checked")) {
                flag = false;
                return false;
            }

        });

        if(flag){
            $("#allcheckTop,#allCheckDown").prop("checked", true);
        }else{
            $("#allcheckTop,#allCheckDown").prop("checked", false);
        }
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


    /**
     * 计算总差额
     */
    function calcChaETotal(){
        var chaeTotal = 0;
        var oldTotal = 0;
        var ptTotal = 0;
        if($("#allcheckTop").is(":checked") || $(".col_checkbox:checked").length == 0){
            $(".col_checkbox").each(function (i){
                chaeTotal += parseFloat($("#chae_"+ $(this).val()+'_'+$(this).attr("pdId")).val());
                oldTotal += parseFloat($("#oldTotal_"+ $(this).val()+'_'+$(this).attr("pdId")).val());
                ptTotal += parseFloat($("#ptTotal_"+ $(this).val()+'_'+$(this).attr("pdId")).val());
            });
        }else{
            $(".col_checkbox:checked").each(function (i){
                chaeTotal += parseFloat($("#chae_"+$(this).val()+'_'+$(this).attr("pdId")).val());
                oldTotal += parseFloat($("#oldTotal_"+ $(this).val()+'_'+$(this).attr("pdId")).val());
                ptTotal += parseFloat($("#ptTotal_"+ $(this).val()+'_'+$(this).attr("pdId")).val());
            });
        }

        $("#chaeTotal_span").html('￥'+parseFloat(chaeTotal).toFixed(2));
        $("#oldTotal_span").html('￥'+parseFloat(oldTotal).toFixed(2));
        $("#ptTotal_span").html('￥'+parseFloat(ptTotal).toFixed(2));
        $("#chaeBFB_span").html((parseFloat(chaeTotal)/parseFloat(oldTotal)*100).toFixed(2)+ '%');
    }

    /**
     * 修改录入价格
     * @param id
     */
    function changeInputPrice(gid,pdId){
        if(!isNaN( $("#inputPrice_" + gid+'_'+pdId).val() )){

            if( parseFloat($("#inputPrice_" + gid+'_'+pdId).val()) > 10000000){
                $("#inputPrice_" + gid+'_'+pdId).val(10000000);
                layer.msg("录入价格不能大于1000000",{icon:5, time: 3000});
            }

            var inputPrice = parseFloat($("#inputPrice_" + gid+'_'+pdId).val()).toFixed(2);
            var price = parseFloat($("#price_" + gid+'_'+pdId).val());
            var num = parseInt($("#nowGoodsNum_" + gid+'_'+pdId).val());

            $("#chae_" +gid+'_'+pdId).val(((inputPrice-price)*num).toFixed(2));
            $("#chae_span_" +gid+'_'+pdId).html(((inputPrice-price)*num).toFixed(2));
            $("#oldTotal_" +gid+'_'+pdId).val((inputPrice*num).toFixed(2));
            $("#ptTotal_" +gid+'_'+pdId).val((price*num).toFixed(2));

            //更新单价差额
            $("#priceCha_"+gid+'_'+pdId).text(parseFloat(inputPrice - price).toFixed(2));
            calcChaETotal();

            //ajax修改数量和录入价格
            $.ajax({
                type: "post",
                url: "${base}/purchaseOrder/ajaxUpdatePdQuantityByPdId",
                data:{pdId : pdId, quantity: num,inputPrice:inputPrice,r :new Date()},
                success: function(data) {
                    if(data.status=='success'){

                    }else{

                    }
                }
            });
        }
    }
</script>
    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>