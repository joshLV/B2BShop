<#include "bec/ghdj/header.ftl"/>
<style type="text/css">
    .mymoney_back table td {
        border-bottom: 1px solid #E8E8E8;
       /* border-left: 1px solid #E8E8E8;*/
        text-align: center;
        line-height: 30px;
    }
    td, th {
        display: table-cell;
        vertical-align: inherit;
    }
    #orderlist .tb-order td {
        border: 1px solid #E6E6E6;
        padding: 8px 4px;
        text-align: center;
    }

    .one:hover {
        background-color: #E6E6E6;
    }

    #orderlist tbody i:hover {
        border: 1px solid darkred;
    }


    .popGeneral_address .aptab_center_address label {
        width: 125px !important;
    }
</style>
<div id="container" class="f-cb">
<#include "bec/ghdj/top.ftl"/>
    <div class="member_content">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/bankCard/list">资产中心</a></strong><span>&nbsp;&gt;&nbsp;银行卡<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
        <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
        <@leftmenu.menu id="bankcard_list"/>
            <!--leftMenu end-->
        </div>
        <div class="member_right">
            <div class="my_order" style="border-left: none !important; border-top: none !important;">
                <h3><em>我的银行卡列表</em></h3>
                <div class="fore0ss">
                    <div style="position: relative; left:10px; z-index: 30;">
                        <div class="filter_div">
                            <input type="text" class="filter_input" name="accountName" id="accountName" placeholder="开户名" value="${accountName}"/>
                        </div>
                        <div class="filter_div">
                            <input type="text" class="filter_input" name="bankName" id="bankName" placeholder="开户行名称" value="${bankName}"/>
                        </div>
                    <#--开始日期: <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="startDate" name="startDate" value="${startDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"  required><em class="bing-less"></em>
                    结束日期: <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="endDate" name="endDate" value="${endDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\',{d:+1})}'})"  required><em class="bing-less"></em>&nbsp;&nbsp;&nbsp;&nbsp;
                    -->
                        <div class="filter_div">
                            <input type="text" class="filter_input" name="bankcardcode" id="bankcardcode" placeholder="银行卡号" value="${bankcardcode}"/>
                        </div>

                        <input id="button_show" class="btn-5-new_po"  type="button" onclick="searchBankCard();" value="查询" />
                    </div>
                </div>
                <div class="mymoney_back">
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr class="mymoney_back_tit">
                            <td class="mymoney_ordernumber">开户名</td>
                            <td class="mymoney_sum">开户行名称</td>
                            <td class="mymoney_state">银行卡号</td>
                            <td class="mymoney_state">余额</td>
                            <td class="mymoney_state">所属城市</td>
                            <td class="mymoney_type">分行地址</td>
                            <td class="mymoney_tel">手机</td>
                            <td class="mymoney_operate">操作</td>
                        </tr>
                    <#list bankCardList as refundObj>

                        <tr class="one">
                            <td>${refundObj.accountName}</td>
                            <td>${refundObj.bankName}</td>
                            <td>${refundObj.bankcardcode}</td>
                            <td>${refundObj.balance}</td>
                            <td>${refundObj.areaName}</td>
                            <td>${refundObj.branchAddress}</td>
                            <td>${refundObj.mobile}</td>
                            <td>
                                <p style="margin-left: 15px;"> <a class="btn_cz"  href="javascript:void(0)" id="show" onClick="edit_bankCard('${refundObj.id}')"><i>&nbsp;</i>编辑</a>  <a class="btn_cz"  href="javascript:void(0)" id="show" onClick="showTips('${refundObj.id}');"><i>&nbsp;</i>删除</a> </p>
                            </td>
                        </tr>
                    </#list>
                        <tr>
                            <td colspan="8">
                                <p> <a class="add_yhk"  href="javascript:void(0)" id="show" onClick="use_NewConsignee()"><i>&nbsp;</i>添加新银行卡</a> </p>
                            </td>

                        </tr>
                    </table>
                </div>

            </div>
            <div class="mymoney_pages">
            <#if pager.list?size &gt; 0>
                <#import "bec/ghdj/pager.ftl" as p>
                <@p.pager pager = pager baseUrl = "/member/refund/list.html" />
            <#else>
                <div class="noRecord">没有绑定银行卡信息！</div>
            </#if>
            </div>
        </div>
    </div>
    <div class="popGeneral_address" id="popupdiv" style="display:none;">
        <form class="registerform" id="bankCardForm" action="">
            <input type="hidden" id="bankcard_form_id">
            <div class="pop_win aptab_center_address">
                <ul class="newaddress">
                    <li>
                        <label> <strong style="color: red;">*</strong>开户人姓名： </label>
                        <input type="text" id="bankCard_accountName"  name="bankCard.accountName" value="" datatype="s2-20" errormsg="姓名至少2个字符,最多20个字符！" nullmsg="请填写开户人姓名!" class="inputxt has_reset" maxlength="20">
                    </li>
                    <li>
                        <label> <strong style="color:red;">*</strong> 开户行： </label>
                        <span id="selectbank"></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;开户银行所属城市： </label>
                        <span id="">
                            <input type="text" id="bankCard_areaPath" name="bankCard.areaPath"  class="areaSelect hidden" value="" datatype="lSelect" nullmsg="请选择开户行所在城市!" errormsg="请选择完整的数据"/>
                        </span>
                        <span class="form-tip"><span style="color: #ec0202;" id="area_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;分行地址： </label>
                        <input type="text" name="bankCard.branchAddress" id="bankCard_branch"  datatype="*3-128" errormsg="分行地址应为3-128个字符！" nullmsg="请填写分行地址!"  class="inputxt has_reset" style="width: 200px;" />

                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;银行卡号： </label>
                        <input type="text" name="bankCard.bankcardcode" id="bankCard_bankcardcode" datatype="n15-20" ajaxurl="${base}/bankCard/judgeCardExist" errormsg="请输入合法的银行卡号！" nullmsg="请填写银行卡号!"  class="inputxt has_reset" style="width: 200px;" />

                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;余额： </label>
                        <input type="text" name="bankCard.balance" id="bankCard_balance" onkeyup="this.value = floatFormat( this.value,2);" datatype="d" errormsg="请输入大于0的数字！" nullmsg="请填写余额!"  class="inputxt has_reset" style="width: 100px;" />
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;手机号码： </label>
                        <input type="text" value=""  id="bankCard_mobile" name="bankCard.mobile"  class="inputxt mobile has_reset" datatype="m" errormsg="手机号码格式不对！" nullmsg="请填写手机号码!">

                    </li>

                    <li>
                        <label style="float: left;"> <strong style="color: red;">*</strong> 短信验证码： </label>
                        <input id='SMSVerificationCode' name='SMSVerificationCode' type="text" placeholder="短信验证码" ajaxurl="${base}/bankCard/judgeSMSVC" datatype="n6-6" errormsg="请输入6位短信验证码！" nullmsg="请填写短信验证码!" style="width:100px;float: left;padding-right: 103px;" >
                       <#-- <input type="button" id="getSMSVerificationCode" value="获取验证码"  class="hq_yzm_grey">-->
                        <input type="button" id="getSMSVerificationCode" value="获取验证码"  class="hq_yzm" style="float:left;margin-left: -100px;width: 100px;">
                        <span class="form-tip"><span style="color: #ec0202;" id="yzh_div_error"></span></span>
                    </li>
                    <li>
                    <#-- <input type="submit" value="保 存" onclick="save_bankCard()"  class="btn_save  bule_btn" />-->
                        <input type="submit" value="保 存"   class="btn_save  bule_btn" />
                    </li>
                </ul>
            </div>
        </form>
    </div>
