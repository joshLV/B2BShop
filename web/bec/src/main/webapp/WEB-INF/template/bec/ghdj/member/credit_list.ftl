<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<style type="text/css">
    .fore0ss .filter_div {
        position: relative;
        margin-right: 5px;
        width:auto;
        /* width: 225px; */
        float: left;
        border: 1px solid #e7e3e7;
        height: 33px;
        line-height: 33px;
        margin-top: 4px;
    }
</style>
<div id="container">
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/credit/list">资产中心</a></strong><span>&nbsp;&gt;&nbsp;授信申请</span>
        </div>
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="credit_list"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>授信管理</em></h1>
            <div class="fore0ss" style="border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8;">
                <div style="position: relative; left:10px; z-index: 30;">
                    <div class="filter_div">
                        <select id="creditStatus" class="filter_input">
                            <option value="">全部</option>
                            <option value="applying"  <#if '${status}'== 'applying'>selected </#if> >授信申请中</option>
                            <option value="success" <#if '${status}'== 'success'>selected </#if> >授信成功</option>
                            <option value="fail" <#if '${status}'== 'fail'>selected </#if> >授信失败</option>
                        </select>
                    </div>
                    <div style="float: left; margin-top: 3px;">
                    开始日期: <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="startDate" name="startDate" value="${startDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})"  required><em class="bing-less"></em>
                    结束日期: <input readonly class="go-input-datepicker_po gmt-receive_po" type="text" id="endDate" name="endDate" value="${endDate}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startDate\',{d:+1})}'})"  required><em class="bing-less"></em>&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                        <input id="button_show" class="btn-5-new_po"  type="button" onclick="searchCredit();" value="查询" />
                </div>
            </div>
            <div class="user_right p10">
                <div class="tb-void">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <th width="80">申请额度</th>
                            <th width="50">财务联系人</th>
                            <th width="170">企业描述</th>
                            <th width="120">申请时间</th>
                            <th width="80">申请状态</th>
                            <th width="100">操作</th>
                        </tr>
                            <#if creditList?? && creditList?size &gt; 0 >

                                <#list creditList as list>
                                <tr>

                                    <td width="80">${list.applyAmount}</td>
                                    <td width="170">${list.contacts}</td>
                                    <td width="100"><input type="hidden" value="${list.compDesc}" id="detail_"+${list.creditId}><#if list.compDesc?length lt 10> ${list.compDesc}<#else>${list.compDesc[0..10]}...</br><a style="color: #0000ff" onclick="moreDetail('${list.creditId}');">查看更多</a></#if></td>
                                    <td width="120">${(list.applyTime?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                    <td width="80">
                                        <#if '${list.status}'== 'applying'><font color="#999999"><b>授信申请中...</b></font></#if>
                                        <#if '${list.status}'== 'success'><font color="green"><b>授信成功</b></font></#if>
                                        <#if '${list.status}'== 'fail'><font color="fail"><b>授信失败</b></font></#if>
                                    </td>
                                    <td width="100">
                                        <#if '${list.status}'== 'applying'>
                                            <#--<input class="btn-5ss" type="button" value="编辑" onclick="editCredit('${list.id}');">
                                            <input class="btn-5ssr" type="button" value="删除" onclick="deleteCredit('${list.id}');">-->
                                            <input class="btn-5ssr" type="button" value="查看申请信息" onclick="lookDetail('${list.id}');">
                                        </#if>
                                        <#if '${list.status}'== 'success'>
                                            <input class="btn-5ssr" type="button" value="查看授信信息" onclick="getCreditReplyDetail('${list.id}','${list.replyId}');">
                                        </#if>
                                        <#if '${list.status}'== 'fail'>
                                            <input class="btn-5ssr" type="button" value="查看失败详情" onclick="getCreditFailDetail('${list.remark}');">
                                            <input class="btn-5ssr sx_delete" type="button" value="删除" onclick="deleteCredit('${list.id}');">
                                        </#if>
                                    </td>
                                </tr>
                                </#list>
                            <#else>
                            <tr>
                                <td colspan="4">
                                    <div class="nocont-box nocont-order">
                                        <b class="icon-order"></b>你还没有添加授信申请记录！
                                    </div>
                                </td>
                            </tr>
                            </#if>
                        </tbody>
                    </table>

                </div>
                <div style="margin-left: 10px; width: 99%; margin-top: 10px; float: left;">
                    <input class="btn-5-new" type="button" value="+ 授信申请" onclick="newCredit();">
                <#--<input class="btn-5-del" type="button" value="删 除" onclick="onsub();">-->
                </div>
                <div class="mymoney_pages f-cb" >
                    <div class="pagin fr">
                        <#if pager!false && pager.list?size &gt; 0>
                            <#import "bec/ghdj/pager.ftl" as p>
                            <@p.pager pager = pager baseUrl = "/credit/list" />
                        <#else>
                            <div class="noRecord">你还没有添加授信申请记录！</div>
                        </#if>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<div class="popGeneral_address" id="popupdiv" style="display:none;">
    <form name="reg1" id="reg1" action="" method="post">
        <input type="hidden" name="id" id="credit_id">
        <div class="pop_win aptab_center_address">
            <ul class="newaddress">
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;申&nbsp;&nbsp;&nbsp;&nbsp;请&nbsp;&nbsp;&nbsp;&nbsp;额&nbsp;&nbsp;&nbsp;&nbsp;度： </label>
                    <input type="text" class="has_reset" id="credit_applyAmount" name="applyAmount" value="" style="width:200px;"
                           onkeyup="this.value = floatFormat( this.value, 0 );"
                           onafterpaste="this.value = floatFormat(this.value, 0  );"
                           nullmsg="请输入申请额度!" errormsg="不能输入小数,非数字类型的数据,输入数字的范围为1到99999999之间的数字!">&nbsp;&nbsp;元
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;财&nbsp;&nbsp;务&nbsp;&nbsp;联&nbsp;&nbsp;系&nbsp;&nbsp;人： </label>
                    <input type="text"  class="has_reset" id="credit_contacts" name="contacts" value="" style="width:200px;" datatype="zh2-4" nullmsg="请填写财务联系人!">
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;联&nbsp;&nbsp;系&nbsp;&nbsp;人&nbsp;&nbsp;手&nbsp;&nbsp;机： </label>
                    <input type="text"  class="has_reset" id="credit_mobile"  name="mobile" value="" class="inputxt" style="width: 200px;" datatype="m" nullmsg="请填写手机号码!" errormsg="手机号码格式不正确!">
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;企&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;描&nbsp;&nbsp;&nbsp;&nbsp;述： </label>
                    <textarea tip="这里输入企业描述" datatype="*10-10000" errormsg="请输入10到1000个字符" altercss="gray" class="gray"  id="credit_compDesc" name="compDesc" nullmsg="请填写企业描述!" style="border-color:#CCCCCC #999999 #999999 #CCCCCC;border-style:solid;border-width:1px;font-family:arial,sans-serif;font-size:13px;height:160px;margin:2px auto;padding:2px;width:630px;"></textarea>
                </li>
                <li>
                    <input type="submit" value="保 存"   class="btn_save  bule_btn" />
                </li>
            </ul>
        </div>
    </form>
</div>
<div class="popGeneral_address" id="popupdivE" style="display:none;overflow: hidden;">
    <form name="reg1" id="reg1E" action="" method="post">

        <div class="pop_win aptab_center_address">
            <ul class="newaddress">
                <li>
                    <label> &nbsp;申&nbsp;&nbsp;&nbsp;&nbsp;请&nbsp;&nbsp;&nbsp;&nbsp;额&nbsp;&nbsp;&nbsp;&nbsp;度： </label>
                    <input type="text"  id="credit_applyAmountE" name="applyAmount" value="" style="width:200px;" >元(单位)
                </li>
                <li>
                    <label> &nbsp;财&nbsp;&nbsp;务&nbsp;&nbsp;联&nbsp;&nbsp;系&nbsp;&nbsp;人： </label>
                    <input type="text"  id="credit_contactsE" name="contacts" value="" style="width:200px;" datatype="zh2-4" >
                </li>
                <li>
                    <label> &nbsp;联&nbsp;&nbsp;系&nbsp;&nbsp;人&nbsp;&nbsp;手&nbsp;&nbsp;机： </label>
                    <input type="text" id="credit_mobileE"  name="mobile" value="" class="inputxt" style="width: 200px;" >
                </li>
                <li>
                    <label> &nbsp;企&nbsp;&nbsp;&nbsp;&nbsp;业&nbsp;&nbsp;&nbsp;&nbsp;描&nbsp;&nbsp;&nbsp;&nbsp;述： </label>
                    <textarea  datatype="s" altercss="gray" class="gray"  id="credit_compDescE" name="compDesc" style="border-color:#CCCCCC #999999 #999999 #CCCCCC;border-style:solid;border-width:1px;font-family:arial,sans-serif;font-size:13px;height:160px;margin:2px auto;padding:2px;width:630px;"></textarea>
                </li>

            </ul>
        </div>
    </form>
</div>
<#--针对授信成功后  对授信额度范围内 申请放款操作-->
<div class="popGeneral_address" id="popupdiv_loan" style="display:none;overflow: hidden;">
    <form name="loan" id="credit_loan" action="" method="post">
        <input type="hidden" id="replyId" name="replayId">
        <div class="pop_win aptab_center_address" >
            <#--<ul class="newaddress">
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;申&nbsp;&nbsp;&nbsp;请&nbsp;&nbsp;&nbsp;额&nbsp;&nbsp;&nbsp;度： </label>
                    <input type="text"  id="credit_applyAmount" name="applyLoanAmount" value="" style="width:200px;" datatype="n" nullmsg="请输入申请额度!" errormsg="输入类型错误!">
                </li>
                <li>
                    <input type="submit" value="保 存"   class="btn_save  bule_btn" />
                </li>
            </ul>-->
        </div>
    </form>
</div>
<#--针对授信成功后  对授信额度范围内 申请放款操作-->
<div class="popGeneral_address" id="popupdiv_creditFail" style="display:none;overflow: hidden;">
        <div class="pop_win aptab_center_address check_xq" style="width: auto;"></div>
</div>
<#--查看更多公司详细信息介绍-->
<div class="popGeneral_address" id="popupdiv_moredetail" style="display:none; ">
    <div class="pop_win aptab_center_address" style="width: auto;" id="content_detail">
    </div>
</div>
<script src="${base}/static/bec/base/js/Validform_v5.3.2.js" type="text/javascript"></script>
<script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        /**
         * 验证form表单中的各个值
         * */
        $("#reg1").Validform({
            tiptype:4,
            label:".label",
            ajaxPost:true,
            rules: {
                number: {
                    required: true,
                    range: [1, 1000]
                }
            },
            beforeSubmit:function(){
                var credit_applyAmount = $("#credit_applyAmount").val();
                if(parseInt(credit_applyAmount)<1){
                    layer.alert("【申请额度】不能小于0",{icon:2});
                    return false;
                }
                var  credit_id = $("#credit_id").val();
                var submitUrl = '';
                if(isEmpty(credit_id)){
                    submitUrl = ${base}/+"credit/save?r=" + Math.random();
                }else{
                    submitUrl = ${base}/+"credit/update?r=" + Math.random();
                }
                $("#reg1").attr("action",submitUrl);

            },
            callback:function(data){
                layer.closeAll();
                if(data.status=='success'){
                    layer.alert("创建成功!",{icon:7});
                    window.location="${base}/credit/list";
                }else{
                    layer.alert(data.message,{icon:2});
                }
            }
        });
        //申请放款表单验证和提交
        $("#credit_loan").Validform({
            tiptype:4,
            label:".label",
            ajaxPost:true,
            datatype:{

            },
            beforeSubmit:function(){
               var submitUrl = ${base}/+"creditLoanLog/save?r=" + Math.random();
                $("#credit_loan").attr("action",submitUrl);
            },
            callback:function(data){
                layer.closeAll();
                if(data.status=='success'){
                    layer.alert("放款申请成功!",{icon:7});
                    window.location="${base}/credit/list";
                }else{
                    layer.alert(data.message,{icon:2});
                }
            }
        });
    });

    /**
     * Desc:新增授信申请弹出DIV
     * */
    function newCredit() {
        $("#reg1 div ul input").each(function() {
            $(this).removeClass("Validform_error");
        });

        $("#reg1 div ul li span").each(function() {
            $(this).removeClass("Validform_wrong");
            $(this).removeClass("Validform_right");
            var textVal = $(this).find(".Validform_checktip");
            textVal.text('');
            /*var th = $(this);
            debugger;
            if(textVal!="✖" && textVal!=null && textVal!=""){
                $(this).text('');
            };*/
        });

        $('#reg1')[0].reset();
        layer.open({
            type: 1,
            title:'新增授信申请',
            area:["700px","500px"],
            scrollbar:false,
            content: $('#popupdiv') //这里content是一个DOM
        });
    }

    /**
     * Desc:点击编辑操作员 获取操作员数据
     * */
    function editCredit(id){
        $("#reg1 div ul input").each(function() {
            $(this).removeClass("Validform_error");
        });

        $("#reg1 div ul span").each(function() {
            $(this).removeClass("Validform_wrong");
            $(this).removeClass("Validform_right");
            $(this).text('');
        });
        if(!isEmpty(id)){
            $("#credit_applyAmount").val('');
            $("#credit_mobile").val('');
            $("#credit_contacts").val('');
            $("#credit_compDesc").val('');
            $("#credit_id").val('');
            var actionUrl =${base}/+"credit/edit";
            $.ajax({
                type : "POST",
                dataType : "json",
                url : actionUrl,
                data : {"creditId":id},
                cache : false,
                async : false,//设置同步
                success : function(data) {
                    $("#credit_applyAmount").val(data.credit.applyAmount);
                    $("#credit_mobile").val(data.credit.mobile);
                    $("#credit_contacts").val(data.credit.contacts);
                    $("#credit_compDesc").val(data.credit.compDesc);
                    $("#credit_id").val(data.credit.id);
                },
                error : function(XMLHttpResponse) {
                    alert("网络异常，请稍后重试！");
                }
            });

            $("#reg1_edit div ul input").each(function() {
                $(this).removeClass("Validform_error");
            });

            $("#reg1_edit div ul span").each(function() {
                $(this).removeClass("Validform_wrong");
                $(this).text('');
            });
            layer.open({
                type: 1,
                title:'编辑授信申请',
                area:["700px","350px"],
                scrollbar:false,
                content: $('#popupdiv') //这里content是一个DOM
            });

        }else{
            layer.alert("编辑失败!",{icon:2});
        }
    }

    function lookDetail(id){
        if(!isEmpty(id)){
            $("#credit_applyAmount").val('');
            $("#credit_mobile").val('');
            $("#credit_contacts").val('');
            $("#credit_compDesc").val('');
            $("#credit_id").val('');
            var actionUrl =${base}/+"credit/edit";
            $.ajax({
                type : "POST",
                dataType : "json",
                url : actionUrl,
                data : {"creditId":id},
                cache : false,
                async : false,//设置同步
                success : function(data) {
                    $("#credit_applyAmountE").val(data.credit.applyAmount);
                    $("#credit_mobileE").val(data.credit.mobile);
                    $("#credit_contactsE").val(data.credit.contacts);
                    $("#credit_compDescE").val(data.credit.compDesc);
                },
                error : function(XMLHttpResponse) {
                    alert("网络异常，请稍后重试！");
                }
            });
            $("#credit_applyAmountE").attr("disabled",true);
            $("#credit_mobileE").attr("disabled",true);
            $("#credit_contactsE").attr("disabled",true);
            $("#credit_compDescE").attr("disabled",true);
            layer.open({
                type: 1,
                title:'查看授信申请',
                area:["700px","500px"],
                scrollbar:false,
                content: $('#popupdivE') //这里content是一个DOM
            });

        }else{
            layer.alert("查看失败，请联系管理员!",{icon:2});
        }
    }
    /**
     * Desc:删除操作员
     * */
    function deleteCredit(id){
        if(!isEmpty(id)){
            layer.confirm('您确定要删除吗？', {icon: 3, title:'温馨提示'}, function(index){

                        $.ajax( {
                            type : "POST",
                            dataType : "json",
                            url : ${base}/+ "credit/delete",
                            data : {"creditId":id},
                            cache : false,
                            success : function(data) {
                                if(data.status=="success"){
                                    layer.alert("删除成功!",{icon:7});
                                    window.location="${base}/credit/list";
                                }
                            },
                            error : function(XMLHttpResponse) {
                                alert("网络异常，请稍后重试！");
                            }
                        });

                        layer.close(index);
                    },
                    function(index){
                        layer.close(index);
                    });
        }else{
            layer.alert("删除失败!",{icon:2});
        }
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
    /**
     *获取申请放款银行列表
     * @param id
     */
    function getCreditReplyDetail(id,replyId){
        $("#popupdiv_loan .pop_win.aptab_center_address").empty();
            $.ajax({
                type : "GET",
                dataType : "json",
                url : ${base}/+ "creditLoanLog/getCreditReply",
                data : {"replyId":replyId},
                cache : false,
                async : false,//设置同步
                success : function(data) {
                   var creditReply = data.creditReply;
                   var ulElement = "<ul class='newaddress'><li style='height:18px'><label> <strong style='color: blue;letter-spacing:5px;font-size: larger'>&nbsp;授信银行名称:</strong><font style='font-size: larger'>"+creditReply.bankName+"</font></label></li>"
                                   +"<li style='height:18px'><label> <strong style='color: blue;letter-spacing:5px;font-size: larger'>&nbsp;分行或支行:</strong><font style='font-size: larger'>"+creditReply.bankDept+"</font></label></li>"
                                 +"<li style='height:18px'><label> <strong style='color: blue;letter-spacing:5px;font-size: larger'>&nbsp;银行利率:</strong><font style='font-size: larger'>"+creditReply.bankrate+"%</font></label></li>"
                               +"<li style='height:18px'><label> <strong style='color: blue;letter-spacing:5px;font-size: larger'>&nbsp;授信金额:</strong><font style='font-size: larger'>"+creditReply.creditAmount+"【元】</font></label></li>"

                           +"<li style='height:18px'><label> <strong style='color: blue;letter-spacing:5px;font-size: larger'>&nbsp;授信起始日期:</strong><font style='font-size: larger'>"+creditReply.creditStart+"</font></label></li>"
                           +"<li style='height:18px'><label> <strong style='color: blue;letter-spacing:5px;font-size: larger'>&nbsp;授信结束日期:</strong><font style='font-size: larger'>"+creditReply.creditEnd+"</font></label></li>"

                            +"<li style='height:18px'><label> <strong style='color: blue;letter-spacing:5px;font-size: larger'>&nbsp;累计已放款金额:</strong><font style='font-size: larger'>"+creditReply.totalAmount+"【元】</font></label></li>"
                            +"<li style='height:18px'><label> <strong style='color: blue;letter-spacing:5px;font-size: larger'>&nbsp;可用剩余金额:</strong><font style='font-size: larger'>"+creditReply.surplusAmount+"【元】</font></label></li></ul>";
                    $("#popupdiv_loan .pop_win.aptab_center_address").prepend($(ulElement));
                },
                error : function() {
                    alert("网络异常，请稍后重试！");
                }
            });
            $("#replyId").val(replyId);
            $("#credit_loan div ul input").each(function() {
                $(this).removeClass("Validform_error");
            });

            $("#credit_loan div ul span").each(function() {
                $(this).removeClass("Validform_wrong");
                $(this).text('');
            });

            layer.open({
                type: 1,
                title:'授信信息',
                area:["700px","500px"],
                scrollbar:false,
                content: $('#popupdiv_loan') //这里content是一个DOM
            });
        }
    /**
     * Desc:根据用申请状态或申请时间查询授信申请
     * */
    function searchCredit(){
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        var status = $("#creditStatus").val();
        window.location="${base}/credit/list?startDate="+startDate+"&endDate="+endDate+"&status="+status;
    }
    /**
     * 查看失败原因
     */
    function getCreditFailDetail(remark){
        $("#popupdiv_creditFail .pop_win.aptab_center_address").empty();
        $("#popupdiv_creditFail .pop_win.aptab_center_address").append('失败原因：'+remark);
        layer.open({
            type: 1,
            title:'失败详情',
            area:["300px","150px"],
            scrollbar:false,
            content: $('#popupdiv_creditFail') //这里content是一个DOM
        });
    }
    function moreDetail(creditId){
        var compDesc = $("#detail_"+creditId).val();
        $("#content_detail").text(compDesc);
        layer.open({
            type: 1,
            title:'企业描述',
            area:["700px","120px"],
            scrollbar:false,
            content: $('#popupdiv_moredetail') //这里content是一个DOM
        });
    }
</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>