<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
<style type="text/css">
    /*è´­ç‰©è½¦ç»“ç®— 2-19*/
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
            <strong>æ‚¨å½“å‰çš„ä½ç½®ï¼š<a href="${base}/member/index.html">ä¼šå‘˜ä¸­å¿ƒ</a> > <a href="${base}/purchaseOrder/list">é‡‡è´­å•ç®¡ç†</a></strong><span>&nbsp;&gt;&nbsp;é‡‡è´­å•</span>
        </div>
        <div class="member_left">
            <#import "bec/ghj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="purchaseOrder_list"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>${title}-å¹³å°é‡‡è´­å•</em></h1>
            <div class="user_right p10" id="bindallcheckclickId">
                <#if type = 'inPlatformGoods'>
                    <#if purchaseId != 'undefined'>
                        <div class="user_t">
                            <div class="user_mt">
                                <ul class="extra-l">
                                    <li class="fore-1">
                                        <input class="btn-5-new" type="button" onclick="getOtherPurchaseOrderDetail('${purchaseId}','${otherPurchaseId}');" name="" value="æŸ¥çœ‹éå¹³å°é‡‡è´­å•" />
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
                    <#--äº§ç”Ÿè®¢å•ç±»å‹æ ‡è¯†ï¼Œåªæœ‰é‡‡è´­å•ç”Ÿæˆè®¢å•æ­¤å‚æ•°æœ‰ç”¨ å€¼ä¸º1-->
                        <input type="hidden" name="createOrderType" id="createOrderType" value="1"/>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="goodsDataTable">
                            <tbody>
                            <tr>
                                <td width="75">
                                    <input type="checkbox" id="allcheckTop">
                                </td>
                                <td width="250">å•†å“ä¿¡æ¯</td>
                            <#--<td width="200">æ‰€å±å•†å®¶</td>-->
                            <#--<td width="130">å•†å“ç®€ç§°</td>-->
                                <td width="200">å•†å“è§„æ ¼</td>
                                <td width="100">å½•å…¥ä»·æ ¼</td>
                                <td width="100">å½“å‰ä»·æ ¼</td>
                                <td width="100">å•ä»·å·®é¢</td>
                                <td width="155" style="text-align: center; padding-left: 0;">æ•°é‡</td>
                            <#--20160505 dzz éšè—åº“å­˜æ˜¾ç¤º-->
                            <#--<td width="70">åº“å­˜</td>-->
                                <td width="70">å•å“é‡‡è´­æ€»å·®é¢</td>
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
                                                <span style="font-weight: bold;color: #ff0000;">å·²ä¸‹æ¶</span>
                                            </#if>
                                            <#if goods.hasRebate == 'yes'><a class="has_rebate_ico" title="è¿”åˆ©å•†å“" href="javascript:void(0)"></a></#if>
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
                                            ï¿¥<input type="text" class="input_price" value="${goods.inputPrice?string("##0.00")}" name="input_price" id="inputPrice_${goods.id}_${goods.categoryId}"
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
                                                ï¿¥${goods.keywords}
                                                </span>
                                            <#else >
                                                <input type="hidden" value="0" name="name" id="ifBatchPriceId_${goods.id}_${goods.categoryId}" />
                                                <input type="hidden" value="${goods.price}" name="price" id="price_${goods.id}_${goods.categoryId}" />
                                            <span id="${goods.id}_${goods.categoryId}_nowPrice">
                                                <#assign goodPrice = goods.price>
                                                ï¿¥${goods.price?string("##0.00")}
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
                                            ${goods.packageModulus}<#if goods.unit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>ä¸ª</#if>/<#if goods.packageUnit?? && goods.packageUnit != ''>${goods.packageUnit}<#else>ä»¶</#if>
                                        </span>

                                        </td>
                                    <#--20160505 dzz éšè—åº“å­˜æ˜¾ç¤º-->
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
                                <#--<td colspan="9" align="center" style="color: #ff0000;">æ²¡æœ‰äº†...</td>-->
                                <#--<#else>-->
                                <#--<td colspan="9" align="center" style="color: #ff0000;">ä¸‹æ‹‰åŠ è½½æ›´å¤šæ•°æ®!</td>-->
                                <#--</#if>-->
                                <#--</tr>-->
                                <#else>
                                <tr>
                                    <td colspan="9">
                                        <div class="nocont-box nocont-order">
                                            <b class="icon-order"></b>ä½ è¿˜æ²¡æœ‰é‡‡è´­å•ï¼
                                        </div>
                                    </td>
                                </tr>
                                </#if>
                            </tbody>
                        </table>
                    <#--<table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr class="shopping_list" id="title_reminder" style="background: #f3f3f3;">
                            <#if goodsList?size==pager.totalCount>
                                <td colspan="9" align="center" style="color: #ff0000;">æ²¡æœ‰äº†...</td>
                            <#else>
                                <td colspan="9" align="center" style="color: #ff0000;">ä¸‹æ‹‰åŠ è½½æ›´å¤šæ•°æ®!</td>
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
                                        <span class="fr" id="oldTotal_span" style="height: 30px;line-height: 30px;margin-right: 10px;font-size: 14px;font-weight: bold;color: red;">ï¿¥${oldTotal?string("##0.00")}</span>
                                        <span class="fr" style="height: 30px;line-height: 30px;font-size: 14px;font-weight: bold;">åŸé‡‡è´­é‡‘é¢æ€»è®¡ï¼š</span>
                                    </td>
                                    <td style="width: 25%;text-align: right;">
                                        <span class="fr" id="ptTotal_span" style="height: 30px;line-height: 30px;margin-right: 10px;font-size: 14px;font-weight: bold;color: red;">ï¿¥${ptTotal?string("##0.00")}</span>
                                        <span class="fr" style="height: 30px;line-height: 30px;font-size: 14px;font-weight: bold;">å¹³å°é‡‡è´­é‡‘é¢æ€»è®¡ï¼š</span>
                                    </td>
                                    <td style="width: 25%;text-align: right;">
                                        <span class="fr" id="chaeTotal_span" style="height: 30px;line-height: 30px;margin-right: 10px;font-size: 14px;font-weight: bold;color: red;">ï¿¥${chaeTotal?string("##0.00")}</span>
                                        <span class="fr" style="height: 30px;line-height: 30px;font-size: 14px;font-weight: bold;">é‡‡è´­å•æ€»å·®é¢ï¼š</span>
                                    </td>
                                    <td style="width: 20%;text-align: right;">
                                        <span class="fr" id="chaeBFB_span" style="height: 30px;line-height: 30px;margin-right: 10px;font-size: 14px;font-weight: bold;color: red;">${(chaeTotal/oldTotal*100)?string("##0.00")}%</span>
                                        <span class="fr" style="height: 30px;line-height: 30px;font-size: 14px;font-weight: bold;">ä¼˜æƒ æ¯”ä¾‹ï¼š</span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <div class="all_chk_left" >
                            <#-- <div class="chk">
                                 <input type="checkbox" id="checkall" value="å…¨é€‰"  name="cartIdAll" />
                                 <label for="checkbox-1-6"></label>
                             </div>-->
                                <div class="shopping_total_left" id="J_leftBar">
                                    <input type="checkbox" id="allCheckDown" value="å…¨é€‰"  style="margin-right: 20px;/*margin-top: 29px;*/float: left;">
                                    å…¨é€‰
                                </div>
                            </div>
                            <div class="f-fl moretip" id="tip_notice" style="margin-left: 80px;"><#if pager.pageCount &gt; 0 && pager.pageCount != pager.pageNumber>æ»šåŠ¨é¼ æ ‡æ»šè½®åŠ è½½æ›´å¤š...<#else>æ²¡æœ‰äº†...</#if> </div>
                            <div style="float: left;">
                                <a href="javascript:;" id="checkout_buy" dd_name="ç«‹å³è´­ä¹°">
                                    ç«‹å³è´­ä¹°
                                </a>
                                <a  href="javascript:;" <#--onclick="judgeAuth('${base}','addCarts',goToGoodsCars.bind({}));"--> id="checkout_addCar"  dd_name="åŠ å…¥è´­ç‰©è½¦" >åŠ å…¥è´­ç‰©è½¦</a>
                                <a  href="javascript:;" id="checkout_export"  dd_name="å¯¼å‡ºé‡‡è´­å•" >å¯¼å‡ºé‡‡è´­å•</a>
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

        //ç«‹å³è´­ä¹°
        $("#checkout_buy").on('click', nowBuy);

        //åŠ å…¥è´­ç‰©è½¦
        $("#checkout_addCar").on('click', addCars);

        //å¯¼å‡ºéå¹³å°é‡‡è´­å•
        $("#checkout_export").on('click', exportPurchaseOrder);

        changeShoppingCartTotal();
        $(window).scroll(function(){
            changeShoppingCartTotal();
        });
    });

    //è´­ç‰©è½¦ç»“ç®—æ•ˆæœ
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
     * Desc:åŠ å…¥è´­ç‰©è½¦
     * */
    function addCars(){
        //åˆ¤æ–­æ˜¯å¦å­˜åœ¨é€‰ä¸­çš„å•†å“ï¼Œå¦‚æœæ— ï¼Œä¸è¿›å…¥ç»“ç®—é¡µé¢
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

                    //ç»„è£…è§„æ ¼
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
            layer.alert("è¯·è‡³å°‘é€‰ä¸­ä¸€ä»¶å•†å“!",{icon:7});
        }
    }

    /**
     * Desc:ç«‹å³è´­ä¹°
     * */
    function nowBuy(){
        //åˆ¤æ–­æ˜¯å¦å­˜åœ¨é€‰ä¸­çš„å•†å“ï¼Œå¦‚æœæ— ï¼Œä¸è¿›å…¥ç»“ç®—é¡µé¢
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

                    //ç»„è£…è§„æ ¼
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
                    //1.å…ˆä¿®æ”¹é‡‡è´­å•æ˜ç»†çš„æ•°é‡ä¸è§„æ ¼
                    $.ajax({
                        type: "post",
                        async: false,
                        url: ${base}/+"purchaseOrder/ajaxUpdatePurchaseOrderDetails",
                        data:{'goodsIds':goodsIds,'oid':oid},
                        datatype: 'json',
                        error: function () {
                            layer.alert('ç«‹å³è´­ä¹°å¤±è´¥ï¼',{icon: 7});
                        },
                        success: function(result) {
                            //2.æ ¡éªŒåº“å­˜æ˜¯å¦å¤§äºè´­ä¹°çš„æ•°é‡
                            $.post("${base}/member/stockJudge",{o:oid,createOrderType:1},function(d){
                                if( d.success == "success" ){
                                    if("SUCCESS"==result.status){
                                        //3.æ‰§è¡Œç»“ç®—åŠŸèƒ½
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
            layer.alert('è¯·è‡³å°‘é€‰ä¸­ä¸€ä»¶å•†å“ï¼',{icon: 7});
        }
    }

    /**
     * Desc:å¯¼å‡ºé‡‡è´­å•
     * */
    function exportPurchaseOrder(){
        //åˆ¤æ–­æ˜¯å¦å­˜åœ¨é€‰ä¸­çš„å•†å“ï¼Œå¦‚æœæ— ï¼Œä¸è¿›å…¥ç»“ç®—é¡µé¢
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
                    $("#checkout_export").text('æ‹¼å‘½å¯¼å‡ºä¸­...');
                    $("#checkout_export").attr("disabled", true);

                    var loadindex = layer.load();

                    $("#checkout_export").attr("disabled", false);
                    $("#checkout_export").text('å¯¼å‡ºé‡‡è´­å•');

                    window.location.href = "${base}/purchaseOrder/exportPurchaseOrder?type=1&purchasOrdereId=${otherPurchaseId}&purchaseIdNum=" + pdIds ;
                    layer.close(loadindex);
                }else{
                    layer.alert("å¯¼å‡ºå¤±è´¥!",{icon:7});
                }

            }catch (e) {
            }
        }else{
            $("#checkout_export").attr("disabled", false);
            $("#checkout_export").text('å¯¼å‡ºé‡‡è´­å•');
            window.location.href = "${base}/purchaseOrder/exportPurchaseOrder?type=1&purchasOrdereId=${otherPurchaseId}";
        }
    }

    /**
     * Desc:æŸ¥çœ‹é‡‡è´­å•æ˜ç»†
     * */
    function getOtherPurchaseOrderDetail(id,otherId){
        if(!isEmpty(id)){
            window.location="${base}/purchaseOrder/getPurchaseOrder?type=2&purchaseId="+id+"&othserId="+otherId;
        }else{
            layer.alert("æŸ¥çœ‹å¤±è´¥!",{icon:2});
        }

    }


    /**
     * Desc:å•†å“æ•°é‡æ‰§è¡Œå‡å»æ“ä½œ
     * @param goodsId
     */
    function reduce(goodsId, pdId) {
        //åŒ…è£…ç³»æ•° TianYu 2016-2-17 09:19:00
        var defPackageModulus = $("#defPackageModulus_"+goodsId+'_'+pdId).val();
//        alert('åŒ…è£…ç³»æ•°='+defPackageModulus);
        //é™è´­æ•°é‡ TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+goodsId+'_'+pdId).val());
//        alert('é™è´­æ•°é‡='+defLimitNum);
        //é»˜è®¤èµ·æ‰¹æ•°é‡
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+goodsId+'_'+pdId).val());
//        alert('èµ·æ‰¹æ•°é‡='+defStartBatchNum);
        //é»˜è®¤èµ·æ‰¹ä»·æ ¼
        var defStartBatchPrice = parseInt($("#defStartBatchPrice_"+goodsId+'_'+pdId).val());
        //å½“å‰å•†å“æ•°é‡
        var nowGoodsNum = $("#nowGoodsNum_"+goodsId+'_'+pdId).val();
//        alert('å½“å‰å•†å“æ•°é‡='+nowGoodsNum);
        //å‡1ä¹‹åçš„å•†å“æ•°é‡
        var reduceGoodsNum = parseInt(nowGoodsNum) - parseInt(defPackageModulus);
//        alert('å‡1ä¹‹åçš„å•†å“æ•°é‡='+reduceGoodsNum);
        //æ˜¯å¦æœ‰æ‰¹å‘ä»· 1:æœ‰ 0:æ— 
        var ifBatchPrice = $("#ifBatchPriceId_"+goodsId+'_'+pdId).val();

        //å¦‚æœæ•°é‡ä¸æ˜¯åŒ…è£…ç³»æ•°çš„æ•´æ•°å€ï¼Œè‡ªåŠ¨å¢åŠ æ•°é‡åˆ°æ•´æ•°å€
        if(reduceGoodsNum % defPackageModulus != 0){
            reduceGoodsNum = (parseInt(reduceGoodsNum / defPackageModulus) + 1) * defPackageModulus;
        }

        //å¦‚æœé™è´­æ•°é‡ä¸ºé›¶ï¼Œè¯´æ˜å¯ç”¨äº†é™è´­æ•°é‡
        //è¶…å‡ºäº†é™è´­æ•°é‡ï¼Œè®¾ç½®æ•°é‡ä¸ºé™è´­æ•°é‡ï¼Œå¦‚æœä½¿ç”¨é˜¶æ¢¯ä»·ï¼Œä»·æ ¼ä¸ºé™è´­é™è´­æ•°é‡æ—¶çš„é˜¶æ¢¯ä»·
        if( defLimitNum != 0 && reduceGoodsNum > defLimitNum){
            layer.alert("å•†å“æ•°é‡ä¸èƒ½å¤§äºé™è´­æ•°é‡!", {icon: 7});
            $("#nowGoodsNum_"+goodsId+'_'+pdId).val(defLimitNum);
            changeInputPrice(goodsId,pdId);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+'_'+pdId+"_nowPrice").text("ï¿¥"+parseFloat(data.batchPrices).toFixed(2));
                            $("#price_"+goodsId+'_'+pdId+"").val(parseFloat(data.batchPrices).toFixed(2));
                            changeInputPrice(goodsId, pdId);
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//æœ‰æ‰¹å‘ä»·æ—¶
            //åˆ¤æ–­å‡å»ä¹‹åçš„æ•°é‡æ˜¯å¦å°äºèµ·æ‰¹æ•°é‡
            if(reduceGoodsNum < defStartBatchNum){
               4dç¦7dT«ÛÍï'ãò¥úñìı2®\rÖÃSvJîv:31aÕèÜ–ø £Kö×÷¦Üˆ7H}ˆŒİKut¯4o¶“±gÙÖz½>BÆ¾åÚXÈgµƒË¸6-ñÑe˜éßÄz+?FÆ¥KuBXİÉ¦SÉ":||{/½çöp'úÄ2vÏç…ë+°#?œw‚ÒÉrRuÓc~t”áÒÄšw5>…³¶˜†\›º,,ñi¤!ÕJ—‰%>ƒS¨LƒÏâFåş)ü¨/¦=9.ïèvìóîa‹º/‹;9.ïÆ/q^œR&:_”Wà"Šúô‰Œ‹cÔ—2Î–¸·ùõ’Ú,ñexp1uÕ,ñ2.\JÕ!G(Õ¼Êã_ç';–øÃKw`<g‰¯ÇÛ®rŞ7ÈØ5PÕqHNıöz|“ŒK–èÁî2K|+~Ïş©bá`f<£¨ª‚±Ä·ÁÅ^DÚÈİÀû{¿ówy0{É©ìû=2Îò[dJÂLg&3å’«ó}|F/bÈ£JKü iIL®ávû!<2°Ù§Šcu½4òGˆ—åè_g±ÄÉ¬$“R“äOdç®5kç'±ãÚÖŸrò¦!?ùIKül Æ82»"Lú9\¼FY•–Xâ| \ò0‚:•­”d¨ùeX©YPãWğ|@#¸š_£\Øì­è7‹j¹«ú-¿2#Z•ı.`w&]ÙïÃ‘•ı!°2hWöÇ€Í¡foeZTË]ÙŸ+kVöäÇ¼ÔÖü$4•,"WÏzø¢ (‹å¿¿GÕœKöL¹â\Yÿ@næÙ"³Â™:7tngx³TNæS-ÿBŞÇ(Ç?në¿ÁGŞØåBeAğÜÿÙ±º¢â’¾ÿÂÇ}J3ÜYŞÒq™¹w–I¨X¼ïñ@ırUjã0Ëì-e[¦‰­ĞRU7¨ZÈ2Wq²+F–`™+á&rP2;Ìg„õsçª–›¥Ş6,sCqC$Q’Ê\¹ ª‹dÖ2-8ƒkÊË©ÕL–ªãD‘¹Ô½˜VŞÙ°}Ü·¢®¼J–yrÈ,µ*—ƒù'–¹–ùJ¶«àµÌuHT"â¡’¶ÌS°iºgg–yª¿ Ş0ä—Íõdœ§¨ƒÑÓÛàïšŒ%ËÜèïšÄìÚ&ßÕJ#ŞÕ›}Kcµ<Woñ]í)ú®>Íwµjìê­¾Ï©Ú¨ö3N`î;;†¯,sÊh·='kSË<×Š+’÷cãoGı eìD;·”:WÊ4XÅ“óL0·îÅ®/ËÜ“•«Ë”ïBn#|Ÿ‘ÃÉ¬ş8Û÷–×¤o%´CÆ©ºÕ?˜;ÉX«…N
ië«iWAx1®pH¿ş`Qng™Cà‡°^Iîª³àó‘Î„›µùá}-®£Ø@rİe–y¡I¶jØ°!ÇâuëvË¼Ø·9Ğ2tĞÎb3.!coÌÖÊ5ëg>×ÉRt/õ÷7 ßEÆCù˜8+ñ“qÍ2ĞÇ(~Œ2Æ…¬7»ŠİpÏİdì_¬§;mlç=¨¢b:ë7\§†3/ãÜ'‹Ì,Ë‹‘Œš	2®ˆEuW6älùv«¤¥8
£~Œ{µ²9¡
äöS6¸_jîÅ}Eris¢0¬•I;w¢œ]ß“–¹‡—…'ŸérúØ¦¡„e^>o,ßPÀÍ…şWJóA¹Aå£¢÷xÄ®Â¹ŸÈØÙt©ª.-ójœÍ¸”÷º†Œ}‹ë¸¹½J	JÈ[ªÀ2ïBÆåK÷ÕêUeÔ*òMèzË¼«¼tqÉ§Êp§¶8	şDZ£}’Íäd9f™ã(T"â!ye¸×FÕMí,3…B%V9ğğıc}Ò(†£}RIVÉIÆQá’²a¨
ßR59¥ê$ùV`N¸;î§` ŞbÉ–7é¤»s^£>±s©ƒ…Ò±b2?‰q2'd.Êv}Á_‹5ĞèéæudìoÓ—»LGÃIAĞI]êÁËyò*:U¸eæ7è£Ş-3èÕNê•;)§*ÈüC&Ü.1NI÷Şû„y=nZ/_—™ÇÅEù¹Ã+úäU˜@†PÈeR–Yâ©L1UÉ&‹®›Ë¸‚œÒ×ÛSïK)T`±·7Ò(
Øá{ú°'ç¯æaĞ]\Ëû²Ğ>¢ŒÊûÛ7ìpğÃ‡¿ûw—™kv2.Ğ8äøÈy”W*–yO2vR÷Şã^‹Là÷È”ÔÎXf•ŒÄ²Ôk;éô»7ÂxP?GU³·­æ>º9¬¾Ê§İg±€<ğĞíÇuŒb”·'Y‡°Pœ	ŸR~±6ÈĞ˜š…ÔQÜBƒºÄ}01g‘:‚á®ÿA­î!mb¹uÔeå¾[æØÌÅuqÉªÄÄ?Dòİ¾“x?¥/é=p3Zf+ì¾Èd‘“:‡ôg`—RJí^ü¦·³P÷t"€í~aµX'şÚjÎ/¶çSœ„‡óÍd\½Œ.Ş×ˆbÔÄ.£ƒ‡w”£é#Óû¿;jOöÿïj%–¹°ØæÅvtıtÜå~únqKMòN 
kñç WïÖ¥ôôiº<RïÂ~Yv_şÎ¦Ú‡õ~ ÏÂÙàs‘eŞeò@íÀ¸€wBo¤–ù@ŒëG¸@¯aÁLzævŸ½,ó!á}ÍÀˆE1÷úPzüÌËh¾óÇ ñmCnB`™RªÃ£<‡{ÀËj6²¶G-©ì-Ö2pD@9°ÆÇğ€ºVæ ¡Q6iGì}Ü"»Æ²ÌÇ‡°kOà/ñìe7Ë÷Ğ2ŸØ\_-0Ö“ºÇ&°'O&ÃB1t8—•oO!ã$‰JË|*ºxïò4LÓ0¤æv¼h™OG%«Ë'tÿd¬/¤R•b‘§iÏD–ª¡e/ük™ÏŠÕĞe„šüÙÜB?ÏCã”sËUr–ù£K(aTdÓÏg,¥ˆÿS¾Wv•\[5´Ìç-w¬BáÆ£;Äó5q	°ó(q^€ ]ZoÈyÄz!’£å(»ßmÍHÃCô+ç‹ÉØ¿í˜r~	–Ñ9)é¿i|tÀ /Ez°ŒØ·wóeÈÆ–ÛÅm–}9v¶¿ù’*“H¤^²`Q•¡ĞÇó•H5ô(Ú2(°¯ÂY ã|o5_=x^¥1Iù^ƒ{<®‡7ék/­àœš×‘qşJîB_Ï½£ZÉCyJf(Å@Õúşõ)ÚÏ­†ß¸¸¹Õ¬¼2Ş4à6`JÎºŞ¼øºPtŠË¨xêºe©:#¿•Œ=ËVw¿7›oCš½ü^Úão'cßò;±[	×ö;È¸jy}íÛmşÎ+ïô¿dÅÕh–ù®PÏ;ß.ŸÃcÛÏ½:§|7"g€¶ª µÚ{äs~¼šS0k½÷Ê÷úøÊÚy…wp6|§õûø§F¾À÷sš¿á j|ç[c ÷ÀßÉü‘JüıA2ÖÊBpß˜şTl~ˆŒUã…BÖNBõÃd¬H+·~â´ÊääR>ŠÒ…ŠÚ§!7HWŠ:×ş8+'²y—}‚ŒÕíÃî¸w’aª¯@ŸÄHòmnR~“ú&p>-ò“–ù™_¤îù,”ó¹rá:;o	äD+õ‡•Ïá§~\ú<ê—¥ş¼Šı…	+â¿ K…$â´˜„…_$ãdça\3Ó—ÈXç~ˆ.Â^Ü _fuìXò26Â½vñş@¦å_•ûªŸôCû×ÈØád”“8ôëLY?È~^¸ªÙnö¯ã.ºøÜ“êÌ4PTd›íF~anºÑ-×¦[ùç¦z­u¨ÖmJ¬…+úÇš(&ÏËvº³»kóµú±Æîs­éF­İÛ}x®ew»®±w€Œ5¥ÎB·Ş˜hªá­#òOY×Š—pÓÎ%ÇB¶æÿékaúÆFué–fûx­Õœ™éÔæíşHÿÖyL´¾^k·;ı‘V§63rTÍ½¥q¢Ş˜ï7;m%m¶gGº-ÌìËË?³‘ızóón¿13rc¢·¤N/q#6x¡İ¼¹Öï÷æu¸²~¼>\ëõ½Ş0„(Ú7…$#—$È8…I-¬èô  Zò£RwjB×æôB¿áÎáâ‘Ë"’1l´’,HàG½37ßjœvœ´9,IÈAâÄ˜}KŒx¬6@>=@^ Ÿ‰Ÿv4N<*<-FœÜ û7FÆ´p¦Ö¯IÁ°
%=DP(7Œ­ñÓz×"-j«d“ÚÚÕú—ÊûËNv«•­óQ"‚¹ö˜lemk}4ZÂé tCTÂ½r`9Ø† $^šfFïh£ó×­É3âúqk¬|dZO}´Voô]]åÀ£İZ]*¦›³Í~Ïm²dú%ôˆÍœófÿVlf»×ïÖšmøvû€ÇK;·ª-Ò{TV£=Û?æÚ´9,r$Nì†^@œĞQ6W;aŸ¨·zÍãÁğCC¦jØ¤²S¶ÆHY¸F[Ü³nñlj¶ØÔl°©Ù³)(å6EZ<›B-	+s`€Öğl·³0¯Ão¾Öí7ë­†ŞÊ»R[å‰pÕqØàHûıF·ØÈn£×iaMMõÿmUw¯Ö^S^ú²Tæõ;ıZ+&:•5îOïŒÜÒlÍÔk]×.n×æ=´¾Ê›«U»£nCM~J¯‹;[ò—:6¸”€]ü,İº©¶0¬˜©ÊEHOFbP‚§'Äİ&"ãáşÜTõm‰‘Êm9IÊ%m[Îi¹ûSŞlòg£Õ<®­‘T\ÏqBMk}Q"4ŒX«ğ‰ùnc¦q)aì•²FµÌI×¶5eôËDél‰ZÍ^¸ÙoÌ•åßéêx)«XPv¨¨u²9$©bzìí6%^hõ›2ÖØmÙÓ~ôÚtäöôüğX-áÍ2¦t“ZR9m†GöÖ"’i½ıdŸsN£Â„ö·'Ü¯øÇ©ó£}­Ñ&;WcD‚ºØ‡§k½xWÎÚÆd$Q‹NÇGã4GİxæBDïi¬=™ÇF0`H6 ŸƒÅs•£G/h¸»ş?µ6<ßíÌ÷Eİ®JO7„$Ò‰™d˜Úl¸ëÆ°HßˆPun‡;¯Çu
zm6Z3½á¤c=%	›’8ü5c=¼†UïÃ!j49Xim«…S1‡3¡nÖ D†P-^,·',VŒ eóó­f]ÎÉ:@ÉoÁqÄyè)Ë×j‘Ú3­Q?ÖiÖÃ]Ô=A½?<Óè‚¾f†;7ÉäÛ‘5Nôí™6ÎÀ¶1'§ŒŠuNnpµõ…£.ÜêFS>jÜ¼Ğ<>\o!Å—Y'ñíÂ©K
C“º(†s(=t=&¥êâéÅÛ™kÖõ„íÎp½Ù­/´j]Ç=í•v7ÃtsVf’ö†{Ó½F_Oá²¤^ƒöº'u¯dî8¹S— ¥×¸9àê^ĞÕëµÌíç:›‹÷m‰ˆË>V>=@^~Ô‰çænØw´¶ ó-™“ûn“'œĞØ°È	°×Î6å'%VÛíİÈD¶IƒÎÜšp¼·c1Ä¢ícKô[¢ÿŞ%,ÜëÈÎÅ4tÑ±è,‰%fYj{å¥yÖ¢íµ¥¦—RõU#r¿6bè ,“UiDƒvğJª+/01ËvD*­`dª®X.KÆ9q¥W¨¿.`üİ+ p‘ñê&Øï¬hTØ¨u¸¶Ó9Ts„ÎK¨Š	¶®Ÿ‹òjX¤6anv&¬¸+Pµä{Lÿ¨¯µà½¥çPçë‰WA‹wŠ¬øYÙxçPÚ¶- ÅMp,ZÔÃøoÛCÅ[p˜S#IŠÊ:1×’Du’üÙkBk>¬µi>¼]ªŞ‰J±–" Å7kÜŸRÛ²ˆéÖeš«Í'Û3¥…9ì~H¢òß°L¥ !îM0ôR™®¥ÄH»ÅÉäcä{È÷!ˆ“ï¯j€ı§è†Rª3‡\‡&(P·º+*6êH¹RÇõ›RHz›mìtÿV6JI'ëƒ•'8"=†·«s’(ÂËŞb´,ÙËtŠ¬õ†lí„·i¾(:@¥İéâ6—Yëéñ²Ïƒš¤•ƒåóÒàÆÚb]GeÙR?9™SœES’°HxZD8¦_NcÎ0îYö’ğ‘·Ğy¿%lÍ™·Cf_’ÏqNªµo­3ÈZe‘¸ol±ÕEd­šîtZ4VÌÔäëÇª™F½9Wk¡ËLgA¥ÅÖÌBWÓàÊ£­ŒâÕÇ'Ü!LUÏ¯’õÂl£‹d-ÿé´g/Bªv^y½şWWçG^Œ±¢cÍiYŸğç˜Õ½N‰q·†©NvêÈ£Í2šÖ¹¯M]LŒX\;×ìÉzsØ)Ö7Â®L‘Õ³±#\§?i¸µèæ F"Ú¯5[LM`+vÂ0ƒ
Æ6c…±ÒÀ²²UÀÃ«×0|2ğZ†×ŸÂğ©ÀëŞ ¼‘áMÀ›Ş|Ã[OgxşwÃÛÏdxğYŸ|Ã;Ïeø<à!†Ï¾€á/bøbàK¾xÃÃÀ#ïŞÃğeÀ	†GÇŞ¼áıÀ—3|ğ• ¾Šá«¯aø.Àwe8	<Îp
8Í°<Áğ$ğA†3À×2|p–ápŞ(xx
øz†‹À%†ËÀ†ßÀğaà#ßøîßøß¸Êğ½kO×n0|x–ácÀM†o¾‰áğÃmàÃóÀ73Üî1Ü^`ø8ğ-Ÿ ¾•áû ß—áûßŸá ?á?˜á‡ ?”á‡?œáG ?’áG?šáÇ ?–áÇ?á' ?‘á'?™á§ ?•á§?ág ?“ág?›áç ?—áç?Ÿá ¿á¿˜á— ¿”á—¿œáW ¿’áW¿šá× ¿–á×¿á7 ¿‘á7¿™á· ¿•á·¿áw ßÆğ;ßÅğíÀïfø=Àïeøà÷1ü~à0üAà1üaà0üQà1üqàO0|'ğ'şğ§şğgşğçşğşğ—ş
ğWşğ×şğ7şğ·şğwşğ÷şğşğş	ğOşğÏşğ/şğ¯şğoşğïşğşğŸşğ_şğßşğ?şğ¿şğ}L†±ˆa0(™¯ ^ÉğIÀ«¶€W3¼ød†×¯cøàS^¼áÀ›Ş¼…áÓ€·2|:ğ6†Ï ŞÎğ™À;>øl†ÏŞÉğ¹Àç1<|>Ã _ÈğEÀ3|	ğ¥ïfxx7Ã{€/c8<Êğğ^†÷ïgørà+¾ø ÃW_Íğ5Àwaø®ÀI†ÇS§m†'€'>œaøZàëÎçÎÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãÿãşŒÿ!Ø&ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿğ¿`ü/Àÿ‚ñ¿ ÿÆÿü/ÿ‹—áÉ?!Ç_	Én‰ñïÊKn3@ÜRåUøïIJ¸Q¼ÿ]ë(ˆ×ˆ×â_¯SZ¯ÿPK
    :k¶6fÿíÍ  	  &   org/apache/xmlbeans/XmlException.classVisÓV=ÏK”ÈÊNBq)!!Ş‚)] „B¨	àà ÍnT1Â•%F’ÛÀOé¯ 3míÃ'>ôG1Üû$ÛJbCìñ}Û½çÜí½äÿ·ÿ¾pTŒâ‹¯Y\V1Œ9#¸¢â\åÙ5ó*zqw¾í£’ŠX`q“Å­n£ÌbQÁKCášºµn¸éØkåbQ ¿äØ¯Ûşºn5Œ$‚P®ë¸YVë¿éÅ†oZÅŠéùs=WLÛô¯
Œe‚CK·kÅß5íÚ\v] QrƒÓ6î6êÛ†»ªo[´3Rqªä…N¾Ğ:ÜLø;&MV·VÔŸèÕ£¸[·¶İöŠ›uka·j<ñÉm¢u9D*ëàJdguÇu~g:éŸğÉ÷§eºšÎtu‘“%u’2o§Ş¯*pû¨˜sşÈPíR–Ë2ª2«ÑÓ,÷xgB×à—¶oÖv™pt÷ğ@öÈ½5Ã_’9‘éjØLg_SÛãf»E¡®8·jÜ4¹ñ†£Íu-4|Œ“,¦XÌh¸‹{<Ë+¸¯á;,ó¢@Ñµá¯»®ş”/­hXÅš†H+X×°Áæ›ØÒğ¾Tğ½†ğ£†Ÿğ³ÀÉ÷ED1è64½5ìöúNĞÇš‰ØWÆ:%‡òÖïÑ¹eøÍñLEûêŞöcRœË~Ndº÷ÕPÃ®;ÍGò¾¨“™ƒ0gØ'TQ*ü’áyzÍz¦¤7<šß{ô†ìg£È3Ÿ‘E<“-“$~ÙÊÙÃÁã4½·£ôBÆÆ1Œî‹\§Õœæ}´G=DòZ]¦ı=¹üÄŸR÷¯é8‹OI˜ tÈÙ$ÎĞ9ãL…8ˆÓPrùÂbòh"Pi)!Ï¦‰,&!g:¹?ˆx¾‹kŒ¸–	qJHH­T.ÿ‚À’m0U]¤ñR0ÕL!‹\˜70 f_ gÊAÀk4ÎKÀ\ lÆœ
cn’Ä%I!$±C’tĞÙ7Éı‡Ş­Ù=ô½€ú7RmÎ©y‹¢/ï"úN„;İâN·¸Ó-î4fq.ä.†ÜÙq¥¦9cıúÉ–
M7
Üÿ}^††5ú·`ƒºo“úc+Rúé–+ÓTÀÏˆn˜º”àÒ_Àç¡krœÉı…Ôòğƒ )ó*şC1¼Æğóı€¤ø…Ú_'êª¤Õ˜Vğ#ReQ$£µA‚æú5bœl%µ.¾PK
    :k¶6×Ğ~    6   org/apache/xmlbeans/XmlFactoryHook$ThreadContext.class•’_OAÅÏ°m·][Š€ø*l«² ¢/MÆF!D|˜n§íâv×Ì.?‘¯¢II$1¼™ø¡Œw¦+B5Z_öÎÜ¹÷7gÎŞoß?°†õÆ±d¡€Š‰Û—U\QIÇ‚ª‰šÚP¼câ.ƒ•t¥à­­(zÍ0ÓØço¹ğ°ãîè|#òxğÁìˆdP³ìT‘ì¸ü÷ºÂ=ìMÁÃØ}Ù6¹—Dòª£–L=j	†bÃÅ³ƒ^SÈŞ(3©¡»\újŸ&Í8j'/D›aáœ)Úîöà@HzBI‰JYqFQRİ%-]İPMynÃıä1ƒáèæ¤ëÇGêQ˜ˆÃ„Á~†BÖÇ‚ïÀ®\@ĞMù/Hï²¶£é‰M_¹1u±oU9bc—lÜÃ*Ãü_,bXü·spmW­æÊüókÿû*†Ò/Ôóæ¾ğ(eĞø0LÓèŸ‘	eç÷¬òİ uši›Æ›Rï§U†Æ·ˆe.Ón‹"£8÷¬±SOk_a²÷°j}dN‘ı@§‚æœé™è´­æ•°é‡ä¸ºé›¶ï¼Œè¯´æ˜å¯ç”¨äº†é™è´­æ•°é‡
        //è¶…å‡ºäº†é™è´­æ•°é‡ï¼Œè®¾ç½®æ•°é‡ä¸ºé™è´­æ•°é‡ï¼Œå¦‚æœä½¿ç”¨é˜¶æ¢¯ä»·ï¼Œä»·æ ¼ä¸ºé™è´­é™è´­æ•°é‡æ—¶çš„é˜¶æ¢¯ä»·
        if( defLimitNum != 0 && addGoodsNum > defLimitNum){
            layer.alert("å•†å“æ•°é‡ä¸èƒ½å¤§äºé™è´­æ•°é‡!", {icon: 7});
            $("#nowGoodsNum_"+goodsId+'_'+pdId).val(defLimitNum);
            changeInputPrice(goodsId, pdId);
            if(ifBatchPrice == '1'){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxGetGoodsBatchPrice",
                    data: "id="+goodsId+"&quantity="+defLimitNum+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            $("#"+goodsId+'_'+pdId+"_nowPrice").text("ï¿¥"+parseFloat(data.batchPrices).toFixed(2));
                            $("#price_"+goodsId+'_'+pdId+"").val(parseFloat(data.batchPrices).toFixed(2));
                            changeInputPrice(goodsId, pdId);
                        }
                    }
                });
            }
            return;
        }

        if(ifBatchPrice == '1'){//æœ‰æ‰¹å‘ä»·æ—¶
            //åˆ¤æ–­å‡å»ä¹‹åçš„æ•°é‡æ˜¯å¦å°äºèµ·æ‰¹æ•°é‡
            if(nowGoodsNum < defStartBatchNum){
                layer.alert("å•†å“æ•°é‡ä¸èƒ½å¤§äºäº100000!", {icon: 7});
                $("#nowGoodsNum_"+goodsId+'_'+pdId).val(defStartBatchNum);
                $("#"+goodsId+'_'+pdId+"_nowPrice").text("ï¿¥"+parseFloat(defStartBatchPrice).toFixed(2));
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
                            $("#"+goodsId+'_'+pdId+"_nowPrice").text("ï¿¥"+parseFloat(data.batchPrices).toFixed(2));
                            $("#price_"+goodsId+'_'+pdId+"").val(parseFloat(data.batchPrices).toFixed(2));
                            changeInputPrice(goodsId, pdId);
                        }
                    }
                });
            }
        }else{//æ— æ‰¹å‘ä»·æ—¶
            if(addGoodsNum >100000){
                layer.alert("å•†å“æ•°é‡ä¸èƒ½å¤§äº100000!", {icon: 7});
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
     * å‹¾é€‰checkboxåˆ¤æ–­æ˜¯å¦ä¸ºæ‰€æœ‰å…¨é€‰
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
     * åˆ¤æ–­æ˜¯å¦æ˜¯ç©º
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
     * è®¡ç®—æ€»å·®é¢
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

        $("#chaeTotal_span").html('ï¿¥'+parseFloat(chaeTotal).toFixed(2));
        $("#oldTotal_span").html('ï¿¥'+parseFloat(oldTotal).toFixed(2));
        $("#ptTotal_span").html('ï¿¥'+parseFloat(ptTotal).toFixed(2));
        $("#chaeBFB_span").html((parseFloat(chaeTotal)/parseFloat(oldTotal)*100).toFixed(2)+ '%');
    }

    /**
     * ä¿®æ”¹å½•å…¥ä»·æ ¼
     * @param id
     */
    function changeInputPrice(gid,pdId){
        if(!isNaN( $("#inputPrice_" + gid+'_'+pdId).val() )){

            if( parseFloat($("#inputPrice_" + gid+'_'+pdId).val()) > 10000000){
                $("#inputPrice_" + gid+'_'+pdId).val(10000000);
                layer.msg("å½•å…¥ä»·æ ¼ä¸èƒ½å¤§äº1000000",{icon:5, time: 3000});
            }

            var inputPrice = parseFloat($("#inputPrice_" + gid+'_'+pdId).val()).toFixed(2);
            var price = parseFloat($("#price_" + gid+'_'+pdId).val());
            var num = parseInt($("#nowGoodsNum_" + gid+'_'+pdId).val());

            $("#chae_" +gid+'_'+pdId).val(((inputPrice-price)*num).toFixed(2));
            $("#chae_span_" +gid+'_'+pdId).html(((inputPrice-price)*num).toFixed(2));
            $("#oldTotal_" +gid+'_'+pdId).val((inputPrice*num).toFixed(2));
            $("#ptTotal_" +gid+'_'+pdId).val((price*num).toFixed(2));

            //æ›´æ–°å•ä»·å·®é¢
            $("#priceCha_"+gid+'_'+pdId).text(parseFloat(inputPrice - price).toFixed(2));
            calcChaETotal();

            //ajaxä¿®æ”¹æ•°é‡å’Œå½•å…¥ä»·æ ¼
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