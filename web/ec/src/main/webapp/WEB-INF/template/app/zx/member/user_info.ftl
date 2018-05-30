
<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/zx/head.ftl">
    <link href="${path}/theme/red/mui.picker.css" rel="stylesheet" />
    <link href="${path}/theme/red/mui.dtpicker.css" rel="stylesheet" />
    <style>
        .area {
            margin: 20px auto 0px auto;
        }
        .mui-input-group:first-child {
            margin-top: 20px;
        }
       
        .mui-input-group label {
            width: 30%;
            float: left;
        }
        .mui-input-row label~input,
        .mui-input-row label~select,
        .mui-input-row label~textarea {
            width: 70%;
        }
        .mui-input-row label~input[type=radio] {
            width: 5%;
            float: left;
            margin: 10px 0px 10px 0px;
        }
        .mui-input-row label~input[type=radio]~label {
            width: 60%;
            float: right;
            margin: 5px 10px 10px 0px;
            padding: 0px;

         }
        .mui-checkbox input[type=checkbox] {
            width: 65%;
            float: left;
            margin: 0px 0px 5px 0px;
        }
        .mui-checkbox input[type=checkbox]~label {
            width: 60%;
            float: right;
            margin: 7px 16px 0px 0px;
            padding: 0px;
        }
        .mui-content-padded {
            margin-top: 25px;
        }
        .mui-btn {
            padding:8px 10px;
        }
        .mui-btn-picker{
            width: 60%;
            margin-top: 5px;
            margin-right: 5px;
        }
        .mui-content p {
            font-size: 16px;
            margin-top: 10px;
            color: #8f8f94;
        }

    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">
    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>返回
    </button>
    <div class="mui-title mui-pull-right ">
        账户信息
    </div>
    <button type="button" id="editBtn" onclick="jQuery('#editForm').toggle();jQuery('#showArea').toggle();" class="mui-btn  mui-btn-link mui-btn-nav mui-pull-right" style="margin-right:0px; padding-left: 6px;">
        编辑
    </button>
</header>
<div class="mui-content">
    <div style="background: #fff;margin-top: 20px;" class="mui-input-group" id="showArea">
        <div class="mui-input-row">
            <label>真实姓名:</label>
            <p>${member.nickName}</p>
        </div>
        <div class="mui-input-row">
            <label>生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日:</label>
            <p><#if member.birthday?if_exists>${member.birthday?string("yyyy年MM月dd日")}<#else>&nbsp;</#if></p>
        </div>
        <div class="mui-input-row">
            <label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
            <p><#if member.sex == 0>女<#elseif member.sex == 1>男<#else>保密</#if></p>
        </div>
        <div class="mui-input-row">
            <label>手机号码:</label>
            <p>${member.mobile}</p>
        </div>
        <div class="mui-input-row">
            <label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
            <p>${member.email}</p>
        </div>
    </div>

    <div style="background: #fff;display: none" id="editForm">

    <form class="mui-input-group" id="baseInfoFrm">
        <div class="mui-input-row">
            <label>真实姓名:</label>
            <input id='nickName' type="text" class="mui-input-clear mui-input" value="${member.nickName}">
        </div>
        <div class="mui-input-row">
            <label>生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日:</label>

            <button id='birthdaypicker' type="button"
                    data-options='{"type":"date","beginYear":1915,"endYear":2016,"value":"<#if member.birthday?if_exists>${member.birthday?string("yyyy-MM-dd")}<#else>1990-01-01</#if>"}'
                    class="btn mui-btn-picker "><#if member.birthday?if_exists>${member.birthday?string("yyyy年MM月dd日")}<#else>选择出生日期 ...</#if></button>
            <input type="hidden" id="birthday" name="birthday" value="${member.birthday?string("yyyy-MM-dd")}">
        </div>
        <div class="mui-input-row">
            <label>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
            <#if member.sex == 0>
                <div class="mui-checkbox f-cb" style="width: 60px;float: left;"><input id="sex_0" name="checkbox" value="0" checked="true" type="checkbox"><label style="width: 30%;">女</label></div>
                <div class="mui-checkbox f-cb" style="width: 60px;float: left;"><input id="sex_1" name="checkbox" value="1" type="checkbox"><label style="width: 30%;">男</label></div>
                <div class="mui-checkbox f-cb" style="width: 80px;float: left;"><input id="sex_2" name="checkbox" value="2" type="checkbox"><label style="width: 40%;">保密</label></div>
            <#elseif member.sex == 1>
                <div class="mui-checkbox f-cb" style="width: 60px;float: left;"><input id="sex_0" name="checkbox" value="0" type="checkbox"><label style="width: 30%;">女</label></div>
                <div class="mui-checkbox f-cb" style="width: 60px;float: left;"><input id="sex_1" name="checkbox" value="1" checked="true" type="checkbox"><label style="width: 30%;">男</label></div>
                <div class="mui-checkbox f-cb" style="width: 80px;float: left;"><input id="sex_2" name="checkbox" value="2" type="checkbox"><label style="width: 40%;">保密</label></div>
            <#elseif member.sex == 2>
                <div class="mui-checkbox f-cb" style="width: 60px;float: left;"><input id="sex_0" name="checkbox" value="0" type="checkbox"><label style="width: 30%;">女</label></div>
                <div class="mui-checkbox f-cb" style="width: 60px;float: left;"><input id="sex_1" name="checkbox" value="1" type="checkbox"><label style="width: 30%;">男</label></div>
                <div class="mui-checkbox f-cb" style="width: 80px;float: left;"><input id="sex_2" name="checkbox" value="2" checked="true" type="checkbox"><label style="width: 40%;">保密</label></div>
            <#else>
                <div class="mui-checkbox f-cb" style="width: 60px;float: left;"><input id="sex_0" name="checkbox" value="0" type="checkbox"><label style="width: 30%;">女</label></div>
                <div class="mui-checkbox f-cb" style="width: 60px;float: left;"><input id="sex_1" name="checkbox" value="1" type="checkbox"><label style="width: 30%;">男</label></div>
                <div class="mui-checkbox f-cb" style="width: 80px;float: left;"><input id="sex_2" name="checkbox" value="2" type="checkbox"><label style="width: 40%;">保密</label></div>
            </#if>
        </div>
        <div class="mui-input-row">
            <label>手机号码:</label>
            <input id='mobile' type="mobile" class="mui-input" style="padding: 10px 15px 10px 0px; width: 55%; background-color: #eee;margin-right: 10%;"
                   value="${member.mobile}" readonly="readonly">
        </div>


        <div class="mui-input-row">
            <label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
            <input id='email' type="email" class="mui-input-clear mui-input" value="${member.email}">
        </div>

    </form>

    <div style="margin-top: 10px;">
        <button id='reg' class="mui-btn mui-btn-block mui-btn-primary" style="width: 45%; float: left;margin: 0px 0px 0px 10px;" onclick="updateUserInfo();">提交</button>
        <button id='cancel' class="mui-btn mui-btn-block mui-btn-primary" style="width: 45%; float: right; margin: 0px 10px 0px 0px;" onclick="jQuery('#editForm').toggle();jQuery('#showArea').toggle();">取消</button>
    </div>
    </div>
    <div id="outLine" style="display: none; width: 100%; height: 25px; line-height: 25px; text-align:center;color:#F00; margin-top: 50px; font-size: 12px"></div>