</div>
<script src="${base}/static/bec/base/js/Validform_v5.3.2.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>
<script type="text/javascript">
        $(function () {

            $("#bankCardForm").Validform({
                tiptype:4,
                label:".label",
                ajaxPost:true,
                datatype:{
                    "d":function(gets,obj,curform,regxp){
                        if( parseFloat(gets) < 0 ){
                            return false;
                        }else{
                            obj.val( floatFormat(gets, 2));
                            return true;
                        }

                    },
                    "lSelect":function(gets,obj,curform,regxp){
                        if(gets == ''){
                            return false;
                        }
                        if(gets.split(",").length == 1){
                            return false;
                        }
                        var num = $(".lSelect").length;
                        if( num == 2 ){
                            if(gets.split(",").length < 2){
                                return false;
                            }
                        }else if(num == 3){
                            if(gets.split(",").length < 3){
                                return false;
                            }
                        }

                        return true;
                    }
                },
                beforeSubmit:function(){
                    save_bankCard();
                }
            });
        });
</script>

<script type="text/javascript">
    //选择银行
    var expressBankData=[
        {value:"中国银行",text:"中国银行"},
        {value:"建设银行",text:"建设银行"},
        {value:"农业银行",text:"农业银行"},
        {value:"工商银行",text:"工商银行"},
        {value:"民生银行",text:"民生银行"},
        {value:"光大银行",text:"光大银行"},
        {value:"招商银行",text:"招商银行"},
        {value:"北京银行",text:"北京银行"},
        {value:"交通银行",text:"交通银行"},
        {value:"中信银行",text:"中信银行"},
        {value:"西安银行",text:"西安银行"}
    ];
    var jsonStr = JSON.stringify(expressBankData);
    var select = "<select id='bankNamesel'>";
    $.each(expressBankData,function(index, item) {
        select += "<option value ='" + item.value + "'>" + item.text + "</option>";
    });
    select += "</select>";
    $("#selectbank").html(select);
    $(function () {
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function () {
            $parent = $(this).parent();
            if ($parent.hasClass("close")) {
                $parent.removeClass("close");
            } else {
                $parent.addClass("close");
            }
        });
    });
