<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <link href="${base}/static/bec/project/imgages/favicon.ico" rel="shortcut icon" />

    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/base/css/reset.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/base/css/function.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/jp/css/header.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/jp/css/inquiry_sheet.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/jp/css/footer.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" type="text/css" href="${base}/static/bec/project/jp/css/jydz.css">
    <link href="${base}/static/bec/project/jp/css/font-awesome.min.css" rel="stylesheet"/>

    <link rel="stylesheet" type="text/css" href="${base}/static/bec/project/jp/css/common.css">

    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${base}/static/bec/base/js/jquery.cookies.js"></script>
    <script src="${base}/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript" src="${base}/static/js/jquery-html5Validate.js"></script>
    <script src="${base}/ueditor/ueditor.config_simple.js" type="text/javascript"></script>
    <script src="${base}/ueditor/ueditor.all.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${base}/static/bec/base/js/layer.js"></script>

    <script type="text/javascript">
        window.pageConfig={
            compatible:true,
            navId:"enquiry_add"
        };
    </script>
</head>
<body style="background: #f7f7f7;">
<#include "bec/jp/top3.ftl"/>

<div class="inquiry-main">
    <form action="${base}/enquiry/save" id="enquiryForm" >
        <h1 class="inquiry-title">询 价 单</h1>
        <div class="xj-box">
            <div class="xj-in-title"><h3><label for="title"><em class="star" style="color: red;font-family: '宋体';font-size: 12px;">*</em>标题</label></h3></div>
            <div class="xj-tit-inputs">
                <input id="title" name="title" type="text" value="${enquiry.title}" required data-max="30" data-min="2" placeholder="为该询价单写个标题(必填)">
            </div>
        </div>
        <div class="xj-box">
            <div class="xj-in-title"><h3>询价产品</h3></div>
            <div class="xj-radio">
                <span><input  id="isSpot1" name="isSpot" type="radio" value="1" <#if enquiry.isSpot != 2>checked="checked"</#if>>现货/标准品</span>
                <span><input  id="isSpot2" name="isSpot" type="radio" value="2" <#if enquiry.isSpot == 2>checked="checked"</#if>>加工/定制品</span>
            </div>
            <div class="xj-table">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr class="xj-table-tit">
                        <td width="5">&nbsp;</td>
                        <td width="255"><em class="star" style="color: red;font-family: '宋体';font-size: 12px;">*</em>所属分类</td>
                        <td width="255"><em class="star" style="color: red;font-family: '宋体';font-size: 12px;">*</em>产品名称</td>
                        <td width="115"><em class="star" style="color: red;font-family: '宋体';font-size: 12px;">*</em>数量</td>
                        <td width="78"><em class="star" style="color: red;font-family: '宋体';font-size: 12px;">*</em>单位</td>
                        <td width="255">产品描述</td>
                    </tr>
                    <tbody id="goodsTable">
                    <#if goods??>
                        <#list goods as good>
                        <tr class="xj-table-con2" id="good_col_${good_index}">
                            <td>
                                <span class="col_del_span">&nbsp;</span>
                                <img class="col_del" src="${base}/static/bec/project/jp/images/inquiry/jian_icon.jpg" onclick="removeColumn('good_col_${good_index}')" ></img>
                            </td>
                            <td>
                                <label for="categoryName_0" style="display: none;">所属分类</label>
                                <input type="text" class="xj-hy" id="categoryName_${good_index}" name="goods[${good_index}].categoryName" readonly required="required" value="${good.categoryName}" />
                                <input type="hidden" class="xj-id" id="categoryId_${good_index}" name="goods[${good_index}].categoryId" readonly value="${good.categoryId}"/>
                                <input type="hidden" class="xj-path" id="categoryPath_${good_index}" name="goods[${good_index}].categoryPath"  value="${good.categoryPath}" />
                            </td>
                            <td><label for="goodsName_0" style="display: none;">产品名称</label><input type="text" class="xj-cp-name" id="goodsName_${good_index}" name="goods[${good_index}].goodsName" value="${good.goodsName}" required data-max="30" data-min="2"></td>
                            <td><label for="goodsNum_0" style="display: none;">数量</label><input type="number" class="xj-number" id="goodsNum_${good_index}" name="goods[${good_index}].goodsNum" value="${good.goodsNum}" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')"  required="required" max="1000000" min="1" ></td>
                            <td><label for="goodsUnit_0" style="display: none;">单位</label><input type="text" class="xj-dw" id="goodsUnit_${good_index}" name="goods[${good_index}].goodsUnit" value="${good.goodsUnit}" required data-max="8" data-min="1" placeholder="件、吨" ></td>
                            <td><input type="text" class="xj-cp-ms" id="goodsDescribe_${good_index}" name="goods[${good_index}].goodsDescribe" value="${good.goodsDescribe}"  readonly="readonly" placeholder="填写规格说明，报价更精准" onfocus="showDescByIndex('${good_index}')"></td>
                        </tr>
                        <tr class="xj-table-con" id="desc_good_col_${good_index}" style="display: none;" >
                            <td><span>&nbsp;</span></td>
                            <td colspan="5">
                                <div class="title_editor"><h3>产品描述</h3>
                                    <a href="javascript:hideAndGetByIndex('${good_index}')">隐藏</a>
                                </div>
                                <div id="goodsDescribe_ta_${good_index}_" class="bj_editor" >
                                    <input type="hidden" id="goodsAccessory_${good_index}" name="goods[${good_index}].goodsAccessory" value='${good.goodsAccessory}'>
                                    <script type="text/javascript">
                                        var ue${good_index} = UE.getEditor('goodsDescribe_ta_${good_index}_');
                                        var introductionHtml${good_index} = $('#goodsAccessory_${good_index}').val();
                                        ue${good_index}.addListener('ready', function () {
                                            ue${good_index}.setContent(introductionHtml${good_index});
                                        });
                                        ue${good_index}.addListener('blur', function () {
                                            setValByIndex('${good_index}');
                                        });
                                    </script>
                                </div>
                            </td>
                        </tr>
                        </#list>
                    <#else >
                    <tr class="xj-table-con2" id="good_col_0">
                        <td>
                            <span class="col_del_span">&nbsp;</span>
                            <img class="col_del" src="${base}/static/bec/project/jp/images/inquiry/jian_icon.jpg" onclick="removeColumn('good_col_0')" ></img>
                        </td>
                        <td><label for="categoryName_0" style="display: none;">所属分类</label>
                            <input type="text" class="xj-hy" id="categoryName_0" name="goods[0].categoryName" readonly required/>
                            <input type="hidden" class="xj-id" id="categoryId_0" name="goods[0].categoryId" readonly />
                            <input type="hidden" class="xj-path" id="categoryPath_0" name="goods[0].categoryPath" value="" />
                        </td>
                        <td><label for="goodsName_0" style="display: none;">产品名称</label><input type="text" class="xj-cp-name" id="goodsName_0" name="goods[0].goodsName" required data-max="30" data-min="2"></td>
                        <td><label for="goodsNum_0" style="display: none;">数量</label><input type="number" class="xj-number" id="goodsNum_0" name="goods[0].goodsNum" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')"  required="required" max="1000000" min="1" value="1"></td>
                        <td><label for="goodsUnit_0" style="display: none;">单位</label><input type="text" class="xj-dw" id="goodsUnit_0" name="goods[0].goodsUnit" value="" required data-max="8" data-min="1" placeholder="件、吨"></td>
                        <td><input type="text" class="xj-cp-ms" id="goodsDescribe_0" value=""  readonly="readonly" placeholder="填写规格说明，报价更精准" onfocus="showDescByIndex('0')"></td>
                    </tr>
                    <tr class="xj-table-con" id="desc_good_col_0" style="display: none;" >
                        <td><span>&nbsp;</span></td>
                        <td colspan="5">
                            <div class="title_editor"><h3>产品描述</h3><a href="javascript:hideAndGetByIndex('0')">隐藏</a></div>
                            <div id="goodsDescribe_ta_0_" class="bj_editor" >
                                <input type="hidden" id="goodsAccessory_0" name="goods[0].goodsAccessory" value="${enquiry.goodsAccessory}">
                                <script type="text/javascript">
                                    var ue0 = UE.getEditor('goodsDescribe_ta_0_');
                                    var introductionHtml0 = $('#goodsAccessory_0').val();
                                    ue0.addListener('ready', function () {
                                        ue0.setContent(introductionHtml0);
                                    });
                                    ue0.addListener('blur', function () {
                                        setValByIndex('0');
                                    });
                                </script>
                            </div>
                        </td>
                    </tr>
                    </#if>
                    </tbody>
                </table>
            </div>
            <div class="xj-operate">
                <img src="${base}/static/bec/project/jp/images/inquiry/add_icon.jpg"><span id="btn" onclick="btn()"><a href="javascript:void(0)" id="addNewColumn">添加产品</a><#-- | <a href="#">批量导入</a>--></span>
            </div>
        </div>
        <div class="xj-box">
            <div class="xj-in-title"><h3>采购要求</h3></div>
            <div class="offer-content">
                <div class="line">
                    <div class="line-title line-title-l"><em class="star">*</em><label for="offerEndDateTime">报价截止时间</label></div>
                    <div class="line-content gmt-expire-con">
                        <input readonly class="go-input-datepicker gmt-receive" type="text" id="offerEndDateTime" name="offerEndDateTimeStr" value="${enquiry.offerEndDateTime?string("yyyy-MM-dd HH:mm:ss")}"  onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'%y-%M-%d %H:%m:%s',maxDate:'#F{if($(\'#expectReceivDate\').val()!=\'\')return $(\'#expectReceivDate\').val() + \' 00:00:00\'}'})" required><em class="bing-less"></em>
                    </div>
                </div>
                <div class="line">
                    <div class="line-title line-title-l">期望收货日期</div>
                    <div class="line-content gmt-receive-con">
                        <input readonly class="go-input-datepicker gmt-receive" id="expectReceivDate" name="expectReceivDate" type="text" <#if enquiry.expectReceivDate??>value="${enquiry.expectReceivDate?string("yyyy-MM-dd")}"</#if> onclick="WdatePicker({minDate:'#F{$dp.$D(\'offerEndDateTime\',{d:+1})}'})"><em class="bing-less" style="display: none;"></em>
                    </div>
                </div>
                <div class="line" style="display: none;">
                    <div class="line-title line-title-mt">报价要求</div>
                    <div class="line-content">
                        <input type="checkbox" class="" id="isContainTax" name="isContainTax" value="2" <#if enquiry.isContainTax != 1>checked="checked"</#if>> 需要报含税价
                    </div>
                </div>
                <div class="line">
                    <div class="line-title line-title-l"><em class="star">*</em><label for="recAddress">收货地</label></div>
                    <div class="line-content">
                        <div class="go-input-pca-wrap" id="areaSelect_div">
                            <input readonly class="areaSelect" id="areaSelect" name="areaSelect" type="text">
                            <input id="recAreaId" type="hidden" name="recAreaId" value="${enquiry.recAreaId}">
                            <input id="recAreaPath" type="hidden" name="recAreaPath" value="${enquiry.recAreaPath}">
                        </div>
                    <#--<div  class="go-input-pca-wrap-2">-->
                    <#--<input class="go-input-common-2" id="recAddress" type="text" name="recAddress" value="${enquiry.recAddress}"  required data-max="60" data-min="2">-->
                    <#--</div>-->
                    </div>
                </div>
            <#-- 添加详细收货地址   hks modify start-->
                <div class="line">
                    <div class="line-title line-title-l"><em class="star">*</em><label for="recAddress">详细收货地址</label></div>
                    <div class="line-content">
                        <div  class="go-input-pca-wrap-2">
                            <input class="go-input-common-2" id="recAddress" type="text" name="recAddress" value="${enquiry.recAddress}"  required data-max="60" data-min="2">
                        </div>
                    </div>
                </div>
            <#-- 添加详细收货地址   hks modify end-->
                <div class="line">
                    <div class="line-title">对供应商要求</div>
                    <div class="line-content xj-supplier">
                        <table >
                            <tr>
                                <td>交易方式</td>
                                <td>
                                    <input type="radio" class="go-radio" id="tradeExchange1" name="tradeExchange" value="1" <#if enquiry.tradeExchange != 2>checked="checked"</#if> onclick="$('#otherTrade').hide();return true;"> 支付宝
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <div style="float: left;"><input type="radio" class="go-radio" id="tradeExchange2" name="tradeExchange" value="2" onclick="$('#otherTrade').show();return true;" <#if enquiry.tradeExchange == 2>checked="checked"</#if>> 其他交易方式</div>
                                    <input class="go-input-common" type="text" id="otherTrade" name="otherTrade" value="${enquiry.otherTrade}" data-max="30" data-min="0" <#if enquiry.tradeExchange != 2>style="display: none; margin-top: 0px;"</#if> >
                                </td>
                            </tr>
                            <tr>
                                <td>发票要求</td>
                                <td>
                                    <input type="radio" class="go-radio" id="invoiceRequire1" name="invoiceRequire" value="1" <#if enquiry.isSpot != 2>checked="checked"</#if>> 无需发票 &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" class="go-radio" id="invoiceRequire2" name="invoiceRequire" value="2" <#if enquiry.isSpot == 2>checked="checked"</#if>> 普通发票
                                </td>
                            </tr>
                            <tr>
                                <td>经营地址</td>
                                <td>
                                    <textarea name="manageArea" id="manageArea" style="width:280px; min-height:40px; height:auto !important; height:20px;line-height:20px;margin-left: 18px; padding:10px;" readonly="readonly" >${enquiry.manageArea}</textarea>
                                <#include "bec/jp/b2b/jydz.ftl"/>
                                </td>
                            </tr>
                            <tr>
                                <td>注册资金</td>
                                <td>
                                    <input type="text" class="go-input-common" id="registeredCapital" name="registeredCapital" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="6"  value="${enquiry.registeredCapital}">
                                    <span class="money_unit">万元及以上</span>
                                </td>
                            </tr>
                            <tr>
                                <td>证照要求</td>
                                <td>

                                    <textarea class="bj_textarea bj_textarea_ml" id="certification" name="certification" rows="" cols="" maxlength="300" >${enquiry.certification}</textarea>
                                    <div class="bj_license">
                                        <b style="margin-top:8px;">常用证照：</b>
                                        <ul>
                                            <li><a href="javascript:addToCertification('营业执照')">营业执照</a></li>
                                            <li><a href="javascript:addToCertification('税务登记证')">税务登记证</a></li>
                                            <li><a href="javascript:addToCertification('组织机构代码证')">组织机构代码证</a></li>
                                            <li><a href="javascript:addToCertification('国际和国内的产品认证证书')">国际和国内的产品认证证书</a></li>
                                            <li><a href="javascript:addToCertification('环境管理体系认证证书')">环境管理体系认证证书</a></li>
                                            <li><a href="javascript:addToCertification('企业质量管理体系认证证书')">企业质量管理体系认证证书</a></li>
                                        </ul>
                                        <div>
                                            <span><b>多个以逗号“,”隔开</b></span>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td>&nbsp;</td>
                                <td>
                                    <input type="checkbox" class="go-checkbox" id="isSecrecyAgreement" name="isSecrecyAgreement" value="2" <#if enquiry.isContainTax == 2>checked="checked"</#if>> 需供应商签署<a href="javascript:void(0)">保密协议</a>才能查看详情、报价
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="line">
                    <div class="line-title">补充说明</div>
                    <div class="line-content" >
                        <div id="replenishExplain_" class="bj_editor2">
                            <input type="hidden" id="replenishExplain" name="replenishExplain" value='${enquiry.replenishExplain}'>
                            <script type="text/javascript">
                                var ueReplenishExplain_ = UE.getEditor('replenishExplain_');
                                var replenishExplain = $('#replenishExplain');
                                ueReplenishExplain_.addListener('ready', function () {
                                    ueReplenishExplain_.setContent(replenishExplain.val());
                                });
                                ueReplenishExplain_.addListener('blur', function () {
                                    replenishExplain.val(ueReplenishExplain_.getContent());
                                });
                            </script>
                        </div>
                    </div>
                </div>
                <div class="xj-box">
                    <div class="xj-in-title"><h3>询价方式及隐私设置</h3></div>
                    <div class="offer-content xj-set">
                        <div class="line">
                            <div class="line-title line-title-mt">询价方式</div>
                            <div class="line-content">
                                <p>
                                    <input class="input-r-c" id="enquiryMode1" type="radio" value="1" name="enquiryMode" <#if enquiry.enquiryMode != 2>checked="checked"</#if> onclick="selectMerchantsHideOrShow('1');return true;">
                                    <label for="pub4open-checkbox-open">广泛征集供应商报价<span class="bing-less">(供应商可以通过搜索找到您的询价单)</span></label>
                                </p>
                                <p>
                                    <input class="input-r-c" id="enquiryMode2" type="radio" value="2" name="enquiryMode" <#if enquiry.enquiryMode == 2>checked="checked"</#if>  onclick="selectMerchantsHideOrShow('2');return true;">
                                    <label for="pub4open-checkbox-close">邀请指定供应商报价</label>
                                <div id="selectMerchantDiv"  <#if enquiry.enquiryMode != 2>style="display: none;"</#if> class="chooes_gys_box">
                                    <span class="chooes_gys"><a href="${base}/enquiry/getBuyersPopup" id="buyerMerchant" >选择供应商</a></span>
                                    <textarea id="merchantIds" name="merchantIds" style="display: none;" >${enquiry.merchantIds}</textarea>
                                    <textarea id="merchantNames" name="merchantNames" class="choose_gys_textarea" readonly="readonly" >${enquiry.merchantNames}</textarea>
                                </div>
                                </p>
                            </div>
                        </div>
                        <div class="line" style="display: none;">
                            <div class="line-title">采购门户</div>
                            <div class="line-content">
                                <input class="input-r-c " id="purchasePortal1" type="radio" value="1" name="purchasePortal" <#if enquiry.purchasePortal != 2>checked="checked"</#if> >
                                <label for="pub4portal-checkbox-open" class="">公布到我的采购门户</label>
                                <input class="input-r-c" id="purchasePortal2" type="radio" value="2" name="purchasePortal" <#if enquiry.purchasePortal == 2>checked="checked"</#if>>
                                <label for="pub4portal-checkbox-close">不公布到我的采购门户<span class="bing-less">(<a href="#" target="_blank">我的采购门户</a>)</span></label>
                            </div>
                        </div>
                        <div class="line radio-line">
                            <div class="line-title line-title-mt">联系方式</div>
                            <div class="line-content">
                                <input class="input-r-c" id="contactMode1" type="radio" name="contactMode" value="1" <#if enquiry.contactMode != 2>checked="checked"</#if>>
                                <label for="after-seen-radio">报价后可见</label>
                                <input class="input-r-c" id="contactMode2" type="radio" name="contactMode" value="2" <#if enquiry.contactMode == 2>checked="checked"</#if>>
                                <label for="seen-radio">公开</label>
                            </div>
                        </div>
                        <div class="line">
                            <div class="line-title line-title-l line-title-mt2">
                                <em class="star">*</em><label for="linkman">联系人</label>
                            </div>
                            <div class="line-content">
                                <input class="go-input-common bj_textarea_ml2" maxlength="32" type="text" id="linkman" name="linkman" required data-max="20" data-min="2" value="${enquiry.linkman}">
                            </div>
                        </div>
                        <div class="line">
                            <div class="line-title line-title-l line-title-mt2">
                                <em class="star">*</em><label for="phone">联系人手机</label>
                            </div>
                            <div class="line-content">
                                <input class="go-input-common bj_textarea_ml2" type="tel" id="phone" name="phone" required value="${enquiry.phone}" maxlength="64" >
                            </div>
                        </div>

                    </div>
                    <div class="submit-cell">
                        <p><input type="checkbox" class="input-r-c" id="iagree-checkbox" name="iagreeTK" checked="checked" onclick="submitDisable()"><label for="iagree-checkbox"> 我已经阅读并同意</label><a href="${base}/html/jp/enquiry_agreement.html" class="col-017" id="enquiryAgreementId">《询价单发布以及违规处理规则》</a>
                        </p>
                        <input type="submit" class="go-btn-b-l" id="submit" value="确定发布">
                    </div>
                </div>
            </div>
        </div>

    </form>

