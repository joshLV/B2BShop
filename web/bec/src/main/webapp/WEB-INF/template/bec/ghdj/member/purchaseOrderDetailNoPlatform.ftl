<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
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
</style>
<div id="container">
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/purchaseOrder/list">采购单管理</a></strong><span>&nbsp;&gt;&nbsp;采购单</span>
        </div>
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="purchaseOrder_list"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>非平台采购单</em></h1>
            <div class="user_right p10" id="bindallcheckclickId">
                <#if type = 'noPlatformGoods'>
                    <div class="user_t">
                        <div class="user_mt">
                            <ul class="extra-l">
                                <li class="fore-1">
                                    <input class="btn-5-new" type="button" onclick="getOtherPurchaseOrderDetail('${purchaseId}','${otherPurchaseId}');" name="" value="查看平台采购单" />
                            </ul>
                        </div>
                    </div>
                </#if>

                <div class="tb-void" id="show">
                    <input type="hidden" name="basePath" id="basePath" value="${base}"/>
                    <input type="hidden" name="purchaseId_ss" id="purchaseId_ss" value="${purchaseId}"/>
                    <input type="hidden" name="otherPurchaseId_ss" id="otherPurchaseId_ss" value="${otherPurchaseId}"/>
                    <input type="hidden" name="pageNumber" id="cur_pageNumber" value="${pager.pageNumber}"/>
                    <input type="hidden" name="pageCount" id="cur_pageCount" value="${pager.pageCount}"/>
                    <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="goodsDataTable">
                            <tbody>
                            <tr>
                                <td width="75">
                                    <input type="checkbox" id="allcheckTop" class="s_checkbox" style="float: none;margin-right: auto;">
                                </td>
                                <td width="225">商品条码</td>
                                <td width="270">商品名称</td>
                                <td width="150">商品价格</td>
                                <td width="150">商品数量</td>
                            </tr>
                            <#if purchaseOrderNoPlatformDetailList?? && purchaseOrderNoPlatformDetailList?size &gt; 0 >

                                <#list purchaseOrderNoPlatformDetailList as list>
                                <tr>
                                    <td width="75">
                                        <input type="checkbox" id="checkbox_${list.id}" value="${list.id}" onclick="ifAllCheck();"  name="noPlatformGoodsId"  />
                                    </td>
                                    <td width="225">
                                        ${list.goodsBarcode}

                                    </td>
                                    <td width="270" style="word-break:break-all;">
                                    ${list.goodsName}
                                    </td>
                                    <td width="150" >
                                    ￥${list.inputPrice?string("##0.00")}
                                    </td>
                                    <td width="150" class="shop_grey">
                                        <input type="text" name="textfield" id="textfield" value="-"
                                               class="shop_add" readonly="ture" onfocus="this.blur()"
                                               onclick="javascript:reduce('${list.id}');">
                                        <input type="text" name="textfield2" id="nowGoodsNum_${list.id}"
                                               class="shop_number" placeholder="1"
                                               onblur="change('${list.id}')"
                                               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                               onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                               value="${list.quantity}"
                                               onchange="change('${list.id}')" ;>
                                        <input type="text" name="textfield3" id="textfield3" value="+"
                                               class="shop_add" readonly="ture" onfocus="this.blur()"
                                               onclick="javascript:add('${list.id}');">

                                    </td>
                                </tr>
                                </#list>
                                <#--<tr class="shopping_list" id="title_reminder" style="background: #f3f3f3;">-->
                                    <#--<#if purchaseOrderNoPlatformDetailList?size==pager.totalCount>-->
                                        <#--<td colspan="4" align="center" style="color: #ff0000;">没有了...</td>-->
                                    <#--<#else>-->
                                        <#--<td colspan="4" align="center" style="color: #ff0000;">下拉加载更多数据!</td>-->
                                    <#--</#if>-->
                                <#--</tr>-->
                            <#else>
                            <tr>
                                <td colspan="4">
                                    <div class="nocont-box nocont-order">
                                        <b class="icon-order"></b>你还没有非平台采购单！
                                    </div>
                                </td>
                            </tr>
                            </#if>
                            </tbody>
                        </table>
                        <#--<table width="100%" border="0" cellspacing="0" cellpadding="0">-->
                            <#--<tr class="shopping_list" id="title_reminder" style="background: #f3f3f3;">-->
                                <#--<#if purchaseOrderNoPlatformDetailList?size==pager.totalCount>-->
                                    <#--<td colspan="4" align="center" style="color: #ff0000;">没有了...</td>-->
                                <#--<#else>-->
                                    <#--<td colspan="4" align="center" style="color: #ff0000;">下拉加载更多数据!</td>-->
                                <#--</#if>-->
                            <#--</tr>-->
                        <#--</table>-->
                    </form>
                </div>

                <div id="hide_div" style="height:0px;visibility:hidden;"></div>
                <div style="">
                    <div class="all_checkbox f-cb all_checkbox2"  id="shopping_total">
                        <div class="all_chk_left">
                            <div class="shopping_total_left" id="J_leftBar">
                                <input type="checkbox" id="allCheckDown" value="全选"  style="margin-right: 20px;/*margin-top: 29px;*/float: left;">
                                全选
                            </div>
                        </div>
                        <div class="f-fl moretip" id="tip_notice"><#if pager.pageCount &gt; 0 && pager.pageCount != pager.pageNumber>滚动鼠标滚轮加载更多...<#else>没有了...</#if> </div>
                        <div style="float: left;">
                            <a href="javascript:;" id="checkout_btn" dd_name="转为询价单">
                                转为询价单
                            </a>
                            <a  href="javascript:;" <#--onclick="judgeAuth('${base}','addCarts',goToGoodsCars.bind({}));"--> id="checkout_export"  dd_name="导出采购单" >导出采购单</a>
                        </div>
                    </div>


                    <#--<div class="shopping_total" id="shopping_total">-->
                        <#--<div class="shopping_total_right">-->

                            <#--<a class="total_btn fn-checkout" style="margin-left: 10px;" href="javascript:;" id="checkout_btn" dd_name="转为询价单">-->
                                <#--转为询价单-->
                            <#--</a>-->
                            <#--<a class="total_btn fn-checkout" href="javascript:;" id="checkout_export" dd_name="导出采购单">-->
                                <#--导出采购单-->
                            <#--</a>-->
                        <#--</div>-->
                        <#--<div class="shopping_total_left" id="J_leftBar">-->
                            <#--<input type="checkbox" id="allCheckDown" value="全选"  style="margin-right: 20px;margin-top: 29px;float: left;">-->
                            <#--全选-->
                        <#--</div>-->
                    <#--</div>-->
                </div>

            </div>
        </div>
    </div>
