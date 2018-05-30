<#escape x as x?html>
    <#include "bec/ghdj/header.ftl"/>
    <#include "bec/ghdj/top4.ftl"/>
<style type="text/css">
    .list-pay li {
        height:60px;
        width: 168px;
        float:left;
        border: 1px solid #FBE7B3;
        background-color: #ffffff;
        margin-left: 20px;
        padding-left: 20px;
        padding-right: 20px;
        zoom: 1;
       /* border: 3px solid transparent;*/
        cursor: pointer;
    }
</style>
<#--<div class="content  header clearfix">

    <div class="progress clearfix">
        <ul class="progress-1">
            <li class="step-1"><b></b>1.选择支付方式</li>
            <li class="step-2">2.核对支付信息</li>
            <li class="step-3">3.支付信息结果</li>
        </ul>
    </div>
    <div class="clr"></div>
</div>-->


<div class="content">
    <div class="orderbody">
        <form class="mui-input-group" id="paymentInfo" method="POST" action="${base}/account/rechargeInto">

            <div class="row">
                <label>支付方式：</label>
               <span class="bzj_info">
                <div class="list-pay">
                    <#list payTypeList as payType>
                        <li index="${payType_index}" class="con-li" style="line-height: 40px;>
                                    <div class="item">
                        <input type="radio" style="margin-left: 15px; margin-top: 22px;" value="${payType["sign"]}" class="radio" name="payType" <#if payType_index==0>checked</#if>>
                        <label style="width: 120px; float: none; padding: 0; padding-left: 3px;"><img width="110" height="25" alt="${payType["name"]}" src="${base}/static/img/${payType["logo"]}"></label>
                    </#list>
                </div>
              </span>
            </div>
            <div style="margin-top: 20px; margin-bottom: 20px;">
                <label>充值金额：</label><input id='czje' style="padding: 5px 0; height:20px;" name='account' type="text" placeholder="请输入充值金额" >
            </div>
        </form>
    </div><!--orderbody end-->
    <div class="banking" style="margin-bottom: 20px;">
        <div class="btns">
            <input type="button"  class="input_style on" id="btnNext"  value="下一步">
        </div>
    </div>
    <div class="clr"></div>
</div>
    <#include "bec/ghdj/service.ftl"/>
    <#include "bec/ghdj/foot.ftl"/>
<script type="text/javascript">
    $(document).ready(function(){
        $("#btnNext").click(function (){
            var czje=$("#czje").val();
            if(checkPrice(czje)){
                if(czje<=0){
                    layer.alert("请输入大于0的数值")
                }else{
                    if(czje>99999999.99){
                        layer.alert("输入金额必须是介于0.01-99999999.99之间的数字，且小数点后最多有两位");
                        return;
                    }else{
                        $("#paymentInfo").submit();
                    }

                }
            }else{
                layer.alert("输入金额必须是介于0.01-99999999.99之间的数字，且小数点后最多有两位");
            }
        });

    });
    function checkPrice(price){
        return (/^(([1-9]\d*)|\d)(\.\d{1,2})?$/).test(price.toString());
    }
    $(".list-pay>li").click(function (){
        $this=$(this);
        $this.addClass("select");
        $this.siblings().removeClass("select");
    });
    $(".con-li").click(function(){
        $(':input',this)[0].checked = true;
    });
</script>
</#escape>