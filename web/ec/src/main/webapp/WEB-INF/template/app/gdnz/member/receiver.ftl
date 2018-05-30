<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/gdnz/head.ftl">
    <style>
        .mui-btn {
            font-size: 16px;
            padding: 8px;
            margin: 3px;
        }
        h5.mui-content-padded {
            margin-left: 3px;
            margin-top: 20px !important;
        }
        h5.mui-content-padded:first-child {
            margin-top: 12px !important;
        }
        .ui-alert {
            text-align: center;
            padding: 5px 10px;
            font-size: 15px; color: #555;
        }
        .area {
            margin: 20px auto 0px auto;
        }
        .mui-input-group:first-child {
            margin-top: 20px;
        }
        .mui-input-group label {
            width: 35%;
        }
        .mui-input-row label~input,
        .mui-input-row label~select{
            width: 65%;
        }
        .mui-input-row label~textarea {
            font-family: "微软雅黑";
            line-height: 2.2;
            float: right;
            width: 60%;
            padding: 0px 0px 10px 0px;
            font-size: 14px;
        }
        .mui-checkbox input[type=checkbox],
        .mui-radio input[type=radio] {
            top: 6px;
        }
        .mui-content-padded {
            margin-top: 25px;
        }
        .mui-btn {
            padding: 8px 0px;
            margin: 10px; margin-left: 0px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
        }
        .mui-input-row label~input, .mui-input-row label~select, .mui-input-row label~textarea{
            margin-top: 1px;
        }

        .zyf_line:after{background-color: transparent!important;}



        }
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">

    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left"  onclick="javascript:window.history.back(-1);">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title mui-center">收货地址</h1>
</header>
<div class="mui-content">
    <form class="mui-input-group" id="receiverFrom" name="receiverFrom">
        <input type="hidden" name="areaPath" id="areaPath" value="${receiver.areaPath!''}"/>
        <input type="hidden" name="areaId" id="areaId" value="${receiver.areaId!''}"/>
        <input type="hidden" id="id" name="id" value="${receiver.id!''}">
        <div class="mui-input-row">
            <label>收货人:<span style="color:red">*</span></label>
            <input id='name' name="name" type="text" value="${receiver.name!''}" class="mui-input-clear mui-input" placeholder="请输入收货人姓名">
        </div>
        <div class="mui-input-row">
            <label>手机:<span style="color:red">*</span></label>
            <input id='mobile' name="mobile" type="tel" value="${receiver.mobile!''}" class="mui-input-clear mui-input" placeholder="请输入收货人手机号码">
        </div>
        <div class="mui-input-row">
            <label>固定电话:</label>
            <input id="phone" name="phone" type="text" value="${receiver.phone!''}" class="mui-input-clear mui-input" placeholder="请输入收货人固定电话">
        </div>
        <div class="mui-input-row">
            <label>邮箱:</label>
            <input id='email' name="email" type="email" value="${receiver.email!''}" class="mui-input-clear mui-input" placeholder="请输入收货人邮箱">
        </div>
        <div class="mui-input-row">
            <label>邮编:</label>
            <input id='zipCode' name="zipCode" type="number" value="${receiver.zipCode!''}" class="mui-input-clear mui-input" placeholder="请输入收货人邮编">
        </div>
        <button id='showCityPicker' class="mui-btn mui-btn-block" type='button'  style="font-size: 14px; border: 1px solid #e6e6e6; background: #e2e2e2 ; width: 90%;margin-left: 22px;"><#if fullName?exists>${fullName}<#else>选择城市 ...</#if></button>
        <div class="mui-input-row zyf_line">
            <label>详细地址:<span style="color:red">*</span></label>
            <textarea id='address' name="address" type="text" value="${receiver.address!''}" class="mui-input-clear mui-input" style="border:solid 1px #808080; border-radius:10px; resize:none; margin-right: 15px; margin-bottom: 5px"
                      placeholder="请输入收货人详细地址">${receiver.address!''}</textarea>
        </div>
        <div class="mui-input-row  zyf_line" id="info" style="text-align: center; line-height: 20px;color: red; font-size: 14px;  padding: 8px 0;"></div>
    </form>
    <div class="mui-content-padded">
        <button id='saveRceiver' name="saveRceiver" class="mui-btn mui-btn-block mui-btn-primary" >保存</button>
    </div>