</div>

<#include "bec/jp/b2b/spfl.ftl"/>
<#include "bec/jp/service.ftl"/>
<#include "bec/jp/foot.ftl"/>
<script src="${base}/static/js/jquery.form.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.lSelect.js" type="text/javascript"></script>
<script src="${base}/static/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jdropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/Jlazyload.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/trimpath.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/jsonp.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/dropdown.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/slider.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/category.js" type="text/javascript"></script>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script type="text/javascript">

    var colIndex = ${goodsCount};
    var colCount = ${goodsCount};



    $(function () {
        $("#buyerMerchant").colorbox({iframe:true, innerWidth:700, innerHeight:500, opacity: 0.15,overlayClose:false, scrolling: true});

        //设置发布询价单协议
        $("#enquiryAgreementId").colorbox({title:"询价单发布以及违规处理规则", iframe:true, innerWidth:600, innerHeight:500, opacity: 0.15});


        $(".areaSelect").val('${enquiry.recAreaPath}');
        $(".areaSelect").lSelect({
            url: "${base}/area/ajaxChildren"// Json数据获取url
        });


        if($("#areaSelect_div .lSelect ").length > 0){
            $("#areaSelect_div .lSelect ").attr("required","required");
        }
//        $("#areaSelect_div .areaSelect")[0].attr("required","required");


        $("#goodsTable").on('click','.xj-hy',function(){
            $(".category_select_container").show().css({top:$(this).offset().top+37+"px",left:$(this).offset().left+"px"}).attr("index",$(this).parents("tr").index());
        });
        $(".close").on('click',function(){
            $(".category_list").eq(0).find("li").removeClass("current");
            $(".category_list").eq(1).html("");
            $(".category_list").eq(2).html("");
            $(this).parents(".category_select_container").hide().removeAttr("index");
        });
        $(".category_list").on('click','li',function(){
            $(this).parent("ul").find("li").removeClass("current");
            $(this).addClass("current");
            var id=$(this).find("a").attr("categoryid");
            var level=$(this).parent("ul").attr("level");
            var path=$(this).find("a").attr("catelogpath");
            var pathname="";
            if(level<3) {
                $.ajax({
                    url: "${base}/getSons",
                    data: {id: id},
                    success: function (data) {
                        if (data.status == "exception") {
                            alert(data.message);
                        } else if (data.status == "success") {
                            level++;
                            $(".category_list").eq(level-1).html("");
                            $(".category_list").eq(level).html("");
                            var html = "";
                            var itemclass = "class=\"item_p\"";
                            if (level == 3) {
                                itemclass = "";
                            }
                            $.each(data.sons, function (index, catelog) {
                                html += "<li><a href=\"javascript:;\" target=\"_self\" leaf=\"0\" categoryid=\"" + catelog.id + "\" catelogpath=\"" + catelog.path + "\" title=\"" + catelog.name + "\" " + itemclass + ">" + catelog.name + "</a></li>";
                            })
                            $(".category_list").eq(level-1).html(html);
                            if(level==2){
                                pathname = $(".category_list").eq(0).find(".current > a").text()+">";
                            }else if(level==3){
                                pathname = $(".category_list").eq(0).find(".current > a").text()+">" + $(".category_list").eq(1).find(".current > a").text()+">";
                            }
                        } else {
                            $(this).removeClass("item_p");
                            if(level==1){
                                pathname = $(".category_list").eq(0).find(".current > a").text();
                            }else if(level==2){
                                pathname = $(".category_list").eq(0).find(".current > a").text()+">" + $(".category_list").eq(1).find(".current > a").text();
                            }
                            $("#goodsTable > tr").eq($(".category_select_container").attr("index")).find(".xj-id").val(id);
                            $("#goodsTable > tr").eq($(".category_select_container").attr("index")).find(".xj-path").val(path);
                            level++;
                            $(".category_list").eq(level-1).html("");
                            $(".category_list").eq(level).html("");
                        }
                    },
                    error: function () {
                        alert("获取服务器数据失败！请刷新后重试！");
                    }
                });
            }else{
                pathname = $(".category_list").eq(0).find(".current > a").text()+">" + $(".category_list").eq(1).find(".current > a").text()+">" + $(this).find("a").text();
                $("#goodsTable > tr").eq($(".category_select_container").attr("index")).find(".xj-id").val(id);
                $("#goodsTable > tr").eq($(".category_select_container").attr("index")).find(".xj-path").val(path);
            }
            $("#goodsTable > tr").eq($(".category_select_container").attr("index")).find(".xj-hy").val(pathname);
        });

        hideOrShowRemoveBtn();

        $("#enquiryForm").html5Validate(function() {

            var areaPath = $(".areaSelect").val();
            $("#recAreaPath").val(areaPath);
            var areaId = areaPath.substring(areaPath.lastIndexOf(',')+1,areaPath.length);
            $("#recAreaId").val(areaId);

            var certification = $("#certification").val();
            if($.trim(certification) != '' ) {
                while (certification.indexOf("，") != -1) {
                    certification = certification.replace("，", ",");
                }
            }
            $("#certification").val(certification);
            /** 判断商品分类有没有选到最后一级  2015-10-25 hks add start**/
            if($("#categoryId_"+(colIndex-1)).val()==''){
                alert("商品分类必须选择到最后一级！");
                return;
            }
            /** 判断商品分类有没有选到最后一级  2015-10-25 hks add end**/
            var load_index = layer.load();

            $.ajax({
                type: "POST",
                url: $("#enquiryForm").attr("action"),
                data: $("#enquiryForm").serialize(),
                dataType: 'json',
                cache: false,
                async:false,
                success: function(data){
                    layer.close(load_index);
                    if( data.status == 'success' ){
                        window.location.href = "${base}/enquiry/list.html";
                    }else{
                        if(data.message=='nologin'){
                            window.location.reload();
                        }else{
                            layer.msg(data.message,{icon:7});
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
                // 下面这些就是额外的一些特殊验证
                var areaPath = $(".areaSelect").val();
                if($.trim(areaPath) == '' || areaPath.indexOf(",") < 0  ){
                    $(".lSelect").testRemind("请选择省市");
                    return false;
                }

                var enquiryMode = $("input[name='enquiryMode']:checked").val();
                if( enquiryMode == '2' ){
                    if($.trim($("#merchantIds").val()) == '' ){
                        $("#merchantNames").testRemind("请选择供应商");
                        return false;
                    }
                }

                return true;
            }
        });

        $("#addNewColumn").click(function(){
            /** 判断商品分类有没有选到最后一级  2015-10-25 hks add start**/
            if($("#categoryId_"+(colIndex-1)).val()==''){
                alert("商品分类必须选择到最后一级！");
                return;
            }
            /** 判断商品分类有没有选到最后一级  2015-10-25 hks add end**/
            var html = '<tr class="xj-table-con2" id="good_col_'+colIndex+'">';
            html += '<td style="vertical-align: middle;"><span class="col_del_span">&nbsp;</span><img class="col_del" src="${base}/static/bec/project/jp/images/inquiry/jian_icon.jpg" onclick="removeColumn(\'good_col_'+colIndex+'\')"></img></td>';
            html += '<td>';
            html += '<label for="categoryName_'+colIndex+'" style="display: none;">所属分类</label><input type="text" class="xj-hy" id="categoryName_0" name="goods[0].categoryName" readonly required/>';
            html += '<input type="hidden" class="xj-id" id="categoryId_'+colIndex+'" name="goods['+colIndex+'].categoryId" required/>';
            html += '<input type="hidden" class="xj-path" id="categoryPath_'+colIndex+'" name="goods['+colIndex+'].categoryPath" required/>';
            html += '</td>';
            html += '<td><label for="goodsName_'+colIndex+'" style="display: none;">产品名称</label><input type="text" class="xj-cp-name" id="goodsName_'+colIndex+'" name="goods['+colIndex+'].goodsName"  required data-max="30" data-min="2"></td>';
            html += '<td><label for="goodsNum_'+colIndex+'" style="display: none;">数量</label><input type="number" class="xj-number" id="goodsNum_'+colIndex+'" name="goods['+colIndex+'].goodsNum"  required max="1000000" min="1" value="1"  onkeyup="this.value=this.value.replace(/\D/g,\'\')"  onafterpaste="this.value=this.value.replace(/\D/g,\'\')"></td>';
            html += '<td><label for="goodsUnit_'+colIndex+'" style="display: none;">单位</label><input type="text" class="xj-dw" id="goodsUnit_'+colIndex+'" name="goods['+colIndex+'].goodsUnit" value="" required data-max="8" data-min="1" placeholder="件、吨"></td>';
            html += '<td><input type="text" class="xj-cp-ms" id="goodsDescribe_'+colIndex+'" readonly="readonly" value="" placeholder="填写规格说明，报价更精准"  onfocus="showDescByIndex(\''+colIndex+'\')" ></td>';
            html += '</tr>';
            html += '<tr class="xj-table-con" id="desc_good_col_'+colIndex+'" style="display: none;">';
            html += '<td>&nbsp;</td><td colspan="5">';
            html += '<div class="title_editor"><h3>产品描述</h3><a href="javascript:hideAndGetByIndex(\''+colIndex+'\')">隐藏</a></div>';
            html += '<div id="goodsDescribe_ta_'+colIndex+'_"  class="bj_editor" >';
            html += '<input type="hidden" id="goodsAccessory_'+colIndex+'" name="goods['+colIndex+'].goodsAccessory" >';
            html += '<script type="text/javascript">';
            html += 'var ue'+colIndex+' = UE.getEditor(\'goodsDescribe_ta_'+colIndex+'_\');';
            html += 'var introductionHtml'+colIndex+' = $(\'#goodsAccessory_'+colIndex+'\').val();';
            html += 'ue'+colIndex+'.addListener(\'ready\', function () {ue'+colIndex+'.setContent(introductionHtml'+colIndex+');});';
            html += 'ue'+colIndex+'.addListener(\'blur\', function () { setValByIndex(\''+colIndex+'\'); });';
            html += '<\/script></div></td>';
            html += '</tr>';

            $("#goodsTable").append( html );
            colIndex++;
            colCount++;

            hideOrShowRemoveBtn();
        });
    });

    function removeColumn(tr_id){
        $("#"+tr_id).remove();
        $("#desc_"+tr_id).remove();
        colCount--;
        hideOrShowRemoveBtn();
    }

    function hideOrShowRemoveBtn(){
        if( colCount == 1 ){
            $(".col_del").hide();
            $(".col_del_span").show();
        }else{
            $(".col_del").show();
            $(".col_del_span").hide();
        }
    }

    function showDescByIndex(i){
        $("#desc_good_col_" + i).show();
        setTimeout("UE.getEditor('goodsDescribe_ta_"+i +"_').focus()", 300);
    }

    function hideAndGetByIndex(i){
        $("#desc_good_col_" + i).hide();
        setValByIndex(i);
    }

    function setValByIndex(i){
        var ueI = UE.getEditor('goodsDescribe_ta_'+i+'_');
        var text = ueI.getContentTxt();

        if($.trim(text) != '' && text.length > 20 ){
            text = text.substr(1,20)+"...";
        }

        $("#goodsDescribe_" + i).val(text);
        $("#goodsAccessory_" + i).val(ueI.getContent());
    }

    function addToCertification(content){
        var certification = $("#certification").val();
        if( certification.indexOf(content) < 0 ){
            while(certification.indexOf("，") != -1) {
                certification = certification.replace("，", ",");
            }

            if($.trim(certification).length == 0){
                certification += content;
            }else {
                certification += ',   ' + content;
            }
        }
        $("#certification").val(certification);
    }


    /**
     * 删除
     * @param orderId 订单Id
     */
    function selectMerchants(merchantIds, merchantNames) {
        $("#orderpay").colorbox.close();

        $("#merchantIds").val(merchantIds);
        $("#merchantNames").val(merchantNames);
    }

    function selectMerchantsError(){
        $("#orderpay").colorbox.close();
    }


    function selectMerchantsHideOrShow(enquiryMode){
        if( enquiryMode == '1' ){
            $("#selectMerchantDiv").hide()
        }else{
            $("#selectMerchantDiv").show()
        }
    }

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

</script>


</body>
</html>