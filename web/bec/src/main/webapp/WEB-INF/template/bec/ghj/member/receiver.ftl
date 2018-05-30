<#escape x as x?html>
    <#include "bec/ghj/header.ftl"/>

<style type="text/css">
    .Validform_wrong {
        background: none;
    }
</style>

<div id="container" class="f-cb">
        <#include "bec/ghj/top.ftl"/>
    <div class="main">
        <div class="breadcrumbs">
            <span>您当前的位置：</span><strong><a href="${base}/member/index.html">会员中心</a> > <a href="${base}/member/info.html">账户中心</a></strong><span>&nbsp;&gt;&nbsp;收货地址<span></span></span>
        </div><!--breadcrumb end-->
        <div class="member_left">
            <#import "bec/ghj/member/leftmenu.ftl" as leftmenu>
            <@leftmenu.menu id="memberReceiver"/>
            <!--leftMenu end-->
        </div>
        <div class="zyf_xunjia_list2">
            <h1><em>收货地址</em></h1>
            <div class="user_right">
                <div class="columnright">
                    <div class="mod_address_book">
                        <div id="addressListDiv" class="addressListDiv">
                            <input type="hidden" value="1" id="size">
                            <input type="hidden" id="addressNum_top" value="${receiverList?size}">
                            <ul class="adr_list adr_member" id="consignee-list">
                                <#list receiverList as receiver>
                                    <li class="<#if receiver.isDefault==1>address_on hover_li</#if> " id = "consignee_radio_${receiver.id}" onclick="chooseCurrAddress('${receiver.id}')" isDefault="<#if receiver.isDefault==1>true<#else>false</#if>">
                                        <p class="using_add"> 默认地址 </p>
                                        <div class="vcard">
                                            <p> <strong>${receiver.name} </strong>&nbsp;&nbsp;&nbsp;收 </p>
                                            <p class="adr"> <span class="street-address"> <strong class="locality"> ${receiver.areaName} </strong> <span class="street-address">${receiver.address}</span> </p>
                                            <p class="tel">  ${receiver.mobile}&nbsp;&nbsp;&nbsp;&nbsp;${receiver.phone}</p>
                                        <#--<p >  ${receiver.email} </p>-->
                                            <p > ${receiver.zipCode} </p>
                                        </div>
                                        <div  class="edit_box clearfix">
                                            <button class="del_adr" title="删除地址" onClick="showTips('${receiver.id}');"> 删除 </button>
                                            <a class="aBlu btn_edit" href="javascript:void(0)" id="show" onClick="show_ConsigneeDetail('${receiver.id}')">编辑</a>
                                            <#if receiver.isDefault==1>
                                                <a id="addrDefault" class="btn_set_common" href="javascript:void(0)" onClick="setDefault('${receiver.id}')">默认地址</a>
                                            <#else>
                                                <a class="btn_set_common" onClick="setDefault('${receiver.id}')" href="javascript:void(0)">设为默认地址</a></div>
                                            </#if>
                                        <div class="tips_del" id="tips_${receiver.id}">
                                            <p class="txt"> 确认删除该收货地址吗？ </p>
                                            <div class="btn_box">
                                                <button onClick="delReceiver('${receiver.id}')" class="btn_sure"> <span>确认</span> </button>
                                                <button class="btn_cancle" onClick="hideTips('${receiver.id}');"> <span>取消</span> </button>
                                            </div>
                                        </div>
                                    </li>
                                </#list>
                                <li type="2" id="address_list_li_3" class="li_add_addr add_adr saveAddress last" isDefault="false">
                                    <p> <a class="btn_add_addr"  href="javascript:void(0)" id="show" onClick="use_NewConsignee()"><i>&nbsp;</i>添加新收货地址</a> </p>
                                    <div class="tips_care" id="tips_full_2">
                                        <p> 地址已满10条，无法再添加新地址 </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="popGeneral_address" id="popupdiv" style="display:none;">
        <form class="registerform" onsubmit="">
            <input type="hidden" id="consignee_form_id">
            <input type="hidden" id="isReceiverSubmit" value="false">
            <div class="pop_win aptab_center_address">
                <ul class="newaddress">
                    <li>
                        <label> <strong style="color: red;">*</strong> 收&nbsp;&nbsp;货&nbsp;&nbsp;人： </label>
                        <input type="text" id="consignee_name"  name="consigneeParam.name" value="" class="inputxt zhname" datatype="zh2-4">
                        <span class="form-tip"><span style="color: #ec0202;" id="name_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;收货城市： </label>
                        <span id="span_area"><input type="text" name="receiver.areaPath" class="areaSelect hidden" value=""/></span>
                        <span class="form-tip"><span style="color: #ec0202;" id="area_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;详细地址： </label>
                        <input type="text" name="consigneeParam.address" id="consignee_address" maxlength="30"  class="inputxt" datatype="*5-60" style="width: 398px;" nullmsg="请填写详细地址！" />
                        <span class="form-tip"><span style="color: #ec0202;" id="address_div_error"></span></span>
                    </li>
                    <li>
                        <label> <strong style="color: red;">*</strong>&nbsp;手机号码： </label>
                        <input type="text" value=""  id="consignee_mobile" name="consigneeParam.mobile"  class="inputxt mobile"  ignore="ignore" >
                        &nbsp;<span style="color: #333333">或 &nbsp; 固定电话：</span>
                        <input type="text" value=""  id="consignee_phone" name="consigneeParam.phone" class="inputxt tel"  >
                        <span class="form-tip"><span style="color: #ec0202;" id="call_div_error"></span></span>
                    </li>
                    <#--<li>-->
                        <#--<label> <strong style="color:#fff;">*</strong> 固定电话： </label>-->
                        <#--<input type="text" value=""  id="consignee_phone" name="consigneeParam.phone" class="inputxt tel"  >-->
                        <#--<span class="form-tip"><span style="color: #ec0202;" id="call_div_error"></span></span>-->
                    <#--</li>-->
                    <li style="display: none" class="setDefaultAddressLi" id="setDefaultAddressLi">
                        <label for="set_normal" class="label_set_normal">
                            <input type="checkbox" value="1" name="addressInfo.addressType" class="set_normal" id="set_normal">
                            设为默认地址 </label>
                    </li>
                    <#--<li>-->
                        <#--<label> <strong style="color:#fff;">*</strong> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱： </label>-->
                        <#--<input type="text" maxlength="30" value="" id="consignee_email" name="consigneeParam.email" style="width:200px;">-->
                    <#--</li>-->
                    <li>
                        <label> <strong style="color:#fff;">*</strong> 邮政编码： </label>
                        <input type="text" maxlength="6" id="consignee_zipCode" name="consigneeParam.zipCode" value="" style="width:200px;">
                        <span class="form-tip"><span style="color: #ec0202;" id="zipCode_div_error"></span></span>
                    </li>
                    <li>
                        <input type="submit" value="保 存" onclick=""  class="btn_save  bule_btn" /> <span id="saveConsigneeTitleDiv"></span>
                    </li>
                </ul>
            </div>
        </form>
    </div>
