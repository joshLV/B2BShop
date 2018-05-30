<#escape x as x?html>
    <#include "mall/gwq/top.ftl"/>
<link href="${base}/static/mall/gwq/css/base.css" rel="stylesheet" type="text/css" media="all"/>
<link href="${base}/static/css/addressDialog.css" rel="stylesheet" type="text/css" media="all"/>
<style>
    .breadcrumb {height: 20px;padding: 10px 0 4px 6px;margin-bottom: 10px;overflow: hidden;line-height: 20px;vertical-align: baseline;}
    .breadcrumb strong, .breadcrumb h1 {display: inline;font-weight: normal;line-height: 20px;font-size: 14px;font-family: "microsoft yahei";}
    .main{border-left: 1px solid #E8E8E8; border-right: 1px solid #E8E8E8;}
    .left {float: left;width: 195px;/*margin-right: 10px;*/margin-bottom: -9999999px; padding-bottom: 9999999px; border-right: 1px solid #E8E8E8; background: #ffffff;}
    .right {float: right;width: 1024px;margin-bottom: -9999999px; padding-bottom: 9999999px; background: #ffffff;}
    .widepage .right {width:1014px;}
    .right a:link,.right a:visited{color:#005ea7;}
    .m-tit{ height:40px; line-height: 40px; background: #F9F9F9; padding-left: 10px; color: #333333;}
    .o-m{ /*border: 1px solid #cccccc; */overflow: hidden; border-top: none; padding-top: 40px; padding-bottom: 40px;}
    .o-m .o-mb {margin:10px;}
    h2, h3 {font-size: 14px;}
    a.e-btn:link, a.e-btn:visited, a.e-btn:hover, a.e-btn:active {color: #333;text-decoration: none;}
    a.add-btn {display: inline-block;vertical-align: middle;font-weight: bold;padding: 0 14px;height: 28px;line-height: 28px;font-size: 14px;margin: 0 10px 0 0;}
    .yellow-btn {-moz-border-radius: 3px 3px 3px 3px;-webkit-border-radius: 3px 3px 3px 3px;border-radius: 3px 3px 3px 3px;background-color: #f5fbef;background-image: -moz-linear-gradient(top,#f5fbef,#eaf6e2);background-image: -webkit-gradient(linear,left top,left bottom,color-stop(0,#f5fbef),color-stop(1,#eaf6e2));filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#f5fbef,endColorstr=#eaf6e2,GradientType='0');-ms-filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#f5fbef,endColorstr=#eaf6e2);background-image: linear-gradient(to top,#f5fbef 0,#eaf6e2 100%);border: 1px solid #bfd6af;}
    .o-m .o-mb h3 span {font-size: 12px;font-weight: normal;line-height: 30px;}
    .ftx-03, a.flk-03:link, a.flk-03:visited, .flk-03 a:link, .flk-03 a:visited {color: #999999;}
    .o-m .o-mb h3 span {font-size: 12px;font-weight: normal;line-height: 30px;}
    .ftx-04 {color: #ff6600;}
    .o-m .m .mt {padding-left: 10px;line-height: 35px;height: 35px;position: relative;overflow: visible;}
    .m4 .mt {border-bottom: 1px solid #e6e6e6;height: 34px;line-height: 34px;padding-left: 16px; border-top: 1px solid #e6e6e6; background: #fbfbfb;}
    .m4 .mt h3 {float: left;color: #666666;}
    .o-m .m .mt .extra {float: right;margin: 0 10px 0 0;}
    .main .mt .extra {float: right;}
    .o-m .m .mt .extra a {color: #005ea7;margin: 0 0 0 20px;}
    .o-m .m .mt {line-height: 35px;}
    .o-m .m .mt h3 .ftx-03 {font-size: 12px;margin-left: 5px;font-weight: normal;}
    .o-m .m .mc {padding: 10px;line-height: 22px;width: 808px;}
    .o-m .m .mc .new-items {position: relative;display: table;}
    .o-m .m .mc {line-height: 22px;}
    .o-m .m .mc .item-lcol {width: 450px;border-right: 1px dashed #e5e5e5;}
    .o-m .m .mc .item span {float: left;width: 70px;color: #999;text-align: right;}
    .o-m .m .mc .item-lcol .fl {width: 360px;}
    .fl {float: left;}


    /*收货地址*/
    .add_num{ width:918px; padding-left:20px; float:left; color:#bbb; padding-bottom:20px;}
    .add_num .ftx-red{ color:#db0000;}
    .del_adr{background: url("/ec/static/img/ico_01.png") no-repeat;}
    .mod_address_book .adr_list .li_add_addr .btn_add_addr i{    background: url("/ec/static/img/ico_01.png") no-repeat;}
    .columnright { width:938px;  padding-left:40px;position: relative;z-index:1; float:left;}
    .columnright button {cursor: pointer; border: none;}
    .mod_address_book .adr_list {width: 908px; float:left; padding-left:20px; }
    .mod_address_book .adr_list li,
    .mod_address_book .adr_list .hover_li,
    .mod_address_book .adr_list li .using_add,
    .packageNum b,
    .remind_box ul li .no_div,
    .remind_box ul li .yes_div,
    .membercenter_pop i,
    .pop_close {background:url(/ec/static/img/ico_address.png) no-repeat;}
    .mod_address_book .adr_list li {margin: 0 40px 10px 0;width: 260px;height: 173px;float: left;position: relative;background-position: left -176px;}
    .mod_address_book .adr_list li .using_add {width: 28px;height: 28px;position: absolute;right: 0; bottom:0;text-indent: -9999px;background-position: left -360px;}
    .mod_address_book .adr_list .hover_li,
    .mod_address_book .adr_list .address_on { background-position: left top;}
    .mod_address_book .adr_list .hover_li .edit_box {display: block;}
    .mod_address_book .adr_list li .vcard {margin: 15px 20px 0 23px;}
    .mod_address_book .adr_list li .vcard p {line-height: 19px;margin-bottom: 5px;margin-right: 5px;}
    .mod_address_book .adr_list li .vcard .adr { margin-bottom:0;}
    .mod_address_book .adr_list li p .uc_name { font-size: 14px;}
    .mod_address_book .adr_list li .other_info .tag {float: left;border: 1px solid #E0E0E0;margin-right: 6px;padding: 2px 5px;}
    .mod_address_book .adr_list li .edit_box { width: 212px; display: none; position: absolute; left: 25px; height:25px; bottom: 10px;}
    .mod_address_book .adr_list li .edit_box .del_adr { background-position: left -295px; float: right; padding-left: 19px; color: #999; line-height:18px;}
    .mod_address_book .adr_list li .edit_box .btn_edit { float: left; line-height: 20px;}
    .mod_address_book .adr_list li .edit_box .btn_set_common { background-color: #b2b2b2; color: #fff; position: absolute; right: -13px; top: -123px; text-decoration: none; line-height: 1.2; padding: 1px 4px 2px;}

    .mod_address_book .adr_list li .tips_care {border: 4px solid #E0E0E0;background: #FFF;position: absolute;left: 16px;top: 40px;z-index: 1;width: 220px;padding: 34px 0;text-align: center;display: none;}
    .mod_address_book .adr_list li .tips_care p {display: inline; background-position: left -44px;padding-left: 20px;}
    .mod_address_book .adr_list li .tips_del {width: 160px;height: 80px;border: 5px solid #E0E0E0;position: absolute;left: 45px;top: 30px;background: #FFF;display: none;}
    .mod_address_book .adr_list li .tips_del .txt {text-align: center;margin-top: 18px;}
    .mod_address_book .adr_list li .tips_del .btn_box {text-align: center;margin-top: 10px;}
    .mod_address_book .adr_list li .tips_del .btn_box button {width: 41px;height: 22px;border: 0 none;background: #008bdb;cursor: pointer;margin: 0 3px;display: inline-block;line-height: 20px;color: #fff;}
    .mod_address_book .adr_list li .tips_del .btn_box .btn_cancle {background-color: #b0b0b0;}
    .mod_address_book .adr_list .li_add_addr .btn_add_addr { display: block; width: 260px; height: 118px; text-align: center; color: #0083ce; font-size: 14px; font-weight: bold; text-decoration: none; padding-top:55px;}
    .mod_address_book .adr_list .li_add_addr .btn_add_addr i { display: block; width: 29px; height: 29px; margin: 0 auto 5px; background-position: left -254px;}
    .mod_address_book .adr_list .hide {display: none;}
    .popGeneral_address .aptab_center_address label {width: 80px;display: inline-block;}
    .popGeneral_address .aptab_center_address .newaddress li {margin-bottom: 10px;}
    .popGeneral_address .aptab_center_address .newaddress li input {height: 27px;line-height: 27px;padding-left: 5px;vertical-align: middle;border: 1px solid #e6e6e6;}
    .popGeneral_address .aptab_center_address .btn_save { width:116px; height:auto; line-height:34px; margin: 0 5px 0 85px; text-align: center;}
    .pageNavi li .page-start, .pageNavi li .page-end {border: 1px solid #ddd; color: #999; cursor: default;display: inline-block;vertical-align: top; width: 60px;}
    .aBlu{ color:#0083ce;}
    #popupdiv select { border: 1px solid #e6e6e6;height: 33px;line-height: 33px;width: 110px; border-radius: 0;background: #fff; margin-right:5px;
    }
    input.bule_btn{background: #e4393c;font-size: 14px; border:0; color:#fff;font-weight: bold;cursor: pointer;-webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px; height:36px!important; line-height:36px!important; border:0!important;cursor: pointer!important;}
    input.bule_btn:hover{ background:#e4393c;color:#fff;}

    /*******弹出层 common********/
    #popupdiv{width:698px;height:420px;position:fixed;z-index:1000; background:#fff;border: 1px solid #DB0000; }
    .pop_win { width: 700px; background-color: #fff;   line-height: 1.5; color: #666;/* position: fixed; _position: absolute;*/ margin-top:0; }
    .title_div { background-color: #e4393c; color: #fff; font-size: 14px; font-weight: bold; width:100%; line-height: 35px; float:left;}
    .title_div h2{ float:left; padding-left:25px;}
    .title_div a{ float:right; padding-right:25px; color:#fff;}
    .newaddress{ padding:30px; float:left; width:640px;}
    .newaddress li {padding-top: 6px;color: #999;overflow: hidden; float:left;width:100%;}
    li .using_add {
        display: none;
    }

    li.address_on .using_add {
        display: block;
    }
    .btn_set_common {
        display :block!important;
    }

    /*
    20151202  董志忠 因勾选常用按钮导致"设为默认地址"提示隐藏,故取消此处样式
    li.address_on .btn_set_common {
        display :none!important;
    }
    */

    /* 表单验证 */
    .Validform_checktip{
        margin-left:8px;
        line-height:20px;
        height:20px;
        overflow:hidden;
        color:#999;
        font-size:12px;
    }
    .Validform_right{
        color:#71b83d;
        padding-left:20px;
        background:url(${base}/static/img/right.png) no-repeat left center;
    }
    .Validform_wrong{
        color:red;
        padding-left:20px;
        white-space:nowrap;
        background:url(${base}/static/img/error.png) no-repeat left center;
    }
    .Validform_loading{
        padding-left:20px;
        background:url(${base}/static/img/onLoad.gif) no-repeat left center;
    }
    .Validform_error{
        background-color:#ffe7e7;
    }
    #Validform_msg{color:#7d8289; font: 12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif; width:280px; -webkit-box-shadow:2px 2px 3px #aaa; -moz-box-shadow:2px 2px 3px #aaa; background:#fff; position:absolute; top:0px; right:50px; z-index:99999; display:none;filter: progid:DXImageTransform.Microsoft.Shadow(Strength=3, Direction=135, Color='#999999');}
    #Validform_msg .iframe{position:absolute; left:0px; top:-1px; z-index:-1;}
    #Validform_msg .Validform_title{line-height:25px; height:25px; text-align:left; font-weight:bold; padding:0 8px; color:#fff; position:relative; background-color:#000;}
    #Validform_msg a.Validform_close:link,#Validform_msg a.Validform_close:visited{line-height:22px; position:absolute; right:8px; top:0px; color:#fff; text-decoration:none;}
    #Validform_msg a.Validform_close:hover{color:#cc0;}
    #Validform_msg .Validform_info{padding:8px;border:1px solid #000; border-top:none; text-align:left;}
</style>
<style type="text/css">
    /*针对页面收货地址弹出窗 X状 图标在第一次验证无保存动作关闭窗口,第二次打开窗口出现此图标*/
    .Validform_wrong {
        background: none;
    }
</style>
    <#include "mall/gwq/header_new.ftl"/>

<div class="left">
    <#import "mall/gwq/member/menu.ftl" as memu>
		<@memu.menu id="shdz"/>
</div><!--left end-->
<div class="right">
    <div class="breadcrumb">
        <strong><a href="${base}/member/index">会员中心</a></strong><span>&nbsp;&gt;&nbsp;收货地址<span></span></span>
    </div><!--breadcrumb end-->
    <div class="m-tit"><h3>收货地址</h3></div>
    <div id="addressList" class="o-m">
        <div class="columnright">
            <div class="add_num">您已创建<span class="ftx-red" id="addressNum_top">&nbsp;${receiverList?size}&nbsp;</span>个收货地址，最多可创建<span class="ftx-red">&nbsp;6&nbsp;</span>个</div>
            <div class="mod_address_book">
                <div id="addressListDiv" class="addressListDiv">
                    <input type="hidden" value="1" id="size">

                    <ul class="adr_list" id="consignee-list">
                        <#list receiverList as receiver>
                            <li class="<#if receiver.isDefault==1>address_on hover_li</#if>" id = "consignee_radio_${receiver.id}" onclick="chooseCurrAddress('${receiver.id}')" isDefault="<#if receiver.isDefault==1>true<#else>false</#if>">
                                <p class="using_add"> 默认地址 </p>
                                <div class="vcard">
                                    <p> <strong>${receiver.name} </strong>&nbsp;&nbsp;&nbsp;收 </p>
                                    <p class="adr" style="word-wrap: break-word;word-break: break-all;"> <span class="street-address"> <strong class="locality"> ${receiver.areaName} </strong> <span class="street-address">${receiver.address}</span> </p>
                                    <p class="tel">  ${receiver.mobile}&nbsp;&nbsp;&nbsp;&nbsp;${receiver.phone} </p>
                                    <p >  ${receiver.email} </p>
                                    <p > ${receiver.zipCode} </p>
                                </div>
                                <div class="edit_box clearfix">
                                    <button class="del_adr" title="删除地址" onClick="showTips('${receiver.id}');"> 删除 </button>
                                    <a class="aBlu btn_edit" href="javascript:void(0)" id="show" onClick="show_ConsigneeDetail('${receiver.id}')">编辑</a>
                                    <#if receiver.isDefault==1>
                                        <a id="addrDefault" class="btn_set_common" href="javascript:void(0)" onClick="setDefault('${receiver.id}')">默认地址</a>
                                    <#else>
                                        <a class="btn_set_common" onClick="setDefault('${receiver.id}')" href="javascript:void(0)">设置默认地址</a>
                                    </#if>
                                </div>
                                <div class="tips_del" id="tips_${receiver.id}">
                                    <p class="txt"> 确认删除该收货地址吗？ </p>
                                    <div class="btn_box">
                                        <button onClick="delReceiver('${receiver.id}')" class="btn_sure"> <span>确认</span> </button>
                                        <button class="btn_cancle" onClick="hideTips('${receiver.id}');"> <span>取消</span> </button>
                                    </div>
                                </div>
                            </li>
                        </#list>
                    <#--<#if receiverList?size&lt;6>-->
                        <li type="2" id="address_list_li_3" class="li_add_addr add_adr saveAddress last" isDefault="false">
                            <p> <a class="btn_add_addr"  href="javascript:void(0)" id="show" onClick="use_NewConsignee()"><i>&nbsp;</i>添加新收货地址</a> </p>
                            <div class="tips_care" id="tips_full_2">
                                <p> 地址已满6条，无法再添加新地址 </p>
                            </div>
                        </li>
                    <#--</#if>-->
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div><!--right end-->

<!-- 添加  修改  弹出层HTML代码  Start -->

<div class="popGeneral_address" id="popupdiv" style="display:none;">
    <form class="registerform" onsubmit="return false">
        <input type="hidden" id="consignee_form_id">
        <input type="hidden" id="isReceiverSubmit" value="false">
        <div class="pop_win aptab_center_address">
        <#--<div class="title_div">
            <h2><span id="editStatu"></span>收货地址</h2>
            <a href="javascript:void(0)" onClick="closeDiv('popupdiv')">X</a></div>-->
            <ul class="newaddress">
                <li>
                    <label> <strong style="color: red;">*</strong> 收&nbsp;&nbsp;货&nbsp;&nbsp;人： </label>
                    <input type="text" id="consignee_name"  name="consigneeParam.name" value="" class="inputxt name" maxlength="20" nullmsg="请填写收货人！" errormsg="收货人姓名不能小于2位!">
                    <span class="form-tip"><span style="color: #ec0202;" id="name_div_error"></span></span>
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;收货城市： </label>
                    <span id="span_area"><input type="text" name="receiver.areaPath" class="areaSelect hidden" value=""/></span>
                    <span class="form-tip"><span style="color: #ec0202;" id="area_div_error"></span></span>
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;详细地址： </label>
                    <input type="text" name="consigneeParam.address" id="consignee_address" maxlength="30"  class="inputxt" style="width: 398px;" nullmsg="请填写详细地址！" >
                </li>
                <li>
                    <label> <strong style="color: red;">*</strong>&nbsp;手机号码： </label>
                    <input type="text" value=""  id="consignee_mobile" name="consigneeParam.mobile"  class="inputxt mobile" style="width:90px;" ignore="ignore">
                &nbsp;<span style="color: #333333">或 &nbsp; 固定电话：</span>
                <input type="text" value=""  id="consignee_phone" name="consigneeParam.phone" class="inputxt tel" style="width: 110px;"  >
                    <span class="form-tip"><span style="color: #ec0202;" id="call_div_error"></span></span>
                </li>
                <#--<li>
                    <label> <strong style="color:#fff;">*</strong> 固定电话： </label>
                    <input type="text" value=""  id="consignee_phone" name="consigneeParam.phone" &lt;#&ndash;class="inputxt tel"&ndash;&gt;ignore="ignore" datatype="tel">
                    &lt;#&ndash;<span class="form-tip"><span style="color: #ec0202;" id="call_div_error"></span></span>&ndash;&gt;
                </li>-->
                <li style="display: none" class="setDefaultAddressLi" id="setDefaultAddressLi">
                    <label for="set_normal" class="label_set_normal">
                        <input type="checkbox" value="1" name="addressInfo.addressType" class="set_normal" id="set_normal">
                        设为默认地址 </label>
                </li>
                <li>
                    <label> <strong style="color:#fff;">*</strong> 邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱： </label>
                    <input type="text" maxlength="30" value="" id="consignee_email" name="consigneeParam.email" style="width:200px;" ignore="ignore" datatype="e" errormsg="邮箱格式错误！">
                </li>
                <li>
                    <label> <strong style="color:#fff;">*</strong> 邮政编码： </label>
                    <input type="text" id="consignee_zipCode" name="consigneeParam.zipCode" value="" id="zipCode_div" style="width:200px;">
                    <span class="form-tip"><span style="color: #ec0202;" id="zipCode_div_error"></span></span>
                </li>
                <li>
                    <input type="submit" value="保 存" onclick="save_Consignee()"  class="btn_save  bule_btn" /> <span id="saveConsigneeTitleDiv"></span>
                </li>
            </ul>
        </div>
    </form>
</div>
<!-- 添加  修改  弹出层HTML代码  End -->

<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/easybuy.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/order.common.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>
<script type="text/javascript">
    //pageConfig.wideVersion && pageConfig.compatible && (document.getElementsByTagName("body")[0].className = "widepage");
    $(function () {
        //关闭
        $(".close_btn").hover(function () { $(this).css({ color: 'black' }) }, function () { $(this).css({ color: '#999' }) }).on('click', function () {
            $("#LoginBox").fadeOut("fast");
            $("#mask").css({ display: 'none' });
        });
        //左侧菜单折叠操作
        $("#leftMenu dt").click(function(){
            $parent=$(this).parent();
            if($parent.hasClass("close")){
                $parent.removeClass("close");
            }else{
                $parent.addClass("close");
            }
        });


        var demo=$(".registerform").Validform({
            tiptype:3,
            label:".label",
            showAllError:true,
            datatype:{
                "zh1-6":/^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/
            },
            ajaxPost:false
        });



        //通过$.Tipmsg扩展默认提示信息;
        //$.Tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
        demo.tipmsg.w["zh1-6"]="请输入1到6个中文字符！";

        demo.addRule([{
            ele:".inputxt:eq(0)",
            datatype:"*"
        },
            {
                ele:".inputxt:eq(1)",
                datatype:"*"
            }, {
                ele:"select",
                datatype:"*"
            },{
                ele:".name",
                datatype:"name"
            }
        ]);


        $(".registerform").Validform({
            datatype:{
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
                },
                "name":function(gets,obj,curform,regxp){
                    /*参数gets是获取到的表单元素值，
                      obj为当前表单元素，
                      curform为当前验证的表单，
                      regxp为内置的一些正则表达式的引用。*/
                    if(gets.length < 2){
//                        $("#name_div_error").text("请最少输入1个字符");
                        return false;
                    }else if(gets.length > 20){
//                        $("#name_div_error").text("请最多输入20个字符");
                        return false;
                    }else{
                        $("#name_div_error").text("");
                        return true;
                    }

                    return false;
                }
            },
            ajaxPost:false
        });


        $("#addresshtml").addClass("current");
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
    });


    function showTips(receiverId){
//        $("#tips_"+index).show();

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

    function alertAddAddressDiag(type){
        if(type=="update"){
            $("#oper").text("修改收货地址");
        }else{
            $("#oper").text("添加收货地址");
        }
        // 地区选择菜单
        $(".lSelect").remove();//移除之前生成的
        $(".areaSelect").lSelect({
            url: "${base}/area/ajaxChildren"// Json数据获取url
        });
        var num =$("#addressNum_top").text();
        if(num>5&& type!="update"){
            alert("抱歉，地址信息最多可创建6条。");
            return;
        }
        //弹出地址框
        $("#type").attr("value","uptate");
        $("body").append("<div id='mask'></div>");
        $("#mask").addClass("mask").fadeIn("slow");
        $("#LoginBox").css("top",$(document).scrollTop()+150+"px");
        $("#LoginBox").fadeIn("slow");
    }
</script>
    <#include "mall/gwq/service_new.ftl"/>
    <#include "mall/gwq/footer_new.ftl"/>
</#escape>