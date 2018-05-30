<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
<div id="container">
    <#include "bec/ghj/top2.ftl"/>
    <div class="reg-box">
    <div class="wrap forgot_ps_box">
        <div class="lg_title">重置密码</div>
        <div class="flow-steps" style="position: absolute;">
            <ol class="num5">
                <li id="one" class="current"><span>1.输入手机号</span></li>
                <li id="two" class=""><span>2.确认身份</span></li>
                <li id="three" class="last"><span>3.完成</span></li>
            </ol>
        </div>
        <div class="reg_form" id="a">
            <div class="reg_row">
                <input type="text" onfocus="changeUserName();" maxlength="11" id="username" name="username" tabindex="1"  placeholder="请输入登录手机号" class="form-control u_name">
                <span id="u_null" class="error">请输入您的登录手机号!</span>
                <span id="u_format" class="error">手机号格式错误!</span>
                <span id="u_notnull" class="error">此手机号绑定账户不存在!</span>
            </div>
            <div class="reg_row">
                <button type="button" tabindex="4" id="findPwdSubmit" onclick="onNext();" class="btn btn-primary">下一步</button>
            </div>
        </div>
        <div class="reg_form" id="b">
            <div class="reg_row">
                <input type="hidden" name="mobile" id="mobile" value="">
                <span id="msg"></span>
            </div>
            <div class="reg_row">
                <button type="button" tabindex="4" onclick="onNextTwo();" id="findPwdSubmit" class="btn btn-primary">下一步</button>
            </div>
        </div>
        <div class="reg_form" id="c">
            <span id="msgs">重置后的密码已发送到您绑定的手机,请注意查收!</span>
        </div>
    </div>
</div>
    <script type="text/javascript">
        $(function () {
            $("#a").show();
            $("#b").hide();
            $("#c").hide();
            $("#u_null").hide();
            $("#u_format").hide();
            $("#u_notnull").hide();
        });
        function changeUserName(){
            $("#username").removeClass("redborder");
            $("#u_null").hide();
            $("#u_format").hide();
            $("#u_notnull").hide();
        }
        function onNext(){
            var errorFlag = true;
            var checkMob = /^0?(13|15|17|18|14)[0-9]{9}$/;
            var username = $("#username").val();
            if(isEmpty(username)){
                errorFlag = false;
                $("#u_null").show();
                $("#username").addClass("redborder");
                return errorFlag;
            }
            if(!checkMob.test(username)){
                errorFlag = false;
                $("#u_null").hide();
                $("#u_format").show();
                $("#username").addClass("redborder");
                return errorFlag;
            }

            $("#u_null").hide();
            $("#u_format").hide();
            $("#u_notnull").hide();

            $.ajax({
                type: "get",
                url: "${base}/fossick/ajaxCheckUser",
                data: "username="+username,
                success: function(data) {
                    if(data.status=='success'){
                        if(data.data==true){
                            $("#one").removeClass('current');
                            $("#one").addClass('current-prev');
                            $("#two").addClass('current');
                            $("#a").hide();
                            $("#b").show();

                            $("#mobile").val(data.mob);
                            var message = "您确定此"+data.mob+"号码接收重置后的账号密码?";

                            $("#msg").html(message);
                        }else{
                            $("#u_notnull").show();
                            $("#username").addClass("redborder");
                        }
                    }else{
                        $("#u_notnull").show();
                        $("#username").addClass("redborder");
                    }
                }
            });
        }
        function onNextTwo(){
            var mobe = $("#mobile").val();

            $.ajax({
                type: "get",
                url: "${base}/fossick/ajaxSendSms",
                data: "mobileo="+mobe,
                success: function(data) {
                    $("#two").removeClass('current');
                    $("#two").addClass('current-prev');
                    $("#one").removeClass('current');
                    $("#one").removeClass('current-prev');
                    $("#three").addClass('last current');


                    $("#b").hide();
                    $("#a").hide();
                    $("#c").show();

                    if(data.status!='success'){
                        var messages = "重置失败请稍后重试!";

                        $("#msgs").html(messages);
                    }
                }
            });



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
    </script>
    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>