<#escape x as x?html>
    <#include "bec/xd/header.ftl"/>
    <#include "bec/xd/top.ftl"/>

<div class="content">
	<div class="breadcrumb">
    	<strong><a href="${base}/order/list">退款中心</a></strong><span>&nbsp;&gt;&nbsp;订单：${order.orderSn}<span></span></span>
	</div><!--breadcrumb end-->
</div>

<div class="content">
    <!--状态、提示-->
    <div  id="orderstate">
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
    <div id="refund-mc">
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
            <div<#-- class="refund-form-->" id="a">
            <#--Desc:数据库中没有发货说明字段 Auth:zhangqiang Time:2015-11-11 15:54:35 Start-->
                <#--<div class="refund-item">-->
                    <#--<span class="label">收货人姓名<font color="red">*</font>：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input   class="text"  id="shipName" onblur="checkshipName();" name="shipName"/>-->
                        <#--<span id="shipNameError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="refund-item">-->
                    <#--<span class="label">所属地区<font color="red">*</font>：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input type="text" id="shipAreaPath" name="shipAreaPath" class="areaSelect hidden" value=""/>-->
                        <#--<span id="shipAreaPathError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="refund-item">-->
                    <#--<span class="label">详细地址<font color="red">*</font>：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input   class="text"  id="shipAddress" name="shipAddress"/>-->
                        <#--<span id="shipAddressError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="refund-item">-->
                    <#--<span class="label">邮编：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input   class="text"  id="shipZipCode" onblur="checkposcode();" name="shipZipCode"/>-->
                        <#--<span id="shipZipCodeError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="refund-item">-->
                    <#--<span class="label">收货固定电话：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input   class="text" onblur="checkPhone();"  id="shipPhone" name="shipPhone"/>-->
                        <#--<span id="shipPhoneCodeError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="refund-item">-->
                    <#--<span class="label">收货手机号<font color="red">*</font>：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<input   class="text" onblur="checkMobile()"  id="shipMobile" name="shipMobile"/>-->
                        <#--<span id="shipMobileError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <#--Desc:数据库中没有发货说明字段 Auth:zhangqiang Time:2015-11-11 15:54:35 End-->
                <div class="refund-item">
                    <span class="label">物流公司<font color="red">*</font>：</span>
                    <div class="fl">
                        <!-- text_error -->
                        <input   class="text"  id="logisticsName" name="logisticsName"/>
                        <span id="logisticsNameError" class="error"></span>
                        <span class="clr"></span>
                    </div>
                </div>
                <div class="refund-item">
                    <span class="label">物流单号<font color="red">*</font>：</span>
                    <div class="fl">
                        <!-- text_error -->
                        <input   class="text"  id="logisticsNo" name="logisticsNo"/>
                        <span id="logisticsNoError" class="error"></span>
                        <span class="clr"></span>
                    </div>
                </div>
                <#--<div class="refund-item">-->
                    <#--<span class="label">发货说明<font color="red">*</font>：</span>-->
                    <#--<div class="fl">-->
                        <#--<!-- text_error &ndash;&gt;-->
                        <#--<textarea   class="text"  id="info" name="info"></textarea>-->
                        <#--<span id="infoError" class="error"></span>-->
                        <#--<span class="clr"></span>-->
                    <#--</div>-->
                <#--</div>-->
                <div class="refund-item" id="pic">
                    <span class="label">上传凭证<font color="red">*</font>：</span>
                    <div class="fl">
                        <input id="file" type="file" name="file" class="easyui-validatebox" />(图片规格:400*850)
                        <span id="picError" class="error"></span>
                        <span class="clr"></span>
                    </div>
                </div>
                <div class="refund-item" id="img" style="height:380px">
                    <span class="label">预览图：</span>
                    <div class="fl" >
                        <img id="image" width="200" height="350"  onLoad="onLoadImage()"/>
                        <span class="clr" style="color: red;font-weight: bold;"></span>
                        <span id="img_span" style="color: red;font-weight: bold;"></span>
                    </div>
                </div>
                <div class="refund-item" style="padding-top: 20px">
                    <span class="label">&nbsp;</span>
                    <input class="btn" id="btn" type="button"  tabindex="4" value="下一步" onclick="onNext();" id="findPwdSubmit" class="btn-img btn-entry">
                </div>
            </div>
    </form>
    </div>
</div>
</div>
<#include "bec/xd/service.ftl"/>
<#include "bec/xd/foot.ftl"/>

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

<script type="text/javascript">
    $(document).ready(function() {
        // 地区选择菜单
        <#--$(".lSelect").remove();//移除之前生成的-->
        <#--$(".areaSelect").lSelect({-->
            <#--url: "${base}/area/ajaxChildren"// Json数据获取url-->
        <#--});-->
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
//        if(!checkinfo()){
//            return ;
//        }
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
        var errorFlag = false;
        var errorMessage ="";
        var value = $("#shipMobile").val();
        var regu = /^\d{11}$/;
        var re = new RegExp(regu);
        if (isEmpty(value)) {
            errorMessage = "*  请您填写收货人手机号码";
            $("#shipMobileError").text(errorMessage);
            $("#shipMobileError").show();
        }
        if(!re.test(value)){
            errorMessage = "*  手机号码格式不正确";
            $("#shipMobileError").text(errorMessage);
            $("#shipMobileError").show();
        }else{
            $("#shipMobileError").hide();
            errorFlag=true;
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

</#escape>