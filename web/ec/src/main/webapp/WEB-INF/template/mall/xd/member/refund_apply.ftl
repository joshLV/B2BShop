<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>退款申请</title>
<meta name="description" content="退款申请">
<meta name="Keywords" content="退款申请">
<link href="${base}/static/mall/xd/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/xd/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
</head>
<body>
<#include "mall/xd/shortcut.ftl"/>
<#include "mall/xd/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 150px;margin-right: 10px;}
.right {float: right;width: 830px;}
.f-cb:after{display:block;clear:both;visibility:hidden;height:0;overflow:hidden;content:".";zoom:1;}
.item .fl{line-height: 26px;}
</style>
<style>
    /**状态、提示**/
    #orderstate{border:1px solid #EED97C;padding:0 5px;background:#FFFCEB;}#orderstate{color:#333;}#orderstate .mt{padding:4px 8px;height:25px;line-height:25px;border-bottom:1px dotted #EED97C;}#orderstate .mt strong{float:left;font-size:14px;}.mt{cursor:default}.m{margin-bottom:10px;overflow:hidden;zoom:1;}.ftx14,.flk14 a:link,.flk14 a:visited,a.flk14:link,a.flk14:visited{color:#12A000}.fr{float:right}#orderstate .btn{width:46px;height:25px;margin:0 4px;background:url(${base}/static/img/btn0330.jpg) no-repeat 0 0;color:#fff;}.btn-img{cursor:pointer;margin:0;padding:0;border:0;text-align:center;}#orderstate .mc{padding:10px 8px;}.toolbar .btn-40 {display: inline-block;padding: 0 13px 0 13px;background-color: #FFBA01;background: url(${base}/static/img/btn_bg.png) no-repeat;background-position: -20px;color: white;border-radius: 3px;}
    /**跟踪、付款信息**/
    #ordertrack{border:1px solid #EED97C;padding:0 5px;position:relative}#ordertrack td{vertical-align:top}#ordertrack .i-ordertrack s,.post01 .fore .fr s{float:left;width:9px;height:16px;font-size:0;line-height:0;margin-right:5px;background:url(i/od-icon.png)}.post01 .fore .fr s{margin-top:4px}#ordertrack .i-ordertrack a{color:#005AA0}#ordertrack .tab{height:30px;line-height:30px;border-bottom:1px solid #EED97C;background:#FFFCEB;overflow:visible;}#ordertrack .tab li{border-right:1px solid #EED97C;cursor:pointer}#ordertrack .tab li h2{float:left;height:30px;padding:0 8px;color:#999;}#ordertrack .tab .curr h2{position:relative;height:31px;background:#fff;color:#333;}#ordertrack .mc{padding:5px 8px;}#ordertrack .mc .extra{margin-top:10px;}#ordertrack th strong{display:block;padding-bottom:3px;margin-bottom:5px;border-bottom:1px solid #DBDBDB;text-align:left;}*html #ordertrack .tab{overflow:hidden;}
    /**订单信息**/
    #orderinfo{border:1px solid #DADADA;padding:0 5px 10px;background:#EDEDED;overflow:visible;}#orderinfo .mt{padding:0 8px;height:30px;line-height:30px;font-size:14px;}#orderinfo .mc{padding:5px 8px;background:#fff;overflow:visible;}#orderinfo .mc dl{padding:10px 5px;border-top:1px solid #EDEDED;}#orderinfo .mc dl.fore{border-top:0;}#orderinfo .mc dt{margin-bottom:4px;font-weight:bold;}#orderinfo .p-list{overflow:hidden;margin-right:-1px;border-left:1px solid #DEDEDE;}#orderinfo .p-list table{border-collapse:collapse;margin-left:-1px;border:solid #DEDEDE;border-width:0 1px;}#orderinfo .p-list th{padding:5px;background:#F0F0F0;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;font-weight:normal;}#orderinfo .p-list td{padding:5px;background:#fff;border-top:1px solid #DEDEDE;border-bottom:1px solid #DEDEDE;border-left:1px solid #F0F0F0;text-align:center;}#barcode{position:relative;height:20px;padding:0 5px;}#barcode ul{position:absolute;left:5px;padding:6px 10px;border:1px solid #ccc;background:#fff;z-index:1}#orderinfo .total{padding:15px 10px 0;overflow:hidden;zoom:1;font-family:arial;}#orderinfo .total ul{float:right;padding:0 20px 10px 0;overflow:hidden;font-size:14px;}#orderinfo .total li{overflow:hidden;line-height:20px;}#orderinfo .total li span{float:left;width:150px;text-align:right;}#orderinfo .total .extra{float:right;padding:10px 20px 0 0;border-top:1px solid #ccc;font-size:16px;font-weight:bold;}#orderinfo .total .extra b{font-size:24px;}a.flk13:link,a.flk13:visited{color:#005AA0;}.img-list .img-box:hover{border-color:#EDD28B;}.img-list .img-box{border:1px solid #e1e1e1;display:block;margin:0 auto;width:50px;height:50px;}.ftx04{color:#F00}
    .processNav .extra {BACKGROUND: url(${base}/static/mall/img/cartscbgv.png) no-repeat 0px 0px}
    .processNav {MARGIN: 0px 0px 0px; BACKGROUND: #fff; FLOAT: left; COLOR: #404040; FONT-WEIGHT: 700;margin-bottom: 30px}
    .processNav LI {POSITION: relative; TEXT-ALIGN: center; LINE-HEIGHT: 26px; BACKGROUND: #e4e4e4; FLOAT: left; HEIGHT: 26px; FONT-SIZE: 14px}
    .processNav .step1 {Z-INDEX: 3; WIDTH: 280px}
    .processNav .step2 {Z-INDEX: 2; WIDTH: 280px}
    .processNav .step3 {Z-INDEX: 1; WIDTH: 280px}
    .processNav .on {BACKGROUND: #cd2a2c; COLOR: #fff}
    .processNav .extra {POSITION: absolute; WIDTH: 18px; HEIGHT: 26px; TOP: 0px; RIGHT: -15px}
    .processNav .on .extra {BACKGROUND-POSITION: 0px -30px}
    /*.form与头部搜索框样式互相影响，所以更改名称为form1 Auth:zhangqiang Time:2015-09-23 15:56:35 Start */
    /*.form {width: 800px;overflow: hidden;margin: 0 auto;padding-left: 100px;}*/
    .form1 {width: 800px;overflow: hidden;margin: 0 auto;padding-left: 100px;}
    /*.form与头部搜索框样式互相影响，所以更改名称为form1 Auth:zhangqiang Time:2015-09-23 15:56:35 Start */
    .btn-entry {width: 68px;height: 25px;line-height: 25px;background: url(${base}/static/mall/img/bg-btn-entry.jpg) no-repeat;font-size: 14px;font-weight: bold;}
    .item {padding: 10px 0;line-height: 26px;}
    .label {width: 140px;text-align: right;font-size: 14px;float: left;}

    .mc{padding:30px 0 20px;/*border:solid #dddddd;border-width:0px 1px 1px; */}
    .select {width:200px;height: 25px;border: 1px solid #cccccc;float: none;font-size: 14px;font-family: arial,"宋体";color: #999;}
    .text {width: 220px;height: 40px;padding: 10px 25px 10px 5px;border: 1px solid #cccccc;float: none;font-size: 14px;font-family: arial,"宋体";color: #999;}
     .btn {display: border: 0 none;font-size: 20px;font-weight: bold;text-align: center;color: #FF0000;}
    .btn {width: 250px;height: 36px;color: #ffffff;font-size:15px;font-weight: 800;overflow: hidden; background: #db0000; border: none; border-radius: 3px; margin-left: 40px;}
    .btn:hover{background: #ed4548}
    .refund-form{border: 1px solid #E8E8E8; border-top: 2px solid #C30000; padding-top: 30px; padding-bottom: 30px;}
     .error{color:red;}
</style>
<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/order/list">退款中心</a></strong><span>&nbsp;&gt;&nbsp;订单：${order.orderSn}<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
    <!--进度条-->
    <div id="mc">
        <ol class="processNav">
            <li id="one" class="step1 on">1、退款申请<b class="extra"></b></li>
            <li id="two" class="step2">2、卖家处理退款申请<b class="extra"></b></li>
            <li id="three" class="step3">3、退款成功<b class="extra"></b></li>
        </ol>
        <span class="clr"></span>
    </div>
    <div class="mc">
    <form id="myform" action="" class="refund-form">
        <input type="hidden" name="orderSn" value="${order.orderSn}"/>
        <input type="hidden" name="shopId" value="${order.shopId}"/>
        <input type="hidden" name="amount" value="${order.totalAmount}"/>
            <!--.form与头部搜索框样式互相影响，所以更改名称为form1 Auth:zhangqiang Time:2015-09-23 15:56:35 Start -->
            <div class="form1" id="a">
            <!--.form与头部搜索框样式互相影响，所以更改名称为form1 Auth:zhangqiang Time:2015-09-23 15:56:35 End -->
                <div class="item f-cb">
                    <span class="label">退款金额：</span>
                    <div class="fl">
                        <span class="ftx04"><b>￥${order.totalAmount}</b></span>

                    </div>
                </div>
                <div class="item f-cb">
                    <span class="label">退款类型<font color="red">*</font>：</span>
                    <div class="fl">

                        <#if '${order.orderStatus}' == 'trade_finished'>
                            <input type="hidden" name="type" id="type" value="received">
                            收到货
                        <#elseif order.orderStatus == 'unconfirm' || order.orderStatus == 'cancel' || order.orderStatus == 'invalid' || order.orderStatus == 'wait_buyer_pay' || order.orderStatus == 'wait_seller_send_goods' >
                            <input type="hidden" name="type" id="type" value="unreceived">
                            未收到货
                        <#else >
                        <select id="type"  class="select" id="type" name="type">
                            <option >请选择</option>
                            <option value="unreceived" <#if '${order.orderStatus}' != 'trade_finished'>selected</#if>>未收货</option>
                            <option value="received">收到货</option>
                        </select>
                        <span id="typeError" class="error"></span>

                        </#if>
                    </div>
                </div>
                <div class="item f-cb" id="pic">
                    <span class="label">货物凭证<font color="red">*</font>：</span>
                    <div class="fl">
                        <input id="file" type="file" name="file"   class="easyui-validatebox" />
                        <span id="picError1" class="error"></span>

                    </div>
                </div>
                <div class="item f-cb" id="pic2">
                    <span class="label">货物凭证2：</span>
                    <div class="fl">
                        <input id="file2" type="file" name="file"   class="easyui-validatebox" />
                        <span id="picError2" class="error"></span>

                    </div>
                </div>
                <div class="item f-cb" id="pic3">
                    <span class="label">货物凭证3：</span>
                    <div class="fl">
                        <input id="file3" type="file" name="file"   class="easyui-validatebox" />
                        <span id="picError3" class="error"></span>

                    </div>
                </div>
                <div class="item f-cb" id="img" style="height:350px">
                    <span class="label">预览图：</span>
                    <div class="fl" >
                        <img id="image1" width="200" height="350"   onLoad="onLoadImage('1')"/>
                        <img id="image2" width="200" height="350"   onLoad="onLoadImage('2')"/>
                        <img id="image3" width="200" height="350"   onLoad="onLoadImage('3')"/>

                        <span id="img_span" style="color: red;font-weight: bold;"></span><br/>
                    </div>
                </div><br/><br/>

                <div class="item f-cb">
                    <span class="label">退款原因<font color="red">*</font>：</span>
                    <div class="fl">
                        <select class="select" id="reason" name="reason">
                            <option >请选择</option>
<#if '${order.orderStatus}' != 'trade_finished'><option value="卖家缺货">卖家缺货</option></#if>
                            <option value="与卖家协商一致退款">与卖家协商一致退款</option>
<#if '${order.orderStatus}' == 'trade_finished'><option value="未按约定时间发货">未按约定时间发货</option></#if>
                            <option value="其他">其他</option>
                        </select>
                        <span id="reasonError" class="error"></span>

                    </div>
                </div>
                <div class="item f-cb">
                    <span class="label">退款说明<font color="red">*</font>：</span>
                    <div class="fl">
                        <!-- text_error -->
                        <textarea  tabindex="1" class="text"  id="info" name="info"></textarea>
                        <span id="infoError" class="error"></span>

                    </div>
                </div>
                <div class="item f-cb" style="padding-left: 100px;padding-right: 100px;">
                    <span class="label">&nbsp;</span>
                    <div class="fl">
                    <input class="btn" id="btn" type="button" tabindex="4"  value="下一步" onclick="onNext();" id="findPwdSubmit" class="btn-img btn-entry">
                </div>
            </div>
    </form>
    </div>
    </div>
</div>
<#include "mall/xd/service.ftl"/>
<#include "mall/xd/footer.ftl"/>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.ajaxfileupload-20140125.js" type="text/javascript"></script>
<script src="${base}/static/js/uploadPreview.js" type="text/javascript"></script>
<script src="${base}/static/js/layer.js" type="text/javascript"></script>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        if('${order.orderStatus}' != 'trade_finished'){
            $("#pic").hide();
            $("#pic2").hide();
            $("#pic3").hide();
            $("#img").hide();
        }
    });
//    加判断对凭证 以及提示信息 Auth:zhangqiang Time:2015-09-29 18:04:35 Start
    function onNext(){
        if(	!checktype()){
            return ;
        }
        if(!checkreason()){
            return ;
        }
        if(!checkinfo()){
            return ;
        }

        var t = $("#type").val();
        if(t=="received"){
            if(!checkpic()){
                return;
            }

            if(!validTagImage('1')){
                //$.easyui.messager.alert('操作提醒',"图片不符合规格,建议规格小于200*400",'warn');
                $("#picError1").html("图片不符合规格,建议规格小于400*850");
                location.href = "#picError1";
                return;
            }else{
                $("#picError1").html("");

                if( document.getElementById("image"+2).src != ''){
                    if(!validTagImage('2')){
                        $("#picError2").html("图片不符合规格,建议规格小于400*850");
                        location.href = "#picError2";
                        return;
                    }else{
                        $("#picError2").html("");
                    }
                }

                if( document.getElementById("image"+3).src != ''){
                    if(!validTagImage('3')){
                        $("#picError3").html("图片不符合规格,建议规格小于400*850");
                        location.href = "#picError3";
                        return;
                    }else{
                        $("#picError3").html("");
                    }
                }
                uploadImg();
            }
        }else{
            sumbit();
        }
    }


    $("#file").uploadPreview({ Img: "image1", Width: 0, Height: 0 })
    $("#file2").uploadPreview({ Img: "image2", Width: 0, Height: 0 })
    $("#file3").uploadPreview({ Img: "image3", Width: 0, Height: 0 })
    function validTagImage(index){
        var img = new Image();
        img.src = document.getElementById("image"+index).src;
        if(img.width>400||img.height>850){
            return false;
        }
        if(img.width==0||img.height==0){
            return false;
        }
        return true;
    }
    function onLoadImage(index){
        if(!validTagImage(index)){
            //$.easyui.messager.alert('操作提醒',"图片不符合规格,建议规格小于400*850",'warn');
            $("#picError" +index).html("图片不符合规格,建议规格小于400*850");
            location.href = "#picError" +index;
        }else{
            $("#picError" +index).html("");
        }
    }
    function uploadImg(){

        $("#btn").attr("disabled","true");
        $("#btn").addClass("disabled");
        $("#btn").val("上传中，请稍候......");
        var data = $('#myform').serialize();
        //处理乱码
        data= decodeURIComponent(data,true);
        //执行上传文件操作的函数
        $.ajaxFileUpload({
            url:"${base}/member/refund/applyfill?"+data,
            secureuri:true,//是否启用安全提交,默认为false
            fileElementId:$('input[name=file]'),//文件选择框的对象,多个时用[]包含
            dataType:'text',
            async:true,
            success:function(data, status){//服务器响应成功时的处理函数
                data = data.replace(/<pre.*?>/g, '');
                data = data.replace(/<PRE.*?>/g, '');
                data = data.replace("<PRE>", '');
                data = data.replace("</PRE>", '');
                data = data.replace("<pre>", '');
                data = data.replace("</pre>", '');
                data = jQuery.parseJSON(data);
                if(data.status=='success'){
                    window.location.href="${base}/member/refund/applyfillwl/"+data.message;
                }else{
                    $.easyui.messager.alert('操作提醒',data.message,'error');
                }
            },
            error:function(data, status, e){ //服务器响应失败时的处理函数
                data = data.replace(/<pre.*?>/g, '');
                data = data.replace(/<PRE.*?>/g, '');
                data = data.replace("<PRE>", '');
                data = data.replace("</PRE>", '');
                data = data.replace("<pre>", '');
                data = data.replace("</pre>", '');
                data = jQuery.parseJSON(data);
                $.easyui.messager.alert('操作提醒',data.message,'error');
            }
        });
    }
    function sumbit(){
        var data = $('#myform').serialize();
        $.ajax({
            type: "POST",
            url: "${base}/member/refund/applyfill",
            data: data,
            datatype: 'json',
            success: function(data) {
                window.location.href="${base}/member/refund/applyfillwl/"+data.message;
            }
        });
    }
    $("#type").change(function() {
        var type =$(this).val();
        if(type=="received"){
            $("#pic").show();
            $("#pic2").show();
            $("#pic3").show();
            $("#img").show();
        }else{
            $("#pic").hide();
            $("#pic2").hide();
            $("#pic3").hide();
            $("#img").hide();
        }
    });
    /**
     * 退款类型
     * @return
     */
    function checktype(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#type").find("option:selected").val();
        if(value=="请选择"){
            errorMessage = "* 请您选择退款类型";
            $("#typeError").text(errorMessage);
            $("#typeError").show();
        }else{
            $("#typeError").hide();
            errorFlag=true;
        }
        return errorFlag;
    }
    /**
     * 退款原因
     * @return
     */
    function checkreason(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#reason").find("option:selected").val();
        if(value=="请选择"){
            errorMessage = "*请您选择退款原因";
            $("#reasonError").text(errorMessage);
            $("#reasonError").show();
        }else{
            $("#reasonError").hide();
            errorFlag=true;
        }
        return errorFlag;
    }
    /**
     * 退款凭证
     * @return
     */
    function checkpic(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#type").find("option:selected").val();
        var valuefile = $("#file").val();
        if(value="received"){
            if(isEmpty(valuefile)){
                errorMessage = "*请您上传货物凭证";
                $("#picError1").text(errorMessage);
                $("#picError1").show();
            }else{
                //$("#picError1").hide();
                errorFlag=true;
            }
        }

        return errorFlag;
    }
    /**
     * 退款说明
     * @return
     */
    function checkinfo(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#info").val();
            if(isEmpty(value)){
                errorMessage = "*请输入退款说明";
                $("#infoError").text(errorMessage);
                $("#infoError").show();
            }else{
                /**增加退款说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:02:05 Start */
                if(value.length >200){
                    errorMessage = "*退款说明长度不超过200字!";
                    $("#infoError").text(errorMessage);
                    $("#infoError").show();
                }else{
                    $("#infoError").hide();
                    errorFlag=true;
                }
                /**增加退款说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:02:05 End */
            }

        return errorFlag;
    }

    //    加判断对凭证 以及提示信息 Auth:zhangqiang Time:2015-09-29 18:04:35 End

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