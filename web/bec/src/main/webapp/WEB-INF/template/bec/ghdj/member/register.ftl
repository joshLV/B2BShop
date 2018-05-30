<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
    <#include "bec/ghdj/top2.ftl"/>
    <div class="reg-box">
    <div class="reg">
        <h1>采购商注册</h1>
        <div class="reg_main">
           <#-- <ul class="reg_tit">
                <li class="on">第一步：注册基本信息</li>
                <li class="lase">第二步：公司资质信息</li>
            </ul>-->
            <div class="reg_tab">
                <form name="reg1" id="reg1"  method="post">
                <#--接收采购商所在地区的 ID PATH  以及默认给采购商一个采购商类型值-->
                    <input type="hidden" id="areaId" name="areaId" value=""/>
                    <input type="hidden" id="areaPath" name="areaPath" value=""/>
                    <input type="hidden" id="buyerType" name="buyerType" value="${buyerType}"/>
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="right" style="width: 285px;">
                                <b class="ftx04" >*</b>
                                <label class="reg-label" for="companyName">公司名称</label>：
                            </td>
                            <td align="left">
                                <input type="text" value="" name="companyName" id="companyName" class="inp_text" datatype="*4-20"  nullmsg="请填写公司名称！" />
                            </td>
                        </tr>
                        <#--<tr>
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
                        </tr>-->
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
                            <td align="right" width="295">
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="yyzz">营业执照</label>：
                            </td>
                            <td align="left">
                                <input type="file" name="file" id="file1" value="" class="inp_text2" nullmsg="请选择营业执照文件扫描件文件！" accept="image/*" onchange="checkFile()"/>
                                <span id="picError" class="hide"></span>
                            </td>
                        </tr>
                      <tr>
                            <td align="right" >
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="openingBank">开户行(银行及支行名称)</label>：
                            </td>
                            <td align="left">
                                <input type="text" name="openingBank" id="openingBank" value="" class="inp_text"  datatype="*5-50" nullmsg="请填写开户行(银行及支行名称)" errormsg="请输入5-50位字符"/>
                                <span id="picError4" class="error"></span>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" >
                                <b class="ftx04">*</b>
                                <label class="reg-label" for="bankNumber">帐号</label>：
                            </td>
                            <td align="left">
                                <input type="text" name="bankNumber" id="bankNumber" value="" class="inp_text"  datatype="n10-30" nullmsg="请填写帐号" errormsg="请输入10-30位数字" />
                                <span id="picError4" class="error"></span>
                            </td>
                        </tr>
                      <tr>
                         <td align="right" >
                             <b class="ftx04">*</b>验 证 码：</td>
                         <td align="left">
                             <div class="fl item-ifo" id="hideYZM">
                                 <input type="text" value="" class="inp_text w120" name="authcode" id="authcode" style="height:36px;" datatype="*" nullmsg="请输入验证码！"/>
                                 <label class="img"><img id="captchaImage" style="cursor:pointer;width:100px;height:38px; line-height:38px;display:block; float:left;" alt="验证码" src="${base}/captcha.jpg?yys=+new Date().getTime()" onclick="this.src='${base}/captcha.jpg?yys='+new Date().getTime()"></label>
                                 <label class="f-fl" style="line-height:34px; float:left;">&nbsp;看不清？<a href="javascript:void(0)" id="getCaptcha" onclick="document.getElementById('captchaImage').src='${base}/captcha.jpg?yys='+new Date().getTime()" class="flk13">换一张</a></label>
                                 <label id="authcode_succeed" class="blank invisible"></label>
                                 <label id="authcode_error"></label>
                             </div>
                         </td>
                     </tr>
                     <tr>
                         <td>&nbsp;</td>
                         <td>
                             <input type="hidden" value="">
                             <input type="checkbox" class="checkbox" checked="true" id="readme" onchange="agreeonProtocol();">
                             <label for="protocol">我已阅读并同意
                                 <a href="${base}/html/ghj/protocol.html" class="blue" id="protocol">《采购商注册协议》</a>
                             </label>
                             <label id="protocol_error" class="error hide" style="color: #DB0000;">请接受服务条款</label>
                         </td>
                     </tr>
                        <#if buyerType == '3'>
                        <tr>
                            <td align="right">
                            </td>
                            <td align="left">
                                <input type="checkbox" class="input-r-c" id="iagree-checkbox" name="iagreeTK" checked="checked"  onclick="submitDisable()">
                                <label for="iagree-checkbox"> 我已经阅读并同意</label>
                                <a href="${base}/html/ghj/register-shiyong.html" class="col-017" id="registSYAgreementId">《申请试用的条款须知》</a>
                            </td>
                        </tr>
                        </#if>
                        <#--<tr>
                            <td align="right">
                                <label class="reg-label" for="invitationCode">邀请码</label>：
                            </td>
                            <td align="left">
                                <input type="text" name="invitationCode" id="invitationCode" onblur="checkInvCode()" value="${invitationCodeStatus}" class="inp_text"  />
                                <span id="showYQM" class="hide">邀请码无效！</span>
                                <span id="showYQMZQ" class="hide">通过信息验证！</span>
                            </td>
                        </tr>-->
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <input type="submit" id="submits"  value="提交注册" class="inp_sub inp_sub2" />
                                <input type="button" id="submits_distabled" style="display: none;"  value="提交注册" class="inp_sub3" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    </div>
