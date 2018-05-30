<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>

    <#include "bec/ghj/top.ftl"/>
<link rel="stylesheet" type="text/css" href="${base}/static/bec/project/ghj/css/join_us.css">

<div class="join_us_banner2">
</div>
<div class="join_us">
    <div class="join_us_in">
        <div class="join_us_tit"><img src="${base}/static/bec/project/ghj/img/join_us_tit.png"></div>
        <div class="join_us_con">
            <form id="ibInfo" class="registerform">
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td>
                            <label for="textfield" class="join-names">商家名称:</label>
                            <input type="text" datatype="*" id="name" name="name">
                        </td>
                        <td class="join_tests">请输入商家名称(2-30，必填)</td>
                    </tr>
                    <tr>
                        <td><label for="textfield2" class="join-names">详细地址:</label>
                            <input type="text" id="address" name="address"></td>
                        <td class="join_tests">请输入详细地址(2-60，必填)</td>
                    </tr>
                    <tr>
                        <td><label for="textfield3" class="join-names">负责人:</label>
                            <input type="text" id="head" name="head" ></td>
                        <td class="join_tests">请输入负责人(2-8，必填)</td>
                    </tr>
                    <tr>
                        <td><label for="textfield4" class="join-names">联系手机号:</label>
                            <input type="text" id="mobile" name="mobile"></td>
                        <td class="join_tests">请输入联系人手机号(必填)</td>
                    </tr>
                    <tr>
                        <td><label for="textfield5" class="join-names">联系固定电话:</label>
                            <input type="text" id="telphone" name="telphone"></td>
                        <td class="join_tests">请输入联系电话</td>
                    </tr>
                    <tr>
                        <td><label for="textfield6" class="join-names">营业执照编码:</label>
                            <input type="text" id="businessLicenseCode" name="businessLicenseCode"></td>
                        <td class="join_tests">请输入营业执照编码(2-20，必填)</td>
                    </tr>
                    <tr>
                        <td>
                            <label for="textfield6" class="join-names">备注:</label>
                            <textarea id="remarks" name="remarks" maxlength="500"></textarea>
                        </td>
                        <td class="join_tests">请输入备注(1-500)</td>
                    </tr>
                    <tr>
                        <td colspan="2"><button class="join_us_btn" type="button" onclick="return submitInfo();">提交</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<div class="join_process">
    <div class="join_process_in">
        <h2>入驻流程</h2>
        <div class="join_process_img"><img src="${base}/static/bec/project/ghj/img/rzlc_img.png"></div>
    </div>
</div>
<div class="join_notice">
    <div class="join_notice_in">
        <h2>入驻须知</h2>
        <h3>广货街坚守品牌正品，杜绝“假货、水货、二手货”，全力打造让客户满意的电子交易平台</h3>
        <div class="join_notice_img">
            <div class="join_notice_box" style="margin-left:0px;">
                广货街暂未授权任何机构进行代理招商服务，入驻申请流程及相关的收费说明均以官方招商页面为准。
            </div>
            <div class="join_notice_box">
                代理商需要提供的授权资质：需要确保授权链条的完整，即申请入驻企业拿到的授权能够逐级逆推回品牌商
            </div>
            <div class="join_notice_box">
                发票：所有入驻的企业必须给消费者提供正规发票，发票盖章的公司名称必须与商家与广货街合作的公司名称一致
            </div>
            <div class="join_notice_box">
                广货街暂不接受未取得国家商标总局颁发的商标注册证或商标受理通知书的境外品牌的开店申请
            </div>
            <div class="join_notice_box">
                请务必保证您入驻前后提供的相关资质的真实有效性（若您提供的相关资质为第三方提供，如商标注册证、授权书等 ）
            </div>
        </div>
    </div>
</div>
<div class="join_normal">
    <div class="join_normal_in">
        <h2>入驻标准</h2>
        <h3>厂商企业资质要求：公司注册资金50万及50万以上人民币，需要商家提供以下资料（所有证件均需在有效期内）</h3>
        <div class="join_normal_img">
            <img src="${base}/static/bec/project/ghj/img/rzbz_img.png">
        </div>
    </div>
</div>

