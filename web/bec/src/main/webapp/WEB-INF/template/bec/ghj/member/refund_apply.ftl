<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
    <#include "bec/ghj/top.ftl"/>
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
                <div class="refund-item">
                    <span class="label">退款金额：</span>
                    <div class="fl">
                        <span class="ftx04"><b>￥${order.totalAmount}</b></span>
                        <span class="clr"></span>
                    </div>
                </div>
                <div class="refund-item">
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
                        <span class="clr"></span>
                        </#if>
                    </div>
                </div>
                <div class="refund-item" id="pic">
                    <span class="label">货物凭证<font color="red">*</font>：</span>
                    <div class="fl">
                        <input id="file" type="file" name="file"   class="easyui-validatebox" />
                        <span id="picError1" class="error"></span>
                        <span class="clr"></span>
                    </div>
                </div>
                <div class="refund-item" id="pic2">
                    <span class="label">货物凭证2：</span>
                    <div class="fl">
                        <input id="file2" type="file" name="file"   class="easyui-validatebox" />
                        <span id="picError2" class="error"></span>
                        <span class="clr"></span>
                    </div>
                </div>
                <div class="refund-item" id="pic3">
                    <span class="label">货物凭证3：</span>
                    <div class="fl">
                        <input id="file3" type="file" name="file"   class="easyui-validatebox" />
                        <span id="picError3" class="error"></span>
                        <span class="clr"></span>
                    </div>
                </div>
                <div class="refund-item" id="img" style="height:350px">
                    <span class="label">预览图：</span>
                    <div class="fl" >
                        <img id="image1" width="200" height="350"   onLoad="onLoadImage('1')"/>
                        <img id="image2" width="200" height="350"   onLoad="onLoadImage('2')"/>
                        <img id="image3" width="200" height="350"   onLoad="onLoadImage('3')"/>
                        <span class="clr"></span>
                        <span id="img_span" style="color: red;font-weight: bold;"></span><br/>
                    </div>
                </div><br/><br/>

                <div class="refund-item">
                    <span class="label">退款原因<font color="red">*</font>：</span>
                    <div class="fl">
                        <select class="select" id="reason" name="reason">
                            <option >请选择</option>
                            <option value="卖家缺货">卖家缺货</option>
                            <option value="与卖家协商一致退款">与卖家协商一致退款</option>
                            <option value="未按约定时间发货">未按约定时间发货</option>
                            <option value="其他">其他</option>
                        </select>
                        <span id="reasonError" class="error"></span>
                        <span class="clr"></span>
                    </div>
                </div>
                <div class="refund-item">
                    <span class="label">退款说明<font color="red">*</font>：</span>
                    <div class="fl">
                        <!-- text_error -->
                        <textarea  tabindex="1" class="text"  id="info" name="info"></textarea>
                        <span id="infoError" class="error"></span>
                        <span class="clr"></span>
                    </div>
                </div>
                <div class="refund-item" style="padding-left: 100px;padding-right: 100px;">
                    <span class="label">&nbsp;</span>
                    <div class="fl">
                    <input class="btn" id="btn" type="button" tabindex="4"  value="下一步" onclick="onNext();" id="findPwdSubmit" class="btn-img btn-entry">
                </div>
            </div>
    </form>
    </div>
    </div>
</div>

<#include "bec/ghj/service.ftl"/>
<#include "bec/ghj/foot.ftl"/>

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

<script type="text/javascript">
    $(document).ready(function() {
        if('${order.orderStatus}' != 'trade_finished'){
            $("#pic").hide();
            $("#pic2").hide();
            $("#pic3").hide();
            $("#img").hide();
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
                if( data.status == 'success' ){
                    window.location.href="${base}/member/refund/applyfillwl/"+data.message;
                }else{
                    layer.msg( data.message, {icon: 2});
                    setTimeout("window.location.href='${base}/order/list'" ,2000);
                }
            }
        });
    }

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

</#escape>