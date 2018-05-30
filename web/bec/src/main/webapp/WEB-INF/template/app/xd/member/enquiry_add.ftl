<!DOCTYPE html>
<html class="ui-page-login">

<head>
<#include "app/xd/head.ftl">
    <link href="${path}/theme/red/mui.picker.css" rel="stylesheet" />
    <link href="${path}/theme/red/mui.dtpicker.css" rel="stylesheet" />
    <#--<link href="${path}/theme/red/jydz.css" rel="stylesheet" />-->
    <style>
        .mui-btn {
            font-size: 16px;
            padding: 8px;
            margin: 3px;
        }
        h5.mui-content-padded {
            margin-left: 3px;
            margin-top: 20px !important;
        }
        h5.mui-content-padded:first-child {
            margin-top: 12px !important;
        }
        .ui-alert {
            text-align: center;
            padding: 5px 10px;
            font-size: 15px; color: #555;
        }
        .area {
            margin: 20px auto 0px auto;
        }
        .mui-input-group:first-child {
            margin-top: 20px;
        }
        .mui-input-group label {
            width: 31%;
        }
        .mui-input-row label~input,
        .mui-input-row label~select{
            width: 68%;
        }
        .mui-input-row label~textarea {
            font-family: "微软雅黑";
            line-height: 2.2;
            float: right;
            width: 60%;
            padding: 0px 0px 10px 0px;
            font-size: 14px;
        }
        .mui-checkbox input[type=checkbox],
        .mui-radio input[type=radio] {
            top: 6px;
        }
        .mui-content-padded {
            margin-top: 25px;
        }
        .mui-btn {
            padding: 8px 0px;
            margin: 10px; margin-left: 0px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
        }
        .mui-input-row label~input, .mui-input-row label~select, .mui-input-row label~textarea{
            margin-top: 1px;
        }

        .zyf_line:after{background-color: transparent!important;}
        }


        /*跨webview需要手动指定位置*/
        #topPopover {
            position: fixed;
            top: 16px;
            right: 6px;
        }
        #topPopover .mui-popover-arrow {
            left: auto;
            right: 6px;
        }
        p {
            text-indent: 22px;
        }
        span.mui-icon {
            font-size: 14px;
            color: #007aff;
            margin-left: -15px;
            padding-right: 10px;
        }
        .mui-popover {
            height: 80%;
            width: 98%;
        }
        .mui-content {
            padding: 10px;
        }
        .mui-table-view-radio .mui-table-view-cell .mui-navigate-right:after {
            font-size: 30px;
            font-weight: 600;
            right: 9px;
            content: '';
            color: #007aff;
            top: inherit;
        }
        .mui-table-view-radio .mui-table-view-cell.mui-selected .mui-navigate-right:after {
            content: '\e472'
        }
        .mui-navigate-right:after {
            font-family: Muiicons;
            font-size: inherit;
            line-height: 1;
            position: absolute;
            top: inherit;
            display: inline-block;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
            text-decoration: none;
            color: #aaa;
            -webkit-font-smoothing: antialiased;
            margin-top: 10px;
        }

        .add_suppliers{margin-top: 20px;  font-size: 16px; width: 600px; float: left;}
        .add_suppliers a{float: left; margin-left: 15px; background: #a9a9a9; color: #ffffff; height: 30px; line-height: 30px; padding-left: 10px; padding-right: 10px; border-radius: 3px 3px 0 0;}
        .add_suppliers a:hover{background: #0171bb;}
        .supplier_search{width: 600px; margin-top: 10px;}
        .supp_search_input{width:495px;  height:41px; border:1px solid #e8e8e8;  font-size:16px; color:#000000; padding-left:10px; line-height:41px; float:left;}
        .sup_searchs_button{border-radius:3px; width:81px; height:41px; line-height:41px; text-align:center; background:#0171bb; color:#FFF; display:block; float:left; font-size:16px; margin-left:12px; border: none;}
        .sup_info{padding-left: 15px; font-size: 14px; word-break:break-all;}
        .sup_lists_con{ width:620px; height:350px;min-height:350px; font-size:16px; float: left; margin-top: 15px;border:1px solid #e8e8e8; border-bottom: none; border-right: none;overflow-x: hidden;overflow-y: auto;}
        .sup_lists_con table{ width:600px; float: left;}
        .sup_lists_con table tr{font-size: 14px; line-height: 40px;}
        .sup_lists_con table td{border-right: 1px solid #E8E8E8;border-bottom:1px solid #e8e8e8;}
        .sup_lists_con table p{line-height:40px;}
        .sup_lists_con table em{ color:#9a9999; font-weight:normal;}
        .btns{margin-top: 15px; float: right; padding-right: 0px;}
        .show_add_sup{padding-left: 15px;}
        .show_sup_table {font-size: 14px;}
        .show_sup_table td{padding-left: 10px; border-top: 1px solid #E8E8E8;}
        .confirm_button{width: 50px; height: 30px; background: #0171bb; color: #ffffff; text-align: center; line-height: 30px; border-radius: 3px; border: none;}
        #tabcon0 ul{display: none;}
        #tabcon0 ul.block{display: block;}
        .sup_list_namets{border:1px solid #e8e8e8; background:#f8f8f8; line-height:44px; margin-top:15px; font-size:16px; float: left;}
        .btn-err:link, .btn-err:visited, .btn-err:hover, .btn-success:link, .btn-success:visited, .btn-success:hover {color: #333;}
        .btn-h2 {
            line-height: 28px;
            font-weight: bold;
            font-size: 14px;
            display: inline-block;
            text-decoration: none;
            padding-left: 11px;
            padding-right: 11px;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            vertical-align: middle;
            border: 1px solid;
            overflow: hidden;
            cursor: pointer;
        }

        .btn-success {
            background: #0171bb;
            color: #ffffff !important;
            border-radius: 3px;
            border: none;
            height: 30px;
        }

        .btn-err {
            background: #bebebe;
            /*border-color: #DDDDDD;*/
            color: #ffffff !important;
            border: none;
            border-radius: 3px;
            height: 30px;
        }

    </style>
</head>

<body>
<header class="mui-bar mui-bar-nav">

    <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
        <span class="mui-icon mui-icon-left-nav"></span>
    </button>
    <h1 class="mui-title mui-center">发布询价单</h1>
</header>
<div class="mui-content" style="padding:30px 0 0 0">
    <form class="mui-input-group" action="${base}/enquiry/save" id="enquiryForm" >
        <div class="mui-input-row">
            <label>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题:<span style="color:red">*</span></label>
            <input id="title" name="title" type="text" value="${enquiry.title}" required data-max="30" data-min="2" class="mui-input-clear mui-input" placeholder="为该询价单写个标题(必填)">
        </div>
        <div class="mui-input-row">
            <label style="float: left;">产品类型:<span style="color:red">*</span></label>
            <li  style="float: left;clear:none;" class="mui-input-row mui-radio mui-left f-cb" style="float: left;">
                <input style="left: 0px;"  class="mui-radio" type="radio" id="isSpot1" name="isSpot" type="radio" value="1" <#if enquiry.isSpot != 2>checked="checked"</#if>><label style="float: left;width: 108px;line-height:5px;padding-left:22px;padding-right:0px;">现货/标准品</label>
            </li>
            <li style="float: left;clear:none;" class="mui-input-row mui-radio mui-left f-cb" style="float: left;">
                <input style="left: 0px;"  class="mui-radio" type="radio" id="isSpot2" name="isSpot" type="radio" value="2" <#if enquiry.isSpot == 2>checked="checked"</#if> ><label style="float: left;width: 108px;line-height:5px;padding-left:22px;padding-right:0px;">加工/定制品</label>
            </li>
        </div>
        <div class="mui-input-row">
            <label style="float: left;">询价产品:</label>
            <button  class="mui-btn" type='button' id="addNewColumn"  style="float:right; font-size: 14px; border: 1px solid #e6e6e6; background: #e2e2e2 ; width: 100px;margin: 0px;padding:8px 0px;margin-right:5px;">添加产品</button>
            <div class="mui-input-row" id="goodList">
                <#if goods?? >
                <#list goods as good>
                    <div id="div_${good_index}" style="height: 220px;">
                        <div onclick="delRow('${good_index}')" class="mui-icon mui-icon-close" style="margin-right: 15px;float: right;"></div>
                        <label style="float: left;">所属分类:<span style="color:red">*</span></label>
                        <button id='catelog' data-align="${good_index}" onclick="choseCLog(this)"  type="button" data-options='' class="btn mui-btn-picker ">${good.categoryName}</button>
                        <input type="hidden" style="margin-top: -36px;width: 40%;float: left;" class="xj-hy" id="categoryName_${good_index}" name="goods[${good_index}].categoryName" readonly required="required" value="${good.categoryName}" />
                        <input type="hidden" class="xj-id" id="categoryId_${good_index}" name="goods[${good_index}].categoryId" readonly value="${good.categoryId}"/>
                        <input type="hidden" class="xj-path" id="categoryPath_${good_index}" name="goods[${good_index}].categoryPath"  value="${good.categoryPath}" />
                        <div style="clear: both"></div>

                        <label style="float: left;">产品名称:<span style="color:red">*</span></label>
                        <input id="goodsName_${good_index}" name="goods[${good_index}].goodsName" value="${good.goodsName}" type="text" required class="mui-input-clear mui-input" style="width: 68%;" placeholder="请输入产品名称">
                        <div style="clear: both"></div>
                        <label style="float: left;">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量:<span style="color:red">*</span></label>
                        <div class="mui-numbox" style="width: 35px;height: 25px;float: left;padding:0 30px;margin-top:5px;">
                            <button class="mui-numbox-btn-minus" style="width: 30px;" type="button" >-</button>
                            <input class="mui-numbox-input" style="width: 23px;padding:0 0px!important" type="input"  readonly="true" required  min="1"  max="1000" id="goodsNum_${good_index}" name="goods[${good_index}].goodsNum" value="${good.goodsNum}" />
                            <button class="mui-numbox-btn-plus" style="width: 30px;border-left:solid 1px #ccc!important"  type="button">+</button>
                        </div>

                        <label style="float: left;width: 45px;padding-left: 0px;padding-right: 0px;">单位:<span style="color:red">*</span></label>
                        <input  style="width: 50px;float: left;padding-right:0px;" type="text" id="goodsUnit_${good_index}" name="goods[${good_index}].goodsUnit" required value="${good.goodsUnit}" class="mui-input-clear mui-input" placeholder="单位">

                        <label style="float: left;">产品描述:</label>
                        <textarea id="goodsAccessory_${good_index}" name="goods[${good_index}].goodsAccessory" type="text" class="mui-input-clear mui-input" style="border:solid 1px #808080; border-radius:5px; resize:none;width: 67%;margin-top: 5px;margin-right: 5px;" placeholder="请输入产品描述">${good.goodsAccessory}</textarea>
                        <div style="clear: both; padding: 10px 0; border-bottom: 1px dotted #d8d8d8; margin-bottom: 15px;"></div>
                    </div>
                </#list>
               <#else >
                    <div id="div_0" style="height: 250px;">
                        <div onclick="delRow('0')" class="mui-icon mui-icon-close" style="margin-right: 15px;float: right;"></div>
                        <label style="float: left;">所属分类:<span style="color:red">*</span></label>
                       <button id='catelog' onclick="choseCLog(this)" data-align="0" type="button" data-options='' class="btn mui-btn-picker ">选择商品分类</button>
                       <input type="text" style="margin-top: -36px;width: 40%;float: left;" class="xj-hy" id="categoryName_0" name="goods[0].categoryName" readonly required="required" value="" />
                       <input type="hidden" class="xj-id" id="categoryId_0" name="goods[0].categoryId" readonly value=""/>
                       <input type="hidden" class="xj-path" id="categoryPath_0" name="goods[0].categoryPath"  value="" />
                       <div style="clear: both"></div>

                       <label style="float: left;">产品名称:<span style="color:red">*</span></label>
                       <input id="goodsName_0" name="goods[0].goodsName" type="text" value="" required class="mui-input-clear mui-input" style="width: 68%;" placeholder="请输入产品名称">
                       <div style="clear: both"></div>
                       <label style="float: left;">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量:<span style="color:red">*</span></label>
                       <div class="mui-numbox" style="width: 35px;height: 25px;float: left;padding:0 30px;margin-top:5px;">
                           <button class="mui-numbox-btn-minus" style="width: 30px;" type="button"  op="-">-</button>
                           <input class="mui-numbox-input" style="width: 23px;padding:0 0px!important" type="input"  readonly="true" id="goodsNum_0" name="goods[0].goodsNum" min="1" max="1000" value="1" onchange="ckNum(this)" />
                           <button class="mui-numbox-btn-plus" style="width: 30px;border-left:solid 1px #ccc!important"  type="button"  op="+" >+</button>
                       </div>
                        <div style="clear: both"></div>
                       <label style="float: left;">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:<span style="color:red">*</span></label>
                       <input  style="width: 50px;float: left;padding-right:0px;" type="text" id="goodsUnit_0" name="goods[0].goodsUnit" value="" class="mui-input-clear mui-input" required data-max="8" data-min="1" placeholder="件、吨">
                       <div style="clear: both"></div>
                       <label style="float: left;">产品描述:</label>
                       <textarea id="goodsAccessory_0" name="goods[0].goodsAccessory" type="text" value="" class="mui-input-clear mui-input" style="border:solid 1px #808080; border-radius:5px; resize:none;width: 67%;margin-top: 5px;margin-right: 5px;" placeholder="请输入产品描述"></textarea>
                    </div>
                </#if>
            </div>
        </div>
        <div class="mui-input-row">
            <label style="float: left;">采购要求:</label>
            <div class="mui-input-row">
                <label style="float: left;">报价截止时间:<span style="color:red">*</span></label>
                <button id='datetimeButton' type="button" data-options='{}' style="padding: 6px 6px" class="btn mui-btn-picker ">${enquiry.offerEndDateTime?string("yyyy年MM月dd日HH时mm分")}</button>
                <input type="hidden" id="offerEndDateTime" name="offerEndDateTimeStr" value="${enquiry.offerEndDateTime?string("yyyy-MM-dd HH:mm:ss")}"  >
                <div style="clear: both"></div>
                <label style="float: left;">期望收货日期:</label>
                <button id='dateButton' type="button" style="padding: 6px 6px" data-options='{"type":"date"}' class="btn mui-btn-picker "><#if enquiry.expectReceivDate??>${enquiry.expectReceivDate?string("yyyy年MM月dd日")}<#else>选择期望收货日期</#if></button>
                <input type="hidden" id="expectReceivDate" name="expectReceivDate" <#if enquiry.expectReceivDate??>value="${enquiry.expectReceivDate?string("yyyy-MM-dd")}"</#if>>
                <input style="left: 0px;display: none;"  class="mui-radio" id="isContainTax" name="isContainTax" value="2" <#if enquiry.isContainTax != 1>checked="checked"</#if> type="radio" ><#--<label style="float: left;width: 85px;line-height:5px;padding-left:22px;padding-right:0px;">需要报含税价</label>-->
                <div style="clear: both"></div>
                <label style="float: left;">收&nbsp;&nbsp;货&nbsp;&nbsp;地:<span style="color:red">*</span></label>
                <button id='showCityPicker' data-align="0" type="button" style="padding: 6px 6px" data-options='' class="btn mui-btn-picker "><#if enquiry.recAreaPath??>${fullName}<#else>选择收货地址</#if></button>
                    <input id="recAreaId"  type="hidden"  name="recAreaId"  value="${enquiry.recAreaId}">
                    <input id="recAreaPath" type="hidden" name="recAreaPath" value="${enquiry.recAreaPath}">
                <div style="clear: both"></div>
                <label style="float: left;">详细地址:<span style="color:red">*</span></label>
                <input id="recAddress" type="text" name="recAddress" value="${enquiry.recAddress}" class="mui-input-clear mui-input" style="width: 68%;" required placeholder="请输入详细地址">
                <div style="clear: both"></div>
            </div>
        </div>
        <div class="mui-input-row">
            <label style="float: left;width: 130px;">对供应商要求:</label>
            <div class="mui-input-row">
                <label style="">交易方式	:</label>
                <div  style="clear:none;margin-left: 20%" class="mui-input-row mui-radio mui-left f-cb" >
                    <input style="left: 0px;" class="mui-radio" id="tradeExchange1" name="tradeExchange" value="1" <#if enquiry.tradeExchange != 2>checked="checked"</#if> onclick="$('#otherTradeLabe2').hide();return true;" type="radio" ><label style="float: left;width: 85px;line-height:5px;padding-left:22px;padding-right:0px;">支付宝</label>
                </div>
                <div style="clear:none;" class="mui-input-row mui-radio mui-left f-cb" >
                    <input style="left: 0px;"  class="mui-radio"  type="radio" id="tradeExchange2" name="tradeExchange" value="2" onclick="$('#otherTradeLabe2').show();return true;" <#if enquiry.tradeExchange == 2>checked="checked"</#if>><label style="float: left;width: 115px;line-height:5px;padding-left:22px;padding-right:0px;">其他交易方式</label>
                    <div id="otherTradeLabe2" style="width: 68%;padding: 0;margin-right: 0;<#if enquiry.tradeExchange != 2>display: none;</#if>float: left;">
                        <input class="mui-input-clear mui-input" type="text" id="otherTrade" name="otherTrade" value="${enquiry.otherTrade}" style="width:100%; float: left;" placeholder="请输入其他交易方式">
                    </div>
                </div>
                <div style="clear: both"></div>
                <div>
                    <label style="float: left;">发票要求	:</label>
                    <li  style="float: left;clear:none;" class="mui-input-row mui-radio mui-left f-cb" style="float: left;">
                        <input style="left: 0px;"  class="mui-radio"  type="radio" id="invoiceRequire1" name="invoiceRequire" value="1" <#if enquiry.isSpot != 2>checked="checked"</#if>><label style="float: left;width: 85px;line-height:5px;padding-left:22px;padding-right:0px;">无需发票</label>
                    </li>
                    <li style="float: left;clear:none;" class="mui-input-row mui-radio mui-left f-cb" style="float: left;">
                        <input style="left: 0px;"  class="mui-radio" type="radio" id="invoiceRequire2" name="invoiceRequire" value="2" <#if enquiry.isSpot == 2>checked="checked"</#if>><label style="float: left;width: 85px;line-height:5px;padding-left:22px;padding-right:0px;">普通发票</label>
                    </li>
                </div>
                <div style="clear: both"></div>
                <label style="float: left;">经营地址:</label>
                <textarea name="manageArea" id="manageArea" required type="text" class="mui-input-clear mui-input" style="border:solid 1px #808080; border-radius:5px; resize:none;width: 67%;margin-top: 5px;margin-right: 5px;" placeholder="请输入经营地址">${enquiry.manageArea}</textarea>
                <div style="clear: both"></div>

                <label style="float: left;">注册资金:</label>
                <label style="float: right;width: 30%;padding-left: 0px;">万元及以上</label>
                <input  type="text"  class="mui-input-clear mui-input" style="width: 37%;" id="registeredCapital" name="registeredCapital" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="6"  value="${enquiry.registeredCapital}" placeholder="请输入注册资金">
                <div style="clear: both"></div>

                <label style="float: left;">证照要求:</label>
                <textarea id="certification" name="certification" type="text" value="" class="mui-input-clear mui-input" style="border:solid 1px #808080; border-radius:5px; resize:none;width: 67%;margin-top: 5px;margin-right: 5px;" maxlength="300"  placeholder="请输入证照要求">${enquiry.certification}</textarea>
                <div style="clear: both"></div>

                <div>
                    <label style="float: left;"></label>
                    <label style="width: 68%;padding: 0;margin-right: 0;">
                        <a href="javascript:;" style="font-size:12px;display: block; width:auto; height: 28px; line-height: 28px; float: left; padding-right:3px;padding-left:3px; margin-right: 5px; margin-top:5px; color: #444;">常用证照(多个以逗号“,”隔开):</a>

                        <a style="font-size:12px;display: block; width:auto; height: 28px; border: 1px solid #e8e8e8;  line-height: 28px; float: left; padding-right:3px;padding-left:3px; margin-right: 5px; margin-right: 5px; margin-top:5px; color: #b7b7b7;" href="javascript:;" onclick="addToCertification('营业执照')">营业执照</a>
                        <a style="font-size:12px;display: block; width:auto; height: 28px; border: 1px solid #e8e8e8;  line-height: 28px; float: left; padding-right:3px;padding-left:3px; padding-right:5px; margin-right: 5px; margin-top:5px; color: #b7b7b7;" href="javascript:addToCertification('税务登记证')">税务登记证</a>
                        <a style="font-size:12px;display: block; width:auto; height: 28px; border: 1px solid #e8e8e8;  line-height: 28px; float: left; padding-right:3px;padding-left:3px; padding-right:5px; margin-right: 5px; margin-top:5px; color: #b7b7b7;" href="javascript:addToCertification('组织机构代码证')">组织机构代码证</a>
                        <a style="font-size:12px;display: block; width:auto; height: 28px; border: 1px solid #e8e8e8;  line-height: 28px; float: left; padding-right:3px;padding-left:3px; padding-right:5px; margin-right: 5px; margin-top:5px; color: #b7b7b7;" href="javascript:addToCertification('国际和国内的产品认证证书')">国际和国内的产品认证证书</a>
                        <a style="font-size:12px;display: block; width:auto; height: 28px; border: 1px solid #e8e8e8;  line-height: 28px; float: left; padding-right:3px;padding-left:3px; padding-right:5px; margin-right: 5px; margin-top:5px; color: #b7b7b7;" href="javascript:addToCertification('环境管理体系认证证书')">环境管理体系认证证书</a>
                        <a style="font-size:12px;display: block; width:auto; height: 28px; border: 1px solid #e8e8e8;  line-height: 28px; float: left; padding-right:3px;padding-left:3px; padding-right:5px; margin-right: 5px; margin-top:5px; color: #b7b7b7;" href="javascript:addToCertification('企业质量管理体系认证证书')">企业质量管理体系认证证书</a>
                    </label>
                </div>
                <div style="clear: both"></div>

                <label style="float: left;">补充说明:</label>
                <textarea id='address' name="address" type="text" value="" class="mui-input-clear mui-input" style="border:solid 1px #808080; border-radius:5px; resize:none;width: 67%;margin-top: 5px;margin-right: 5px;" placeholder="请输入证照要求"></textarea>
                <div style="clear: both"></div>

            </div>
        </div>


        <div class="mui-input-row">
            <label style="float: left;width: 200px;">询价方式及隐私设置:</label>
            <div class="mui-input-row">
                <label style="float: left;">询价方式:</label>
                <li  style="float: left;clear:none;margin-left: 20px;" class="mui-input-row mui-radio mui-left f-cb" >
                    <input style="left: 0px;"  class="mui-radio" id="enquiryMode1" type="radio" value="1" name="enquiryMode" <#if enquiry.enquiryMode != 2>checked="checked"</#if> onclick="selectMerchantsHideOrShow('1');return true;" ><label style="float: left;width: auto;line-height:20px;padding-left:22px;padding-right:0px;margin-top: -10px;"> 广泛征集供应商报价(供应商可以通过搜索找到您的询价单)</label>
                </li>
                <li style="float: left;clear:none;margin-left: 20px;width: 94%" class="mui-input-row mui-radio mui-left f-cb" >
                    <input style="left: 0px;"  class="mui-radio" id="enquiryMode2" type="radio" value="2" name="enquiryMode" <#if enquiry.enquiryMode == 2>checked="checked"</#if>  onclick="selectMerchantsHideOrShow('2');return true;"><label style="width: auto;line-height:5px;padding-left:22px;padding-right:0px;">邀请指定供应商报价</label>
                    <textarea id="merchantIds" name="merchantIds" style="display: none;" >${enquiry.merchantIds}</textarea>
                    <textarea id="merchantNames" name="merchantNames" type="text"  readonly="readonly" class="mui-input-clear mui-input" style="border:solid 1px #808080; border-radius:5px; resize:none;width: 67%;margin-top: 5px;margin-right: 5px;<#if enquiry.enquiryMode != 2>display: none;</#if>" placeholder="请选择供应商">${enquiry.merchantNames}</textarea>
                    <a href="#xzgys" id="buyerMerchant" style="font-size:12px;display: block; width:70px;float: right; height: 28px; line-height: 28px; padding-right:3px;padding-left:3px; margin-right: 5px; margin-top:5px; color: #0171bb;<#if enquiry.enquiryMode != 2>display: none;</#if>">选择供应商</a>
                </li>
                <div style="clear: both"></div>

                <div class="line" style="display: none;">
                    <div class="line-title">采购门户</div>
                    <div class="line-content">
                        <input class="input-r-c " id="purchasePortal1" type="radio" value="1" name="purchasePortal" <#if enquiry.purchasePortal != 2>checked="checked"</#if> >
                        <label for="pub4portal-checkbox-open" class="">公布到我的采购门户</label>
                        <input class="input-r-c" id="purchasePortal2" type="radio" value="2" name="purchasePortal" <#if enquiry.purchasePortal == 2>checked="checked"</#if>>
                        <label for="pub4portal-checkbox-close">不公布到我的采购门户<span class="bing-less">(<a href="#" target="_blank">我的采购门户</a>)</span></label>
                    </div>
                </div>

                <label style="float: left;">联系方式:</label>
                <li  style="float: left;clear:none;" class="mui-input-row mui-radio mui-left f-cb" style="float: left;">
                    <input style="left: 0px;"  class="mui-radio" id="contactMode1" type="radio" name="contactMode" value="1" <#if enquiry.contactMode != 2>checked="checked"</#if> ><label style="float: left;width: 105px;line-height:5px;padding-left:22px;padding-right:0px;">报价后可见</label>
                </li>
                <li style="float: left;clear:none;" class="mui-input-row mui-radio mui-left f-cb" style="float: left;">
                    <input style="left: 0px;" class="mui-radio" id="contactMode2" type="radio" name="contactMode" value="2" <#if enquiry.contactMode == 2>checked="checked"</#if>><label style="float: left;width: 85px;line-height:5px;padding-left:22px;padding-right:0px;">公开</label>
                </li>
                <div style="clear: both"></div>

                <div style="clear: both"></div>
                <label style="float: left;">联&nbsp;&nbsp;系&nbsp;&nbsp;人:<span style="color:red">*</span></label>
                <input id="linkman" name="linkman" type="text" value="${enquiry.linkman}" class="mui-input-clear mui-input" style="width: 68%;" placeholder="请输入联系人">
                <div style="clear: both"></div>

                <label style="float: left;width: 33%">联系人手机:<span style="color:red">*</span></label>
                <input type="tel" id="phone" name="phone" required value="${enquiry.phone}" maxlength="64"  class="mui-input-clear mui-input" style="width: 67%;" placeholder="请输入联系人手机">
                <div style="clear: both"></div>


            </div>
        </div>

            <li class="mui-input-row mui-checkbox mui-left f-cb" style="margin-left: 10px;">
                <input id="iagree-checkbox" type="checkbox" name="iagreeTK" checked="checked" onclick="submitDisable()" style="float: left;top:0px;position:initial">
                <a href="javascript:;"  style="color:#8f8f94;float: left;font-size: 12px;">我已经阅读并同意</a>
                <a href="#yhxy"  style="color:#0171bb;float: left;font-size: 12px;">《询价单发布以及违规处理规则》</a>
            </li>

        <div class="mui-input-row  zyf_line" id="info" style="text-align: center; line-height: 20px;color: red; font-size: 14px;  padding: 8px 0;display: none"></div>
        <div class="mui-content-padded" >
            <input type="submit" id="submit"  style="margin-bottom: 10px;" class="mui-btn mui-btn-block mui-btn-primary" value="确定发布"></input>
        </div>
    </form>
</div>
<!--选择供应商开始-->
<div id="xzgys" class="mui-popover" >
    <div class="mui-popover-arrow"></div>
    <div class="mui-scroll-wrapper">
        <div class="mui-scroll">
            <ul class="mui-table-view">
                <div onclick="selectMerchantsError()" class="mui-icon mui-icon-close" style="margin-right: 5px;float: right;"></div>
                <div class="supplier_main" style="background-color: #0000C0;width: 99%;height: 100%;">
                    <input id="merchantIds" name="merchantIds" type="hidden" value="${merchantIds}"/>
                    <input id="merchantNames" name="merchantNames" type="hidden"  value="${merchantNames}"/>
                    <div style="width: 100%;" class="add_suppliers">
                        <span onclick="setTab('myMerchant','search')"><a href="javascript:void(0)" id="myMerchant_a" style="background: #0171bb;">我的供应商</a></span>
                        <span onclick="setTab('search','myMerchant')"><a href="javascript:void(0)"  id="search_a" >添加供应商</a></span>
                    </div>
                    <div id="menu_con">
                        <div id="search_div" style="float: left; display: block;width: 100%;">
                            <div id="show_merchant" class="supplier_search" style="width: 100%;">
                                <input id="merchantName" style="width: 70%;padding: 5px;line-height:20px;height:30px;margin-left:10px;" type="text" class="supp_search_input" value="${search_mechantName}" placeholder="填写供应商名称">
                                <button onclick="submit_merchantName(); " style="width: 20%;padding:initial;line-height:30px;height:30px;" class="sup_searchs_button">搜索</button>
                            </div>
                            <div id="show_addM">
                            </div>

                        </div>
                        <div id="myMerchant_div" >
                            <div class="sup_lists_con" style="width: 100%;height: 100%;min-height: 100%;">
                            <#--地址循环开始-->
                            <#list merchatList as merchant>
                                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="width: 100%;">
                                    <tr class="addsup_person">
                                        <td style="width: 10%" class="sup_operate">
                                            <div class="mui-input-row mui-checkbox">
                                                <input style="position:initial;right:initial;top: initial; " type="checkbox" name="merchant_cb" value="${merchant.id}" mname="${merchant.name}"
                                                    <#if mids??>
                                                        <#list mids as mid>
                                                            <#if mid == merchant.id> checked="checked" </#if>
                                                        </#list>
                                                    </#if>
                                                       onclick="isSelect();return true;">
                                        </td>
                                        <td style="width: 40%;" class="sup_info">${merchant.name}</td>
                                        <td style="width: 40%;" class="sup_info">
                                        <#--<em>所在地区：</em>-->${merchant.areaPath}
                                        </td>
                                    </tr>
                                </table>
                            </#list>
                            </div>
                            <div class="btns" style="height: 40px;margin-right: 5px;">
                                <span style="color: red;font-weight: bold;font-size: 12px;" id="tip_span"></span>
                                <a id="cancelsuccess" href="javascript:void(0);" class="btn-h2 btn-success">确认</a>&nbsp;&nbsp;&nbsp;
                                <a id="cancelerror" href="javascript:void(0);" class="btn-h2 btn-err">关闭</a>
                            </div>
                        </div>
                    </div>
            </ul>
        </div>
    </div>

</div>
<!--选择供应商结束-->
<#include "app/xd/member/yhxy.ftl"/>
<script src="${path}/js/mui.picker.js"></script>
<script src="${path}/js/mui.dtpicker.js"></script>
<script src="${base}/static/js/jquery.form.js" type="text/javascript"></script>
<script type="text/javascript" src="${base}/static/js/jquery-html5Validate.js"></script>
<script>

    function openView(){
        $("#xzgys").show();
    }


    var colIndex = ${goodsCount};
    var colCount = ${goodsCount};
    var catelogsJson=JSON.parse('${catelogsJson}');
    (function(mui, doc) {
        /*mui.back = function(){
            if('${enquiry.id}' != ''){
                jumpto(fullpath+"/enquiry/list?whichclient=whichapp");
            }else{
                jumpto(fullpath+"/member/index?whichclient=whichapp");
            }
        };*/
        mui.init();
        var cityDatas =  localStorage.getItem("cityDatas");
        var isLoadingCityDatas = false;
        loadCityDatas = function(){
            if(isLoadingCityDatas) return;
            if(typeof(cityDatas) == 'undefined' || cityDatas == null) {
                isLoadingCityDatas = true;
                jQuery.ajax({
                    type: "post",
                    url: fullpath + '/area/ajax/getAllArea',
                    error: function () {
                        isLoadingCityDatas = false;
                    },
                    success: function (result) {
                        isLoadingCityDatas = false;
                        cityDatas = result;
                        localStorage.setItem("cityDatas",cityDatas);
                    }
                });
            }
        };
        //省市区选择控件
        mui.ready(function() {
            loadCityDatas();
           var cityPicker = new mui.PopPicker({
               layer: 3
           });
           var showCityPickerButton = doc.getElementById('showCityPicker');
           var areaId = doc.getElementById('recAreaId');
           var areaPath = doc.getElementById('recAreaPath');
           showCityPickerButton.addEventListener('tap', function (event) {
               if(typeof(cityDatas) == 'undefined' || cityDatas == null) {
                   loadCityDatas();
                   if(isLoadingCityDatas){
                       var interval = window.setInterval(function(){
                           if(isLoadingCityDatas){
                               console.log("Loading city datas ...");
                           }else{
                               window.clearInterval(interval);
                               console.log("Load city datas over");
                               cityPicker.setData(JSON.parse(cityDatas));
                           }
                       },100);

                   }else{
                       cityPicker.setData(JSON.parse(cityDatas));
                   }
               }else{
                   cityPicker.setData(JSON.parse(cityDatas));
               }
               cityPicker.show(function (items) {
                   var address = "";
                   var value = "";
                   if( items[0] != null && typeof(items[0].text) != 'undefined'  ){
                       address = address + items[0].text;
                       value = items[0].value;
                       if( items[1] != null && typeof(items[1].text) != 'undefined'  ){
                           address = address + " " + items[1].text;
                           value = items[1].value;
                           if( items[2] != null && typeof(items[2].text) != 'undefined'  ){
                               address = address + " " + items[2].text;
                               value = items[2].value;
                           }
                       }
                   }
                   showCityPickerButton.innerHTML = address;
                   var pathArray = value.split(",");
                   areaId.value = pathArray[pathArray.length - 1];
                   areaPath.value = value;
               });
           }, false);
        });
        if(ismobile) {
            mui.plusReady(function () {
                //关闭等待框
                plus.nativeUI.closeWaiting();
                //显示当前页面
                plus.webview.currentWebview().show();
            });
        }

        //选择保价截止时间
        jQuery("#datetimeButton").bind("tap",function(){
            var optionsJson = this.getAttribute('data-options') || '{}';
            var options = JSON.parse(optionsJson);
            var id = this.getAttribute('id');
            var picker = new mui.DtPicker(options);
            picker.show(function(rs) {
                if(rs.text > new Date()){
                    mui.toast('不能大于当前日期！');
                    //alert('不能大于当前日期');
                    return false;
                }
                jQuery('#datetimeButton').val(rs.text);
                doc.getElementById('datetimeButton').innerHTML = rs.y.text + '年' + rs.m.text + '月' + rs.d.text + '日' + rs.h.text + '时' + rs.i.text + '分';
                doc.getElementById('offerEndDateTime').value=rs.y.text + '-' + rs.m.text + '-' + rs.d.text + ' ' + rs.h.text + ':' + rs.i.text + ':00';
            });
        });
        //选择期望收货日期
        jQuery("#dateButton").bind("tap",function(){
            var optionsJson = this.getAttribute('data-options') || '{}';
            var options = JSON.parse(optionsJson);
            var id = this.getAttribute('id');
            var picker = new mui.DtPicker(options);
            picker.show(function(rs) {
                if(rs.text > new Date()){
                    mui.toast('不能大于当前日期！');
                    //alert('不能大于当前日期');
                    return false;
                }
                jQuery('#dateButtonImput').val(rs.text);
                doc.getElementById('dateButton').innerHTML = rs.y.text + '年' + rs.m.text + '月' + rs.d.text + '日';
                doc.getElementById('expectReceivDate').value = rs.y.text + '-' + rs.m.text + '-' + rs.d.text + '';

            });
        });
        //添加商品
        jQuery("#addNewColumn").bind("tap",function(){
            /** 判断商品分类有没有选到最后一级  2015-12-10 liuxiaobing add start**/
            //alert($("#categoryId_"+(colIndex-1)).val()+"---"+colIndex)
            if($("#categoryId_"+(colIndex-1)).val()==''){
                mui.toast('商品分类必须选择到最后一级！');
                //alert("商品分类必须选择到最后一级！");
                return;
            }else{
                var baseHtml=' <div id="div_'+colIndex+'" style="height:250px;">' +
                                '<div onclick="delRow('+colIndex+')" class="mui-icon mui-icon-close" style="margin-right: 15px;float: right;"></div>'+
//                                '<div style="clear: both; padding: 10px 0; border-bottom: 1px dotted #d8d8d8; margin-bottom: 15px;"></div>'+
                                '<label style="float: left;">所属分类:<span style="color:red">*</span></label>'+
                                '<button id="catelog'+colIndex+'" onclick="choseCLog(this)"  name="catelogButton" data-align="'+colIndex+'" type="button" data-options="" class="btn mui-btn-picker ">选择商品分类</button>'+
                                '<input type="text" style="margin-top: -36px;width: 40%;float: left;" class="xj-hy" id="categoryName_'+colIndex+'" name="goods['+colIndex+'].categoryName" readonly required="required" value="" />'+
                                '<input type="hidden" class="xj-id" id="categoryId_'+colIndex+'" name="goods['+colIndex+'].categoryId" readonly value=""/>'+
                                '<input type="hidden" class="xj-path" id="categoryPath_'+colIndex+'" name="goods['+colIndex+'].categoryPath"  value="" />'+
                                '<div style="clear: both"></div>'+
                                '<label style="float: left;">产品名称:<span style="color:red">*</span></label>'+
                                '<input id="goodsName_'+colIndex+'" name="goods['+colIndex+'].goodsName" type="text" value="" required class="mui-input-clear mui-input" style="width: 68%;" placeholder="请输入产品名称">'+
                                '<label style="float: left;">数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量:<span style="color:red">*</span></label>'+
                                '<div class="mui-numbox" style="width: 35px;height: 25px;float: left;padding:0 30px;margin-top:5px;">'+
                                '<button class="mui-numbox-btn-minus" style="width: 30px;" type="button" onClick="add_subtract(this)" op="-" >-</button>'+
                                '<input class="mui-numbox-input" style="width: 23px;padding:0 0px!important" type="input"  readonly="true"  id="goodsNum_'+colIndex+'" name="goods['+colIndex+'].goodsNum" min="1" max="1000" value="1" onchange="ckNum(this)"/>'+
                                '<button class="mui-numbox-btn-plus" style="width: 30px;border-left:solid 1px #ccc!important"  type="button" onClick="add_subtract(this)" op="+" >+</button>'+
                                '</div>'+
                                '<div style="clear: both"></div>'+
                                '<label style="float: left;">单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位:<span style="color:red">*</span></label>'+
                                '<input id="goodsUnit_'+colIndex+'" name="goods['+colIndex+'].goodsUnit" style="width: 50px;float: left;padding-right:0px;" required type="text" value="" class="mui-input-clear mui-input" placeholder="单位">'+
                                '<label style="float: left;">产品描述:</label>'+
                                '<textarea id="goodsAccessory_'+colIndex+'" name="goods['+colIndex+'].goodsAccessory" type="text" value="" class="mui-input-clear mui-input" style="border:solid 1px #808080; border-radius:5px; resize:none;width: 67%;margin-top: 5px;margin-right: 5px;" placeholder="请输入产品描述"></textarea>'+
                                '</div>';
                $("#goodList").append(baseHtml);colIndex=colIndex+1;
            }
        });

        //弹出菜单控制
        mui('.mui-scroll-wrapper').scroll();
        mui('body').on('shown', '.mui-popover', function(e) {
            //console.log('shown', e.detail.id);//detail为当前popover元素
        });
        mui('body').on('hidden', '.mui-popover', function(e) {
            //console.log('hidden', e.detail.id);//detail为当前popover元素
        });

        //选择供应商JS开始
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

        $("#cancelsuccess").click(function (){
            selectMerchant();

            if($("#merchantIds").val() == ''){
                $("#tip_span").html("您还没有选择");
            }else{
                parent.selectMerchants($("#merchantIds").val(), $("#merchantNames").val());
            }
        });

        $("#cancelerror").click(function (){
            parent.selectMerchantsError();
        });

        $("#myMerchant_div").show();
        $("#search_div").hide();
        //选择供应商JS结束



    }(mui, document));

    //选择商品分类
    function choseCLog(obj){
        var idx=$(obj).attr("data-align");
        var catelogPicker = new mui.PopPicker({
            layer: 3
        });
        catelogPicker.setData(catelogsJson);
        catelogPicker.show(function (items) {
            var address = "";
            var value = "";
            var id = "";
            if( items[0] != null && typeof(items[0].text) != 'undefined'  ){
                address = address + items[0].text;
                value = items[0].value;
                if( items[1] != null && typeof(items[1].text) != 'undefined'  ){
                    address = address + ">" + items[1].text;
                    value = items[1].value;
                    if( items[2] != null && typeof(items[2].text) != 'undefined'  ){
                        address = address + ">" + items[2].text;
                        value = items[2].value;
                        id=items[2].id;
                    }
                }
            }
            obj.innerHTML = address;
            $("#categoryName_"+idx).val(address);
            $("#categoryId_"+idx).val(id);
            $("#categoryPath_"+idx).val(value)
        });
    }
    //删除单个商品
    function delRow(id){
        $("#div_"+id).remove();
        mui.toast('删除成功！');
    }


    //加减
    function add_subtract(obj){
        var op=$(obj).attr("op");//加减标识
        var min=1;//最大值
        var max=1000;//最小值
        var reg = new RegExp("^[0-9]*$");
        if(op=='+'){
            if($(obj).prev().attr("max")!='' &&　$(obj).prev().attr("max")!='undefined' &&　reg.test($(obj).prev().attr("max"))){
                max=$(obj).prev().attr("max")
            }
            if(parseInt($(obj).prev().val())<max){
                $(obj).prev().val(parseInt($(obj).prev().val())+1)
            }
        }else{
            if($(obj).next().attr("min")!='' &&　$(obj).next().attr("min")!='undefined' &&　reg.test($(obj).next().attr("min"))){
                min=$(obj).next().attr("min")
            }
            if(parseInt($(obj).next().val())>min){
                $(obj).next().val(parseInt($(obj).next().val())-1)
            }
        }
    }
    //校验商品数量输入框
    function ckNum(obj){
        var reg = new RegExp("^[0-9]*$");
        if(!reg.test($(obj).val()) || parseInt($(obj).val())<=0){
            $(obj).val(1)
        }
    }
    //添加常用证照
    function addToCertification(content){
        var certification = $("#certification").val();
        if( certification.indexOf(content) < 0 ){
            while(certification.indexOf("，") != -1) {
                certification = certification.replace("，", ",");
            }

            if($.trim(certification).length == 0){
                certification += content;
            }else {
                certification += ',' + content;
            }
        }
        $("#certification").val(certification);
    }
    //选择供应商填入值
    function selectMerchants(merchantIds, merchantNames) {
        mui('.mui-popover').popover('toggle');
        $("#merchantIds").val(merchantIds);
        $("#merchantNames").val(merchantNames);
    }
    //关闭选择供应商框
    function selectMerchantsError(){
        $(".mui-popover").hide();
        $(".mui-active").hide();
       /* mui('.mui-popover').hide();*/
    }
    //打开关闭选择供应商界面
    function selectMerchantsHideOrShow(enquiryMode){
        if( enquiryMode == '1' ){
            $("#merchantNames").hide()
            $("#buyerMerchant").hide()
        }else{
            $("#merchantNames").show()
            $("#buyerMerchant").show()
        }
    }
    //提交按钮可用不可用
    function submitDisable(){
        var iagreeTK = $("input[name='iagreeTK']:checked");
        if( iagreeTK.length > 0 ){
            $("#submit").removeAttr("disabled");
            $("#submit").removeClass("go-btn-disable");
        }else{
            $("#submit").attr("disabled","disabled");
            $("#submit").addClass("go-btn-disable");
        }
    }

    //选择供应商js开始
    function submit_merchantName(){
        var merchantName = $("#merchantName").val();
        if(isEmpty(merchantName)){
            mui.toast('供应商名称不能为空！');
            //alert('供应商名称不能为空!');
            return;
        }

        if(merchantName.length >20){
            mui.toast('供应商名称长度不超过20！');
            //alert('供应商名称长度不超过20!');
            return;
        }

        $.ajax({
            type: "post",
            url: "${base}/buyerMerchant/findMerchant",
            data:{'merchantName':merchantName},
            datatype: 'json',
            error: function () {
                mui.toast('err');
                //alert('err');
            },
            success: function(result) {
                $("#show_addM").addClass("sup_list_namets");
                $("#show_addM").show();
                var jsonObj=eval(result.list);
                var html = "<span class='show_add_sup'>请从以下列表选择要添加的供应商</span>";
                html += "<table border='0' cellpadding='0' cellspacing='0' class='show_sup_table'>";
                html+="<tr>";
                html+="<td width='100'>序号</td>";
                html+="<td width='500'>采购商名称</td>";
                html+="<td width='100'>操作</td>";
                html+="</tr>";


                var flag = true;
                $.each(jsonObj, function (i, item) {
                    if(flag){
                        flag = false;
                    }
                    html+="<tr>";
                    html+="<td align='center'>"+(i+1)+"</td>";
                    html+="<td>"+item.name+"</td>";
                    html+="<td><button class='confirm_button' style='padding:initial;margin-top:7px;' onclick='submit_addMer(\""+item.id+"\");'>添加</button></td>";
                    html+="</tr>";
                });

                if( flag ){
                    html+="<tr>";
                    html+="<td colspan='3'><span style='color: red;font-weight: bold;'>无数据！</span></td>";
                    html+="</tr>";
                }

                html+="</table>";
                $("#show_addM").html(html);
            }
        });
    }

    function submit_addMer(merchantId){
        if(isEmpty(merchantId)){
            mui.toast('请选择供应商');
            //alert('请选择供应商!');
            return;
        }
        $("#show_addM").hide();
        selectMerchant();
        var merchantIds = $("#merchantIds").val();
        var merchantNames = $("#merchantNames").val();
        $.ajax({
            type: "post",
            url: "${base}/buyerMerchant/save",
            data:{'merchantId':merchantId},
            datatype: 'json',
            error: function () {
                mui.toast('error');
                //alert('error');
            },
            success: function(result) {
                if("success"==result.status){
                    mui.toast('添加成功');
                    //alert('添加成功!');
                    window.location="${base}/enquiry/getBuyersPopup?merchantIds="+ merchantIds +"&merchantNames="+encodeURI(encodeURI(merchantNames)) +"&searchName="+encodeURI(encodeURI( $("#merchantName").val() ));
                }else if("report"==result.status){
                    mui.toast(result.message);
                    //alert(result.message);
                }else{
                    mui.toast('error');
                    //alert('error')
                }
            }
        });

    }


    function selectMerchant(){
        var merchantIds = "";
        var merchantNames = "";
        var i = 0;
        $("input[name='merchant_cb']:checked").each(function(){
            if( i > 0 ){
                merchantIds += ",";
                merchantNames += ",";
            }
            merchantIds += $(this).val();
            merchantNames += $(this).attr("mname");
            i++;
        });
        $("#merchantIds").val(merchantIds);
        $("#merchantNames").val(merchantNames);
    }

    function isSelect(){
        selectMerchant();
        if($("#merchantIds").val()==''){
            $("#tip_span").html("您还没有选择");
        }else{
            $("#tip_span").html("");
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

    function setTab(s,h){
        $("#"+s +"_div").show();
        $("#"+s +"_a").css("background","#0171bb");
        $("#"+h +"_div").hide();
        $("#"+h +"_a").css("background","#a9a9a9");
    }
    //选择供应商js结束



         //表单验证
    $("#enquiryForm").html5Validate(function() {
        var certification = $("#certification").val();
        if($.trim(certification) != '' ) {
            while (certification.indexOf("，") != -1) {
                certification = certification.replace("，", ",");
            }
        }
        $("#certification").val(certification);
        /** 判断商品分类有没有选到最后一级  2015-10-25 hks add start**/
        if($("#categoryId_"+(colIndex-1)).val()==''){
            mui.toast('商品分类必须选择到最后一级！');
            //alert("商品分类必须选择到最后一级！");
            return;
        }
        /** 判断商品分类有没有选到最后一级  2015-10-25 hks add end**/
        $.ajax({
            type: "POST",
            url: $("#enquiryForm").attr("action"),
            data: $("#enquiryForm").serialize(),
            dataType: 'json',
            cache: false,
            async:false,
            success: function(data){
                if( data.status == 'success' ){
                    window.location.href = "${base}/enquiry/list.html?whichclient=whichapp";
                }else{
                    if(data.message=='nologin'){
                        window.location.reload();
                    }else{
                        mui.toast(data.message);
                        //alert(data.message);
                    }
                }
                return false;
            },
            error:function(data){
                window.location.reload();
            }
        });


    }, {
        validate: function() {
            //收货地址验证
            var recAreaId = $("#recAreaId").val();
            var areaPath = $("#recAreaPath").val();
            if($.trim(recAreaId) == '' || $.trim(areaPath) == ''){
                $("#showCityPicker").testRemind("请选收货地址");
                $("#showCityPicker").focus();
                return false;
            }
            // 供应商验证
            var enquiryMode = $("input[name='enquiryMode']:checked").val();
            if( enquiryMode == '2' ){
                if($.trim($("#merchantIds").val()) == '' ){
                    $("#merchantNames").testRemind("请选择供应商");
                    return false;
                }
            }
            // 交易方式
            var tradeExchange = $("input[name='tradeExchange']:checked").val();
            if( tradeExchange == '2' ){
                if($.trim($("#otherTrade").val()) == '' ){
                    $("#otherTrade").testRemind("请输入其他交易方式");
                    $("#otherTrade").focus();
                    return false;
                }
            }

            return true;
        }
    });
</script>
</body>

</html>