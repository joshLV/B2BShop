<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><@spring.message "project_name"/>-<@spring.message "project_description"/></title>
    <meta name="description" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <meta name="Keywords" content="<@spring.message "project_short_name"/>,<@spring.message "project_name"/>,<@spring.message "project_description"/>">
    <link href="${base}/static/bec/project/imgages/favicon.ico" rel="shortcut icon" />

    <link href="${base}/static/mall/css/base.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/base/css/reset.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/base/css/function.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/gwq/css/header.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/gwq/css/price_details.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/gwq/css/header.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${base}/static/bec/project/gwq/css/footer.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="${base}/static/bec/project/gwq/js/laydate.js"></script>
    <script src="${base}/static/assets/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${base}/static/bec/base/js/jquery.cookies.js"></script>

    <script type="text/javascript">
        window.pageConfig={
            compatible:true,
            navId:"quotation_detail"
        };
    </script>
</head>
<body>
<#include "bec/gwq/top3.ftl"/>
<div class="price_details_main">
    <h1 class="price_details_title">报价单详情</h1>
    <div class="price_box">
        <div class="price_title"><h3>询价方</h3></div>
        <div class="price_xjf">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="550">${buyer.companyName}</td>
                    <td width="350">所在地区：${buyAddress}</td>
                    <td width="350" style="display:none">年营业额：</td>
                </tr>
                <tr>
                    <td>联系人：${buyer.linkMan}</td>
                    <td style="display:none">主营行业：</td>
                    <td style="display:none">采购等级</td>
                </tr>
                <tr>
                    <td>联系电话：${buyer.likeManMobile}</td>
                    <td style="display:none">注册资本：</td>
                    <td><a href="${base}/enquiry/detail/${enquiry.id}" class="price_order_button" target="_blank">查看询价单详情</a></td>
                </tr>
            </table>
        </div>
    </div>
    <div class="price_box">
        <div class="price_title"><h3>报价方</h3></div>
        <div class="price_xjf">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="550">${merchant.name}</td>
                    <td width="350">所在地区：${merchant.areaPath}${merchant.address}</td>
                    <td width="350" style="display:none">年营业额：</td>
                </tr>
                <tr>
                    <td>联系人：${merchant.head}</td>
                    <td style="display:none">主营行业：</td>
                    <td style="display:none">采购等级</td>
                </tr>
                <tr>
                    <td>联系电话：${merchant.mobile}</td>
                    <td style="display:none">注册资本：</td>
                    <td style="display:none">查看询价单详情</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="price_box">
        <div class="price_title_line"><h3>报价信息</h3></div>
        <div class="price_bjxx">
            <p>报价时间：${quotation.buyerDateTime?string("yyyy-MM-dd HH:mm:ss")}</p>
            <p>有效期至：${quotation.quotationPeriod?string("yyyy-MM-dd HH:mm:ss")}
                <span>(
                <#if daysType ="1">
                    已过期
                <#else >
                    还剩${days}天
                </#if>
                    )
                </span>
            </p>
            <p>报价状态：${qutationStatus}</p>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr height="45" bgcolor="#f0f8ff">
                    <td>报价产品</td>
                    <td>采购量(单位)</td>
                    <td>报价</td>
                    <td>含税</td>
                    <td>运费</td>
                    <td>小计(元)</td>
                </tr>
            <#list quotationDetailsList as quoDetList>
                <tr height="60">
                    <td>${quoDetList.goodsName}</td>
                    <td>${quoDetList.purchaseNum}${quoDetList.units}</td>
                    <td><span>￥${quoDetList.quotationPrice}</span>/${quoDetList.units}</td>
                    <td>${quoDetList.containTax}%</td>
                    <td><span>￥${quoDetList.freight?string("##0.00")}</span></td>
                    <td><span>￥${quoDetList.productCount?string("##0.00")}</span></td>
                </tr>
            </#list>
                <tr height="85" align="right">
                    <td colspan="6">产品总额：
                        <span>￥<font class="price_p">${quotation.totalCost?string("##0.00")}</font>
                        </span>
                        <em> (含运费：￥${quotation.freightTotalCost?string("##0.00")})</em>
                    <#if daysType !="1" && quotation.isDownOrder !="2">
                        <a href="${base}/member/quitationcheck?quotationId=${quotation.id}" class="price_order_button">立即订购</a>
                    <#else >
                        <a class="price_order_buttons">立即订购</a>
                    </#if>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="price_box">
        <div class="price_title_line"><h3>交易信息</h3></div>
        <div class="price_bjxx">
            <p>交易方式：
            <#if enquiry.tradeExchange =1>
                支付宝
            <#else >
            ${enquiry.otherTrade}
            </#if>
            </p>
            <p>备货周期：${quotation.productStock}天</p>
            <p>收货地：${address}</p>
            <p>税务发票：
            <#if quotation.invoiceType=1>
                不提供发票
            <#else >
                提供普通发票
            </#if>
            </p>
            <p>附件：${quotation.replenishExplain}</p>
            <p>资质：${quotation.accessory}</p>
        </div>
    </div>
</div>
<#include "mall/gwq/b2b/spfl.ftl"/>
<#include "bec/gwq/service.ftl"/>
<#include "bec/gwq/foot.ftl"/>
<script src="${base}/static/mall/js/base.js" type="text/javascript"></script>
<script>
    ;!function(){
        laydate({
            elem: '#demo'
        })
    }();
</script>
</body>
</html>