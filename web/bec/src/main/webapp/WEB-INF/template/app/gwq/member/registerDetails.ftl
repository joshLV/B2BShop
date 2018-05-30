
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/gwq/head.ftl">
    <style>
        .mui-input-row label {
            font-family: "微软雅黑";
            float: left;
           /* width: 100%;*/
            padding: 10px 15px;
            padding-right: 10px;
            font-size: 15px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
            color: #444;
        }
        .mui-input-group:first-child {
            margin-top: 20px;
        }
        .mui-input-group label {
            width: 30%;
        }
        .mui-input-row label~input,
        .mui-input-row label~select,
        .mui-input-row label~textarea {
            width: 70%;
        }
        .mui-input-row label~input[type=file]{
            margin: 10px 0px 0px 0px;
        }
        .mui-checkbox input[type=checkbox],
        .mui-radio input[type=radio] {
            top: 6px;
        }
        .mui-content-padded {
            margin-top: 25px;
        }
        .mui-btn {
            padding:8px 10px;
        }
        .mui-input-row .captchainput{
            border:solid 1px #808080;
            border-radius:4px;
            resize:none;
            margin: 10px 37px 5px 0px;
            width:50%
        }
        .mui-input-row .captcha {
            cursor:pointer;
            width:100px;
            height:38px;
            line-height:38px;
            display:block;
            float:left;
            margin-left: 30%;
        }

        .mui-input-row .captchalabel{
            font-family: "微软雅黑";
            float: left;
            width: 35%;
            font-size: 15px;
            box-sizing: border-box;
            color: #444;
            margin-left: -30px;
        }
        .mui-popover .mui-table-view {
            overflow: auto;
            max-height: 500px; padding: 15px; padding-top: 0;
            margin-bottom: 0;
            border-radius: 7px;
            background-color: #f7f7f7;
            background-image: none;
            -webkit-overflow-scrolling: touch
        }
        .mui-scroll-wrapper {
            top: 40px!important;
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
    .mui-input-item{width: 45% !important; height: 200px; margin-top:10px; margin-left: 10px; border: 1px solid #CCCCCC; float: left;}
    .mui-input-item label{width: 100%; text-align: center;}
    .choose-file{width:100%; text-align: center;}
    .click_preview{width:100%; text-align: center;}
    .mui-input-row{width: 100%; clear: none;}
    .file {
        position: relative;
        display: inline-block;
        background: #e4393c;
        border-radius: 4px;
        padding: 4px 12px;
        overflow: hidden;
        color: #ffffff;
        text-decoration: none;
        text-indent: 0;
        line-height: 20px;
    }
    .file input {
        position: absolute;
        font-size: 100px;
        right: 0;
        top: 0;
        opacity: 0;
        width: 92px;
    }
    .file:hover {
        background: #DB0000;
        color: #ffffff;
        text-decoration: none;
    }
</style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" >
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">采购商注册 &gt; 提交公司资质信息</h1>

</header>
<div class="mui-content" style="margin-top: 28px;">
    <div>
        <div class="mui-input-row mui-input-item">
            <label style="margin-top: 20px;"><span style="color:red">*</span>营业执照:</label>
            <div class="choose-file">
            <a href="javascript:;" class="file">选择文件
                <input id='file1' name='file' type="file" datatype="img" width="4096" height="4096"  capture="camera" accept="image/*"
                class="mui-input" placeholder="请选择营业执照文件扫描件文件！">
            </a>
            </div>
            <div class="click_preview">
		        <span style="/*float: left; width:120px;*/display: none" id="uploadfile1PreviewSpan">
                <img id="uploadfile1Preview" width="60" height="60" data-preview-group="1" style="margin-top: 5px; margin-bottom: 5px;" />
                <p>点击预览</p>
                </span>
            </div>
        </div>
        <div class="mui-input-row mui-input-item">
            <label style="margin-top: 20px;"><span style="color:red">*</span>开户许可证:</label>
            <div class="choose-file">
                <a href="javascript:;" class="file">选择文件
                <input id='file2' name="file" type="file" datatype="img" width="4096" height="4096" capture="camera" accept="image/*"
                class="mui-input" placeholder="请选择开户许可证文件扫描件文件！">
                </a>
            </div>
            <div class="click_preview">
		        <span style="/*float: left; width:120px;*/display: none" id="uploadfile2PreviewSpan">
                <img id="uploadfile2Preview" width="60" height="60" data-preview-group="1"  style="margin-top: 5px; margin-bottom: 5px;" /><p>点击预览</p></span>
            </div>
        </div>
        <div class="mui-input-row mui-input-item">
            <label style="margin-top: 20px;"><span style="color:red">*</span>税务登记证:</label>
            <div class="choose-file">
                <a href="javascript:;" class="file">选择文件
            <input id='file3' name="file" type="file" datatype="img" width="4096" height="4096" capture="camera" accept="image/*"
                   class="mui-input" placeholder="请选择税务登记证文件扫描件文件！">
                </a>
            </div>
            <div class="click_preview">
		    <span style="/*float: left; width:120px;*/display: none" id="uploadfile3PreviewSpan">
                    <img id="uploadfile3Preview" width="60" height="60" data-preview-group="1"  style="margin-top: 5px; margin-bottom: 5px;" /><p>点击预览</p></span>
            </div>
        </div>
        <div class="mui-input-row mui-input-item">
            <label style="margin-top: 20px;"><span style="color:red">*</span>组织机构代码证:</label>
            <div class="choose-file">
                <a href="javascript:;" class="file">选择文件
            <input id='file4' name="file" type="file" datatype="img" width="4096" height="4096" capture="camera" accept="image/*"
                   class="mui-input" placeholder="请选择组织机构代码证文件扫描件文件！">
                </a>
            </div>
            <div class="click_preview">
		   <span style="/*float: left; width:120px;*/display: none" id="uploadfile4PreviewSpan">
                    <img id="uploadfile4Preview" width="60" height="60" data-preview-group="1" style="margin-top: 5px; margin-bottom: 5px;" /><p>点击预览</p></span>
            </div>
        </div>
        <div class="mui-input-row">
        <form name="reg2" id="reg2">
            <input type="hidden" id="buyerId" name="buyerId" value="${buyerId}"/>
            <input type="hidden" id="uploadfile1" name="uploadfile1" />
            <input type="hidden" id="uploadfile2" name="uploadfile2" />
            <input type="hidden" id="uploadfile3" name="uploadfile3" />
            <input type="hidden" id="uploadfile4" name="uploadfile4" />
            <label style="width: 30%;"><span style="color:red">*</span>验证码:</label>
            <input type="text" name="authcode" id="authcode" datatype="*" class="captchainput" placeholder="请输入验证码" style="margin-right: 20%;"/>
            <img id="captchaImage"  class="captcha"  style="margin-top: 10px;" alt="验证码" src="${base}/captcha.jpg?yys=+new Date().getTime()" onclick="this.src='${base}/captcha.jpg?yys='+new Date().getTime()">
            <label style="margin-left: -18px;">看不清?<a href="javascript:void(0)" id="getCaptcha" onclick="document.getElementById('captchaImage').src='${base}/captcha.jpg?yys='+new Date().getTime()" class="flk13">换一张</a></label>
        </form>
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>我已阅读并同意:</label>
            <div class="mui-checkbox f-cb" >
                <input id="readme" name="checkbox" value="0" checked="true" type="checkbox" onclick="javascript:agreeonProtocol();" style="width:10%;/* margin-top: 12px*/"/>
                <a href="#protocol-con"  class="blue" id="protocol" style="float: left; width: 50%;padding: 10px 0px 0px 5px;z-index:99999">《采购商注册协议》</a>
            </div>

        </div>
    </form>

    </div>
    <div id="outLine" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; font-size: 12px"></div>

    <div class="mui-content-padded" style="margin-top: -20px">
        <button id='submits' type="button" class="mui-btn mui-btn-block mui-btn-primary">提交资质</button>
    </div>

    <div class="fl" id = "pic" style="display: none">
        <img id="image1" width="80" height="60"  onLoad="onLoadImage('file1')"/>
        <img id="image2" width="80" height="60"  onLoad="onLoadImage('file2')"/>
        <img id="image3" width="80" height="60"  onLoad="onLoadImage('file3')"/>
        <img id="image4" width="80" height="60"  onLoad="onLoadImage('file4')"/>
    </div>

</div>
<#include "app/gwq/protocol.ftl"/>
<script src="${path}/js/validform_sample.js"></script>
<#--
<script src="${base}/static/js/jquery.ajaxfileupload-20140125.js" type="text/javascript"></script>
<script src="${base}/static/js/uploadPreview.js" type="text/javascript"></script>
-->
<script src="${path}/js/lrimg3/lrz.mobile.min.js"></script>
<script src="${path}/js/mui.zoom.js"></script>
<script src="${path}/js/mui.previewimage.js"></script>
<script>
    (function(mui, doc) {
        mui.init();
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }
        mui('.mui-scroll-wrapper').scroll();
<#--
        jQuery("#file1").uploadPreview({ Img: "image1", Width: 0, Height: 0 });
        jQuery("#file2").uploadPreview({ Img: "image2", Width: 0, Height: 0 });
        jQuery("#file3").uploadPreview({ Img: "image3", Width: 0, Height: 0 });
        jQuery("#file4").uploadPreview({ Img: "image4", Width: 0, Height: 0 });
-->

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
        jQuery('#submits').on('tap', function(){
            showWaiting();
            //check图片是否上传成功
            var uploadfile1 = jQuery('#uploadfile1').val();
            if(typeof(uploadfile1) == 'undefined' || uploadfile1 == ""){
                closeWaiting();
                popAlert('营业执照不能为空');
                return;
            }
            var uploadfile2 = jQuery('#uploadfile2').val();
            if(typeof(uploadfile2) == 'undefined' || uploadfile2 == ""){
                closeWaiting();
                popAlert('开户许可证不能为空');
                return;
            }
            var uploadfile3 = jQuery('#uploadfile3').val();
            if(typeof(uploadfile3) == 'undefined' || uploadfile3 == ""){
                closeWaiting();
                popAlert('税务登记证不能为空');
                return;
            }
            var uploadfile4 = jQuery('#uploadfile4').val();
            if(typeof(uploadfile4) == 'undefined' || uploadfile4 == ""){
                closeWaiting();
                popAlert('组织机构代码证不能为空');
                return;
            }

            var authcode = jQuery('#authcode').val();
            if(typeof(authcode) == 'undefined' || authcode == ""){
                closeWaiting();
                popAlert('验证码不能为空');
                return;
            }
            if (!jQuery("#readme").is(':checked')) {
                popAlert('请接受服务条款!');
                closeWaiting();
                return false;
            }

            jQuery.ajax({
                type: "POST",
                url: '${base}/member/saveDetailsForApp',
                data: jQuery('#reg2').serialize(),
                dataType:"json",
                secureuri: true,
                success:function(data){
                    if ("success" == data.status) {
                        closeWaiting();
                        popAlert('提交成功，请耐心等待审核！');
                        setTimeout(function(){
                            jumpto( fullpath + "/app_index");
                        }, 1500);
                    }else{
                        closeWaiting();
                        popAlert(data.message);
                        return false;
                    }
                },
                error:function(data){
                    closeWaiting();
                    popAlert('网络异常，提交失败，请稍候再试');
                }
            });
        });
<#--
        jQuery('#submits').on('tap', function(){
            showWaiting();
            if(!checkFormItem('file1')){return false;}
            if(!checkFormItem('file2')){return false;}
            if(!checkFormItem('file3')){return false;}
            if(!checkFormItem('file4')){return false;}
            if(!checkFormItem('authcode')){return false;}

            if (!jQuery("#readme").is(':checked')) {
                outSet('请接受服务条款!');
                closeWaiting();
                return false;
            }

            jQuery.ajaxFileUpload({
                type: "post",
                url: "${base}/member/saveDetails?"+jQuery('#reg2').serialize(),
                //data: jQuery('#reg2').serialize(),
                secureuri: true,//是否启用安全提交,默认为false
                fileElementId: jQuery('input[name=file]'),//文件选择框的对象,多个时用[]包含
                datatype: 'json',
                async: true,
                success:function(data){
                    /*data = data.replace(/<pre.*?>/g, '');
                    data = data.replace(/<PRE.*?>/g, '');
                    data = data.replace("<PRE>", '');
                    data = data.replace("</PRE>", '');
                    data = data.replace("<pre>", '');
                    data = data.replace("</pre>", '');*/
                    data = jQuery.parseJSON(jQuery(data).find('pre').prop('innerText'));
                    if(data.status=='success'){
                        outSet('');
                        jumpto( fullpath + "/app_index");
                    }else{
                        outSet(data.message);
                    }
                    closeWaiting();
                },
                error:function(data){
                    outSet('处理失败，请稍后再试!');
                    closeWaiting();
                }
            });
        });

        onLoadImage = function (index){
            if(!checkFormItem(index)){
                return false;
            }else{
                return true;
            }
        };
    -->
        //判断采购商注册协议是否同意
        agreeonProtocol = function (){
            if (jQuery("#readme").prop("checked") == true) {
                outSet('');
            }else{
                outSet('请接受服务条款!');
            }
        };

        //关闭选择供应商框
        selectMerchantsError = function (){
            jQuery(".mui-popover").hide();
            jQuery(".mui-active").hide();
            jQuery(".mui-popover").removeClass('mui-active');
            /* mui('.mui-popover').hide();*/
        };
    }(mui, document));
function backTo(){
    var layer_confrim = layer.open({
        title:'提示：',
        content:'您还未上传公司资质信息！</br>确定要返回吗?',
        btn: ['确认', '取消'],
        shadeClose: false,
        yes: function(){
            layer.close(layer_confrim);
            jumpto(fullpath + '/app_index');
        },
        no: function(){
            closeWaiting();
        }
    });
}

</script>
</body>

</html>