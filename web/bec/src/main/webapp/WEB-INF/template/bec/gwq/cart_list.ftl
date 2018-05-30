<#escape x as x?html>
    <#include "bec/gwq/header.ftl"/>
<div id="container">
    <#include "bec/gwq/top2.ftl"/>
    <div class="shopping_cart_main">
        <h3>我的购物车</h3>
        <div class="cart-empty" id="cartempty" style="display:none;">
            <div class="message">
                <ul>
                    <li>购物车内暂时没有商品 <a href="${base}/index">去首页</a>挑选喜欢的商品</li>
                </ul>
            </div>
        </div>
        <div id="show" style="display:none;">
        <div class="shopping_cart_box1">
            <input type="hidden" value="${isLogin}" id="isLogin">
            <table border="0" cellpadding="0" cellspacing="0" >
                <tr>
                    <td width="75"><input type="checkbox" id="allcheck" class="s_checkbox">全选</td>
                    <td width="550">商品信息</td>
                    <td width="90">金额</td>
                    <td width="140">数量</td>
                    <td width="105">库存</td>
                    <td width="100">操作</td>
                </tr>
            </table>
        </div>
        <div class="shopping_cart_box2" id="product-list">
            <form id="cartListForm" action="${base}/member/ordercheck" method="POST">
                <input type="hidden" name="o" id="o" value=""/>
                <#assign osntotal = 0>
                <table border="0" cellpadding="0" cellspacing="0" >
                <#list cartItemList as map>
                    <tr class="shopping_shopnames hide">
                        <td><input type="checkbox" id="shopcheck_${map.shopId}" onclick="shopAllCheck('${map.shopId}');"/></td>
                        <td colspan="6"><a href="${base}/shop/${map.shopUrl}.html">${map.shopName}</a></td>
                    </tr>
                    <#list map.items as cartItem>
                        <#assign osntotal = osntotal+1>
                        <tr class="shopping_list" id="product_${cartItem.id}">
                            <td width="75"><input type="checkbox" id ="checkbox_${cartItem.id}" value="${cartItem.id}" onclick="countGoods('${cartItem.merchantId}');return true;" <#if cartItem.stock<=0> disabled="true" <#else> name="cartId" shopid="${cartItem.merchantId}" </#if>/></td>
                            <td width="550"><a href="${base}/item/${cartItem.goodsId}.html" target="_blank"><img src="${cartItem.pic}@67w_66h.png"  width="67" height="66"  alt="${cartItem.name}" class="shop_imgs"/><a href="${base}/item/${cartItem.goodsId}.html" target="_blank">${cartItem.name}</a><span style="display: block;line-height: 24px; color: #00a2d4;">${cartItem.shortName}</span>
                                <div id="sp_${cartItem.id}" style="color:#666; margin-top: 5px;">${cartItem.specification}</div>
                            </td>
                            <td width="90">
                                <#if isLogin == '0'>
                                    <span class="nologin_price" id="price_${cartItem.id}">仅会员可见！</span>
                                <#else>
                                    ￥
                                    <span id="price_${cartItem.id}">
                                     ${ (cartItem.batchPrice==null) ?string(cartItem.price,cartItem.batchPrice)}
                                    </span>
                                </#if>
                            </td>
                            <td width="140">
                                <input type="text" name="textfield" id="textfield" value="-" class="shop_add" readonly="ture" onfocus="this.blur()"  onclick="javascript:reduce('${cartItem.id}','${cartItem.price}');">
                                <input type="text" name="textfield2" id="${cartItem.id}" class="shop_number" placeholder="1" onblur="change('${cartItem.id}','${cartItem.price}')" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" value="${cartItem.quantity}" onchange="change('${cartItem.id}','${cartItem.price}')";>
                                <input type="text" name="textfield3" id="textfield3" value="+" class="shop_add" readonly="ture" onfocus="this.blur()" onclick="javascript:add('${cartItem.id}','${cartItem.price}');"></td>
                            <td width="105" class="shop_grey"><#if cartItem.stock<=0>无货<#else>有货</#if></td>
                            <td width="100" class="shop_grey">
                                <p><a id="remove-${cartItem.id}" data-name="${cartItem.name}" class="cart-remove" onclick="javascript:del('${cartItem.id}','${cartItem.price}','${cartItem.merchantId}');" href="javascript:void(0);">删除</a></p>
                            </td>
                        </tr>
                    </#list>
                </#list>
                    <tr class="shopping_total">
                        <td colspan="7">
                            <div class="shop_yf">&nbsp;
                                <#--<p>运费</p>-->
                                <#--<p class="shop_price"><em>￥0.00</em></p>-->
                            </div>
                            <div class="shop_yh">
                                <p>优惠</p>
                                <p class="shop_price"><em style="width: 80px; float: right;">￥0.00</em></p>
                            </div>
                            <div class="shop_money">
                                <p>商品金额</p>
                                <#--<p class="shop_price" id="totalPrice1" style="font-size: 16px;"><em><strong>￥0.00</strong></em></p>-->
                                <p class="shop_price" style="font-size: 16px;"><strong>￥</strong><em id ="totalPrice1" style="width: 80px; float: right;">0.00</em></p>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>

        </div>
        <div class="shopping_cart_box3">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="shop_box3_left">
                        <a href="#" onclick="javascript:deleteChecked();" id="remove-batch">删除选中商品</a>
                        <span id="showinfo" style="color: red;"></span></td>
                    <td class="shop_box3_right" colspan="2">
                        <div style="float:right; padding: 10px 20px 0px 0px">
                            <a href="${(backurl)!"${base}/index"}" id="continue" class="shop_continue">继续购物</a>
                            <a href="#" class="shop-grey" id="toSettlement-disabled">去结算</a>
                            <a href="#" class="shop_settlement" id="toSettlement">去结算</a>
                            <a href="${base}/member/popuplogin" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会员登录" id="cartLogin"></a>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        </div>
    </div>