</div>
<script src="${base}/static/js/jquery.form.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/order.common.js" type="text/javascript"></script>
<script src="${base}/static/bec/project/ghj/js/order_new.js?v=1.0.1" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">

    //收货地址编辑功能弹出层
    $(".mod_address_book .adr_list li").hover(function() {
                if ($(this) !== $(".mod_address_book .adr_list li:last-child")) {
                    $(this).addClass("hover_li");
                    if ($(this).find(".using_add").length > 0 && $(this).find(".using_add").is(":visible")) {
                        $(this).find(".edit_box a").eq(1).hide();
                    }
                }
            },
            function() {
                if( $(this).attr("isDefault") == "false" ){
                    $(this).removeClass("hover_li");
                }

    });


    function showTips(receiverId){
//        $("#tips_"+index).show();
//        layer.confirm('您确定要删除吗？', {icon: 3, title:'温馨提示'}, function(index){
//
//            delReceiver(receiverId);
//            layer.close(index);
//        },
//        function(index){
//            layer.close(index);
//        });

        if($('#consignee_radio_'+receiverId).attr("isDefault") == 'true'){
            layer.alert('默认地址无法删除！', {icon: 7, title:'温馨提示'});
        }else{

            layer.confirm('您确定要删除吗？', {icon: 3, title:'温馨提示'}, function(index){

                        delReceiver(receiverId);
                        layer.close(index);
                    },
                    function(index){
                        layer.close(index);
                    });
        }
    }

    function hideTips(index){
        $("#tips_"+index).hide();
    }
</script>



<!--验证码插件所用js（Validform_v5.3.2.js）-->
<script type="text/javascript" src="${base}/static/bec/base/js/Validform_v5.3.2.js"></script>
<script type="text/javascript">
    $(function(){

        var demo=$(".registerform").Validform({
            tiptype:3,
            label:".label",
            showAllError:true,
            datatype:{
                "zh2-4":/^[\u4E00-\u9FA5\uf900-\ufa2d]{2,4}$/,
                "phone":function(gets,obj,curform,regxp){
                    /*参数gets是获取到的表单元素值，
                      obj为当前表单元素，
                      curform为当前验证的表单，
                      regxp为内置的一些正则表达式的引用。*/

                    var reg1=regxp["m"],
                            reg2=/[\d]{7}/,
                            mobile=curform.find(".mobile");

                    if(reg1.test(mobile.val())){return true;}
                    if(reg2.test(gets)){return true;}

                    return false;
                }
            },
            ajaxPost:true,
            beforeSubmit:function(curform){
                //在验证成功后，表单提交前执行的函数，curform参数是当前表单对象。
                //这里明确return false的话表单将不会提交;
                save_Consignee();
                return false;
            }
        });

        //通过$.Tipmsg扩展默认提示信息;
        //$.Tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
        demo.tipmsg.w["zh2-4"]="请输入2到4个中文字符！";

        demo.addRule([{
            ele:".inputxt:eq(0)",
            datatype:"zh2-4"
            },
            {
                ele:".inputxt:eq(1)",
                datatype:"*5-60"
            },
            {
                ele:"select",
                datatype:"*"
            },
        ]);
    });
</script>

    <#include "bec/ghj/service.ftl"/>
    <#include "bec/ghj/foot.ftl"/>
</#escape>