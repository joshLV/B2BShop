<!DOCTYPE html>
<html>
<head>
<#include "app/gwq/head.ftl">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style>
        .mui-margin {
            margin: -5px 5px 0px 5px;
        }

        .mui-input-group label {
            font-family: "微软雅黑";
            width: 30%;
            margin-top: 10px;
            font-size: 14px;
        }

        .mui-input-row label {
            font-family: "微软雅黑";
            line-height: 1.1;
            float: left;
            width: 30%;
            padding: 0px 0px 5px 10px;
            font-size: 14px;
        }

        .mui-input-row .mui-btn {
            font-family: "微软雅黑";
            line-height: 1.1;
            float: right;
            width: 60%;
            padding: 10px 0px 10px 0px;
            margin-top: 10px;
            font-size: 14px;
        }
        .mui-input-row .mui-input {
            font-family: "微软雅黑";
            line-height: 1.1;
            float: right;
            width: 60%;
            padding: 10px 0px 0px 0px;
            font-size: 14px;
        }
        .mui-input-row .mui-textarea {
            font-family: "微软雅黑";
            line-height: 2.2;
            float: right;
            width: 60%;
            padding: 0px 0px 10px 0px;
            font-size: 14px;
        }

        .ftx04 {
            width: 60%;
            float: right;
            padding: 10px 0px 5px 5px;
            color: red;
            font-size: 14px;
        }
    </style>
    <style type="text/css">
        .mui-preview-image.mui-fullscreen {
            position: fixed;
            z-index: 20;
            background-color: #000;
        }

        .mui-preview-header,
        .mui-preview-footer {
            position: absolute;
            width: 100%;
            left: 0;
            z-index: 10;
        }

        .mui-preview-header {
            height: 44px;
            top: 0;
        }

        .mui-preview-footer {
            height: 50px;
            bottom: 0px;
        }

        .mui-preview-header .mui-preview-indicator {
            display: block;
            line-height: 25px;
            color: #fff;
            text-align: center;
            margin: 15px auto 4;
            width: 70px;
            background-color: rgba(0, 0, 0, 0.4);
            border-radius: 12px;
            font-size: 16px;
        }

        .mui-preview-image {
            display: none;
            -webkit-animation-duration: 0.5s;
            animation-duration: 0.5s;
            -webkit-animation-fill-mode: both;
            animation-fill-mode: both;
        }

        .mui-preview-image.mui-preview-in {
            -webkit-animation-name: fadeIn;
            animation-name: fadeIn;
        }

        .mui-preview-image.mui-preview-out {
            background: none;
            -webkit-animation-name: fadeOut;
            animation-name: fadeOut;
        }

        .mui-preview-image.mui-preview-out .mui-preview-header,
        .mui-preview-image.mui-preview-out .mui-preview-footer {
            display: none;
        }

        .mui-zoom-scroller {
            position: absolute;
            display: -webkit-box;
            display: -webkit-flex;
            display: flex;
            -webkit-box-align: center;
            -webkit-align-items: center;
            align-items: center;
            -webkit-box-pack: center;
            -webkit-justify-content: center;
            justify-content: center;
            left: 0;
            right: 0;
            bottom: 0;
            top: 0;
            width: 100%;
            height: 100%;
            margin: 0;
            -webkit-backface-visibility: hidden;
        }

        .mui-zoom {
            -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
        }

        .mui-slider .mui-slider-group .mui-slider-item img {
            width: auto;
            height: auto;
            max-width: 100%;
            max-height: 100%;
        }

        .mui-android-4-1 .mui-slider .mui-slider-group .mui-slider-item img {
            width: 100%;
        }

        .mui-android-4-1 .mui-slider.mui-preview-image .mui-slider-group .mui-slider-item {
            display: inline-table;
        }

        .mui-android-4-1 .mui-slider.mui-preview-image .mui-zoom-scroller img {
            display: table-cell;
            vertical-align: middle;
        }

        .mui-preview-loading {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            display: none;
        }

        .mui-preview-loading.mui-active {
            display: block;
        }

        .mui-preview-loading .mui-spinner-white {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -25px;
            margin-top: -25px;
            height: 50px;
            width: 50px;
        }

        .mui-preview-image img.mui-transitioning {
            -webkit-transition: -webkit-transform 0.5s ease, opacity 0.5s ease;
            transition: transform 0.5s ease, opacity 0.5s ease;
        }

        @-webkit-keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeOut {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

        @keyframes fadeOut {
            0% {
                opacity: 1;
            }
            100% {
                opacity: 0;
            }
        }

        p img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">填写物流信息</h1>
</header>
<div class="mui-content mui-margin">
    <div class="mui-input-group">
        <form id='apply-form'>
            <input type="hidden" id="id" name="id" value="${refund.id}"/>
            <input type="hidden" name="orderSn" value="${order.orderSn}"/>
            <input type="hidden" name="shopId" value="${order.shopId}"/>
            <input type="hidden" name="amount" value="${order.totalAmount}"/>
            <input type="hidden" id="uploadfile1" name="uploadfile1"/>
            <input type="hidden" id="whichclient" name="whichclient" value="whichapp"/>
		<#--<div class="mui-input-row">
			<label>收货人:<span style="color:red">*</span></label>
			<input id='shipName' name="shipName" type="text" class="mui-input-clear mui-input" placeholder="请输入收货人姓名">
		</div>
		<div class="mui-input-row">
			<label>所属地区:<span style="color:red">*</span></label>
			<button id='showCityPicker' class="mui-btn mui-btn-block" type='button' style="background-color: #E0E0E0;">请选择城市 ...</button>
			<input type="hidden" id='shipAreaPath' name="shipAreaPath" >
		</div>

		<div class="mui-input-row">
			<label>详细地址:<span style="color:red">*</span></label>
			<textarea class="mui-textarea mui-btn-block" class="text" id="shipAddress" name="shipAddress"
					  style="border:solid 1px #808080; border-radius:10px; resize:none; margin-top: 10px; margin-bottom: 5px" placeholder="请输入详细地址"></textarea>
		</div>
		<div class="mui-input-row">
			<label>邮编：</label>
			<input class="mui-input-clear mui-input" class="number" id="shipZipCode" name="shipZipCode"
				   onblur="checkposcode();" placeholder="请输入邮编" />
		</div>
		<div class="mui-input-row">
			<label>固定电话：</label>
			<input class="mui-input-clear mui-input" class="text" id="shipPhone" name="shipPhone"
				   onblur="checkPhone();" placeholder="请输入固定电话" />
		</div>
		<div class="mui-input-row">
			<label>手机号码:<span style="color:red">*</span></label>
			<input id='shipMobile' name="shipMobile" type="tel" class="mui-input-clear mui-input"
				   placeholder="请输入收货人手机号码">
		</div>-->

            <div class="mui-input-row">
                <label>物流公司:<span style="color:red">*</span></label>
                <button id='showLogisticsNamePicker' class="mui-btn mui-btn-block" type='button'
                        style="background-color: #E0E0E0;">请选择物流公司 ...
                </button>
                <input type="hidden" id='logisticsName' name="logisticsName"/>
            </div>
            <div class="mui-input-row">
                <label>物流单号:<span style="color:red">*</span></label>
                <input id='logisticsNo' name="logisticsNo" type="text" class="mui-input-clear mui-input"
                       placeholder="请输入物流单号">
            </div>
        </form>
        <div class="mui-input-row">
            <label>货物凭证:<span style="color:red">*</span></label>
            <input type="file" capture="camera" accept="image/*" id="file1" name="file1"
                   style="display: block; width:60%; float:right; padding: 10px 0px 10px 0px;">
            <br><span style="float: right; width:60%;display: none" id="uploadfile1PreviewSpan">
                    <img id="uploadfile1Preview" width="20" height="20" data-preview-group="1"/>点击预览</span>
        </div>

        <div id="outLine"
             style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; margin-top: 10px; font-size: 12px"></div>
        <div class="mui-input-row">
            <button id="btn" type="button" class="mui-btn mui-btn-primary mui-btn-block" onclick="onNext();"
                    style="display: block; width:100%; float:right; padding: 10px 0px 10px 0px;"> 下一步
            </button>
        </div>

    </div>

</div>

<#include "app/gwq/tools.ftl">
<#--<script src="${base}/static/js/jquery.ajaxfileupload-20140125.js" type="text/javascript"></script>-->
<script src="${path}/js/expresscompany.data.js" type="text/javascript"></script>
<script src="${path}/js/lrimg3/lrz.mobile.min.js"></script>
<script src="${path}/js/mui.zoom.js"></script>
<script src="${path}/js/mui.previewimage.js"></script>
<script>
    (function (mui, doc) {
        var cityDatas = localStorage.getItem("cityDatas");
        var isLoadingCityDatas = false;
        loadCityDatas = function () {
            if (isLoadingCityDatas) return;
            if (typeof(cityDatas) == 'undefined' || cityDatas == null) {
                isLoadingCityDatas = true;
                jQuery.ajax({
                    type: "post",
                    url: fullpath + '/area/ajax/getAllArea',
                    error: function () {
                        isLoadingCityDatas = false;
                    },
                    success: function (result) {
                        isLoadingCityDatas = false;
                        cityDatas = result;
                        localStorage.setItem("cityDatas", cityDatas);
                    }
                });
            }
        };
        mui.init();
        mui.ready(function () {
            //选取快递公司
            var expressCompanyPicker = new mui.PopPicker({layer: 2});
            expressCompanyPicker.setData(expressCompanyData);
            var showExpressCompanyPickerButton = doc.getElementById('showLogisticsNamePicker');
            var logisticsName = doc.getElementById('logisticsName');
            showExpressCompanyPickerButton.addEventListener('tap', function (event) {
                expressCompanyPicker.show(function (items) {
                    showExpressCompanyPickerButton.innerHTML = items[1].text;
                    logisticsName.value = items[1].text;
                });
            }, false);
            //选取城市
            if (null != doc.getElementById('showCityPicker')) {
                loadCityDatas();
                var cityPicker = new mui.PopPicker({
                    layer: 3
                });
                var showCityPickerButton = doc.getElementById('showCityPicker');
                var shipAreaPath = doc.getElementById('shipAreaPath');
                showCityPickerButton.addEventListener('tap', function (event) {
                    if (typeof(cityDatas) == 'undefined' || cityDatas == null) {
                        loadCityDatas();
                        if (isLoadingCityDatas) {
                            var interval = window.setInterval(function () {
                                if (isLoadingCityDatas) {
                                    console.log("Loading city datas ...");
                                } else {
                                    window.clearInterval(interval);
                                    console.log("Load city datas over");
                                    cityPicker.setData(JSON.parse(cityDatas));
                                }
                            }, 100);

                        } else {
                            cityPicker.setData(JSON.parse(cityDatas));
                        }
                    } else {
                        cityPicker.setData(JSON.parse(cityDatas));
                    }
                    cityPicker.show(function (items) {
                        var address = "";
                        var value = "";
                        if (items[0] != null && typeof(items[0].text) != 'undefined') {
                            address = address + items[0].text;
                            value = items[0].value;
                            if (items[1] != null && typeof(items[1].text) != 'undefined') {
                                address = address + " " + items[1].text;
                                value = items[1].value;
                                if (items[2] != null && typeof(items[2].text) != 'undefined') {
                                    address = address + " " + items[2].text;
                                    value = items[2].value;
                                }
                            }
                        }
                        showCityPickerButton.innerHTML = address;
                        shipAreaPath.value = value;
                    });
                }, false);
            }
        });
        if (ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }
        jQuery('input[type="file"]').on('change', function(){
            var inputImage = this;
            lrz(inputImage.files[0], {width: 400}, function (results) {

                console.log(results);
                setTimeout(function () {
                    var data = {
                        base64: results.base64,
                        name:results.origin.name,
                        size: results.base64.length // 校验用，防止未完整接收
                    };
                    jQuery.ajax({
                        type: "POST",
                        url: '${base}/ajaxUploadFiles',
                        data: data,
                        dataType:"json",
                        success: function(data){

                            if ("success" == data.status) {
                                console.log(data.data);
                                jQuery('#upload'+inputImage.id+'PreviewSpan').show();
                                jQuery('#upload'+inputImage.id+'Preview').prop('src', 'http://' + data.data.imgSrvAddr + '/'+ data.data.projectName + '/' + data.data.path);
                                jQuery('#upload'+inputImage.id+'Preview').attr('data-preview-src', 'http://' + data.data.imgSrvAddr + '/'+ data.data.projectName + '/' + data.data.path);
                                jQuery('#upload'+inputImage.id).val(JSON.stringify(data.data));
                                mui.previewImage();
                                return false;
                            }else{
                                popAlert(data.message);
                                return false;
                            }
                        },
                        error:function(){ //上传失败
                            popAlert('网络异常，上传失败，请稍候再试');
                        }
                    });

                }, 100);
            });
        });
    }(mui, document));


    function onNext() {
        showWaiting();
        /*if (!checkshipName()) {
            closeWaiting();
            return;
        }
        if (!checkshipAreaPath()) {
         closeWaiting();
            return;
        }
        if (!checkshipAddress()) {
         closeWaiting();
            return;
        }
        if (!checkMobile()) {
         closeWaiting();
            return;
        }*/
        if (!checklogisticsName()) {
            closeWaiting();
            return;
        }
        if (!checklogisticsNo()) {
            closeWaiting();
            return;
        }
//        if(!checkinfo()){
//            return ;
//        }
        if (!checkpic()) {
            closeWaiting();
            return;
        }

        var data = jQuery('#apply-form').serialize();
        jQuery.ajax({
            type: "POST",
            url: "${base}/member/refund/applyfilladdress",
            data: decodeURIComponent(data,true),
            datatype: 'json',
            success: function(data) {
                if (data.status == 'success') {
                    jumpto(hosturl + "/member/refund/refundsuccess/${refund.orderSn}?whichclient=whichapp");
                    closeWaiting();
                } else {
                    closeWaiting();
                    popAlert(data.message);
                }

            },
            error:function(data){
                popAlert('网络异常，请稍候再试');
                closeWaiting();
            }
        });


    }
    <#--
    function validTagImage() {
        var img = new Image();
        img.src = document.getElementById("image").src;
        if (img.width > 400 || img.height > 850) {
            return false;
        }
        if (img.width == 0 || img.height == 0) {
            return false;
        }
        return true;
    }
    function onLoadImage() {
        if (!validTagImage()) {
            outSet("图片不符合规格,建议规格小于400*850");
        } else {
            outSet("");
        }
    }
    function uploadImg() {


        var data = jQuery('#apply-form').serialize();
        //执行上传文件操作的函数
        jQuery.ajaxFileUpload({
            url: "${base}/member/refund/applyfilladdress?" + data,
            secureuri: true,//是否启用安全提交,默认为false
            fileElementId: jQuery('input[name=file]'),//文件选择框的对象,多个时用[]包含
            dataType: 'text',
            async: true,
            success: function (data, status) {//服务器响应成功时的处理函数
                data = data.replace(/<pre.*?>/g, '');
                data = data.replace(/<PRE.*?>/g, '');
                data = data.replace("<PRE>", '');
                data = data.replace("</PRE>", '');
                data = data.replace("<pre>", '');
                data = data.replace("</pre>", '');
                data = jQuery.parseJSON(data);
                if (data.status == 'success') {
                    jumpto(hosturl + "/member/refund/refundsuccess/${refund.orderSn}?whichclient=whichapp");
                } else {
                    popAlert(data.message);
                }
            },
            error: function (data, status, e) { //服务器响应失败时的处理函数
                data = data.replace(/<pre.*?>/g, '');
                data = data.replace(/<PRE.*?>/g, '');
                data = data.replace("<PRE>", '');
                data = data.replace("</PRE>", '');
                data = data.replace("<pre>", '');
                data = data.replace("</pre>", '');
                data = jQuery.parseJSON(data);
                popAlert(data.message);
            }
        });
    }
    -->
    /**
     * 凭证
     * @return
     */
    function checkpic() {
        var errorFlag = false;
        var errorMessage = "";
        var value = jQuery("#uploadfile1").val();
        if (isEmpty(value)) {
            errorMessage = "* 请您上传凭证";
            outSet(errorMessage);
        } else {
            outSet("");
            errorFlag = true;
        }

        return errorFlag;
    }
    /**
     * 收货人姓名
     * @return
     */
    function checkshipName() {
        var errorFlag = false;
        var errorMessage = "";
        var value = jQuery("#shipName").val();
        if (isEmpty(value)) {
            errorMessage = "* 请输入收货人姓名";
            outSet(errorMessage);
        } else {
            /**增加收货人姓名 长度限制 大于16提示 Auth:zhangqiang Time:2015-09-23 14:04:05 Start */
            if (value.length > 16) {
                errorMessage = "* 收货人姓名长度不超过16字!";
                outSet(errorMessage);
            } else {
                outSet("");
                errorFlag = true;
            }
            /**增加收货人姓名 长度限制 大于16提示 Auth:zhangqiang Time:2015-09-23 14:04:05 End */
        }
        return errorFlag;
    }

    /**
     * 收货人地址
     * @return
     */
    function checkshipAreaPath() {
        var errorFlag = false;
        var errorMessage = "";
        var value = jQuery("#shipAreaPath").val();
        if (isEmpty(value)) {
            errorMessage = "* 请选择地区";
            outSet(errorMessage);
        } else {
            outSet("");
            errorFlag = true;
        }

        return errorFlag;
    }
    /**
     * 详细地址
     * @return
     */
    function checkshipAddress() {
        var errorFlag = false;
        var errorMessage = "";
        var value = jQuery("#shipAddress").val();
        if (isEmpty(value)) {
            errorMessage = "* 请输入详细地址";
            outSet(errorMessage);
        } else {
            /**增加详细地址 长度限制 大于64提示 Auth:zhangqiang Time:2015-09-23 14:05:05 Start */
            if (value.length > 64) {
                errorMessage = "* 详细地址长度不超过64个字!";
                outSet(errorMessage);
            } else {
                outSet("");
                errorFlag = true;
            }
            /**增加详细地址 长度限制 大于64提示 Auth:zhangqiang Time:2015-09-23 14:05:05 End */
        }

        return errorFlag;
    }
    /**
     * 物流公司
     * @return
     */
    function checklogisticsName() {
        var errorFlag = false;
        var errorMessage = "";
        var value = jQuery("#logisticsName").val();
        if (isEmpty(value)) {
            errorMessage = "* 请输入物流公司名称";
            outSet(errorMessage);
        } else {
            /**增加物流公司 长度限制 大于16提示 Auth:zhangqiang Time:2015-09-23 14:06:05 Start */
            if (value.length > 16) {
                errorMessage = "* 物流公司名称长度不超过16个字!";
                outSet(errorMessage);
            } else {
                outSet("");
                errorFlag = true;
            }
            /**增加物流公司 长度限制 大于16提示 Auth:zhangqiang Time:2015-09-23 14:06:05 End */
        }
        return errorFlag;
    }
    /**
     * 凭证
     * @return
     */
    function checklogisticsNo() {
        var errorFlag = false;
        var errorMessage = "";
        var isLogisticsNo = /^[A-Za-z0-9]{9,20}$/;
        var value = jQuery("#logisticsNo").val();
        if (isEmpty(value)) {
            errorMessage = "* 请输入物流单号";
            outSet(errorMessage);
        } else {

            /**增加凭证 长度限制 大于32提示 Auth:zhangqiang Time:2015-09-23 14:06:05 Start */
            if (value.length < 9) {
                errorMessage = "* 物流单号长度不能小于9个字符!";
                outSet(errorMessage);
            } else if (value.length > 20) {
                errorMessage = "* 物流单号长度不超过20个字符!";
                outSet(errorMessage);
            } else if (!isLogisticsNo.exec(value)) {
                errorMessage = "* 物流单号格式不正确!";
                outSet(errorMessage);
            } else {
                outSet("");
                errorFlag = true;
            }
            /**增加凭证 长度限制 大于32提示 Auth:zhangqiang Time:2015-09-23 14:06:05 End */
        }

        return errorFlag;
    }
    /**
     * 发货说明
     * @return
     */
    function checkinfo() {
        var errorFlag = false;
        var errorMessage = "";
        var value = jQuery("#info").val();
        if (isEmpty(value)) {
            errorMessage = "* 请输入发货说明";
            outSet(errorMessage);
        } else {
            /**增加发货说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:07:05 Start */
            if (value.length > 200) {
                errorMessage = "* 发货说明长度不超过200个字!";
                outSet(errorMessage);
            } else {
                outSet("");
                errorFlag = true
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
    function checkposcode() {
        var errorFlag = false;
        var errorMessage = "";
        var value = jQuery("#shipZipCode").val();
        var pattern = /^[1-9][0-9]{5}$/;
        if (value) {
            if (!pattern.test(value)) {
                errorFlag = true;
                errorMessage = "*  邮政编码格式不正确！";
            }
        }
        if (errorFlag) {
            outSet(errorMessage);
        } else {
            outSet("");
        }
        return errorFlag;
    }
    /**
     * 手机号
     * @return
     */
    function checkMobile() {
        var errorFlag = true;
        var errorMessage = "";
        var value = jQuery("#shipMobile").val();
        var regu = /^\d{11}$/;
        var re = new RegExp(regu);
        if (isEmpty(value)) {
            errorMessage = "*  请您填写收货人手机号码";
            outSet(errorMessage);
            errorFlag = false;
            return errorFlag;
        }
        if (!re.test(value)) {
            errorMessage = "*  手机号码格式不正确";
            outSet(errorMessage);
            errorFlag = false;
            return errorFlag;
        } else {
            outSet("");
            //errorFlag=true;
        }
        return errorFlag;
    }
    /**
     * 固定电话
     * @return
     */
    function checkPhone() {
        var errorFlag = false;
        var errorMessage = "";
        var value = jQuery("#shipPhone").val();
        if (value) {
            if (!is_forbid(value)) {
                errorFlag = true;
                errorMessage = "固定电话号码中含有非法字符";
            }
            if (value.length > 20) {
                errorFlag = true;
                errorMessage = "*  固定电话号码过长";
            }
            var patternStr = "(0123456789-)";
            var strlength = value.length;
            for (var i = 0; i < strlength; i++) {
                var tempchar = value.substring(i, i + 1);
                if (patternStr.indexOf(tempchar) < 0) {
                    errorFlag = true;
                    errorMessage = "*  固定电话号码格式不正确";
                }
            }
        }

        if (errorFlag) {
            outSet(errorMessage);
        } else {
            outSet("");
        }
        return errorFlag;
    }

</script>
</body>
</html>