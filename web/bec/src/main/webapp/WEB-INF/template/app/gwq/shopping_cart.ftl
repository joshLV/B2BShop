<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<#include "app/gwq/head.ftl">
    <style>
        .mui-title2{
            font-size: 17px;
            font-weight: 500;
            line-height: 20px;
            position: absolute;
            display: block;
            width: 100%;
            margin: 0 auto;
            padding: 0;
            text-align: left;
            white-space: nowrap;
            color: #000;
        }
        p {
            font-size: 14px;
            margin-top: 0;
            margin-bottom: 0px;
            color: #8f8f94;
        }
        .mui-ellipsis-2{
            width:100%;
        }
        .mui-input-group .mui-input-row {
            height: 100px !important;
        }
        .shop-title .item {
            position: relative;
            margin-left: 35px;
            height: 35px;
            line-height: 35px;
        }
    </style>
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>返回
    </button>
    <div class="mui-title mui-pull-right ">
        购物车
    </div>
    <button type="button" id="jxgw" onclick="location.href='${base}/app_index'" class="mui-btn  mui-btn-link mui-btn-nav mui-pull-right" style="margin-right:0px; padding-left: 6px;">
        <span class="mui-icon mui-icon-right-nav"></span>继续购物
    </button>
</header>
<div class="mui-content" style="padding-bottom: 50px;padding-top:45px;">
    <div id="cartempty" style="display:none;">
        <div class="message" style=" margin-top:130px;">
            <ul>


                <li style="text-align: center; margin-top: 10px;"><img src="${base}/static/mall/img/cart-empty-bg.png"></li>
                <li style="text-align: center; margin-top: 20px; color: #999;">购物车还是空的,去逛逛吧！<br><br> <a href="${base}/app_index" style=" padding:7px 10px; width: 90px; background: #fff;-webkit-border-radius: 3px;
