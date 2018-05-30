<!DOCTYPE html>
<html>
<head>
    <#assign path="${base}/static/app/nsc"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>我的购物车</title>
    <link href="${path}/theme/red/mui.min.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${path}/theme/red/function.css">
    <link href="${path}/theme/red/my.css" rel="stylesheet" />
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
        </style>
    <script src="${path}/js/mui.min.js" type="text/javascript"></script>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
</head>
<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>返回
    </button>
    <div class="mui-title mui-pull-right ">
        购物车
    </div>
</header>
<div class="mui-content" style="padding-bottom: 50px;">
    <div id="cartempty" style="display:none;">
        <div class="message">
            <ul>
                <li>购物车内暂时没有商品 <a href="${base}/app_index" style="color: burlywood">去首页</a>挑选喜欢的商品</li>
            </ul>
        </div>
    </div>
    <div id="show">
        <input type="hidden" value="${isLogin}" id="java.net.ConnectException: Connection refused: no further information">
        <div class="mui-content">
            <ul class="mui-table-view2" style="height:80px; overflow:hidden;">
                <form class="mui-input-group2">
                    <li class="mui-input-row mui-checkbox mui-left f-cb">
                        <div style=" float:left; width:60%; margin-top:8px; position:relative;">
                            <input id="checkbox" name="checkbox" type="checkbox" style="margin-top: 10px;">
                            <label>
                                <div class="mui-title2 mui-content-p">
                                    <p><a href="#"  style="color:#8f8f94;">全选</a>/<a href="#"  style="color:#8f8f94;"> 取消全选</a></p>
                                    <p>商品总价：￥<span style="color:#F00; font-weight:bold;" id="price1">0</span></p>
                                </div>
                            </label>
                        </div>
                        <div style="float:right; width:40%; height:38px; line-height:38px;margin-top:20px;" class="f-cb">

                            <button class="mui-btn-primary f-fr" style="margin-right:5px;">
                                <a href="javascript:void(0);" class="gotoorder">去结算</a>
                            </button>
                        </div>
                    </li>
                </form>
            </ul>
        </div>
        <div class="mui-content" id="cartlist">
            <ul class="mui-table-view">
                <form class="mui-input-group" action="${base}/member/ordercheck?whichclient=whichapp" method="POST">
                    <input type="hidden" name="o" id="o" value=""/>
                    <#assign total = 0>
                    <#assign totalPrice = 0>
                    <#list cartItemList as cartItem>
                    <#assign total = total+cartItem.quantity>
                    <#assign price = (cartItem.price?number)*cartItem.quantity>
                    <#assign totalPrice = totalPrice+price>
                    <li  id="product_${cartItem.id}" class="mui-input-row mui-checkbox mui-left">
                        <input name="checkbox" type="checkbox" class="check"  style="margin-top:30px;">
                        <div class="mui-gwc-box">
                            <a href="${base}/item/whichapp/${cartItem.goodsId}.html" title="${cartItem.name}"><img class="mui-media-object mui-pull-left" src="${cartItem.pic}_48x60.png"></a>
                            <div class="mui-media-body">
                                <p class="f-fl mui-ellipsis-2" style="margin-top:10px; overflow: hidden; " >
                                    <a href="${base}/item/whichapp/${cartItem.goodsId}.html" class="color-000">${cartItem.name!''}</a></p>
                                <p class="f-fl">
                                    <input type="input" value="${cartItem.quantity}" style="width:30px; float:left;  padding:0 0 0 8px; height:30px; border:1px solid #ccc;" class="num"
                                           onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                           onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                           id="${cartItem.id}">
                                    <span style="display:block; float:left; margin:6px 0 0 5px;">￥<font class="price">${cartItem.price}</font></span>
                                <div class="mui-content-padded  f-fr" style="margin-right: 10px;">
                                    <a href="javascript:void(0);" id="${cartItem.id}" price="${cartItem.price}" data-name="${cartItem.name}" class="color-096"><span class="mui-icon mui-icon-trash"></span></a>
                                </div>
                                </p>
                            </div>
                        </div>
                    </li><!-- product_${cartItem.id}-list end -->
                    </#list>
                    </form>
                </ul>
        </div>
    </div>
</div>
<nav class="mui-bar2 mui-bar-tab">
    <div class="mui-table-view2" >
        <div class="mui-title2 mui-center">
            <p>共计<span id="selectedCount">${total}</span>件商品</p>
            <p>商品总价：￥<span style="color:#F00; font-weight:bold;" id="price2">${totalPrice}</span></p>
        </div>
        <button class=" mui-btn-primary mui-pull-right" style=" margin-top:2px; margin-right:5px;">
            <a href="javascript:void(0);" class="gotoorder">去结算</a>
        </button>
    </div>