</div>
<script src="${path}/js/mui.picker.js"></script>
<script src="${path}/js/mui.dtpicker.js"></script>
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


        jQuery("input[type=checkbox]").on('change', function(event){
            var _this = event.target;
            if(_this.checked == true){
                jQuery.each(jQuery("input[type=checkbox]"), function(index, chkbox){
                    if( _this.id != chkbox.id){
                        chkbox.checked = false;
                    }
                });
            }

        });
        jQuery("#birthdaypicker").bind("tap",function(){
            var optionsJson = this.getAttribute('data-options') || '{}';
            var options = JSON.parse(optionsJson);
            var id = this.getAttribute('id');
            /*
             * 首次显示时实例化组件
             * 示例为了简洁，将 options 放在了按钮的 dom 上
             * 也可以直接通过代码声明 optinos 用于实例化 DtPicker
             */
            var picker = new mui.DtPicker(options);
            picker.show(function(rs) {
                /*
                 * rs.value 拼合后的 value
                 * rs.text 拼合后的 text
                 * rs.y 年，可以通过 rs.y.vaue 和 rs.y.text 获取值和文本
                 * rs.m 月，用法同年
                 * rs.d 日，用法同年
                 * rs.h 时，用法同年
                 * rs.i 分（minutes 的第二个字母），用法同年
                 */
                if(rs.text > new Date()){
                    /*
                     * 返回 false 可以阻止选择框的关闭
                     * return false;
                     */
                    alert('不能大于当前日期');
                    return false;
                }
                jQuery('#birthday').val(rs.text);
                doc.getElementById('birthdaypicker').innerHTML = rs.y.text + '年' + rs.m.text + '月' + rs.d.text + '日';

            });
        });

        updateUserInfo = function(){
            var email=jQuery('#email').val()
            var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(email!=''){
                if(!myreg.test(email)){
                    popAlert("请填写正确的邮箱");
                    <#--outSet("请填写正确的邮箱!");-->
                    return false;
                }
            }
            showWaiting();
            jQuery.ajax({
                type: 'post',
                url: '${base}/member/updateMember.html',
                data: {
                    nickName: jQuery('#nickName').val(),
                    sex: $('#baseInfoFrm [type=checkbox]:checked').val(),
                    birthday: jQuery('#birthday').val(),
                    //mobile: $('#mobile').val(),
                    email: jQuery('#email').val()
                },
                success: function (data) {
                    closeWaiting();
                    if(data.status == 'success') {
                        outSet("更新成功^_^");
                        setTimeout(function(){
                            jumpto(fullpath + '/member/info?whichclient=whichapp');
                        }, 1000);
                    }
                },
                error:function(){
                    closeWaiting();
                }
            });

        };
    }(mui, document));
</script>
</body>

</html>