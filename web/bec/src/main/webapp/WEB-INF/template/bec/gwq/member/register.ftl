<#escape x as x?html>
    <#include "bec/gwq/header.ftl"/>
<div id="container">
    <#include "bec/gwq/top2.ftl"/>
    <div class="reg-box">
    <div class="reg">
        <h1>采购商注册</h1>
        <div class="reg_main">
            <ul class="reg_tit">
                <li class="on">第一步：注册基本信息</li>
                <li class="lase">第二步：公司资质信息</li>
            </ul>
            <div class="reg_tab">
                <form name="reg1" id="reg1" action="" method="post">
                <#--接收采购商所在地区的 ID PATH  以及默认给采购商一个采购商类型值-->
                    <input type="hidden" id="areaId" name="areaId" value=""/>
                    <input type="hidden" id="areaPath" name="areaPath" value=""/>
                    <input type="hidden" id="buyerType" name="buyerType" value="2"/>
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right" style="width: 285px;">
                                <b class="ftx04" >*</b>
                                <label class="reg-label" for="companyName">公司名称</label>：
                            </td>
                            <td align="left">
                                <input type="text" value="" name="companyName" id="companyName" class="inp_text" datatype="*6-20"  nullmsg="请填写公司名称！" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="realName">法人姓名：</label>
                            </td>
                            <td align="left">
                                <input type="text" value="" class="inp_text"  name="realName" id="realName" class="inp_text" datatype="zh2-4" nullmsg="请填写法人姓名！" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="mobile">公司电话</label>：
                            </td>
                            <td align="left">
                                <input type="text"  name="mobile" id="mobile" value="" class="inp_text" datatype="phone" nullmsg="请填写公司电话固定电话！" errormsg="固电格式如:区号-固话 029-88888888！" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="email">公司邮箱</label>：
                            </td>
                            <td align="left">
                                <input type="text" name="email" id="email" value="" class="inp_text" datatype="e" nullmsg="请填写公司邮箱！" errormsg="公司邮箱格式错误！"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="szdq">所在地区</label>：
                            </td>
                            <td align="left">
                                <input name="szdq" id="szdq"  type="text" value="" datatype="*" class="areaSelect" nullmsg="请选择所在地区！">
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="address">联系地址</label>：
                            </td>
                            <td align="left">
                                <textarea name="address" id="address" datatype="*6-100" nullmsg="请填写联系地址！" errormsg="联系地址长度为6到100位任意字符！" cols="50" rows="4" class="wby"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="linkMan">联系人</label>：
                            </td>
                            <td>
                                <input type="text" name="linkMan" id="linkMan" value="" class="inp_text" datatype="zh2-4" nullmsg="请填写联系人！" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="userName">联系人手机(登录名)</label>：
                            </td>
                            <td align="left" id="mob_mess_hide">
                                <input type="text" name="userName" id="userName" value="" onblur="checkMobiles();" class="inp_text" datatype="m" nullmsg="请填写联系人手机！" errormsg="联系人手机号码格式不对！" />
                                <span id="showMOB" class="hide">此号码已经被注册!</span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="passwd">密码</label>：
                            </td>
                            <td align="left">
                                <input type="password" name="passwd" id="passwd" value="" class="inp_text" datatype="*6-20" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="repasswd">确认密码</label>：
                            </td>
                            <td align="left">
                                <input type="password" id="repasswd" name="repasswd" value="" class="inp_text" datatype="*6-20" recheck="passwd" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <label class="reg-label" for="linkManEmail">联系人邮箱</label>：
                            </td>
                            <td align="left">
                                <input type="text" name="linkManEmail" id="linkManEmail" value="" class="inp_text" ignore="ignore"  datatype="e" errormsg="联系人邮箱格式错误！"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <label class="reg-label" for="invitationCode">邀请码</label>：
                            </td>
                            <td align="left">
                                <input type="text" name="invitationCode" id="invitationCode" onblur="checkInvCode()" value="${invitationCodeStatus}" class="inp_text"  />
                                <span id="showYQM" class="hide">邀请码无效！</span>
                                <span id="showYQMZQ" class="hide">通过信息验证！</span>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <input type="submit" id="submits"  value="提交注册" class="inp_sub inp_sub2" />

                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    </div>
</div>
<script src="${base}/static/bec/base/js/Validform_v5.3.2.js" type="text/javascript"></script>
<script src="${base}/static/bec/base/js/jquery.lSelect.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        /**
         * 获取数据库区域信息，并赋值到所在地区input中
         * */
        $(".areaSelect").val("");
        $(".areaSelect").lSelect({
            url: "${base}/area/ajaxChildren"// Json数据获取url
        });
        /**
         * 验证form表单中的各个值
         * */
        $("#reg1").Validform({
            tiptype:4,
            label:".label",
            ajaxPost:true,
            datatype:{
                "phone":function(gets,obj,curform,regxp) {
                    /*参数gets是获取到的表单元素值，
                      obj为当前表单元素，
                      curform为当前验证的表单，
                      regxp为内置的一些正则表达式的引用。*/
                    var reg1 = regxp["m"],reg2 = /(^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/;
                    if (reg1.test(gets)) {
                        return true;
                    }
                    if (reg2.test(gets)) {
                        return true;
                    }

                    return false;
                }
            },
            beforeSubmit:function(){
                /**
                 * 将所在地区中多选的areaID,areaPath等值注入到input中
                 * */
                $("#reg1").attr("action",${base}/+"member/save?r=" + Math.random());
                var status = '';
                var statusMob = '';
                var areaPath = $(".areaSelect").val();
                $("#areaPath").val(areaPath);
                var areaId = areaPath.substring(areaPath.lastIndexOf(',')+1,areaPath.length);
                $("#areaId").val(areaId);

//                var checkMobile = $("#userName").val();
//                if(!isEmpty(checkMobile)){
//                    statusMob = checkMobiles(checkMobile);
//                    if(statusMob=="1"){
//                        $("#showMOB").addClass("Validform_checktip Validform_wrong");
//                        $("#showMOB").show();
//                        $("#mob_mess_hide").find("span").eq(1).hide();
//                        return false;
//                    }
//                    $("#mob_mess_hide").find("span").eq(1).show()
//                }
//                $("#showMOB").hide();

//                var invitationCode = $("#invitationCode").val();
//                if(!isEmpty(invitationCode)){
//                    status = checkInvCode(invitationCode);
//                    if(status=="1"){
//                        $("#showYQM").addClass("Validform_checktip Validform_wrong");
//                        $("#showYQM").show();
//                        return false;
//                    }
//                }
//                $("#showYQM").hide();
//                $("#showYQMZQ").addClass("Validform_checktip Validform_right");
//                $("#showYQMZQ").show();
            },
            callback:function(data){
                if(data.status=='success'){
                    //采购商基本信息注册成功后跳转到后台并把采购商ID带入
                    window.location="${base}/member/registerForward?buyerId="+data.buyerId;
                }else{
                    layer.alert(data.message,{icon:2});
                }
            }
        });

    });
</script>
    <#include "bec/gwq/service2.ftl"/>
    <#include "bec/gwq/foot.ftl"/>
</#escape>