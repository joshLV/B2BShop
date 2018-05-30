
<!DOCTYPE html>
<html>
<head>
<#include "app/ghj/head.ftl">
<style>
	/*新加样式  12-31*/
	.logo {
	    position: absolute;
	    left: 10px;
	    float: left;
	}
	.logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghj/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:13px;}

    .mui-content h5 {
        padding-top: 10px;
        padding-bottom: 10px;
        color: #333;
        font-size: 16px;
    }
    a:hover {
        color: #fe0000;
    }

    er {
        color: #dddddd;
    }
    .mask{
            position:fixed;
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
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" onclick="javascript:window.history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <!--<div class="logo"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');" class="ltext">返回</a></div>
   -->
    <div class="mui-center mui-title ">
        我的关注
    </div>
    <button type="button" id="jxgw" onclick="javascript:deleteAll();" class="mui-btn  mui-btn-link mui-btn-nav mui-pull-right" style="margin-right:0px; padding-left: 6px;">
        <span class="mui-icon mui-icon-right-nav"></span>清空关注
    </button>
</header>


<div class="mui-content" style="padding-bottom:50px;" id="content">
    <div class="myorder1" style="margin-top: 16px;">
        <div class="viewport" id="tabs" style=" padding-left: 0!important; padding-right:0!important; width: 100%!important;">
            <div id="order01" class="order_list01">
                <div style="height: 5px;"></div>
                <#list goodsAttentionList as goodsAttention>
                <dl title="unconfirm" id="${goodsAttention.id}" name="${goodsAttention.goodsId}">
                    <dd>
                        <div class="order-goods">
                            <div class="face"><a href="${base}/item/whichapp/${goodsAttention.goodsId}.html"><img src="${goodsAttention.image}@150w_150h.png"></a></div>
                            <div class="info"> <a href="${base}/item/whichapp/${goodsAttention.goodsId}.html">${goodsAttention.name}</a> </div>
                        </div>

                        <div class="tools">
                            <#if goodsAttention.type==0>
                            <a href="javascript:void(0);" onclick="addCart('${goodsAttention.goodsId}','${goodsAttention.name}','${goodsAttention.id}');" class="JS_order_btn " style="background:#DB0000;color:#fff;border-color:#DB0000;"><img src="${base}/static/mall/img/gwc_icon.png" style="margin-right: 5px;">加入购物车</a>
                            </#if>
                            <a onclick="deleteOne('${goodsAttention.id}');" href="javascript:void(0);" class="JS_order_btn ">清除该关注 </a>
                        </div>

                        <nav class="goodsId_tools mui-bar mui-bar-tab" id="goodsId" style="z-index: 101;display: none;">

                        </nav>
                    </dd>
                </dl>
                </#list>
            </div>
        </div>
    </div>
    <div class="checkout_btn">
        <a id="loadmore" class="gray_btn" class="mui-control-item" href="#buttom" style="background-color:#F4F4F4;">上拉加载更多</a>
    </div>
    <div id="buttom"></div>
    <input type="hidden" id="pageNumber" value="${pager.pageNumber}"/>
    <input type="hidden" id="pageCount" value="${pager.pageCount}"/>
    <input type="hidden" id="pageSize" value="${pager.pageSize}"/>
    
</div>

<div class="return">
    <a id="backToTop" href="#silder" class="mui-control-item"><img src="${path}/images/return.png"></a>
</div>

    <script>
        var loadop=true;
        /**
         * 关闭选择规格面板
         */
        function closeSpPanel(goodsId){
	    $("#mask").hide();
            $("#goodsId").html("");
        }
	$(window).scroll(function(){
		$("#mask").css("height",$(document.body).height());
	})
        (function(mui, doc) {
            mui.init({
                statusBarBackground: '#FFFFFF'
            });
            if(ismobile) {
                mui.plusReady(function () {
                    //关闭等待框
                    plus.nativeUI.closeWaiting();
                    //显示当前页面
                    plus.webview.currentWebview().show();
                });
            }
            fmoney=function (s, n)
            {
                var res = "0.00";
                if(typeof(s) == 'undefined' || !jQuery.isNumeric(s)){
                    return res;
                }
                n = n > 0 && n <= 20 ? n : 2;
                s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
                // return s;

                var l = s.split(".")[0].split("").reverse();
                var r = s.split(".")[1];
                t = "";
                for(i = 0; i < l.length; i ++ )
                {
                    t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
                }
                res = t.split("").reverse().join("") + "." + r;

                if( res == "0.00"){
                    return "价格面议";
                }else{
                    return res;
                }

            };
            loadData = function(){
                loadop=false;
                jQuery("#loadmore").html("<img src='${path}/images/loading.gif'>");

                var pageNumber = parseInt(jQuery("#pageNumber").val());
                var pageCount = parseInt(jQuery("#pageCount").val());
                var pageSize = parseInt(jQuery("#pageSize").val());

                pageNumber = pageNumber + 1;
                var url = fullpath + "/member/goodsattention/loadmore";
                jQuery.ajax({
                    type: "post",
                    url: url,
                    data: {'pageNumber': pageNumber,'pageSize': pageSize},
                    datatype: 'json',
                    success: function(data) {
                        if(data.status == 'success'){
                            if(typeof (data.data) == 'undefined' || data.data.length == 0){
                                jQuery("#loadmore").attr("style","background-color:#ddd")
                                jQuery("#loadmore").html("没有更多商品了");
                                loadop=false;
                                return;
                            }

                            jQuery("#pageNumber").val(data.pager.pageNumber);
                            jQuery("#pageCount").val(data.pager.pageCount);

                            var num=${(pager.pageNumber-1)*pager.pageSize};
                           // var num=(data.pager.pageNumber-1)*pageSize;
                            jQuery.each(data.data, function(index, ga){
                                var lastGoodsAttention = jQuery("dl").last();
                                var domGA = lastGoodsAttention.clone();
                                jQuery(domGA).prop('id', ga.id);
                                jQuery(domGA).find(".face").find("a").prop('href', fullpath + "/item/whichapp/" + ga.id  + ".html").html('<img src=' + ga.image + '@150w_150h.png>');
                                jQuery(domGA).find(".info").find("a").prop('href', fullpath + "/item/whichapp/" + ga.id  + ".html").html(ga.name);
                                //jQuery(domGA).find("h4").html('商城价:<font>￥' + fmoney(ga.price, 2) + '</font><span style="font-size: 12px;color: #666">&nbsp;市场价:<del>￥' + fmoney(ga.marketPrice, 2) + '</del></span>');
                                jQuery(domGA).find(".tools").find("a").first().attr("onclick","addCart(\'"+ ga.goodsId+"\',\'"+ga.name+"\',\'"+ ga.id+"\')");//bind('click', function(){addCart(ga.goodsId,ga.name,ga.id);});
                                jQuery(domGA).find(".tools").find("a").last().attr("onclick","deleteOne(\'"+ga.id+"\')");
                                jQuery(domGA).find(".goodsId_tools").attr("id","goodsId_"+ga.id);
                                jQuery(domGA).find(".goodsId_tools").attr("name","goodsId_"+ga.goodsId);
                                lastGoodsAttention.after(domGA);

                            });
                            loadop=true;
                        }else{
                            jQuery("#loadmore").attr("style","background-color:#ddd")
                            jQuery("#loadmore").html("加载失败，稍后再试");
                        }
                    },
                    error:function(data){
                        jQuery("#loadmore").attr("style","background-color:#ddd")
                        jQuery("#loadmore").html("加载失败，稍后再试");
                    }
                });
            };


            var screenheight = window.screen.availHeight; //获取屏幕高
            jQuery(window).scroll(function(){
                if (jQuery(window).scrollTop()>100){
                    jQuery("#backToTop").fadeIn(500);
                }else{
                    jQuery("#backToTop").fadeOut(500);
                }
                var scr = jQuery(window).scrollTop();
                var conH=document.getElementById("content").offsetHeight;//获取内如高度
                if(screenheight+scr>conH-100){
                    if(loadop){
                        loadData();
                    }
                }
            });

            deleteAll = function (){

                var layer_confrim = layer.open({
                    title:'提示：',
                    content:'确认删除所有关注?',
                    btn: ['确认', '取消'],
                    shadeClose: false,
                    yes: function(){
                        layer.close(layer_confrim);
                        showWaiting();
                        jQuery.ajax({
                            type: "get",
                            url: "${base}/member/goodsattention/ajaxDeleteAllByMemberId",
                            success: function(data) {
                                if(data.status=='success'){
                                    //刷新本页面
                                    location.replace("${base}/member/goodsattention/list?whichclient=whichapp");
                                }
                                closeWaiting();
                            },
                            error:function(data){
                                closeWaiting();
                                popAlert(data.message);
                            }
                        });
                    },
                    no: function(){
                        layer.close(layer_confrim);
                    }
                });
            };

            deleteOne = function (id){
                showWaiting();
                jQuery.ajax({
                    type: "get",
                    url: "${base}/member/goodsattention/ajaxDeleteGoodsAttentionId",
                    data: "id="+id,
                    success: function(data) {
                        if(data.status=='success'){
                            jQuery("#"+id).remove();
                        }
                        closeWaiting();
                    },
                    error:function(data){
                        closeWaiting();
                        popAlert(data.message);
                    }
                });
            };
            addCart = function (goodsId,goodsName,id) {
	        $("#mask").show();
                //var goodsId="1603301131513561265";
                var num=1;
                $.ajax({
                    type: "post",
                    url: "${base}/member/goodsattention/appList",
                    async:false,
                    data: {
                        'goodsId': goodsId
                    },
                    success: function(data) {
                        if (data.status == 'success') {
                            num= data.data.packageModulus;
                        }
                    }
                });
                //获取商品详情
                $.ajax({
                    type: "post",
                    url: "${base}/goods/getGoodsDetailTypeToApp",
                    data:{'goodsId':goodsId},
                    datatype: 'json',
                    success: function(data) {
                        //解析数据
                        var json = eval("(" + data + ")");
                       var html='<div style="right: 5px;top: 5px;width: 21px;height:18px;float: right;" onclick="closeSpPanel(\''+id+'\')"><img src="${base}/static/img/close.png"></div>'+
                                '   <div style="margin-left: 10px;">'+
                                '       <div>'+
                                '           <p style="color: #000000;line-height: 25px;font-size: 14px;">商品名称：'+ goodsName +'</p>'+
                                '             <p style="color: #000000;line-height: 25px;font-size: 14px;" id="ckSpParent">您选择了：<span id="ckSp'+id+'"></span></p>';
                        for(var i=0;i<json.goodsSpList.length;i++) {

                            html += '<li id="choose-' + json.goodsSpList[i].id + '" style="text-align: left" >' +
                                    '  <div class="dt" id="' + json.goodsSpList[i].id + '_sp" style="font-size: 14px;line-height: 25px;">' + json.goodsSpList[i].name + '：</div>';

                            html+='<input type="hidden" name="goodsSp'+id+'" id="goodsSp_'+id+i+'" spname="'+json.goodsSpList[i].name+'"> ';
                            for (var j = 0;j < json.goodsSpItemList.length;j++) {
                                if(json.goodsSpItemList[j].specificationId==json.goodsSpList[i].id){
                                    /*if(i==0){
                                        html+='<input type="hidden" name="goodsSp'+id+'" id="goodsSp_'+json.goodsSpList[i].id +'" value="'+json.goodsSpItemList[j].name+'" spname="'+json.goodsSpList[i].name+'"> ';
                                    }*/
                                    html+='<div style="float: left;background-color: #eceaea;margin-right:5px;font-size: 14px; -moz-border-radius: 15px;-webkit-border-radius: 15px;border-radius:15px;padding: 2px;margin-top: 3px;margin-bottom: 3px;">';
                                    if(i == 0) {
                                        html+='<div class="item'+id+' selected" style="min-width: 35px;text-align: center;">';
                                    }else{
                                        html+='<div class="item'+id+'" style="min-width: 35px;text-align: center;">';
                                    }
                                    if(json.goodsSpList[i].type==1 ){

                                        html+='<a class="spValItem'+id+'" style="font-size: 12px;" href="javascript:void(0)" onclick="chekedSp(' +
                                                '\goodsSp_'+id+i+'\','+json.goodsSpItemList[i].id+'_item\',\''+json.goodsSpItemList[i].name+'\,'+id+');" id="'+json.goodsSpItemList[j].id+'_item" title="'+ json.goodsSpItemList[j].name +'">'+
                                        json.goodsSpItemList[j].name+ '<img src="'+json.goodsSpItemList[j].pic+'" style="margin-top: 1px;padding-left: 1px;padding-right: 3px" width="16" height="16"></a>';
                                    }else{

                                        html+='<a class="spValItem'+id+'" href="javascript:void(0)" onclick="chekedSp(\'goodsSp_'+id+i+'\',\''+ json.goodsSpItemList[j].id +'_item\',\''+ json.goodsSpItemList[j].name +'\',\''+id+'\');" id="'+ json.goodsSpItemList[j].id +'_item" title="'+ json.goodsSpItemList[j].name +'">'+json.goodsSpItemList[j].name+'</a>';
                                    }

                                    html+='</div></div>';

                                }
                            }
                            html+='</li><div style="clear: both;"></div>';

                        }
                        html+='<div style="margin-bottom: 50px;"></div>';
                        //1603301131513561265

                        html+='<div style="width: 100%;float: left;">'+
                                '  <div style="float: left;margin-top: -40px;margin-right: 10px;"><p style="font-size: 14px;">购买数量</p></div>'+
                                '     <div class="mui-numbox" style="width: 44px;height: 30px;margin-left: 80px; margin-top: -80px;">'+
                                '         <button class="mui-numbox-btn-minus" type="button" onClick="clickNum('+num+',\''+id+'\')">-</button>'+
                                '         <input class="mui-numbox-input" type="number"  id="num'+id+'" onchange="if(this.value>1000){this.value=1000;}else if(this.value<1){this.value=1;}"  readonly="true" onBlur="checkNum2(\''+id+'\')" value="'+num+'"/>'+
                                '          <button class="mui-numbox-btn-plus" type="button" onClick="clickNum1('+num+',\''+id+'\')">+</button>'+
                                '     </div>'+
                                '  <div >'+
                                '  <button id="addCart'+id+'" style="margin-top: -70px;" class="mui-btn mui-btn-primary mui-pull-right mui-gwc" onClick="addCartGoods(\''+goodsId+'\',\''+id+'\');" >'+
                                '     <a id="addCartA'+id+'" >确定</a>'+
                                '  </button>'+
                                '</div>';
                        html+='</div></div></div>';

                        $("#goodsId").html(html);

                    }
                });

                $("#goodsId").show();
                //window.location.href = "${base}/cart/add?gid=" + goodsId + "&cnt=1" + "&backurl=" + window.location.href+"&whichclient=whichapp";
            };
            jQuery('#backToTop').bind("tap", function(){
                jQuery('html,body').animate({scrollTop: '0px'}, 100);
            });


        }(mui, document));

        function addCartGoods(goodsId,id) {
            var cnt=$("#num"+id).val();

            if($(".spValItem"+id) && $(".spValItem"+id).length>0){
                if($("#ckSp"+id).html()==''){
                    popAlert("请选择商品规格")
                    return false;
                }
            }

            var sp = '';
            var sp = '';
            var flag = true;
            if($('input[name="goodsSp'+id+'"]').length > 0){
                $('input[name="goodsSp'+id+'"]').each(function(){
                    if($(this).val() == ''){
                        flag =false;
                        popAlert('请选择['+$(this).attr("spname")+']');
                        return false;
                    }else{
                        sp += $(this).attr("spname")+':'+$(this).val() + ',';
                    }
                });
            }
            if(sp != ''){
                sp = sp.substring(0,sp.length-1);
            }
           // alert("商品编号:"+goodsId+"\n商品数量:"+cnt+"\n"+sp);

            showWaiting();
            setTimeout(function(){}, 100); // 延时100ms防止click事件传递到Ajax中刚生成的对象
            $("#addCart"+id).attr("onclick","");
            $("#addCartA"+id).html("提交中...");
            // "&backurl=" + window.location.href+
            //var goodsId="1603301131513561265";
            //没有中间页面，直接跳到购物车
            var path=fullpath+"/cart/add?gid=" + goodsId + "&cnt=" +cnt +"&sp=" +encodeURI(encodeURI(sp)) + "&backurl=" + window.location.href.split(".html")[0]+".html&whichclient=whichapp";
            //alert(path);
            jumpto(path);
        }
        //整数正则
        var regexEnum =/^-?[0-9]{1,}$/;
        //验证内容是不是整数
        function checkNum(num) {
            return regexEnum.test(num);
        }
        //点击减号
        function clickNum(num,id) {

            $("#num"+id).disabled = true;
            if (checkNum( $("#num"+id).val())) {
                if (parseInt($("#num"+id).val())-parseInt(num) <= 1) {
                    $("#num"+id).val(1);
                }else{

                    $("#num"+id).val(parseInt($("#num"+id).val())-parseInt(num));
                }
            } else {
                $("#num"+id).val(1);
            }
            $("#num"+id).disabled = false;
        }
        //点击加号
        function clickNum1(num,id) {

            $("#num"+id).disabled = true;
            if (checkNum( $("#num"+id).val())) {
                if (parseInt($("#num"+id).val())+parseInt(num) <= 1000) {
                    $("#num"+id).val(parseInt($("#num"+id).val())+parseInt(num));
                }else{
                    $("#num"+id).val(1);
                }
            } else {
                $("#num"+id).val(1);
            }
            $("#num"+id).disabled = false;
        }
        //手动输入数量校验
        function checkNum2(id) {
            if (!checkNum(document.getElementById("num"+id).value)) {
                document.getElementById("num"+id).value = 1;
            } else {
                if (parseInt(document.getElementById("num"+id).value) < 1) {
                    document.getElementById("num"+id).value = 1;
                }
            }
        }
        function selectedSp(id) {

            var selectedText = "“";
            if ($('input[name="goodsSp' + id + '"]').length > 0) {
                var i = 0;
                $('input[name="goodsSp' + id + '"]').each(function () {
                    if ($(this).val() != '') {
                        if (i > 0) {
                            selectedText += ",";
                        }
                        selectedText += $(this).val();
                        i++;
                    }
                });
            }
            selectedText += "”";
            if (selectedText != "" && selectedText != undefined && selectedText != "“”") {
                $('#ckSp' + id).html(selectedText);
            } else {
                $('#ckSp' + id).html("");
            }
        }

        /**
         * 选择规格
         */
        function chekedSp(spId,itemId,itemName,id){

           $('#'+spId).val(itemName);
           $('#' +id).parent().addClass('selected');
           selectedSp(id);
        }
    </script>

</div>
<div class="mask" style="display: none" id="mask"></div>
</body>
</html>