</div>
<link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
<script src="${base}/static/bec/base/js/Validform_v5.3.2.js" type="text/javascript"></script>
<script src="${base}/static/bec/base/js/jquery.lSelect.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.ajaxfileupload-20140125.js" type="text/javascript"></script>
<script src="${base}/static/js/uploadPreview.js" type="text/javascript"></script>
<script type="text/javascript">
    var loadindex;
    $(function () {
        //设置发布询价单协议
        $("#registSYAgreementId").colorbox({title:"申请试用的条款须知", iframe:true, innerWidth:800, innerHeight:500, opacity: 0.15});
        /**
         * 获取数据库区域信息，并赋值到所在地区input中
         * */
        $(".areaSelect").val("");
        $(".areaSelect").lSelect({
            url: "${base}/area/ajaxChildren"// Json数据获取url
        });
        $("#userName").val('');
        $("#passwd").val('');

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
                if(checkFile()){
                $("#submits").attr("disabled","disabled");
                loadindex = layer.load();
                /**
                 * 将所在地区中多选的areaID,areaPath等值注入到input中
                 * */
                var areaPath = $(".areaSelect").val();
                $("#areaPath").val(areaPath);
                var areaId = areaPath.substring(areaPath.lastIndexOf(',')+1,areaPath.length);
                $("#areaId").val(areaId);
                var data = $('#reg1').serialize();

                    $.ajaxFileUpload({
                        url:"${base}/member/saveBuyer?"+data,
                        secureuri:true,//是否启用安全提交,默认为false
                        fileElementId:$('input[name=file]'),//文件选择框的对象,多个时用[]包含
                        dataType:'text',
                        async:true,
                        success:function(data){
                            layer.close(loadindex);
                            data = data.replace(/<pre.*?>/g, '');
                            data = data.replace(/<PRE.*?>/g, '');
                            data = data.replace("<PRE>", '');
                            data = data.replace("</PRE>", '');
                            data = data.replace("<pre>", '');
                            data = data.replace("</pre>", '');
                            data = jQuery.parseJSON(data);
                            if(data.status=='success'){
                                layer.msg('注册成功！审核后会及时告知您结果。',{icon:1,time: 2000},function(){
                                    window.location=${base}/+"index";
                                });
                            }else{
                                layer.alert(data.message,{icon:2});
                                layer.close(loadindex);
                                $("#submits").removeAttr("disabled");
                            }
                        },
                        error:function(data){ //服务器响应失败时的处理函数
                            layer.alert('error',{icon:2});
                        }
                    });
                }

            }
        });
    });
    function submitDisable(){
        var iagreeTK = $("input[name='iagreeTK']:checked");
        if( iagreeTK.length > 0 ){
            $("#submits_distabled").hide();
            $("#submits").show();
        }else{
            $("#submits_distabled").show();
            $("#submits").hide();
        }
    }
    function checkFile(){
        if (document.all.file1.value!="") {
            $("#picError").html("通过验证!");
            $("#picError").removeClass().addClass("Validform_checktip Validform_right");
            return true;
        }
        else {
            $("#picError").html("请选择营业执照文件扫描件文件！");
            $("#picError").removeClass().addClass("Validform_checktip Validform_wrong");
            return false;
        }

    }
    //判断采购商注册协议是否同意
    function agreeonProtocol(){
        if ($("#readme").prop("checked") == true) {
            $("#submits_distabled").hide();
            $("#submits").show();
            $("#protocol_error").removeClass().addClass("error hide");
            return true;
        }else{
            $("#submits_distabled").show();
            $("#submits").hide();
            $("#protocol_error").removeClass().addClass("error");
            return false;
        }
    }
    $("#protocol").colorbox({title:"采购商注册协议", iframe:true, innerWidth:600, innerHeight:500, opacity: 0.15});
</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>