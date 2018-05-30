<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container" >
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/member/info.html">账户中心</a></strong><span>&nbsp;&gt;&nbsp;账户信息<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="user_info"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>账户信息</em></h1>
            <div class="user_right">
                <form id="baseInfoFrm">
                    <#if loginType == 'operator'>
                        <div class="item"> <span class="label">用户名：</span>
                            <div class="f-fl">
                                <input type="text" readonly="readonly" class="itxt" maxlength="20" id="mp_userName" name="mp_userName" value="${mp.userName}" style="margin-left: 11px;width: 220px">

                            </div>
                        </div>
                        <div class="item"> <span class="label">真实姓名：</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="mp_realName" name="mp_realName" value="${mp.realName}" style="margin-left: 11px;width: 220px">

                            </div>
                        </div>
                        <div class="item"> <span class="label">邮箱：</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="mp_email" name="mp_email" value="${mp.email}" style="margin-left: 11px;width: 220px">

                            </div>
                        </div>
                        <div class="item"> <span class="label">角色：</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="role" name="role" value="${roleValue}" style="margin-left: 11px;width: 220px">

                            </div>
                        </div>
                    <#else>
                        <div class="item"> <span class="label">公司名称：</span>
                            <div class="f-fl">
                                <input type="text" readonly="readonly" class="itxt" maxlength="20" id="companyName" name="companyName" value="${member.companyName}" style="margin-left: 11px;width: 200px">

                            </div>
                        </div>
                       <#-- <div class="item"> <span class="label">法人姓名：</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="realName" name="realName" value="${member.realName}" style="margin-left: 11px;width: 200px">

                            </div>
                        </div>
                        <div class="item"> <span class="label">公司电话：</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="mobile" name="mobile" value="${member.mobile}" style="margin-left: 11px;width: 200px">

                            </div>
                        </div>
                        <div class="item"> <span class="label">公司邮箱：</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="email" name="email" value="${member.email}" style="margin-left: 11px;width: 200px">

                            </div>
                        </div>-->
                        <div class="item"> <span class="label">公司地址：</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="fullAreaName" name="fullAreaName" value="${fullAreaName}" style="margin-left: 11px;width: 200px">
                            </div>
                        </div>
                        <div class="item"> <span class="label">联系人：</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="linkMan" name="linkMan" value="${member.linkMan}" style="margin-left: 11px;width: 200px">

                            </div>
                        </div>
                        <div class="item"> <span class="label">联系人手机：</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="likeManMobile" name="likeManMobile" value="${member.userName}" style="margin-left: 11px;width: 200px">

                            </div>
                        </div>
                        <div class="item"> <span class="label">联系人邮箱：</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="linkManEmail" name="linkManEmail" value="${member.linkManEmail}" style="margin-left: 11px;width: 200px">

                            </div>
                        </div>
                        <div class="item"> <span class="label">账户金额 :</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="accountTotal" name="accountTotal" value="<#if account.accountTotal??>${account.accountTotal?string("##0.00")}<#else>0.00</#if>" style="margin-left: 11px;width: 200px">
                            </div>
                        </div>
                        <div class="item"> <span class="label">已冻结资金:</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="accountBlock" name="accountBlock" value="<#if account.accountBlock??>${account.accountBlock?string("##0.00")}<#else>0.00</#if>" style="margin-left: 11px;width: 200px">
                            </div>
                        </div>
                        <div class="item"> <span class="label">可用余额:</span>
                            <div class="f-fl">
                                <input type="text"  readonly="readonly" class="itxt" maxlength="20" id="accountTotal" name="accountTotal" value="<#if account.accountTotal?? && account.accountBlock??>${(account.accountTotal-account.accountBlock)?string("##0.00")}<#else>0.00</#if>" style="margin-left: 11px;width: 200px">
                            </div>
                        </div>
                    </#if>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('#nickName').focus(function () {
            $('#nickName_msg').text('4-20个字符，可由中英文、数字、"_"、"-"组成');
        });
        $('#nickName').blur(function () {
            if ($(this).val() != "") {
                $(this).addClass('itxt-succ');
            }
            $('#nickName_msg').text('');
        });

        $('#email').blur(function () {
            var v = $(this);
            var s = v.val();
            var pattern = /^[a-zA-Z0-9_\-]{1,}@[a-zA-Z0-9_\-]{1,}\.[a-zA-Z0-9_\-.]{1,}$/;
            if (s != "") {
                if (!pattern.exec(s)) {
                    v.val("");
                    v.focus();
                    $('#email_msg').text('请输入正确的邮箱地址');
                    v.removeClass('itxt-succ');
                } else {
                    $('#email_msg').text('');
                    v.addClass('itxt-succ');
                }
            } else {
                v.removeClass('itxt-succ');
                $('#email_msg').text('');
            }
        });

        $('#mobile').blur(function () {
            var v = $(this);
            var s = v.val();
        <#--
        var reg0 = /^13\d{5,9}$/;
        var reg1 = /^153\d{4,8}$/;
        var reg2 = /^159\d{4,8}$/;
        var reg3 = /^0\d{10,11}$/;
        var my = false;
        if (reg0.test(s))my = true;
        if (reg1.test(s))my = true;
        if (reg2.test(s))my = true;
        if (reg3.test(s))my = true;
        -->
            var my = false;
            if (s != "" && s.length != 11) {
                if (!my) {
                    v.val("");
                    v.focus();
                    $('#mobile_msg').text('请输入正确的手机号码');
                    v.removeClass('itxt-succ');
                } else {
                    $('#mobile_msg').text('');
                    v.addClass('itxt-succ');
                }
            } else {
                v.removeClass('itxt-succ');
                $('#mobile_msg').text('');
            }
        });

        $('.birthday-info select').bind('change', function () {
            var y = $('#birthdayYear').val();
            var m = $('#birthdayMonth').val();
            var d = $('#birthdayDay').val();
            var birthday = y + '-' + m + '-' + d;
            if (y != undefined && m != undefined && d != undefined) {
                $('#birthday').val(birthday);
            }
        });
    });

    /**
     * 更新账户信息
     */
    function updateUserInfo() {
        $.ajax({
            type: 'post',
            url: '${base}/member/updateMember.html',
            data: {
                nickName: $('#nickName').val(),
                sex: $('#baseInfoFrm [type=radio]:checked').val(),
                birthday: $('#birthday').val(),
                mobile: $('#mobile').val(),
                email: $('#email').val()
            },
            success: function (data) {
                if(data.status == 'success') {
                    alert("更新成功^_^");
                }
            }
        })
    }
</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>