</nav>
<script>
    var storage = window.localStorage;
    var fullpath = "";
    var ismobile=true;
    if(typeof(mui.os.android)=='undefined' && typeof(mui.os.ios)=='undefined'){
        ismobile=false;
    }
    if(typeof(mui.os.plus)=='undefined'){
        ismobile=false;
    }
    jQuery(function(){
    <#if cartItemList?exists && cartItemList?size gt 0>
        jQuery("#cartempty").hide();
        jQuery("#show").show();
    <#else>
        jQuery("#cartempty").show();
        jQuery("#show").hide();
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
        jQuery(".mui-action-back").bind("tap click",function(e){
            var url=fullpath + '/app_index';
            if(ismobile){
                mui.openWindow({
                    url: url,
                    id:'home'
                });
            }else {
                window.location.href = url;
            }
        });
        sum();//修改顶部商品总价
        jQuery(".mui-content-padded a").bind("tap click",function(e){
            del(jQuery(this).attr("id"),jQuery(this).attr("price"));
        });
        jQuery(".gotoorder").bind("tap click",function(e){
            goToOrder();
        });
        jQuery("#checkbox").bind("tap click",function(e){
            var isChecked = jQuery(this).prop("checked");
            jQuery(".check").prop("checked", isChecked);
            sum();
        });
        jQuery(".check").on('change',function(){
            sum();
        });
        jQuery(".num").bind("change blur",function(e){
            clickAllow = "false";
            var num=jQuery(this).val();
            var id=jQuery(this).attr("id");
            jQuery.ajax({
                type: "get",
                url: "${base}/cart/ajaxUpdateCartId",
                data: "id="+id+"&quantity="+num+"&r="+ new Date(),
                success: function(data) {
                    if(data.status=='success'){
                        sum();
                        clickAllow = "true";
                    }else{
                        clickAllow = "true";
                    }
                }
            });
        })
    });
    /**
     * 购物车删除商品
     * @param cartItemid
     * @param cartItemPrice
     */
    function del(cartItemid) {
        clickAllow = "false";
        jQuery.ajax({
            type: "get",
            url: '${base}/cart/ajaxDeleteCartId',
            data: "id="+cartItemid,
            success: function(data) {
                if(data.status=='success'){
                    //刷新本页面总价
                    jQuery("#product_"+cartItemid).remove();
                    if(jQuery(".check").length<=0){
                        jQuery("#cartempty").show();
                        jQuery("#show").hide();
                    }
                    sum();
                    clickAllow = "true";
                }else{
                    clickAllow = "true";
                }
            }
        });
    }

    /*获取全路径*/
    function getWebRootPath() {
        var webroot=document.location.href;
        var header = webroot.substring(0, webroot.indexOf('//')+2);
        webroot=webroot.substring(webroot.indexOf('//')+2,webroot.length);
        var serverName = webroot.substring(0, webroot.indexOf('/')+1);
        webroot=webroot.substring(webroot.indexOf('/')+1,webroot.length);
        webroot=webroot.substring(0,webroot.indexOf('/'));
        var rootpath="/"+webroot;
        fullpath = header  + serverName + webroot;
        return header  + serverName;
    }

    /*计算订单总价及选购商品总数*/
    function sum(){
        var total=0;
        var nums=0;
        jQuery(".check").each(function(){
            if(jQuery(this).is(':checked')){
                var price=parseFloat(jQuery(this).parent().find(".price").text());
                var num=parseInt(jQuery(this).parent().find(".num").val());
                var pid=jQuery(this).parent().attr("id");
                pids=storage.getItem("pids");
                if(pids==null){pids="";}
                if(pids.indexOf(pid)<0){pids += pid+",";storage.setItem("pids",pids);}
                total+=price*num;
                nums += num;
                var id=jQuery(this).parent().find(".num").attr("id");
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
        jQuery("#price1,#price2").text(total);
        jQuery("#selectedCount").text(nums);
        storage.setItem("cartlist",jQuery("#cartlist").html());
    }


    /**
     * 跳转到订单页如未登录弹出登录弹窗
     */
    function goToOrder(){
        //alert("asdasd");
        //var orderInfoUrl = base+"member/ordercheck";
        //	var selected = $(".item_selected");
        //	alert(selected);
        storage.setItem("cartlist",jQuery("#cartlist").html());
        //判断是否存在选中的商品，如果无，不进入结算页面
        var selected = jQuery(".check:checked");

        if(selected != 'undefined' && selected != null && selected.length != 0){
            try {
                var oid = '';
                var i = 0;
                jQuery(selected).each(function(){
                    if(i > 0){
                        oid += ',';
                    }
                    oid += jQuery(this).val();
                    i++;
                });

                jQuery("#o").val(oid);

                if(!isLogin()) {
                    window.location.href = "${base}/member/login?whichclient=whichapp";
                } else {
                    jQuery('#toSettlement').hide();
                    jQuery('#toSettlement').after("<span class='checkout-state'>正在转向订单信息填写页面，请稍候！</span>");

//				window.setTimeout('window.location.href = orderInfoUrl+"?r="+Math.random()+"&o="+oid;',3000);
//				window.location.href = orderInfoUrl+"?rd="+Math.random()+"&o="+oid;
                    jQuery("#cartListForm").attr("action",jQuery("#cartListForm").attr("action") + "&r="+Math.random());
                    window.setTimeout('jQuery("#cartListForm").submit()',3000);
                    jQuery("#cartListForm").submit()
                }
            } catch (e) {
//			window.setTimeout('window.location.href = orderInfoUrl+"?r="+Math.random(),1000);
//			window.location.href = orderInfoUrl+"?rd="+Math.random();
            }
        }else{
            alert('请至少选中一件商品！');
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
</script>
</body>
</html>