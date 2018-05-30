<#escape x as x?html>
    <#include "bec/gdnz/header.ftl"/>
          <style>
    /*购物车结算 2-19*/
    .shopping_total { width:1088px; height:72px; z-index:10; margin:20px auto; padding:0 50px; background:#fafafa; position:relative;    border: 1px solid #e6e6e6;}
    .shopping_total .shopping_total_left { float:left; line-height:72px; width:488px; position:relative;}
    .shopping_total .shopping_total_left a { margin-left:28px;}
    .shopping_total .shopping_total_left a.checknow { margin:0 6px 0 0;}
    .shopping_total .shopping_total_left span { margin-left:80px;}
    .shopping_total .shopping_total_right { float:right; margin:18px 0 0; width:600px; position:relative;}
    .shopping_total .total_btn { float:right; display:block; width:116px; height:38px; font:bold 18px/38px "Microsoft Yahei"; color:#fff; background-color:#e12f45; border-radius:2px; text-align:center; margin-top:4px;}
    .shopping_total .total_btn:hover { text-decoration:none; background-color:#ed474a;}
    .shopping_total .total_btn_display, .shopping_total .total_btn_display:hover { float:right; display:block; width:116px; height:38px; font:bold 18px/38px "Microsoft Yahei"; color:#fff; background-color:#E4393C; border-radius:2px; text-align:center; margin-top:4px;}
    .shopping_total .subtotal { padding-right:30px; line-height:24px; float:right;}
    .shopping_total .subtotal span { display:inline-block;}
    .shopping_total .subtotal .cartsum { width:114px; text-align:right; padding:0 8px 0 0;}
    .shopping_total .subtotal .price { font-size:18px; color:#E4393C;}
    .fixed_total {z-index:999;position:fixed;bottom:0;left:50%;margin-left:-542px;_position:absolute;
        _top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight));}



    .pop_del { position: absolute; width: 200px; height: 120px; z-index: 99; padding: 0 0 0 10px; border: 1px solid #ccc; background:url(../images/pop_del_bg.png?v=20160126) right bottom no-repeat #fff; text-align: center; top:-112px; left: -100px;}
    .pop_del p { font-size: 14px; color: #323232; line-height: 18px; padding: 25px 0;}
    .pop_btn { width: 50px; height: 22px; line-height: 22px; display: inline-block; border: 1px solid #e6e6e6; margin: 5px 10px 0 0 !important; border-radius: 2px; background-color: #f8f8f8;
        background-image: -moz-linear-gradient( -90deg, rgb(255,255,255) 0%, rgb(243,242,244) 100%);
        background-image: -webkit-linear-gradient( -90deg, rgb(255,255,255) 0%, rgb(243,242,244) 100%);
        background-image: -ms-linear-gradient( -90deg, rgb(255,255,255) 0%, rgb(243,242,244) 100%);
    }
    .pop_del .red { color:#ff2832;}
    .pop_btn:hover { text-decoration:none;}
    .pop_del.col { background-image: none;}
    .pop_ebook { width:270px; height:auto; left:auto; right:0; top:-169px; line-height:20px; padding:0 0 10px 10px; background-image:none;}
    .pop_ebook h1 { color:#646464; text-align:left; padding:15px 0 8px; font-size:14px;}
    .pop_ebook p { text-align:left; padding:0 0 10px; font-size:12px;}
    .pop_ebook .pop_btn { width:66px;}
    .pop_del .close { position:absolute; right:10px; top:10px; width:14px; height:14px; display:block; background:url(../images/icon_sprite.png?v=20160126) -48px 0 no-repeat;}
    .shortname{display:block; line-height: 26px; color: #00a0e9;}

</style>
<div id="container">
    <#include "bec/gdnz/top2.ftl"/>
    <div class="shopping_cart_main">
        <h3>我的购物车</h3>
        <div class="cart-empty" id="cartempty" <#if cartItemList?? && cartItemList?size &gt; 0>style="display:none;"</#if>>
            <div class="message">
                <ul>
                    <li>购物车内暂时没有商品 <a href="${base}/index">去首页</a>挑选喜欢的商品</li>
                </ul>
            </div>
        </div>
        <div id="show" <#if cartItemList?? && cartItemList?size &gt; 0><#else>style="display:none;"</#if>>
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
                    <tr class="shopping_shopnames">
                        <td><input type="checkbox" id="shopcheck_${map.shopId}" class="shopcheck" onclick="shopAllCheck('${map.shopId}');"/></td>
                        <td colspan="6"><a href="${base}/shop/${map.shopUrl}.html" style="font-size: 14px;font-weight: bold;line-height: 40px;">${map.shopName}</a></td>
                    </tr>
                    <#list map.items as cartItem>
                        <#assign osntotal = osntotal+1>
                        <tr class="shopping_list" id="product_${cartItem.id}">
                            <td width="75"><input type="checkbox" id ="checkbox_${cartItem.id}" value="${cartItem.id}" onclick="countGoods('${cartItem.merchantId}');return true;" <#if cartItem.stock<=0> disabled="true" <#else> name="cartId" shopid="${cartItem.merchantId}" </#if>/></td>
                            <td width="550"><a href="${base}/item/${cartItem.goodsId}.html" target="_blank"><img src="${cartItem.pic}"  width="67" height="66"  alt="${cartItem.name}" class="shop_imgs"/><a href="${base}/item/${cartItem.goodsId}.html" target="_blank">${cartItem.name}</a><span class="shortname">${cartItem.shortName}</span>
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
                                <#--添加计算参数的隐藏于    yuech  2016-02-24    begin -->
                                <input type="hidden" value="${cartItem.enableBatchPrice}"  id="ifBatchPriceId_${cartItem.id}" />
                                <#if cartItem.enableBatchPrice == '1'>
                                    <input type="hidden"  value="${cartItem.batchPrice}" id="defStartBatchPrice_${cartItem.id}" />
                                    <input type="hidden"  value="${cartItem.startBatchNum}" id="defStartBatchNum_${cartItem.id}" />
                                <#else >
                                    <input type="hidden"  value="${cartItem.batchPrice}" id="defStartBatchPrice_${cartItem.id}" />
                                    <input type="hidden"  value="${cartItem.startNum}" id="defStartBatchNum_${cartItem.id}" />
                                </#if>
                                <input type="hidden"  value="${(cartItem.packageModulus=="0")?string("1",cartItem.packageModulus)}" id="defPackageModulus_${cartItem.id}" />
                                <input type="hidden"  value="${cartItem.limitNum}" id="defLimitNum_${cartItem.id}" />
                            <#--添加计算参数的隐藏于    yuech  2016-02-24    begin -->
                            </td>
                            <td width="140">
                                <input type="text" name="textfield" id="textfield" value="-" class="shop_add" readonly="ture" onfocus="this.blur()"
                                       onclick="javascript:reduce('${cartItem.id}');">
                                <input type="text" name="textfield2" id="${cartItem.id}" class="shop_number"
                                       placeholder="<#if cartItem.enableBatchPrice == '1'> ${cartItem.startBatchNum} <#else > ${cartItem.startNum} </#if>"
                                       value="${cartItem.quantity}"
                                       onblur="change('${cartItem.id}','${cartItem.price}')"
                                       onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                       onchange="change('${cartItem.id}');">
                                <input type="text" name="textfield3" id="textfield3" value="+" class="shop_add" readonly="ture" onfocus="this.blur()"
                                       onclick="javascript:add('${cartItem.id}');"></td>
                            <td width="105" class="shop_grey"><#if cartItem.stock<=0>无货<#else>有货</#if></td>
                            <td width="100" class="shop_grey">
                                <p><a id="remove-${cartItem.id}" data-name="${cartItem.name}" class="cart-remove" onclick="judgeAuth('${base}','addCarts',del.bind({},'${cartItem.id}','${cartItem.price}','${cartItem.merchantId}'));" href="javascript:void(0);">删除</a></p>
                            </td>
                        </tr>
                    </#list>
                </#list>
                </table>
            </form>

        </div>
        </div>


        <div id="hide_div" style="height:0px;visibility:hidden;"></div>


        <div style="position: fixed; bottom: -20px; z-index: 101; width: 100%; left: 0px;">
            <div class="shopping_total" id="shopping_total">
                <div class="shopping_total_right">
                    <a class="total_btn fn-checkout" href="javascript:;" id="checkout_btn" onclick="goToOrder();" dd_name="结算">结&nbsp;&nbsp;算</a>
                    <div class="subtotal">
                        <p><span class="cartsum">总计(不含运费)：</span><span id="payAmount" class="price">¥0.00</span></p>
                        <p><span class="cartsum">已节省：</span><span id="totalFavor">¥0.00</span></p>
                    </div>
                </div>
                <div class="shopping_total_left" id="J_leftBar">
                <#--<a id="j_selectall2" href="javascript:void(0)" class="checknow fn-checkall" dd_name="全选">选中</a>全选-->
                    <input type="checkbox" id="checkall" value="全选"  name="checkall" style="margin-right: 20px;margin-top: 29px;float: left;">
                    全选
                    <a id="j_removeproducts" href="javascript:void(0)" onclick="deleteChecked();" class="fn-batch-remove" dd_name="批量删除按钮">批量删除</a> <span>已选择<font color="red" id="selectedCount">0</font>件商品</span>
                </div>
            </div>
        </div>

    </div>
</div>
    <#include "bec/gdnz/service.ftl"/>
    <#include "bec/gdnz/foot.ftl"/>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        countGoods('');
        var allcheck1 = $("#allcheck");// 全选复选框
        var checkall=$("#checkall");
        var $cartIds = $("#product-list input[name='cartId']");// ID复选框
        // 全选
        allcheck1.click( function() {
            var $this = $(this);
            $cartIds.prop("checked", $this.prop("checked"));
            $(".shopcheck").prop("checked", $this.prop("checked"));
            checkall.prop("checked", $this.prop("checked"));
            countGoods('');
        });

        checkall.click(function() {
            var $this = $(this);
            $cartIds.prop("checked", $this.prop("checked"));
            $(".shopcheck").prop("checked", $this.prop("checked"));
            allcheck1.prop("checked", $this.prop("checked"));
            countGoods('');
        });


        $("#cartLogin").hide();
        $("#cartLogin").colorbox({iframe:true, innerWidth:390, innerHeight:270, opacity: 0.15});

        $("#toSettlement").on('click', goToOrder);
        changeShoppingCartTotal();
        $(window).scroll(function(){
            changeShoppingCartTotal();
        });
    });

//购物车结算效果
    function changeShoppingCartTotal(){
        var wh=$(window).height();
        var top=$(window).scrollTop();
        console.log($(window).height()+" "+$(window).scrollTop());
        var it=$("#show").offset().top;
        var ih=$("#show").height();
        if(((wh+top)-(it+ih+114))>0){
            $("#shopping_total").parent("div").css("position","static");
        }else{
            $("#shopping_total").parent("div").css("position","fixed");
        }
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
            $("#payAmount").text("￥"+totalPrice.toFixed(2));
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
            layer.alert("未选择任何商品!",{icon: 7});
        }
        /** 当checkbox有选择时才可以提交删除 Auth:zhangqiang Time:2015-09-21 18:20:35  End */
        countGoods();
    }


    /**
     * 20160426 dzz
     * 添加注释功能(此处为购物车商品 去除购物车商品数量(减少)功能)
     * 20160426 dzz
     * 修正商品去除(减少功能)
     *      原始方案: 按商品 单量单位计算, 即: 购物车当前商品数量 - 单量商品
     *      当前方案: 按商品包装系数去件, 即: 购物车当前商品数量 - (单量商品 * 包装系数)
     */
    function reduce(cartItemid) {
        //debugger;
        //包装系数 yuech 2016-2-23 16:22:00
        var defPackageModulus = $("#defPackageModulus_"+cartItemid).val();
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+cartItemid).val());
        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+cartItemid).val());
        //当前商品数量
        var nowGoodsNum = $("#"+cartItemid).val();
        //减1之后的商品数量
        var reduceGoodsNum = parseInt(nowGoodsNum) - parseInt(defPackageModulus);
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+cartItemid).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(reduceGoodsNum % defPackageModulus != 0){
            var i = parseInt(reduceGoodsNum / defPackageModulus);
            reduceGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
        }

        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && reduceGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            if(defLimitNum % defPackageModulus != 0){
                var i = parseInt(defLimitNum / defPackageModulus);
                reduceGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
            }else{
                reduceGoodsNum = defLimitNum;
            }
            $("#"+cartItemid).val(reduceGoodsNum);
            countGoods();
            return;
        }
        if(ifBatchPrice == '1'){//有批发价时
            //判断减去之后的数量是否小于起批数量
            if(reduceGoodsNum <defStartBatchNum){
                layer.alert("商品数量不能小于起批数量!", {icon: 7});
                if(defStartBatchNum % defPackageModulus != 0){
                    var i = parseInt(defStartBatchNum / defPackageModulus);
                    reduceGoodsNum = ( i + 1 ) * defPackageModulus;
                }else{
                    reduceGoodsNum = defStartBatchNum;
                }
                $("#"+cartItemid).val(nowGoodsNum);
                countGoods();
                return;
            }
        }else{//无批发价时
            if(reduceGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能小于起批数量"+defStartBatchNum+"!", {icon: 7});
                $("#"+cartItemid).val( defStartBatchNum );
                countGoods();
                return;
            }else{
                $("#"+cartItemid).val(parseInt(reduceGoodsNum));
                countGoods();
            }
        }
        if(clickAllow=="true"){
            var buyNum = $("#"+cartItemid);
            if(parseInt(reduceGoodsNum) >= 1) {
                clickAllow = "false";
                $.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxUpdateCartId",
                    data: "id="+cartItemid+"&quantity="+reduceGoodsNum,
                    success: function(data) {
                        if(data.status=='success'){
                            //Desc:增加根据数量显示阶梯价 Auth:zhangqiang Time:2015-11-24 17:59:35 Start
                            //未登录，不计算
                            if(isLogin()) {
                                $("#price_" + cartItemid).html(data.batchPrices);
                            }
                            //Desc:增加根据数量显示阶梯价 Auth:zhangqiang Time:2015-11-24 17:59:35 End
                            buyNum.val(reduceGoodsNum);
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

    function change(cartItemid){
        //debugger;
        if(isNaN(parseInt($("#"+cartItemid).val()))) { // 20160426 dzz 判断当前商品数量是否为数字
            layer.alert("商品数量不能为空且不能小于起批数量!", {icon: 7});
            $("#"+cartItemid).val(parseInt($("#defStartBatchNum_"+cartItemid).val()));
            return;
        }
        //包装系数
        var defPackageModulus = parseInt($("#defPackageModulus_"+cartItemid).val());
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+cartItemid).val());

        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+cartItemid).val());
        //当前商品数量
        var nowGoodsNum = parseInt($("#"+cartItemid).val());
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+cartItemid).val();

        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(nowGoodsNum % defPackageModulus != 0){
            nowGoodsNum = (parseInt(nowGoodsNum / defPackageModulus) + 1) * defPackageModulus;
        }
        /**
         * 如果限购数量为零，说明启用了限购数量
         *  超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
         *  yuech 2016-2-23 15:49:17
         */
        if( defLimitNum != 0 && nowGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            if(defLimitNum % defPackageModulus != 0){
                var i = parseInt(defLimitNum / defPackageModulus);
                nowGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
            }else{
                nowGoodsNum = defLimitNum;
            }
            $("#"+cartItemid).val(nowGoodsNum);
            countGoods();
            return;
        }
        if(ifBatchPrice == '1'){//有批发价时
            //判断改变之后的数量是否小于起批数量
            if(nowGoodsNum <defStartBatchNum){
                layer.alert("商品数量不能小于起批数量!", {icon: 7});
                if(defStartBatchNum % defPackageModulus != 0){
                    var i = parseInt(defStartBatchNum / defPackageModulus);
                    nowGoodsNum = ( i + 1 ) * defPackageModulus;
                }else{
                    nowGoodsNum = defStartBatchNum;
                }
                $("#"+cartItemid).val(nowGoodsNum);
                countGoods();
                return;
            }else if(nowGoodsNum >100000){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                if(defLimitNum % defPackageModulus != 0){
                    var i = parseInt(defLimitNum / defPackageModulus);
                    nowGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
                }else{
                    nowGoodsNum = defLimitNum;
                }
                $("#"+cartItemid).val(nowGoodsNum);
                countGoods();
                return;
            }
        }else{//无批发价时
            if(nowGoodsNum < defStartBatchNum){
                layer.alert("商品数量不能小于起批数量"+defStartBatchNum+"!", {icon: 7});
                $("#"+cartItemid).val( defStartBatchNum );
                countGoods();
                return;
            }else{
                $("#"+cartItemid).val(parseInt(nowGoodsNum));
            }
        }
        //debugger;
        var buyNum = $("#"+cartItemid);;
        buyNum.val(nowGoodsNum);
        if($.trim(buyNum.val()) == ''){
            buyNum.val(defStartBatchNum);
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
                    countGoods();
                }
            }
        });


    }

    function add(cartItemid) {
        //包装系数
        var defPackageModulus = parseInt($("#defPackageModulus_"+cartItemid).val());
        //限购数量 TianYu 2016-2-17 09:22:17
        var defLimitNum = parseInt($("#defLimitNum_"+cartItemid).val());

        //默认起批数量
        var defStartBatchNum = parseInt($("#defStartBatchNum_"+cartItemid).val());
        //当前商品数量
        var nowGoodsNum = $("#"+cartItemid).val();
        //加1之后的商品数量
        var addGoodsNum = parseInt(nowGoodsNum) + defPackageModulus;
        //是否有批发价 1:有 0:无
        var ifBatchPrice = $("#ifBatchPriceId_"+cartItemid).val();
        //如果数量不是包装系数的整数倍，自动增加数量到整数倍 TianYu 2016-2-17 10:17:17
        if(addGoodsNum % defPackageModulus != 0){
            var i = parseInt(addGoodsNum / defPackageModulus);
            addGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
        }
        //如果限购数量为零，说明启用了限购数量
        //超出了限购数量，设置数量为限购数量，如果使用阶梯价，价格为限购限购数量时的阶梯价
        if( defLimitNum != 0 && addGoodsNum > defLimitNum){
            layer.alert("商品数量不能大于限购数量!", {icon: 7});
            if(defLimitNum % defPackageModulus != 0){
                var i = parseInt(defLimitNum / defPackageModulus);
                addGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
            }else{
                addGoodsNum = defLimitNum;
            }
            $("#"+cartItemid).val(addGoodsNum);
            countGoods();
            return;
        }
        if(ifBatchPrice == '1'){//有批发价时
            //判断减去之后的数量是否小于起批数量
            if(addGoodsNum >100000){
                layer.alert("商品数量不能大于于100000!", {icon: 7});
                if(defLimitNum % defPackageModulus != 0){
                    var i = parseInt(defLimitNum / defPackageModulus);
                    addGoodsNum = ( i <= 1 ? 1 : i ) * defPackageModulus;
                }else{
                    addGoodsNum = defLimitNum;
                }
                $("#"+cartItemid).val(addGoodsNum);
                countGoods();
                return;
            }
        }else{//无批发价时
            if(addGoodsNum >100000){
                layer.alert("商品数量不能大于100000!", {icon: 7});
                $("#"+cartItemid).val(1);
                countGoods();
                return;
            }else{
                $("#"+cartItemid).val(parseInt(addGoodsNum));
            }
        }
        if(clickAllow=="true"){
            clickAllow = "false";
            var buyNum = $('#'+cartItemid);
            buyNum.val(addGoodsNum);
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
                        buyNum.val(total);
                        $("#sp_"+cartItemid).html(data.sp);
                        countGoods();
                    }
                },
                complete : function(XMLHttpRequest,status){
                    clickAllow = "true";
                    countGoods();
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
                        //购物车中再没有此商家的商品，删除商家行
                        if(i == 0){
                            $("#shop_tr_"+shopId).remove();
                        }
                        clickAllow = "true";

                        //是否删除完
                        if($("#product-list input[name='cartId']").length <= 0){
                            $("#cartempty").show();
                            $("#show").hide();
                        }
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
            layer.alert('请至少选中一件商品！',{icon: 7});
        }
    }


    /** 添加商家复选框 TianYu  2015年8月19日 Start */
    function shopAllCheck(shopId){
        $("#product-list input[shopid='"+shopId+"']").prop("checked", $("#shopcheck_"+shopId).prop("checked"));
        countGoods('');
        allChecked();
    }
    /** 添加商家复选框 TianYu  2015年8月19日 End */
    /**
     * Desc:判断当所有商品选择时，全选CheckBox勾选
     * Auth:zhangqiang
     * Time:2015-11-10 18:06:32
     *  */
    function allChecked(){
        var flag = true;
        $("#product-list input[name='cartId']").each(function(){
            if(!$(this).prop("checked")) {
                flag = false;
                return false;
            }

        });

        if(flag){
            $("#allcheck,#checkall").prop("checked", true);
        }else{
            $("#allcheck,#checkall").prop("checked", false);
        }
    }

</script>
</#escape>