</div>

<script src="${base}/static/bec/project/ghdj/js/purchase_order/ajaxPurchaseOrderNoPlatform.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $("#bindallcheckclickId").on("click","#allcheckTop,#allCheckDown",function(){
            $("#cartListForm input[name='noPlatformGoodsId']").prop("checked", $(this).prop("checked"));
            $("#allcheckTop,#allCheckDown").prop("checked", $(this).prop("checked"));
        });

        //转为询价单
        $("#checkout_btn").on('click', changeEnquiryOrder);

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
     * Desc:转为询价单
     * */
    function changeEnquiryOrder(){
        //判断是否存在选中的商品，如果无，不进入结算页面
        var selected = $("input[name='noPlatformGoodsId']:checked");

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

                    i++;
                });

                if(!isEmpty(goodsIds)){
                    <#--window.location.href = "${base}/enquiry/changeEnquiry?goodsIds=" + goodsIds ;-->
                    window.open("${base}/enquiry/changeEnquiry?goodsIds=" + goodsIds);
                }else{
                    layer.alert("转询价单失败!",{icon:7});
                }

            }catch (e) {
            }
        }else{
            layer.alert("请至少选中一件商品!",{icon:7});
        }
    }

    /**
     * Desc:导出采购单
     * */
    function exportPurchaseOrder(){
        //判断是否存在选中的商品，如果无，不进入结算页面
        var selected = $("input[name='noPlatformGoodsId']:checked");

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

                    i++;
                });

                if(!isEmpty(goodsIds)){
                    $("#checkout_export").text('拼命导出中...');
                    $("#checkout_export").attr("disabled", true);

                    var loadindex = layer.load();

                    $("#checkout_export").attr("disabled", false);
                    $("#checkout_export").text('导出采购单');

                    window.location.href = "${base}/purchaseOrder/exportPurchaseOrder?purchasOrdereId=${otherPurchaseId}&purchaseIdNum=" + goodsIds ;
                    layer.close(loadindex);
                }else{
                    layer.alert("导出失败!",{icon:7});
                }

            }catch (e) {
            }
        }else{
            $("#checkout_export").attr("disabled", false);
            $("#checkout_export").text('导出采购单');
            window.location.href = "${base}/purchaseOrder/exportPurchaseOrder?purchasOrdereId=${otherPurchaseId}";
        }
    }

    /**
     * Desc:查看采购单明细
     * */
    function getOtherPurchaseOrderDetail(id,otherId){
        if(!isEmpty(id)){
            window.location="${base}/purchaseOrder/getPurchaseOrder?type=1&purchaseId="+id+"&othserId="+otherId;
        }else{
            layer.alert("查看失败!",{icon:2});
        }

    }

    /**
     * Desc:商品数量执行减去操作
     * @param goodsId 商品ID
     */
    function reduce(goodsId) {
        //当前商品数量
        var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
        //减1之后的商品数量
        var reduceGoodsNum = parseInt(nowGoodsNum) - 1;

        if(parseInt(reduceGoodsNum) < 1) {//小于1时表示商品数量不可以减1
            layer.confirm('商品数量不小于1!', {icon: 7, title:'温馨提示'}, function(index){
                layer.closeAll();
            });

        }else{
            $("#nowGoodsNum_"+goodsId).val(parseInt(reduceGoodsNum));
        }
    }

    /**
     * Desc:商品数量执行改变操作
     * @param goodsId 商品ID
     */
    function change(goodsId) {
        //当前商品数量
        var nowNum = $("#nowGoodsNum_"+goodsId).val();
        if(isEmpty(nowNum)){
            layer.confirm('商品数量不能为空!', {icon: 7, title:'温馨提示'}, function(index){
                layer.closeAll();
                $("#nowGoodsNum_"+goodsId).val(1);
            });
            return;
        }

        var nowGoodsNum = parseInt(nowNum);
        if(parseInt(nowGoodsNum) < 1) {//小于1时表示商品数量不可以改变
            layer.confirm('商品数量不小于1!', {icon: 7, title:'温馨提示'}, function(index){
                layer.closeAll();
                $("#nowGoodsNum_"+goodsId).val(1);
            });

        }else if(parseInt(nowGoodsNum) > 100000) {//商品数量不大于100000
            layer.confirm('商品数量不大于100000!', {icon: 7, title:'温馨提示'}, function(index){
                layer.closeAll();
                $("#nowGoodsNum_"+goodsId).val(1);
            });

        }else{
            $("#nowGoodsNum_"+goodsId).val(parseInt(nowGoodsNum));
        }

    }

    /**
     * Desc:商品数量执行增加
     * @param goodsId 商品ID
     */
    function add(goodsId) {
        //当前商品数量
        var nowGoodsNum = $("#nowGoodsNum_"+goodsId).val();
        //加1之后的商品数量
        var addGoodsNum = parseInt(nowGoodsNum) + 1;

        if(parseInt(addGoodsNum) > 100000) {//商品数量不大于100000
            layer.confirm('商品数量不大于100000!', {icon: 7, title:'温馨提示'}, function(index){
                layer.closeAll();
                $("#nowGoodsNum_"+goodsId).val(1);
            });

        }else{
            $("#nowGoodsNum_"+goodsId).val(parseInt(addGoodsNum));
        }



    }

    /**
     * 勾选checkbox判断是否为所有全选
     */
    function ifAllCheck(){
        var flag = true;
        $("#cartListForm input[name='noPlatformGoodsId']").each(function(){
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

</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>