-moz-border-radius: 3px;
border-radius: 3px; display: inline-block; border: 1px solid #dfdfdf; color: #555;">去逛逛</a></li>


            </ul>
        </div>
    </div>
    <div id="show">
        <input type="hidden" value="${isLogin}" id="isLogin" name="isLogin">

        <div id="cartlist" style="margin-top: -14px;">
            <ul class="mui-table-view">
                <form class="mui-input-group" id="cartListForm" action="${base}/member/ordercheck?whichclient=whichapp" method="POST">
                    <input type="hidden" name="o" id="o" value=""/>
                    <input type="hidden" name="num" id="num" value=""/>
                <#assign total = 0>
                <#assign totalPrice = 0>

                <#list cartItemList  as map>
                    <#if map_index gt 0>
                        <div style="height: 15px;background-color: #BBB5B5"></div>
                    </#if>
                    <div class="shop-title customize-shtit" shopIdD="${map.shopId}" style="border-bottom: 1px dotted #d8d8d8; padding:2px 0;">
                        <div class="item">
                            <span class="mui-checkbox"><input  type="checkbox" class="shopcheck" id="shopcheck_${map.shopId}" onclick="shopAllCheck(this);" shopIdF="${map.shopId}" checked="true" style="right:2px;top:8px;"></span>
                            <div class="shop-title-content"> <a href="${base}/shop/${map.shopUrl}?whichclient=whichapp"> <span class="shop-title-name">${map.shopName}</span> <span class="shop-title-detail"> <span style="width: 30px;"> <img src="${base}/static/app/gwq/images/icon-left.png"> </span> </span> </a> </div>
                            </li>
                        </div>
                    </div>
                    <#list map.items as cartItem>
                        <#assign total = total+cartItem.quantity>
                        <#assign price = (cartItem.price?number)*cartItem.quantity>
                        <#assign totalPrice = totalPrice+price>
                        <li  id="product_${cartItem.id}" class="mui-input-row mui-checkbox mui-left" style="padding-bottom:15px;">
                            <input name="cartId" type="checkbox"  value="${cartItem.id}" <#if cartItem.stock<=0> disabled="true" <#else>shopid="${cartItem.merchantId}" checked="true" class="check"</#if> style="margin-top:30px;left: 5px;">
                            <div class="mui-gwc-box" style="margin-left: 40px;">
                                <a href="${base}/item/whichapp/${cartItem.goodsId}.html" title="${cartItem.name}"><img class="mui-media-object mui-pull-left" src="${cartItem.pic}_300x300.png"></a>
                                <div class="mui-media-body">

                                    <div class="cart-product-name" style="margin-top:10px;height: 2.8em;">
                                        <a href="${base}/item/whichapp/${cartItem.goodsId}.html" class="color-000"><span style="line-height:1.5em;height: 3.2em;"><font style="font-weight: bold;color: #E4393C;">[<#if cartItem.stock<=0>无货<#else>有货</#if>]</font>${cartItem.name!''}</span></a>
                                    </div>

                                    <div class="cart-product-name" style="margin-top:5px;margin-bottom:3px;height: 1.5em;overflow: hidden;text-overflow:ellipsis;">
                                        <span style="line-height:1.5em;height: 3.2em;">${cartItem.specification}</span>
                                    </div>

                                    <div class="mui-numbox" style="width: 35px;height: 25px; margin:0; float: left;padding:0 30px;">
                                        <button class="mui-numbox-btn-minus" style="width: 30px;" type="button" onClick="clickNum()">-</button>
                                        <input class="mui-numbox-input" style="width: 23px;padding:0 0px!important" type="input"  id="num" name="num"  onchange="changEwpCartitemNum(this)" cartItemid="${cartItem.id}" onBlur="checkNum2()" value="${cartItem.quantity}"/>
                                        <button class="mui-numbox-btn-plus" style="width: 30px;border-left:solid 1px #ccc!important"  type="button">+</button>
                                    </div>
                                    <span style="display:block; float:left; font-size: 14px;color:#E4393C;line-height:30px; padding-left: 5px;">￥<font class="price" id="price_${cartItem.id}">${ (cartItem.batchPrice==null) ?string(cartItem.price,cartItem.batchPrice)}<#--${cartItem.price}--></font></span>

                                    <div class="mui-content-padded  f-fr" style="padding:0;">
                                        <a href="javascript:void(0);" id="${cartItem.id}" price="${cartItem.price}" data-name="${cartItem.name}" class="color-096"><span class="mui-icon mui-icon-trash"></span></a>
                                    </div>
                                    </p>
                                </div>
                            </div>
                        </li>
                        <!-- product_${cartItem.id}-list end -->
                    </#list>
                </#list>
                </form>
            </ul>
        </div>
    </div>
</div>
<#if total gt 0>
    <nav class="mui-bar2 mui-bar-tab">
        <div class="mui-table-view2" >
            <div style="float: left; height:20px;  width: 70px; margin: 9px 0 0 0; font-size: 14px; color: #999;margin-left: -10px;">
                <form class="mui-input-group2">
                    <div class="shop-title customize-shtit">
                        <li class="mui-input-row mui-checkbox mui-left f-cb">
                            <input id="checkbox" name="checkbox" type="checkbox" style="float: left;top:0px;">
                            <a href="#"  style="color:#8f8f94;float: right;">全选</a>
                        </li>
                    </div>
                </form>
            </div>
            <div class="mui-title2 mui-center" style="left: 70px;">
                <p >共计:<span id="selectedCount" >${total}</span>件商品</p>
                <p >总价:￥<span style="color:#F00;" id="price2">${totalPrice}</span></p>
            </div>

            <button class=" mui-btn-primary mui-pull-right" id="js" style=" margin-top:2px; margin-right:5px;" onclick="goToOrder()">
                <a href="javascript:void(0);" class="gotoorder" id="toSettlement">结算</a>
            </button>
            <button class=" mui-btn-primary mui-pull-right" id="scxz" style=" margin-top:2px; margin-right:5px;" onclick="javascript:deleteChecked();">
                <a href="javascript:void(0);" class="gotoorder" id="toSettlement">删除选中</a>
            </button>
        </div>
    </nav>
</#if>

<div class="return" >
    <a id="backToTop2" style="display: none;" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>

<script>
    //单机选择该店铺下的所有商品
    function shopAllCheck(obj){
        if(jQuery(obj).prop("checked")){
            jQuery("input[shopid='"+$(obj).attr("shopIdF")+"']").prop("checked",true);
        }else{
            jQuery("input[shopid='"+$(obj).attr("shopIdF")+"']").prop("checked",false);
        }
    }
    /* jQuery(".changEwpCartitemNum").on("change",function(){
         changEwpCartitemNum(this);
     });*/
    function changEwpCartitemNum(obj){
        var reg = new RegExp("^[0-9]*$");
        var cartItemid=jQuery(obj).attr("cartItemid");
        var total=jQuery(obj).val();
        if(!reg.test(jQuery(obj).val())){
            jQuery(obj).val(1)
        }else{
            if(jQuery(obj).val()<1){
                jQuery(obj).val(1)
            }
        }
        if(total>1000){
            jQuery(obj).val(1000);
            mui.toast("商品数量为最大1000！");
            return;
        }

        if(reg.test(jQuery(obj).val())){
            var clickAllow="";
            $.ajax({
                type: "get",
                url: base+"cart/ajaxUpdateCartId",
                data: "id="+cartItemid+"&quantity="+total+"&r="+ new Date(),
                success: function(data) {
                    if(data.status=='success'){
                        clickAllow="false";
                        sum();
                    }else{
                        clickAllow = "true";
                    }
                }
            });
        }

    }

    //整数正则
    var regexEnum =/^-?[0-9]{1,}$/;
    //验证内容是不是整数
    function checkNum(num){
        return regexEnum.test(num);
    }
    //点击加减号
    function clickNum(){
        if(checkNum(document.getElementById("num").value)){
            if(parseInt(document.getElementById("num").value)<=1){
                document.getElementById("num").value=1;
            }
        }else{
            document.getElementById("num").value=1;
        }
    }
    //手动输入数量校验
    function checkNum2(){
        if(!checkNum(document.getElementById("num").value)){
            document.getElementById("num").value=1;
        }else{
            if(parseInt(document.getElementById("num").value)<1){
                document.getElementById("num").value=1;
            }
        }
    }
    //删除选中
    function deleteChecked(){
        clickAllow = "false";
        var ids = '';
        var cartIds = $("#cartlist input[name='cartId']:checked");// ID复选框
        /** 当checkbox有选择时才可以提交删除 Auth:zhangqiang Time:2015-09-21 18:20:35  Start */
        if(cartIds.length > 0){
            var btnArray = ['确认', '取消'];
            plus.nativeUI.confirm('您确定要删除吗?',
                function(e) {
                    if (e.index == 0) {
                        $.ajax({
                            type: "get",
                            url: base+"cart/ajaxDeleteCartIds",
                            data: cartIds.serialize(),
                            success: function(data) {
                                if(data.status=='success'){
                                    //刷新本页面
                                    location.reload(true)
                                }else{
                                    popAlert(删除失败)
                                }
                            }
                        });
                    }
                }, '温馨提示',btnArray)
        }else{
            popAlert("未选择任何商品!")
            return;
        }
        /** 当checkbox有选择时才可以提交删除 Auth:zhangqiang Time:2015-09-21 18:20:35  End */
    }

</script>
<script type="application/javascript">
    var storage = window.localStorage;
    jQuery(function(){
    <#if cartItemList?exists && cartItemList?size gt 0>
        jQuery("#cartempty").hide();
        jQuery("#show").show();
    <#else>
        jQuery("#cartempty").show();
        jQuery("#show").hide();
        jQuery("#js").hide();
    </#if>
        getWebRootPath();
        if(storage.getItem("pids")!="" && storage.getItem("pids")!=null){
            var allpids=storage.getItem("pids");
            var pids=allpids.substring(0,(allpids.length-1));
            var pid=pids.split(",");
            for(var i=0;i<pid.length;i++){
                jQuery("#"+pid[i]).find(".check").prop("checked",true);
            }
        }
        sum();//修改顶部商品总价
        ckbox();//单选按钮监听
        jQuery(".mui-content-padded a").bind("click",function(e){
            del(jQuery(this).attr("id"),jQuery(this).attr("price"));
        });
//        jQuery(".gotoorder").bind("click",function(e){
//            goToOrder();
//        });
        jQuery("#checkbox").bind("click",function(e){
            var isChecked = jQuery(this).prop("checked");
            jQuery(".check").prop("checked", isChecked);
            jQuery(".shopcheck").prop("checked", isChecked);
            sum();
        });
        jQuery(".check").on('change',function(){
            sum();
        });
    });
    /**
     * 购物车删除商品
     * @param cartItemid
     * @param cartItemPrice
     */
    function del(cartItemid) {
        clickAllow = "false";
        var btnArray = ['确认', '取消'];
        plus.nativeUI.confirm('您确定要删除吗?',
            function(e) {
                if (e.index == 0) {
                    jQuery.ajax({
                        type: "get",
                        url: '${base}/cart/ajaxDeleteCartId',
                        data: "id="+cartItemid,
                        success: function(data) {
                            if(data.status=='success'){
                                //刷新本页面总价
                                jQuery("#product_"+cartItemid).remove();

                                jQuery("div[shopIdD]").each(function(){
                                    if(jQuery("input[shopid='"+$(this).attr("shopIdD")+"']").length<=0){
                                        jQuery(this).remove();
                                    }
                                })
                                if( jQuery("div[shopIdD]").length<=0){
                                    jQuery("#js").hide();
                                }
                                sum();
                                clickAllow = "true";
                            }else{
                                clickAllow = "true";
                            }
                        }
                    });
                }
            }, '温馨提示',btnArray)
    }
    /*计算订单总价及选购商品总数*/
    function sum(){
        var total=0;
        var nums=0;
        jQuery.each(jQuery(".check"), function(index, checkBox){
            if(jQuery(checkBox).is(':checked')){
                var price=parseFloat(jQuery(checkBox).parent().find(".price").text());
                var num=parseInt(jQuery(checkBox).parent().find(".mui-numbox-input").val());
                var pid=jQuery(checkBox).parent().attr("id");
                pids=storage.getItem("pids");
                if(pids==null){pids="";}
                if(pids.indexOf(pid)<0){pids += pid+",";storage.setItem("pids",pids);}
//                total+=price*num;
                nums += num;
                //var id=jQuery(checkBox).parent().find(".num").attr("id");
                var id = jQuery(checkBox).parent().find("#num").attr("cartitemid")
                jQuery.ajax({
                    type: "get",
                    url: "${base}/cart/ajaxUpdateCartId",
                    data: "id="+id+"&quantity="+num+"&r="+ new Date(),
                    success: function(data) {
                        if(data.status=='success'){
                            clickAllow = "true";
                            //Desc:增加根据数量显示阶梯价 Auth:liuxiaobing Time:2016-01-26 17:59:35 Start
                            //未登录，不计算
                            if(isLogin()) {
                                $("#price_" + id).html(data.batchPrices);
                                price=parseFloat(jQuery(checkBox).parent().find(".price").text());
                                total+=price*num;
                            }else{
                                total+=price*num;
                            }
                            jQuery("#price2").text(new Number(total).toFixed(2));
                            jQuery("#selectedCount").text(nums);
                            //Desc:增加根据数量显示阶梯价 Auth:liuxiaobing Time:2016-01-26 17:59:35 End
                        }else{
                            clickAllow = "true";
                        }
                    }
                });
            }
        });

        storage.setItem("cartlist",jQuery("#cartlist").html());
    }


    jQuery(".check,.shopcheck").on('click',function(){
        ckbox();
        sum();
    });

    jQuery(".check").on('click',function(){
        var s1 = jQuery("input[shopid='"+jQuery(this).attr("shopid")+"']").length;
        var s2 = jQuery("input[shopid='"+jQuery(this).attr("shopid")+"']:checked").length;
        if(s1==0 || s1!=s2){
            jQuery("#shopcheck_"+jQuery(this).attr("shopid")).prop("checked", false);
        }else{
            jQuery("#shopcheck_"+jQuery(this).attr("shopid")).prop("checked", true);
        }
        ckbox();
    });
    function ckbox(){
        var op=0;
        jQuery(".check,.shopcheck").each(function(){
            if(this.checked){op++}
        });
        if(jQuery(".check,.shopcheck").length==op){
            jQuery("#checkbox").prop("checked", true);
        }else{
            jQuery("#checkbox").prop("checked", false);
        }


    }
    /**
     * 跳转到订单页如未登录弹出登录弹窗
     */
    function goToOrder(){
        // popAlert("asdasd");
        //var orderInfoUrl = base+"member/ordercheck";
        //	var selected = $(".item_selected");
        //	popAlert(selected);
        storage.setItem("cartlist",jQuery("#cartlist").html());
        //判断是否存在选中的商品，如果无，不进入结算页面
        var selected = jQuery(".check:checked");

        if(selected != 'undefined' && selected != null && selected.length != 0){
            try {
                var oid = '';
                var num = '';
                var i = 0;
                jQuery(selected).each(function(){
                    if(i > 0){
                        oid += ',';
                    }
                    if(i > 0){
                        num += ',';
                    }
                    oid += jQuery(this).val();
                    num += jQuery(this).val()+":"+$(this).next().find("input").val()
                    i++;
                });

                jQuery("#o").val(oid);
                jQuery("#num").val(num);

                if(!isLogin()) {
                    window.location.href = "${base}/member/login?whichclient=whichapp&type=shoppingCart";
                } else {
                    //添加库存校验 TianYu 2015-8-31
                    $.post("${base}/member/stockJudge",{o:oid},function(d){
                        if( d.success == "success" ){
                            jQuery('#toSettlement').hide();
                            jQuery('#jxgw').hide();
                            jQuery('#scxz').hide();
                            showWaiting();
                            jQuery('#toSettlement').after("<span class='checkout-state'>正在转向订单信息填写页面，请稍候！</span>");
                            jQuery("#cartListForm").attr("action",jQuery("#cartListForm").attr("action") + "&r="+Math.random());
                            window.setTimeout('jQuery("#cartListForm").submit()',3000);
                        }else if(d.success == "isMarketable" ){
                            popAlert( d.msg );
                        }else{
                            popAlert( d.msg );
                        }
                    });
                }
            } catch (e) {

            }
        }else{
            popAlert('请至少选中一件商品');
            //alert('请至少选中一件商品！');
        }
    }

    /**
     * 设置登录标记
     * @param flag
     */
    function setLogin(flag){
        var isLogin = flag ? "1" : "0";
        jQuery("#isLogin").val(isLogin);
    }

    /**
     * 判断是否登录
     * @returns {Boolean}
     */
    function isLogin(){
        var isLogin = jQuery("#isLogin").val();
        if(isLogin == 1){
            return true;
        }else{
            return false;
        }
    }

    (function(mui, doc) {
        mui.init({
            statusBarBackground: '#ffffff',
            swipeBack: true
        });
        mui.back = function(){
            jumpto(fullpath + "/app_index");
        }
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }
        //返回顶部
        jQuery('#backToTop2').bind("tap", function(){
            jQuery('html,body').animate({scrollTop: '0px'}, 100);
        });
    }(mui, document));
    $(window).scroll(function(){
        if ($(window).scrollTop()>100){
            $("#backToTop2").fadeIn(500);
        }else{
            $("#backToTop2").fadeOut(500);
        }
    });
</script>
</body>
</html>