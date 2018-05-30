<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>
<div id="container">
    <#include "bec/ghj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/member/info.html">账户中心</a></strong><span>&nbsp;&gt;&nbsp;账户安全<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/ghj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="changePWD"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>账户安全</em></h1>
            <div class="user_right">

                <form class="reg1" id="reg1" method="post" action="" name="">
                    <table width="100%" style="table-layout:fixed;" cellpadding="0" cellspacing="0" class="pwd-table">
                        <tbody>
                        <tr>
                            <td width="14%" style="padding-left:50px;">
                                <span class="pwd-label">
                                    <em>*</em>旧密码：
                                </span>
                            </td>
                            <td width="23%">
                                <input type="password" class="itxt w200" id="oldpwd" tabindex="1" name="password" onblur="passwordOnblur();">
                            </td>
                            <td>
                                <span class="Validform_checktip" id="o_null">请输入旧密码</span>
                                <span class="Validform_checktip" id="o_format">旧密码长度6~20!</span>
                                <span class="Validform_checktip" id="o_error">旧密码不正确</span>
                            </td>
                        </tr>
                        <tr>
                            <td width="10%" style="padding-left:50px;">
                                <span class="pwd-label">
                                    <em>*</em>设置新密码：
                                </span>
                            </td>
                            <td>
                                <input type="password" id="newpwd" class="itxt w200" tabindex="2">
                            </td>
                            <td>
                                <span class="Validform_checktip" id="n_null">请输入新密码</span>
                                <span class="Validform_checktip" id="n_format">新密码长度6~20!</span>
                                <span class="Validform_checktip" id="n_error">新密码不能与旧密码一致</span>
                            </td>
                        </tr>
                        <tr>
                            <td width="10%" style="padding-left:50px;">
                                <span class="pwd-label">
                                    <em>*</em>确认新密码：
                                </span>
                            </td>
                            <td>
                                <input type="password" id="rnewpwd" class="itxt w200" tabindex="3">
                            </td>
                            <td>
                                <span class="Validform_checktip" id="r_error">两次输入的密码不一致</span>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>

                            <td colspan="2" style="  padding-left:10px;">

                                <input type="button" onclick="onsub();" id="findPwdSubmit"  class="btn-5" value="确&nbsp;认">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $("#o_null").hide();
        $("#o_format").hide();
        $("#o_error").hide();

        $("#n_null").hide();
        $("#n_format").hide();
        $("#n_error").hide();

        $("#r_error").hide();

    });
    //旧密码是否正确的校验
    var isSubmit = false;
    function passwordOnblur(){
        var error = true;
        var password = $("#oldpwd").val();
        if(password.length>5 && password.length <=20){
            $("#o_null").hide();
            $("#o_format").hide();
            $("#o_error").hide();
            $.ajax({
                type: "get",
                url: "${base}/member/changepwd/ajaxCheckPwd",
                async: false,
                data: {"password":password},
                success: function(data) {
                    if(data.status=='success'){
                        $("#o_null").hide();
                        $("#o_format").hide();
                        $("#o_error").hide();
                        isSubmit = true;
                    }else{
                        $("#o_error").show();
                        error = false;
                        isSubmit = false;
                    }
                }
            });
        }else{
            $("#o_format").show();
            error = false;
        }
        return error;
    }



    function onsub(){
        passwordOnblur();

        if(isSubmit){

            var oldpwd = $("#oldpwd").val();
            var newpwd = $("#newpwd").val();
            var rnewpwd = $("#rnewpwd").val();
            if(oldpwd.length<=0){
                $("#o_null").show();
                $("#o_format").hide();
                $("#o_error").hide();
                return false;
            }
            if(oldpwd.length>20){
                $("#o_null").hide();
                $("#o_format").show();
                $("#o_error").hide();
                return false;
            }


            if(newpwd.length==0){
                $("#n_null").show();
                $("#n_format").hide();
                $("#o_error").hide();
                return false;
            }
            if(newpwd.length>20 || newpwd.length < 6){
                $("#n_null").hide();
                $("#n_format").show();
                $("#n_error").hide();
                return false;
            }
            if(newpwd == oldpwd){
                $("#n_null").hide();
                $("#n_format").hide();
                $("#n_error").show();
                return false;
            }

            if(newpwd!=rnewpwd){
                $("#n_null").hide();
                $("#n_format").hide();
                $("#n_error").hide();
                $("#r_error").show();
                return false;
            }

            $("#o_null").hide();
            $("#o_format").hide();
            $("#o_error").hide();

            $("#n_null").hide();
            $("#n_format").hide();
            $("#n_error").hide();

            $("#r_error").hide();

            if(oldpwd.length>0&& newpwd.length>0 && newpwd==rnewpwd){
                $.ajax({
                    type: "get",
                    async: false,
                    url: "${base}/member/changepwd/ajaxchangePwd",
                    data: "newpwd="+newpwd+"&oldpwd="+oldpwd,
                    success: function(data) {
                        if(data.status=='success'){
                            layer.alert("修改成功",{icon:1},function(){
                                window.location.href= '${base}/member/logout';
                            });
                        }else{
                            layer.alert("修改失败",{icon:2});
                        }
                    }
                });
            }
        }


    }
</script>
    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>