<div class="join_money">
    <div class="join_money_in">
        <h2>入驻费用</h2>
        <div class="join_money_con">
            <p>保证金 = 5,000元(包含商品质量及履约金两部分)</p>
            <p>交易服务费=商家在广货街售出的产品销售额*费率</p>
        </div>
    </div>
</div>

<script type="text/javascript">
    function submitInfo(){
        if($.trim($("#name").val()) == ""){
            layer.msg("商家名称不能为空！",{icon:7,time: 2000});
            $("#name").focus();
            return false;
        }else{
            var name = $.trim($("#name").val());
            if(name.length < 2){
                layer.msg("商家名称长度不能小于2！",{icon:7,time: 2000});
                $("#name").focus();
                return false;
            }
            if(name.length > 30){
                layer.msg("商家名称长度不能大于30！",{icon:7,time: 2000});
                $("#name").focus();
                return false;
            }
        }
        if($.trim($("#address").val()) == ""){
            layer.msg("详细地址不能为空！",{icon:7,time: 2000});
            $("#address").focus();
            return false;
        }else{
            var address = $.trim($("#address").val());
            if(address.length < 2){
                layer.msg("详细地址长度不能小于2！",{icon:7,time: 2000});
                $("#address").focus();
                return false;
            }
            if(address.length > 60){
                layer.msg("详细地址长度不能大于60！",{icon:7,time: 2000});
                $("#address").focus();
                return false;
            }
        }
        if($.trim($("#head").val()) == ""){
            layer.msg("负责人不能为空！",{icon:7,time: 2000});
            $("#head").focus();
            return false;
        }else{
            var head = $.trim($("#head").val());
            if(head.length < 2){
                layer.msg("负责人长度不能小于2！",{icon:7,time: 2000});
                $("#head").focus();
                return false;
            }
            if(head.length > 8){
                layer.msg("负责人长度不能大于8！",{icon:7,time: 2000});
                $("#head").focus();
                return false;
            }
        }
        if($.trim($("#mobile").val()) == ""){
            layer.msg("手机号不能为空！",{icon:7,time: 2000});
            $("#mobile").focus();
            return false;
        }else{
            var mobile = $.trim($("#mobile").val());
            if(mobile.length < 11){
                layer.msg("手机号长度不能小于11！",{icon:7,time: 2000});
                $("#mobile").focus();
                return false;
            }
            if(mobile.length > 15){
                layer.msg("手机号长度不能大于15！",{icon:7,time: 2000});
                $("#mobile").focus();
                return false;
            }
        }

        if($.trim($("#telphone").val()) != ""){
            var telphone = $.trim($("#telphone").val());
            if(telphone.length < 8){
                layer.msg("固定电话长度不能小于8！",{icon:7,time: 2000});
                $("#telphone").focus();
                return false;
            }
            if(telphone.length > 20){
                layer.msg("固定电话长度不能大于20！",{icon:7,time: 2000});
                $("#telphone").focus();
                return false;
            }
        }
        if($.trim($("#businessLicenseCode").val()) == ""){
            layer.msg("营业执照编码不能为空！",{icon:7,time: 2000});
            $("#businessLicenseCode").focus();
            return false;
        }else{
            var businessLicenseCode = $.trim($("#businessLicenseCode").val());
            if(businessLicenseCode.length < 2){
                layer.msg("营业执照编码长度不能小于2！",{icon:7,time: 2000});
                $("#businessLicenseCode").focus();
                return false;
            }
            if(businessLicenseCode.length > 20){
                layer.msg("营业执照编码长度不能大于20！",{icon:7,time: 2000});
                $("#businessLicenseCode").focus();
                return false;
            }
        }

        if($.trim($("#remarks").text()) != ""){
            var remarks = $.trim($("#remarks").text());
            if(remarks.length > 500){
                layer.msg("备注长度不能大于500！",{icon:7,time: 2000});
                $("#remarks").focus();
                return false;
            }
        }
        $.ajax({
            type: "post",
            url: "${base}/join/save/whichweb",
            data:$("#ibInfo").serialize(),
            dataType: "json",
            async:false,
            success: function (data) {
                layer.msg(data.message,{icon:6,time: 3000});
                setTimeout("window.location.reload()",3000);
            },
            error : function(error) {
                layer.msg(error.message,{icon:5,time: 3000});
            }
        });
    }
</script>

    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>