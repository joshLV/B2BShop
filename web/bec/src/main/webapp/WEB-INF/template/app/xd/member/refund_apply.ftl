<!DOCTYPE html>
<html>
<head>
<#include "app/xd/head.ftl">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style>
        .mui-margin {
          width: 100%;-webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
        }
        .mui-input-group label {
            width: 30%;

            font-size: 14px;
        }
        .mui-input-row label {
            font-family: "微软雅黑";
            float: left;
            width: 30%;
            padding: 10px 15px;
            padding-right: 10px;
            font-size: 15px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            color: #444;
        }
        .mui-input-row .mui-btn {
            font-family: "微软雅黑";
            line-height: 1.1;
            float: right;
            width: 67%; margin-right: 3%;
            padding: 10px 5px 10px 0px;
            margin-top: 5px;
            font-size: 14px;
            -webkit-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
        }
        .mui-input-row .mui-textarea {
            font-family: "微软雅黑";
            line-height:1.7;
            float: right;
            width: 67%; margin-right: 3%;
            padding:  0px 0px 10px 5px;-webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            font-size: 14px;
        }
        .ftx04{
            font-family: "微软雅黑";
            width: 65%;
            float: left;
            padding: 10px 0px 5px 5px;-webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            color: #E4393C;
            font-size: 14px;
        }

        /*top*/
        header{
            position: fixed;
            top: 0px;
            right: 0;
            left: 0;
            background:#e12f45;
            padding:8px 0;
            font-size:18px;
            height:30px;
            line-height:30px;
            box-shadow: 0px 3px 6px #999;
            z-index:10;text-align:center;}
        .logo{ position:absolute;left:10px;float:left;}
        .logo a{ color:#fff;}
        .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
        .user{ position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
        .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/xd/images/user.png) no-repeat; background-size: 20px
        20px;}

        .mtit{color:#fff;}

        /*新加样式  12-31*/
        .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/xd/images/arr.png) no-repeat; background-size:13px
        21px;margin-top:5px;}



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
<#--
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">申请退款</h1>
</header>
-->

<header>
    <div class="logo"><a href="javascript:jumpto(fullpath + '/order/list?whichclient=whichapp&orderType_=1');" class="ltext">返回</a></div>
    <div class="mtit">申请退款</div>
    <div class="user"><a href="javascript:jumpto(fullpath + '/member/index?whichclient=whichapp');">用户</a></div>
</header>


