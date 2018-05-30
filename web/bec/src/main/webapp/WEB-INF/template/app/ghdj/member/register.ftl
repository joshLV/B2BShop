<!DOCTYPE html>
<html>
<head>
<#include "app/ghdj/head.ftl">
   <#-- <link href="${path}/theme/red/reset.css" rel="stylesheet" />-->
    <link href="${path}/theme/red/register.css" rel="stylesheet" />
</head>
<style>
    .mui-input-group label {
        width: 32%;
        padding: 10px 0px;
    }
    .mui-input-row label~input,
    .mui-input-row label~select,
    .mui-input-row label~textarea {
        width: 68%;
    }
    .reg-inputs{width: 68% !important; height:44px !important; line-height:normal !important; font-size:16px; border:none;  font-family: '\5fae\8f6f\96c5\9ed1'; color: #252525; float:left;}
    .mui-input-row .mui-input-clear~.mui-icon-clear, .mui-input-row .mui-input-speech~.mui-icon-speech{line-height: 20px;}
    .con-li em{padding-right: 2px;}
    .choose-city{padding-left:5%;padding-right:5%;}
    .submits-btn{line-height: 35px;}
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
       /* box-shadow: 0px 3px 6px #999;*/
        z-index:10;text-align:center;
    }
    .logo{ position:absolute;left:10px;float:left;}
    .logo a{ color:#fff;}
    .logo a.ltext{font-family:'宋体'; font-size:28px; font-weight:bold;}
    .user { position:absolute; right:10px;float:right; margin-top:5px; top:8px;}
    .user a{ float:right;text-indent:-9999px;width:20px; height:20px;  background:url(${base}/static/app/ghdj/images/user.png) no-repeat; background-size: 20px
    20px;}

    .mtit{color:#fff;}
    /*新加样式  12-31*/
    .logo a.ltext{float:left;text-indent:-9999px;width:13px; height:21px; background:url(${base}/static/app/ghdj/images/arr.png) no-repeat; background-size:13px
    21px;margin-top:5px;}


</style>
<body>

<header>
    <div class="logo"><a href="javascript:jumpto(fullpath + '/zcgoods/list');" class="ltext">返回</a></div>
    <div class="mtit">采购商注册>基本信息</div>
</header>


<div class="content">
    <form class="mui-input-group" name="reg1" id="reg1">
        <input type="hidden" id="areaId" name="areaId" value=""/>
        <input type="hidden" id="areaPath" name="areaPath" value=""/>
        <input type="hidden" id="buyerType" name="buyerType" value="2"/>
        <ul>
            <li class="con-li"><div class="mui-input-row"><label><em>*</em>公司名称：</label><input id='companyName' name='companyName' type="text" datatype="*6-20" placeholder="请填写公司名称(6-20个字符)" class="reg-inputs mui-input-clear"></div></li>
 <#--
            <li class="con-li"><div class="mui-input-row"><label><em>*</em>法人姓名：</label><input id='realName' name="realName" type="text" datatype="zh2-4" placeholder="请填写法人姓名(2-4个汉字)" class="reg-inputs mui-input-clear"></div></li>
            <li class="con-li"><div class="mui-input-row"><label><em>*</em>公司电话：</label><input id='mobile' name="mobile" type="text" datatype="tel" placeholder="请填写公司固定电话[029-12341234]" class="reg-inputs mui-input-clear"></div></li>
            <li class="con-li"><div class="mui-input-row"><label><em>*</em>公司邮箱：</label><input id='email' name="email" type="email" datatype="e" placeholder="请填写公司邮箱" class="reg-inputs mui-input-clear"></div></li>
-->            <li class="con-li"><div class="mui-input-row"><label><em>*</em>联&nbsp;系&nbsp;&nbsp;人：</label><input id='linkMan' name="linkMan" type="text" datatype="zh2-4" placeholder="请填写联系人姓名(2-4个汉字)" class="reg-inputs mui-input-clear"></div></li>
            <li class="con-li"><div class="mui-input-row"><label><em>*</em>所在地区：</label><a href="#" id='showCityPicker' class="choose-city">请选择城市</a> <input type="hidden" id='szdq' name="szdq" placeholder="请选择所在城市"></div></li>
            <li class="con-li"><div class="mui-input-row"><label><em>*</em>联系地址：</label><input id="address" name="address" type="text" datatype="*" class="reg-inputs mui-input-clear"  placeholder="请填写联系地址"/></div></li>
            <li class="con-li"><div class="mui-input-row"><label><em>*</em>联系人手机：</label><input id='userName' name="userName" type="tel" datatype="m" placeholder="请填写联系人手机" class="reg-inputs mui-input-clear"></div></li>
            <li class="con-li"><div class="mui-input-row"><label><em>*</em>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label><input id='passwd' name="passwd" type="password" datatype="pwd" placeholder="请填写密码(6-20个字符)" class="reg-inputs mui-input-clear"></div></li>
            <li class="con-li"><div class="mui-input-row"><label><em>*</em>确认密码：</label><input id='repasswd' name="repasswd" type="password" datatype="pwd" recheck="passwd" placeholder="再填写一次密码" class="reg-inputs mui-input-clear"></div></li>
            <li class="con-li"><div class="mui-input-row"><label>联系人邮箱：</label><input id='linkManEmail' name="linkManEmail" type="email" ignore="ignore" datatype="e"  placeholder="请填写联系人邮箱" class="reg-inputs mui-input-clear"></div></li>
<#--
            <li class="con-li"><div class="mui-input-row"><label>邀&nbsp;请&nbsp;&nbsp;码：</label><input id='invitationCode' name="invitationCode" type="text" placeholder="请填写邀请码" class="reg-inputs mui-input-clear"></div></li>
-->
        </ul>
    </form>
</div>
<div id="outLine" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#FFF; font-size: 12px"></div>
<div class="reg-btn">
    <button id="submits" type="button" class="submits-btn">提交注册</button>
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
            //if(!checkFormItem('realName')){return};
            //if(!checkFormItem('mobile')){return};
            //if(!checkFormItem('email')){return};
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
            //if(!checkInvCode()){return;}
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