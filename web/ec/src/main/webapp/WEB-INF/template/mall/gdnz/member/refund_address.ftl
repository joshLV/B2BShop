<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>退款申请</title>
<meta name="description" content="退款申请">
<meta name="Keywords" content="退款申请">
<link href="${base}/static/mall/gdnz/img/favicon.ico" rel="shortcut icon" />
<link href="${base}/static/img/touchicon.png" rel="apple-touch-icon" />
    <link href="${base}/static/mall/gdnz/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
</head>
<body>
<#include "mall/gdnz/shortcut.ftl"/>
<#include "mall/gdnz/header.ftl"/>
<style>
.breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
.breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: 700;line-height: 20px;font-size: 18px;font-family: "microsoft yahei";}

.left {float: left;width: 150px;margin-right: 10px;}
.right {float: right;width: 830px;}
.f-cb:after{display:block;clear:both;visibility:hidden;height:0;overflow:hidden;content:".";zoom:1;}
.item .fl{width:430px; line-height: 26px;}
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
    .processNav .step1 {Z-INDEX: 5; WIDTH: 240px}
    .processNav .step2 {Z-INDEX: 4; WIDTH: 240px}
    .processNav .step3 {Z-INDEX: 3; WIDTH: 240px}
    .processNav .step4 {Z-INDEX: 1; WIDTH: 240px}
    .processNav .on {BACKGROUND: #cd2a2c; COLOR: #fff}
    .processNav .extra {POSITION: absolute; WIDTH: 18px; HEIGHT: 26px; TOP: 0px; RIGHT: -15px}
    .processNav .on .extra {BACKGROUND-POSITION: 0px -30px}
    .form {width: 582px;overflow: hidden;margin: 0 auto;/*padding-left: 100px;*/}
    .btn-entry {width: 68px;height: 25px;line-height: 25px;background: url(${base}/static/mall/img/bg-btn-entry.jpg) no-repeat;font-size: 14px;font-weight: bold;}
    .item {padding: 10px 0;line-height: 26px;}
    .label {width: 140px;text-align: right;font-size: 14px;float: left;}
    .select {width:200px;height: 25px;border: 1px solid #cccccc;float: none;font-size: 14px;font-family: arial,"宋体";color: #999;}
    .text {width: 220px;height: 30px;line-height: 30px;border: 1px solid #cccccc;float: none;font-size: 14px;font-family: arial,"宋体";color: #999;}
    .btn {display: border: 0 none;font-size: 20px;font-weight:bold;text-align: center;color: #FF0000;}
    .btn {width: 250px;height: 36px;color: #ffffff;font-size:15px;font-weight: 800;overflow: hidden; background: #ea5313; border: none; border-radius: 3px;}
    .btn:hover{background: #ed4548}
    .refund-form{border: 1px solid #E8E8E8; border-top: 2px solid #C30000; padding-top: 30px;}
    .error{color:red;}
</style>
<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/order/list">退款中心</a></strong><span>&nbsp;&gt;&nbsp;订单：${order.orderSn}<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
    <!--状态、提示-->
    <div class="m" id="orderstate">
        <div class="mt">
            <strong class=" ">订单号：${order.orderSn}&nbsp;&nbsp;&nbsp;&nbsp;状态：<span class="ftx14">${orderStatusMapping['${order.orderStatus}']}</span>&nbsp;&nbsp;</strong>
            <#--判断显示什么样的按钮-->
            <#if order.orderStatus == "wait_buyer_pay">
            <span id="pay-button-${order.orderSn}">
                <a href="${base}/payment?orderSn=${order.orderSn}&total=${order.totalAmount}&key=${order.id}" target="_blank">
                    <img width="46" height="25" style="display:inline;" src="${base}/static/img/btn_pay.gif">
                </a>
            </span>
            <div class="fr">
                <div class="toolbar">
                    <input type="button" class="btn-img btn" id="btn_Cancel"
                           onclick="cancleOrder('${order.id}')" value="取消">
                </div>
            </div>
            </#if>
        </div>
    </div>
    <!--进度条-->
    <div id="mc">
        <ol class="processNav">
            <li id="one" class="step1 ">1、退款申请<b class="extra"></b></li>
            <li id="two" class="step2">2、卖家处理退款申请<b class="extra"></b></li>
            <li id="two" class="step3 on">3、填写物流信息<b class="extra"></b></li>
            <li id="three" class="step4">4、退款成功<b class="extra"></b></li>
        </ol>
        <span class="clr"></span>
    </div>
    <form id="myform" action="" class="refund-form">
        <input   type="hidden"  id="id" name="id" value="${refund.id}"/>
        <input type="hidden" name="orderSn" value="${order.orderSn}"/>
        <input type="hidden" name="shopId" value="${order.shopId}"/>
        <input type="hidden" name="amount" value="${order.totalAmount + order.deliveryFee}"/>
            <div class="form" id="a">
            <#--Desc:数据库中没有发货说明字段 Auth:zhangqiang Time:2015-11-11 15:54:35 Start-->
                <#--<div class="item">-->
                    <#--<span class="label">收货人姓名<font color="red">*</font>：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input   class="text"  id="shipName" onblur="checkshipName();" name="shipName"/>-->
                        <#--<span id="shipNameError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="item">-->
                    <#--<span class="label">所属地区<font color="red">*</font>：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input type="text" id="shipAreaPath" name="shipAreaPath" class="areaSelect hidden" value=""/>-->
                        <#--<span id="shipAreaPathError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="item">-->
                    <#--<span class="label">详细地址<font color="red">*</font>：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input   class="text"  id="shipAddress" name="shipAddress"/>-->
                        <#--<span id="shipAddressError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="item">-->
                    <#--<span class="label">邮编：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input   class="text"  id="shipZipCode" onblur="checkposcode();" name="shipZipCode"/>-->
                        <#--<span id="shipZipCodeError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="item">-->
                    <#--<span class="label">收货固定电话：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input   class="text" onblur="checkPhone();"  id="shipPhone" name="shipPhone"/>-->
                        <#--<span id="shipPhoneCodeError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="item">-->
                    <#--<span class="label">收货手机号<font color="red">*</font>：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input   class="text" onblur="checkMobile()"  id="shipMobile" name="shipMobile"/>-->
                        <#--<span id="shipMobileError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--Desc:数据库中没有发货说明字段 Auth:zhangqiang Time:2015-11-11 15:54:35 End-->
                <div class="item f-cb">
                    <span class="label">物流公司<font color="red">*</font>：</span>
                    <div class="fl">
                        <!-- text_error -->
                        <input   class="text"  id="logisticsName" name="logisticsName"/>
                        <span id="logisticsNameError" class="error"></span>

                    </div>
                </div>
                <div class="item f-cb">
                    <span class="label">物流单号<font color="red">*</font>：</span>
                    <div class="fl">
                        <!-- text_error -->
                        <input   class="text"  id="logisticsNo" name="logisticsNo"/>
                        <span id="logisticsNoError" class="error"></span>

                    </div>
                </div>
            <#--Desc:数据库中没有发货说明字段 Auth:zhangqiang Time:2015-11-11 15:54:35 Start-->
                <#--<div class="item f-cb">-->
                    <#--<span class="label">发货说明<font color="red">*</font>：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<textarea   class="text"  id="info" name="info"></textarea>-->
                        <#--<span id="infoError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
            <#--Desc:数据库中没有发货说明字段 Auth:zhangqiang Time:2015-11-11 15:54:35 End-->
                <div class="item f-cb" id="pic">
                    <span class="label">上传凭证<font color="red">*</font>：</span>
                    <div class="fl">
                        <input id="file" type="file" name="file" class="easyui-validatebox" />(图片规格:400*850)
                        <span id="picError" class="error"></span>

                    </div>
                </div>
                <div class="item f-cb" id="img" style="height:350px">
                    <span class="label">预览图：</span>
                    <div class="fl" style="border: 1px solid #E8E8E8; width:350px; height: 350px;">
                        <img id="image" width="200" height="350"  onLoad="onLoadImage()" />
                        <span class="clr" style="color: red;font-weight: bold;"></span>
                        <span id="img_span" style="color: red;font-weight: bold;"></span>
                    </div>
                </div>
                <div class="item f-cb" style="padding-top: 20px">
                    <span class="label">&nbsp;</span>
                    <input class="btn" id="btn" type="button"  tabindex="4" value="下一步" onclick="onNext();" id="findPwdSubmit" class="btn-img btn-entry">
                </div>
            </div>
    </form>
    </div>
</div>
<#include "mall/gdnz/service.ftl"/>
<#include "mall/gdnz/footer.ftl"/>
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
<script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>

</body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        // 地区选择菜单
        //$(".lSelect").remove();//移除之前生成的
        //$(".areaSelect").lSelect({
            url: "${base}/area/ajaxChildren"// Json数据获取url
        //});
    });
    function onNext(){
//        if(	!checkshipName()){
//            return ;
//        }
//        if(!checkshipAreaPath()){
//            return ;
//        }
//        if(!checkshipAddress()){
//            return ;
//        }
//        if(!checkMobile()){
//            return ;
//        }
        if(!checklogisticsName()){
            return ;
        }
        if(!checklogisticsNo()){
            return ;
        }
        /**增加发货说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:03:05 Start */
           /**Desc:发货说明字段数据没有去掉 Auth:zhangqiang Time:2015-11-11 16:07:05 Start */
//        if(!checkinfo()){
//            return ;
//        }
           /**Desc:发货说明字段数据没有去掉 Auth:zhangqiang Time:2015-11-11 16:07:05 End */
        /**增加发货说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:03:05 Start */
        if(!checkpic()){
            return ;
        }
        if(!validTagImage()){
//            $.easyui.messager.alert('操作提醒',"图片不符合规格,建议规格小于400*850",'warn');
            $("#img_span").text("图片不符合规格,建议规格小于400*850");
        }else{
            $("#img_span").html("");
            uploadImg();
        }
    }
    $("#file").uploadPreview({ Img: "image", Width: 0, Height: 0 })
    function validTagImage(){
        var img = new Image();
        img.src = document.getElementById("image").src;
        if(img.width>400||img.height>850){
            return false;
        }
        if(img.width==0||img.height==0){
            return false;
        }
        return true;
    }
    function onLoadImage(){
        if(!validTagImage()){
//            $.easyui.messager.alert('操作提醒',"图片不符合规格,建议规格小于400*850",'warn');
            $("#img_span").html("图片不符合规格,建议规格小于400*850");
        }else{
            $("#img_span").html("");
        }
    }

    function uploadImg(){
        $("#btn").attr("disabled","true");
        $("#btn").addClass("disabled");
        $("#btn").val("上传中，请稍候......");
        var data = $('#myform').serialize();
        //执行上传文件操作的函数
        $.ajaxFileUpload({
            url:"${base}/member/refund/applyfilladdress?"+data,
            secureuri:true,//是否启用安全提交,默认为false
            fileElementId:$("#file"),//文件选择框的对象,多个时用[]包含
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
                    window.location.href="${base}/member/refund/refundsuccess/${refund.orderSn}";
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
    /**
     * 凭证
     * @return
     */
    function checkpic(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#file").val();
            if(isEmpty(value)){
                errorMessage = "* 请您上传凭证";
                $("#picError").text(errorMessage);
                $("#picError").show();
            }else{
                $("#picError").hide();
                errorFlag=true;
            }

        return errorFlag;
    }
    /**
     * 收货人姓名
     * @return
     */
    function checkshipName(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#shipName").val();
        if(isEmpty(value)){
            errorMessage = "* 请输入收货人姓名";
            $("#shipNameError").text(errorMessage);
            $("#shipNameError").show();
        }else{
            /**增加收货人姓名 长度限制 大于16提示 Auth:zhangqiang Time:2015-09-23 14:04:05 Start */
            if(value.length > 16){
                errorMessage = "* 收货人姓名长度不超过16字!";
                $("#shipNameError").text(errorMessage);
                $("#shipNameError").show();
            }else{
                $("#shipNameError").hide();
                errorFlag=true;
            }
            /**增加收货人姓名 长度限制 大于16提示 Auth:zhangqiang Time:2015-09-23 14:04:05 End */
        }

        return errorFlag;
    }

    /**
     * 收货人地址
     * @return
     */
    function checkshipAreaPath(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#shipAreaPath").val();
        if(isEmpty(value)){
            errorMessage = "* 请选择地区";
            $("#shipAreaPathError").text(errorMessage);
            $("#shipAreaPathError").show();
        }else{
            $("#shipAreaPathError").hide();
            errorFlag=true;
        }

        return errorFlag;
    }
    /**
     * 详细地址
     * @return
     */
    function checkshipAddress(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#shipAddress").val();
        if(isEmpty(value)){
            errorMessage = "* 请输入详细地址";
            $("#shipAddressError").text(errorMessage);
            $("#sshipAddressError").show();
        }else{
            /**增加详细地址 长度限制 大于64提示 Auth:zhangqiang Time:2015-09-23 14:05:05 Start */
            if(value.length > 64){
                errorMessage = "* 详细地址长度不超过64个字!";
                $("#shipAddressError").text(errorMessage);
                $("#sshipAddressError").show();
            }else{
                $("#shipAddressError").hide();
                errorFlag=true;
            }
            /**增加详细地址 长度限制 大于64提示 Auth:zhangqiang Time:2015-09-23 14:05:05 End */
        }

        return errorFlag;
    }
    /**
     * 物流公司
     * @return
     */
    function checklogisticsName(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#logisticsName").val();
        if(isEmpty(value)){
            errorMessage = "* 请输入物流公司名称";
            $("#logisticsNameError").text(errorMessage);
            $("#logisticsNameError").show();
        }else{
            /**增加物流公司 长度限制 大于16提示 Auth:zhangqiang Time:2015-09-23 14:06:05 Start */
            if(value.length > 16){
                errorMessage = "* 物流公司名称长度不超过16个字!";
                $("#logisticsNameError").text(errorMessage);
                $("#logisticsNameError").show();
            }else{
                $("#logisticsNameError").hide();
                errorFlag=true;
            }
            /**增加物流公司 长度限制 大于16提示 Auth:zhangqiang Time:2015-09-23 14:06:05 End */
        }
        return errorFlag;
    }
    /**
     * 凭证
     * @return
     */
    function checklogisticsNo(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#logisticsNo").val();
        if(isEmpty(value)){
            errorMessage = "* 请输入物流单号";
            $("#logisticsNoError").text(errorMessage);
            $("#logisticsNoError").show();
        }else{
            /**增加凭证 长度限制 大于32提示 Auth:zhangqiang Time:2015-09-23 14:06:05 Start */
            if(value.length > 32){
                errorMessage = "* 物流单号长度不超过32个字符!";
                $("#logisticsNoError").text(errorMessage);
                $("#logisticsNoError").show();
            }else{
                $("#logisticsNoError").hide();
                errorFlag=true;
            }
            /**增加凭证 长度限制 大于32提示 Auth:zhangqiang Time:2015-09-23 14:06:05 End */
        }

        return errorFlag;
    }
    /**
     * 发货说明
     * @return
     */
    function checkinfo(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#info").val();
        if(isEmpty(value)){
            errorMessage = "* 请输入发货说明";
            $("#infoError").text(errorMessage);
            $("#infoError").show();
        }else{
            /**增加发货说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:07:05 Start */
            if(value.length > 200){
                errorMessage = "* 发货说明长度不超过200个字!";
                $("#infoError").text(errorMessage);
                $("#infoError").show();
            }else{
                $("#infoError").hide();
                errorFlag=true;
            }
            /**增加发货说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:07:05 End */
        }
//        if(!errorFlag){
//            $("#infoError").text(errorMessage);
//            $("#infoError").show();
//        }else{
//            $("#infoError").hide();
//            errorFlag=true;
//        }

        return errorFlag;
    }
    /**
     * 邮政编码
     * @return
     */
    function checkposcode(){
        var errorFlag = false;
        var errorMessage="";
        var value = $("#shipZipCode").val();
        var pattern =/^[1-9][0-9]{5}$/;
        if(value) {
            if (!pattern.test(value)) {
                errorFlag = true;
                errorMessage = "*  邮政编码格式不正确！";
            }
        }
        if(errorFlag){
            $("#shipZipCodeError").text(errorMessage);
            $("#shipZipCodeError").show();
        }else{
            $("#shipZipCodeError").hide();
        }
        return errorFlag;
    }
    /**
     * 手机号
     * @return
     */
    function checkMobile(){
        var errorFlag = true;
        var errorMessage ="";
        var value = $("#shipMobile").val();
        var regu = /^\d{11}$/;
        var re = new RegExp(regu);
        if (isEmpty(value)) {
            errorMessage = "*  请您填写收货人手机号码";
            $("#shipMobileError").text(errorMessage);
            $("#shipMobileError").show();
            errorFlag = false;
            return errorFlag;
        }
        if(!re.test(value)){
            errorMessage = "*  手机号码格式不正确";
            $("#shipMobileError").text(errorMessage);
            $("#shipMobileError").show();
            errorFlag = false;
            return errorFlag;
        }else{
            $("#shipMobileError").hide();
            //errorFlag=true;
        }
        return errorFlag;
    }
    /**
     * 固定电话
     * @return
     */
    function checkPhone(){
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#shipPhone").val();
        if(value) {
            if (!is_forbid(value)) {
                errorFlag = true;
                errorMessage = "固定电话号码中含有非法字符";
            }
            if(value.length > 20){
                errorFlag = true;
                errorMessage = "*  固定电话号码过长";
            }
            var patternStr = "(0123456789-)";
            var  strlength=value.length;
            for(var i=0;i<strlength;i++){
                var tempchar=value.substring(i,i+1);
                if(patternStr.indexOf(tempchar)<0){
                    errorFlag = true;
                    errorMessage = "*  固定电话号码格式不正确";
                }
            }
        }

        if(errorFlag){
            $("#shipPhoneCodeError").text(errorMessage);
            $("#shipPhoneCodeError").show();
        }else{
            $("#shipPhoneCodeError").hide();
        }
        return errorFlag;
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
     * 检查是否含有非法字符
     * @param temp_str
     * @returns {Boolean}
     */
    function is_forbid(temp_str){
        temp_str=temp_str.replace(/(^\s*)|(\s*$)/g, "");
        temp_str = temp_str.replace('*',"@");
        temp_str = temp_str.replace('--',"@");
        temp_str = temp_str.replace('/',"@");
        temp_str = temp_str.replace('+',"@");
        temp_str = temp_str.replace('\'',"@");
        temp_str = temp_str.replace('\\',"@");
        temp_str = temp_str.replace('$',"@");
        temp_str = temp_str.replace('^',"@");
        temp_str = temp_str.replace('.',"@");
        temp_str = temp_str.replace(';',"@");
        temp_str = temp_str.replace('<',"@");
        temp_str = temp_str.replace('>',"@");
        temp_str = temp_str.replace('"',"@");
        temp_str = temp_str.replace('=',"@");
        temp_str = temp_str.replace('{',"@");
        temp_str = temp_str.replace('}',"@");
        var forbid_str=new String('@,%,~,&');
        var forbid_array=new Array();
        forbid_array=forbid_str.split(',');
        for(i=0;i<forbid_array.length;i++){
            if(temp_str.search(new RegExp(forbid_array[i])) != -1)
                return false;
        }
        return true;
    }
</script>