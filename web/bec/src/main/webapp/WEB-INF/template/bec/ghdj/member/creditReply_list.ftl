<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
<div id="container">
    <#include "bec/ghdj/top.ftl"/>
    <div class="main f-cb">
        <div class="breadcrumbs">
            <strong>您当前的位置：<a href="${base}/member/index.html">会员中心</a> > <a href="${base}/credit/list">资产中心</a></strong><span>&nbsp;&gt;&nbsp;放款申请</span>
        </div>
        <div class="member_left">
            <#import "bec/ghdj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="creditReply_list"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>放款申请</em></h1>
            <div class="user_right p10">
                <div class="tb-void">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <th width="80" rowspan="2">银行名称</th>
                            <th width="120" rowspan="2">对应分行</th>
                            <th width="120" rowspan="2">利率%</th>
                            <th width="50" rowspan="2">授信金额(元)</th>
                            <th width="100" rowspan="2">累计已放款<br>金额(元)</th>
                            <th width="80" rowspan="2">已用金额(元)</th>
                            <th width="50" rowspan="2">申请金额(元)</th>
                            <th width="160" colspan="2">授信日期</th>
                            <th width="180" rowspan="2">操作</th>
                        </tr>
                        <tr>
                            <th width="80">起</th>
                            <th width="80">止</th>
                        </tr>
                            <#if creditReplyList?? && creditReplyList?size &gt; 0 >
                                <#list creditReplyList as list>
                                <tr>
                                    <td width="80">${list.bankName}</td>
                                    <td width="120">${list.bankDept}</td>
                                    <td width="120">${list.bankrate}</td>
                                    <td width="50">${list.creditAmount}</td>
                                    <td width="100">${list.totalAmount}</td>
                                    <td width="100">${list.usedAmount}</td>
                                    <td width="50">
                                        <input class="sq_money has_reset" type="text" id="apply_${list.replyId}" name="applyLoanAmount" value="${list.residualCredit}"
                                               onkeyup="this.value = floatFormat( this.value, 0, '${list.residualCredit}' );"
                                               onafterpaste="this.value = floatFormat(this.value, 0 , '${list.residualCredit}' );">
                                    </td>
                                    <td width="80">${(list.creditStartDate?string("yyyy-MM-dd"))!}</td>
                                    <td width="80">${(list.creditEndDate?string("yyyy-MM-dd"))!}</td>
                                    <td width="180">
                                        <#if '${list.loanStatus}'== '0'>
                                            <#if '${list.isValid}'== 'false'>
                                                <input  disabled="disabled" class ="fk_button" title="当前不在授信日期范围之内" type="button" value="申请放款" >
                                            <#elseif '${list.creditAmount}' == '${list.totalAmount}'>
                                                <input  disabled="disabled" class ="fk_button" title="授信金额已经申请完" type="button" value="申请放款">
                                            <#else>
                                                <input class ="btn-5ss" title="申请放款" type="button" value="申请放款"  onclick="submitCreditReply('${list.replyId}','${list.creditAmount}','${list.totalAmount}','apply_${list.replyId}');">
                                            </#if>
                                        <#else>
                                            <#--<input class="btn-5ss" type="button" value="申请中...">--><div class="sq_status" >申请中...</div>
                                        </#if>

                                        <input class="btn-5ssr" type="button" value="放款信息" onclick="lookLoanDetail('${list.replyId}')">
                                    </td>
                                </tr>
                                </#list>

                            </#if>
                        </tbody>
                    </table>

                </div>

                <div class="mymoney_pages f-cb" >
                    <div class="pagin fr">
                        <#if pager!false && pager.list?size &gt; 0>
                            <#import "bec/ghdj/pager.ftl" as p>
                            <@p.pager pager = pager baseUrl = "/creditLoanLog/getCreditReplyList" />
                        <#else>
                            <div class="noRecord">你还没有放款申请记录！</div>
                        </#if>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="${base}/static/bec/base/js/Validform_v5.3.2.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {

        $("#reg1").Validform({
            tiptype:4,
            label:".label",
            ajaxPost:true,
            datatype:{

            },
            beforeSubmit:function(){
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

    });

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
    function submitCreditReply(replyId,creditTotal,totalAmount,inputId){
        var applyAmount = $("#"+inputId).val();
        if (isNaN(applyAmount)) {
        　layer.alert("请输入数字!",{icon:2});
            $("#"+inputId).focus();
　　　　   return false;
　　     }
        var total = parseInt(creditTotal);
        var shenyu = total-parseInt(totalAmount);
        if(parseInt(applyAmount)>shenyu){
            layer.alert("此次申请金额不能大于剩余授信金额!",{icon:2});
            $("#"+inputId).focus();
　　　　   return false;
        }
        if(parseInt(applyAmount)<1){
            layer.alert("申请金额不能小于0!",{icon:2});
            $("#"+inputId).focus();
　　　　   return false;
        }
        if(!isEmpty(replyId)){
            if(!isEmpty(applyAmount)){
               $.ajax({
                    type : "POST",
                    dataType : "json",
                    url : ${base}/+"creditLoanLog/save",
                    data : {"replyId":replyId,"applyLoanAmount":applyAmount},
                    cache : false,
                    async : false,//设置同步
                    success : function(data) {
                        layer.alert(data.message,{icon:7},function(){
                            window.location.reload();
                        });

                    },
                    error : function() {
                        layer.alert("网络异常，请稍后重试！");
                    }
                });
            }else{
                layer.alert("申请金额不能为空!",{icon:2});
            }
        }else{
            layer.alert("申请失败!",{icon:2});
        }
    }

    function lookLoanDetail(replyId){
        var openUrl = ${base}/+"creditLoanLog/getLoanHistory?replyId="+replyId;
        window.open(openUrl);
        //window.location.href= ${base}/+"creditLoanLog/getLoanHistory?replyId="+replyId;
    }
</script>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
</#escape>