<div class="mui-content mui-margin" style="margin-top: 48px;">
    <div  class="mui-input-group">
        <form id='apply-form'>
            <input type="hidden" name="orderSn" value="${order.orderSn}"/>
            <input type="hidden" name="shopId" value="${order.shopId}"/>
            <input type="hidden" name="amount" value="${order.totalAmount}"/>
            <input type="hidden" name="orderType" value="${order.orderType}"/>
            <input type="hidden" id="uploadfile1" name="uploadfile1" />
            <input type="hidden" id="uploadfile2" name="uploadfile2" />
            <input type="hidden" id="uploadfile3" name="uploadfile3" />
            <input type="hidden" id="whichclient" name="whichclient" value="whichapp"/>
            <div class="mui-input-row">
                <label>&nbsp;订单编号:</label>
                <span class="ftx04"><b>${order.orderSn}</b></span>
            </div>
            <div class="mui-input-row">
                <label>&nbsp;退款金额:</label>
                <span class="ftx04"><b>￥${order.totalAmount}</b></span>
            </div>
            <div class="mui-input-row">
                    <label><span style="color:red">*</span>退款类型:</label>
                    <#if '${order.orderStatus}' == 'trade_finished'>
                        <input type="hidden" name="type" id="type" value="received">
                        <span style=" width: 70%;  float: left; font-size: 15px; margin-top: 10px;"> 收到货</span>
                    <#elseif '${order.orderStatus}' == 'wait_buyer_confirm_goods'>
                        <button id='typePicker' class="mui-btn mui-btn-block" type='button' style="background-color: #E0E0E0;">请选择退款类型 ...</button>
                        <input type="hidden" id="type" name="type" value="unreceived"/>
                    <#else>
                        <input type="hidden" id="type" name="type" value="unreceived"/> <#--unreceived received-->
                        <span style=" width: 70%;  float: left; font-size: 15px; margin-top: 10px;"> 未收货</span>
                    </#if>
            </div>
            <div class="mui-input-row">
                <label><span style="color:red">*</span>退款原因:</label>
                <button id='reasonPicker' class="mui-btn mui-btn-block" type='button' style="background-color: #E0E0E0;">请选择退款原因 ...</button>
                <input type="hidden" id="reason" name="reason"/>
            </div>

            <div class="mui-input-row">
                <label><span style="color:red">*</span>退款说明:</label>
                <textarea  class="mui-textarea mui-btn-block" tabindex="1" class="text"  id="info" name="info" placeholder="请输入退款说明"
                           style="border:solid 1px #d8d8d8; border-radius:5px; resize:none; margin-top: 5px; margin-bottom: 5px"></textarea>
            </div>

        </form>
        <div style="display: <#if '${order.orderStatus}' != 'trade_finished'>none<#else>block</#if>" id="uploadFileBlock">
            <div class="mui-input-row">
                <label><span style="color:red">*</span>货物凭证1:</label>
                <input type="file" capture="camera" accept="image/*" id="file1" name="file"
                       style="display: block; width:70%; float:right; padding: 10px 0px 10px 0px; color: #999; font-size: 14px;">
                <br><span style="float: right; width:120px;display: none" id="uploadfile1PreviewSpan">
                    <img id="uploadfile1Preview" width="20" height="20" data-preview-group="1"/>点击预览</span>
            </div>
            <div class="mui-input-row">
                <label>&nbsp;货物凭证2:</label>
                <input type="file" capture="camera" accept="image/*" id="file2" name="file"
                       style="display: block; width:70%; float:right; padding: 10px 0px 10px 0px; color: #999; font-size: 14px;">
                <br><span style="float: right; width:120px;display: none" id="uploadfile2PreviewSpan">
                    <img id="uploadfile2Preview" width="20" height="20" data-preview-group="1"/>点击预览</span>
            </div>
            <div class="mui-input-row">
                <label>&nbsp;货物凭证3:</label>
                <input type="file" capture="camera" accept="image/*" id="file3" name="file"
                       style="width:70%; float:right; padding: 10px 0px 10px 0px; color: #999; font-size: 14px;">
                <br><span style="float: right; width:120px;display: none" id="uploadfile3PreviewSpan">
                    <img id="uploadfile3Preview" width="20" height="20" data-preview-group="1"/>点击预览</span>
            </div>
        </div>
    </div>
    <div class="mui-content-padded">
        <button  type="button" class="mui-btn mui-btn-primary mui-btn-block" onclick="submitRefundApply()"> 提交</button>
    </div>
    <div id="outLine" style="color: #555; font-size: 16px; padding-left: 10px;"></div>

</div>

<#include "app/xd/tools.ftl">