</div>
<script>
    (function(mui, doc) {
        mui.back = function(){
            var url=fullpath + '/member/receiver?whichclient=whichapp&to=${to}&o=${o}&paymentId=${paymentId}&deliveryId=${deliveryId}&promotionsId=${promotionsId}&goodsId=${goodsId}&dealNum=${dealNum}';
            jumpto(url);
        };
        mui.init();
        var cityDatas =  localStorage.getItem("cityDatas");
        var isLoadingCityDatas = false;
        loadCityDatas = function(){
            if(isLoadingCityDatas) return;
            if(typeof(cityDatas) == 'undefined' || cityDatas == null) {
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
                        localStorage.setItem("cityDatas",cityDatas);
                    }
                });
            }
        };
        mui.ready(function() {
            loadCityDatas();

           var cityPicker = new mui.PopPicker({
               layer: 3
           });
           var showCityPickerButton = doc.getElementById('showCityPicker');
           var areaId = doc.getElementById('areaId');
           var areaPath = doc.getElementById('areaPath');

           showCityPickerButton.addEventListener('tap', function (event) {
               if(typeof(cityDatas) == 'undefined' || cityDatas == null) {
                   loadCityDatas();
                   if(isLoadingCityDatas){
                       var interval = window.setInterval(function(){
                           if(isLoadingCityDatas){
                               console.log("Loading city datas ...");
                           }else{
                               window.clearInterval(interval);
                               console.log("Load city datas over");
                               cityPicker.setData(JSON.parse(cityDatas));
                           }
                       },100);

                   }else{
                       cityPicker.setData(JSON.parse(cityDatas));
                   }
               }else{
                   cityPicker.setData(JSON.parse(cityDatas));
               }
               cityPicker.show(function (items) {
                   var address = "";
                   var value = "";
                   if( items[0] != null && typeof(items[0].text) != 'undefined'  ){
                       address = address + items[0].text;
                       value = items[0].value;
                       if( items[1] != null && typeof(items[1].text) != 'undefined'  ){
                           address = address + " " + items[1].text;
                           value = items[1].value;
                           if( items[2] != null && typeof(items[2].text) != 'undefined'  ){
                               address = address + " " + items[2].text;
                               value = items[2].value;
                           }
                       }
                   }
                   showCityPickerButton.innerHTML = address;
                   var pathArray = value.split(",");
                   areaId.value = pathArray[pathArray.length - 1];
                   areaPath.value = value;
               });
           }, false);
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }

        jQuery("#saveRceiver").bind("click",function(){
            var name=jQuery("#name").val();
            var info=jQuery("#info");
            if (name.length <= 1 || name.length >= 20) {
                info.html('收货人长度只能在2-20位字符之间');
                return;
            }
            var phone=jQuery("#phone").val();
            var mobile=jQuery("#mobile").val();
            var isMobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1})|(14[0-9]{1}))+\d{8})$/;
            var isPhone = /^\d{3,4}-\d{7,8}$/;

            if(jQuery.trim(phone)=='' && jQuery.trim(mobile)==''){
                info.html("收货人手机号和电话号请至少填一项！");
                return;
            }else{
                if( jQuery.trim(mobile) =='' || !isMobile.test(mobile) || mobile.length != 11){
                    info.html("收货人手机号不正确！");
                    return;
                }
                if(phone !='' && !isPhone.test(phone)){
                    info.html("收货人固定电话格式不正确<br/>请输入正确的格式如:888-8888888");
                    return;
                }
            }

            var patten = new RegExp(/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+(com|cn)$/);
            var email=jQuery("#email").val();
            if(jQuery.trim(email) != '' && ! patten.test(email)){
                info.html("收货人邮箱不正确！");
                return;
            }

            var IsZipCode=/^[0-9][0-9]{5}$/;
            var zipCode=jQuery("#zipCode").val();
            if( jQuery.trim(zipCode) !='' && ! IsZipCode.test(zipCode)){
                info.html("收货人邮编不正确！");
                return;
            }

            if(jQuery("#areaPath").val() == ''){
                info.html("请选择收货城市！");
                return;
            }

            if(jQuery.trim(jQuery("#address").val())==''){
                info.html("收货详细地址不能为空！");
                return;
            }


            var actionUrl="";
            if(""!=jQuery("#id").val()){
                actionUrl = "${base}/receiver/update";
            }else{
                actionUrl = "${base}/receiver/save";
            }
           showWaiting();
           jQuery.ajax( {
                type : "POST",
                dataType : "json",
                url : actionUrl,
                data :jQuery("#receiverFrom").serialize(),
                cache : false,
                success : function() {
                    popAlert('保存收货地址成功！');
                    window.location.href="${base}/member/receiver?whichclient=whichapp&to=${to}&o=${o}&paymentId=${paymentId}&deliveryId=${deliveryId}&promotionsId=${promotionsId}&goodsId=${goodsId}&dealNum=${dealNum}";
                    closeWaiting();
                },
                error : function() {
                    closeWaiting();
                    popAlert('保存收货地址失败！');
                }
            });
        });
    }(mui, document));
</script>
</body>

</html>