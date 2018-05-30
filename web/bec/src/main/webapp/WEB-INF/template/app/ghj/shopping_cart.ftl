<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
<#include "app/ghj/head.ftl">
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
        .mask{
            position:absolute;
            left:0;
            top:0;
            z-index:100;
            height:100%;
            width:100%;
            background:black;
            opacity:0.4;
            filter:alpha(opacity=40)
        }
        .mui-icon-back:before, .mui-icon-left-nav:before{ color: #666;}
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
                    <!--<input type="hidden" name="o" id="o" value=""/>-->
                        <!--<input type="hidden" name="num" id="num" value=""/>-->
                <#assign total = 0>
                <#assign totalPrice = 0>
                      
                <#list cartItemList  as map>

                    <div class="shop-title customize-shtit" shopIdD="${map.shopId}" style="border-bottom: 1px dotted #d8d8d8; padding:2px 0;display: none;">
                        <div class="item">
                            <span class="mui-checkbox"><input  type="checkbox" class="shopcheck" id="shopcheck_${map.shopId}" onclick="shopAllCheck(this);" shopIdF="${map.shopId}" checked="true" style="right:2px;top:8px;"></span>
                            <div class="shop-title-content"> <a href="${base}/shop/${map.shopUrl}?whichclient=whichapp"> <span class="shop-title-name">${map.shopName}</span> <span class="shop-title-detail"> <span style="width: 30px;"> <img src="${base}/static/app/ghj/images/icon-left.png"> </span> </span> </a> </div>
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
                                <a href="${base}/item/whichapp/${cartItem.goodsId}.html" title="${cartItem.name}"><img style="margin-top: 17px;" class="mui-media-object mui-pull-left" src="${cartItem.pic}@300w_300h.png"></a>
                                <div class="mui-media-body">
                                    <#list cartItemListMj as map>
                                        <#if cartItem.goodsId==map.goodsId>
                                            <span onclick="showMjhdView('${map.goodsId}_view')" style="display: none1;font-size: 10px;background: #ff4401;color:#fff;position: absolute;right:0px;top: 0px;">&nbsp;${map.activityFullCut.mjName}&nbsp;</span>
                                            <div id="${map.goodsId}_view" style="display: none">
                                                <span style="border:1px solid red;font-size: 14px;border-radius:3px;color: #ff4401;">&nbsp;${map.activityFullCut.mjName}&nbsp;</span>
                                                <#if map.activityFullCutPrice?? && map.activityFullCutPrice?size &gt; 0>
                                                    <#list map.activityFullCutPrice as price>
                                                        <span style="font-size: 14px;"><#if price_index!=0>,</#if>满${price.totalPrice}元减${price.decreaseAmount}元</span>
                                                    </#list>
                                                </#if>
                                            </div>
                                        </#if>
                                    </#list>
                                    <div class="cart-product-name" style="margin-top:15px;height: 2.8em;">
                                        <a href="${base}/item/whichapp/${cartItem.goodsId}.html" class="color-000"><span style="line-height:1.5em;height: 3.2em;"><font style="font-weight: bold;color: #E4393C;">[<#if cartItem.stock<=0>无货<#else>有货</#if>]</font>${cartItem.name!''}</span></a>
                                        <!--<a href="${base}/item/whichapp/${cartItem.goodsId}.html" class="color-000"><span style="line-height:1.5em;height: 3.2em;"><font style="font-weight: bold;color: #85C226;">[<#if cartItem.stock<=0>无货<#else>有货</#if>]</font>${cartItem.name!''}</span></a>-->
                                    </div>

                                    <div class="cart-product-name" style="margin-top:5px;margin-bottom:3px;height: 1.5em;overflow: hidden;text-overflow:ellipsis;">
                                        <span style="line-height:1.5em;height: 3.2em;">${cartItem.specification}</span>
                                    </div>
				    <!--
                                    <div class="mui-numbox" style="width: 35px;height: 25px; margin:0; float: left;padding:0 30px;">
                                        <button class="mui-numbox-btn-minus" style="width: 30px;" type="button" onClick="clickNum()">-</button>
                                        <input class="mui-numbox-input" style="width: 23px;padding:0 0px!important" type="input"   id="num" name="num"  onchange="changEwpCartitemNum(this)" cartItemid="${cartItem.id}" onBlur="checkNum2()" value="${cartItem.quantity}"/>
                                        <button class="mui-numbox-btn-plus" style="width: 30px;border-left:solid 1px #ccc!important"  type="button">+</button>
                                    </div>-->
				   
				    <span style="display:block; float:left; font-size: 14px;color:#E4393C;line-height:30px; padding-left: 5px;margin-top: -40px;"> ￥<font class="price">${cartItem.price}</font></span>
				    <div class="mui-numbox" style="width: 44px;height: 30px;margin-top: -5px;float: left;" data-numbox-step='${cartItem.packageModulus}'>
					<button class="mui-numbox-btn-minus" type="button" onclick="subtract(this,${cartItem.startNum},${cartItem_index})">-</button>
					<input class="mui-numbox-input" type="number" type="input" min="${cartItem.startNum}" max="${cartItem.limitNum}"  id="num" name="num" onchange="changEwpCartitemNum(this)" cartItemid="${cartItem.id}" onBlur="checkNum2(this)"  packgeModulus="${cartItem.packageModulus}" value="${cartItem.quantity}" />
					<button class="mui-numbox-btn-plus" type="button" onclick="augment(this,${cartItem.limitNum},${cartItem_index})" style="disabled:true;">+</button>
				    </div>
				    <span style="font-size:14px;">共<span id="goodsNum${cartItem_index}">${cartItem.quantity/cartItem.packageModulus}</span><#if cartItem.packageUnit??>${cartItem.packageUnit}<#else>件</#if></span>
                                    <div class="mui-content-padded  f-fr" style="padding:0;">
                                        <a href="javascript:void(0);" id="${cartItem.id}" price="${cartItem.price}" data-name="${cartItem.name}" class="color-096"><span class="mui-icon mui-icon-trash"></span></a>
                                    </div>
                                    </p>
                                </div>
                            </div>
                        </li><!-- product_${cartItem.id}-list end -->
			</#list>
                    </#list>
               
                </form>
            </ul>
        </div>
    </div>
</div>
<div class="mask" style="display: none" id="mask"></div>
<nav class="mui-bar2 mui-bar-tab" id="mjView" style="z-index: 101;display: none">
    <div class="mui-table-view2" >
    <div style="height: 30px;text-align: center;line-height: ">活动促销信息</div>
       <div style="padding: 0px 10px" id="mjViewContent">
       </div>
    </div>
    <div onclick="$('#mjView').hide(); $('#mask').hide();" style="background-color: #ff4401;height: 40px;text-align: center;line-height: 40px;color: #fff;font-size: 16px;">关闭</div>
</nav>
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
            <a href="javascript:void(0);" class="gotoorder" id="toSettlement">提交订单</a>
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
    //满减活动
    function showMjhdView(id){
        $("#mask").show();
        $("#mjViewContent").html($("#"+id).html());$("#mjView").slideDown();
    }


    //加减
   /* function add_subtract(obj){
        var op=$(obj).attr("op");//加减标识
        var step=$(obj).attr("step");//加减系数
        var startNum=$(obj).attr("ng-gis");
        var min=1;//最小值
        var max=$(obj).attr("max");//最大值
        var reg = new RegExp("^[0-9]*$");
        var newObj=obj;
        if(op=='+'){
            newObj=$(obj).prev();
            if($(obj).prev().attr("max")!='' &&　$(obj).prev().attr("max")!='undefined' &&　reg.test($(obj).prev().attr("max"))){
                max=$(obj).prev().attr("max");
            }
	   
            if(parseInt($(obj).prev().val())<max){
                $(obj).prev().val(parseInt($(obj).prev().val())+parseInt(step)-1);
            }else if(parseInt($(obj).prev().val())>=max){
		$(obj).val(max);
            	popAlert('商品数量不得大于限购数量!');
            	return;
	    }
        }else{
        	newObj=$(obj).next();
            if($(obj).next().attr("min")!='' &&　$(obj).next().attr("min")!='undefined' &&　reg.test($(obj).next().attr("min"))){
                min=$(obj).next().attr("min")
            }
            if(parseInt($(obj).next().val())>startNum){
                $(obj).next().val(parseInt($(obj).next().val())-parseInt(step)+1);
            }else if(parseInt($(obj).next().val())<=startNum){
	        $(obj).next().val(startNum);
            	popAlert('商品数量不得小于起批数量!');
            	return;
            }
        }
       	console.log(newObj);
    }*/

    //加 jincheng-zhao
    function augment(obj,max,index){
	//当前数量
	var total=parseInt($(obj).prev().val()); 
	if(total>max){
	    $(obj).prev().val(max);
	    $(obj).prev().attr("value",max);
            popAlert('商品数量不得大于限购数量!');  	
	}else{
	   $(obj).prev().attr("value",total);
	   $("#goodsNum"+index).html(parseInt($("#goodsNum"+index).html())+1);
	}
    }
    //减 jincheng-zhao
    function subtract(obj,min,index){
	//$(obj).removeAttr("disabled");
	//当前数量
	var total=parseInt($(obj).next().val()); 
	if(total<min){
	    $(obj).next().val(min);
	    $(obj).next().attr("value",min);
            popAlert('商品数量不得小于起批数量!');	
	}else{
	   $(obj).next().attr("value",total);
	   $("#goodsNum"+index).html(parseInt($("#goodsNum"+index).html())-1);
	}
    }

     function checkNum2(obj){
	   var total=$(obj).val(); //当前输入的值
	   var packgeModulus=$(obj).attr("packgeModulus");　//起批数量
	   var max=$(obj).attr("max");//最大限购数量
	   if(parseInt($(obj).val())<packgeModulus){
		//最小起批数量
		$(obj).val($(obj).attr("packgeModulus"));
		$(obj).attr("value",$(obj).attr("packgeModulus"));
		popAlert('商品数量不得小于起批数量!');
		return;
	   }else if(parseInt($(obj).val())>max){
		//最大限购数量
		$(obj).val(max);
		$(obj).attr("value",max);
		popAlert('商品数量不得大于限购数量!');
		return;
	   }
	  
	   if(total%packgeModulus!=0){
		total=(parseInt(total / packgeModulus) + 1) * packgeModulus;
		$(obj).val(total);
		$(obj).attr("value",max);
		
	   }
	   $("#goodsNum").html(parseInt(total / packgeModulus));
    }
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
	//当前数量
        var total=jQuery(obj).val();
	//起批数量
	var packgeModulus=$(obj).attr("packgeModulus");
	//最大限购数量　
	var max=$(obj).attr("max");

        /*if(!reg.test(jQuery(obj).val())){
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
        }*/
	
	if(parseInt($(obj).val())<packgeModulus){
	   //最小起批数量
	   $(obj).val($(obj).attr("packgeModulus"));
	   $(obj).attr("value",$(obj).attr("packgeModulus"));
	   popAlert('商品数量不得小于起批数量!');
	   return;
	}else if(parseInt($(obj).val())>max){
           //最大限购数量
	   $(obj).val(max);
	   $(obj).attr("value",max);
	   popAlert('商品数量不得大于限购数量!');
	   return;
	}
	
        if(reg.test(jQuery(obj).val())){
            var clickAllow="";
            $.ajax({
                type: "get",
                url: "${base}/cart/ajaxUpdateCartId",
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
    //手动输入数量校验
    /*function checkNum2(obj){
   
        if(!checkNum(document.getElementById("num").value)){
            document.getElementById("num").value=1;
        }else{
            if(parseInt(document.getElementById("num").value)<1){
                document.getElementById("num").value=1;
            }
        }
    }*/


   

    //删除选中
    function deleteChecked(){
        clickAllow = "false";
        var ids = '';
        var cartIds = $("#cartlist input[name='cartId']:checked");// ID复选框
        /** 当checkbox有选择时才可以提交删除 Auth:zhangqiang Time:2015-09-21 18:20:35  Start */
        if(cartIds.length > 0){
            var layer_confrim = layer.open({
                title:'温馨提示：',
                content:'您确定要删除吗?',
                btn: ['确认', '取消'],
                shadeClose: false,
                yes: function(){
                    layer.close(layer_confrim);
                    showWaiting();
                    jQuery.ajax({
                        type: 'get',
                        url: '${base}/cart/ajaxDeleteCartIds/',
                        data: cartIds.serialize(),
                        success: function (data) {
                            if (data.status == 'success') {
                                location.reload(true);
                            }else{
                                popAlert('删除失败');
                            }
                        },
                        error:function(data){
                            popAlert('网络异常，请稍后再试!');
                            closeWaiting();
                        }
                    });
                },
                no: function(){
                    closeWaiting();
                }
            });

        }else{
            alert("未选择任何商品!")
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
        var layer_confrim = layer.open({
            title:'温馨提示：',
            content:'您确定要删除吗?',
            btn: ['确认', '取消'],
            shadeClose: false,
            yes: function(){
                layer.close(layer_confrim);
                showWaiting();
                jQuery.ajax({
                    type: 'get',
                    url: '${base}/cart/ajaxDeleteCartId',
                    data: "id="+cartItemid,
                    success: function (data) {
                        if (data.status == 'success') {
                            //刷新本页面总价
                            jQuery("#product_" + cartItemid).remove();

                            jQuery("div[shopIdD]").each(function () {
                                if (jQuery("input[shopid='" + jQuery(this).attr("shopIdD") + "']").length <= 0) {
                                    jQuery(this).remove();
                                }
                            });
                            if (jQuery("div[shopIdD]").length <= 0) {
                                jQuery("#js").hide();
                            }
                            sum();
                            clickAllow = "true";
                        } else {
                            clickAllow = "true";
                        }
                        closeWaiting();
                    },
                    error:function(data){
                        popAlert('网络异常，请稍后再试!');
                        closeWaiting();
                    }
                });
            },
            no: function(){
                closeWaiting();
            }
        });

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
                total+=price*num;
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
                        }else{
                            clickAllow = "true";
                        }
                    }
                });
            }
        });
        jQuery("#price2").text(new Number(total).toFixed(2));
        jQuery("#selectedCount").text(nums);
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
        // alert("asdasd");
        //var orderInfoUrl = base+"member/ordercheck";
        //	var selected = $(".item_selected");
        //	alert(selected);
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

                //jQuery("#o").val(oid);
                //jQuery("#num").val(num);

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

                            jQuery("#cartListForm").attr("action",jQuery("#cartListForm").attr("action") + "&o=" + oid + "&num=" + num + "&r="+Math.random());
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
        /*mui.back = function(){
            jumpto(fullpath + "/app_index");
        }*/
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