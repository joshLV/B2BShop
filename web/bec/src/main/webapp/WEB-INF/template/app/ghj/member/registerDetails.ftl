<!DOCTYPE html>
<html>
<head>
<#include "app/ghj/head.ftl">
    <link href="${path}/theme/red/reset.css" rel="stylesheet" />
    <link href="${path}/theme/red/register.css" rel="stylesheet" />
</head>
<style>
    header {
        position: fixed;
        top: 0px;
        right: 0;
        left: 0;
        background:#e12f45;
        padding:8px 0;
        font-size:18px;
        height:30px;
        line-height:30px;
        /*box-shadow: 0px 3px 6px #999;*/
        z-index:10;text-align:center;
    }
    .logo{ position:absolute;left:10px;float:left;}
    .logo a{ color:#fff;}
    .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
    .user { position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
    .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/ghj/images/user.png) no-repeat; background-size: 20px
    20px;}

    .mtit{color:#fff;}

    .mui-popover .mui-scroll .mui-table-view {
        max-height: 500px;

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

    /*top*/
    header{
       position: fixed;
        top: 0px;
        right: 0;
        left: 0;
        padding:8px 0;
        font-size:18px;
        height:30px;
        line-height:30px;
        z-index:10;text-align:center;
        background: #fff;border-bottom: 1px solid #ddd;box-shadow: 0 0 6px #ccc;}
    .logo{ position:absolute;left:10px;float:left;}
    .logo a{ color:#666;}
    .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
    .user{ position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
    .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/ghj/images/user.png) no-repeat; background-size: 20px
    20px;}

    .mtit{color:#444;}

    /*新加样式  12-31*/
    .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghj/images/arr.png) no-repeat; background-size:13px
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
<body>
<header>
        <div class="logo"><a href="javascript:backTo()" class="ltext">返回</a></div>
    <div class="mtit">采购商注册>公司资质信息</div>
</header>


<div class="content">

        <form class="mui-input-group" name="reg2" id="reg2">
        <ul>
            <li class="con-li2">
                <span><em>*</em>营业执照：</span>
                <input id='file1' name='file' type="file" datatype="img" width="4096" height="4096"  capture="camera" accept="image/*" placeholder="请选择营业执照文件扫描件文件！"  class="reg-step2-inputs">
                <span style="float: right; width:120px;display: none" id="uploadfile1PreviewSpan">
                    <img id="uploadfile1Preview" width="20" height="20" data-preview-group="1"/>点击预览</span>
            </li>
            <li class="con-li2">
                <span><em>*</em>开户银行：</span>
                <input id='openingBank' name="openingBank" type="text"  class="reg-inputs mui-input-clear" placeholder="请填写开户行(银行及支行名称)"  >
            </li>
            <li class="con-li2">
                <span><em>*</em>银行账户：</span>
                <input id='bankNumber' name="bankNumber" type="text" onkeyup="formatBankNo(this)" onkeydown="formatBankNo(this)"  class="reg-inputs mui-input-clear" placeholder="请输入15-20位数字"  >
            </li>
            <#--<li class="con-li2">
                <span><em>*</em>开户许可证：</span>
                <input id='file2' name="file" type="file" datatype="img" width="4096" height="4096" capture="camera" accept="image/*" placeholder="请选择开户许可证文件扫描件文件！"   class="reg-step2-inputs">
                <span style="float: right; width:120px;display: none" id="uploadfile2PreviewSpan">
                    <img id="uploadfile2Preview" width="20" height="20" data-preview-group="1" src='${path}/images/ss.png'/>点击预览</span>
            </li>
            <li class="con-li2"><span><em>*</em>税务登记证：</span>
                <input id='file3' name="file" type="file" datatype="img" width="4096" height="4096" capture="camera" accept="image/*" placeholder="请选择税务登记证文件扫描件文件！"  class="reg-step2-inputs">
                <span style="float: right; width:120px;display: none" id="uploadfile3PreviewSpan">
                    <img id="uploadfile3Preview" width="20" height="20" data-preview-group="1" src='${path}/images/ss.png'/>点击预览</span>
            </li>
            <li class="con-li2"><span><em>*</em>组织机构代码证：</span>
                <input id='file4' name="file" type="file" datatype="img" width="4096" height="4096" capture="camera" accept="image/*" placeholder="请选择组织机构代码证文件扫描件文件！" class="reg-step2-inputs">
                <span style="float: right; width:120px;display: none" id="uploadfile4PreviewSpan">
                    <img id="uploadfile4Preview" width="20" height="20" data-preview-group="1" src='${path}/images/ss.png'/>点击预览</span>
            </li>-->
            <li class="con-li2"><span><em>*</em>验证码：</span>

                <div style="float: left; width: 75%;">
                    <input type="hidden" id="buyerId" name="buyerId" value="${buyerId}"/>
                    <input type="hidden" id="uploadfile1" name="uploadfile1" />
                    <input type="hidden" id="uploadfile2" name="uploadfile2" />
                    <input type="hidden" id="uploadfile3" name="uploadfile3" />
                    <input type="hidden" id="uploadfile4" name="uploadfile4" />
                    <input type="text" name="authcode" id="authcode" datatype="*" class="captchainput" class="captchainput" placeholder="请输入验证码">
                    <div class="captcha-bot">
                        <img id="captchaImage" class="captcha" alt="验证码" src="/bec/captcha.jpg?yys=+new Date().getTime()" onclick="this.src='/bec/captcha.jpg?yys='+new Date().getTime()">
                        <#--<div class="changeyzm"><a href="javascirpt:$('#captchaImage').src='/bec/captcha.jpg?yys='+new Date().getTime()">看不清？换一张</a></div>-->
                    </div>
                </div>
            </li>
            <li class="con-li2">
                <div id="light" >
                    <div class="con-tit"><h3>采购商注册协议</h3>
                        <div class="mui-checkbox f-cb" >
                            <input id="readme" name="checkbox" value="0" checked="true" type="checkbox" onclick="javascript:agreeonProtocol();" style="width:10%; margin-top: 12px"/>
                            <a href="#protocol-con"  class="blue" id="protocol" style="float: right; width: 65%;padding: 20px 0px 0px 5px;z-index:99999">《采购商注册协议》</a>
                        </div>
                    </div>
                </div>
                <div id="fade" class="black-overlay"></div>
            </li>
        </ul>
        </form>


</div>
<div id="outLine" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#FFF; font-size: 12px"></div>
<div class="reg-btn">
    <button id="submits" type="button" class="submits-btn">提交注册</button>
</div>

<#--
<div class="fl" id = "pic" style="display: none">
    <img id="image1" width="80" height="60"  onLoad="onLoadImage('file1')"/>
    <img id="image2" width="80" height="60"  onLoad="onLoadImage('file2')"/>
    <img id="image3" width="80" height="60"  onLoad="onLoadImage('file3')"/>
    <img id="image4" width="80" height="60"  onLoad="onLoadImage('file4')"/>
</div>
-->
<#include "app/ghj/protocol.ftl"/>
<script src="${path}/js/validform_sample.js"></script>
<#--
<script src="${base}/static/js/jquery.ajaxfileupload-20140125.js" type="text/javascript"></script>
<script src="${base}/static/js/uploadPreview.js" type="text/javascript"></script>
-->
<script src="${path}/js/lrimg3/lrz.mobile.min.js"></script>
<script src="${path}/js/mui.min.js"></script>
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

                                var imgUrl = data.data.imgSrvAddr + '/'+ data.data.projectName + '/' + data.data.path;
                                if( imgUrl.indexOf("http://") != 0 ){
                                    imgUrl = 'http://' + imgUrl;
                                }
                                jQuery('#upload'+inputImage.id+'Preview').prop('src', imgUrl);
                                jQuery('#upload'+inputImage.id+'Preview').attr('data-preview-src', imgUrl);
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
//            var uploadfile2 = jQuery('#uploadfile2').val();
//            if(typeof(uploadfile2) == 'undefined' || uploadfile2 == ""){
//                closeWaiting();
//                popAlert('开户许可证不能为空');
//                return;
//            }
//            var uploadfile3 = jQuery('#uploadfile3').val();
//            if(typeof(uploadfile3) == 'undefined' || uploadfile3 == ""){
//                closeWaiting();
//                popAlert('税务登记证不能为空');
//                return;
//            }
//            var uploadfile4 = jQuery('#uploadfile4').val();
//            if(typeof(uploadfile4) == 'undefined' || uploadfile4 == ""){
//                closeWaiting();
//                popAlert('组织机构代码证不能为空');
//                return;
//            }

            var openingBank = jQuery('#openingBank').val();
            if(openingBank=='' || openingBank.length>30){
                closeWaiting();
                popAlert('银行名称不能为空');
                return;
            }
            var bankNumber = jQuery('#bankNumber').val();
            if(bankNumber=='' ){
                closeWaiting();
                popAlert('银行账户不能为空（15-20位数字）');
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
            jQuery("#bankNumber").val(bankNumber.replace(" ","").replace(" ","").replace(" ",""));
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
                        }, 3000);
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
                        jumpto( fullpath + "/zcgoods/list");
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
            jumpto(fullpath + '/zcgoods/list');
        },
        no: function(){
            closeWaiting();
        }
    });
}
    /**
     * 格式化银行卡/信用卡号
     * @param {Object} BankNo
     */
    function formatBankNo (BankNo){
        if (BankNo.value == "") {
            BankNo.style.fontWeight="inherit";
            BankNo.style.color="inherit";
            return
        };

        BankNo.style.fontWeight="bold";
        BankNo.style.color="#0171bc"

        var account = new String (BankNo.value);
        account = account.substring(0,22); /*帐号的总数, 包括空格在内 */
        if (account.match (".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null){
            /* 对照格式 */
            if (account.match (".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" +
                            ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null){
                var accountNumeric = accountChar = "", i;
                for (i=0;i<account.length;i++){
                    accountChar = account.substr (i,1);
                    if (!isNaN (accountChar) && (accountChar != " ")) accountNumeric = accountNumeric + accountChar;
                }
                account = "";
                for (i=0;i<accountNumeric.length;i++){    	/* 可将以下空格改为-,效果也不错 */
                    if (i == 4) account = account + " "; 	/* 帐号第四位数后加空格 */
                    if (i == 8) account = account + " "; 	/* 帐号第八位数后加空格 */
                    if (i == 12) account = account + " ";	/* 帐号第十二位后数后加空格 */
                    account = account + accountNumeric.substr (i,1)
                }
            }
        }else{
            account = " " + account.substring (1,5) + " " + account.substring (6,10) + " " + account.substring (14,18) + "-" + account.substring(18,25);
        }
        if (account != BankNo.value) BankNo.value = account;
    }
</script>
</body>
</html>