</script>

<script type="text/javascript">
    function use_NewConsignee() {
        // 地区选择菜单
        $(".Validform_checktip").html("");
        $(".Validform_checktip").removeClass("Validform_right");
        $(".Validform_checktip").removeClass("Validform_wrong");
        $(".lSelect").remove();//移除之前生成的
        $(".areaSelect").val("");
        $(".areaSelect").lSelect({
            url: base+"area/ajaxChildren"// Json数据获取url
        });
        $("#bankCard_accountName").val("");
        $("#bankName").val("");
        $("#bankCard_branch").val("");
        $("#bankCard_bankcardcode").val("");
        $("#bankCard_bankcardcode").attr("ajaxurl","${base}/bankCard/judgeCardExist");
        $("#bankCard_mobile").val("");
        $("#SMSVerificationCode").val("");
        index=layer.open({
            type: 1,
            title:'新增银行卡',
            area:["700px","350px"],
            scrollbar:false,
            content: $('#popupdiv') //这里content是一个DOM
        });
        $("#area_div_error").hide();
        $("#yzh_div_error").hide();
        return;
    }
    /**
     * 保存银行卡信息（根据id区分）
     */
    function save_bankCard() {
        if (!check_Consignee("area_div_error")) {//校验地址是否输入正确
            $("#area_div_error").show();
            return;
        };
        /*if(!yzm_check()){
            $("#yzh_div_error").show();
            return;
        };
        if(validateUnique()){//验证银行卡唯一性，如果是true的话，说明存在银行卡，不可以添加银行卡信息
            layer.alert("银行卡信息已经存在,请重新填写");
            return;
        }*/

        //通过验证
        var actionUrl = base+"bankCard/save";
        var bankcard_form_id = $("#bankcard_form_id").val();
        var areaPath = $(".areaSelect").val();
        var areaId = areaPath.substring(areaPath.lastIndexOf(',')+1,areaPath.length);
        var accountName = $("#bankCard_accountName").val();
        var bankName = $("#bankNamesel").val();
        var branch = $("#bankCard_branch").val();
        var bankCardCode = $("#bankCard_bankcardcode").val();
        var balance= $("#bankCard_balance").val();
        var mobile = $("#bankCard_mobile").val();
        var param={"accountName":accountName,"id":bankcard_form_id,"areaId":areaId,"areaPath":areaPath,"bankName":bankName,"mobile":mobile,"branchAddress":branch,"bankcardcode":bankCardCode,"balance":balance};
        $.ajax({
            type : "POST",
            dataType : "json",
            url : actionUrl,
            data : param,
            cache : false,
            async : false,//设置同步
            success: function(data) {
                if(data.status=='success'){
                    layer.alert("保存成功",{icon:1},function(){
                        window.location.reload();
                    });
                }else{
                    layer.alert("保存失败",{icon:2});
                }
            }
        });
        layer.close(index);
    }
    function edit_bankCard(id){
        //清空提示信息
        $("#area_div_error").hide();
        var actionUrl =base + "bankCard/edit";
        $.ajax({
            type : "POST",
            dataType : "json",
            url : actionUrl,
            data : {"bankCardId":id},
            cache : false,
            async : false,//设置同步
            success : function(data) {
                $("#bankcard_form_id").val(data.bankCard.id);
                $("#bankCard_accountName").val(data.bankCard.accountName);
//                $("#bankName").val(data.bankCard.bankName);
                $("#bankCard_branch").val(data.bankCard.branchAddress);
                $("#bankCard_bankcardcode").val(data.bankCard.bankcardcode);
                $("#bankCard_bankcardcode").attr("ajaxurl","${base}/bankCard/judgeCardExist?id=" + data.bankCard.id);
                $("#bankCard_mobile").val(data.bankCard.mobile);
                $("#bankCard_balance").val(data.bankCard.balance);
                $(".areaSelect").val(data.bankCard.areaPath);
                $(".Validform_checktip").html("");
                $(".Validform_checktip").removeClass("Validform_right");
                $(".Validform_checktip").removeClass("Validform_wrong");
            },
            error : function() {
                alert("网络异常，请稍后重试！");
            }
        });

        // 地区选择菜单
        $(".lSelect").remove();//移除之前生成的
        $(".areaSelect").lSelect({
            url: base+"area/ajaxChildren"// Json数据获取url
        });
        index=layer.open({
            type: 1,
            title:'编辑银行卡',
            area:["700px","372px"],
            scrollbar:false,
            content: $('#popupdiv') //这里content是一个DOM
        });
    }
    $("#getSMSVerificationCode").click(function(){
        var mobile = $("#bankCard_mobile").val();
        if(mobile=='' || mobile ==undefined){
            layer.alert("请输入手机号码");
            return;
        }
        $("#getSMSVerificationCode").prop("disabled", true);
        $("#getSMSVerificationCode").removeClass("hq_yzm");
        $("#getSMSVerificationCode").addClass("hq_yzm_grey");
        $.ajax({
            type:"get",
            url:"${base}/bankCard/sendSMSVerificationCode",
            data:"mobile="+$("#bankCard_mobile").val(),
            success:function(data){
                if(data.status=="success"){
                    var secend = 60;
                    var interval = window.setInterval(function(){
                        secend = secend - 1;
                        jQuery("#getSMSVerificationCode").val(secend + 's后重新获取');
                        if(secend == 0){
                            window.clearInterval(interval);
                            jQuery("#getSMSVerificationCode").val('获取验证码');
                            jQuery("#getSMSVerificationCode").prop("disabled", false);
                            $("#getSMSVerificationCode").addClass("hq_yzm");
                        }
                    },1000);

                }else{
                    jQuery("#getSMSVerificationCode").prop("disabled", false);
                    $("#getSMSVerificationCode").addClass("hq_yzm");
                    alert("获取短信验证码失败，请稍后再试!");
                }

            },
            error:function(){
                jQuery("#getSMSVerificationCode").prop("disabled", false);
                $("#getSMSVerificationCode").addClass("hq_yzm");
                alert("获取短信验证码失败，请稍后再试!");
            }
        });
    });
    function showTips(bankCarId){
        layer.confirm('您确定要删除吗？', {icon: 3, title:'温馨提示'}, function(index){
                    delBankCard(bankCarId);
                    layer.close(index);
                },
                function(index){
                    layer.close(index);
                });
    }
    /**
     * 删除银行卡信息
     */
    function delBankCard(id){
        $.ajax({
            type : "POST",
            dataType : "json",
            url : base + "bankCard/delete",
            data : {"bankCardId":id},
            cache : false,
            success: function(data) {
                if (data.status == 'success') {
                    layer.alert("删除成功", {icon: 1}, function () {
                        window.location.href = base + 'bankCard/list';
                    });
                } else {
                    layer.alert("删除失败", {icon: 2});
                }
            }
        });
    }
    function yzm_check(){//验证码校验
        var errorMessage = null;
        $.ajax({
            type:"get",
            url:"${base}/bankCard/checkSMSVerificationCode",
            data:"SMSVerificationCode=" + $("#SMSVerificationCode").val(),
            success:function(data){
                if(data.status=="success"){
                    $("#yzh_div_error").removeClass("message");
                    $("#yzh_div_error").html("");
                    return true;
                }else{
                    $("#yzh_div_error").html(data.message);
                    $("#yzh_div_error").addClass("message");
                    return false;
                }
            },
            error:function(){
                layer.alert("校验短信验证码失败，请稍后再试!",{icon:7});
                return false;
            }
        });

    }
    function check_Consignee(divId) {
        var errorFlag = false;
        var errorMessage = null;
        var value = $(".areaSelect").val();
        if (divId == "area_div_error") {
            value = $(".areaSelect").val();
            if (isEmpty(value)) {
                errorFlag = true;
                errorMessage = "请您选择完整的地区信息";
            } else {
                if($(".lSelect").size()>value.split(",").length){
                    errorFlag = true;
                    errorMessage = "请您选择完整的地区信息";
                }
            }
        }
        if (errorFlag) {
            $("#" + divId ).html(errorMessage);
            $("#" + divId).addClass("message");
            return false;
        } else {
            $("#" + divId).removeClass("message");
            $("#" + divId).html("");
        }
        return true;
    }
    /**
     * Desc:根据开户行名称或银行卡号查询银行卡信息
     * */
    function searchBankCard(){
        var bankName = $("#bankName").val();
        var bankcardcode = $("#bankcardcode").val();
        var accountName = $("#accountName").val();
        window.location="${base}/bankCard/list?bankName="+bankName+"&bankcardcode="+bankcardcode+"&accountName="+accountName;
    }
    /**
     * 验证银行卡的唯一性
     */
    function validateUnique(){
        $.ajax({
            type : "POST",
            dataType : "json",
            url : base + "bankCard/isExist",
            data : {"bankcardcode":$("#bankCard_bankcardcode").val()},
            cache : false,
            success: function(data) {
                alert(data.status);
                if (data.status == true) {
                    return true;
                } else {
                    layer.alert("验证失败", {icon: 2});
                    return false;
                }
            }
        });
    }

</script>
<#include "bec/ghdj/service.ftl"/>
<#include "bec/ghdj/foot.ftl"/>