<#--<script src="${base}/static/js/jquery.ajaxfileupload-20140125.js" type="text/javascript"></script>-->
<script src="${path}/js/lrimg3/lrz.mobile.min.js"></script>
<script src="${path}/js/mui.min.js"></script>
<script src="${path}/js/mui.zoom.js"></script>
<script src="${path}/js/mui.previewimage.js"></script>
<script>


    (function (mui, doc) {
        mui.init();
        mui.ready(function () {
            if( null != doc.getElementById('typePicker')){
                var receiveTypePicker = new mui.PopPicker();
                if( '${order.orderStatus}' != 'trade_finished' ){
                    receiveTypePicker.setData([{value:'received',text:'收到货'},{value:'unreceived', text:'未收货'}]);
                    var receiveTypePickerBtn = doc.getElementById('typePicker');
                    var receiveType = doc.getElementById('type');
                    receiveTypePickerBtn.addEventListener('tap', function (event) {
                        receiveTypePicker.show(function (items) {
                            receiveType.value = items[0].value;
                            receiveTypePickerBtn.innerHTML = items[0].text;
                            if( items[0].value == 'received'){
                                jQuery("#uploadFileBlock").fadeIn();
                            }else{
                                jQuery("#uploadFileBlock").fadeOut();
                            }
                        });
                    },false);
                }
            }

            //选取退款原因
            var ressonPicker = new mui.PopPicker();
            var reasonPickerButton = doc.getElementById('reasonPicker');
            var reason = doc.getElementById('reason');
            reasonPickerButton.addEventListener('tap', function (event) {
                if ( '${order.orderStatus}' == 'trade_finished'){
                    ressonPicker.setData([{
                        value: '与卖家协商一致退款',
                        text: '与卖家协商一致退款'
                    }, {
                        value: '未按约定时间发货',
                        text: '未按约定时间发货'
                    }, {
                        value: '其他',
                        text: '其他'
                    }]);
                }else{
                    ressonPicker.setData([{
                        value: '卖家缺货',
                        text: '卖家缺货'
                    }, {
                        value: '与卖家协商一致退款',
                        text: '与卖家协商一致退款'
                    }, {
                        value: '其他',
                        text: '其他'
                    }]);
                }

                ressonPicker.show(function (items) {
                    reason.value = items[0].text;
                    reasonPickerButton.innerHTML = items[0].text;
                });
            }, false);
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

        /**
         * 退款原因
         * @return
         */
        checkreason = function(){
            var errorFlag = false;
            var errorMessage ="";
            var value = jQuery("#reason").val();
            if(isEmpty(value)){
                errorMessage = "*请您选择退款原因";
                popAlert(errorMessage);
            }else{
                errorFlag = true;
            }
            return errorFlag;
        };
        /**
         * 退款凭证
         * @return
         */
        checkpic = function(){
            var errorFlag = false;
            var errorMessage ="";
            var value = jQuery("#type").val();
            var valuefile = jQuery("#uploadfile1").val();
            if(value=="received"){
                if(isEmpty(valuefile)){
                    errorMessage = "*请您上传货物凭证";
                    popAlert(errorMessage);
                }else{
                    errorFlag=true;
                }
            }

            return errorFlag;
        };
        /**
         * 退款说明
         * @return
         */
         checkinfo = function(){
            var errorFlag = false;
            var errorMessage ="";
            var value = jQuery("#info").val();
            if(isEmpty(value)){
                errorMessage = "*请输入退款说明";
                popAlert(errorMessage);
            }else{
                /**增加退款说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:02:05 Start */
                if(value.length >200){
                    errorMessage = "*退款说明长度不超过200字!";
                    popAlert(errorMessage);;
                }else{
                    errorFlag=true;
                }
                /**增加退款说明 长度限制 大于200提示 Auth:zhangqiang Time:2015-09-23 14:02:05 End */
            }

            return errorFlag;
        };

        submitRefundApply = function(){
            showWaiting();
            if(!checkreason()){
                closeWaiting();
                return ;
            }
            if(!checkinfo()){
                closeWaiting();
                return ;
            }

            var t = jQuery("#type").val();
            if(t =="received" && !checkpic()){
                closeWaiting();
                return;
            }
            var data = jQuery('#apply-form').serialize();
            jQuery.ajax({
                type: "POST",
                url: "${base}/member/refund/applyfill",
                data: data,
                datatype: 'json',
                success: function(data) {
                    jumpto(hosturl+"/member/refund/applyfillwl/"+data.message+"?whichclient=whichapp");
                    closeWaiting();
                },
                error:function(data){
                    popAlert(data.message);
                    closeWaiting();
                }
            });

        };
    }(mui, document));

</script>
</body>
</html>