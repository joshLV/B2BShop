<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <link href="${base}/static/bec/project/images/favicon.ico" rel="shortcut icon" />

    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/css/colorbox.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/base/css/reset.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/base/css/function.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/gwq/css/header.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/gwq/css/inquiry_sheet.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/gwq/css/header.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/gwq/css/footer.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" type="text/css" href="${base}/static/bec/project/gwq/css/jydz.css">
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${base}/static/bec/base/js/jquery.cookies.js"></script>


    <script type="text/javascript">
        window.pageConfig={
            compatible:true,
            navId:"enquiry_detail"
        };
    </script>
</head>
<body>

<#include "bec/gwq/top3.ftl"/>

<div class="inquiry-main">
    <form action="${base}/enquiry/save" id="enquiryForm" >
        <h1 class="inquiry-title">询 价 单</h1>
        <div class="xj-box">
            <div class="xj-in-title"><h3><label for="title">标题</label></h3></div>
            <div class="xj-tit-inputs">
                <b>${enquiry.title}</b>
            </div>
        </div>
        <div class="xj-box">
            <div class="xj-in-title"><h3>询价产品</h3></div>
            <div class="xj-radio">
                <span><#if enquiry.isSpot != 2 >现货/标准品<#else>加工/定制品</#if></span>
            </div>
            <div class="xj-table">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr class="xj-table-tit">

                        <td width="300"><span>*</span>所属分类</td>
                        <td width="325"><span>*</span>产品名称</td>
                        <td width="105"><span>*</span>数量</td>
                        <td width="78"><span>*</span>单位</td>
                        <td width="150">产品描述</td>
                    </tr>
                    <tbody id="goodsTable">
                    <#if goods??>
                        <#list goods as good>
                        <tr class="xj-table-con2" id="good_col_${good_index}">
                            <td  width="5">
                                <span class="col_del_span">&nbsp;</span>
                            </td>
                            <td width="300">
                            ${good.categoryName}
                            </td>
                            <td width="325">${good.goodsName}</td>
                            <td width="105">${good.goodsNum}</td>
                            <td width="78">${good.goodsUnit}</td>
                            <td width="150"><a href="javascript:void(0)" onclick="$('#desc_good_col_${good_index}').show();"><#if good.goodsDescribe?? && good.goodsDescribe!=''>${good.goodsDescribe}<#else>查看描述</#if></a></td>
                        </tr>
                        <tr class="xj-table-con" id="desc_good_col_${good_index}" style="display: none;" >
                            <td><span>&nbsp;</span></td>
                            <td colspan="5">
                                <div class="title_editor"><h3>产品描述</h3>
                                    <a href="javascript:void(0)" onclick="$('#desc_good_col_${good_index}').hide()">隐藏</a>
                                </div>
                                <div id="goodsDescribe_ta_${good_index}_" class="bj_editor" >
                                ${good.goodsAccessory}
                                </div>
                            </td>
                        </tr>
                        </#list>
                    </#if>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="xj-box">
            <div class="xj-in-title"><h3>采购要求</h3></div>
            <div class="offer-content ">
                <div class="line">
                    <div class="line-title line-title-l"><em class="star">*</em><label for="offerEndDateTime">报价截止时间</label></div>
                    <div class="line-content gmt-expire-con go-mt">
                    ${enquiry.offerEndDateTime?string("yyyy-MM-dd HH:mm:ss")}
                    </div>
                </div>
                <div class="line">
                    <div class="line-title line-title-l">期望收货日期</div>
                    <div class="line-content gmt-receive-con go-mt">
                    ${enquiry.expectReceivDate?string("yyyy-MM-dd")}
                    </div>
                </div>
                <div class="line" style="display: none;">
                    <div class="line-title line-title-mt">报价要求</div>
                    <div class="line-content go-mt">
                    <#if enquiry.isContainTax != 1>需要报含税价<#else>不需要报含税价</#if>
                    </div>
                </div>
                <div class="line">
                    <div class="line-title line-title-l"><em class="star">*</em><label for="recAddress">收货地</label></div>
                    <div class="line-content">
                        <div class="go-input-pca-wrap go-mt">
                        ${enquiry.recAddress}
                        </div>
                    </div>
                </div>
                <div class="line">
                    <div class="line-title">对供应商要求</div>
                    <div class="line-content xj-suppliers">
                        <table >
                            <tr>
                                <td>交易方式：</td>
                                <td>
                                <#if enquiry.tradeExchange != 2>支付宝<#else>其他交易方式:${enquiry.otherTrade}</#if>
                                </td>
                            </tr>
                            <tr>
                                <td>发票要求：</td>
                                <td>
                                    <#if enquiry.invoiceRequire == 1>
                                            无需发票
                                        <#elseif enquiry.invoiceRequire == 2>
                                            普通发票
                                        <#elseif enquiry.invoiceRequire == 2>
                                            增值发票
                                    </#if>
                                </td>
                            </tr>
                            <tr>
                                <td>经营地址：</td>
                                <td>
                                ${enquiry.manageArea}
                                </td>
                            </tr>
                            <tr>
                                <td>注册资金：</td>
                                <td>
                                ${enquiry.registeredCapital}&nbsp;&nbsp;万元及以上
                                </td>
                            </tr>
                            <tr>
                                <td>证照要求：</td>
                                <td>
                                ${enquiry.certification}
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="line">
                    <div class="line-title go-mt-left">补充说明</div>
                    <div class="line-content" >
                        <div id="replenishExplain_" class="bj_bcsm" >
                        ${enquiry.replenishExplain}
                        </div>

                    </div>
                </div>
                <div class="xj-box">
                    <div class="xj-in-title"><h3>询价方式及隐私设置</h3></div>
                    <div class="offer-content xj-set">
                        <div class="line">
                            <div class="line-title line-title-mts">询价方式</div>
                            <div class="line-content go-mt">
                            <p>
                            <#if enquiry.enquiryMode != 2>
                                <label for="pub4open-checkbox-open">广泛征集供应商报价<span class="bing-less">(供应商可以通过搜索找到您的询价单)</span></label>
                            <#else>
                                <label for="pub4open-checkbox-close">邀请指定供应商报价</label>
                                <div class="choose_gys_textarea">${enquiry.merchantNames}</div>
                            </#if>
                                </p>
                            </div>
                        </div>
                        <div class="line radio-line">
                            <div class="line-title line-title-mts">联系方式</div>
                            <div class="line-content">
                            <#if enquiry.contactMode != 2>报价后可见<#else>公开</#if>
                            </div>
                        </div>
                        <div class="line">
                            <div class="line-title line-title-l">
                                <em class="star">*</em><label for="linkman">联系人</label>
                            </div>
                            <div class="line-content go-mt">
                            ${enquiry.linkman}
                            </div>
                        </div>
                        <div class="line">
                            <div class="line-title line-title-l">
                                <em class="star">*</em><label for="phone">电话</label>
                            </div>
                            <div class="line-content go-mt">
                            ${enquiry.phone}
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </form>

</div>
<#include "bec/gwq/b2b/spfl.ftl"/>
<#include "bec/gwq/service.ftl"/>
<#include "bec/gwq/foot.ftl"/>
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



</script>


</body>
</html>