</div>
    <#include "bec/gwq/service.ftl"/>
    <#include "bec/gwq/foot.ftl"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        countGoods('');
        var $allcheck1 = $("#allcheck");// 全选复选框
        var $cartIds = $("#product-list input[name='cartId']");// ID复选框
        // 全选
        $allcheck1.click( function() {
            var $this = $(this);
            $cartIds.prop("checked", $this.prop("checked"));
            $(".shopcheck").prop("checked", $this.prop("checked"));

            countGoods('');
        });
        var $allcheck2 = $("#allcheck2");// 全选复选框
        // 全选2
        $allcheck2.click( function() {
            var $this = $(this);
            $cartIds.prop("checked", $this.prop("checked"));
            $(".shopcheck").prop("checked", $this.prop("checked"));

            countGoods('');
        });


        <#if cartItemList?exists && cartItemList?size gt 0>
            $("#cartempty").hide();
            $("#show").show();
        <#else>
            $("#cartempty").show();
            $("#show").hide();
        </#if>

        $("#cartLogin").hide();
        $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});

        $("#toSettlement").on('click', goToOrder);
    });

    function shopAllCheck(shopId){
        $("#product-list input[shopid='"+shopId+"']").prop("checked", $("#shopcheck_"+shopId).prop("checked"));

        countGoods('');
    }

    /** 1、计算商品总数及总价格 2、判断店铺是否全选 TianYu 2015-9-7  Start */
    function countGoods(shopId){

        if(shopId!=''){
            shopChecked( shopId );
        }

        //未登录，不计算
        if(isLogin()){

            var $cartIds = $("#product-list input[name='cartId']:checked");// ID复选框
            var total = 0;
            var totalPrice = 0.00;
            $cartIds.each(function(){
                var cartidtemId = $(this).val();
                var price = parseFloat($("#price_"+cartidtemId).text());
                var num = parseInt($("#"+cartidtemId).val());
                total = total + num;
                totalPrice = totalPrice + price*num;
            });
            $("#totalPrice1").text(totalPrice.toFixed(2));
            $("#selectedCount").text(total);//商品数
        }

        if( total == 0 ){
            $("#toSettlement").hide();
            $("#toSettlement-disabled").show();
        }else{
            $("#toSettlement-disabled").hide();
            $("#toSettlement").show();
        }
    }

    function shopChecked(shopId){
        var flag = true;
        $("#product-list input[shopid='"+shopId+"']").each(function(){
            if( !$(this).prop("checked") ){
                flag = false;
                return false;
            }
        });

        if(flag){
            $("#shopcheck_"+shopId).prop("checked", true);
        }else{
            $("#shopcheck_"+shopId).prop("checked", false);
        }
    }
    /** 1、计算商品总数及总价格 2、判断店铺是否全选 TianYu 2015-9-7  End */
    var clickAllow = "true";
    function deleteChecked(){
        clickAllow = "false";
        var ids = '';
        var cartIds = $("#product-list input[name='cartId']:checked");// ID复选框
        /** 当checkbox有选择时才可以提交删除 Auth:zhangqiang Time:2015-09-21 18:20:35  Start */
        if(cartIds.length > 0){
            clickAllow = "true";
            layer.confirm('确认要删除这些商品吗?', {icon: 3, title:'温馨提示'}, function(index){
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxDeleteCartIds",
                    data: cartIds.serialize(),
                    success: function(data) {
                        if(data.status=='success'){
                            //刷新本页面
                            location.replace("${base}/cart/list?backurl=${backurl}");
                        }else{
                            clickAllow = "true";
                        }
                    }
                });
                layer.close(index);
            });
        }else{
            $("#showinfo").html("未选择任何商品!");
            return;
        }
        /** 当checkbox有选择时才可以提交删除 Auth:zhangqiang Time:2015-09-21 18:20:35  End */
        countGoods();
    }

    function reduce(cartItemid,cartItemPrice) {
        if(clickAllow=="true"){
            var buyNum = $('#'+cartItemid);
            if(parseInt(buyNum.val()) > 1) {
                clickAllow = "false";
                var total = parseInt(buyNum.val()) - 1;
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxUpdateCartId",
                    data: "id="+cartItemid+"&quantity="+total,
                    success: function(data) {
                        if(data.status=='success'){
                            //Desc:增加根据数量显示阶梯价 Auth:zhangqiang Time:2015-11-24 17:59:35 Start
                            //未登录，不计算
                            if(isLogin()) {
                                $("#price_" + cartItemid).html(data.batchPrices);
                            }
                            //Desc:增加根据数量显示阶梯价 Auth:zhangqiang Time:2015-11-24 17:59:35 End
                            buyNum.val(total);
                            $("#sp_"+cartItemid).html(data.sp);
                            countGoods();
                        }
                    },
                    complete : function(XMLHttpRequest,status){
                        clickAllow = "true";
                    }
                });
            }
        }

    }

    function change(cartItemid,cartItemPrice){
        clickAllow = "true";
        var buyNum = $('#'+cartItemid);

        if($.trim(buyNum.val()) == ''){
            buyNum.val(1);
        }

        var total = parseInt(buyNum.val());
        $.ajax({
            type: "get",
            url: "${base}/cart/ajaxUpdateCartId",
            data: "id="+cartItemid+"&quantity="+total+"&r="+ new Date(),
            success: function(data) {
                if(data.status=='success'){
                    //Desc:增加根据数量显示阶梯价 Auth:zhangqiang Time:2015-11-24 17:59:35 Start
                    //未登录，不计算
                    if(isLogin()) {
                        $("#price_" + cartItemid).html(data.batchPrices);
                    }
                    //Desc:增加根据数量显示阶梯价 Auth:zhangqiang Time:2015-11-24 17:59:35 End
                    //去掉刷新页面 刷新页面会导致选择的商品 不选中  Start
                    //刷新本页面
                    //location.replace("${base}/cart/list?backurl=${backurl}");
                    buyNum.val(total);
                    $("#sp_"+cartItemid).html(data.sp);
                    countGoods();
                    //去掉刷新页面 刷新页面会导致选择的商品 不选中  End
                }else{
//                    clickAllow = "true";
                }
            }
        });


    }

    function add(cartItemid,cartItemPrice) {
        if(clickAllow=="true"){
            clickAllow = "false";
            var buyNum = $('#'+cartItemid);
            var total = parseInt(buyNum.val()) + 1;
            $.ajax({
                type: "get",
                url: "${base}/cart/ajaxUpdateCartId",
                data: "id="+cartItemid+"&quantity="+total+"&r="+ new Date(),
                success: function(data) {
                    if(data.status=='success'){
                        //Desc:增加根据数量显示阶梯价 Auth:zhangqiang Time:2015-11-24 17:59:35 Start
                        //未登录，不计算
                        if(isLogin()) {
                            $("#price_" + cartItemid).html(data.batchPrices);
                        }
                        //Desc:增加根据数量显示阶梯价 Auth:zhangqiang Time:2015-11-24 17:59:35 End
                        buyNum.val(total);
                        $("#sp_"+cartItemid).html(data.sp);
                        countGoods();
                    }
                },
                complete : function(XMLHttpRequest,status){
                    clickAllow = "true";
                }
            });
        }
    }

    function del(cartItemid,cartItemPrice, shopId) {
        layer.confirm('确认要删除该商品吗?', {icon: 3, title:'温馨提示'}, function(index){
            clickAllow = "false";
            //未登录，不计算
            if(isLogin()) {
                cartItemPrice = Number($("#price_" + cartItemid).text());
            }
            var buyNum = $('#'+cartItemid);
            var buyCount = $('#selectedCount');
            var buyPrice1 = $('#totalPrice1');
            var total = parseInt(buyCount.html())-parseInt(buyNum.val());
            $.ajax({
                type: "get",
                url: "${base}/cart/ajaxDeleteCartId",
                data: "id="+cartItemid,
                success: function(data) {
                    if(data.status=='success') {
                        //刷新本页面
                        if ($("#checkbox_" + cartItemid).prop("checked")) {
                            buyCount.html(total);
                            //未登录，不计算
                            if(isLogin()) {
                                buyPrice1.html((Number(buyPrice1.html()) - Number(cartItemPrice) * parseInt(buyNum.val())).toFixed(2));
                            }
                        }
                        $("#product_"+cartItemid).remove();


                        //删除商户
                        var i = 0;
                        $("#product-list input[shopid='"+shopId+"']").each(function(){
                            if(cartItemid != $(this).val()){
                                i++;
                            }
                        });
                        if(i == 0){
                            $("#shop_div_"+shopId).remove();
                        }
                        clickAllow = "true";
                    }else{
                        clickAllow = "true";
                    }
                }
            });
            layer.close(index);
        });
    }

    /**
     * 判断是否登录
     * @returns {Boolean}
     */
    function isLogin(){
        var isLogin = $("#isLogin").val();
        if(isLogin == 1){
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
        var isLogin = flag ? "1" : "0";
        $("#isLogin").val(isLogin);
    }

    /**
     * 关闭登录的弹出窗口
     */
    function cartLoginClose(){
        $("#cartLogin").colorbox.close();
    }

    /**
     * 跳转到订单页如未登录弹出登录弹窗
     */
    function goToOrder(){

        //判断是否存在选中的商品，如果无，不进入结算页面
        var selected = $("input[name='cartId']:checked");

        if(selected != 'undefined' && selected != null && selected.length != 0){
            try {

                var oid = '';
                var i = 0;
                $(selected).each(function(){
                    if(i > 0){
                        oid += ',';
                    }
                    oid += $(this).val();
                    i++;
                });

                $("#o").val(oid);

                if(!isLogin()) {
                    $("#cartLogin").trigger("click");
                } else {
                    //添加库存校验 TianYu 2015-8-31
                    $.post("${base}/member/stockJudge",{o:oid},function(d){
                        if( d.success == "success" ){
                            $('#toSettlement').hide();
                            $('#toSettlement').after("<span class='checkout-state'>正在转向订单信息填写页面，请稍候！</span>");

                            $("#cartListForm").attr("action",$("#cartListForm").attr("action") + "?r="+Math.random());
                            window.setTimeout('$("#cartListForm").submit()',3000);
                            $("#cartListForm").submit();

                        }else if(d.success == "isMarketable" ){
                            layer.alert( d.msg );
                        }else{
                            layer.alert( d.msg );
                        }
                    });
                }
            } catch (e) {
            }
        }else{
            layer.alert('请至少选中一件商品！');
        }
    }
</script>
</#escape>