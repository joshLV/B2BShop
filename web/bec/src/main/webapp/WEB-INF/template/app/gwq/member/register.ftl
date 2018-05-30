
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/gwq/head.ftl">
    <style>
        .area {
            margin: 20px auto 0px auto;
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

        .mui-input-row .mui-btn-picker {
            font-family: 'Helvetica Neue', Helvetica, sans-serif;
            line-height: 1.1;
            width: 60%;
            padding: 10px 15px;
            background-color: #E0E0E0;
            margin: 5px auto 5px 0px;
    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left" >
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title">采购商注册 &gt; 提交基本信息</h1>

</header>
<div class="mui-content">
    <div style="background: #fff;">
    <form class="mui-input-group" name="reg1" id="reg1">
        <input type="hidden" id="areaId" name="areaId" value=""/>
        <input type="hidden" id="areaPath" name="areaPath" value=""/>
        <input type="hidden" id="buyerType" name="buyerType" value="2"/>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>公司名称:</label>
            <input id='companyName' name='companyName' type="text" datatype="*6-20"
                   class="mui-input-clear mui-input" placeholder="请填写公司名称(6-20个字符)">
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>法人姓名:</label>
            <input id='realName' name="realName" type="text" datatype="zh2-4" class="mui-input-clear mui-input" placeholder="请填写法人姓名(2-4个汉字)">
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>公司电话:</label>
            <input id='mobile' name="mobile" type="text" datatype="tel" class="mui-input-clear mui-input" placeholder="请填写固定电话[区号-号码]">
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>公司邮箱:</label>
            <input id='email' name="email" type="email" datatype="e" class="mui-input-clear mui-input" placeholder="请填写公司邮箱">
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>联系人:</label>
            <input id='linkMan' name="linkMan" type="text" datatype="zh2-4" class="mui-input-clear mui-input" placeholder="请填写联系人姓名(2-4个汉字)">
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>联系人<br>手机号码:</label>
            <input id='userName' name="userName" type="tel" datatype="m" class="mui-input-clear mui-input" placeholder="将会被用作登录名">
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>所在地区:</label>
            <button id='showCityPicker' class="mui-btn-picker mui-btn-block" type='button' style="">请选择城市 ...</button>
            <input type="hidden" id='szdq' name="szdq" placeholder="请选择所在城市">
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>联系地址:</label>
            <textarea id='address' name="address" type="text" datatype="*" class="mui-input-clear mui-input" rows="4" placeholder="请填写联系地址"></textarea>
        </div>

        <div class="mui-input-row">
            <label><span style="color:red">*</span>密码:</label>
            <input id='passwd' name="passwd" type="password" datatype="pwd" class="mui-input-clear mui-input" placeholder="请填写密码(6-20个字符)">
        </div>
        <div class="mui-input-row">
            <label><span style="color:red">*</span>确认密码:</label>
            <input id='repasswd' name="repasswd" type="password" datatype="pwd" recheck="passwd" class="mui-input-clear mui-input" placeholder="再填写一次密码">
        </div>
        <div class="mui-input-row">
            <label>&nbsp;&nbsp;邮箱:</label>
            <input id='linkManEmail' name="linkManEmail" type="email" ignore="ignore" datatype="e" class="mui-input-clear mui-input" placeholder="请填写联系人邮箱">
        </div>
        <div class="mui-input-row">
            <label>&nbsp;&nbsp;邀请码:</label>
            <input id='invitationCode' name="invitationCode" type="text" class="mui-input-clear mui-input" placeholder="请填写邀请码">
        </div>
    </form>
    </div>
    <div id="outLine" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; font-size: 12px"></div>

    <div class="mui-content-padded" style="margin-top: -20px">
        <button id='submits' type="button" class="mui-btn mui-btn-block mui-btn-primary">提交注册</button>
    </div>
</div>
<script src="${path}/js/validform_sample.js"></script>
<script>
    (function(mui, doc) {
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
        mui.init();
        mui.ready(function () {
            loadCityDatas();
            //选取城市
            var cityPicker = new mui.PopPicker({
                layer: 3
            });
            var showCityPickerButton = doc.getElementById('showCityPicker');
            var shipAreaPath = doc.getElementById('szdq');
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
                    shipAreaPath.value = value;
                    jQuery("#areaPath").val(value);
                    var areaId = value.substring(value.lastIndexOf(',') + 1, value.length);
                    jQuery("#areaId").val(areaId);
                });
            }, false);
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                mui.currentWebview.show();
            });
        }

        jQuery('#submits').on('tap', function(){
            showWaiting();
            if(!checkFormItem('companyName')){return};
            if(!checkFormItem('realName')){return};
            if(!checkFormItem('mobile')){return};
            if(!checkFormItem('email')){return};
            if(!checkFormItem('linkMan')){return};
            if(isEmpty(jQuery('#szdq').val())){
                outSet(jQuery('#szdq').attr('placeholder'));
                return;
            }else{
                outSet("");
            }
            if(!checkFormItem('address')){return;}
            if(!checkFormItem('userName', function(){
                var userName = jQuery('#userName').val();
                //TODO check号码是否已经被注册
                return true;
            })){return;}

            if(!checkFormItem('passwd')){return;}
            if(!checkFormItem('repasswd')){return;}
            if(!isEmpty(jQuery('#linkManEmail').val())){
                if(!checkFormItem('linkManEmail')){return;}
            }
            if(!checkInvCode()){return;}

            //验证手机号是否唯一
            var checkMobile = $("#userName").val();
            if(!isEmpty(checkMobile)){
                $.ajax({
                    type: "post",
                    async: false,
                    url: base+"member/checkMobile",
                    data:{'mobile':checkMobile},
                    datatype: 'json',
                    error: function () {
                    },
                    success: function(result) {
                        if("success"==result.status){
                            //验证邀请码是否存在
                            var invitationCode = $("#invitationCode").val();
                            if(!isEmpty(invitationCode)){
                                $.ajax({
                                    type: "post",
                                    async: false,
                                    url: base+"member/checkInvitCode",
                                    data:{'invitationCode':invitationCode},
                                    datatype: 'json',
                                    error: function () {
                                    },
                                    success: function(result) {
                                        if("success"==result.status){
                                            outSet("");
                                            jQuery.ajax({
                                                type:'post',
                                                url: "${base}/member/save?r="+Math.random(),
                                                data: jQuery('#reg1').serialize(),
                                                datatype:'json',
                                                error:function(){
                                                    outSet('处理失败，请稍后再试!');
                                                    closeWaiting();
                                                },
                                                success:function(data){
                                                    if(data.status=='success'){
                                                        outSet('');
                                                        //采购商基本信息注册成功后跳转到后台并把采购商ID带入
                                                        jumpto( fullpath + "/member/registerForward?whichclient=whichapp&buyerId="+data.buyerId);
                                                    }else{
                                                        outSet(data.message);
                                                    }
                                                    closeWaiting();
                                                }
                                            });
                                        }else{
                                            closeWaiting();
                                            outSet('邀请码不存在!');
                                            return false;
                                        }
                                    }
                                });
                            }
                        }else{
                            closeWaiting();
                            outSet('手机号已注册!');
                            return false;
                        }
                    }
                });
            }
        });

        checkInvCode = function(){

            var invitationCode = jQuery('#invitationCode').val();
            if(!isEmpty(invitationCode)){
                //TODO check邀请码是否有效
            }
            return true;
        };
    }(mui, document));


</script>
</body>

</html>